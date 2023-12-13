-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 13/12/2023
-- @Descripcion: Script que carga los datos posterior en módulo 2

whenever sqlerror exit rollback;
Prompt conectando como proveedor_usr
connect cliente_usr/cliente123
alter session set nls_date_format = 'dd/mm/yyyy';

@s-xx-carga-posterior-cliente.sql
@s-xx-carga-posterior-empresa.sql
@s-xx-carga-posterior-particular.sql
@s-xx-carga-posterior-tarjeta-cliente.sql
@s-xx-carga-posterior-servicio.sql
@s-xx-carga-posterior-historico-estatus-servicio.sql
@s-xx-carga-posterior-califica-servicio.sql
@s-xx-carga-posterior-evidencia.sql
@s-xx-carga-posterior-imagen-evidencia.sql
@s-xx-carga-posterior-pago-servicio.sql