SELECT
	DepartmentName,
	Count(DepartmentName) AS 'Total de Funcionários'
FROM DimEmployee
GROUP BY DepartmentName


SELECT 
	StoreType,
	SUM(EmployeeCount) AS 'Qtd. Total de Funcionários'
FROM DimStore
GROUP BY StoreType
ORDER BY SUM(EmployeeCount) DESC
--

SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total Marca'
FROM DimProduct
GROUP BY BrandName
HAVING COUNT(BrandName) >= 200

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1a
SELECT 
	channelKey,
	SUM(SalesQuantity) AS 'Qnt. Vendido'
FROM FactSales
GROUP BY channelKey
--Agrupa as colunas channelKey e SalesQuantity e mostra a quantidade de vendas em cada canal

--1b
SELECT 
	StoreKey,
	COUNT(SalesQuantity) AS 'Qnt. Vendido',
	COUNT(ReturnQuantity) AS 'Qnt. Retornada'
FROM FactSales
GROUP BY StoreKey
--Agrupa as colunas channelKey, SalesQuantity e ReturnQuantity

--1c
SELECT 
	channelKey,
	SUM(SalesAmount) AS 'Total Ventido'
FROM FactSales
WHERE DateKey LIKE '%2007%'
Group BY channelKey

--2a
SELECT
	Productkey,
	SUM(SalesAmount) AS 'Valor total vendido'
FROM FactSales
WHERE SalesAmount > 5000
GROUP BY ProductKey
ORDER BY [Valor total vendido] DESC

--2b
SELECT TOP (10)
	Productkey,
	SUM(SalesQuantity) AS 'Qnt. Vendida'
FROM FactSales
GROUP BY ProductKey
ORDER BY [Qnt. Vendida] DESC

--3a
SELECT TOP(1)
	CustomerKey,
	SUM(SalesQuantity) AS 'Qnt. Comprada'
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY [Qnt. Comprada] DESC

--3b
SELECT TOP(3)
	ProductKey,
	SUM(SalesQuantity) AS 'Qnt. Comprada'
FROM FactOnlineSales
WHERE CustomerKey = '19037'
GROUP BY ProductKey
ORDER BY [Qnt. Comprada] DESC

--4
SELECT *
FROM DimProduct

--4a
SELECT 
	BrandName,
	COUNT(ProductName) AS 'Produtos'
FROM DimProduct
GROUP BY BrandName
ORDER BY [Produtos] DESC

--4b
SELECT
	ClassName,
	AVG(UnitPrice) AS 'Média dos Valores'
FROM DimProduct
GROUP BY ClassName
ORDER BY [Média dos Valores] DESC

--4c
SELECT
	ColorName,
	SUM(Weight) AS 'Peso Total'
FROM DimProduct
GROUP BY ColorName
ORDER BY [Peso Total] DESC

--5
SELECT
	StockTypeName,
	SUM(Weight) AS 'Peso Total'
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY [Peso Total] DESC

--6
SELECT
	BrandName,
	COUNT(DISTINCT ColorName) AS 'Qnt. Cores'
FROM DimProduct
GROUP BY BrandName
ORDER BY [Qnt. Cores] DESC

--7
SELECT 
	Gender,
	COUNT(Gender) AS 'Qnt. Pessoas',
	AVG(YearlyIncome) AS 'Média Salarial'
FROM DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY [Média Salarial] DESC

--8
SELECT
	Education,
	COUNT(DISTINCT CustomerKey) AS 'Qnt. Pessoas',
	AVG(YearlyIncome) AS 'Média Salarial'	
FROM DimCustomer
GROUP BY Education
ORDER BY [Média Salarial] DESC

--9
SELECT
	DepartmentName,
	COUNT(EmployeeKey) AS 'Qnt. Funcionário'
FROM DimEmployee
WHERE EndDate IS NULL
GROUP BY DepartmentName
ORDER BY [Qnt. Funcionário] DESC

--10
SELECT
	Title,
	SUM(VacationHours)
FROM DimEmployee
WHERE Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') AND HireDate BETWEEN ('1999/01/01') AND ('2000/12/31') AND EndDate IS NULL
GROUP BY Title