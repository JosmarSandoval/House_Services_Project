-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 13/12/2023
-- @Descripcion: Realizar el backup incremental despues de insertar datos 




backup as backupset incremental level 1 database plus archivelog tag house_services_backup_incremental;

