-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 12/12/2023
-- @Descripcion: Script que carga los datos iniciales en módulo 1

whenever sqlerror exit rollback;
Prompt conectando como proveedor_usr
connect proveedor_usr/proveedor123

Prompt Haciendo la carga inicial del modulo 1
--@s-15-carga-catalogos-modulo1.sql
@s-15-carga-inicial-proveedor.sql 
--@s-15-carga-inicial-proveedor-email.sql
--@s-15-carga-inicial-cuenta-bancaria.sql
--@s-15-carga-inicial-deposito.sql 
--@s-15-carga-inicial-proveedor-servicio.sql 
--@s-15-carga-inicial-comprobante-experiencia.sql
--@s-15-carga-inicial-historico-estatus-proveedor.sql 

