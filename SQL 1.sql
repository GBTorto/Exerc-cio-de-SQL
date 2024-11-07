USE ContosoRetailDW

--1a
SELECT *
FROM DimProduct
--"Select *" faz com que selecione todas a linhas e todas as colunas
--FROM DimProduct é para selecionar a tabela que eu quero ver
--Resposta: Continua com 2517 produtos cadastrados

--1b
SELECT *
FROM DimCustomer
--Diminuiu a quantidade de clientes

--2a
SELECT 
	CustomerKey,
	FirstName,
	EmailAddress,
	BirthDate
FROM DimCustomer
--Estou selecionando as colunas Custumerkey, FirstName, EmailAddress, BirthDate, da tabela DimCustumer

--2b
SELECT 
	CustomerKey AS Chave, 
	FirstName AS Nome, 
	EmailAddress AS Email, 
	BirthDate AS 'Data de Nascimento'
FROM DimCustomer
--Estou mudando o nome das colunas utilizando o "AS"

--3a
SELECT TOP (100) *
FROM DimCustomer
--"SELECT TOP(100)" seleciona as 100 primeiras linhas e "*" seleciona todas as colunas

--3b
SELECT TOP (20) PERCENT *
FROM DimCustomer
--"SELECT TOP (20) PERCENT" seleciona 20% das linhas

--3c
SELECT TOP (100) 
	FirstName, 
	EmailAddress,
	BirthDate
FROM DimCustomer
--Estou selecionando as 100 primeiras linhas das colunas "FirstName, EmailAddress, BirthDate".

--3d
SELECT
	FirstName AS 'Primeiro Nome',
	EmailAddress AS 'Endereço de Email',
	BirthDate AS 'Data de Nascimento'
FROM DimCustomer

--4
SELECT DISTINCT
	Manufacturer AS Fornecedor
FROM DimProduct
--"DISTINCT" faz com que não repita informações

--5
SELECT DISTINCT ProductKey
FROM DimProduct

SELECT DISTINCT ProductKey
FROM FactSales
--Estou comparando duas colunas de produtos, sem haver repetições de itens, para poder ver quantos itens há no total para saber quantos itens foram vendidos, que no caso foram vendidos quase todos os produtos, menos 1