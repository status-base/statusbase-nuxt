#!/bin/bash

echo "VERCEL_GIT_COMMIT_MESSAGE: $VERCEL_GIT_COMMIT_MESSAGE"

if [[ "$VERCEL_GIT_COMMIT_MESSAGE" == "[Automated] Update Health Check Logs" ]] ; then
  # Don't build
  echo "🛑 - Build cancelled"
  exit 0;

else
  # Proceed with the build
	echo "✅ - Build can proceed"
  exit 1;
fi




# ref: https://vercel.com/support/articles/how-do-i-use-the-ignored-build-step-field-on-vercel
# this ignore build step is not enabled yet 