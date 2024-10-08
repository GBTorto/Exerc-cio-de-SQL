SELECT 
COUNT(CustomerKey) AS 'Qtn. Mulheres'
FROM DimCustomer
WHERE Gender = 'F'
--Adiciona um filtro. Agora, ele irá retornar a quantidade de clientes do sexo feminino.

SELECT
COUNT(DISTINCT DepartmentName) AS 'Qtn Áreas'
FROM DimEmployee
--Retorna a quantidade distinta de áreas

--Retorna a soma da quantidade vendida da tabela FactSales
SELECT
SUM(SalesQuantity) AS 'Total Vendido'
FROM FactSales
WHERE UnitPrice >= 100
--Filtra apenas para os produtos com preço unitário maior que 100

SELECT
AVG(SalesQuantity) AS 'Média de Vendas'
FROM FactSales
WHERE UnitPrice >= 100
--"AVG" faz a média da coluna

SELECT
MIN(SalesQuantity) AS 'Min Venda' 
FROM FactSales
--'MIN' pega o menor valor da coluna

SELECT
MAX(SalesQuantity) AS 'Max Venda'
FROM FactSales
--'MAX' pega o maior valor da coluna

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1
SELECT
	SUM(SalesQuantity) AS 'Qnt. Vendida'
FROM FactSales

SELECT
	SUM(ReturnQuantity) AS 'Qnt. Devolvida'
FROM FactSales

--2
SELECT
	AVG(YearlyIncome) AS 'Salário Anual'
FROM DimCustomer
WHERE Occupation = 'Professional'

--3
--Mais funcionários
SELECT 
    StoreName AS 'Nome da Loja',
    EmployeeCount AS 'Número de funcionários'
FROM 
    DimStore
WHERE 
    EmployeeCount = (SELECT MAX(EmployeeCount) FROM DimStore);

--Menos funcionários
SELECT
	StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Número de funcionários'
FROM DimStore
WHERE EmployeeCount = (SELECT MIN(EmployeeCount) FROM DimStore)

--4
--Homem
SELECT 
	COUNT(Gender) AS 'Genero'
FROM DimEmployee
WHERE Gender = 'M' AND EndDate IS NULL
--203

--Mulheres
SELECT 
	COUNT(Gender) AS 'Genero'
FROM DimEmployee
WHERE Gender = 'F' AND EndDate IS NULL
--84

SELECT TOP (1)
	FirstName,
	LastName,
	EmailAddress,
	HireDate
FROM DimEmployee
WHERE Gender = 'M' AND EndDate IS NULL
ORDER BY HireDate ASC
--Homem mais antigo da empresa

SELECT TOP (1)
	FirstName,
	LastName,
	EmailAddress,
	HireDate
FROM DimEmployee
WHERE Gender = 'F' AND EndDate IS NULL
ORDER BY HireDate ASC
--Mulher mais antiga da empresa

--5
SELECT 
	COUNT(DISTINCT ColorName) AS 'Qnt. de cores',
	COUNT(DISTINCT BrandName) AS 'Qnt. de marcas',
	COUNT(DISTINCT ClassName) AS 'Qnt. de classes'
FROM DimProduct