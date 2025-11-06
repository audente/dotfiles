#!/usr/bin/env bash

if [[ "$NOM_ID" == "" ]];  then
  echo "Registra el ID de la nómina en la variable NOM_ID"
  exit 1
fi

echo "Aprobando nómina: '$NOM_ID'"
echo "======"

sqlcmd -S $(pass petal/form/srvr) -U $(pass petal/form/user) -P $(pass petal/form/pass) -d $(pass petal/form/db) -Q "update GLO_PETAL.DPE_PAYROLL set DVC_STATUS = 'Ready' WHERE DPK_PAYROLL_ID=$(echo $NOM_ID);"

echo "======"
echo "Actualizado"
echo "======"
./get_nominas.sh
