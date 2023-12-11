--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      fi
-- Project :      MODELO_REL_HOUSE_SERVICES.DM1
-- Author :       j5mr
--
-- Date Created : Sunday, December 10, 2023 22:59:26
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: CALIFICA_SERVICIO 
--

CREATE TABLE CALIFICA_SERVICIO(
    CALIFICA_SERVICIO_ID    NUMBER(10, 0)    NOT NULL,
    COMENTARIO              VARCHAR2(200)    NOT NULL,
    ESTRELLAS               NUMBER(1, 0)     NOT NULL,
    SERVICIO_ID             NUMBER(10, 0)    NOT NULL
)
;



-- 
-- TABLE: CLIENTE 
--

CREATE TABLE CLIENTE(
    CLIENTE_ID        NUMBER(10, 0)    NOT NULL,
    FECHA_REGISTRO    DATE             NOT NULL,
    NOMBRE_USUARIO    VARCHAR2(40)     NOT NULL,
    CONTRASEŅA        VARCHAR2(40)     NOT NULL,
    EMAIL             VARCHAR2(40)     NOT NULL,
    TELEFONO          VARCHAR2(10)     NOT NULL,
    DIRECCION         VARCHAR2(200)    NOT NULL,
    TIPO_CLIENTE      CHAR(1)          NOT NULL
)
;



-- 
-- TABLE: COMPROBANTE_EXP 
--

CREATE TABLE COMPROBANTE_EXP(
    COMPROBANTE_EXP_ID       NUMBER(10, 0)    NOT NULL,
    COMPROBANTE_PDF          BLOB             NOT NULL,
    PROVEEDOR_SERVICIO_ID    NUMBER(10, 0)    NOT NULL
)
;



-- 
-- TABLE: CUENTA_BANCARIA 
--

CREATE TABLE CUENTA_BANCARIA(
    CUENTA_BANCARIA_ID    NUMBER(10, 0)    NOT NULL,
    CLABE                 VARCHAR2(18)     NOT NULL,
    BANCO                 VARCHAR2(40)     NOT NULL,
    PROVEEDOR_ID          NUMBER(10, 0)    NOT NULL
)
;



-- 
-- TABLE: DEPOSITO 
--

CREATE TABLE DEPOSITO(
    DEPOSITO_ID           NUMBER(10, 0)    NOT NULL,
    IMPORTE               NUMBER(10, 0)    NOT NULL,
    FECHA_PAGO            DATE             NOT NULL,
    COMPROBANTE           BLOB             NOT NULL,
    CUENTA_BANCARIA_ID    NUMBER(10, 0)    NOT NULL
)
;



-- 
-- TABLE: EMPRESA 
--

CREATE TABLE EMPRESA(
    CLIENTE_ID       NUMBER(10, 0)    NOT NULL,
    NOMBRE           VARCHAR2(40)     NOT NULL,
    LOGOTIPO         BLOB             NOT NULL,
    DESCRIPCION      VARCHAR2(200)    NOT NULL,
    NUM_EMPLEADOS    NUMBER(40, 0)    NOT NULL
)
;



-- 
-- TABLE: ENTIDAD_NACIMIENTO 
--

CREATE TABLE ENTIDAD_NACIMIENTO(
    ENTIDAD_NACIMIENTO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE_ENTIDAD           VARCHAR2(40)     NOT NULL
)
;



-- 
-- TABLE: ESTATUS_PROVEEDOR 
--

CREATE TABLE ESTATUS_PROVEEDOR(
    ESTATUS_PROVEEDOR_ID    NUMBER(2, 0)     NOT NULL,
    ESTATUS                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION             VARCHAR2(200)    NOT NULL
)
;



-- 
-- TABLE: ESTATUS_SERVICIO 
--

CREATE TABLE ESTATUS_SERVICIO(
    ESTATUS_SERVICIO_ID    NUMBER(1, 0)     NOT NULL,
    ESTATUS                VARCHAR2(40)     NOT NULL,
    DESCRIPCION            VARCHAR2(200)    NOT NULL
)
;



-- 
-- TABLE: EVIDENCIA 
--

CREATE TABLE EVIDENCIA(
    EVIDENCIA_ID         NUMBER(10, 0)    NOT NULL,
    DESCRIPCION          VARCHAR2(200)    NOT NULL,
    FECHA_REALIZACION    DATE             NOT NULL,
    SERVICIO_ID          NUMBER(10, 0)    NOT NULL
)
;



-- 
-- TABLE: HISTORICO_ESTATUS_PROVEEDOR 
--

CREATE TABLE HISTORICO_ESTATUS_PROVEEDOR(
    HISTORICO_ESTATUS_PROVEEDOR_ID    NUMBER(10, 0)    NOT NULL,
    FECHA                             DATE             NOT NULL,
    PROVEEDOR_ID                      NUMBER(10, 0)    NOT NULL,
    ESTATUS_PROVEEDOR_ID              NUMBER(2, 0)     NOT NULL
)
;



-- 
-- TABLE: HISTORICO_ESTATUS_SERVICIO 
--

CREATE TABLE HISTORICO_ESTATUS_SERVICIO(
    HISTORICO_ESTATUS_SERVICIO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA                            DATE             NOT NULL,
    ESTATUS_SERVICIO_ID              NUMBER(1, 0)     NOT NULL,
    SERVICIO_ID                      NUMBER(10, 0)    NOT NULL
)
;



-- 
-- TABLE: IMAGENE_EVIDENCIA 
--

CREATE TABLE IMAGENE_EVIDENCIA(
    SECUENCIA_IMAGEN_EVIDENCIA    NUMBER(2, 0)     NOT NULL,
    EVIDENCIA_ID                  NUMBER(10, 0)    NOT NULL,
    IMAGEN                        BLOB             NOT NULL,
    DESCRIPCION                   VARCHAR2(500)    NOT NULL
)
;



-- 
-- TABLE: NIVEL_ESTUDIOS 
--

CREATE TABLE NIVEL_ESTUDIOS(
    NIVEL_ESTUDIO_ID    NUMBER(3, 0)     NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(200)    NOT NULL
)
;



-- 
-- TABLE: PAGO_SERVICIO 
--

CREATE TABLE PAGO_SERVICIO(
    NUM_PAGO       NUMBER(2, 0)     NOT NULL,
    SERVICIO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_PAGO     DATE             NOT NULL,
    IMPORTE        NUMBER(10, 0)    NOT NULL,
    COMISION       VARCHAR2(4)      NOT NULL
)
;



-- 
-- TABLE: PARTICULAR 
--

CREATE TABLE PARTICULAR(
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    FOTO                BLOB             NOT NULL,
    CURP                VARCHAR2(18)     NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL
)
;



-- 
-- TABLE: PROVEEDOR 
--

CREATE TABLE PROVEEDOR(
    PROVEEDOR_ID              NUMBER(10, 0)    NOT NULL,
    NOMBRE                    VARCHAR2(40)     NOT NULL,
    AP_PATERNO                VARCHAR2(40)     NOT NULL,
    AP_MATERNO                VARCHAR2(40)     NOT NULL,
    FOTO                      BLOB             NOT NULL,
    FECHA_NACIMIENTO          DATE             NOT NULL,
    DIRECCION                 VARCHAR2(200)    NOT NULL,
    TEL_CASA                  VARCHAR2(10)     NOT NULL,
    TEL_MOVIL                 VARCHAR2(10)     NOT NULL,
    IDENTIFICACION_VIGENTE    BLOB             NOT NULL,
    COMPROBANTE_DOMICILIO     BLOB             NOT NULL,
    FECHA_ESTATUS             DATE             NOT NULL,
    ENTIDAD_NACIMIENTO_ID     NUMBER(10, 0)    NOT NULL,
    ESTATUS_PROVEEDOR_ID      NUMBER(2, 0)     NOT NULL,
    MAX_NIVEL_ESTUDIO_ID      NUMBER(3, 0)     NOT NULL
)
;



-- 
-- TABLE: PROVEEDOR_EMAIL 
--

CREATE TABLE PROVEEDOR_EMAIL(
    SECUENCIA_PROVEEDOR_EMAIL    NUMBER(1, 0)     NOT NULL,
    PROVEEDOR_ID                 NUMBER(10, 0)    NOT NULL,
    EMAIL                        VARCHAR2(50)     NOT NULL
)
;



-- 
-- TABLE: PROVERDOR_SERVICIO 
--

CREATE TABLE PROVERDOR_SERVICIO(
    PROVEEDOR_SERVICIO_ID    NUMBER(10, 0)    NOT NULL,
    PROVEEDOR_ID             NUMBER(10, 0)    NOT NULL,
    TIPO_SERVICIO_ID         NUMBER(10, 0)    NOT NULL,
    ANIOS_EXP                NUMBER(2, 0)     NOT NULL
)
;



-- 
-- TABLE: SERVICIO 
--

CREATE TABLE SERVICIO(
    SERVICIO_ID                     NUMBER(10, 0)     NOT NULL,
    FECHA_SERVICIO                  DATE              NOT NULL,
    DESCRIPCION_CLIENTE             VARCHAR2(1000)    NOT NULL,
    DOCUMENTO_DETALLADO             BLOB,
    FECHA_ESTATUS                   DATE              NOT NULL,
    NUM_MENSUALIDADES_PAGO          NUMBER(2, 0),
    PRECIO                          NUMBER(10, 0),
    INSTRUCCIONES_PROVEEDOR         VARCHAR2(100)     NOT NULL,
    PROVEEDOR_SERVICIO_ID_REMOTO    NUMBER(10, 0)     NOT NULL,
    CLIENTE_ID                      NUMBER(10, 0)     NOT NULL,
    ESTATUS_SERVICIO_ID             NUMBER(1, 0)      NOT NULL
)
;



-- 
-- TABLE: TARJETA_CLIENTE 
--

CREATE TABLE TARJETA_CLIENTE(
    SECUENCIA_TARJETA_CLIENTE    NUMBER(1, 0)     NOT NULL,
    CLIENTE_ID                   NUMBER(10, 0)    NOT NULL,
    NUM_TARJETA                  VARCHAR2(16)     NOT NULL,
    CCV                          VARCHAR2(3)      NOT NULL,
    FECHA_EXPIRACION             DATE             NOT NULL,
    CLABE                        VARCHAR2(18)     NOT NULL
)
;



-- 
-- TABLE: TIPO_SERVICIO 
--

CREATE TABLE TIPO_SERVICIO(
    TIPO_SERVICIO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(200)    NOT NULL
)
;



-- 
-- INDEX: PK22 
--

CREATE UNIQUE INDEX PK22 ON CALIFICA_SERVICIO(CALIFICA_SERVICIO_ID)
;
-- 
-- INDEX: Ref1731 
--

CREATE INDEX Ref1731 ON CALIFICA_SERVICIO(SERVICIO_ID)
;
-- 
-- INDEX: PK8 
--

CREATE UNIQUE INDEX PK8 ON CLIENTE(CLIENTE_ID)
;
-- 
-- INDEX: PK25 
--

CREATE UNIQUE INDEX PK25 ON COMPROBANTE_EXP(COMPROBANTE_EXP_ID)
;
-- 
-- INDEX: Ref436 
--

CREATE INDEX Ref436 ON COMPROBANTE_EXP(PROVEEDOR_SERVICIO_ID)
;
-- 
-- INDEX: PK11 
--

CREATE UNIQUE INDEX PK11 ON CUENTA_BANCARIA(CUENTA_BANCARIA_ID)
;
-- 
-- INDEX: Ref140 
--

CREATE INDEX Ref140 ON CUENTA_BANCARIA(PROVEEDOR_ID)
;
-- 
-- INDEX: PK23 
--

CREATE UNIQUE INDEX PK23 ON DEPOSITO(DEPOSITO_ID)
;
-- 
-- INDEX: Ref1134 
--

CREATE INDEX Ref1134 ON DEPOSITO(CUENTA_BANCARIA_ID)
;
-- 
-- INDEX: PK9 
--

CREATE UNIQUE INDEX PK9 ON EMPRESA(CLIENTE_ID)
;
-- 
-- INDEX: Ref811 
--

CREATE INDEX Ref811 ON EMPRESA(CLIENTE_ID)
;
-- 
-- INDEX: PK2 
--

CREATE UNIQUE INDEX PK2 ON ENTIDAD_NACIMIENTO(ENTIDAD_NACIMIENTO_ID)
;
-- 
-- INDEX: PK5 
--

CREATE UNIQUE INDEX PK5 ON ESTATUS_PROVEEDOR(ESTATUS_PROVEEDOR_ID)
;
-- 
-- INDEX: PK18 
--

CREATE UNIQUE INDEX PK18 ON ESTATUS_SERVICIO(ESTATUS_SERVICIO_ID)
;
-- 
-- INDEX: PK15 
--

CREATE UNIQUE INDEX PK15 ON EVIDENCIA(EVIDENCIA_ID)
;
-- 
-- INDEX: Ref1742 
--

CREATE INDEX Ref1742 ON EVIDENCIA(SERVICIO_ID)
;
-- 
-- INDEX: PK6 
--

CREATE UNIQUE INDEX PK6 ON HISTORICO_ESTATUS_PROVEEDOR(HISTORICO_ESTATUS_PROVEEDOR_ID)
;
-- 
-- INDEX: Ref55 
--

CREATE INDEX Ref55 ON HISTORICO_ESTATUS_PROVEEDOR(ESTATUS_PROVEEDOR_ID)
;
-- 
-- INDEX: Ref16 
--

CREATE INDEX Ref16 ON HISTORICO_ESTATUS_PROVEEDOR(PROVEEDOR_ID)
;
-- 
-- INDEX: PK19 
--

CREATE UNIQUE INDEX PK19 ON HISTORICO_ESTATUS_SERVICIO(HISTORICO_ESTATUS_SERVICIO_ID)
;
-- 
-- INDEX: Ref1821 
--

CREATE INDEX Ref1821 ON HISTORICO_ESTATUS_SERVICIO(ESTATUS_SERVICIO_ID)
;
-- 
-- INDEX: Ref1722 
--

CREATE INDEX Ref1722 ON HISTORICO_ESTATUS_SERVICIO(SERVICIO_ID)
;
-- 
-- INDEX: PK16 
--

CREATE UNIQUE INDEX PK16 ON IMAGENE_EVIDENCIA(SECUENCIA_IMAGEN_EVIDENCIA, EVIDENCIA_ID)
;
-- 
-- INDEX: Ref1516 
--

CREATE INDEX Ref1516 ON IMAGENE_EVIDENCIA(EVIDENCIA_ID)
;
-- 
-- INDEX: PK12 
--

CREATE UNIQUE INDEX PK12 ON NIVEL_ESTUDIOS(NIVEL_ESTUDIO_ID)
;
-- 
-- INDEX: PK21 
--

CREATE UNIQUE INDEX PK21 ON PAGO_SERVICIO(NUM_PAGO, SERVICIO_ID)
;
-- 
-- INDEX: Ref1732 
--

CREATE INDEX Ref1732 ON PAGO_SERVICIO(SERVICIO_ID)
;
-- 
-- INDEX: PK10 
--

CREATE UNIQUE INDEX PK10 ON PARTICULAR(CLIENTE_ID)
;
-- 
-- INDEX: Ref812 
--

CREATE INDEX Ref812 ON PARTICULAR(CLIENTE_ID)
;
-- 
-- INDEX: PK1 
--

CREATE UNIQUE INDEX PK1 ON PROVEEDOR(PROVEEDOR_ID)
;
-- 
-- INDEX: Ref21 
--

CREATE INDEX Ref21 ON PROVEEDOR(ENTIDAD_NACIMIENTO_ID)
;
-- 
-- INDEX: Ref54 
--

CREATE INDEX Ref54 ON PROVEEDOR(ESTATUS_PROVEEDOR_ID)
;
-- 
-- INDEX: Ref1210 
--

CREATE INDEX Ref1210 ON PROVEEDOR(MAX_NIVEL_ESTUDIO_ID)
;
-- 
-- INDEX: PK24 
--

CREATE UNIQUE INDEX PK24 ON PROVEEDOR_EMAIL(SECUENCIA_PROVEEDOR_EMAIL, PROVEEDOR_ID)
;
-- 
-- INDEX: Ref135 
--

CREATE INDEX Ref135 ON PROVEEDOR_EMAIL(PROVEEDOR_ID)
;
-- 
-- INDEX: PK4 
--

CREATE UNIQUE INDEX PK4 ON PROVERDOR_SERVICIO(PROVEEDOR_SERVICIO_ID)
;
-- 
-- INDEX: Ref12 
--

CREATE INDEX Ref12 ON PROVERDOR_SERVICIO(PROVEEDOR_ID)
;
-- 
-- INDEX: Ref33 
--

CREATE INDEX Ref33 ON PROVERDOR_SERVICIO(TIPO_SERVICIO_ID)
;
-- 
-- INDEX: PK17 
--

CREATE UNIQUE INDEX PK17 ON SERVICIO(SERVICIO_ID)
;
-- 
-- INDEX: Ref819 
--

CREATE INDEX Ref819 ON SERVICIO(CLIENTE_ID)
;
-- 
-- INDEX: Ref1820 
--

CREATE INDEX Ref1820 ON SERVICIO(ESTATUS_SERVICIO_ID)
;
-- 
-- INDEX: PK26 
--

CREATE UNIQUE INDEX PK26 ON TARJETA_CLIENTE(SECUENCIA_TARJETA_CLIENTE, CLIENTE_ID)
;
-- 
-- INDEX: Ref841 
--

CREATE INDEX Ref841 ON TARJETA_CLIENTE(CLIENTE_ID)
;
-- 
-- INDEX: PK3 
--

CREATE UNIQUE INDEX PK3 ON TIPO_SERVICIO(TIPO_SERVICIO_ID)
;
-- 
-- TABLE: CALIFICA_SERVICIO 
--

ALTER TABLE CALIFICA_SERVICIO ADD 
    CONSTRAINT PK22 PRIMARY KEY (CALIFICA_SERVICIO_ID)
    USING INDEX PK22
;

-- 
-- TABLE: CLIENTE 
--

ALTER TABLE CLIENTE ADD 
    CONSTRAINT PK8 PRIMARY KEY (CLIENTE_ID)
    USING INDEX PK8
;

-- 
-- TABLE: COMPROBANTE_EXP 
--

ALTER TABLE COMPROBANTE_EXP ADD 
    CONSTRAINT PK25 PRIMARY KEY (COMPROBANTE_EXP_ID)
    USING INDEX PK25
;

-- 
-- TABLE: CUENTA_BANCARIA 
--

ALTER TABLE CUENTA_BANCARIA ADD 
    CONSTRAINT PK11 PRIMARY KEY (CUENTA_BANCARIA_ID)
    USING INDEX PK11
;

-- 
-- TABLE: DEPOSITO 
--

ALTER TABLE DEPOSITO ADD 
    CONSTRAINT PK23 PRIMARY KEY (DEPOSITO_ID)
    USING INDEX PK23
;

-- 
-- TABLE: EMPRESA 
--

ALTER TABLE EMPRESA ADD 
    CONSTRAINT PK9 PRIMARY KEY (CLIENTE_ID)
    USING INDEX PK9
;

-- 
-- TABLE: ENTIDAD_NACIMIENTO 
--

ALTER TABLE ENTIDAD_NACIMIENTO ADD 
    CONSTRAINT PK2 PRIMARY KEY (ENTIDAD_NACIMIENTO_ID)
    USING INDEX PK2
;

-- 
-- TABLE: ESTATUS_PROVEEDOR 
--

ALTER TABLE ESTATUS_PROVEEDOR ADD 
    CONSTRAINT PK5 PRIMARY KEY (ESTATUS_PROVEEDOR_ID)
    USING INDEX PK5
;

-- 
-- TABLE: ESTATUS_SERVICIO 
--

ALTER TABLE ESTATUS_SERVICIO ADD 
    CONSTRAINT PK18 PRIMARY KEY (ESTATUS_SERVICIO_ID)
    USING INDEX PK18
;

-- 
-- TABLE: EVIDENCIA 
--

ALTER TABLE EVIDENCIA ADD 
    CONSTRAINT PK15 PRIMARY KEY (EVIDENCIA_ID)
    USING INDEX PK15
;

-- 
-- TABLE: HISTORICO_ESTATUS_PROVEEDOR 
--

ALTER TABLE HISTORICO_ESTATUS_PROVEEDOR ADD 
    CONSTRAINT PK6 PRIMARY KEY (HISTORICO_ESTATUS_PROVEEDOR_ID)
    USING INDEX PK6
;

-- 
-- TABLE: HISTORICO_ESTATUS_SERVICIO 
--

ALTER TABLE HISTORICO_ESTATUS_SERVICIO ADD 
    CONSTRAINT PK19 PRIMARY KEY (HISTORICO_ESTATUS_SERVICIO_ID)
    USING INDEX PK19
;

-- 
-- TABLE: IMAGENE_EVIDENCIA 
--

ALTER TABLE IMAGENE_EVIDENCIA ADD 
    CONSTRAINT PK16 PRIMARY KEY (SECUENCIA_IMAGEN_EVIDENCIA, EVIDENCIA_ID)
    USING INDEX PK16
;

-- 
-- TABLE: NIVEL_ESTUDIOS 
--

ALTER TABLE NIVEL_ESTUDIOS ADD 
    CONSTRAINT PK12 PRIMARY KEY (NIVEL_ESTUDIO_ID)
    USING INDEX PK12
;

-- 
-- TABLE: PAGO_SERVICIO 
--

ALTER TABLE PAGO_SERVICIO ADD 
    CONSTRAINT PK21 PRIMARY KEY (NUM_PAGO, SERVICIO_ID)
    USING INDEX PK21
;

-- 
-- TABLE: PARTICULAR 
--

ALTER TABLE PARTICULAR ADD 
    CONSTRAINT PK10 PRIMARY KEY (CLIENTE_ID)
    USING INDEX PK10
;

-- 
-- TABLE: PROVEEDOR 
--

ALTER TABLE PROVEEDOR ADD 
    CONSTRAINT PK1 PRIMARY KEY (PROVEEDOR_ID)
    USING INDEX PK1
;

-- 
-- TABLE: PROVEEDOR_EMAIL 
--

ALTER TABLE PROVEEDOR_EMAIL ADD 
    CONSTRAINT PK24 PRIMARY KEY (SECUENCIA_PROVEEDOR_EMAIL, PROVEEDOR_ID)
    USING INDEX PK24
;

-- 
-- TABLE: PROVERDOR_SERVICIO 
--

ALTER TABLE PROVERDOR_SERVICIO ADD 
    CONSTRAINT PK4 PRIMARY KEY (PROVEEDOR_SERVICIO_ID)
    USING INDEX PK4
;

-- 
-- TABLE: SERVICIO 
--

ALTER TABLE SERVICIO ADD 
    CONSTRAINT PK17 PRIMARY KEY (SERVICIO_ID)
    USING INDEX PK17
;

-- 
-- TABLE: TARJETA_CLIENTE 
--

ALTER TABLE TARJETA_CLIENTE ADD 
    CONSTRAINT PK26 PRIMARY KEY (SECUENCIA_TARJETA_CLIENTE, CLIENTE_ID)
    USING INDEX PK26
;

-- 
-- TABLE: TIPO_SERVICIO 
--

ALTER TABLE TIPO_SERVICIO ADD 
    CONSTRAINT PK3 PRIMARY KEY (TIPO_SERVICIO_ID)
    USING INDEX PK3
;

-- 
-- TABLE: CALIFICA_SERVICIO 
--

ALTER TABLE CALIFICA_SERVICIO ADD CONSTRAINT RefSERVICIO31 
    FOREIGN KEY (SERVICIO_ID)
    REFERENCES SERVICIO(SERVICIO_ID)
;


-- 
-- TABLE: COMPROBANTE_EXP 
--

ALTER TABLE COMPROBANTE_EXP ADD CONSTRAINT RefPROVERDOR_SERVICIO36 
    FOREIGN KEY (PROVEEDOR_SERVICIO_ID)
    REFERENCES PROVERDOR_SERVICIO(PROVEEDOR_SERVICIO_ID)
;


-- 
-- TABLE: CUENTA_BANCARIA 
--

ALTER TABLE CUENTA_BANCARIA ADD CONSTRAINT RefPROVEEDOR40 
    FOREIGN KEY (PROVEEDOR_ID)
    REFERENCES PROVEEDOR(PROVEEDOR_ID)
;


-- 
-- TABLE: DEPOSITO 
--

ALTER TABLE DEPOSITO ADD CONSTRAINT RefCUENTA_BANCARIA34 
    FOREIGN KEY (CUENTA_BANCARIA_ID)
    REFERENCES CUENTA_BANCARIA(CUENTA_BANCARIA_ID)
;


-- 
-- TABLE: EMPRESA 
--

ALTER TABLE EMPRESA ADD CONSTRAINT RefCLIENTE11 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
;


-- 
-- TABLE: EVIDENCIA 
--

ALTER TABLE EVIDENCIA ADD CONSTRAINT RefSERVICIO42 
    FOREIGN KEY (SERVICIO_ID)
    REFERENCES SERVICIO(SERVICIO_ID)
;


-- 
-- TABLE: HISTORICO_ESTATUS_PROVEEDOR 
--

ALTER TABLE HISTORICO_ESTATUS_PROVEEDOR ADD CONSTRAINT RefESTATUS_PROVEEDOR5 
    FOREIGN KEY (ESTATUS_PROVEEDOR_ID)
    REFERENCES ESTATUS_PROVEEDOR(ESTATUS_PROVEEDOR_ID)
;

ALTER TABLE HISTORICO_ESTATUS_PROVEEDOR ADD CONSTRAINT RefPROVEEDOR6 
    FOREIGN KEY (PROVEEDOR_ID)
    REFERENCES PROVEEDOR(PROVEEDOR_ID)
;


-- 
-- TABLE: HISTORICO_ESTATUS_SERVICIO 
--

ALTER TABLE HISTORICO_ESTATUS_SERVICIO ADD CONSTRAINT RefESTATUS_SERVICIO21 
    FOREIGN KEY (ESTATUS_SERVICIO_ID)
    REFERENCES ESTATUS_SERVICIO(ESTATUS_SERVICIO_ID)
;

ALTER TABLE HISTORICO_ESTATUS_SERVICIO ADD CONSTRAINT RefSERVICIO22 
    FOREIGN KEY (SERVICIO_ID)
    REFERENCES SERVICIO(SERVICIO_ID)
;


-- 
-- TABLE: IMAGENE_EVIDENCIA 
--

ALTER TABLE IMAGENE_EVIDENCIA ADD CONSTRAINT RefEVIDENCIA16 
    FOREIGN KEY (EVIDENCIA_ID)
    REFERENCES EVIDENCIA(EVIDENCIA_ID)
;


-- 
-- TABLE: PAGO_SERVICIO 
--

ALTER TABLE PAGO_SERVICIO ADD CONSTRAINT RefSERVICIO32 
    FOREIGN KEY (SERVICIO_ID)
    REFERENCES SERVICIO(SERVICIO_ID)
;


-- 
-- TABLE: PARTICULAR 
--

ALTER TABLE PARTICULAR ADD CONSTRAINT RefCLIENTE12 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
;


-- 
-- TABLE: PROVEEDOR 
--

ALTER TABLE PROVEEDOR ADD CONSTRAINT RefENTIDAD_NACIMIENTO1 
    FOREIGN KEY (ENTIDAD_NACIMIENTO_ID)
    REFERENCES ENTIDAD_NACIMIENTO(ENTIDAD_NACIMIENTO_ID)
;

ALTER TABLE PROVEEDOR ADD CONSTRAINT RefESTATUS_PROVEEDOR4 
    FOREIGN KEY (ESTATUS_PROVEEDOR_ID)
    REFERENCES ESTATUS_PROVEEDOR(ESTATUS_PROVEEDOR_ID)
;

ALTER TABLE PROVEEDOR ADD CONSTRAINT RefNIVEL_ESTUDIOS10 
    FOREIGN KEY (MAX_NIVEL_ESTUDIO_ID)
    REFERENCES NIVEL_ESTUDIOS(NIVEL_ESTUDIO_ID)
;


-- 
-- TABLE: PROVEEDOR_EMAIL 
--

ALTER TABLE PROVEEDOR_EMAIL ADD CONSTRAINT RefPROVEEDOR35 
    FOREIGN KEY (PROVEEDOR_ID)
    REFERENCES PROVEEDOR(PROVEEDOR_ID)
;


-- 
-- TABLE: PROVERDOR_SERVICIO 
--

ALTER TABLE PROVERDOR_SERVICIO ADD CONSTRAINT RefPROVEEDOR2 
    FOREIGN KEY (PROVEEDOR_ID)
    REFERENCES PROVEEDOR(PROVEEDOR_ID)
;

ALTER TABLE PROVERDOR_SERVICIO ADD CONSTRAINT RefTIPO_SERVICIO3 
    FOREIGN KEY (TIPO_SERVICIO_ID)
    REFERENCES TIPO_SERVICIO(TIPO_SERVICIO_ID)
;


-- 
-- TABLE: SERVICIO 
--

ALTER TABLE SERVICIO ADD CONSTRAINT RefCLIENTE19 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
;

ALTER TABLE SERVICIO ADD CONSTRAINT RefESTATUS_SERVICIO20 
    FOREIGN KEY (ESTATUS_SERVICIO_ID)
    REFERENCES ESTATUS_SERVICIO(ESTATUS_SERVICIO_ID)
;


-- 
-- TABLE: TARJETA_CLIENTE 
--

ALTER TABLE TARJETA_CLIENTE ADD CONSTRAINT RefCLIENTE41 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
;


