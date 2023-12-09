#!/bin/bash
# @Autor  Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
# @Fecha 06/12/2023
# @Descripcion: Creación del archivo de passwords

echo "CREANDO ARCHIVO DE PASSWORDS"

echo "CONFIGURANDO ORACLE_SID"
export ORACLE_SID=rasaproy

if [ -f "${ORACLE_HOME}/dbs/orapw${ORACLE_SID}" ]; then
  read -p "El archivo existe, [enter] para sobrescribir, Ctrl-C para cancelar"
fi;

orapwd FORCE=Y \
  FILE='${ORACLE_HOME}/dbs/orapw${ORACLE_SID}' \
  FORMAT=12.2 \
  SYS=password

echo "COMPROBANDO LA CREACION DEL ARCHIVO"
ls -l ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}

echo "cambiando dueño y grupo al archivo"
sudo chown oracle:oinstall ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}