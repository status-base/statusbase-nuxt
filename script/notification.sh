echo "HEALTH_STATUS: $HEALTH_STATUS"
echo "GITHUB_TOKEN: $GITHUB_TOKEN"
 
if [[ $HEALTH_STATUS == *"failed"* ]]; then
  curl \
    -X POST \
    -H "authorization: Bearer $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/zernonia/statusbase/issues \
    -d '{"title":"Website is down","body":"'$HEALTH_STATUS'","labels":["failed"]}'
fi

