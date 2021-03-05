CREATE PROCEDURE territorios_por_empleado
 @empleadoDesde INT, @empleadoHasta INT
AS
SELECT COUNT(ET.TerritoryID) AS Can_territorio,
		E.[EmployeeID],
		E.[FirstName]
		
FROM Employees E
INNER JOIN EmployeeTerritories ET ON E.EmployeeID= et.EmployeeID
INNER JOIN Territories t ON t.TerritoryID=ET.TerritoryID

WHERE  E.EmployeeID>=@empleadoDesde AND E.EmployeeID<=@empleadoHasta
GROUP BY 
		E.[EmployeeID],
		E.[FirstName]

EXEC territorios_por_empleado 2,5

CREATE PROCEDURE productos_nunca_vendidos
AS
SELECT ProductName 
	,ProductID
		
FROM Products as p
WHERE  p.UnitsOnOrder=0
GROUP BY 
		ProductName 
	   ,ProductID
EXEC productos_nunca_vendidos  0












SELECT 
p.[ProductID],
p.[ProductName],
s.[CompanyName] 
FROM Products AS P
iNNER JOIN Suppliers  s ON P.SupplierID=S.SupplierID 
WHERE P.[Discontinued]=0 AND s.SupplierID= 1 AND S.SupplierID= 3 AND S.SupplierID= 7 and s.SupplierID= 8 and s.SupplierID= 9
order BY p.[ProductID],
p.[ProductName],
s.[CompanyName] asc



CREATE VIEW VW_PRODUCTS 
AS SELECT MAX(Products.UnitPrice) AS MAXIMO , MIN(Products.UnitPrice)