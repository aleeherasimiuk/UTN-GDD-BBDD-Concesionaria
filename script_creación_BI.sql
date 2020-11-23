USE [GD2C2020]
GO


IF OBJECT_ID('EMPANADA_DE_MONDONGO.EDAD') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.EDAD;
GO

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
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O')),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	tipo_auto_codigo DECIMAL(18),
	tipo_transmision_codigo DECIMAL(18),
	tipo_caja_codigo DECIMAL(18),
	tipo_motor DECIMAL(18),
	cantidad_cambios DECIMAL(18),
	cantidad_vendida DECIMAL(18),
	total_vendido DECIMAL(18,2)
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
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O')),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50) NULL,
	codigo_autoparte DECIMAL(18),
	cantidad_comprada DECIMAL(18),
	total_comprado DECIMAL(18,2),
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante)
);
GO


CREATE TABLE EMPANADA_DE_MONDONGO.bi_venta_autopartes(

	id_tiempo DECIMAL(18),
	id_sucursal DECIMAL(18),
	modelo_codigo DECIMAL(18),
	id_edad DECIMAL(18),
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O')),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50) NULL,
	codigo_autoparte DECIMAL(18),
	cantidad_vendida DECIMAL(18),
	total_vendido DECIMAL(18,2)
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante)

);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_stock_autopartes(

	id_tiempo DECIMAL(18),
	id_sucursal DECIMAL(18),
	modelo_codigo DECIMAL(18),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50) NULL,
	codigo_autoparte DECIMAL(18),
	stock DECIMAL(18),
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_potencia, id_fabricante)
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

EXEC EMPANADA_DE_MONDONGO.bi_cargar_edad
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_potencia AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_potencia (rango)
		VALUES 	('50-150cv'),
				('151-300cv'),
				('> 300cv')
END
GO

EXEC EMPANADA_DE_MONDONGO.bi_cargar_potencia
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

EXEC EMPANADA_DE_MONDONGO.bi_cargar_tiempo
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


CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_compra_autos AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_compra_autos  (id_tiempo, id_sucursal, modelo_codigo, id_edad, sexo, id_potencia, id_fabricante,
		tipo_auto_codigo, tipo_transmision_codigo, tipo_caja_codigo, tipo_motor, cantidad_cambios, cantidad_comprada, total_comprado)
		SELECT EMPANADA_DE_MONDONGO.ID_TIEMPO(c.fecha), c.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac), 'N',
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo, 0, 'Desconocido', COUNT(DISTINCT c.nro_compra), SUM(ca.precio)

		FROM EMPANADA_DE_MONDONGO.compra c	JOIN EMPANADA_DE_MONDONGO.compra_auto ca ON c.nro_compra = ca.nro_compra
											JOIN EMPANADA_DE_MONDONGO.cliente cl ON cl.id_cliente = c.id_cliente
											JOIN EMPANADA_DE_MONDONGO.auto a ON a.patente_auto = ca.patente_auto
											JOIN EMPANADA_DE_MONDONGO.modelo m ON m.modelo_codigo = a.modelo_codigo
		GROUP BY EMPANADA_DE_MONDONGO.ID_TIEMPO(c.fecha), c.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac),
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo

END
GO
