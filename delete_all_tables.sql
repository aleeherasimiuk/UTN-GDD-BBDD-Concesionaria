USE [GD2C2020]
GO

SELECT CURRENT_USER;

CREATE FUNCTION dbo.table_exists(@name VARCHAR(100)) RETURNS INT AS
BEGIN
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @name) 
			RETURN 1;
	RETURN 0;
		   
END
GO

IF dbo.table_exists('compra_auto') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.compra_auto 

IF dbo.table_exists('compra_item') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.compra_item 

IF dbo.table_exists('factura_auto') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.factura_auto

IF dbo.table_exists('factura_item') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.factura_item 

EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

IF dbo.table_exists('auto') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.auto 

IF dbo.table_exists('autoparte') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.autoparte 

IF dbo.table_exists('compra') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.compra

IF dbo.table_exists('fabricante') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.fabricante

IF dbo.table_exists('factura') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.factura

IF dbo.table_exists('modelo') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.modelo

IF dbo.table_exists('sucursal') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.sucursal

IF dbo.table_exists('tipo_auto') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.tipo_auto

IF dbo.table_exists('tipo_caja') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.tipo_caja

IF dbo.table_exists('tipo_transmision') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.tipo_transmision

IF dbo.table_exists('cliente') = 1
	DROP TABLE EMPANADA_DE_MONDONGO.cliente

DROP FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_FABRICANTE
DROP FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_CLIENTE
DROP FUNCTION EMPANADA_DE_MONDONGO.OBTENER_ID_SUCURSAL


DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_auto;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_autoparte;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_cliente;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra_auto;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_compra_item;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_fabricante;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura_auto;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_factura_item;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_modelo;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_sucursal;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_auto;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_caja;
DROP PROCEDURE EMPANADA_DE_MONDONGO.migrar_tipo_transmision;

DROP TABLE EMPANADA_DE_MONDONGO.logs;
DROP PROCEDURE EMPANADA_DE_MONDONGO.insert_log;
