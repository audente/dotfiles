#!/usr/bin/env bash

if [[ "$NOM" == "" ]];  then
  echo "Registra la nómina en la variable NOM"
  exit 1
fi

echo "Buscando nómina: '$NOM'"
echo "======"

sqlcmd -S $(pass petal/form/srvr) -U $(pass petal/form/user) -P $(pass petal/form/pass) -d $(pass petal/form/db) -Q "select DPK_PAYROLL_ID, DVC_PAYROLL_NAME, DVC_STATUS, DVC_AUTHOR from GLO_PETAL.DPE_PAYROLL dp where DVC_PAYROLL_NAME = '$(echo $NOM)';"

echo "======"
echo "Guarda id en NOM_ID"
