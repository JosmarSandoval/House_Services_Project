-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 06/12/2023
-- @Descripcion: Creación de un SPFILE

connect sys/Hola1234* as sysdba

Prompt Creacion del SPFILE
create spfile from pfile;

Prompt Comprobacion del SPFILE
!ls ${ORACLE_HOME}/dbs/spfileRASAPROY.ora