-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 12/12/2023
-- @Descripcion: Script que carga los datos posterior en módulo 1

whenever sqlerror exit rollback;
Prompt conectando como proveedor_usr
connect proveedor_usr/proveedor123

Prompt Haciendo la carga posterior del modulo 1
@s-xx-carga-catalogos-modulo1.sql
@s-xx-carga-posterior-proveedor.sql 
@s-xx-carga-posterior-proveedor-email.sql
@s-xx-carga-posterior-cuenta-bancaria.sql
@s-xx-carga-posterior-deposito.sql 
@s-xx-carga-posterior-proveedor-servicio.sql 
@s-xx-carga-posterior-comprobante-experiencia.sql
@s-xx-carga-posterior-historico-estatus-proveedor.sql 