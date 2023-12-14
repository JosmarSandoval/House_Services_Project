-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 13/12/2023
-- @Descripcion: Script que carga los datos iniciales en módulo 2

whenever sqlerror exit rollback;
Prompt conectando como proveedor_usr
connect cliente_usr/cliente123
alter session set nls_date_format = 'dd/mm/yyyy';

--@s-16-carga-inicial-cliente.sql
--@s-16-carga-inicial-empresa.sql
--@s-16-carga-inicial-particular.sql
@s-16-carga-inicial-tarjeta-cliente.sql
--@s-16-carga-inicial-estatus-servicio.sql
--@s-16-carga-inicial-servicio.sql
--@s-16-carga-inicial-historico-estatus-servicio.sql
--@s-16-carga-inicial-califica-servicio.sql
--@s-16-carga-inicial-evidencia.sql
--@s-16-carga-inicial-imagen-evidencia.sql
--@s-16-carga-inicial-pago-servicio.sql