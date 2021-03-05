
CREATE DATABASE [EJER2]
USE EJER2
CREATE TABLE EJER2.dbo.Pieza(
	CODIGO INT ,
	NOMBRE VARCHAR(100)
	constraint k_Pieza Primary Key (CODIGO),
)
CREATE TABLE Proveedor(
Id CHAR(4),
NOMBRE NVARCHAR(100),
DIRECCION NVARCHAR(100),
TELEFONO INT,

constraint k_Proveedores Primary Key (Id),
)

CREATE TABLE suministr(
	CODIGOPIEZA INT ,
	IDPROVEEDOR NVARCHAR(4),
	PRECIO DECIMAL,
constraint k_Suministra Primary Key (codigoPieza,idProveedor),
constraint fok_Suministra Foreign Key (codigoPieza,idProveedor) references
dbo.Suministra(codigoPieza,idProveedor),
)


SELECT [NOMBRE]
  FROM [dbo].[Piezas]



SELECT * FROM  [dbo].[Proveedores]
GO

SELECT AVG(precio)  AS precio_medio
	FROM [dbo].[Suministra]
GO

SELECT 
	P.[NOMBRE],
	S.CODIGOPIEZA
	
	FROM [dbo].Suministra AS S
	INNER JOIN [dbo].Proveedores AS P
	ON S.IDPROVEEDOR=P.Id
	WHERE S.CODIGOPIEZA=1
	;

GO

SELECT P.[NOMBRE]
		
FROM [dbo].[Pieza] AS P
INNER JOIN [dbo].[suministr] AS S ON 
P.CODIGO=S.CODIGOPIEZA
WHERE S.IDPROVEEDOR= 'HAL'
GO

SELECT SUM (S.[PRECIO]) AS Sumatoria
	,P.[Id]
	,P.[NOMBRE]
	FROM[dbo].Proveedores AS P 
	INNER JOIN [dbo].Suministra AS S ON p.Id=S.IDPROVEEDOR
	WHERE [PRECIO] >=100
	GROUP  BY P.Id,P.NOMBRE
GO	

SELECT 
	P.NOMBRE,
	Pie.NOMBRE,
	S.PRECIO
	FROM [dbo].Proveedores AS P
	INNER JOIN [dbo].Suministra AS S ON P.Id=S.IDPROVEEDOR
	INNER JOIN [dbo].Piezas AS Pie ON Pie.CODIGO=S.CODIGOPIEZA
GO

SELECT 
	p.Id,
	P.NOMBRE,
	p.DIRECCION,
	p.TELEFONO
	FROM [dbo].Proveedores AS P
	LEFT JOIN [dbo].Suministra AS S ON P.Id=S.IDPROVEEDOR
	WHERE S.IDPROVEEDOR IS NULL
GO

SELECT COUNT(CODIGO) AS cantidad
	,S.IDPROVEEDOR
 	FROM [dbo].Piezas AS P
	INNER JOIN [dbo].Suministra AS S ON P.CODIGO=S.CODIGOPIEZA
	WHERE s.IDPROVEEDOR='HAL'
	GROUP BY S.IDPROVEEDOR
GO

SELECT 
	P.[NOMBRE]
	FROM [dbo].Piezas AS P
	INNER JOIN [dbo].Suministra AS S ON P.CODIGO=S.CODIGOPIEZA
	WHERE S.IDPROVEEDOR='PEX'
GO

