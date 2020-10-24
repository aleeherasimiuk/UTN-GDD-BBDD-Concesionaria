USE [GD2C2020]
GO

-- LIMPIAR OBJETOS SI EXISTEN

-- INDICES
IF OBJECT_ID('EMPANADA_DE_MONDONGO.sucursal.ix_sucursal','U') IS NOT NULL
  DROP INDEX EMPANADA_DE_MONDONGO.sucursal.ix_sucursal;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.cliente.ix_cliente','U') IS NOT NULL
  DROP INDEX EMPANADA_DE_MONDONGO.cliente.ix_cliente;


-- TRIGGERS

IF OBJECT_ID('EMPANADA_DE_MONDONGO.INSERTANDO_COMPRA_ITEM') IS NOT NULL
  DROP TRIGGER EMPANADA_DE_MONDONGO.INSERTANDO_COMPRA_ITEM;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.INSERTANDO_FACTURA_ITEM') IS NOT NULL
  DROP TRIGGER EMPANADA_DE_MONDONGO.INSERTANDO_FACTURA_ITEM;

-- TABLAS

-- DESACTIVAR CONSTRAINTS DE FK
--EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

--VERIFICAMOS QUE LAS TABLAS EXISTAN, Y SI EXISTEN SE ELIMINAN

IF OBJECT_ID('EMPANADA_DE_MONDONGO.factura_item','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.factura_item;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.factura_auto','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.factura_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.factura','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.factura;
 
IF OBJECT_ID('EMPANADA_DE_MONDONGO.compra_item','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.compra_item;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.compra_auto','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.compra_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.compra','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.compra;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.autoparte','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.autoparte;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.auto','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.modelo','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.modelo;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.tipo_caja','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.tipo_caja;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.tipo_transmision','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.tipo_transmision;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.tipo_auto','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.tipo_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.sucursal','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.sucursal;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.cliente','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.cliente;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.fabricante','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.fabricante;

-- FUNCIONES

IF OBJECT_ID('EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.OBTENER_NUMERO_ITEM') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.OBTENER_NUMERO_ITEM;

-- STORED PROCEDURES

--SI EXISTEN LOS SP, SE ELIMINAN

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_auto') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_autoparte') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_autoparte;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_cliente') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_cliente;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_compra') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_compra_auto') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_compra_item') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra_item;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_fabricante') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_fabricante;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_factura') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_factura_auto') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_factura_item') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura_item;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_modelo') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_modelo;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_sucursal') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_sucursal;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_tipo_auto') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_tipo_caja') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_caja;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.migrar_tipo_transmision') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_transmision;


GO


-- SCHEMA

--SI EXISTE EL ESQUEMA, SE ELIMINA

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'EMPANADA_DE_MONDONGO')
  DROP SCHEMA EMPANADA_DE_MONDONGO
GO


-- CREACION DEL ESQUEMA

-- SCHEMA
CREATE SCHEMA EMPANADA_DE_MONDONGO;
GO


-- CREACION DE TABLAS DEL ESQUEMA

CREATE TABLE EMPANADA_DE_MONDONGO.auto(

	patente_auto NVARCHAR(50) PRIMARY KEY,
	nro_chasis NVARCHAR(50) NOT NULL,
	nro_motor NVARCHAR(50) NOT NULL,
	fecha_alta DATETIME2(3) NOT NULL,
	cant_kms DECIMAL(18,0) NOT NULL,
	tipo_auto_codigo DECIMAL(18,0) NOT NULL,
	tipo_motor_codigo DECIMAL(18,0) NOT NULL,
	tipo_transmision_codigo DECIMAL(18,0) NOT NULL,
	tipo_caja_codigo DECIMAL(18,0) NOT NULL,
	modelo_codigo DECIMAL(18,0) NOT NULL,
	id_fabricante DECIMAL(18,0) NOT NULL
);
GO
 
CREATE TABLE EMPANADA_DE_MONDONGO.autoparte(

	codigo_autoparte DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
	categoria NVARCHAR(50),
	id_fabricante DECIMAL(18,0) NOT NULL,
	modelo_codigo DECIMAL(18,0) NOT NULL,

);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.cliente(

	id_cliente DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
	dni DECIMAL(18,0) NOT NULL,
	apellido NVARCHAR(255) NOT NULL,
	nombre NVARCHAR(255) NOT NULL,
	direccion NVARCHAR(255) NOT NULL,
	fecha_nac DATETIME2(3) NOT NULL,
	mail NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.compra(

	nro_compra DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	fecha DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
	id_sucursal DECIMAL(18,0) NOT NULL,
	id_cliente DECIMAL(18,0) NOT NULL,

);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.compra_auto(

	nro_compra DECIMAL(18,0) PRIMARY KEY,
	patente_auto NVARCHAR(50) NOT NULL,
	precio DECIMAL(18,2) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.compra_item(

	nro_compra DECIMAL(18,0),
	nro_item DECIMAL(18,0),
	codigo_autoparte DECIMAL(18,0) NOT NULL,
	cantidad DECIMAL(18,0) NOT NULL DEFAULT 1,
	precio DECIMAL(18,2) NOT NULL,
	PRIMARY KEY(nro_compra, nro_item)

);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.fabricante(

	id_fabricante DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255) NOT NULL,

);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.factura(

	nro_factura DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	fecha DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
	id_cliente DECIMAL(18,0) NOT NULL,
	id_sucursal DECIMAL(18,0) NOT NULL,

);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.factura_auto(
	nro_factura DECIMAL(18,0) PRIMARY KEY,
	patente_auto NVARCHAR(50) NOT NULL,
	precio_facturado DECIMAL(18,2) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.factura_item(
	nro_factura DECIMAL(18,0),
	nro_item DECIMAL(18,0),
	codigo_autoparte DECIMAL(18,0) NOT NULL,
	cant DECIMAL(18,0) NOT NULL DEFAULT 1,
	precio DECIMAL(18,2) NOT NULL, -- Precio total
	PRIMARY KEY(nro_factura, nro_item)
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.modelo(
	modelo_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255) NOT NULL,
	potencia DECIMAL(18,0) NOT NULL
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.sucursal(

	id_sucursal DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	direccion NVARCHAR(255) NOT NULL,
	mail NVARCHAR(255) NOT NULL,
	telefono DECIMAL(18,0) NOT NULL,
	ciudad NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.tipo_auto(
	tipo_auto_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.tipo_caja(
	tipo_caja_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.tipo_transmision(
	tipo_transmision_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

-- FKs

ALTER TABLE EMPANADA_DE_MONDONGO.auto 
	ADD FOREIGN KEY (tipo_auto_codigo) REFERENCES EMPANADA_DE_MONDONGO.tipo_auto(tipo_auto_codigo),
		FOREIGN KEY (tipo_transmision_codigo) REFERENCES EMPANADA_DE_MONDONGO.tipo_transmision(tipo_transmision_codigo),
		FOREIGN KEY (tipo_caja_codigo) REFERENCES EMPANADA_DE_MONDONGO.tipo_caja(tipo_caja_codigo),
		FOREIGN KEY (modelo_codigo) REFERENCES EMPANADA_DE_MONDONGO.modelo(modelo_codigo),
		FOREIGN KEY (id_fabricante) REFERENCES EMPANADA_DE_MONDONGO.fabricante(id_fabricante);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.autoparte
	ADD	FOREIGN KEY (modelo_codigo) REFERENCES EMPANADA_DE_MONDONGO.modelo(modelo_codigo),
		FOREIGN KEY (id_fabricante) REFERENCES EMPANADA_DE_MONDONGO.fabricante(id_fabricante);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.compra
	ADD FOREIGN KEY (id_sucursal) REFERENCES EMPANADA_DE_MONDONGO.sucursal(id_sucursal),
		FOREIGN KEY (id_cliente) REFERENCES EMPANADA_DE_MONDONGO.cliente(id_cliente);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.compra_auto
	ADD FOREIGN KEY (nro_compra) REFERENCES EMPANADA_DE_MONDONGO.compra(nro_compra),
		FOREIGN KEY (patente_auto) REFERENCES EMPANADA_DE_MONDONGO.auto(patente_auto);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.compra_item
	ADD FOREIGN KEY (nro_compra) REFERENCES EMPANADA_DE_MONDONGO.compra(nro_compra),
		FOREIGN KEY (codigo_autoparte) REFERENCES EMPANADA_DE_MONDONGO.autoparte(codigo_autoparte);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.factura
	ADD FOREIGN KEY (id_cliente) REFERENCES EMPANADA_DE_MONDONGO.cliente(id_cliente),
		FOREIGN KEY (id_sucursal) REFERENCES EMPANADA_DE_MONDONGO.sucursal(id_sucursal);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.factura_auto
	ADD FOREIGN KEY (nro_factura) REFERENCES EMPANADA_DE_MONDONGO.factura(nro_factura),
		FOREIGN KEY (patente_auto) REFERENCES EMPANADA_DE_MONDONGO.auto(patente_auto);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.factura_item
	ADD FOREIGN KEY (nro_factura) REFERENCES EMPANADA_DE_MONDONGO.factura(nro_factura),
		FOREIGN KEY (codigo_autoparte) REFERENCES EMPANADA_DE_MONDONGO.autoparte(codigo_autoparte);
GO

-- FUNCIONES

--CONSEGUIR EL ID FABRICANTE AUTOGENERADO, EN BASE A SU NOMBRE EN LA TABLA MAESTRA

CREATE FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE(@nombre NVARCHAR(255)) RETURNS DECIMAL(18,0) AS
BEGIN

	DECLARE @id_fabricante DECIMAL(18,0);

	SELECT @id_fabricante = id_fabricante FROM EMPANADA_DE_MONDONGO.fabricante WHERE nombre = @nombre;

	RETURN @id_fabricante;
END
GO

--CONSEGUIR EL ID CLIENTE AUTOGENERADO, DEPENDIENDO DEL DNI Y EL APELLIDO

CREATE FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE(@DNI DECIMAL(18,0), @apellido NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN

	DECLARE @id_cliente DECIMAL(18,0);

	SELECT @id_cliente = id_cliente FROM EMPANADA_DE_MONDONGO.cliente WHERE dni = @DNI AND apellido = @apellido;

	RETURN @id_cliente;
	

END
GO

--OBTENER ID AUTOGENERADO DE LA SUCURSAL, EN BASE A LA DIRECCION DE LA SUCURSAL

CREATE FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL(@direccion NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN

	DECLARE @id_sucursal DECIMAL(18,0);

	SELECT @id_sucursal = id_sucursal FROM EMPANADA_DE_MONDONGO.sucursal WHERE direccion = @direccion;

	RETURN @id_sucursal;
	

END
GO

-- STORED PROCEDURES DE MIGRACION

CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_modelo AS
BEGIN
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.modelo ON
	INSERT INTO EMPANADA_DE_MONDONGO.modelo (modelo_codigo, nombre, potencia)
		SELECT DISTINCT modelo_codigo, modelo_nombre, modelo_potencia FROM gd_esquema.Maestra
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.modelo OFF
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_fabricante AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.fabricante (nombre)
		SELECT DISTINCT fabricante_nombre FROM gd_esquema.Maestra ORDER BY fabricante_nombre

END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_cliente AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.cliente (dni, apellido, nombre, direccion, fecha_nac, mail)
		SELECT DISTINCT	cliente_dni, cliente_apellido, cliente_nombre, cliente_direccion, cliente_fecha_nac, cliente_mail FROM gd_esquema.Maestra WHERE cliente_dni IS NOT NULL
		UNION
		SELECT DISTINCT	fac_cliente_dni, fac_cliente_apellido, fac_cliente_nombre, fac_cliente_direccion, fac_cliente_fecha_nac, fac_cliente_mail FROM gd_esquema.Maestra WHERE fac_cliente_dni IS NOT NULL
		
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_sucursal AS
BEGIN

	INSERT INTO EMPANADA_DE_MONDONGO.sucursal (direccion, mail,  telefono, ciudad)
		SELECT DISTINCT sucursal_direccion, sucursal_mail, sucursal_telefono, sucursal_ciudad FROM gd_esquema.Maestra WHERE sucursal_direccion IS NOT NULL
		UNION
		SELECT DISTINCT fac_sucursal_direccion, fac_sucursal_mail, fac_sucursal_telefono, fac_sucursal_ciudad FROM gd_esquema.Maestra WHERE fac_sucursal_direccion IS NOT NULL


END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_auto AS
BEGIN

	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.tipo_auto ON
	INSERT INTO EMPANADA_DE_MONDONGO.tipo_auto (tipo_auto_codigo, descripcion)
		SELECT DISTINCT tipo_auto_codigo, tipo_auto_desc FROM gd_esquema.Maestra WHERE tipo_auto_codigo IS NOT NULL ORDER BY tipo_auto_codigo 
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.tipo_auto OFF
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_transmision AS
BEGIN

	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.tipo_transmision ON
	INSERT INTO EMPANADA_DE_MONDONGO.tipo_transmision (tipo_transmision_codigo, descripcion)
		SELECT DISTINCT tipo_transmision_codigo, tipo_transmision_desc FROM gd_esquema.Maestra WHERE tipo_transmision_codigo IS NOT NULL ORDER BY tipo_transmision_codigo 
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.tipo_transmision OFF
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_caja AS
BEGIN

	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.tipo_caja ON
	INSERT INTO EMPANADA_DE_MONDONGO.tipo_caja (tipo_caja_codigo, descripcion)
		SELECT DISTINCT tipo_caja_codigo, tipo_caja_desc FROM gd_esquema.Maestra WHERE tipo_caja_codigo IS NOT NULL ORDER BY tipo_caja_codigo 
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.tipo_caja OFF
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_auto AS
BEGIN

	INSERT INTO EMPANADA_DE_MONDONGO.auto (patente_auto, nro_chasis, nro_motor, fecha_alta, cant_kms,tipo_auto_codigo, tipo_motor_codigo, tipo_transmision_codigo, tipo_caja_codigo, modelo_codigo, id_fabricante)
		SELECT DISTINCT auto_patente, auto_nro_chasis, auto_nro_motor, auto_fecha_alta, auto_cant_kms, tipo_auto_codigo, tipo_motor_codigo, tipo_transmision_codigo, tipo_caja_codigo, modelo_codigo, EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE(fabricante_nombre) FROM gd_esquema.Maestra WHERE auto_patente IS NOT NULL
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_autoparte AS
BEGIN
	
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.autoparte ON
	INSERT INTO EMPANADA_DE_MONDONGO.autoparte (codigo_autoparte, descripcion, categoria, id_fabricante, modelo_codigo)
		SELECT DISTINCT auto_parte_codigo, auto_parte_descripcion, NULL, EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE(fabricante_nombre), modelo_codigo FROM gd_esquema.Maestra WHERE auto_parte_codigo IS NOT NULL
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.autoparte OFF
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra AS
BEGIN

	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.compra ON

	SELECT DISTINCT compra_nro, compra_fecha, sucursal_direccion, cliente_dni, cliente_apellido INTO #temp_compras 
		FROM gd_esquema.Maestra WHERE compra_nro IS NOT NULL

	INSERT INTO EMPANADA_DE_MONDONGO.compra (nro_compra, fecha, id_sucursal, id_cliente)
		SELECT compra_nro, compra_fecha, EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL(sucursal_direccion), EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE(cliente_dni, cliente_apellido) 
			FROM #temp_compras

	DROP TABLE #temp_compras
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.compra OFF
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra_auto AS
BEGIN

	INSERT INTO EMPANADA_DE_MONDONGO.compra_auto (nro_compra, patente_auto, precio)
		SELECT DISTINCT compra_nro, auto_patente, compra_precio FROM gd_esquema.Maestra WHERE compra_nro IS NOT NULL AND auto_patente IS NOT NULL;
END
GO

--OBTENER EL SIGUIENTE NUMERO QUE LE CORRESPONDERIA AL ITEM ASOCIADO A UN NUMERO DE COMPRA O A UN NUMERO DE FACTURA SEGUN CORRESPONDA

CREATE FUNCTION EMPANADA_DE_MONDONGO.OBTENER_NUMERO_ITEM(@nro DECIMAL(18,0), @tipo CHAR) RETURNS DECIMAL(18,0) AS
BEGIN

	DECLARE @item_num DECIMAL(18,0)

	IF @tipo = 'C'
		SELECT @item_num = (COALESCE(MAX(nro_item), 0) + 1) FROM EMPANADA_DE_MONDONGO.compra_item WHERE nro_compra = @nro;
	ELSE IF @tipo = 'F'
		SELECT @item_num = (COALESCE(MAX(nro_item), 0) + 1) FROM EMPANADA_DE_MONDONGO.factura_item WHERE nro_factura = @nro;

	RETURN @item_num

END
GO

--TRIGGER PARA INSERTAR LOS DATOS EN COMPRA ITEM

CREATE TRIGGER EMPANADA_DE_MONDONGO.INSERTANDO_COMPRA_ITEM ON EMPANADA_DE_MONDONGO.compra_item INSTEAD OF INSERT AS
BEGIN
	
	DECLARE @nro_compra DECIMAL(18,0);
	DECLARE @codigo_autoparte DECIMAL(18,0);
	DECLARE @cantidad DECIMAL(18,0);
	DECLARE @precio DECIMAL(18,0);

	DECLARE items CURSOR LOCAL FORWARD_ONLY READ_ONLY
		FOR SELECT nro_compra, codigo_autoparte, cantidad, precio FROM inserted;

	OPEN items 

	FETCH items INTO @nro_compra, @codigo_autoparte, @cantidad, @precio

	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT INTO EMPANADA_DE_MONDONGO.compra_item (nro_compra, nro_item, codigo_autoparte, cantidad, precio)
			VALUES (@nro_compra, EMPANADA_DE_MONDONGO.OBTENER_NUMERO_ITEM(@nro_compra, 'C'), @codigo_autoparte, @cantidad, @precio)

		FETCH items INTO @nro_compra, @codigo_autoparte, @cantidad, @precio
	END
	CLOSE items
	DEALLOCATE items

END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra_item AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.compra_item (nro_compra, codigo_autoparte, cantidad, precio)
			SELECT compra_nro, auto_parte_codigo, compra_cant, compra_precio FROM gd_esquema.Maestra c2 WHERE compra_nro IS NOT NULL AND auto_parte_codigo IS NOT NULL;	
END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura AS 
BEGIN

	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.factura ON

	SELECT DISTINCT factura_nro, factura_fecha, fac_sucursal_direccion, fac_cliente_dni, fac_cliente_apellido INTO #temp_factura
		FROM gd_esquema.Maestra WHERE factura_nro IS NOT NULL


	INSERT INTO EMPANADA_DE_MONDONGO.factura (nro_factura, fecha, id_sucursal, id_cliente)
		SELECT factura_nro, factura_fecha, EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL(fac_sucursal_direccion), EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE(fac_cliente_dni, fac_cliente_apellido) 
			FROM #temp_factura

	DROP TABLE #temp_factura
	SET IDENTITY_INSERT EMPANADA_DE_MONDONGO.factura OFF

END
GO



CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura_auto AS
BEGIN
	
	INSERT INTO EMPANADA_DE_MONDONGO.factura_auto (nro_factura, patente_auto, precio_facturado)
			SELECT DISTINCT factura_nro, auto_patente, precio_facturado FROM gd_esquema.Maestra WHERE factura_nro IS NOT NULL AND auto_patente IS NOT NULL;
	
END
GO

--TRIGGER PARA INSERTAR LOS DATOS EN FACTURA ITEM

CREATE TRIGGER EMPANADA_DE_MONDONGO.INSERTANDO_FACTURA_ITEM ON EMPANADA_DE_MONDONGO.factura_item INSTEAD OF INSERT AS
BEGIN


	DECLARE @nro_factura DECIMAL(18,0);
	DECLARE @codigo_autoparte DECIMAL(18,0);
	DECLARE @cantidad DECIMAL(18,0);
	DECLARE @precio DECIMAL(18,0);

	DECLARE items CURSOR LOCAL FORWARD_ONLY READ_ONLY
		FOR SELECT nro_factura, codigo_autoparte, cant, precio FROM inserted;

	OPEN items 

	FETCH items INTO @nro_factura, @codigo_autoparte, @cantidad, @precio

	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT INTO EMPANADA_DE_MONDONGO.factura_item(nro_factura, nro_item, codigo_autoparte, cant, precio)
			VALUES (@nro_factura, EMPANADA_DE_MONDONGO.OBTENER_NUMERO_ITEM(@nro_factura, 'F'), @codigo_autoparte, @cantidad, @precio)

		FETCH items INTO @nro_factura, @codigo_autoparte, @cantidad, @precio
	END
	CLOSE items
	DEALLOCATE items

END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura_item AS
BEGIN

	INSERT INTO EMPANADA_DE_MONDONGO.factura_item(nro_factura, codigo_autoparte, cant, precio)
			SELECT factura_nro, auto_parte_codigo, cant_facturada, precio_facturado FROM gd_esquema.Maestra WHERE factura_nro IS NOT NULL AND auto_parte_codigo IS NOT NULL
		
END
GO

-- INDICES

CREATE INDEX ix_sucursal ON EMPANADA_DE_MONDONGO.sucursal (direccion);
CREATE INDEX ix_cliente ON EMPANADA_DE_MONDONGO.cliente (dni, apellido);
GO

-- EJECUCION DE SPs

EXEC EMPANADA_DE_MONDONGO.migrar_fabricante;
EXEC EMPANADA_DE_MONDONGO.migrar_cliente;
EXEC EMPANADA_DE_MONDONGO.migrar_sucursal;
EXEC EMPANADA_DE_MONDONGO.migrar_tipo_auto;
EXEC EMPANADA_DE_MONDONGO.migrar_tipo_transmision;
EXEC EMPANADA_DE_MONDONGO.migrar_tipo_caja;
EXEC EMPANADA_DE_MONDONGO.migrar_modelo;
EXEC EMPANADA_DE_MONDONGO.migrar_auto;
EXEC EMPANADA_DE_MONDONGO.migrar_autoparte;
EXEC EMPANADA_DE_MONDONGO.migrar_compra;
EXEC EMPANADA_DE_MONDONGO.migrar_compra_auto;
EXEC EMPANADA_DE_MONDONGO.migrar_compra_item;
EXEC EMPANADA_DE_MONDONGO.migrar_factura;
EXEC EMPANADA_DE_MONDONGO.migrar_factura_auto;
EXEC EMPANADA_DE_MONDONGO.migrar_factura_item;
