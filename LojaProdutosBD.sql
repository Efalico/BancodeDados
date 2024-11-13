
--Atividade Avaliativa do dia 11/11/2024


--Entrar no Banco de dados

USE MASTER

--Criando a base de dados

CREATE DATABASE LojaProdutosBD
GO

--Entrar na Base de Dados 

USE LojaProdutosBD
GO

--Criando Tabelas 


 CREATE TABLE Categoria(
 CategoriaID int identity primary key,
 Nome varchar (100) not null,
 );

 CREATE TABLE Loja(
 LojaID int identity primary key,
 Nome varchar (100)not null,
 Endereco varchar (255) not null
 );

 CREATE TABLE Produtos(
 ProdutosID int identity primary key,
 Nome varchar (100) not null,
 Preco decimal not null,
 CategoriaID int
 foreign key (CategoriaID) references Categoria (CategoriaID)
 );

 CREATE TABLE Clientes(
 ClientesID  int identity primary key,
 Nome varchar (100) not null,
 E_mail varchar (150) not null,
 Telefone varchar (15) not null
 );

 --Inserindo dados


 INSERT INTO Categoria VALUES ('Automacao Comercial'),
							  ('Informatica'),
							  ('Salao Beleza'),
							  ('Supermercado')

								

INSERT INTO Loja VALUES ('RF Automação','Rua Joao dos Passaros n 40  Bairro Vila Maringa /Jundiai-SP'),
						('Crystal',' Informatica, Rua Da Varzea 1960 Bairro Agapeama / Jundiai-SP'),
						('Charme Salao','Rua Moradas das Vinhas Bairro Santo Antonio / Louveira-SP'),
						('Proenca Supermercado','Rua Rio Preto Bairro Centro / Sao Jose do Rio Preto')


INSERT INTO Produtos VALUES ('Interruptor Bipolar',30,1),
							('Computador',850,2),
							('Shampo Eudora',100,3),
							('Arroz',30,4)
						
					

INSERT INTO Clientes VALUES ('Vitória Preterotto','vitoria@gmail.com','19 91199 1119'),
						   ('Eduardo Falico','eduardofalico@gmail.com','41 99888 8899'),
						   ('Achilley Lais','achilley@gmail.com','11 98765 4321'),
						   ('Felipe Nagy', 'felipenagy@homail.com','11 95502455')



-- Selecionar o BD

SELECT*FROM Categoria
SELECT*FROM Loja
SELECT*FROM Produtos
SELECT*FROM Clientes



--Com Inner Join 


-- Seleciona Categoria Produtos Precos

SELECT Categoria.Nome,Produtos.Nome, Produtos.Preco FROM Categoria 
INNER JOIN Produtos ON Categoria.CategoriaID = Produtos.CategoriaID


    -- Selecionando Categorias

SELECT Produtos.Nome, Produtos.Preco FROM Produtos
INNER JOIN Categoria ON Produtos.CategoriaID = Categoria.CategoriaID
WHERE Categoria.Nome = 'Automacao Comercial';


SELECT Produtos.Nome, Produtos.Preco FROM Produtos
INNER JOIN Categoria ON Produtos.CategoriaID = Categoria.CategoriaID
WHERE Categoria.Nome = 'Informatica';


-- Comandos de Atualizar


--Preco de um Produto de uma loja 

UPDATE Produtos 
SET Preco=1000
WHERE Nome='Computador'

SELECT*FROM Produtos

--Endereço de uma loja

UPDATE Loja
SET Endereco= 'Rua das Palmeiras ,  n 100 / Jundiai-SP'
WHERE Nome= 'Crystal'

SELECT*FROM Loja

-- Nome de uma categoria

UPDATE Categoria
SET Nome= 'Salao de Beleza '
WHERE Nome= 'Artigos de Beleza '

SELECT*FROM Categoria







 --Passo 5: Comandos de Exclusão
 -- Exclua um Produto

 DELETE FROM Produtos WHERE Nome='Shampo Eudora'

-- Exclua um cliente 

DELETE FROM Clientes WHERE Nome='Eduardo Falico'

DELETE FROM Clientes WHERE ClientesID=8

SELECT*FROM Clientes




--  Alteração da Estrutura da Tabela

-- Adicione uma nova coluna em `Produtos` para armazenar a quantidade de estoque.

ALTER TABLE Produtos ADD Quantidad_Estoque INT

ALTER TABLE Produtos DROP COLUMN Quantidad_Estoque
GO



ALTER TABLE Produtos ADD Quantidade_Estoque INT


SELECT * FROM Produtos


UPDATE Produtos 
SET  Quantidade_Estoque = 20
WHERE ProdutosID=1 

UPDATE Produtos 
SET  Quantidade_Estoque = 100
WHERE ProdutosID=2


UPDATE Produtos 
SET  Quantidade_Estoque = 200
WHERE ProdutosID=4


-- Adicione uma nova coluna em `Cliente` para armazenar a data de cadastro

ALTER TABLE Clientes ADD Data_Cadastro DATE

SELECT * FROM Clientes


-- Chaves Estrangeiras e Relacionamentos

 CREATE TABLE Pedidos(
 PedidosID int identity primary key not null,
 Data_Compra date not null,
 Status_Pedido  Varchar (100),
 ClientesID int not null,
 ProdutosID int
 foreign key (ClientesID) references Clientes (ClientesID),
 foreign key (ProdutosID) references Produtos (ProdutosID)
 );

 SELECT*FROM Pedidos
 SELECT*FROM Clientes 
 SELECT*FROM Produtos

 -- Inserindo dados da tabelas pedidos fazendo cliente ID junto com ProdutosID

 INSERT INTO  Pedidos VALUES ('11/22/2024','Finalizado',4,1),
							('03/11/2025','Em Separação',1,2),
							('07/06/2024','Finalizado',3,4)




SELECT Pedidos.Data_Compra,Clientes.Nome,Clientes.E_mail,Produtos.Preco,
Pedidos.Status_Pedido FROM Pedidos
INNER JOIN  Clientes ON Clientes.ClientesID=Pedidos.ClientesID
INNER JOIN Produtos ON Produtos.ProdutosID=Pedidos.ProdutosID



-- Renomear coluna da tabela 


EXEC sp_rename 'Produtos.Preco', '', 'COLUMN';

-- Consultas e Alterações Avançadas

ALTER TABLE Pedidos ADD Qtd_Comprada INT

SELECT * FROM Produtos

-- Atualize a quantidade de um item em um pedido específico

UPDATE Pedidos
SET Qtd_Comprada = 5
WHERE PedidosID = 10;

UPDATE Pedidos
SET Qtd_Comprada = 12
WHERE PedidosID = 11;

UPDATE Pedidos
SET Qtd_Comprada = 25
WHERE PedidosID = 12;



--Selecao da atualizacao

SELECT Pedidos.Data_Compra,Clientes.Nome,Clientes.E_mail,Produtos.Valor, Pedidos.Qtd_Comprada ,Pedidos.Status_Pedido,
 SUM (Produtos.Valor * Pedidos.Qtd_Comprada) AS TotalGasto FROM Pedidos
INNER JOIN Clientes ON Clientes.ClientesID=Pedidos.ClientesID
INNER JOIN Produtos ON Produtos.ProdutosID=Pedidos.ProdutosID
GROUP BY 
    Pedidos.Data_Compra,
    Clientes.Nome,
    Clientes.E_mail,
    Produtos.Valor,
    Pedidos.Status_Pedido,
	Pedidos.Qtd_Comprada;



