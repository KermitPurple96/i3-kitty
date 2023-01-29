#!/bin/bash
#ADD as ~/.config/bin/access_point.sh

AP=$(/usr/sbin/route | grep default | awk '{print $2}')
if [[ "$AP" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  echo "$(/usr/sbin/route | grep default | awk '{print $2}')"
else
  echo "Disconnected"
fi
