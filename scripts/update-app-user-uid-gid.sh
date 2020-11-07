#!/bin/sh

# Updates app user to have specified UID/GID
# Parameters:
#   APP_USERNAME
#   APP_GROUPNAME
#   APP_GID
#   APP_UID

# Debug output
set -x

# Exit on error
set -e

if [ -n "$APP_GID" ] && [ "$APP_GID" != "$(id $APP_GROUPNAME -g)" ]; then
  set +e
  # delete all users using requested GID
  cut -d: -f1,4 /etc/passwd | grep -w $APP_GID |
  while read name_gid
  do
    name=$(echo $name_gid | cut -d: -f1)
    deluser $name
  done
  # delete group with requested GID
  delgroup $(getent group $APP_GID | cut -d: -f1)
  set -e
  # update GID
  groupmod --gid $APP_GID $APP_GROUPNAME
  usermod --gid $APP_GID $APP_USERNAME
fi

if [ -n "$APP_UID" ] && [ "$APP_UID" != "$(id $APP_USERNAME -u)" ]; then
  set +e
  # delete all users using requested UID
  cut -d: -f1,3 /etc/passwd | grep -w $APP_UID |
  while read name_uid
  do
    name=$(echo $name_uid | cut -d: -f1)
    deluser $name
  done
  set -e
  #
  usermod --uid $APP_UID $APP_USERNAME
fi
