commit=true
origin=$(git remote get-url origin)
if [[ $origin == *status-base/statusbase* ]]
then
  commit=false
fi

FILESARRAY=()
KEYSARRAY=()
URLSARRAY=()

for entry in content/urls/*  
do
  FILESARRAY+=(${entry})
  LABELTOKEN=$( echo $entry | sed -e 's/content\/urls\/\(.*\).yaml/\1/')
  echo "Reading: ${entry}"
  read -r line<${entry} 
  IFS='"' read -ra URLTOKENS <<< "$line"
  echo "   ${LABELTOKEN} = ${URLTOKENS[1]}"
  KEYSARRAY+=(${LABELTOKEN})
  URLSARRAY+=(${URLTOKENS[1]})
done


echo "***********************" 
echo "Starting health checks with ${#KEYSARRAY[@]} configs:"

for (( index=0; index < ${#KEYSARRAY[@]}; index++))
do
  key="${KEYSARRAY[index]}"
  url="${URLSARRAY[index]}"
  echo "  $key=$url"

  for i in 1 2 3 4; 
  do
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $url)
    if [ "$response" -eq 200 ] || [ "$response" -eq 202 ] || [ "$response" -eq 301 ] || [ "$response" -eq 302 ] || [ "$response" -eq 307 ]; then
      result="success"
    else
      result="failed"
    fi
    echo "::set-output name=$key::$key=$result"  # echo output to workflows
  
    if [ "$result" = "success" ]; then
      break
    fi
    sleep 5
  done

  dateTime=$(date +'%Y-%m-%d %H:%M')
  
  if [[ $commit == true ]]
  then
    filename="./content/logs/${key}.csv"
    if [[  ! -e ${filename} ]]; then 
      echo "time, status" >> ${filename}
    fi

    echo "${dateTime}, ${result}" >> ${filename}
    # By default we keep 2000 last log entries.  Feel free to modify this to meet your needs.
    echo "$(tail -2000 ${filename})" > ${filename}
  else
    echo "    $dateTime, $result"
  fi
done

if [[ $commit == true ]]
then 
  git config --global user.name 'zernonia'
  git config --global user.email 'zernonia@gmail.com'
  git add -A --force content/logs/
  git commit -am '[Automated] Update Health Check Logs'
  git push
fi