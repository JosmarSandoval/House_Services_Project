-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 13/12/2023
-- @Descripcion: Carga de tabla estatus_servicio


insert into estatus_servicio values(1,'Registrado','La solicitud se ha realizado, queda esperar la respuesta del proveedor');
insert into estatus_servicio values(2,'Aceptado por el proveedor','El proveedor ha aceptado el trabajo');
insert into estatus_servicio values(3,'En ejecucion','El proveedor está realizando el trabajo');
insert into estatus_servicio values(4,'Por pagar','El proveedor concluyó el trabajo, debe pagar el servicio');
insert into estatus_servicio values(5,'Pagado','Ha pagado por completo el servicio');
