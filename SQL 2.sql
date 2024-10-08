USE ContosoRetailDW

SELECT TOP (100)
	StoreName,
	EmployeeCount
FROM DimStore
ORDER BY EmployeeCount
--"ORDER BY" mostra a tabela de forma crescente, "EmployeeCount" mostra qual coluna que será aplicado.

SELECT TOP (100)
	StoreName,
	EmployeeCount
FROM DimStore
ORDER BY EmployeeCount DESC
--"DESC" vai mostrar em forma decrescente
 
SELECT TOP (100)
	ProductName,
	Weight,
	UnitCost
FROM DimProduct
ORDER BY UnitCost DESC, Weight ASC
--Organiza de forma crescente (A-Z)

SELECT *
FROM DimProduct
WHERE ProductName LIKE '%MP3%'
--"WHERE ProductName LIKE '%MP3%'" mostra todos os produtos que possuem "MP3" no meio do nome

SELECT *
FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver'
--"WHERE BrandName = 'Contoso' AND ColorName = 'Silver'" mostra os itens que possuem o nome "Contoso" na coluna "BrandName, que ao mesmo tempo possuem o nome "Silver" na coluna "ColorName"

SELECT *
FROM DimProduct
WHERE BrandName = 'Blue' OR ColorName = 'Silver'
--"WHERE BrandName = 'Blue' OR ColorName = 'Silver'" tanto produtos com nome "Blue" no "BrandName", quanto "Silver" no "ColorName"

SELECT *
FROM DimProduct
WHERE NOT ColorName = 'Blue'
--"WHERE NOT ColorName = 'Blue'" mostra os produtos que não possuem um valor "Blue" na coluna "ColorName"

SELECT *
FROM DimProduct
WHERE ColorName IN ('Blue', 'Silver', 'Black')
--"WHERE ColorName IN ('Blue', 'Silver', 'Black')" mostra os produtos que possuem o nome "Blue", "Silver" e "Black" na coluna "ColorName"

SELECT TOP (1000) *
FROM FactSales
WHERE SalesQuantity BETWEEN 10 AND 15
--"WHERE SalesQuantity BETWEEN 10 AND 15" mostra os produtos que possuem um valor entre 10 e 15 na coluna "SalesQuantity"

SELECT *
FROM DimCustomer
WHERE FirstName IS NOT NULL
--"WHERE FirstName IS NOT NULL" mostra os clientes que os valores não são nulos na coluna "FirstName" 

SELECT *
FROM DimCustomer
WHERE FirstName IS NULL
--Seleciona todas as colunas onde o primeiro nome é nulo

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1
SELECT TOP (100) *
FROM FactSales
ORDER BY SalesAmount DESC

--2
SELECT TOP (10) *
FROM DimProduct
ORDER BY [Weight] DESC, Size Desc

--3
SELECT 
	ProductName AS 'Nome do Produto',
	[Weight] AS 'Peso'
FROM DimProduct
WHERE Weight >= 220
ORDER BY Weight DESC

--4
SELECT
	StoreName AS 'Nome da Loja',
	OpenDate AS 'Data de Inauguração',
	EmployeeCount AS 'Número de Funcionários'
FROM DimStore
WHERE CloseDate IS NULL

--5
SELECT 
	ProductKey,
	BrandName,
	AvailableForSaleDate
FROM DimProduct
WHERE BrandName = 'Litware' AND AvailableForSaleDate = '15/03/2009'

--6a
SELECT *
FROM DimStore
WHERE [Status] = 'Off'

--6b
SELECT *
FROM DimStore
WHERE CloseDate IS NOT NULL

--7

--Categoria 1
SELECT 
	StoreKey,
	EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 1 AND 20
ORDER BY EmployeeCount DESC

--Categoria 2
SELECT 
	StoreKey,
	EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 21 AND 50
ORDER BY EmployeeCount DESC

--Categoria 3
SELECT 
	StoreKey,
	EmployeeCount
FROM DimStore
WHERE EmployeeCount > 50
ORDER BY EmployeeCount DESC

--8
SELECT 
	ProductKey,
	ProductName,
	UnitPrice
FROM DimProduct
WHERE ProductName LIKE '%LCD%'

--9
SELECT *
FROM DimProduct
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Litware', 'Contoso', 'Fabrikam')
ORDER BY ColorName DESC

--10
SELECT *
FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice DESC 