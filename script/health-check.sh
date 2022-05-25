commit=true
# origin=$(git remote get-url origin)
# if [[ $origin == *statsig-io/statuspage* ]]
# then
#   commit=false
# fi

KEYSARRAY=()
URLSARRAY=()

urlsConfig="./script/urls.cfg"
echo "Reading $urlsConfig"
while read -r line
do
  echo "  $line"
  IFS='=' read -ra TOKENS <<< "$line"
  KEYSARRAY+=(${TOKENS[0]})
  URLSARRAY+=(${TOKENS[1]})
done < "$urlsConfig"

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
    if [ "$result" = "success" ]; then
      break
    fi
    sleep 5
  done

  dateTime=$(date +'%Y-%m-%d %H:%M')
  
  if [[ $commit == true ]]
  then
    filename="./content/log/${key}.csv"
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
  git add -A --force content/log/
  git commit -am '[Automated] Update Health Check Logs'
  git push
fi