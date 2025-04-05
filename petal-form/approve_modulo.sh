#!/usr/bin/env bash

if [[ "$MOD_ID" == "" ]];  then
  echo "Exporta el ID del módulo en la variable MOD_ID"
  exit 1
fi

if [[ "$MOD_VER" == "" ]];  then
  echo "Exporta la versión del módulo en la variable MOD_VER"
  exit 1
fi

echo "Aprobando nómina: '$MOD_ID'"

sqlcmd -S $(pass petal/form/srvr) -U $(pass petal/form/user) -P $(pass petal/form/pass) -d $(pass petal/form/db) -Q "UPDATE GLO_PETAL.CPE_MODULE SET CVC_VERSION = '$(echo $MOD_VER)' WHERE CPK_MODULE_ID=$(echo $MOD_ID);"
