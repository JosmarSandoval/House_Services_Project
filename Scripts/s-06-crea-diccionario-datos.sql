-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 06/12/2023
-- @Descripcion: Creación del diccionario de datos

set serveroutput on 

prompt Iniciando sesión como SYS 
connect sys/systemhouse as sysdba 

prompt Ejecución delos primeros 3 scripts
@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

prompt Conectando como SYSTEM
connect system/systemhouse

prompt Ejecución de último script 
@?/sqlplus/admin/pupbld.sql