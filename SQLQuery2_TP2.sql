USE [TpDos]
CREATE TABLE TpDos.dbo.Orden(
	ordenid int primary key,
	clienteid int, 
	empid int,
	fechaorden int
	constraint Fk_Orden Foreign Key (clienteid) references dbo.Cliente(id),
) 
CREATE TABLE TpDos.dbo.Clientes(
	id int  primary key,
	nombre char(100),
	apellido char(100),
)
CREATE TABLE TpDos.dbo.Empleados(
	id int primary key,
	nombre char(100),
	legajo int, 
)

USE [TpDos]
SELECT 
	[ordenid],
	[fechaorden],
	[clienteid],
	[empid],
	DATEFROMPARTS(year(fechaorden), 12, 31) as findeanio
	FROM TpDos.dbo.Ordenes
	WHERE fechaorden <> DATEFROMPARTS(year(fechaorden), 12, 31);
GO

SELECT 
[empid],
[fechaorden]
FROM dbo.Ordenes
WHERE fechaorden= (SELECT MAX(fechaorden)FROM Ordenes)
GO

SELECT 
[empid],
[fechaorden],
[ordenid],
[clienteid]
FROM  Ordenes as O
  INNER JOIN(SELECT MAX(fechaorden) as maximo FROM Ordenes) AS derivada ON derivada.maximo=O.fechaorden;
GO

