
DROP DATABASE IF EXISTS  dbRestaurante
go
CREATE DATABASE dbRestaurante
go
USE dbRestaurante;


-- CREAR TABLAS
-- CREAR TABLA CLIENTE
CREATE TABLE CLIENTE(
    IDCLI int  NOT NULL IDENTITY(1, 1),
    NOMCLI Varchar(50)  NOT NULL,
    APEPATCLI Varchar(50)  NOT NULL,
    APEMATCLI Varchar(50)  NOT NULL,
    DNICLI char(8)  NOT NULL,
    EMACLI Varchar(60)  NOT NULL,
    CELCLI Char(9)  NOT NULL,
    DIRCLI Varchar(80)  NOT NULL,
    ESTCLI Char(1)  NOT NULL,
    CODUBI Char(6)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);

-- CREAR TABLA EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP Int  NOT NULL IDENTITY(1, 1),
    NOMEMP varchar(50)  NOT NULL,
    APEPATEMP varchar(50)  NOT NULL,
    APEMATEMP Varchar(50)  NOT NULL,
    DNIEMP char(8)  NOT NULL,
    EMAEMP varchar(60)  NOT NULL,
    CELEMP char(9)  NOT NULL,
    DIREMP varchar(80)  NOT NULL,
    TIPEMP Char(1)  NOT NULL,
    ESTEMP char(1)  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (IDEMP)
);

-- CREAR TABLA PLATILLO
CREATE TABLE PLATILLO (
    IDPLAT Int  NOT NULL IDENTITY(1, 1),
    NOMPLAT Varchar(20)  NOT NULL,
    PRECPLAT decimal(10,2)  NOT NULL,
    DESCPLAT Varchar(500)  NOT NULL,
    CATPLAT Char(1)  NOT NULL,
	STOCKPLAT int NOT NULL,
    ESTPLAT char(1)  NOT NULL,
    CONSTRAINT CODPLAT PRIMARY KEY  (IDPLAT)
);

-- CREAR TABLA UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPUBI varchar(50)  NOT NULL,
    PROUBI varchar(50)  NOT NULL,
    DISTUBI varchar(50)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
);

-- CREAR TABLA VENTA
CREATE TABLE VENTA (
    IDVEN Int  NOT NULL IDENTITY(1, 1),
    FECVEN Date NOT NULL,
    TIPVEN Char(1)  NOT NULL,
    ESTVEN Char(1)  NOT NULL,
    IDCLI Int  NOT NULL,
    IDEMPL Int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);

-- CREAR TABLA  VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET Int  NOT NULL IDENTITY(1, 1),
    CANTVENDET Int  NOT NULL,
	PREVENDET decimal(8,2) NOT NULL,
	SUBTOTVENDENT decimal (8,2) NULL,
    IDVEN Int  NOT NULL,
    IDPLAT Int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENDET)
);

-- foreign keys
-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI);

-- Reference: VENTA_DETALLE_PLATILLO (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PLATILLO
    FOREIGN KEY (IDPLAT)
    REFERENCES PLATILLO (IDPLAT);

	--VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE 
ADD CONSTRAINT VENTA_DETALLE_VENTA
FOREIGN KEY (IDVEN) REFERENCES VENTA (IDVEN);

-- Reference: VENTA_MESERO (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (IDEMPL)
    REFERENCES EMPLEADO (IDEMP);

--INSERTAR UBIEGEO
INSERT INTO UBIGEO
(CODUBI,DEPUBI,PROUBI,DISTUBI)
VALUES
  ('140401', 'LIMA', 'CAÑETE', 'SAN VICENTE'),
  ('140402', 'LIMA', 'CAÑETE', 'CALANGO'),
  ('140403', 'LIMA', 'CAÑETE', 'CERRO AZUL'),
  ('140404', 'LIMA', 'CAÑETE', 'COAYLLO'),
  ('140405', 'LIMA', 'CAÑETE', 'CHILCA'),
  ('140406', 'LIMA', 'CAÑETE', 'IMPERIAL'),
  ('140407', 'LIMA', 'CAÑETE', 'LUNAHUANA'),
  ('140408', 'LIMA', 'CAÑETE', 'MALA'),
  ('140409', 'LIMA', 'CAÑETE', 'NUEVO IMPERIAL'),
  ('140410', 'LIMA', 'CAÑETE', 'PACARAN'),
  ('140411', 'LIMA', 'CAÑETE', 'QUILMANA'),
  ('140412', 'LIMA', 'CAÑETE', 'SAN ANTONIO'),
  ('140413', 'LIMA', 'CAÑETE', 'SANA LUIS'),
  ('140414', 'LIMA', 'CAÑETE', 'SANTA CRUZ DE FLORES'),
  ('140415', 'LIMA', 'CAÑETE', 'ZUÑIGA'),
  ('140416', 'LIMA', 'CAÑETE', 'ASIA'),
  ('140417', 'LIMA', 'CAÑETE', 'IMPERIAL'),
  ('140418', 'LIMA', 'CAÑETE', 'SAN VICENTE'),
  ('140419', 'LIMA', 'CAÑETE', 'SAN LUIS'),
  ('140420', 'LIMA', 'CAÑETE', 'CHILCA')
GO

---SELECCIONAR LA TABLA CLIENTE
GO
---REGISTRAR DATOS DE CLIENTE
INSERT INTO CLIENTE
(NOMCLI,APEPATCLI,APEMATCLI,DNICLI,EMACLI,CELCLI,DIRCLI,ESTCLI,CODUBI)
VALUES
('JHON','MESTAS', 'ZAPATA','78032481','jhon@gmail.com','988745716','AV.SANTA ROSA','A','140401'),
('JUAN','PEREZ','CHOQUE','75032482','juan@gmail.com','978748701','AV.SAN MIGUEL','A','140402'),
('PABLO','RAMIREZ','APAZA','73042470','pablo@gmail.com','956745726','URB.SANTA ROSALIA','A','140403'),
('RONALD','QUILLA',' MILA','78932410','ronald@gmail.com','967745756','URB.SANTA MARTA','A','140404'),
('MIRIA','MESA',' MONTES','74030480','maria@gmail.com','988745706','AV.LUIS MIGUEL ','A','140405'),
('MARTA','QUISPE',' MILLA','74012480','marta@gmail.com','988745705','URB.SAN FELIPE','A','140406'),
('EDY','URTADO ','PADILLA','74092482','edy@gmail.com','958745709','URB.SAN CRISTOBAL','A','140407'),
('PEDRO','LETI ','ZATA','74002480','pedro@gmail.com','988745704','AV.SAN ISIDRO','A','140408'),
('JHON','ROJAS',' ZALA','74832486','jhon@gmail.com','988745702','AV.PANAMERICANA','A','140409'),
('RAUL','CONDORI',' CHOQUE','78012489','raul@gmail.com','968745701','URB.SANTA CESILIA','A','140410'),
('RICHART','MILAN',' CHOQUE','75032482','richart@gmail.com','978748701','AV.SAN MIGUEL','A','140411'),
('JAIME','ZUBIETA',' APAZA','73042470','jaime@gmail.com','956745726','URB.SANTA ROSALIA','A','140412'),
('BRANDON','LEON ','MILA','78932410','brandond@gmail.com','967745756','URB.SANTA MARTA','A','140413'),
('ALICIA','MARTINEZ',' MONTES','74032480','ali@gmail.com','988745796','AV.LUIS MIGUEL','A','140414'),
('IGNACIO','ARO',' MILLA','74092680','ignacio@gmail.com','988745705','URB.SAN FELIPE','A','140415'),
('FREDDY','FLOREZ',' PADILLA','74032410','freddy@gmail.com','988745009','URB.SAN CRISTOBAL','A','140416'),
('BORIS','MORALES',' ZATA','74032497','boris@gmail.com','988745704','AV.SAN ISIDRO','A','140417'),
('GABRIEL','GARCIA',' ROJAS','79088489','gabo@gmail.com','988745702','AV.PANAMERICANA','A','140418'),
('SAUL',' ALANDIA','MENDIETA','78032481','saul@gmail.com','968745701','AV.DEL VALLE','A','140419'),
('ERICK','CANAVIRI ',' CRUZ','78032486','erick@gmail.com','967745741','URB.SANTA VENITA','A','140420')
GO

--- REGISTRAR  DATOS   DE EMPLEADO
INSERT INTO  EMPLEADO
(NOMEMP,APEPATEMP,APEMATEMP,DNIEMP,EMAEMP,CELEMP,DIREMP,TIPEMP,ESTEMP)
VALUES
('JOSE','ORMEÑO','GUITIERREZ','71032480','jose@gmail.com','988745706','AV.SANTA ROSA','A','A'),
('JUAN','PEREZ',' CHOQUE','75032482','juan@gmail.com','978748701','AV.SAN MIGUEL','M','A'),
('PABLO','RAMIREZ',' APAZA','73042479','pablo@gmail.com','956745726','URB.SANTA ROSALIA','D','A'),
('RONALD','QUILLA',' MILA','78932410','ronald@gmail.com','967745756','URB.SANTA MARTA','D','A'),
('MIRIA','MESA',' MONTES','75092480','maria@gmail.com','988745766','AV.LUIS MIGUEL ','M','A'),
('MARTA','QUISPE',' MILLA','74032481','marta@gmail.com','988745705','URB.SAN FELIPE','M','A'),
('EDY','URTADO ','PADILLA','14032480','edy@gmail.com','988745709','URB.SAN CRISTOBAL','C','A'),
('PEDRO','LETI ','ZATA','74032480','pedro@gmail.com','988745704','AV.SAN ISIDRO','M','A'),
('JHON','ROJAS ','ZALA','74932480','jhon@gmail.com','988745702','AV.PANAMERICANA','M','A'),
('RAUL','CONDORI ','CHOQUE','7803O480','raul@gmail.com','968745701','URB.SANTA CESILIA','C','A'),
('RICHART','MILAN ','CHOQUE','75032482','richart@gmail.com','978748701','AV.SAN MIGUEL','D','A'),
('JAIME','ZUBI',' APAZA','18042470','jaime@gmail.com','956745726','URB.SANTA ROSALIA','C','A'),
('BRANDON','LEON',' MILA','78932410','brandond@gmail.com','967745756','URB.SANTA MARTA','M','A'),
('ALICIA','MARTINEZ',' MONTES','74032480','ali@gmail.com','988745706','AV.LUIS MIGUEL ','C','A'),
('IGNACIO','ARO ','MILLA','74032480','ignacio@gmail.com','988745705','URB.SAN FELIPE','A','A'),
('FREDDY','FLOREZ ','PADILLA','74032410','freddy@gmail.com','988745709','URB.SAN CRISTOBAL','D','A'),
('BORIS','MORALES ','ZATA','74032497','boris@gmail.com','988745704','AV.SAN ISIDRO','A','A'),
('GABRIEL','GARCIA ','ROJAS','79088489','gabo@gmail.com','988745702','AV.PANAMERICANA','C','A'),
('SAUL',' ALANDIA ','MENDIETA','75032481','saul@gmail.com','968745701','AV.DEL VALLE','C','A'),
('ERICK','CANAVIRI  ','CRUZ','78032486','erick@gmail.com','968745701','URB.SANTA VENITA','D','A')
GO

--- SELECCIONAR  LA TABLA PLATILLO
GO

---- REGISTRAR DATOS DE PLATILLO
INSERT INTO PLATILLO
(NOMPLAT,PRECPLAT,DESCPLAT,CATPLAT,STOCKPLAT,ESTPLAT)
VALUES
('LOMO SALTADO','15','Este Delicioso  Platillo Contiene Verduras, Carne de Res,Arroz y Papas fritas ','C','10','A'),
('CHAUFA','12','Este Delicioso  Platillo  Contiene Mescla de Arroz frito, Verduras ,Tortilla de huevo y carne ','C','10','A'),
('TALLARIN SALTADO','12','Este Delicioso  Platillo  Contiene Tallarin cocido,verduras y porciones de Carne ','C','10','A'),
('CALDO DE GALLINA','15','Este Delicioso  Platillo Contiene Carne de Gallina,Tallarin huevo cocido ,cebolla','C','10','A'),
('SOPA A LA MINUTA','12','Este Delicioso  Platillo Contiene Carne de Res o Pollo,tallarin y Verduras  ','C','5','A'),
('AJI DE GALLINA','12','Este Delicioso  Platillo Contiene Carne de Gallina,Arroz y Papas fritas ','C','5','A'),
('POLLO AL VINO','15','Este Delicioso  Platillo Contiene Carne de Pollo,Arroz y Papas fritas ','C','5','A'),
('ARROZ CON POLLO','12','Este Delicioso  Platillo Contiene Carne de pollo Mescla de Arroz con Verduras ','C','5','A'),
('CAU CAU','20','Este Delicioso  Platillo Contiene Arroz ,Modongo  con aji amarillo,Acompañado de un poco de carne y papa ','C','5','A'),
('CEVICHE','12','Este Delicioso Platillo  contiene pescado, limones, cebollas, ajíes y culantro  ','C','5','A'),
('CARAPULCRA ','12','Este Delicioso Platillo  contiene papa seca, carne de chancho ','C','5','A'),
('CHANFAINITA','15','Este Delicioso  Platillo Contiene Carne de Rez,Mote, Papas picada y Aji Amarillo  ','C','5','A'),
('SOPA CRIOLLA','12','Este Delicioso  Platillo contiene Tallarines ,Aji Amarillo ,Huevo frito ','C','5','A'),
('SECO DE CARNE','12','Este Delicioso  Platillo  contiene Carne de Rez  , Arroz ,Frejoles, Verduras ','C','5','A'),
('SOPA SECA','12','Este Delicioso  Platillo Contiene Tallarines ,Verduras ,Ajo,etc  ','C','5','A'),
('TALLARIN CON POLLO','15','Este delicio Platillo  Contiene  Carne de pollo , Tallarines , Verduras  ','C','5','A'),
('LOCRO DE ZAPALLO','12',' Este Delicioso  platillo Contiene Zapallo,queso,Papas ,etc','C','5','A'),
('SECO DE PAVITA','20','Este Delicioso  Platillo Contiene Carne de rez ,Papa ,Arroz ,envuelto de Aji Picante ','C','5','A'),
('TALLARINEZ VERDES','10','Este Delicioso  Platillo contiene Tallarines ,Cremas ','C','5','A'),
('GUISO DE POLLO','12','Este Delicioso  Platillo Contiene Carne de Pollo,Arroz Aji Amarillo  ','C','5','A')
GO



SET DATEFORMAT dmy;


-- REGISTRAR  DATOS  DE VENTA
INSERT INTO VENTA
(FECVEN,TIPVEN,ESTVEN,IDCLI,IDEMPL)
VALUES
('20/04/2022','P','A','1','1'),
('22/04/2022','D','A','2','2'),
('23/04/2022','P','A','3','3')
GO



-----REGISTRAR DATOS DE VENTA_DETALLE
INSERT INTO VENTA_DETALLE
(CANTVENDET,PREVENDET,SUBTOTVENDENT,IDVEN,IDPLAT)
VALUES
('1','15','15','1','1'),
('1','12','12','1','2'),
('1','12','12','1','3'),

('1','15','15','2','4'),
('1','12','12','2','5'),
('1','12','12','2','6'),

('1','15','15','3','7'),
('1','12','12','3','8'),
('1','20','20','3','9')
GO

--Vista de la tabla maestra CLIENTE

SELECT
	IDCLI AS ID,
	CONCAT(APEPATCLI,' ',APEMATCLI,', ',NOMCLI) AS 'CLIENTE',
	DNICLI AS 'DNI',
	EMACLI AS 'EMAIL',
	CELCLI AS 'CELULAR',
	DIRCLI AS 'DIRECION',
	ESTCLI AS 'ESTADO',
	CODUBI AS 'CODIGO DE UBIGEO'
FROM CLIENTE
GO
-----------------------------------------------VISTA VENTA-----------------------------------------------------


SELECT 
VENTA.IDVEN AS VENTA,
FORMAT(FECVEN, 'dd-MM-yy - H.MM') AS 'FEC.VENTA',
CONCAT (APEPATEMP,' ',APEMATEMP,', ',NOMEMP) AS EMPLEADO,
CONCAT (APEPATCLI,' ',APEMATCLI,', ',NOMCLI)  AS CLIENTE,

CASE VENTA.TIPVEN 
	WHEN 'D' THEN 'DELIVERY'
	WHEN 'P' THEN 'PRECENCIAL'
END AS 'TIPO VENTA',
CASE VENTA.ESTVEN
	WHEN 'A' THEN 'Activo'
	WHEN 'I' THEN 'Inactivo'
END AS 'EST.VENTA'
FROM VENTA 
INNER JOIN EMPLEADO VENDEDOR ON VENTA.IDEMPL = VENDEDOR.IDEMP
INNER JOIN CLIENTE CLIENTE ON VENTA.IDCLI = CLIENTE.IDCLI;	

--------------------------------------------------------------VISTA VENTA_DETALLE----------------------------------------------

SELECT
    IDVENDET AS 'ID DETALLE',
	IDVEN AS'ID VENTA',
    CANTVENDET AS 'CANTIDAD',
	PREVENDET AS 'PRECIO',
	SUBTOTVENDENT AS 'SUB.TOTAL',
	NOMPLAT AS PLATILLO
FROM VENTA_DETALLE
INNER JOIN PLATILLO ON VENTA_DETALLE.IDPLAT = PLATILLO.IDPLAT
