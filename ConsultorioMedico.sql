

USE MASTER

CREATE DATABASE ConsultorioMedico

CREATE TABLE Paciente(IdPaciente int identity primary key not null,
Nome varchar (255) not null,
DataNascimento date not null,
Endereco varchar (255) not null,
Telefone varchar (255) not null,
);

CREATE TABLE Medico(IdMedico int identity primary key not null,
Nome varchar (255) not null,
CRM int not null,
IdEspecialidade int not null,
);

 
CREATE TABLE Especialidade(IdEspecialidade int identity primary key not null, 
Descricao text not null,
);


CREATE TABLE Consulta(IdConsulta int identity primary key not null,
IdPaciente int not null,
IdMedico int not null,
DataConsulta date not null,
Observacoes text not null,
);


ALTER TABLE Medico
ADD FOREIGN KEY (IdEspecialidade) REFERENCES Especialidade(IdEspecialidade);



ALTER TABLE Consulta 
ADD FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente);


ALTER TABLE Consulta 
ADD FOREIGN KEY (IdMedico) REFERENCES Medico(IdMedico);




INSERT INTO Paciente VALUES ('Eduardo Falico','11/11/1996','Rua das Flores n 40 Jundiai SP','11975502486'),
			('Isabelle Silva','03/12/1998','Rua das Aguas n 101 Louveira SP','19959504566')



INSERT INTO Medico VALUES('Dr Jose Ricardo',25665, 1),
						('Dra Alessandra Maia',25655,2)


INSERT INTO Especialidade VALUES('Clinico Geral'),
								('Pediatria')



INSERT INTO Consulta VALUES (2,1,'12/12/2024','Exames de sangue anexado em portifolios'),
					        (1,2,'11/25/2024','Exame de urina anexado')



select * from Paciente		   
select * from Especialidade
select * from Medico
select * from  Consulta

DELETE FROM Especialidade WHERE IdEspecialidade=3
DELETE FROM Especialidade WHERE IdEspecialidade=4


SELECT Paciente.IdPaciente, Paciente.Endereco,Paciente.Nome,Medico.Nome
FROM Consulta
INNER JOIN Medico ON Medico.IdEspecialidade = Consulta.IdMedico
INNER JOIN Paciente ON Paciente.IdPaciente = Consulta.IdPaciente





BACKUP DATABASE LojaInformaticaDB 
TO DISK = 'C:\temp\ConsultorioMedico.bak';