-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 12/12/2023
-- @Descripcion: Script que carga los datos posterior en módulo 1

whenever sqlerror exit rollback;
Prompt conectando como proveedor_usr
connect proveedor_usr/proveedor123

alter session set nls_date_format = 'dd/mm/yyyy';

Prompt Haciendo la carga posterior del modulo 1
--@s-18-carga-posterior-proveedor.sql 
--@s-18-carga-posterior-proveedor-email.sql
--@s-18-carga-posterior-cuenta-bancaria.sql
--@s-18-carga-posterior-deposito.sql 
--@s-18-carga-posterior-proveedor-servicio.sql 
--@s-18-carga-posterior-comprobante-experiencia.sql
@s-18-carga-posterior-historico-estatus-proveedor.sql 

--commit;