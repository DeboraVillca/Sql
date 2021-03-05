USE [TSQLV4ES]
GO
/*ejer 1*/
SELECT TOP(5) 
       [nombreproducto]
      ,[categoriaid]
      ,[preciounitario]
     
  FROM [Produccion].[Productos]
  WHERE [categoriaid]=1 
  ORDER BY [preciounitario] DESC
GO
/*ejer 1*/
USE [TSQLV4ES]
GO
SELECT 
       [nombreproducto]
      ,[categoriaid]
      ,[preciounitario]
     
  FROM [Produccion].[Productos]
  WHERE [categoriaid]=1 
  ORDER BY [preciounitario] DESC
  OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
GO
/*ejer 2*/
USE [TSQLV4ES]
GO
SELECT TOP(5) WITH TIES 
       [nombreproducto]
      ,[categoriaid]
      ,[preciounitario]
     
  FROM [Produccion].[Productos]
  WHERE [categoriaid]=1 
  ORDER BY [preciounitario] DESC
GO


/*ejer 1.3 */


SELECT COUNT([fechaorden]) As total_ordenes,
	[fechaorden]
	FROM [Ventas].[Ordenes]
	GROUP BY [fechaorden]
	ORDER BY total_ordenes DESC
	  OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY
GO

/*ejer 1.4 */
USE [TSQLV4ES]
GO

SELECT TOP(1) [empid]
      ,[apellido]
      ,[nombre]
      ,[puesto]
      ,[saludo]
      ,[nacimiento]
      ,[fechaalta]
     
    FROM [RH].[Empleados]
	ORDER BY [fechaalta]
GO

SELECT  [empid]
      ,[apellido]
      ,[nombre]
      ,[puesto]
      ,[saludo]
      ,[nacimiento]
      ,[fechaalta]
     
    FROM [RH].[Empleados]
	ORDER BY [fechaalta]
	OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY
GO
