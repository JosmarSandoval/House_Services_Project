#!/bin/bash
# @Autor  Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
# @Fecha 06/12/2023
# @Descripcion: Este script contiene la configuración de los lugares
#              de almacenamiento para los archivos de la base

#Creando la el directorio donde se almacenaran los archivos

if [-d "/unam-bda/proyecto"]; then 
  echo "El directorio del proyecto ya existe"
else 
  cd /unam-bda
  mkdir proyecto
  chown root:root proyecto
  chmod 755 proyecto
fi;


export ORACLE_SID=rascproy

echo "Validando existencia de directorio para data files"

if [ -d "/unam-bda/proyecto/d01/${ORACLE_SID^^}" ]; then
  echo "Directorio de data files ya existe"
else 
  echo "Creando directorio para data files"
  cd  /unam-bda/proyecto
  mkdir -p d01/${ORACLE_SID^^}
  cd d01
  chown oracle:oinstall ${ORACLE_SID^^}
  chmod 750 ${ORACLE_SID^^}
fi;

if [ -d "/unam-bda/proyecto/d02/${ORACLE_SID^^}" ]; then
  echo "Directorio de data files ya existe"
else 
  echo "Creando directorio para data files"
  cd  /unam-bda/proyecto
  mkdir -p d02/${ORACLE_SID^^}
  cd d02
  chown oracle:oinstall ${ORACLE_SID^^}
  chmod 750 ${ORACLE_SID^^}
fi;


echo "creando carpeta para Redo Logs y control files"

if [ -d "/unam-bda/proyecto/d03/app/oracle/oradata/${ORACLE_SID^^}" ]; then
  echo "El directorio de control files y redo logs ya existe"
else
  cd /unam-bda/proyecto
  mkdir d03
  chown root:root d03
  chmod 755 d03
  cd /unam-bda/proyecto/d03
  mkdir -p app/oracle/oradata/${ORACLE_SID^^}
  chown -R oracle:oinstall app
  chmod -R 750 app
fi;

if [ -d "/unam-bda/proyecto/d04/app/oracle/oradata/${ORACLE_SID^^}" ]; then
  echo "El directorio de control files y redo logs ya existe"
else
  cd /unam-bda/proyecto
  mkdir d04
  chown root:root d04
  chmod 755 d04
  cd /unam-bda/proyecto/d04
  mkdir -p app/oracle/oradata/${ORACLE_SID^^}
  chown -R oracle:oinstall app
  chmod -R 750 app
fi;


if [ -d "/unam-bda/proyecto/d05/app/oracle/oradata/${ORACLE_SID^^}" ]; then
  echo "El directorio de control files y redo logs ya existe"
else
  cd /unam-bda/proyecto
  mkdir d05
  chown root:root d05
  chmod 755 d05
  cd /unam-bda/proyecto/d05
  mkdir -p app/oracle/oradata/${ORACLE_SID^^}
  chown -R oracle:oinstall app
  chmod -R 750 app
fi;

echo creando directorios para archivelogs 

if [ -d "/unam-bda/proyecto/d06" ]; then
  echo "El directorio de archivelogs ya existe"
else
  cd /unam-bda/proyecto
  mkdir d06
  chown root:root d06
  chmod 755 d06
  cd /unam-bda/proyecto/d06
  mkdir -p archivelogs/${ORACLE_SID^^}
  chown -R oracle:oinstall archivelogs
  chmod -R 750 archivelogs
fi;

if [ -d "/unam-bda/proyecto/d07" ]; then
  echo "El directorio de archivelogs ya existe"
else
  cd /unam-bda/proyecto
  mkdir d07
  chown root:root d07
  chmod 755 d07
  cd /unam-bda/proyecto/d07
  mkdir -p archivelogs/${ORACLE_SID^^}
  chown -R oracle:oinstall archivelogs
  chmod -R 750 archivelogs
fi;

echo  "creando directorio para la FRA"

if [-d "/unam-bda/proyecto/d08" ]; then
  echo "El directorio de la FRA ya existe"
else
  cd /unam-bda/proyecto
  mkdir d08
  chown root:root d08
  chmod 755 d08
  cd /unam-bda/proyecto/d08
  mkdir -p fast_reco_area/${ORACLE_SID^^}
  chown -R oracle:oinstall fast_reco_area
  chmod -R 750 fast_reco_area
fi;

echo "comprobando directorios"
echo "Mostrando directorios de data files"
ls -l /unam-bda/proyecto/d0*/${ORACLE_SID^^}

echo "mostrando directorios para control files y redo logs"
ls -l /unam-bda/proyecto/d0*/app/oracle/oradata

echo "mostrando directorios para archivelogs"
ls -l /unam-bda/proyecto/d0*/archivelogs

echo "mostrando directorio para la FRA"
ls -l /unam-bda/proyecto/d0*/fast_reco_area