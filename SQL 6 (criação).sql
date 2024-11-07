--Questão 1
--1a
CREATE DATABASE BD_Teste

--1b
DROP DATABASE BD_Teste

--1c
CREATE DATABASE Exercicios


--Questão 2
CREATE TABLE dCliente(
	ID_Cliente INT,
	Nome_Cliente VARCHAR (100),
	Data_de_Nascimento DATETIME
)

CREATE TABLE dGerente(
	ID_Gerente INT,
	Nome_Gerente VARCHAR (100),
	Data_de_Contratacao DATETIME,
	Salario INT
)

CREATE TABLE fContratos(
	ID_Contrato INT,
	Data_de_Assinatura DATETIME,
	ID_Cliente INT,
	ID_Gerente INT,
	Valor_do_Contrato INT
)

--Questão 3
INSERT INTO dCliente(ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES
	(1, 'André Martins', '19890212'),
	(2, 'Bárbara Campos', '19920507'),
	(3, 'Carol Freitas', '19850423'),
	(4, 'Diego Cardoso', '19941011'),
	(5, 'Eduardo Pereira', '19891109'),
	(6, 'Fabiana Silva', '19900501'),
	(7, 'Gustavo Barbosa', '19870814'),
	(8, 'Helen Viana', '19900211');

INSERT INTO dGerente(ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES
(1, 'Lucas Sampaio', '20150321', 6700),
(2, 'Mariana Padilha', '20110110', 9900),
(3, 'Nathália Santos', '20181003', 7200),
(4, 'Otávio Costa', '20170418', 11000);

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato) 
VALUES
(1, '20190112', 8, 1, 23000),
(2, '20190210', 3, 2, 15500),
(3, '20190307', 7, 2, 6500),
(4, '20190315', 5, 1, 3400),
(5, '20190321', 4, 4, 11100),
(6, '20190323', 10, 3, 5500),
(7, '20190328', 2, 5, 5500),
(8, '20190404', 2, 4, 3400),
(9, '20190405', 4, 1, 3400),
(10, '20190405', 6, 2, 9200);

--Questão 4
INSERT INTO dCliente(ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES
(9, 'Gustavo Mioto', '20241028')

INSERT INTO dGerente(ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES
(5, 'Renato Cariane', '20241028', 100000)

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato) 
VALUES
(11, '20241028', 9, 5, 40000)

-- Questão 5
UPDATE fContratos
SET Data_de_Assinatura = '17/03/2019', ID_Gerente = '2', Valor_do_Contrato = '33500'
WHERE ID_Contrato = 4

--Questão 6
DELETE FROM fContratos WHERE ID_Contrato = 11

SElECT *
FROM dCliente

SELECT *
FROM dGerente

SELECT *
FROM fContratos