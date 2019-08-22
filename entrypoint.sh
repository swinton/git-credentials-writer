#!/bin/sh

# Configure credential.helper globally to use "store" mode
# Credentials are saved to a plain-text file on disk, and they never expire
git config --global credential.helper store

# Default protocol to https
[ -n "$CREDENTIAL_URL_PROTOCOL" ] || CREDENTIAL_URL_PROTOCOL=https

# Write credentials to ~/.git-credentials
echo "protocol=$CREDENTIAL_URL_PROTOCOL
host=$CREDENTIAL_URL_HOST
path=$CREDENTIAL_URL_PATH
username=$CREDENTIAL_URL_USERNAME
password=$CREDENTIAL_URL_PASSWORD
" | git credential-store store

if [ -n "$CREDENTIAL_REMOTE_NAME" ]; then
  # Add the remote, removing the username and password
  git remote add "$CREDENTIAL_REMOTE_NAME" "${CREDENTIAL_URL_PROTOCOL}://${CREDENTIAL_URL_HOST}/${CREDENTIAL_URL_PATH}"
fi
