-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 06/12/2023
-- @Descripcion: Creacion de tablas e indices asignados a sus respectivos tablespace
--del modulo proveedor 

CREATE TABLE proveedor (
    proveedor_id NUMERIC(10,0) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    ap_materno VARCHAR(40) NOT NULL,
    ap_paterno VARCHAR(40) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    tel_casa VARCHAR(10) NOT NULL,
    tel_movil VARCHAR(10) NOT NULL,
    fecha_status DATE NOT NULL,
    foto BLOB TABLESPACE imagenes_proveedor_lob_ts,
    identificacion_vigente BLOB TABLESPACE documentos_proveedor_lob_ts,
    comprobante_domicilio BLOB TABLESPACE documentos_proveedor_lob_ts,
    entidad_nacimiento_id NUMERIC(10) NOT NULL,
    estatus_proveedor_id NUMERIC(2) NOT NULL,
    nivel_studios_id NUMERIC(3) NOT NULL,
    PRIMARY KEY (proveedor_id),
    CONSTRAINT fk_entidad_nacimiento FOREIGN KEY (entidad_nacimiento_id) REFERENCES entidad_nacimiento(entidad_nacimiento_id),
    CONSTRAINT fk_estatus_proveedor FOREIGN KEY (estatus_proveedor_id) REFERENCES estatus_proveedor(estatus_proveedor_id),
    CONSTRAINT fk_nivel_studio FOREIGN KEY (nivel_studios_id) REFERENCES nivel_studios(nivel_studios_id)
)TABLESPACE proveedor_ts;

CREATE TABLE estatus_proveedor(
    estatus_provedor_id NUMERIC(2,0) NOT NULL,
    estatus VARCHAR(40) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    PRIMARY KEY (estatus_provedor_id)
)TABLESPACE proveedor_ts;

CREATE TABLE proveedor_email (
    secuencia_proveedor_email NUMERIC(1,0) NOT NULL,
    proveedor_id NUMERIC(10,0) NOT NULL, 
    email VARCHAR(50) NOT NULL,
    CONSTRAINT pk_proveedor_email PRIMARY KEY (secuencia_proveedor_email, proveedor_id), 
    CONSTRAINT fk_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id) 
)TABLESPACE proveedor_ts;


CREATE TABLE deposito(
    deposito_id NUMERIC(10,0) NOT NULL,
    importe NUMERIC(10,0) NOT NULL,
    fecha_pago DATE NOT NULL,
    comprobante BLOB TABLESPACE documentos_proveedor_lob_ts,
    cuenta_bancaria_id NUMERIC(10,0),
    PRIMARY KEY (deposito_id),
    CONSTRAINT fk_cuenta_bancaria FOREIGN KEY (cuenta_bancaria_id) REFERENCES cuenta_bancaria(cuenta_bancaria_id)
)TABLESPACE proveedor_ts;

CREATE TABLE cuenta_bancaria(
    cuenta_bancaria_id NUMERIC(10,0) NOT NULL,
    clabe VARCHAR(18) NOT NULL,
    banco VARCHAR(40) NOT NULL,
    proveedor_id NUMERIC(10,0) NOT NULL,
    PRIMARY KEY (cuenta_bancaria_id),
    CONSTRAINT fk_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id)
)TABLESPACE proveedor_ts;

CREATE TABLE comprobante_experiencia(
    comprobante_experiencia_id NUMERIC(10,0) NOT NULL,
    comprobante_pdf BLOB TABLESPACE documentos_proveedor_lob_ts,
    proveedor_servicio_id NUMERIC(10,0) NOT NULL,
    PRIMARY KEY(comprobante_experiencia_id),
    CONSTRAINT fk_proveedor_servicio FOREIGN KEY (proveedor_servicio_id) REFERENCES proveedor_servicio(proveedor_servicio_id)
)TABLESPACE proveedor_ts;

CREATE TABLE nivel_estudios(
    nivel_estudios_id NUMERIC(3,0) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    PRIMARY KEY(nivel_estudios_id)
)TABLESPACE proveedor_ts;

CREATE TABLE tipo_servicio(
    tipo_servicio_id NUMERIC(10,0) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    PRIMARY KEY(tipo_servicio_id)
)TABLESPACE proveedor_ts;

CREATE TABLE proveedor_servicio(
    proveedor_servicio_id NUMERIC(10,0) NOT NULL,
    proveedor_id NUMERIC(10,0) NOT NULL,
    tipo_servicio_id NUMERIC(10,0) NOT NULL,
    anios_exp NUMERIC(2,0) NOT NULL,
    PRIMARY KEY(proveedor_servicio_id),
    CONSTRAINT fk_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id), 
    CONSTRAINT fk_tipo_servicio FOREIGN KEY (tipo_servicio_id) REFERENCES tipo_servicio(tipo_servicio_id)
)TABLESPACE proveedor_ts;

CREATE TABLE entidad_nacimiento(
    entidad_nacimiento_id NUMERIC(10,0) NOT NULL,
    nombre_entidad VARCHAR(40) NOT NULL,
    PRIMARY KEY (entidad_nacimiento_id)
)TABLESPACE proveedor_ts;

CREATE TABLE historico_estatus_proveedor(
    historico_estatus_proveedor_id NUMERIC(10,0) NOT NULL,
    fecha DATE NOT NULL,
    proveedor_id NUMERIC(10,0),
    estatus_proveedor_id NUMERIC(2,0),
    PRIMARY KEY(historico_estatus_proveedor_id),
    CONSTRAINT fk_proveedor_historico FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id),
    CONSTRAINT fk_estatus_proveedor_historico FOREIGN KEY (estatus_proveedor_id) REFERENCES estatus_proveedor(estatus_provedor_id)
)TABLESPACE proveedor_ts;

--indices 
--***************--
--TABLA PROVEEDOR--
--***************--
-- Indice en entidad_nacimiento_id para busquedas por entidad de nacimiento fk
CREATE INDEX idx_entidad_nacimiento_id ON proveedor (entidad_nacimiento_id) TABLESPACE indices_ts;

-- Indice en estatus_proveedor_id para filtrar proveedores por estado fk
CREATE INDEX idx_estatus_proveedor_id ON proveedor (estatus_proveedor_id) TABLESPACE indices_ts;

-- Indice en nivel_studios_id para consultas relacionadas con el nivel de estudio fk 
CREATE INDEX idx_nivel_studios_id ON proveedor (nivel_studios_id) TABLESPACE indices_ts;

--*********************--
--TABLA PROVEEDOR EMAIL--
--*********************--
-- Indice en proveedor_id para bUsquedas o filtrado por proveedor
CREATE INDEX idx_proveedor_id_email ON proveedor_email (proveedor_id) TABLESPACE indices_ts;

--**************--
--TABLA DEPOSITO--
--**************--
-- Indice en cuenta_bancaria_id para consultas que involucren esta columna
CREATE INDEX idx_cuenta_bancaria_id ON deposito (cuenta_bancaria_id) TABLESPACE indices_ts;

--*********************--
--TABLA CUENTA BANCARIA--
--*********************--
-- Indice en proveedor_id para consultas que involucren esta columna
CREATE INDEX idx_proveedor_id_cuenta_bancaria ON cuenta_bancaria (proveedor_id) TABLESPACE indices_ts;
-- INdice en clable para consultas que involucren la clabe bancaria ya que es unica 
CREATE UNIQUE INDEX idx_clabe ON cuenta_bancaria (clabe) TABLESPACE indices_ts;


--*****************************--
--TABLA COMPROBANTE EXPERIENCIA--
--*****************************--
-- Indice en proveedor_servicio_id para consultas que involucren esta columna
CREATE INDEX idx_proveedor_servicio_id ON comprobante_experiencia (proveedor_servicio_id) TABLESPACE indices_ts;

--************************--
--TABLA PROVEEDRO SERVICIO--
--************************--
-- Indice en proveedor_id para consultas que involucren esta columna
CREATE INDEX idx_proveedor_id ON proveedor_servicio (proveedor_id) TABLESPACE indices_ts;

-- Indice en tipo_servicio_id para consultas que involucren esta columna
CREATE INDEX idx_tipo_servicio_id ON proveedor_servicio (tipo_servicio_id) TABLESPACE indices_ts;

--*********************************--
--TABLA HISTORICO ESTATUS PROVEEDOR--
--*********************************--
-- Indice en proveedor_id para consultas que involucren esta columna
CREATE INDEX idx_proveedor_id_historico ON historico_estatus_proveedor (proveedor_id) TABLESPACE indices_ts;

-- Indice en estatus_proveedor_id para consultas que involucren esta columna
CREATE INDEX idx_estatus_proveedor_id ON historico_estatus_proveedor (estatus_proveedor_id) TABLESPACE indices_ts;
