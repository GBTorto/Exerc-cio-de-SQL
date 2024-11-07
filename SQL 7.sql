SELECT 10 AS 'Número'

SELECT 'Marcus' AS 'Nome'

SELECT '21/06/2021' AS 'Data'

SELECT 10 + 10 AS 'Calculo'
SELECT 20-5
SELECT 31*40
SELECT 431.0/23
SELECT '20+10'

SELECT 'SQL' + ' ' + 'SENAI'

SELECT CAST(21.45 AS INT)
SELECT CAST(21.45 AS FLOAT)
SELECT CAST(18.7 AS VARCHAR)
SELECT CAST('15.6' AS FLOAT)
SELECT CAST('31/05/2014' AS DATETIME)

SELECT SQL_VARIANT_PROPERTY('31/05/2014', 'BaseType' AS 'Data 1')

SELECT FORMAT(1000, 'N') AS Número
SELECT FORMAT(1000, 'G') AS Geral
SELECT FORMAT(1000, 'C') AS 'Moeda'

SELECT FORMAT(1234567890, '###-###-####') AS 'Personalizado'

SELECT ROUND(18.739130, 2) AS 'Round 1'

SELECT ROUND(18.739130, 2, 1) AS 'Round 2'

SELECT FLOOR(18.748976) AS 'Floor'


DECLARE @quantidade INT
SET @quantidade = 100

DECLARE @idade INT
SET @idade = 30
SELECT @idade

DECLARE @ListaNomes VARCHAR(MAX)
SET @ListaNomes = ''

SELECT
	@ListaNomes = @ListaNomes + FirstName + ', ' + CHAR(10)
FROM DimEmployee
WHERE DepartmentName = 'Marketing'

PRINT LEFT(@ListaNomes, DATALENGTH(@ListaNomes) - 3)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--EXERCÍCIOS

--Questão 1
DECLARE @Valor1 INT, @Valor2 INT, @Valor3 INT, @Valor4 INT
SET @Valor1 = 10
SET @Valor2 = 5
SET @Valor3 = 34
SET @Valor4 = 7

----1a
--DECLARE @Soma INT AS 'Soma'
--SET @Soma = @Valor1 + @Valor2
--SELECT @Soma

----1b
--DECLARE @Subtracao INT AS 'Subtração'
--SET @Subtracao = @Valor3 - @Valor4
--SELECT @Subtracao

----1c
--DECLARE @Multiplicacao INT AS 'Multiplicação'
--SET @Multiplicacao = @Valor1 *  @Valor4
--SELECT @Multiplicacao

----1d
--DECLARE @Divisao FLOAT
--SET @Divisao = CAST(@Valor3 AS FLOAT) / CAST(@Valor4 AS FLOAT)
--SELECT ROUND(@Divisao , 2) AS 'Resultado'

--Questão 2
DECLARE @Produto VARCHAR(MAX), @Quantidade INT, @Preco FlOAT, @Faturamento AS FLOAT
SET @Produto = 'Celular'
SET @Quantidade = 12
SET @Preco = 9.99
SET @Faturamento = @quantidade * @Preco

SELECT
	@Produto AS 'Produto',
	@Quantidade AS 'Quantidade',
	@Preco AS 'Preco',
	ROUND(@Faturamento, 2) AS 'Faturamento'

--Questão 3
DECLARE @nome VARCHAR(MAX), @data_nascimento DATE, @num_pets INT
SET @nome = 'André'
SET @data_nascimento = '19880210'
SET @num_pets = 2

--SELECT 'Meu nome é ' + @nome + ', ' + 'nasci em ' + CONVERT(VARCHAR, @data_nascimento, 103) + ' e tenho ' + CONVERT(VARCHAR, @num_pets) + ' pets.'
SELECT 'Meu nome é ' + @nome + ', ' + 'nasci em ' + FORMAT(CAST(@data_nascimento AS DATE), 'dd/MM/yyyy') + ' e tenho ' + CAST(@num_pets AS VARCHAR) + ' pets.'

--Questão 4
DECLARE @closeDate VARCHAR(MAX), @empresa VARCHAR(MAX)
SET @closeDate = '%2008%'
SET @empresa = '' 

--(SELECT STRING_AGG(StoreName, ', ') FROM DimStore WHERE CloseDate LIKE @closeDate)

SELECT 
	@empresa = @empresa + StoreName + ', '
FROM DimStore
WHERE CloseDate LIKE @closedate

PRINT LEFT('As lojas fechadas no ano de 2008 foram: ' + @empresa, DATALENGTH(@empresa) + 38)

--Questão 5
DECLARE @subcat VARCHAR(MAX), @texto VARCHAR(MAX)
SET @subcat = 'Lamps'
SET @texto = (SELECT STRING_AGG(ProductSubcategoryKey, ', ') FROM DimProductSubcategory WHERE ProductSubcategoryName LIKE @subcat)

SELECT 
	ProductName
FROM DimProduct
WHERE ProductName LIKE @texto

DECLARE @coluna VARCHAR(MAX), @filtro VARCHAR(MAX)
SET @coluna = ''
SET @filtro = 'Lamps'

SELECT 
	@coluna = @coluna + ProductSubcategoryName
FROM DimProductSubcategory
WHERE ProductSubcategoryName LIKE @filtro

PRINT 'ProductSubcategoryName = ' + @coluna

SELECT *
FROM DimProduct

SELECT *
FROM DimProductSubcategory