-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 06/12/2023
-- @Descripcion: Creación de usuarios

whenever sqlerror exit rollback;

Prompt conectando como usuario SYS
connect sys/systemhouse as sysdba

--drop user proveedor_usr cascade;

Prompt Creando usuario para el modulo Proveedor
create user proveedor_usr identified by proveedor123
  default tablespace proveedor_ts
  quota unlimited on proveedor_ts
  quota unlimited on imagenes_proveedor_lob_ts
  quota unlimited on documentos_proveedor_lob_ts
  quota unlimited on indices_ts;

grant create session, create table, create any index to proveedor_usr;

--drop user cliente_usr cascade;
Prompt Creando usuario para el modulo Cliente-Servicio 
create user cliente_usr identified by cliente123
  default tablespace cliente_servicio_ts
  quota unlimited on cliente_servicio_ts
  quota unlimited on images_client_service_lob_ts
  quota unlimited on docs_client_service_lob_ts
  quota unlimited on indices_ts;

grant create session, create table, create any index to cliente_usr;

--drop user backup_usr cascade;
Prompt Creando el usuario para backups
create user backup_usr identified by backup123
  quota unlimited on users;

grant sysbackup to backup_usr;