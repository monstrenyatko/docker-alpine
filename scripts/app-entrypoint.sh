#!/bin/bash

# Drops root privileges when a user-name is specified
# Parameters:
#   APP_USERNAME
#   [OPTIONAL] APP_GROUPNAME

# Debug output
set -x

# Exit on error
set -e

if [ "$(id -u)" = '0' -a -n "$APP_USERNAME" -a "$APP_USERNAME" != 'root' ]; then
  if [ -n "$APP_GROUPNAME" ]; then
    exec su-exec "$APP_USERNAME:$APP_GROUPNAME" "$BASH_SOURCE" "$@"
  else
    exec su-exec "$APP_USERNAME" "$BASH_SOURCE" "$@"
  fi
fi

exec "$@"
