-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 07/12/2023
-- @Descripcion: Se configuran cosas extras de la base como:
--              Periodo de retención de datos undo
--              flashbacks
--              4to grupo de redo

Prompt configurando rutas de controlfiles
alter system set control_files='/unam-bda/proyecto/d03/app/oracle/oradata/RASAPROY/control01.ctl',
  '/unam-bda/proyecto/d04/app/oracle/oradata/RASAPROY/control02.ctl',
  '/unam-bda/proyecto/d08/fast_reco_area/RASAPROY/RASAPROY/controlfile/ol_mf_lq7ftcxl_.ctl'
  scope = spfile;

Prompt habilitando periodo de retencion de datos undo
alter system set undo_retention = 43200;

Prompt Habilitando flashbacks para 1 dia

alter system set db_flashback_retention_target = 1440 scope = both;

Prompt agregando 4to grupo redo a fra 

alter database 
  add logfile
  group 4
  size 100m blocksize 512;


