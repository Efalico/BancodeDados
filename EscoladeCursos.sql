--Entrar no Banco de dados

USE MASTER

--Criando a base de dadps 
CREATE DATABASE EscoladeCursos
GO

--Entrar na Base de Dados 

USE EscoladeCursos
GO
--Criando Tabelas

CREATE TABLE Curso (
CursoID int identity primary key,
Nome varchar(100) not null,
Descrição text not null,
CargaHoraria int not null 
);



CREATE TABLE Aluno (
AlunoID int identity primary key,
Nome varchar(100) not null,
DatadeNascimento date not null,
Email varchar (100) not null 
);


CREATE TABLE Instrutor (
InstrutorID int identity primary key,
Nome varchar(100) not null,
Especialidade varchar (100) not null 
);

drop table Instrutor

CREATE TABLE Turma (
TurmaID int identity primary key,
CursoID int  null,
InstrutorID int not null,
DataInicio date not null,
DataFim date not null,
FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
FOREIGN KEY (InstrutorID) REFERENCES Instrutor(InstrutorID)
);



drop table Turma 

CREATE TABLE Matricula (
MatriculaID int identity primary key,
CursID int  not null,
Instrutor int not null,
AlunoID int not null,
TurmaID int not null,
FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
FOREIGN KEY (TurmaID) REFERENCES Turma(TurmaID)
);



INSERT INTO Curso VALUES ('Tecnico em Informatica', 'Desenvovimento Banco de dados',1600)

INSERT INTO Aluno VALUES('Eduardo Falico','11/11/1996','eeasuporte@suporte.com')

INSERT INTO Instrutor VALUES('Marcos Cozati','Tecnico de TI46')

INSERT INTO Turma VALUES(1,1,'08/10/2023','07/15/2025')

INSERT INTO Matricula VALUES (1,1,'07/25/2023')




SELECT*FROM Curso
SELECT*FROM Aluno
SELECT*FROM Instrutor
SELECT*FROM Turma 
SELECT*FROM Matricula



FOREIGN KEY (InstrutorID) REFERENCES Instrutor(InstrutorID)
