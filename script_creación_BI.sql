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

  IF OBJECT_ID('EMPANADA_DE_MONDONGO.DIAS_EN_STOCK_AUTO') IS NOT NULL
  DROP FUNCTION EMPANADA_DE_MONDONGO.DIAS_EN_STOCK_AUTO;

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

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_venta_autos') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_venta_autos;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_compra_autopartes') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_compra_autopartes;

 IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_venta_autopartes') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_venta_autopartes;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_stock_autopartes') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_stock_autopartes;


-- Vistas

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_mov_autos_x_sucursal_y_mes_autos') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_mov_autos_x_sucursal_y_mes_autos;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_promedios_compra_venta_autos') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_promedios_compra_venta_autos;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_ganancias_x_sucursal_mes_autos') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_ganancias_x_sucursal_mes_autos;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_tiempo_promedio_stock_autos') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_tiempo_promedio_stock_autos;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_promedios_compra_venta_autopartes') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_promedios_compra_venta_autopartes;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_ganancias_x_sucursal_mes_autopartes') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_ganancias_x_sucursal_mes_autopartes;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_maxima_cant_stock_x_sucursal') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_maxima_cant_stock_x_sucursal;

GO

-- Indices
IF INDEXPROPERTY(OBJECT_ID('EMPANADA_DE_MONDONGO.compra_item'), 'ix_ci_codigo_autoparte', 'IndexID') IS NOT NULL
  DROP INDEX EMPANADA_DE_MONDONGO.compra_item.ix_ci_codigo_autoparte;

IF INDEXPROPERTY(OBJECT_ID('EMPANADA_DE_MONDONGO.factura_item'), 'ix_fi_codigo_autoparte', 'IndexID') IS NOT NULL
  DROP INDEX EMPANADA_DE_MONDONGO.factura_item.ix_fi_codigo_autoparte;

IF INDEXPROPERTY(OBJECT_ID('EMPANADA_DE_MONDONGO.compra_auto'), 'ix_ca_patente_auto', 'IndexID') IS NOT NULL
  DROP INDEX EMPANADA_DE_MONDONGO.compra_auto.ix_ca_patente_auto;

IF INDEXPROPERTY(OBJECT_ID('EMPANADA_DE_MONDONGO.factura_auto'), 'ix_fa_patente_auto', 'IndexID') IS NOT NULL
  DROP INDEX EMPANADA_DE_MONDONGO.factura_auto.ix_fa_patente_auto;

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
	cantidad_comprada DECIMAL(18),
	total_comprado DECIMAL(18,2),
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante, tipo_auto_codigo, 
	tipo_transmision_codigo, tipo_caja_codigo, tipo_motor)

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
	cantidad_vendida DECIMAL(18),
	total_vendido DECIMAL(18,2),
	tiempo_stock_promedio DECIMAL(18)
	PRIMARY KEY (id_tiempo, id_sucursal, modelo_codigo, 
	id_edad, sexo, id_potencia, id_fabricante, tipo_auto_codigo, 
	tipo_transmision_codigo, tipo_caja_codigo, tipo_motor)
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
	id_edad, sexo, id_potencia, id_fabricante, categoria, codigo_autoparte)
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
	id_edad, sexo, id_potencia, id_fabricante, categoria, codigo_autoparte)

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
	id_potencia, id_fabricante, categoria, codigo_autoparte)
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
CREATE INDEX ix_ca_patente_auto ON EMPANADA_DE_MONDONGO.compra_auto (patente_auto);	
CREATE INDEX ix_fa_patente_auto ON EMPANADA_DE_MONDONGO.factura_auto (patente_auto);	
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_compra_autos AS
BEGIN
	INSERT INTO EMPANADA_DE_MONDONGO.bi_compra_autos  (id_tiempo, id_sucursal, modelo_codigo, id_edad, sexo, id_potencia, id_fabricante,
		tipo_auto_codigo, tipo_transmision_codigo, tipo_caja_codigo, tipo_motor, cantidad_comprada, total_comprado)
		SELECT EMPANADA_DE_MONDONGO.ID_TIEMPO(c.fecha), c.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac), 'N',
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo, COUNT(DISTINCT ca.nro_compra), SUM(ca.precio)

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
		tipo_auto_codigo, tipo_transmision_codigo, tipo_caja_codigo, tipo_motor, cantidad_vendida, total_vendido, tiempo_stock_promedio)
		SELECT EMPANADA_DE_MONDONGO.ID_TIEMPO(f.fecha), f.id_sucursal, a.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac), 'N',
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), a.id_fabricante, a.tipo_auto_codigo, a.tipo_transmision_codigo, a.tipo_caja_codigo,
				a.tipo_motor_codigo, COUNT(DISTINCT f.nro_factura), SUM(fa.precio), SUM(EMPANADA_DE_MONDONGO.DIAS_EN_STOCK_AUTO(fa.patente_auto)) / COUNT(DISTINCT f.nro_factura)

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
		ORDER BY 1,2,3,4,5,6,7

END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_venta_autopartes AS
BEGIN

	INSERT INTO EMPANADA_DE_MONDONGO.bi_venta_autopartes (id_tiempo, id_sucursal, modelo_codigo, id_edad, sexo, id_potencia, id_fabricante,
		codigo_autoparte, categoria, cantidad_vendida, total_vendido)

		SELECT EMPANADA_DE_MONDONGO.ID_TIEMPO(f.fecha), f.id_sucursal, ap.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac), 'N',
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), ap.id_fabricante, ap.codigo_autoparte, 'Desconocido', SUM(fi.cantidad), SUM(fi.precio)

		FROM EMPANADA_DE_MONDONGO.factura f	JOIN EMPANADA_DE_MONDONGO.factura_item fi ON f.nro_factura= fi.nro_factura
											JOIN EMPANADA_DE_MONDONGO.cliente cl ON cl.id_cliente = f.id_cliente
											JOIN EMPANADA_DE_MONDONGO.autoparte ap ON ap.codigo_autoparte = fi.codigo_autoparte
											JOIN EMPANADA_DE_MONDONGO.modelo m ON m.modelo_codigo = ap.modelo_codigo
		GROUP BY EMPANADA_DE_MONDONGO.ID_TIEMPO(f.fecha), f.id_sucursal, ap.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_EDAD(cl.fecha_nac),
				EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), ap.id_fabricante, ap.codigo_autoparte

END
GO

CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_stock_autopartes AS
BEGIN
	-- Carga inicial a la tabla, el stock solo tiene los movimientos por mes
	INSERT INTO EMPANADA_DE_MONDONGO.bi_stock_autopartes (id_tiempo, id_sucursal, modelo_codigo, id_potencia, id_fabricante, codigo_autoparte, categoria, stock)
			SELECT COALESCE(ca.id_tiempo, va.id_tiempo), COALESCE(ca.id_sucursal, va.id_sucursal), COALESCE(ca.modelo_codigo, va.modelo_codigo), COALESCE(ca.id_potencia, va.id_potencia),
			COALESCE(ca.id_fabricante,va.id_fabricante), COALESCE(ca.codigo_autoparte, va.codigo_autoparte), 'Desconocido',
		    COALESCE(ca.cantidad_comprada, 0) - COALESCE(va.cantidad_vendida, 0) AS stock

			FROM (SELECT ca.id_tiempo, ca.id_sucursal, ca.modelo_codigo, ca.id_potencia, ca.id_fabricante, ca.codigo_autoparte, SUM(ca.cantidad_comprada) AS cantidad_comprada
					FROM EMPANADA_DE_MONDONGO.bi_compra_autopartes ca 
					GROUP BY ca.id_tiempo, ca.id_sucursal, ca.modelo_codigo, ca.id_potencia, ca.id_fabricante, ca.codigo_autoparte) ca
					FULL OUTER JOIN (SELECT va.id_tiempo, va.id_sucursal, va.modelo_codigo, va.id_potencia, va.id_fabricante, va.codigo_autoparte, SUM(va.cantidad_vendida) AS cantidad_vendida
										FROM EMPANADA_DE_MONDONGO.bi_venta_autopartes va 
										GROUP BY va.id_tiempo, va.id_sucursal, va.modelo_codigo, va.id_potencia, va.id_fabricante, va.codigo_autoparte) va
						ON va.codigo_autoparte = ca.codigo_autoparte AND va.id_fabricante = ca.id_fabricante AND va.id_potencia = ca.id_potencia 
							AND va.id_sucursal = ca.id_sucursal AND va.id_tiempo = ca.id_tiempo AND  va.modelo_codigo = ca.modelo_codigo
	
	-- Actualizacion con stocks acumulados
	UPDATE sa SET stock = stock + (SELECT COALESCE(SUM(stock), 0) FROM EMPANADA_DE_MONDONGO.bi_stock_autopartes
									WHERE codigo_autoparte = sa.codigo_autoparte AND id_sucursal = sa.id_sucursal AND id_tiempo < sa.id_tiempo) 
			FROM EMPANADA_DE_MONDONGO.bi_stock_autopartes AS sa
END
GO

------ EJECUCION DE SP -------

EXEC EMPANADA_DE_MONDONGO.bi_migrar_autoparte
EXEC EMPANADA_DE_MONDONGO.bi_migrar_fabricante
EXEC EMPANADA_DE_MONDONGO.bi_migrar_modelo
EXEC EMPANADA_DE_MONDONGO.bi_migrar_sucursal
EXEC EMPANADA_DE_MONDONGO.bi_migrar_tipo_auto
EXEC EMPANADA_DE_MONDONGO.bi_migrar_tipo_caja
EXEC EMPANADA_DE_MONDONGO.bi_migrar_tipo_transmision


EXEC EMPANADA_DE_MONDONGO.bi_cargar_edad
EXEC EMPANADA_DE_MONDONGO.bi_cargar_potencia
EXEC EMPANADA_DE_MONDONGO.bi_cargar_tiempo

EXEC EMPANADA_DE_MONDONGO.bi_cargar_compra_autos
EXEC EMPANADA_DE_MONDONGO.bi_cargar_venta_autos

EXEC EMPANADA_DE_MONDONGO.bi_cargar_compra_autopartes
EXEC EMPANADA_DE_MONDONGO.bi_cargar_venta_autopartes
EXEC EMPANADA_DE_MONDONGO.bi_cargar_stock_autopartes
GO

-- Vistas automoviles

	--Cantidad de automóviles, vendidos y comprados x sucursal y mes
CREATE VIEW EMPANADA_DE_MONDONGO.v_mov_autos_x_sucursal_y_mes_autos AS
	SELECT t.mes, t.agno, COALESCE(ca.id_sucursal, va.id_sucursal) AS id_sucursal, COALESCE(ca.cantidad_comprada, 0) AS cantidad_comprada, COALESCE(va.cantidad_vendida, 0) AS cantidad_vendida
		FROM (
			SELECT ca.id_tiempo, ca.id_sucursal, SUM(ca.cantidad_comprada) AS cantidad_comprada
				FROM EMPANADA_DE_MONDONGO.bi_compra_autos ca
				GROUP BY ca.id_sucursal, ca.id_tiempo
		) ca FULL OUTER JOIN (
				SELECT va.id_tiempo, va.id_sucursal, SUM(va.cantidad_vendida) AS cantidad_vendida
				FROM EMPANADA_DE_MONDONGO.bi_venta_autos va
				GROUP BY va.id_sucursal, va.id_tiempo
			) va ON va.id_sucursal = ca.id_sucursal AND va.id_tiempo = ca.id_tiempo
			JOIN EMPANADA_DE_MONDONGO.bi_tiempo t ON (t.id_tiempo IN (ca.id_tiempo, va.id_tiempo))
GO
	-- Precio promedio de automóviles, vendidos y comprados.
CREATE VIEW EMPANADA_DE_MONDONGO.v_promedios_compra_venta_autos AS
	SELECT (
			SELECT SUM(ca.total_comprado) / SUM(ca.cantidad_comprada)
				FROM EMPANADA_DE_MONDONGO.bi_compra_autos ca
		) precio_promedio_compra,
		(
			SELECT SUM(va.total_vendido) / SUM(va.cantidad_vendida)
				FROM EMPANADA_DE_MONDONGO.bi_venta_autos va
		) precio_promedio_venta
GO

	-- Ganancias x sucursal x mes
CREATE VIEW EMPANADA_DE_MONDONGO.v_ganancias_x_sucursal_mes_autos AS
	SELECT t.mes, t.agno, COALESCE(ca.id_sucursal, va.id_sucursal) AS id_sucursal,  COALESCE(va.total_vendido, 0) - COALESCE(ca.total_comprado, 0) AS ganancia
		FROM (
			SELECT ca.id_tiempo, ca.id_sucursal, SUM(ca.total_comprado) AS total_comprado
				FROM EMPANADA_DE_MONDONGO.bi_compra_autos ca
				GROUP BY ca.id_sucursal, ca.id_tiempo
		) ca FULL OUTER JOIN (
				SELECT va.id_tiempo, va.id_sucursal, SUM(va.total_vendido) AS total_vendido
				FROM EMPANADA_DE_MONDONGO.bi_venta_autos va
				GROUP BY va.id_sucursal, va.id_tiempo
			) va ON va.id_sucursal = ca.id_sucursal AND va.id_tiempo = ca.id_tiempo
			JOIN EMPANADA_DE_MONDONGO.bi_tiempo t ON (t.id_tiempo IN (ca.id_tiempo, va.id_tiempo))
GO
	-- Promedio de tiempo en stock de cada modelo de automóvil.
CREATE VIEW EMPANADA_DE_MONDONGO.v_tiempo_promedio_stock_autos AS
	SELECT va.modelo_codigo, m.nombre, CONVERT(DECIMAL(10), AVG(tiempo_stock_promedio)) AS tiempo_promedio_en_dias
		FROM EMPANADA_DE_MONDONGO.bi_venta_autos va JOIN EMPANADA_DE_MONDONGO.bi_modelo m ON m.modelo_codigo = va.modelo_codigo
		GROUP BY va.modelo_codigo, m.nombre
GO
-- Vistas autopartes
	-- Precio promedio de cada autoparte, vendida y comprada
CREATE VIEW EMPANADA_DE_MONDONGO.v_promedios_compra_venta_autopartes AS
	SELECT c.codigo_autoparte, c.precio_promedio_compra, v.precio_promedio_venta
	FROM (
			SELECT ca.codigo_autoparte, CONVERT(DECIMAL(18,2), COALESCE(SUM(ca.total_comprado) / SUM(ca.cantidad_comprada), 0)) as precio_promedio_compra
				FROM EMPANADA_DE_MONDONGO.bi_compra_autopartes ca
			GROUP BY ca.codigo_autoparte
		) c
	JOIN
		(
			SELECT va.codigo_autoparte, CONVERT(DECIMAL(18,2), COALESCE(SUM(va.total_vendido) / SUM(va.cantidad_vendida), 0)) as precio_promedio_venta
			FROM EMPANADA_DE_MONDONGO.bi_venta_autopartes va
			GROUP BY va.codigo_autoparte
		) v ON c.codigo_autoparte = v.codigo_autoparte
GO

-- Ganancias x sucursal x mes
CREATE VIEW EMPANADA_DE_MONDONGO.v_ganancias_x_sucursal_mes_autopartes AS
	SELECT t.mes, t.agno, COALESCE(ca.id_sucursal, va.id_sucursal) AS id_sucursal,  COALESCE(va.total_vendido, 0) - COALESCE(ca.total_comprado, 0) AS ganancia
		FROM (
			SELECT ca.id_tiempo, ca.id_sucursal, SUM(ca.total_comprado) AS total_comprado
				FROM EMPANADA_DE_MONDONGO.bi_compra_autopartes ca
				GROUP BY ca.id_sucursal, ca.id_tiempo
		) ca FULL OUTER JOIN (
				SELECT va.id_tiempo, va.id_sucursal, SUM(va.total_vendido) AS total_vendido
				FROM EMPANADA_DE_MONDONGO.bi_venta_autopartes va
				GROUP BY va.id_sucursal, va.id_tiempo
			) va ON va.id_sucursal = ca.id_sucursal AND va.id_tiempo = ca.id_tiempo
			JOIN EMPANADA_DE_MONDONGO.bi_tiempo t ON (t.id_tiempo IN (ca.id_tiempo, va.id_tiempo))
GO

	-- Promedio de tiempo en stock de cada autoparte.
CREATE VIEW EMPANADA_DE_MONDONGO.v_maxima_cant_stock_x_sucursal AS
	SELECT sa.id_sucursal, t.agno, sa.codigo_autoparte, MAX(sa.stock) AS maxima_cantidad
	FROM EMPANADA_DE_MONDONGO.bi_stock_autopartes sa JOIN EMPANADA_DE_MONDONGO.bi_tiempo t ON t.id_tiempo = sa.id_tiempo
	GROUP BY sa.id_sucursal, t.agno, sa.codigo_autoparte
GO




/* 


IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_tiempo_stock_autopartes','U') IS NOT NULL
  DROP TABLE EMPANADA_DE_MONDONGO.bi_tiempo_stock_autopartes;y

IF OBJECT_ID('EMPANADA_DE_MONDONGO.v_tiempo_promedio_stock_autopartes') IS NOT NULL
  DROP VIEW EMPANADA_DE_MONDONGO.v_tiempo_promedio_stock_autopartes;

IF OBJECT_ID('EMPANADA_DE_MONDONGO.bi_cargar_tiempo_stock_autopartes') IS NOT NULL
  DROP PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_tiempo_stock_autopartes;


CREATE TABLE EMPANADA_DE_MONDONGO.bi_tiempo_stock_autopartes(

	modelo_codigo DECIMAL(18),
	id_potencia DECIMAL(18),
	id_fabricante DECIMAL(18),
	categoria VARCHAR(50),
	codigo_autoparte DECIMAL(18),
	tiempo_stock DECIMAL(18),
	PRIMARY KEY (modelo_codigo,	id_potencia, id_fabricante, categoria, codigo_autoparte)
);
GO


CREATE PROCEDURE EMPANADA_DE_MONDONGO.bi_cargar_tiempo_stock_autopartes AS
BEGIN
	
	SELECT c.nro_compra, ci.nro_item, c.fecha, ci.codigo_autoparte, ci.cantidad
	INTO #compras_autopartes
	FROM EMPANADA_DE_MONDONGO.compra c JOIN EMPANADA_DE_MONDONGO.compra_item ci ON ci.nro_compra = c.nro_compra;

	CREATE TABLE #ventas_autopartes (
		id DECIMAL(18) IDENTITY(1,1),
		nro_factura DECIMAL(18) ,
		nro_item DECIMAL(18),
		fecha DATE,
		codigo_autoparte DECIMAL(18),
		tiempo_stock INT,
		PRIMARY KEY(id, nro_factura, nro_item)
	)

	DECLARE @nro_factura DECIMAL(18),
			@fecha_venta DATE,
			@codigo_autoparte DECIMAL(18),
			@cantidad_venta DECIMAL(18);

	DECLARE @nro_compra DECIMAL(18),
			@nro_item DECIMAL(18),
			@fecha_compra DATE,
			@cantidad_compra DECIMAL(18);

	DECLARE @tiempo_promedio_actual INT;


	DECLARE c_ventas CURSOR 
	FOR (SELECT f.nro_factura, f.fecha, fi.codigo_autoparte, fi.cantidad
		FROM EMPANADA_DE_MONDONGO.factura f JOIN EMPANADA_DE_MONDONGO.factura_item fi ON fi.nro_factura = f.nro_factura
		) ORDER BY fecha;

	OPEN c_ventas;

	FETCH NEXT FROM c_ventas INTO @nro_factura, @fecha_venta, @codigo_autoparte, @cantidad_venta;

	CREATE TABLE #fechas_actuales (
		fecha DATE
	)

	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		WHILE @cantidad_venta > 0
		BEGIN
			SELECT TOP 1 @nro_compra = nro_compra, @nro_item = nro_item, @cantidad_compra = cantidad, @fecha_compra = fecha FROM #compras_autopartes WHERE codigo_autoparte = @codigo_autoparte AND cantidad != 0 ORDER BY fecha

			IF @nro_compra IS NULL	-- si me quedo sin stock
				SET @cantidad_venta = 0

			INSERT INTO #fechas_actuales (fecha) VALUES (@fecha_compra);

			IF @cantidad_compra >= @cantidad_venta
			BEGIN
				SELECT @tiempo_promedio_actual = AVG(DATEDIFF(DAY, fecha, @fecha_venta)) FROM #fechas_actuales
				
				INSERT INTO #ventas_autopartes (nro_factura, nro_item, fecha, codigo_autoparte, tiempo_stock) 
					VALUES (@nro_factura, @nro_item, @fecha_venta, @codigo_autoparte, @tiempo_promedio_actual);

				UPDATE #compras_autopartes SET cantidad = cantidad - @cantidad_venta WHERE nro_compra = @nro_compra AND nro_item = @nro_item AND codigo_autoparte = @codigo_autoparte;


				SET @cantidad_venta = 0;
				DELETE FROM #fechas_actuales;
			END
			ELSE
			BEGIN
				-- consumo todo el stock 
				UPDATE #compras_autopartes SET cantidad = 0 WHERE nro_compra = @nro_compra AND nro_item = @nro_item AND codigo_autoparte = @codigo_autoparte;

				-- Guardo lo que me falta para completar la venta
				SET @cantidad_venta = @cantidad_venta - @cantidad_compra;
			END
		END

		FETCH NEXT FROM c_ventas INTO @nro_factura, @fecha_venta, @codigo_autoparte, @cantidad_venta;

	END


	CLOSE c_ventas;
	DEALLOCATE c_ventas;

	INSERT INTO EMPANADA_DE_MONDONGO.bi_tiempo_stock_autopartes (modelo_codigo, id_potencia, id_fabricante,	codigo_autoparte, categoria, tiempo_stock)
		SELECT ap.modelo_codigo, EMPANADA_DE_MONDONGO.RANGO_POTENCIA(m.potencia), ap.id_fabricante, ap.codigo_autoparte, 'Desconocido', fp.tiempo_promedio

		FROM EMPANADA_DE_MONDONGO.factura f JOIN EMPANADA_DE_MONDONGO.factura_item fi ON f.nro_factura = fi.nro_factura
											JOIN EMPANADA_DE_MONDONGO.autoparte ap ON ap.codigo_autoparte = fi.codigo_autoparte
											JOIN EMPANADA_DE_MONDONGO.modelo m ON m.modelo_codigo = ap.modelo_codigo
											JOIN (
												SELECT codigo_autoparte, SUM(fp.tiempo_stock) / COUNT(DISTINCT fp.nro_factura) AS tiempo_promedio
												FROM #ventas_autopartes fp
												GROUP BY codigo_autoparte) fp ON  fp.codigo_autoparte = ap.codigo_autoparte 
		GROUP BY ap.modelo_codigo, m.potencia, ap.id_fabricante, ap.codigo_autoparte, fp.tiempo_promedio
	
	DROP TABLE #compras_autopartes;
	DROP TABLE #ventas_autopartes;
	DROP TABLE #fechas_actuales;

END
GO


--EXEC EMPANADA_DE_MONDONGO.bi_cargar_tiempo_stock_autopartes


	-- Promedio de tiempo en stock de cada autoparte.
CREATE VIEW EMPANADA_DE_MONDONGO.v_tiempo_promedio_stock_autopartes AS
	SELECT ta.codigo_autoparte, tiempo_stock AS tiempo_promedio_en_dias
		FROM EMPANADA_DE_MONDONGO.bi_tiempo_stock_autopartes ta
GO
*/