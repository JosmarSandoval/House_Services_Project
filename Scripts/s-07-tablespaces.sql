-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 08/12/2023
-- @Descripcion: Creación de tablespaces para los módulos correspondientes

whenever sqlerror exit rollback

connect sys/systemhouse as sysdba

Prompt creando tablespaces del modulo Proveedor 

create tablespace proveedor_ts
  datafile '/unam-bda/proyecto/d01/RASAPROY/proovedor01.dbf' size 30m reuse,
    '/unam-bda/proyecto/d01/RASAPROY/proovedor02.dbf' size 30m reuse
    autoextend on 
    maxsize unlimited
    extent management local autoallocate;

create bigfile tablespace imagenes_proveedor_lob_ts
  datafile '/unam-bda/proyecto/d01/RASAPROY/img_prov_lob01.dbf' size 100m reuse
    autoextend on next 10m  
    maxsize unlimited
    extent management local autoallocate;

create bigfile tablespace documentos_proveedor_lob_ts
  datafile '/unam-bda/proyecto/d01/RASAPROY/docs_prov_lob01.dbf' size 100m reuse
    autoextend on next 10m  
    maxsize unlimited
    extent management local autoallocate;


Prompt creando tablespaces del modulo Cliente_Servicio

create tablespace cliente_servicio_ts
  datafile '/unam-bda/proyecto/d02/RASAPROY/cliente_servicio01.dbf' size 30m reuse,
    '/unam-bda/proyecto/d02/RASAPROY/cliente_servicio02.dbf' size 30m reuse
    autoextend on 
    maxsize unlimited
    extent management local autoallocate;

create bigfile tablespace images_client_service_lob_ts
  datafile '/unam-bda/proyecto/d01/RASAPROY/img_cliente_servicio_lob01.dbf' size 100m reuse
    autoextend on next 10m  
    maxsize unlimited
    extent management local autoallocate;

create bigfile tablespace docs_client_service_lob_ts
  datafile '/unam-bda/proyecto/d01/RASAPROY/docs_cliente_servicio_lob01.dbf' size 100m reuse
    autoextend on next 10m  
    maxsize unlimited
    extent management local autoallocate;


Prompt creando tablespaces que comparten ambos módulos

create tablespace indices_ts
  datafile '/unam-bda/proyecto/d00/RASAPROY/indices01.dbf' size 20m reuse
    autoextend on 
    maxsize unlimited
    extent management local autoallocate;

"""
drop tablespace proveedor_ts
drop tablespace imagenes_proveedor_lob_ts
drop tablespace documentos_proveedor_lob_ts
drop tablespace cliente_servicio_ts

"""