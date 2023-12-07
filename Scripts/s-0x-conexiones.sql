-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 06/12/2023
-- @Descripcion: Configurando las conexiones de la base

whenever sqlerror exit rollback;
set serveroutput on 

Prompt Conectando como SYS
connect sys/systemhouse as sysdba

Prompt Habilitando modo compartido
--Dispatchers
alter system set dispatchers='(dispatchers=6)(protocol=tcp)' scope = both;

--Servers
alter system set shared_servers=40 scope=both;

Prompt Mostrando configuraciones realizadas
show parameter dispatchers
show parameter shared_servers

Prompt actualizando configuración de listener
!lsnrctl stop 
alter system register;
!lsnrctl start

Prompt mostrando servicios que ofrece el listener
!lsnrctl services