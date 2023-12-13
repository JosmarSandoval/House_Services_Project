-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 12/12/2023
-- @Descripcion: Carga de datos a los catálogos del módulo 1

whenever sqlerror exit rollback;

Prompt conectando como usuario proveedor_usr
connect proveedor_usr/proveedor123

Prompt insertando en tabla estatus_proveedor
INSERT INTO estatus_proveedor VALUES (1,'En validacion','Se esta revisando la solicitud del proveedor');
INSERT INTO estatus_proveedor VALUES (2,'En servicio','El proveedor se encuentra activo');
INSERT INTO estatus_proveedor VALUES (3,'Suspendido','El proveedor se encuentra suspendido de sus actividades');
INSERT INTO estatus_proveedor VALUES (4,'Expulsado','El proveedor ya no forma parte del catalogo');
INSERT INTO estatus_proveedor VALUES (5,'Inactivo','El proveedor se encuentra inactivo');

Prompt insertando en tabla nivel_estudios
INSERT INTO nivel_estudios VALUES(1,'Preescolar','Concluyo sus estudios hasta el preescolar');
INSERT INTO nivel_estudios VALUES(2,'Primaria','Concluyo sus estudios hasta la primaria');
INSERT INTO nivel_estudios VALUES(3,'Secundaria','Concluyo sus estudios hasta la secundaria');
INSERT INTO nivel_estudios VALUES(4,'Bachillerato','Concluyo los estudios hasta el bachillerato');
INSERT INTO nivel_estudios VALUES(5,'Licenciatura','Concluyo sus estudios hasta la licenciatura');
INSERT INTO nivel_estudios VALUES(6,'Maestria','Concluyo sus estudios hasta la maestria');
INSERT INTO nivel_estudios VALUES(7,'Doctorado','Concluyo sus estudios hasta el doctorado');

Prompt insertando en tabla tipo_servicio
INSERT INTO tipo_servicio VALUES(1,'Albañil','Realiza servicios de albañileria');
INSERT INTO tipo_servicio VALUES(2,'Jardinero','Realiza servicios para el jardin');
INSERT INTO tipo_servicio VALUES(3,'Carpintero','Realiza servicios de carpinteria');
INSERT INTO tipo_servicio VALUES(4,'Fontanero','Realiza instalacion y mantenimiento de conexiones de agua y gas');
INSERT INTO tipo_servicio VALUES(5,'Pintor','Realiza servicio de pintura en hogares');
INSERT INTO tipo_servicio VALUES(6,'Cerrajero','Realiza servicio de instalacion y mantenimiento de cerraduras en viviendas');
INSERT INTO tipo_servicio VALUES(7,'Electricista','Realiza servicio de instalacion y mantenimiento en redes electricas');
INSERT INTO tipo_servicio VALUES(8,'Conserje','Realiza servicio de limpieza general');
INSERT INTO tipo_servicio VALUES(9,'Especialista de aire a condicionado','Realiza servicio de instalacion y mantenimiento de aires acondicionados');
INSERT INTO tipo_servicio VALUES(10,'Soldador','Realiza servicio de soldadura');
INSERT INTO tipo_servicio VALUES(11,'Herrero','Realiza objetos con metales');
INSERT INTO tipo_servicio VALUES(12,'Arquitecto','Realiza diseños para construcciones');
INSERT INTO tipo_servicio VALUES(13,'Ingeniero civil','Realiza trabajos de infraestructuras de hogares');
INSERT INTO tipo_servicio VALUES(14,'Especialista en Telecomunicaciones','Realiza servicio de instalacion y mantenimiento a las redes de telecomunicaciones');
INSERT INTO tipo_servicio VALUES(15,'Diseñador de interiores','Realiza diseño de interiores en casas');
INSERT INTO tipo_servicio VALUES(16,'Diseñador de exteriores','Realiza diseño de exteriores en casas');

Prompt insertando en tabla entidad_nacimiento
INSERT INTO entidad_nacimiento VALUES(1,'Aguascalientes');
INSERT INTO entidad_nacimiento VALUES(2,'Baja California');
INSERT INTO entidad_nacimiento VALUES(3,'Baja California Sur');
INSERT INTO entidad_nacimiento VALUES(4,'Campeche');
INSERT INTO entidad_nacimiento VALUES(5,'Chiapas');
INSERT INTO entidad_nacimiento VALUES(6,'Chihuahua');
INSERT INTO entidad_nacimiento VALUES(7,'Ciudad de Mexico');
INSERT INTO entidad_nacimiento VALUES(8,'Coahuila');
INSERT INTO entidad_nacimiento VALUES(9,'Colima');
INSERT INTO entidad_nacimiento VALUES(10,'Durango');
INSERT INTO entidad_nacimiento VALUES(11,'Estado de Mexico');
INSERT INTO entidad_nacimiento VALUES(12,'Guanajuato');
INSERT INTO entidad_nacimiento VALUES(13,'Guerrero');
INSERT INTO entidad_nacimiento VALUES(14,'Hidalgo');
INSERT INTO entidad_nacimiento VALUES(15,'Jalisco');
INSERT INTO entidad_nacimiento VALUES(16,'Michoacan');
INSERT INTO entidad_nacimiento VALUES(17,'Morelos');
INSERT INTO entidad_nacimiento VALUES(18,'Nayarit');
INSERT INTO entidad_nacimiento VALUES(19,'Nuevo Leon');
INSERT INTO entidad_nacimiento VALUES(20,'Oaxaca');
INSERT INTO entidad_nacimiento VALUES(21,'Puebla');
INSERT INTO entidad_nacimiento VALUES(22,'Queretaro');
INSERT INTO entidad_nacimiento VALUES(23,'Quintana Roo');
INSERT INTO entidad_nacimiento VALUES(24,'San Luis Potosi');
INSERT INTO entidad_nacimiento VALUES(25,'Sinaloa');
INSERT INTO entidad_nacimiento VALUES(26,'Sonora');
INSERT INTO entidad_nacimiento VALUES(27,'Tabasco');
INSERT INTO entidad_nacimiento VALUES(28,'Tamaulipas');
INSERT INTO entidad_nacimiento VALUES(29,'Tlaxcala');
INSERT INTO entidad_nacimiento VALUES(30,'Veracruz');
INSERT INTO entidad_nacimiento VALUES(31,'Yucatan');
INSERT INTO entidad_nacimiento VALUES(32,'Zacatecas');

commit;