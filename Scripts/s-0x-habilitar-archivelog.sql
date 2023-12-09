-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 06/12/2023
-- @Descripcion: Se habilita el modo de archivado 

connect sys/systemhouse as sysdba 

Prompt creando pfile a partir de spfile
create pfile form spfile

Prompt configurando parametros para habilitar el modo archive
alter system set log_archive_dest_1='/unam-bda/proyecto/d06/archivelogs/RASAPROY MANDATORY' scope=spfile;
alter system set log_archive_dest_2='LOCATION=USE_DB_RECOVERY_FILE_DEST MANDATORY'scope=spfile;
alter system set log_archive_dest_3='/unam-bda/proyecto/d07/archivelogs/RASAPROY' scope=spfile;
alter system set log_archive_format='arch_rasaproy_%t_%s_%r.arc' scope=spfile;
alter system set log_archive_min_succeed_dest=2 scope=spfile;

Prompt reiniciando base y activando el modo archive
shutdown immediate
startup mount 
alter database archivelog;

Prompt Abriendo base y verificando si se habilitó el modo archive
alter database open;
archive log list


Prompt respaldando de nuevo el spfile
create pfile from spfile;