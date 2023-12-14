-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 13/12/2023
-- @Descripcion: Script que carga los datos posterior en módulo 2

whenever sqlerror exit rollback;
Prompt conectando como proveedor_usr
connect cliente_usr/cliente123
alter session set nls_date_format = 'dd/mm/yyyy';

@s-19-carga-posterior-cliente.sql
--@s-19-carga-posterior-empresa.sql
--@s-19-carga-posterior-particular.sql
--@s-19-carga-posterior-tarjeta-cliente.sql
--@s-19-carga-posterior-servicio.sql
--@s-19-carga-posterior-historico-estatus-servicio.sql
--@s-19-carga-posterior-califica-servicio.sql
--@s-19-carga-posterior-evidencia.sql
--@s-19-carga-posterior-imagen-evidencia.sql
--@s-19-carga-posterior-pago-servicio.sql

--commit