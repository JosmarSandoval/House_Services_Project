-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 11/12/2023
-- @Descripcion: Creacion de tablas e indices asignados a sus respectivos tablespace
--del modulo proveedor 


CREATE TABLE estatus_proveedor(
    estatus_proveedor_id NUMBER(2,0) NOT NULL,
    estatus VARCHAR2(40) NOT NULL,
    descripcion VARCHAR2(200) NOT NULL,
    CONSTRAINT estatus_proveedor_pk PRIMARY KEY (estatus_proveedor_id)
)TABLESPACE proveedor_ts;

CREATE TABLE nivel_estudios(
    nivel_estudios_id NUMBER(3,0) NOT NULL,
    nombre VARCHAR2(40) NOT NULL,
    descripcion VARCHAR2(200) NOT NULL,
    CONSTRAINT nivel_estudios_pk PRIMARY KEY(nivel_estudios_id)
)TABLESPACE proveedor_ts;

CREATE TABLE tipo_servicio(
    tipo_servicio_id NUMBER(10,0) NOT NULL,
    nombre VARCHAR2(40) NOT NULL,
    descripcion VARCHAR2(200) NOT NULL,
    CONSTRAINT tipo_servicio_pk PRIMARY KEY(tipo_servicio_id)
)TABLESPACE proveedor_ts;

CREATE TABLE entidad_nacimiento(
    entidad_nacimiento_id NUMBER(10,0) NOT NULL,
    nombre_entidad VARCHAR2(40) NOT NULL,
    CONSTRAINT entidad_nacimiento_pk PRIMARY KEY(entidad_nacimiento_id)
)TABLESPACE proveedor_ts;

CREATE TABLE proveedor (
    proveedor_id NUMBER(10,0) NOT NULL,
    nombre VARCHAR2(40) NOT NULL,
    ap_materno VARCHAR2(40) NOT NULL,
    ap_paterno VARCHAR2(40) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    tel_casa VARCHAR2(10) NOT NULL,
    tel_movil VARCHAR2(10) NOT NULL,
    fecha_status DATE NOT NULL,
    foto BLOB NOT NULL DEFAULT(empty_blob()),
    identificacion_vigente BLOB NOT NULL DEFAULT(empty_blob()),
    comprobante_domicilio BLOB NOT NULL DEFAULT(empty_blob()),
    entidad_nacimiento_id NUMBER(10,0) NOT NULL,
    estatus_proveedor_id NUMBER(2,0) NOT NULL,
    nivel_studios_id NUMBER(3,0) NOT NULL,
    CONSTRAINT proveedor_pk PRIMARY KEY(proveedor_id),
    CONSTRAINT proveedor_entidad_nacimiento_fk FOREIGN KEY (entidad_nacimiento_id) 
        REFERENCES entidad_nacimiento(entidad_nacimiento_id),
    CONSTRAINT proveedor_estatus_proveedor_fk FOREIGN KEY (estatus_proveedor_id) 
        REFERENCES estatus_proveedor(estatus_proveedor_id),
    CONSTRAINT proveedor_nivel_studio_fk FOREIGN KEY (nivel_studios_id) 
        REFERENCES nivel_studios(nivel_studios_id)
)TABLESPACE proveedor_ts
LOB (foto) STORE AS SECUREFILE (TABLESPACE imagenes_proveedor_lob_ts)
LOB (identificacion_vigente) AS SECUREFILE (TABLESPACE documentos_proveedor_lob_ts)
LOB (comprobante_domicilio) AS SECUREFILE (TABLESPACE documentos_proveedor_lob_ts);

CREATE TABLE proveedor_email (
    secuencia_proveedor_email NUMBER(1,0) NOT NULL,
    proveedor_id NUMBER(10,0) NOT NULL, 
    email VARCHAR2(50) NOT NULL,
    CONSTRAINT proveedor_email_pk PRIMARY KEY (secuencia_proveedor_email, proveedor_id), 
    CONSTRAINT proveedor_email_proveedor_id_fk FOREIGN KEY (proveedor_id) 
        REFERENCES proveedor(proveedor_id),
    CONSTRAINT proveedor_email_sec_prov_email_chk 
        CHECK (secuencia_proveedor_email BETWEEN 1 AND 3),
    CONSTRAINT proveedor_email_email_uk UNIQUE (email)
)TABLESPACE proveedor_ts;

CREATE TABLE cuenta_bancaria(
    cuenta_bancaria_id NUMBER(10,0) NOT NULL,
    clabe VARCHAR2(18) NOT NULL,
    banco VARCHAR2(40) NOT NULL,
    proveedor_id NUMBER(10,0) NOT NULL,
    CONSTRAINT cuenta_bancaria_pk PRIMARY KEY (cuenta_bancaria_id),
    CONSTRAINT cuenta_bancaria_proveedor_fk FOREIGN KEY (proveedor_id) 
        REFERENCES proveedor(proveedor_id),
    CONSTRAINT cuenta_bancaria_clabe_uk UNIQUE (clabe)
)TABLESPACE proveedor_ts;

CREATE TABLE deposito(
    deposito_id NUMBER(10,0) NOT NULL,
    importe NUMBER(10,0) NOT NULL,
    fecha_pago DATE NOT NULL,
    comprobante BLOB NOT NULL DEFAULT(empty_blob()),
    cuenta_bancaria_id NUMBER(10,0),
    CONSTRAINT deposito_pk PRIMARY KEY (deposito_id),
    CONSTRAINT deposito_cuenta_bancaria_fk FOREIGN KEY (cuenta_bancaria_id) 
        REFERENCES cuenta_bancaria(cuenta_bancaria_id)
)TABLESPACE proveedor_ts
LOB (comprobante) AS SECUREFILE (TABLESPACE documentos_proveedor_lob_ts);

CREATE TABLE proveedor_servicio(
    proveedor_servicio_id NUMBER(10,0) NOT NULL,
    proveedor_id NUMBER(10,0) NOT NULL,
    tipo_servicio_id NUMBER(10,0) NOT NULL,
    anios_exp NUMBER(2,0) NOT NULL,
    CONSTRAINT proveedor_servicio_pk PRIMARY KEY(proveedor_servicio_id),
    CONSTRAINT proveedor_servicio_proveedor_id_fk FOREIGN KEY (proveedor_id) 
        REFERENCES proveedor(proveedor_id), 
    CONSTRAINT proveedor_tipo_servicio_fk FOREIGN KEY (tipo_servicio_id) 
        REFERENCES tipo_servicio(tipo_servicio_id)
)TABLESPACE proveedor_ts;

CREATE TABLE comprobante_experiencia(
    comprobante_experiencia_id NUMBER(10,0) NOT NULL,
    comprobante_pdf BLOB NOT NULL DEFAULT(empty_blob()),
    proveedor_servicio_id NUMBER(10,0) NOT NULL,
    CONSTRAINT comprobante_experiencia_pk PRIMARY KEY(comprobante_experiencia_id),
    CONSTRAINT comprobante_exp_proveedor_servicio_fk FOREIGN KEY (proveedor_servicio_id) 
        REFERENCES proveedor_servicio(proveedor_servicio_id)
)TABLESPACE proveedor_ts
LOB (comprobante_pdf) AS SECUREFILE (TABLESPACE documentos_proveedor_lob_ts);

CREATE TABLE historico_estatus_proveedor(
    historico_estatus_proveedor_id NUMBER(10,0) NOT NULL,
    fecha DATE NOT NULL,
    proveedor_id NUMBER(10,0),
    estatus_proveedor_id NUMBER(2,0),
    CONSTRAINT historico_estatus_proveedor_pk PRIMARY KEY(historico_estatus_proveedor_id),
    CONSTRAINT hist_estat_prov_prov_id_fk FOREIGN KEY (proveedor_id) 
        REFERENCES proveedor(proveedor_id),
    CONSTRAINT hist_estat_prov_estat_prov_id_fk FOREIGN KEY (estatus_proveedor_id) 
        REFERENCES estatus_proveedor(estatus_provedor_id)
)TABLESPACE proveedor_ts;

--indices 
--***************--
--TABLA PROVEEDOR--
--***************--
-- Indice en entidad_nacimiento_id para busquedas por entidad de nacimiento fk
CREATE INDEX proveedor_entidad_nacimiento_id_ix ON proveedor (entidad_nacimiento_id) TABLESPACE indices_ts;

-- Indice en estatus_proveedor_id para filtrar proveedores por estado fk
CREATE INDEX proveedor_estatus_proveedor_id_ix ON proveedor (estatus_proveedor_id) TABLESPACE indices_ts;

-- Indice en nivel_studios_id para consultas relacionadas con el nivel de estudio fk 
CREATE INDEX proveedor_nivel_studios_id_ix ON proveedor (nivel_studios_id) TABLESPACE indices_ts;

--*********************--
--TABLA PROVEEDOR EMAIL--
--*********************--
-- Indice en proveedor_id para bUsquedas o filtrado por proveedor
CREATE INDEX proveedor_email_prov_id_email_ix ON proveedor_email (proveedor_id) TABLESPACE indices_ts;

--**************--
--TABLA DEPOSITO--
--**************--
-- Indice en cuenta_bancaria_id para consultas que involucren esta columna
CREATE INDEX deposito_cuenta_bancaria_id_ix ON deposito (cuenta_bancaria_id) TABLESPACE indices_ts;

--*********************--
--TABLA CUENTA BANCARIA--
--*********************--
-- Indice en proveedor_id para consultas que involucren esta columna
CREATE INDEX cuenta_bancaria_proveedor_id_ix ON cuenta_bancaria (proveedor_id) TABLESPACE indices_ts;
-- INdice en clable para consultas que involucren la clabe bancaria ya que es unica 
CREATE UNIQUE INDEX cuenta_bancaria_clabe_iuk ON cuenta_bancaria (clabe) TABLESPACE indices_ts;


--*****************************--
--TABLA COMPROBANTE EXPERIENCIA--
--*****************************--
-- Indice en proveedor_servicio_id para consultas que involucren esta columna
CREATE INDEX comprobante_exp_prov_servicio_id_ix ON comprobante_experiencia (proveedor_servicio_id) TABLESPACE indices_ts;

--************************--
--TABLA PROVEEDRO SERVICIO--
--************************--
-- Indice en proveedor_id para consultas que involucren esta columna
CREATE INDEX prov_servicio_proveedor_id_ix ON proveedor_servicio (proveedor_id) TABLESPACE indices_ts;

-- Indice en tipo_servicio_id para consultas que involucren esta columna
CREATE INDEX prov_servicio_tipo_servicio_id_ix ON proveedor_servicio (tipo_servicio_id) TABLESPACE indices_ts;

--*********************************--
--TABLA HISTORICO ESTATUS PROVEEDOR--
--*********************************--
-- Indice en proveedor_id para consultas que involucren esta columna
CREATE INDEX hist_estatus_prov_prov_id_ix ON historico_estatus_proveedor (proveedor_id) TABLESPACE indices_ts;

-- Indice en estatus_proveedor_id para consultas que involucren esta columna
CREATE INDEX hist_estatus_prov_estatus_prov_id_ix ON historico_estatus_proveedor (estatus_proveedor_id) TABLESPACE indices_ts;
