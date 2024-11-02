#!/bin/bash

INTERFACE=$(cat /usr/share/i3blocks/iface)
# Filtra las líneas correspondientes a la interfaz, excluye 0.0.0.0 si hay otra opción
AP=$( /usr/sbin/route | grep "$INTERFACE" | awk '{print $2}' | grep -v "^0\.0\.0\.0" | head -n 1 )

# Si AP está vacío, selecciona 0.0.0.0 como última opción
if [[ -z "$AP" ]]; then
  AP=$( /usr/sbin/route | grep "$INTERFACE" | awk '{print $2}' | grep "^0\.0\.0\.0" | head -n 1 )
fi

# Verifica si AP tiene una IP válida
if [[ "$AP" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  echo "$AP"
else
  echo "Disconnected"
fi
