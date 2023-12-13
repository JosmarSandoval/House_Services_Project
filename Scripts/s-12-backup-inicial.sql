-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 12/12/2023
-- @Descripcion: Realizar el backup inicial de la base antes de ingresar datos

--para ingresar a RMAN y configurar
/*
rman
RMAN> connect target "backup_usr@rasaproy_dedicated as sysbackup"
configure controlfile autobackup format for device type disk clear;
configure channel device type disk maxpiecesize 2G;
configure retention policy to recovery window of 7 days;
list backup
*/

--Primer backup (backupset )
backup as backupset incremental level 0 database tag house_services_backup_initial;


--Para consultar
--select start_time, backup_type, controlfile_included, pieces from v$backup_set;