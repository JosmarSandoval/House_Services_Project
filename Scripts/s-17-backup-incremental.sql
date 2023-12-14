-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 13/12/2023
-- @Descripcion: Realizar el backup incremental despues de insertar datos 


connect target "backup_usr@rasaproy_dedicated as sysdbackup"


--Backup después de la carga inicial
backup as backupset incremental level 1 database plus archivelog tag hs_backup_carga_inicial;

--Backup después de volver a cargar datos al módulo proveedor
backup as backupset incremental level 1 database plus archivelog tag hs_backup_carga_posterior1;

--Backupp después de volver a cargar datos al módulo cliente_servicio
backup as backupset incremental level 1 database plus archivelog tag hs_backup_carga_posterior2;


