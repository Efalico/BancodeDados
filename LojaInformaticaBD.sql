--Entrar no Banco de dados

USE MASTER

--Criando a base de dadps 
CREATE DATABASE LojaInformaticaDB
GO

--Entrar na Base de Dados 

USE LojaInformaticaDB 
GO

--Criando Tabelas

CREATE TABLE Categoria(
CategoriaID int identity primary key,
Nome varchar (100) not null,
);


INSERT INTO Categoria VALUES ('Automacao Comercial'),
('Computadores'),('Informatica'), ('Pecas de Computadores'),('Perifericos'),('Cabos')


DROP TABLE Categoria

CREATE TABLE Produtos (
ProdutoID int identity primary key,
Nome varchar(100) not null,
Descrição text not null,
Preço decimal not null,
Estoque int not null 
);


INSERT INTO Produtos VALUES ('Sat Fiscal','NotaFiscal', 500.00,40),
							('Computador','PC',850.00,55),
							('Impressora','Tintas',1100.00,105),
							('Placa Mae','Peca',560.00,100),
							('Mouse','Cabeado',25.00,102),
							('Cabo Energia','Votltagem',10.00,200)
							



DROP TABLE Produtos


CREATE TABLE Clientes(
ClienteID int identity primary key,
Nome varchar(100) not null,
Email varchar (100) not null,
Telefone varchar (100) not null,
Endereço text not null
);




INSERT INTO Clientes VALUES ('Vitória Preterotto','vitoria@gmail.com','Av. Jundiai, 111 - Jundiaí/SP','19 91199 1119'),
						   ('Eduardo Falico','eduardofalico@gmail.com','Rua das Flores, 250 - Extrema/MG','41 99888 8899'),
						   ('Achilley Lais','achilley@gmail.com','Rua Do Patriocinio, 123 - São Paulo/SP','11 98765 4321');



DROP TABLE Clientes


CREATE TABLE Pedidos (
PedidoID int identity primary key,
Nome varchar(100) not null,
ClienteID int not null,
DataPedido date not null,
Situação varchar (100) not null,
FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Pedidos VALUES ('Senac',2,'10/25/2024','Aguardando pagamento'),
						  ('Leroy Merlin',1,'10/25/2024','Concluído'),
						  ('Auto Som',3,'11/01/2024','Em separação');




DROP TABLE Pedidos


CREATE TABLE ItensPedidos (
ItemID int identity primary key,
PedidoID int  not null,
ProdutoID int not null,
Quantidade int not null,
Preco_Unitario decimal not null,
FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);



INSERT INTO ItensPedidos VALUES (2, 3, 2,500),
							  (1, 3, 1,1000),
							  (3, 3, 5,25);




DROP ItensPedidos


						   
SELECT*FROM Categoria
SELECT*FROM Pedidos
SELECT*FROM Clientes
SELECT*FROM Produtos
SELECT*FROM ItensPedidos




BACKUP DATABASE LojaInformaticaDB 
TO DISK = 'C:\temp\LojaInformaticaBD.bak';




