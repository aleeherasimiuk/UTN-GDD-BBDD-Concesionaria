USE [GD2C2020]
GO

EXEC dbo.delete_tables;

CREATE FUNCTION dbo.table_exists(@name VARCHAR(100)) RETURNS INT AS
BEGIN
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @name) 
			RETURN 1;
	RETURN 0;
		   
END
GO

DROP PROCEDURE dbo.delete_tables
CREATE PROCEDURE dbo.delete_tables AS
BEGIN

	EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

	IF dbo.table_exists('auto') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.auto 

	IF dbo.table_exists('autoparte') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.autoparte 

	IF dbo.table_exists('cliente') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.cliente

	IF dbo.table_exists('compra') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.compra

	IF dbo.table_exists('compra_auto') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.compra_auto 

	IF dbo.table_exists('compra_item') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.compra_item 

	IF dbo.table_exists('fabricante') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.fabricante

	IF dbo.table_exists('factura') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.factura

	IF dbo.table_exists('factura_auto') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.factura_auto

	IF dbo.table_exists('factura_item') = 1
		DROP TABLE EMPANADA_DE_MONDONGO.factura_item 

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

END
GO