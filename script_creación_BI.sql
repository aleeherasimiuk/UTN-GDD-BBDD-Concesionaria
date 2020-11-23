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

CREATE FUNCTION EMPANADA_DE_MONDONGO.EDAD(@FECHA_NACIMIENTO DATE) RETURNS INT AS
BEGIN

	DECLARE @HOY DATE;
	DECLARE @EDAD INT;
	SET @HOY = GETDATE();
	SET @EDAD = (DATEDIFF(DAY, @FECHA_NACIMIENTO, @HOY) / 365)
	RETURN @EDAD;

END
GO

-- Usar check en la fact table de sexo.

CREATE TABLE EMPANADA_DE_MONDONGO.bi_edad(

	id_edad DECIMAL(18) PRIMARY KEY IDENTITY(1,1),
	rango NVARCHAR(50) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_sucursal(

	id_sucursal DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	direccion NVARCHAR(255) NOT NULL,
	mail NVARCHAR(255) NOT NULL,
	telefono DECIMAL(18,0) NOT NULL,
	ciudad NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tipo_auto(
	tipo_auto_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tipo_caja(
	tipo_caja_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_tipo_transmision(
	tipo_transmision_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_modelo(
	modelo_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255) NOT NULL,
);
GO

CREATE TABLE EMPANADA_DE_MONDONGO.bi_fabricante(

	id_fabricante DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255) NOT NULL,

);
GO
 
CREATE TABLE EMPANADA_DE_MONDONGO.bi_autoparte(

	codigo_autoparte DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
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
	sexo CHAR(1) CHECK (sexo IN ('F', 'M', 'O')),
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


