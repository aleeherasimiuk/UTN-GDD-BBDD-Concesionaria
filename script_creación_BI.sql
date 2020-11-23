USE [GD2C2020]
GO


--Borrado de Tablas

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_compra_autos','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_compra_autos;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_venta_autos','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_venta_autos;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_compra_autopartes','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_compra_autopartes;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_venta_autopartes','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_venta_autopartes;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_stock_autopartes','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_stock_autopartes;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_modelo','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_modelo;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_tipo_caja','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_tipo_caja;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_tipo_transmision','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_tipo_transmision;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_tipo_auto','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_tipo_auto;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_sucursal','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_sucursal;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_fabricante','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_fabricante;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_edad','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_edad;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_autoparte','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_autoparte;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_potencia','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_potencia;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_tiempo','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_tiempo;

  --Borrado de Funciones

  IF OBJECT_ID('EMPANADA_DE_MONDONGO.ID_TIEMPO') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.ID_TIEMPO;

  IF OBJECT_ID('EMPANADA_DE_MONDONGO.RANGO_EDAD') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.RANGO_EDAD;

  IF OBJECT_ID('EMPANADA_DE_MONDONGO.RANGO_POTENCIA') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.RANGO_POTENCIA;


  -- Borrado de Stored Procedures

  IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_migrar_sucursal') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_sucursal;

   IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_migrar_tipo_auto') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_tipo_auto;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_migrar_tipo_transmision') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_tipo_transmision;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_migrar_tipo_caja') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_tipo_caja;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_migrar_modelo') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_modelo;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_migrar_fabricante') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_fabricante;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_migrar_autoparte') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_autoparte;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_edad') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_edad;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_potencia') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_potencia;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_tiempo') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_tiempo;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_compra_autos') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_compra_autos;


GO

-- Usar check en la fact table de sexo.

CREATE TABLE EMPANADA_DE_MONDONGO.bi_edad(

	id_edad DECIMAL(18) PRIMARY KEY IDENTITY(1,1),
	rango NVARCHAR(50) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_sucursal(

	id_sucursal DECIMAL(18,0) PRIMARY KEY,
	direccion NVARCHAR(255) NOT NULL,
	mail NVARCHAR(255) NOT NULL,
	telefono DECIMAL(18,0) NOT NULL,
	ciudad NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tipo_auto(
	tipo_auto_codigo DECIMAL(18,0) PRIMARY KEY,
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tipo_caja(
	tipo_caja_codigo DECIMAL(18,0) PRIMARY KEY,
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tipo_transmision(
	tipo_transmision_codigo DECIMAL(18,0) PRIMARY KEY,
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_modelo(
	modelo_codigo DECIMAL(18,0) PRIMARY KEY,
	nombre NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_fabricante(

	id_fabricante DECIMAL(18,0) PRIMARY KEY ,
	nombre NVARCHAR(255) NOT NULL,

);
GO
 
CREATE TABLE EMPANADA_DE_MONDONGO.bi_autoparte(

	codigo_autoparte DECIMAL(18,0) PRIMARY KEY,
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_potencia(

	id_potencia DECIMAL(18) PRIMARY KEY IDENTITY(1,1),
	rango NVARCHAR(50) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tiempo(

	id_tiempo DECIMAL(18) PRIMARY KEY IDENTITY(1,1),
	agno DECIMAL(4) NOT NULL,
	mes DECIMAL(2) NOT NULL
);
GO


CREATE TABLE EMPANADA_DE_MONDONGO.bi_compra_autos(

	id_tiempo DECIMAL(18),
	id_sucursal DECIMAL(18),
	modelo_codigo DECIMAL(18),
	id_edad DECIMAL(18),
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O', 'N')),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	tipo_auto_codigo DECIMAL(18),
	tipo_transmision_codigo DECIMAL(18),
	tipo_caja_codigo DECIMAL(18),
	tipo_motor DECIMAL(18),
	cantidad_cambios DECIMAL(18),
	cantidad_comprada DECIMAL(18),
	total_comprado DECIMAL(18,2),
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante, tipo_auto_codigo, 
	tipo_transmision_codigo, tipo_caja_codigo, tipo_motor, cantidad_cambios)

);
GO


CREATE TABLE EMPANADA_DE_MONDONGO.bi_venta_autos(

	id_tiempo DECIMAL(18),
	id_sucursal DECIMAL(18),
	modelo_codigo DECIMAL(18),
	id_edad DECIMAL(18),
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O', 'N')),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	tipo_auto_codigo DECIMAL(18),
	tipo_transmision_codigo DECIMAL(18),
	tipo_caja_codigo DECIMAL(18),
	tipo_motor DECIMAL(18),
	cantidad_cambios DECIMAL(18),
	cantidad_vendida DECIMAL(18),
	total_vendido DECIMAL(18,2),
	tiempo_stock_promedio DECIMAL(18)
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante, tipo_auto_codigo, 
	tipo_transmision_codigo, tipo_caja_codigo, tipo_motor, cantidad_cambios)
);
GO


CREATE TABLE EMPANADA_DE_MONDONGO.bi_compra_autopartes(

	id_tiempo DECIMAL(18),
	id_sucursal DECIMAL(18),
	modelo_codigo DECIMAL(18),
	id_edad DECIMAL(18),
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O', 'N')),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50),
	codigo_autoparte DECIMAL(18),
	cantidad_comprada DECIMAL(18),
	total_comprado DECIMAL(18,2),
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante, categoria)
);
GO


CREATE TABLE EMPANADA_DE_MONDONGO.bi_venta_autopartes(

	id_tiempo DECIMAL(18),
	id_sucursal DECIMAL(18),
	modelo_codigo DECIMAL(18),
	id_edad DECIMAL(18),
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O', 'N')),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50),
	codigo_autoparte DECIMAL(18),
	cantidad_vendida DECIMAL(18),
	total_vendido DECIMAL(18,2)
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante, categoria)

);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_stock_autopartes(

	id_tiempo DECIMAL(18),
	id_sucursal DECIMAL(18),
	modelo_codigo DECIMAL(18),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50),
	codigo_autoparte DECIMAL(18),
	stock DECIMAL(18),
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_potencia, id_fabricante, categoria)
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tiempo_stock_autopartes(

	modelo_codigo DECIMAL(18),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50),
	codigo_autoparte DECIMAL(18),
	tiempo_stock DECIMAL(18),
	PRIMARY KEY (modelo_codigo,	id_potencia, id_fabricante, categoria)
);
GO

ALTER TABLE EMPANADA_DE_MONDONGO.bi_compra_autos
	ADD FOREIGN KEY (id_tiempo) REFERENCES EMPANADA_DE_MONDONGO.bi_tiempo,
		FOREIGN KEY (id_sucursal) REFERENCES EMPANADA_DE_MONDONGO.bi_sucursal,
		FOREIGN KEY (modelo_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_modelo,
		FOREIGN KEY (id_edad) REFERENCES EMPANADA_DE_MONDONGO.bi_edad,
		FOREIGN KEY (id_potencia) REFERENCES EMPANADA_DE_MONDONGO.bi_potencia,
		FOREIGN KEY (id_fabricante) REFERENCES EMPANADA_DE_MONDONGO.bi_fabricante,
		FOREIGN KEY (tipo_auto_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_tipo_auto,
		FOREIGN KEY (tipo_transmision_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_tipo_transmision,
		FOREIGN KEY (tipo_caja_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_tipo_caja;

ALTER TABLE EMPANADA_DE_MONDONGO.bi_venta_autos
	ADD FOREIGN KEY (id_tiempo) REFERENCES EMPANADA_DE_MONDONGO.bi_tiempo,
		FOREIGN KEY (id_sucursal) REFERENCES EMPANADA_DE_MONDONGO.bi_sucursal,
		FOREIGN KEY (modelo_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_modelo,
		FOREIGN KEY (id_edad) REFERENCES EMPANADA_DE_MONDONGO.bi_edad,
		FOREIGN KEY (id_potencia) REFERENCES EMPANADA_DE_MONDONGO.bi_potencia,
		FOREIGN KEY (id_fabricante) REFERENCES EMPANADA_DE_MONDONGO.bi_fabricante,
		FOREIGN KEY (tipo_auto_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_tipo_auto,
		FOREIGN KEY (tipo_transmision_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_tipo_transmision,
		FOREIGN KEY (tipo_caja_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_tipo_caja;

ALTER TABLE EMPANADA_DE_MONDONGO.bi_compra_autopartes
	ADD FOREIGN KEY (id_tiempo) REFERENCES EMPANADA_DE_MONDONGO.bi_tiempo,
		FOREIGN KEY (id_sucursal) REFERENCES EMPANADA_DE_MONDONGO.bi_sucursal,
		FOREIGN KEY (modelo_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_modelo,
		FOREIGN KEY (id_edad) REFERENCES EMPANADA_DE_MONDONGO.bi_edad,
		FOREIGN KEY (id_potencia) REFERENCES EMPANADA_DE_MONDONGO.bi_potencia,
		FOREIGN KEY (id_fabricante) REFERENCES EMPANADA_DE_MONDONGO.bi_fabricante,
		FOREIGN KEY (codigo_autoparte) REFERENCES EMPANADA_DE_MONDONGO.bi_autoparte;


ALTER TABLE EMPANADA_DE_MONDONGO.bi_venta_autopartes
	ADD FOREIGN KEY (id_tiempo) REFERENCES EMPANADA_DE_MONDONGO.bi_tiempo,
		FOREIGN KEY (id_sucursal) REFERENCES EMPANADA_DE_MONDONGO.bi_sucursal,
		FOREIGN KEY (modelo_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_modelo,
		FOREIGN KEY (id_edad) REFERENCES EMPANADA_DE_MONDONGO.bi_edad,
		FOREIGN KEY (id_potencia) REFERENCES EMPANADA_DE_MONDONGO.bi_potencia,
		FOREIGN KEY (id_fabricante) REFERENCES EMPANADA_DE_MONDONGO.bi_fabricante,
		FOREIGN KEY (codigo_autoparte) REFERENCES EMPANADA_DE_MONDONGO.bi_autoparte;

ALTER TABLE EMPANADA_DE_MONDONGO.bi_stock_autopartes
	ADD FOREIGN KEY (id_tiempo) REFERENCES EMPANADA_DE_MONDONGO.bi_tiempo,
		FOREIGN KEY (id_sucursal) REFERENCES EMPANADA_DE_MONDONGO.bi_sucursal,
		FOREIGN KEY (modelo_codigo) REFERENCES EMPANADA_DE_MONDONGO.bi_modelo,
		FOREIGN KEY (id_potencia) REFERENCES EMPANADA_DE_MONDONGO.bi_potencia,
		FOREIGN KEY (id_fabricante) REFERENCES EMPANADA_DE_MONDONGO.bi_fabricante,
		FOREIGN KEY (codigo_autoparte) REFERENCES EMPANADA_DE_MONDONGO.bi_autoparte;

GO

------ CARGA DIMENSIONES --------

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_sucursal AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_sucursal (id_sucursal, direccion, mail, telefono, ciudad)
		SELECT id_sucursal, direccion, mail, telefono, ciudad FROM EMPANADA_DE_MONDONGO.sucursal
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_tipo_auto AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_tipo_auto (tipo_auto_codigo, descripcion)
		SELECT tipo_auto_codigo, descripcion FROM EMPANADA_DE_MONDONGO.tipo_auto
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_tipo_transmision AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_tipo_transmision (tipo_transmision_codigo, descripcion)
		SELECT tipo_transmision_codigo, descripcion FROM EMPANADA_DE_MONDONGO.tipo_transmision
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_tipo_caja AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_tipo_caja (tipo_caja_codigo, descripcion)
		SELECT tipo_caja_codigo, descripcion FROM EMPANADA_DE_MONDONGO.tipo_caja
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_modelo AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_modelo (modelo_codigo, nombre)
		SELECT modelo_codigo, nombre FROM EMPANADA_DE_MONDONGO.modelo
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_fabricante AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_fabricante (id_fabricante, nombre)
		SELECT id_fabricante, nombre FROM EMPANADA_DE_MONDONGO.fabricante
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_migrar_autoparte AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_autoparte (codigo_autoparte, descripcion)
		SELECT codigo_autoparte, descripcion FROM EMPANADA_DE_MONDONGO.autoparte
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_edad AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_edad (rango)
		VALUES 	('18 - 30 años'),
				('31 - 50 años'),
				('> 50 años')
END
GO



CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_potencia AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_potencia (rango)
		VALUES 	('50-150cv'),
				('151-300cv'),
				('> 300cv')
END
GO



CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_tiempo AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_tiempo (agno, mes)
		SELECT DISTINCT YEAR(fecha), MONTH(fecha)
		FROM EMPANADA_DE_MONDONGO.compra
		UNION
		SELECT DISTINCT YEAR(fecha), MONTH(fecha)
		FROM EMPANADA_DE_MONDONGO.factura
		
END
GO


----- Cargar tablas de hecho  --------


CREATE FUNCTION EMPANADA_DE_MONDONGO.ID_TIEMPO(@fecha DATE) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @agno DECIMAL(4),
			@mes DECIMAL(2),
			@id_tiempo DECIMAL(18)

	SET @agno = DATEPART(YEAR, @fecha)
	SET @mes = DATEPART(MONTH, @fecha)

	SELECT @id_tiempo = id_tiempo FROM EMPANADA_DE_MONDONGO.bi_tiempo WHERE agno = @agno AND mes = @mes

	RETURN @id_tiempo
END
GO

CREATE FUNCTION EMPANADA_DE_MONDONGO.RANGO_EDAD(@FECHA_NACIMIENTO DATE) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @id_edad DECIMAL(18);
	DECLARE @HOY DATE;
	DECLARE @EDAD INT;
	SET @HOY = GETDATE();
	SET @EDAD = (DATEDIFF(DAY, @FECHA_NACIMIENTO, @HOY) / 365)

	IF @EDAD BETWEEN 18 AND 30
		SELECT @id_edad = id_edad FROM EMPANADA_DE_MONDONGO.bi_edad WHERE rango = '18 - 30 años'
	ELSE IF @EDAD BETWEEN 31 AND 50
		SELECT @id_edad = id_edad FROM EMPANADA_DE_MONDONGO.bi_edad WHERE rango = '31 - 50 años'
	ELSE
		SELECT @id_edad = id_edad FROM EMPANADA_DE_MONDONGO.bi_edad WHERE rango = '> 50 años'


	RETURN @id_edad;

END
GO

CREATE FUNCTION EMPANADA_DE_MONDONGO.RANGO_POTENCIA(@POTENCIA DECIMAL(18)) RETURNS DECIMAL(18) AS
BEGIN
	DECLARE @id_potencia DECIMAL(18);

	IF @POTENCIA BETWEEN 50 AND 150
		SELECT @id_potencia = id_potencia FROM EMPANADA_DE_MONDONGO.bi_potencia WHERE rango = '50-150cv'
	ELSE IF @POTENCIA BETWEEN 151 AND 300
		SELECT @id_potencia = id_potencia FROM EMPANADA_DE_MONDONGO.bi_potencia WHERE rango = '151-300cv'
	ELSE
		SELECT @id_potencia = id_potencia FROM EMPANADA_DE_MONDONGO.bi_potencia WHERE rango = '> 300cv'


	RETURN @id_potencia;

END
GO




CREATE FUNCTION EMPANADA_DE_MONDONGO.DIAS_EN_STOCK_AUTO(@patente_auto NVARCHAR(255)) RETURNS INT AS
BEGIN
	DECLARE @dias_en_stock INT

	SELECT @dias_en_stock = DATEDIFF(DAY, c.fecha, f.fecha) 
	FROM EMPANADA_DE_MONDONGO.compra c JOIN EMPANADA_DE_MONDONGO.compra_auto ca ON ca.nro_compra = c.nro_compra
									   JOIN EMPANADA_DE_MONDONGO.factura_auto fa ON fa.patente_auto = ca.patente_auto
									   JOIN EMPANADA_DE_MONDONGO.factura f ON f.nro_factura = fa.nro_factura
	WHERE ca.patente_auto = @patente_auto

	RETURN @dias_en_stock
END
GO

CREATE INDEX ix_ci_codigo_autoparte ON EMPANADA_DE_MONDONGO.compra_item (codigo_autoparte);	
CREATE INDEX ix_fi_codigo_autoparte ON EMPANADA_DE_MONDONGO.factura_item (codigo_autoparte);	
GO

CREATE FUNCTION EMPANADA_DE_MONDONGO.DIAS_EN_STOCK_AUTOPARTE(@codigo_autoparte DECIMAL(18)) RETURNS INT AS
BEGIN
	DECLARE @dias_en_stock INT

	SELECT @dias_en_stock = (((DATEDIFF(DAY, '1970-01-01', MIN(f.fecha)) + DATEDIFF(DAY, '1970-01-01', MAX(f.fecha))) / 2)
				-
			((DATEDIFF(DAY, '1970-01-01', MIN(c.fecha)) + DATEDIFF(DAY, '1970-01-01', MAX(c.fecha))) / 2))
	FROM EMPANADA_DE_MONDONGO.compra c JOIN EMPANADA_DE_MONDONGO.compra_item ci ON ci.nro_compra = c.nro_compra
									   JOIN EMPANADA_DE_MONDONGO.factura_item fi ON fi.codigo_autoparte = ci.codigo_autoparte
									   JOIN EMPANADA_DE_MONDONGO.factura f ON f.nro_factura = fi.nro_factura
	WHERE ci.codigo_autoparte = @codigo_autoparte

	RETURN @dias_en_stock
END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_compra_autos AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_compra_autos  (id_tiempo, id_sucursal, modelo_codigo, id_edad, sexo, id_potencia, id_fabricante,
		tipo_auto_codigo, tipo_transmision_codigo, tipo_caja_codigo, tipo_motor, cantidad_cambios, cantidad_comprada, total_comprado)
		SELECT EMPANADA_DE_MONDONGO.ID_TIEMPO(c.fecha), c.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac), 'N',
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo, 0, COUNT(DISTINCT ca.nro_compra), SUM(ca.precio)

		FROM EMPANADA_DE_MONDONGO.compra c	JOIN EMPANADA_DE_MONDONGO.compra_auto ca ON c.nro_compra = ca.nro_compra
											JOIN EMPANADA_DE_MONDONGO.cliente cl ON cl.id_cliente = c.id_cliente
											JOIN EMPANADA_DE_MONDONGO.auto a ON a.patente_auto = ca.patente_auto
											JOIN EMPANADA_DE_MONDONGO.modelo m ON m.modelo_codigo = a.modelo_codigo
		GROUP BY EMPANADA_DE_MONDONGO.ID_TIEMPO(c.fecha), c.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac),
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo

END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_venta_autos AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_venta_autos  (id_tiempo, id_sucursal, modelo_codigo, id_edad, sexo, id_potencia, id_fabricante,
		tipo_auto_codigo, tipo_transmision_codigo, tipo_caja_codigo, tipo_motor, cantidad_cambios, cantidad_vendida, total_vendido, tiempo_stock_promedio)
		SELECT EMPANADA_DE_MONDONGO.ID_TIEMPO(f.fecha), f.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac), 'N',
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo, 0, COUNT(DISTINCT f.nro_factura), SUM(fa.precio), SUM(EMPANADA_DE_MONDONGO.DIAS_EN_STOCK_AUTO(fa.patente_auto)) / COUNT(DISTINCT f.nro_factura)

		FROM EMPANADA_DE_MONDONGO.factura f JOIN EMPANADA_DE_MONDONGO.factura_auto fa ON f.nro_factura = fa.nro_factura
											JOIN EMPANADA_DE_MONDONGO.cliente cl ON cl.id_cliente = f.id_cliente
											JOIN EMPANADA_DE_MONDONGO.auto a ON a.patente_auto = fa.patente_auto
											JOIN EMPANADA_DE_MONDONGO.modelo m ON m.modelo_codigo = a.modelo_codigo
											JOIN EMPANADA_DE_MONDONGO.sucursal s ON s.id_sucursal = f.id_sucursal
	
		GROUP BY EMPANADA_DE_MONDONGO.ID_TIEMPO(f.fecha), f.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac),
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo

END
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_compra_autopartes AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_compra_autopartes (id_tiempo, id_sucursal, modelo_codigo, id_edad, sexo, id_potencia, id_fabricante,
		codigo_autoparte, categoria, cantidad_comprada, total_comprado)

		SELECT EMPANADA_DE_MONDONGO.ID_TIEMPO(c.fecha), c.id_sucursal, ap.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac), 'N',
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), ap.id_fabricante, ap.codigo_autoparte, 'Desconocido', SUM(ci.cantidad), SUM(ci.precio)

		FROM EMPANADA_DE_MONDONGO.compra c	JOIN EMPANADA_DE_MONDONGO.compra_item ci ON c.nro_compra = ci.nro_compra
											JOIN EMPANADA_DE_MONDONGO.cliente cl ON cl.id_cliente = c.id_cliente
											JOIN EMPANADA_DE_MONDONGO.autoparte ap ON ap.codigo_autoparte = ci.codigo_autoparte
											JOIN EMPANADA_DE_MONDONGO.modelo m ON m.modelo_codigo = ap.modelo_codigo
		GROUP BY EMPANADA_DE_MONDONGO.ID_TIEMPO(c.fecha), c.id_sucursal, ap.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac),
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), ap.id_fabricante, ap.codigo_autoparte

END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_tiempo_stock_autopartes AS
BEGIN
	
	--INSERT INTO EMPANADA_DE_MONDONGO.bi_venta_autopartes (id_tiempo, id_sucursal, modelo_codigo, id_edad, sexo, id_potencia, id_fabricante,
		--codigo_autoparte, categoria, cantidad_vendida, total_vendido, tiempo_stock_promedio)
	SELECT ap.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), ap.id_fabricante, ap.codigo_autoparte, 'Desconocido', EMPANADA_DE_MONDONGO.DIAS_EN_STOCK_AUTOPARTE(ap.codigo_autoparte)

	FROM EMPANADA_DE_MONDONGO.factura f JOIN EMPANADA_DE_MONDONGO.factura_item fi ON f.nro_factura = fi.nro_factura
										JOIN EMPANADA_DE_MONDONGO.autoparte ap ON ap.codigo_autoparte = fi.codigo_autoparte
										JOIN EMPANADA_DE_MONDONGO.modelo m ON m.modelo_codigo = ap.modelo_codigo
	GROUP BY ap.modelo_codigo, m.potencia, ap.id_fabricante, ap.codigo_autoparte

END
GO

------ EJECUCION DE SP -------

EXEC EMPANADA_DE_MONDONGO.bi_cargar_edad
GO

EXEC EMPANADA_DE_MONDONGO.bi_cargar_potencia
GO

EXEC EMPANADA_DE_MONDONGO.bi_cargar_tiempo
GO