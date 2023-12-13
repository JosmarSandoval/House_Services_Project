-- @Autor Ramirez Andres Daniela, Sandoval Castro Josmar Leonardo
-- @Fecha 13/12/2023
-- @Descripcion: Instrucciones DDL para crear el segundo módulo
whenever sqlerror exit rollback;
Prompt conectando como cliente_usr
connect cliente_usr/cliente123

CREATE TABLE cliente(
    cliente_id        NUMBER(10, 0)    NOT NULL,
    fecha_registro    DATE             NOT NULL,
    nombre_ususario   VARCHAR2(40)     NOT NULL,
    contrasenia       VARCHAR2(40)     NOT NULL,
    email             VARCHAR2(40)     UNIQUE NOT NULL,
    telefono          VARCHAR2(10)     NOT NULL,
    direccion         VARCHAR2(200)    NOT NULL,
    tipo_cliente      CHAR(1)          NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY(cliente_id),
    CONSTRAINT cliente_tipo_cliente_chk CHECK (tipo_cliente IN ('E','P'))
)TABLESPACE cliente_servicio_ts;


CREATE TABLE empresa(
    cliente_id       NUMBER(10, 0)    NOT NULL,
    nombre           VARCHAR2(40)     NOT NULL,
    logotipo         BLOB             DEFAULT EMPTY_BLOB()   NOT NULL,
    descripcion      VARCHAR2(200)    NOT NULL,
    num_empleados    NUMBER(40, 0)    NOT NULL,
    CONSTRAINT empresa_pk PRIMARY KEY (cliente_id),
    CONSTRAINT empresa_cliente_id_fk FOREIGN KEY (cliente_id)
      REFERENCES cliente(cliente_id)
)TABLESPACE cliente_servicio_ts
LOB (logotipo) STORE AS SECUREFILE (TABLESPACE images_client_service_lob_ts);


CREATE TABLE particular(
    cliente_id          NUMBER(10, 0)    NOT NULL,
    nombre              VARCHAR2(40)     NOT NULL,
    foto                BLOB             DEFAULT EMPTY_BLOB() NOT NULL,
    curp                VARCHAR2(18)     UNIQUE NOT NULL,
    fecha_nacimiento    DATE             NOT NULL,
    CONSTRAINT particular_pk PRIMARY KEY (cliente_id),
    CONSTRAINT particular_cliente_id_fk FOREIGN KEY (cliente_id)
      REFERENCES cliente(cliente_id)
)TABLESPACE cliente_servicio_ts
LOB (logotipo) STORE AS SECUREFILE (TABLESPACE images_client_service_lob_ts);

CREATE TABLE tarjeta_cliente(
    secuencia_tarjeta_cliente    NUMBER(1, 0)     NOT NULL,
    cliente_id                   NUMBER(10, 0)    NOT NULL,
    num_tarjeta                  VARCHAR2(16)     UNIQUE NOT NULL,
    ccv                          VARCHAR2(3)      NOT NULL,
    fecha_expiracion             DATE             NOT NULL,
    clabe                        VARCHAR2(18)     UNIQUE NOT NULL,
    CONSTRAINT tarjeta_cliente_pk PRIMARY KEY (secuencia_tarjeta_cliente,cliente_id),
    CONSTRAINT tarjeta_client_client_id_fk FOREIGN KEY (cliente_id)
      REFERENCES cliente(cliente_id),
    CONSTRAINT secuencia_tarjeta_cliente_chk CHECK (secuencia_tarjeta_cliente BETWEEN 1 AND 3)
    
)TABLESPACE cliente_servicio_ts;


CREATE TABLE estatus_servicio(
    estatus_servicio_id    NUMBER(1, 0)     NOT NULL,
    estatus                VARCHAR2(40)     NOT NULL,
    descripcion            VARCHAR2(200)    NOT NULL,
    CONSTRAINT estatus_servicio_pk PRIMARY KEY (estatus_servicio_id)
)TABLESPACE cliente_servicio_ts;


CREATE TABLE servicio(
    servicio_id                     NUMBER(10, 0)     NOT NULL,
    fecha_servicio                  DATE              NOT NULL,
    descripcion_cliente             VARCHAR2(1000)    NOT NULL,
    documento_detallado             BLOB,
    fecha_estatus                   DATE              NOT NULL,
    num_mensualidades_pago          NUMBER(2, 0),
    precio                          NUMBER(10, 0),
    instrucciones_proveedor         VARCHAR2(100),
    proveedor_servicio_id_remoto    NUMBER(10, 0)     NOT NULL,
    cliente_id                      NUMBER(10, 0)     NOT NULL,
    estatus_servicio_id             NUMBER(1, 0)      NOT NULL,
    CONSTRAINT servicio_pk PRIMARY KEY (servicio_id),
    CONSTRAINT servicio_cliente_id_fk FOREIGN KEY (cliente_id)
      REFERENCES cliente(cliente_id),
    CONSTRAINT servicio_estat_serv_id_fk FOREIGN KEY (estatus_servicio_id)
      REFERENCES estatus_servicio(estatus_servicio_id)
)TABLESPACE cliente_servicio_ts
LOB (documento_detallado) STORE AS SECUREFILE (TABLESPACE docs_client_service_lob_ts);

CREATE TABLE historico_estatus_servicio(
    historico_estatus_servicio_id    NUMBER(10, 0)    NOT NULL,
    fecha                            DATE             NOT NULL,
    estatus_servicio_id              NUMBER(1, 0)     NOT NULL,
    servicio_id                      NUMBER(10, 0)    NOT NULL,
    CONSTRAINT historico_estatus_servicio_pk PRIMARY KEY (historico_estatus_servicio_id),
    CONSTRAINT hist_estat_serv_id_fk FOREIGN KEY (estatus_servicio_id)
      REFERENCES estatus_servicio(estatus_servicio_id),
    CONSTRAINT hist_estat_serv_serv_id_fk FOREIGN KEY (servicio_id)
      REFERENCES servicio(servicio_id)  
)TABLESPACE cliente_servicio_ts;

CREATE TABLE califica_servicio(
    califica_servicio_id    NUMBER(10, 0)    NOT NULL,
    comentario              VARCHAR2(200)    NOT NULL,
    estrellas               NUMBER(1, 0)     NOT NULL,
    servicio_id             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT califica_servicio_pk PRIMARY KEY (califica_servicio_id),
    CONSTRAINT calif_serv_serv_id_fk FOREIGN KEY (servicio_id)
      REFERENCES servicio(servicio_id)
)TABLESPACE cliente_servicio_ts;


CREATE TABLE evidencia(
    evidencia_id         NUMBER(10, 0)    NOT NULL,
    descripcion          VARCHAR2(200)    NOT NULL,
    fecha_realizacion    DATE             NOT NULL,
    servicio_id          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT evidencia_pk PRIMARY KEY (evidencia_id),
    CONSTRAINT evidencia_serv_id_fk FOREIGN KEY (servicio_id)
      REFERENCES servicio(servicio_id)
)TABLESPACE cliente_servicio_ts;

CREATE TABLE imagen_evidencia(
    secuencia_imagen_evidencia    NUMBER(2, 0)     NOT NULL,
    evidencia_id                  NUMBER(10, 0)    NOT NULL,
    imagen                        BLOB             DEFAULT EMPTY_BLOB() NOT NULL,
    descripcion                   VARCHAR2(500)    NOT NULL,
    CONSTRAINT imagen_evidencia_pk PRIMARY KEY (secuencia_imagen_evidencia, evidencia_id),
    CONSTRAINT imagen_evidencia_eviden_id_fk FOREIGN KEY (evidencia_id)
      REFERENCES evidencia(evidencia_id),
    CONSTRAINT imagen_evidencia_sec_img_chk CHECK (secuencia_imagen_evidencia BETWEEN 1 AND 10)
)TABLESPACE cliente_servicio_ts
LOB (imagen) STORE AS SECUREFILE (TABLESPACE images_client_service_lob_ts);

CREATE TABLE pago_servicio(
    num_pago       NUMBER(2, 0)     NOT NULL,
    servicio_id    NUMBER(10, 0)    NOT NULL,
    fecha_pago     DATE             NOT NULL,
    importe        NUMBER(10, 0)    NOT NULL,
    comision       NUMBER(4,0)      NOT NULL,
    CONSTRAINT pago_servicio_pk PRIMARY KEY (num_pago,servicio_id),
    CONSTRAINT pago_servicio_serv_id_fk FOREIGN KEY (servicio_id)
      REFERENCES servicio(servicio_id)
)TABLESPACE cliente_servicio_ts;

--Cambiar nombre y apuntar a el ts de indices
--Indices

-- Índice para la clave foránea en la tabla empresa
-- Índice para la clave foránea en la tabla cliente
CREATE INDEX idx_cliente_cliente_id_fk ON cliente(cliente_id);

-- Índice para la clave foránea en la tabla empresa
CREATE INDEX idx_empresa_cliente_id_fk ON empresa(cliente_id);

-- Índice para la clave foránea en la tabla particular
CREATE INDEX idx_particular_cliente_id_fk ON particular(cliente_id);

-- Índice para la clave foránea en la tabla tarjeta_cliente
CREATE INDEX idx_tarjeta_cliente_cliente_id_fk ON tarjeta_cliente(cliente_id);

-- Índice para la clave foránea en la tabla servicio
CREATE INDEX idx_servicio_cliente_id_fk ON servicio(cliente_id);

-- Índice para la clave foránea en la tabla servicio
CREATE INDEX idx_servicio_estatus_servicio_id_fk ON servicio(estatus_servicio_id);

-- Índice para la clave foránea en la tabla historico_estatus_servicio
CREATE INDEX idx_hist_estatus_serv_servicio_id_fk ON historico_estatus_servicio(servicio_id);

-- Índice para la clave foránea en la tabla califica_servicio
CREATE INDEX idx_califica_servicio_servicio_id_fk ON califica_servicio(servicio_id);

-- Índice para la clave foránea en la tabla evidencia
CREATE INDEX idx_evidencia_servicio_id_fk ON evidencia(servicio_id);

-- Índice para la clave foránea en la tabla imagen_evidencia
CREATE INDEX idx_imagen_evidencia_evidencia_id_fk ON imagen_evidencia(evidencia_id);

-- Índice para la clave foránea en la tabla pago_servicio
CREATE INDEX idx_pago_servicio_servicio_id_fk ON pago_servicio(servicio_id);



