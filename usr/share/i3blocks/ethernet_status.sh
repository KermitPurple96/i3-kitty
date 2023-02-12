#!/bin/bash
#ADD as ~/.config/bin/ethernet_status.sh

IP=$(/usr/sbin/ifconfig | grep ens33 -A1 | grep inet | awk '{print $2}')
if [[ "$IP" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  echo "$(/usr/sbin/ifconfig | grep ens33 -A1 | grep inet | awk '{print $2}')"
else 
  echo "Disconnected"
fi
