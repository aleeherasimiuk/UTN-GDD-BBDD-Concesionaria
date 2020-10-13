USE [GD2C2020]
GO

EXECUTE AS USER = 'gd2020'

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
 
CREATE TABLE autoparte(

	codigo_autoparte DECIMAL(18,0) PRIMARY KEY,
	descripcion NVARCHAR(255) NOT NULL,
	categoria NVARCHAR(50),
	id_fabricante DECIMAL(18,0) NOT NULL,
	modelo_codigo DECIMAL(18,0) NOT NULL,

);
GO

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

CREATE TABLE compra(

	nro_compra DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	fecha DATETIME2(3),
	id_sucursal DECIMAL(18,0),
	id_cliente DECIMAL(18,0),

);
GO

--SET IDENTITY_INSERT TEST ON
-- MIGRACIÓN
--SET IDENTITY_INSERT TEST OFF

CREATE TABLE compra_auto(

	nro_compra DECIMAL(18,0) PRIMARY KEY,
	patente_auto NVARCHAR(50),
	precio DECIMAL(18,2),
);
GO

CREATE TABLE compra_item(

	nro_compra DECIMAL(18,0),
	nro_item DECIMAL(18,0),
	codigo_autoparte DECIMAL(18,0),
	cantidad DECIMAL(18,0),
	precio DECIMAL(18,2),
	PRIMARY KEY(nro_compra, nro_item)

);
GO

CREATE TABLE fabricante(

	id_fabricante DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255),

);
GO

CREATE TABLE factura(

	nro_factura DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	fecha DATETIME2(3),
	id_cliente DECIMAL(18,0),
	id_sucursal DECIMAL(18,0),

);
GO

CREATE TABLE factura_auto(
	nro_factura DECIMAL(18,0) PRIMARY KEY,
	patente_auto NVARCHAR(50),
	precio_facturado DECIMAL(18,2),
);
GO

CREATE TABLE factura_item(
	nro_factura DECIMAL(18,0),
	nro_item DECIMAL(18,0),
	codigo_autoparte DECIMAL(18,0),
	cant DECIMAL(18,0),
	precio DECIMAL(18,2), -- Precio total
	PRIMARY KEY(nro_factura, nro_item)
);
GO

CREATE TABLE modelo(
	modelo_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255),
	potencia DECIMAL(18,0)
);
GO

CREATE TABLE sucursal(

	id_sucursal DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	direccion NVARCHAR(255),
	mail NVARCHAR(255),
	telefono DECIMAL(18,0),
	ciudad NVARCHAR(255)
);
GO

CREATE TABLE tipo_auto(
	tipo_auto_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255),
);
GO

CREATE TABLE tipo_caja(
	tipo_caja_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255),
);
GO

CREATE TABLE tipo_transmision(
	tipo_transmision_codigo DECIMAL(18,0) PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(255),
);
GO




ALTER TABLE auto 
	ADD FOREIGN KEY (tipo_auto_codigo) REFERENCES tipo_auto(tipo_auto_codigo),
		FOREIGN KEY (tipo_transmision_codigo) REFERENCES tipo_transmision(tipo_transmision_codigo),
		FOREIGN KEY (tipo_caja_codigo) REFERENCES tipo_caja(tipo_caja_codigo),
		FOREIGN KEY (modelo_codigo) REFERENCES modelo(modelo_codigo),
		FOREIGN KEY (id_fabricante) REFERENCES fabricante(id_fabricante);

ALTER TABLE autoparte
	ADD	FOREIGN KEY (modelo_codigo) REFERENCES modelo(modelo_codigo),
		FOREIGN KEY (id_fabricante) REFERENCES fabricante(id_fabricante);

ALTER TABLE compra
	ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
		FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE compra_auto
	ADD FOREIGN KEY (nro_compra) REFERENCES compra(nro_compra),
		FOREIGN KEY (patente_auto) REFERENCES auto(patente_auto);

ALTER TABLE compra_item
	ADD FOREIGN KEY (nro_compra) REFERENCES compra(nro_compra),
		FOREIGN KEY (codigo_autoparte) REFERENCES autoparte(codigo_autoparte);

ALTER TABLE factura
	ADD FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
		FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);

ALTER TABLE factura_auto
	ADD FOREIGN KEY (nro_factura) REFERENCES factura(nro_factura),
		FOREIGN KEY (patente_auto) REFERENCES auto(patente_auto);

ALTER TABLE factura_item
	ADD FOREIGN KEY (nro_factura) REFERENCES factura(nro_factura),
		FOREIGN KEY (codigo_autoparte) REFERENCES autoparte(codigo_autoparte);


