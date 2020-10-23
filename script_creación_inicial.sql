USE [GD2C2020]
GO

EXECUTE AS USER = 'gd2020'

PRINT 'CREATING TABLE AUTO'

CREATE TABLE auto(

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
 
PRINT 'CREATING TABLE AUTOPARTE'
CREATE TABLE autoparte(

	codigo_autoparte DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
	categoria NVARCHAR(50),
	id_fabricante DECIMAL(18,0) NOT NULL,
	modelo_codigo DECIMAL(18,0) NOT NULL,

);
GO

PRINT 'CREATING TABLE CLIENTE'
CREATE TABLE cliente(

	id_cliente DECIMAL(18,0) IDENTITY(1,1) PRIMARY KEY,
	dni DECIMAL(18,0) NOT NULL,
	apellido NVARCHAR(255) NOT NULL,
	nombre NVARCHAR(255) NOT NULL,
	direccion NVARCHAR(255) NOT NULL,
	fecha_nac DATETIME2(3) NOT NULL,
	mail NVARCHAR(255) NOT NULL,
);
GO

PRINT 'CREATING TABLE COMPRA'
CREATE TABLE compra(

	nro_compra DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	fecha DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
	id_sucursal DECIMAL(18,0) NOT NULL,
	id_cliente DECIMAL(18,0) NOT NULL,

);
GO

PRINT 'CREATING TABLE COMPRA_AUTO'
CREATE TABLE compra_auto(

	nro_compra DECIMAL(18,0) PRIMARY KEY,
	patente_auto NVARCHAR(50) NOT NULL,
	precio DECIMAL(18,2) NOT NULL,
);
GO

PRINT 'CREATING TABLE COMPRA_ITEM'
CREATE TABLE compra_item(

	nro_compra DECIMAL(18,0),
	nro_item DECIMAL(18,0),
	codigo_autoparte DECIMAL(18,0) NOT NULL,
	cantidad DECIMAL(18,0) NOT NULL DEFAULT 1,
	precio DECIMAL(18,2) NOT NULL,
	PRIMARY KEY(nro_compra, nro_item)

);
GO

PRINT 'CREATING TABLE FABRICANTE'
CREATE TABLE fabricante(

	id_fabricante DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255) NOT NULL,

);
GO

PRINT 'CREATING TABLE FACTURA'
CREATE TABLE factura(

	nro_factura DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	fecha DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
	id_cliente DECIMAL(18,0) NOT NULL,
	id_sucursal DECIMAL(18,0) NOT NULL,

);
GO

PRINT 'CREATING TABLE FACTURA_AUTO'
CREATE TABLE factura_auto(
	nro_factura DECIMAL(18,0) PRIMARY KEY,
	patente_auto NVARCHAR(50) NOT NULL,
	precio_facturado DECIMAL(18,2) NOT NULL,
);
GO

PRINT 'CREATING TABLE FACTURA_ITEM'
CREATE TABLE factura_item(
	nro_factura DECIMAL(18,0),
	nro_item DECIMAL(18,0),
	codigo_autoparte DECIMAL(18,0) NOT NULL,
	cant DECIMAL(18,0) NOT NULL DEFAULT 1,
	precio DECIMAL(18,2) NOT NULL, -- Precio total
	PRIMARY KEY(nro_factura, nro_item)
);
GO

PRINT 'CREATING TABLE MODELO'
CREATE TABLE modelo(
	modelo_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255) NOT NULL,
	potencia DECIMAL(18,0) NOT NULL
);
GO

PRINT 'CREATING TABLE SUCURSAL'
CREATE TABLE sucursal(

	id_sucursal DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	direccion NVARCHAR(255) NOT NULL,
	mail NVARCHAR(255) NOT NULL,
	telefono DECIMAL(18,0) NOT NULL,
	ciudad NVARCHAR(255) NOT NULL
);
GO

PRINT 'CREATING TABLE TIPO_AUTO'
CREATE TABLE tipo_auto(
	tipo_auto_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

PRINT 'CREATING TABLE TIPO_CAJA'
CREATE TABLE tipo_caja(
	tipo_caja_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

PRINT 'CREATING TABLE TIPO_TRANSMISIÓN'
CREATE TABLE tipo_transmision(
	tipo_transmision_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE AUTO'
ALTER TABLE auto 
	ADD FOREIGN KEY (tipo_auto_codigo) REFERENCES tipo_auto(tipo_auto_codigo),
		FOREIGN KEY (tipo_transmision_codigo) REFERENCES tipo_transmision(tipo_transmision_codigo),
		FOREIGN KEY (tipo_caja_codigo) REFERENCES tipo_caja(tipo_caja_codigo),
		FOREIGN KEY (modelo_codigo) REFERENCES modelo(modelo_codigo),
		FOREIGN KEY (id_fabricante) REFERENCES fabricante(id_fabricante);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE AUTOPARTE'
ALTER TABLE autoparte
	ADD	FOREIGN KEY (modelo_codigo) REFERENCES modelo(modelo_codigo),
		FOREIGN KEY (id_fabricante) REFERENCES fabricante(id_fabricante);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE COMPRA'
ALTER TABLE compra
	ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
		FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE COMPRA_AUTO'
ALTER TABLE compra_auto
	ADD FOREIGN KEY (nro_compra) REFERENCES compra(nro_compra),
		FOREIGN KEY (patente_auto) REFERENCES auto(patente_auto);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE COMPRA_ITEM'
ALTER TABLE compra_item
	ADD FOREIGN KEY (nro_compra) REFERENCES compra(nro_compra),
		FOREIGN KEY (codigo_autoparte) REFERENCES autoparte(codigo_autoparte);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE FACTURA'
ALTER TABLE factura
	ADD FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
		FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE FACTURA_AUTO'
ALTER TABLE factura_auto
	ADD FOREIGN KEY (nro_factura) REFERENCES factura(nro_factura),
		FOREIGN KEY (patente_auto) REFERENCES auto(patente_auto);
GO

PRINT 'ADDING CONSTRAINTS TO TABLE FACTURA_ITEM'
ALTER TABLE factura_item
	ADD FOREIGN KEY (nro_factura) REFERENCES factura(nro_factura),
		FOREIGN KEY (codigo_autoparte) REFERENCES autoparte(codigo_autoparte);
GO


PRINT 'CREATING PROCEDURE FOR MIGRATING MODELO' 
GO
CREATE PROCEDURE migrar_modelo AS
BEGIN
	SET IDENTITY_INSERT modelo ON
	INSERT INTO modelo (modelo_codigo, nombre, potencia)
		SELECT DISTINCT modelo_codigo, modelo_nombre, modelo_potencia FROM gd_esquema.Maestra
	SET IDENTITY_INSERT modelo OFF
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING FABRICANTE' 
GO
CREATE PROCEDURE migrar_fabricante AS
BEGIN
	INSERT INTO fabricante (nombre)
		SELECT DISTINCT fabricante_nombre FROM gd_esquema.Maestra ORDER BY fabricante_nombre

END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING CLIENTE' 
GO
CREATE PROCEDURE migrar_cliente AS
BEGIN
	INSERT INTO cliente (dni, apellido, nombre, direccion, fecha_nac, mail)
		SELECT DISTINCT	cliente_dni, cliente_apellido, cliente_nombre, cliente_direccion, cliente_fecha_nac, cliente_mail FROM gd_esquema.Maestra WHERE cliente_dni IS NOT NULL
		UNION
		SELECT DISTINCT	fac_cliente_dni, fac_cliente_apellido, fac_cliente_nombre, fac_cliente_direccion, fac_cliente_fecha_nac, fac_cliente_mail FROM gd_esquema.Maestra WHERE fac_cliente_dni IS NOT NULL
		
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING SUCURSAL' 
GO
CREATE PROCEDURE migrar_sucursal AS
BEGIN

	INSERT INTO sucursal (direccion, mail,  telefono, ciudad)
		SELECT DISTINCT sucursal_direccion, sucursal_mail, sucursal_telefono, sucursal_ciudad FROM gd_esquema.Maestra WHERE sucursal_direccion IS NOT NULL
		UNION
		SELECT DISTINCT fac_sucursal_direccion, fac_sucursal_mail, fac_sucursal_telefono, fac_sucursal_ciudad FROM gd_esquema.Maestra WHERE fac_sucursal_direccion IS NOT NULL


END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING TIPO_AUTO' 
GO
CREATE PROCEDURE migrar_tipo_auto AS
BEGIN

	SET IDENTITY_INSERT tipo_auto ON
	INSERT INTO tipo_auto (tipo_auto_codigo, descripcion)
		SELECT DISTINCT tipo_auto_codigo, tipo_auto_desc FROM gd_esquema.Maestra WHERE tipo_auto_codigo IS NOT NULL ORDER BY tipo_auto_codigo 
	SET IDENTITY_INSERT tipo_auto OFF
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING TRANSMISIÓN' 
GO
CREATE PROCEDURE migrar_tipo_transmision AS
BEGIN

	SET IDENTITY_INSERT tipo_transmision ON
	INSERT INTO tipo_transmision (tipo_transmision_codigo, descripcion)
		SELECT DISTINCT tipo_transmision_codigo, tipo_transmision_desc FROM gd_esquema.Maestra WHERE tipo_transmision_codigo IS NOT NULL ORDER BY tipo_transmision_codigo 
	SET IDENTITY_INSERT tipo_transmision OFF
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING TIPO_CAJA' 
GO
CREATE PROCEDURE migrar_tipo_caja AS
BEGIN

	SET IDENTITY_INSERT tipo_caja ON
	INSERT INTO tipo_caja (tipo_caja_codigo, descripcion)
		SELECT DISTINCT tipo_caja_codigo, tipo_caja_desc FROM gd_esquema.Maestra WHERE tipo_caja_codigo IS NOT NULL ORDER BY tipo_caja_codigo 
	SET IDENTITY_INSERT tipo_caja OFF
END
GO

CREATE FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE(@nombre NVARCHAR(255)) RETURNS DECIMAL(18,0) AS
BEGIN

	DECLARE @id_fabricante DECIMAL(18,0);

	SELECT @id_fabricante = id_fabricante FROM fabricante WHERE nombre = @nombre;

	RETURN @id_fabricante;
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING AUTO' 
GO
CREATE PROCEDURE migrar_auto AS
BEGIN

	INSERT INTO auto (patente_auto, nro_chasis, nro_motor, fecha_alta, cant_kms,tipo_auto_codigo, tipo_motor_codigo, tipo_transmision_codigo, tipo_caja_codigo, modelo_codigo, id_fabricante)
		SELECT DISTINCT auto_patente, auto_nro_chasis, auto_nro_motor, auto_fecha_alta, auto_cant_kms, tipo_auto_codigo, tipo_motor_codigo, tipo_transmision_codigo, tipo_caja_codigo, modelo_codigo, EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE(fabricante_nombre) FROM gd_esquema.Maestra WHERE auto_patente IS NOT NULL
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING AUTOPARTE' 
GO
CREATE PROCEDURE migrar_autoparte AS
BEGIN
	
	SET IDENTITY_INSERT autoparte ON
	INSERT INTO autoparte (codigo_autoparte, descripcion, categoria, id_fabricante, modelo_codigo)
		SELECT DISTINCT auto_parte_codigo, auto_parte_descripcion, NULL, EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE(fabricante_nombre), modelo_codigo FROM gd_esquema.Maestra WHERE auto_parte_codigo IS NOT NULL
	SET IDENTITY_INSERT autoparte OFF
END
GO

CREATE FUNCTION OBTENER_ID_CLIENTE(@DNI DECIMAL(18,0), @apellido NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN

	DECLARE @id_cliente DECIMAL(18,0);

	SELECT @id_cliente = id_cliente FROM cliente WHERE dni = @DNI AND apellido = @apellido;

	RETURN @id_cliente;
	

END
GO

CREATE FUNCTION OBTENER_ID_SUCURSAL(@direccion NVARCHAR(255)) RETURNS DECIMAL (18,0) AS
BEGIN

	DECLARE @id_sucursal DECIMAL(18,0);

	SELECT @id_sucursal = id_sucursal FROM sucursal WHERE direccion = @direccion;

	RETURN @id_sucursal;
	

END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING COMPRA' 
GO
CREATE PROCEDURE migrar_compra AS
BEGIN

	SET IDENTITY_INSERT compra ON

	SELECT DISTINCT compra_nro, compra_fecha, sucursal_direccion, cliente_dni, cliente_apellido INTO #temp_compras 
		FROM gd_esquema.Maestra WHERE compra_nro IS NOT NULL

	INSERT INTO compra (nro_compra, fecha, id_sucursal, id_cliente)
		SELECT compra_nro, compra_fecha, EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL(sucursal_direccion), EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE(cliente_dni, cliente_apellido) 
			FROM #temp_compras

	DROP TABLE #temp_compras
	SET IDENTITY_INSERT compra OFF
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING COMPRA_AUTO' 
GO
CREATE PROCEDURE migrar_compra_auto AS
BEGIN

	INSERT INTO compra_auto (nro_compra, patente_auto, precio)
		SELECT DISTINCT compra_nro, auto_patente, compra_precio FROM gd_esquema.Maestra WHERE compra_nro IS NOT NULL AND auto_patente IS NOT NULL;
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING COMPRA_ITEM' 
GO
CREATE PROCEDURE migrar_compra_item AS
BEGIN

	DECLARE @nro_compra DECIMAL(18,0);
	DECLARE @codigo_autoparte DECIMAL(18,0);
	DECLARE @compra_cant DECIMAL(18,0);
	DECLARE @compra_precio DECIMAL(18,0);

	DECLARE @compra_actual DECIMAL(18,0);
	SET @compra_actual = NULL

	DECLARE @nro_item DECIMAL(18,0);
	SET @nro_item = 0;

	DECLARE items CURSOR LOCAL FORWARD_ONLY READ_ONLY
		FOR SELECT compra_nro, auto_parte_codigo, compra_cant, compra_precio FROM gd_esquema.Maestra WHERE compra_nro IS NOT NULL AND auto_parte_codigo IS NOT NULL ORDER BY compra_nro;

	OPEN items 

	FETCH items INTO @nro_compra, @codigo_autoparte, @compra_cant, @compra_precio

	WHILE @@FETCH_STATUS = 0
	BEGIN

		IF (@nro_compra != @compra_actual)
			SET @nro_item = 0
			SET @compra_actual = @nro_compra

		SET @nro_item += 1;

		INSERT INTO compra_item (nro_compra, nro_item, codigo_autoparte, cantidad, precio)
			VALUES (@nro_compra, @nro_item, @codigo_autoparte, @compra_cant, @compra_precio)

		FETCH items INTO @nro_compra, @codigo_autoparte, @compra_cant, @compra_precio
	END
	CLOSE items
	DEALLOCATE items
		
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING FACTURA' 
GO
CREATE PROCEDURE migrar_factura AS 
BEGIN

	SET IDENTITY_INSERT factura ON

	SELECT DISTINCT factura_nro, factura_fecha, fac_sucursal_direccion, fac_cliente_dni, fac_cliente_apellido INTO #temp_factura
		FROM gd_esquema.Maestra WHERE factura_nro IS NOT NULL


	INSERT INTO factura (nro_factura, fecha, id_sucursal, id_cliente)
		SELECT factura_nro, factura_fecha, EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL(fac_sucursal_direccion), EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE(fac_cliente_dni, fac_cliente_apellido) 
			FROM #temp_factura

	DROP TABLE #temp_factura
	SET IDENTITY_INSERT factura OFF

END
GO


PRINT 'CREATING PROCEDURE FOR MIGRATING FACTURA_AUTO' 
GO
CREATE PROCEDURE migrar_factura_auto AS
BEGIN
	
	INSERT INTO factura_auto (nro_factura, patente_auto, precio_facturado)
			SELECT DISTINCT factura_nro, auto_patente, precio_facturado FROM gd_esquema.Maestra WHERE factura_nro IS NOT NULL AND auto_patente IS NOT NULL;
	
END
GO

PRINT 'CREATING PROCEDURE FOR MIGRATING FACTURA_ITEM' 
GO
CREATE PROCEDURE migrar_factura_item AS
BEGIN

	DECLARE @nro_factura DECIMAL(18,0);
	DECLARE @codigo_autoparte DECIMAL(18,0);
	DECLARE @cant DECIMAL(18,0);
	DECLARE @precio DECIMAL(18,0);

	DECLARE @factura_actual DECIMAL(18,0);
	SET @factura_actual = NULL

	DECLARE @nro_item DECIMAL(18,0);
	SET @nro_item = 0;

	DECLARE items CURSOR LOCAL FORWARD_ONLY READ_ONLY
		FOR SELECT factura_nro, auto_parte_codigo, cant_facturada, precio_facturado FROM gd_esquema.Maestra WHERE factura_nro IS NOT NULL AND auto_parte_codigo IS NOT NULL ORDER BY factura_nro;

	OPEN items 

	FETCH items INTO @nro_factura, @codigo_autoparte, @cant, @precio

	WHILE @@FETCH_STATUS = 0
	BEGIN

		IF (@nro_factura != @factura_actual)
			SET @nro_item = 0
			SET @factura_actual = @nro_factura

		SET @nro_item += 1;

		INSERT INTO factura_item(nro_factura, nro_item, codigo_autoparte, cant, precio)
			VALUES (@nro_factura, @nro_item, @codigo_autoparte, @cant, @precio)

		FETCH items INTO @nro_factura, @codigo_autoparte, @cant, @precio
	END
	CLOSE items
	DEALLOCATE items
		
END
GO

CREATE TABLE logs (
	table_name VARCHAR(15),
	duration INT,
	fecha DATETIME default GETDATE(),
);
GO

CREATE PROCEDURE insert_log @table_name VARCHAR(15), @init TIME, @end TIME AS
BEGIN
	INSERT into logs (table_name, duration) SELECT @table_name, DATEDIFF(SECOND, @init, @end);
END
GO

CREATE INDEX ix1_sucursal ON sucursal(direccion)
CREATE INDEX ix1_cliente ON cliente(dni, apellido)

DECLARE @init TIME;
DECLARE @end TIME;

PRINT 'STARTING MIGRATION OF TABLE FABRICANTE'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_fabricante;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'fabricante', @init, @end

PRINT 'STARTING MIGRATION OF TABLE CLIENTE'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_cliente;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'cliente', @init, @end

PRINT 'STARTING MIGRATION OF TABLE SUCURSAL'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_sucursal;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'sucursal', @init, @end

PRINT 'STARTING MIGRATION OF TABLE TIPO_AUTO'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_tipo_auto;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'tipo_auto', @init, @end

PRINT 'STARTING MIGRATION OF TABLE TIPO_TRANSMISIÓN'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_tipo_transmision;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'tipo_transmision', @init, @end

PRINT 'STARTING MIGRATION OF TABLE TIPO_CAJA'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_tipo_caja;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'tipo_caja', @init, @end

PRINT 'STARTING MIGRATION OF TABLE MODELO'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_modelo;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'modelo', @init, @end

PRINT 'STARTING MIGRATION OF TABLE AUTO'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_auto;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'auto', @init, @end

PRINT 'STARTING MIGRATION OF TABLE AUTOPARTE'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_autoparte;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'autoparte', @init, @end

PRINT 'STARTING MIGRATION OF TABLE COMPRA'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_compra;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'compra', @init, @end

PRINT 'STARTING MIGRATION OF TABLE COMPRA_AUTO'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_compra_auto;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'compra_auto', @init, @end

PRINT 'STARTING MIGRATION OF TABLE COMPRA_ITEM'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_compra_item;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'compra_item', @init, @end

PRINT 'STARTING MIGRATION OF TABLE FACTURA'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_factura;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'factura', @init, @end

PRINT 'STARTING MIGRATION OF TABLE FACTURA_AUTO'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_factura_auto;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'factura_auto', @init, @end

PRINT 'STARTING MIGRATION OF TABLE FACTURA_ITEM'
SET @init = CAST(GETDATE() AS TIME);
EXEC migrar_factura_item;
SET @end = CAST(GETDATE() AS TIME);
EXEC insert_log 'factura_item', @init, @end


SELECT * FROM logs

