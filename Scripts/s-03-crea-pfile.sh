#!/bin/bash
# @Autor  Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
# @Fecha 06/12/2023
# @Descripcion: Creación del pfile

echo "Creando un pfile"
export ORACLE_SID=rasaproy

pfile="${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"

if [ -f "${pfile}" ]; then
  read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi;

echo \
"
db_name='${ORACLE_SID}'
db_domain='fi.unam'
memory_target=1024M
contro_files=()
db_recovery_file_dest_size=5000M
db_recovery_file_dest=/unam-bda/proyecto/d08/fast_reco_area/${ORACLE_SID^^}
" > ${pfile} 

echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}

"""
control_files=(
  /unam-bda/proyecto/d03/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
  /unam-bda/proyecto/d04/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,
)
"""