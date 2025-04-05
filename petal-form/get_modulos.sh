#!/usr/bin/env bash

if [[ "$MOD" == "" ]];  then
  echo "Exporta el módulo en la variable MOD"
  exit 1
fi

echo "Buscando módulo: '$MOD'"
echo "Guarda id en MOD_ID"
echo "Guarda ver en MOD_VER"

sqlcmd -S $(pass petal/form/srvr) -U $(pass petal/form/user) -P $(pass petal/form/pass) -d $(pass petal/form/db) -Q "SELECT CPK_MODULE_ID, CVC_MODULE_NAME, CVC_VERSION, CDT_DATE_CREATED, CVC_AUTHOR  FROM GLO_PETAL.CPE_MODULE WHERE CVC_MODULE_NAME = '$(echo $MOD)';"
