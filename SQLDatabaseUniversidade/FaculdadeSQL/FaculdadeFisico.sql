CREATE DATABASE Universidade
use Universidade
go

create table Departamentos (
	cod_departamento INT PRIMARY KEY IDENTITY(1,1),
	nome_departamento VARCHAR(100) NOT NULL,
)
go

create table Endereco (
	cod_endereco INT PRIMARY KEY,
	complemento INT,
	rua VARCHAR(255),
	numero INT,
	bairro VARCHAR(255),
	cidade VARCHAR(255),
	estado VARCHAR(255),
	cep INT
)
go

create table Alunos (
	ra_aluno INT PRIMARY KEY,
	cod_endereco INT,
	cod_telefone INT,
	cod_email INT,
	nome_aluno VARCHAR(255),
	FOREIGN KEY(Cod_endereco) REFERENCES Endereco(Cod_endereco)
)
go

create table Professor (
	cod_professor INT PRIMARY KEY,
	cod_endereco INT,
	cod_telefone INT,
	cod_email INT,
	nome_professor VARCHAR(255),
	sobrenome_professor VARCHAR(255),
	data_contratacao DATE,
	tipo_vinculo VARCHAR(50),
	cpf VARCHAR(14),
	rg VARCHAR(20),
	titulacao VARCHAR(255),
	cod_departamento INT,
	status_professor VARCHAR(20),
	CHECK (status_professor IN ('ativo','inativo'))
)
go

CREATE TABLE Email (
	cod_email INT PRIMARY KEY IDENTITY(1,1),
	email_pessoal VARCHAR(255) NOT NULL,
	email_corporativo VARCHAR(255)
)
go

CREATE TABLE Telefone (
	cod_telefone INT PRIMARY KEY IDENTITY(1,1),
	telefone_residencial INT NOT NULL,
	telefone_comercial INT,
	telefone_recado INT NOT NULL
)
go

CREATE TABLE Cursos (
	cod_curso INT NOT NULL,
	nome_curso VARCHAR(255) NOT NULL,
	tipo varchar(255) NOT NULL,
	duracao_meses DATE NOT NULL,
	cod_departamento INT NOT NULL,
	turno VARCHAR(10) NOT NULL,
	carga_horaria_total date NOT NULL,
	modalidade VARCHAR(255) NOT NULL,
	cod_prof_coordenador INT NOT NULL,
	PRIMARY KEY(cod_curso)
)
go

CREATE TABLE Disciplinas (
	cod_disciplina INT NOT NULL,
	nome_disciplina VARCHAR(255) NOT NULL,
	cod_departamento INT NOT NULL,
	carga_horaria DATE NOT NULL,
	cod_curso INT NOT NULL,
	PRIMARY KEY(cod_disciplina),
	FOREIGN KEY (cod_departamento) REFERENCES Departamentos(cod_departamento),
	FOREIGN KEY (cod_curso) REFERENCES Cursos(cod_curso)
)
go

CREATE TABLE Historico (
	cod_disciplina INT NOT NULL,
	ra_aluno INT NOT NULL,
	ano INT NOT NULL,
	semestre INT NOT NULL,
	nota DECIMAL(4,2) NOT NULL,
	frequencia DECIMAL(5,2) NOT NULL,
	situacao VARCHAR(20) NOT NULL,
	PRIMARY KEY (cod_disciplina, ra_aluno, ano, semestre),
	FOREIGN KEY (cod_disciplina) REFERENCES Disciplinas(cod_disciplina),
	FOREIGN KEY (ra_aluno) REFERENCES Alunos(ra_aluno)
)
go

CREATE TABLE Turma (
	cod_turma INT IDENTITY(1,1) NOT NULL,
	cod_curso INT NOT NULL,
	sala INT NOT NULL,
	ano INT NOT NULL,
	semestre INT NOT NULL,
	cod_disciplina INT NOT NULL,
	cod_professor INT NOT NULL,
	periodo varchar(20),
	num_aluno INT,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	PRIMARY KEY (cod_turma),
	CHECK (periodo IN ('manhã','tarde','noite','integral'))
)
go

CREATE TABLE Matricula(
	cod_matricula INT IDENTITY(1,1) NOT NULL,
	ra_aluno INT NOT NULL,
	cod_turma INT NOT NULL,
	data_matricula DATE NOT NULL,
	data_cancelamento DATE,
	status_matricula VARCHAR(20),
	PRIMARY KEY (cod_matricula),
	CHECK (status_matricula IN ('Cursando','Trancado'))
)
go

CREATE TABLE Notas (
	cod_notas INT IDENTITY(1,1) NOT NULL,
	ra_aluno INT NOT NULL,
	cod_disciplina INT NOT NULL,
	nota INT,
	PRIMARY KEY (cod_notas),
	FOREIGN KEY (ra_aluno) REFERENCES Alunos(ra_aluno),
	FOREIGN KEY (cod_disciplina) REFERENCES Disciplinas(cod_disciplina)
)
go

CREATE TABLE Telefone_aluno (
	cod_telefone INT IDENTITY(1,1),
	ra_aluno VARCHAR(255) NOT NULL,
	num_telefone VARCHAR(255) NOT NULL,
	tipo_telefone VARCHAR(30) NOT NULL,
	PRIMARY KEY (cod_telefone)
)
go

CREATE TABLE Telefone_professor (
	cod_telefone INT IDENTITY(1,1),
	cod_professor VARCHAR(255) NOT NULL,
	num_telefone VARCHAR(255) NOT NULL,
	tipo_telefone VARCHAR(30) NOT NULL,
	PRIMARY KEY (cod_telefone)
)
go

CREATE TABLE Curso_Disciplina (
	cod_curso INT,
	cod_disciplina INT,
	tipo_disciplina VARCHAR(20) NOT NULL,
	PRIMARY KEY(Cod_curso, Cod_disciplina),
	FOREIGN KEY (cod_curso) REFERENCES	Cursos(cod_Curso),
	FOREIGN KEY (cod_disciplina) REFERENCES Disciplinas(cod_disciplina),
	CHECK (tipo_disciplina IN ('Obrigado','Optativa'))
)
go

CREATE TABLE Professor_Disciplina (
	cod_professor INT NOT NULL,
	cod_disciplina INT NOT NULL,
	PRIMARY KEY (cod_professor, cod_disciplina),
	FOREIGN KEY (cod_professor) REFERENCES Professor(cod_professor),
	FOREIGN KEY (cod_disciplina) REFERENCES Disciplinas(cod_disciplina)
)
go

INSERT INTO Professor_Disciplina (cod_professor, cod_disciplina)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
go

INSERT INTO Departamentos (nome_departamento) VALUES ('Engenharia');
INSERT INTO Departamentos (nome_departamento) VALUES ('Matemática');
INSERT INTO Departamentos (nome_departamento) VALUES ('Física');
INSERT INTO Departamentos (nome_departamento) VALUES ('Química');
INSERT INTO Departamentos (nome_departamento) VALUES ('Computação');
go

INSERT INTO Endereco (cod_endereco, complemento, rua, numero, bairro, cidade, estado, cep) VALUES (1, 101, 'Rua A', 123, 'Centro', 'São Paulo', 'SP', 12345678);
INSERT INTO Endereco (cod_endereco, complemento, rua, numero, bairro, cidade, estado, cep) VALUES (2, 202, 'Rua B', 456, 'Zona Sul', 'Rio de Janeiro', 'RJ', 23456789);
INSERT INTO Endereco (cod_endereco, complemento, rua, numero, bairro, cidade, estado, cep) VALUES (3, 303, 'Rua C', 789, 'Zona Norte', 'Belo Horizonte', 'MG', 34567890);
INSERT INTO Endereco (cod_endereco, complemento, rua, numero, bairro, cidade, estado, cep) VALUES (4, 404, 'Rua D', 321, 'Zona Leste', 'Curitiba', 'PR', 45678901);
INSERT INTO Endereco (cod_endereco, complemento, rua, numero, bairro, cidade, estado, cep) VALUES (5, 505, 'Rua E', 654, 'Centro', 'Porto Alegre', 'RS', 56789012);
go

INSERT INTO Alunos (ra_aluno, cod_endereco, cod_telefone, cod_email, nome_aluno) VALUES (1001, 1, 1, 1, 'João Silva');
INSERT INTO Alunos (ra_aluno, cod_endereco, cod_telefone, cod_email, nome_aluno) VALUES (1002, 2, 2, 2, 'Maria Oliveira');
INSERT INTO Alunos (ra_aluno, cod_endereco, cod_telefone, cod_email, nome_aluno) VALUES (1003, 3, 3, 3, 'Pedro Souza');
INSERT INTO Alunos (ra_aluno, cod_endereco, cod_telefone, cod_email, nome_aluno) VALUES (1004, 4, 4, 4, 'Ana Costa');
INSERT INTO Alunos (ra_aluno, cod_endereco, cod_telefone, cod_email, nome_aluno) VALUES (1005, 5, 5, 5, 'Lucas Lima');
go

INSERT INTO Professor VALUES (1, 1, 1, 1, 'Lucas', 'Silva', '2015-08-12', 'efetivo', '123.456.789-00', 'MG-12.345.678', 'Doutorado', 1, 'ativo');
INSERT INTO Professor VALUES (2, 2, 2, 2, 'Maria', 'Oliveira', '2017-05-30', 'efetivo', '234.567.890-11', 'SP-98.765.432', 'Doutorado', 2, 'ativo');
INSERT INTO Professor VALUES (3, 3, 3, 3, 'João', 'Souza', '2019-09-22', 'efetivo', '345.678.901-22', 'RJ-87.654.321', 'Doutorado', 3, 'ativo');
INSERT INTO Professor VALUES (4, 4, 4, 4, 'Ana', 'Pereira', '2020-01-15', 'efetivo', '456.789.012-33', 'PR-76.543.210', 'Doutorado', 4, 'ativo');
INSERT INTO Professor VALUES (5, 5, 5, 5, 'Carlos', 'Almeida', '2021-03-18', 'efetivo', '567.890.123-44', 'BA-65.432.109', 'Doutorado', 5, 'ativo');
go

INSERT INTO Email (email_pessoal, email_corporativo) VALUES ('lucas@email.com', 'lucas@uni.com');
INSERT INTO Email (email_pessoal, email_corporativo) VALUES ('maria@email.com', 'maria@uni.com');
INSERT INTO Email (email_pessoal, email_corporativo) VALUES ('joao@email.com', 'joao@uni.com');
INSERT INTO Email (email_pessoal, email_corporativo) VALUES ('ana@email.com', 'ana@uni.com');
INSERT INTO Email (email_pessoal, email_corporativo) VALUES ('carlos@email.com', 'carlos@uni.com');
go

INSERT INTO Telefone (telefone_residencial, telefone_comercial, telefone_recado) VALUES (12345678, 23456789, 34567890);
INSERT INTO Telefone (telefone_residencial, telefone_comercial, telefone_recado) VALUES (22345678, 33456789, 44567890);
INSERT INTO Telefone (telefone_residencial, telefone_comercial, telefone_recado) VALUES (32345678, 43456789, 54567890);
INSERT INTO Telefone (telefone_residencial, telefone_comercial, telefone_recado) VALUES (42345678, 53456789, 64567890);
INSERT INTO Telefone (telefone_residencial, telefone_comercial, telefone_recado) VALUES (52345678, 63456789, 74567890);
go

INSERT INTO Cursos VALUES (1, 'Análise de Sistemas', 'Tecnólogo', '2020-01-01', 1, 'Manhã', '2022-01-01', 'Presencial', 1);
INSERT INTO Cursos VALUES (2, 'Administração', 'Bacharelado', '2020-01-01', 2, 'Tarde', '2022-01-01', 'Presencial', 2);
INSERT INTO Cursos VALUES (3, 'Engenharia Civil', 'Bacharelado', '2020-01-01', 3, 'Noite', '2022-01-01', 'Presencial', 3);
INSERT INTO Cursos VALUES (4, 'Design Gráfico', 'Tecnólogo', '2020-01-01', 4, 'Integral', '2022-01-01', 'Presencial', 4);
INSERT INTO Cursos VALUES (5, 'Psicologia', 'Bacharelado', '2020-01-01', 5, 'Manhã', '2022-01-01', 'Presencial', 5);
go

INSERT INTO Disciplinas VALUES (1, 'Matemática Aplicada', 1, '2020-01-01', 1);
INSERT INTO Disciplinas VALUES (2, 'Contabilidade Básica', 2, '2020-01-01', 2);
INSERT INTO Disciplinas VALUES (3, 'Física Geral', 3, '2020-01-01', 3);
INSERT INTO Disciplinas VALUES (4, 'Teoria das Cores', 4, '2020-01-01', 4);
INSERT INTO Disciplinas VALUES (5, 'Psicologia Social', 5, '2020-01-01', 5);
go

INSERT INTO Historico VALUES (1, 1001, 2022, 1, 8.5, 95.00, 'Aprovado');
INSERT INTO Historico VALUES (2, 1002, 2022, 1, 7.0, 90.00, 'Aprovado');
INSERT INTO Historico VALUES (3, 1003, 2022, 1, 6.5, 85.00, 'Aprovado');
INSERT INTO Historico VALUES (4, 1004, 2022, 1, 9.0, 98.00, 'Aprovado');
INSERT INTO Historico VALUES (5, 1005, 2022, 1, 5.5, 80.00, 'Reprovado');
go

INSERT INTO Turma (cod_curso, sala, ano, semestre, cod_disciplina, cod_professor, periodo, num_aluno, data_inicio, data_fim) VALUES 
(1, 101, 2024, 1, 1, 1, 'manhã', 30, '2024-01-01', '2024-06-01'),
(2, 102, 2024, 1, 2, 2, 'tarde', 28, '2024-01-01', '2024-06-01'),
(3, 103, 2024, 1, 3, 3, 'noite', 32, '2024-01-01', '2024-06-01'),
(4, 104, 2024, 1, 4, 4, 'integral', 25, '2024-01-01', '2024-06-01'),
(5, 105, 2024, 1, 5, 5, 'manhã', 27, '2024-01-01', '2024-06-01');
go

INSERT INTO Matricula (ra_aluno, cod_turma, data_matricula, data_cancelamento, status_matricula) VALUES 
(1001, 1, '2024-01-01', NULL, 'Cursando'),
(1002, 2, '2024-01-01', NULL, 'Cursando'),
(1003, 3, '2024-01-01', NULL, 'Cursando'),
(1004, 4, '2024-01-01', NULL, 'Cursando'),
(1005, 5, '2024-01-01', NULL, 'Cursando');
go

INSERT INTO Notas (ra_aluno, cod_disciplina, nota) VALUES 
(1001, 1, 9),
(1002, 2, 7),
(1003, 3, 6),
(1004, 4, 8),
(1005, 5, 5);
go

INSERT INTO Telefone_aluno (ra_aluno, num_telefone, tipo_telefone) VALUES 
('1001', '3199990001', 'celular'),
('1002', '3199990002', 'celular'),
('1003', '3199990003', 'celular'),
('1004', '3199990004', 'celular'),
('1005', '3199990005', 'celular');
go

INSERT INTO Telefone_professor (cod_professor, num_telefone, tipo_telefone) VALUES 
('1', '3198880001', 'residencial'),
('2', '3198880002', 'residencial'),
('3', '3198880003', 'residencial'),
('4', '3198880004', 'residencial'),
('5', '3198880005', 'residencial');
go

INSERT INTO Curso_Disciplina VALUES (1, 1, 'Obrigado');
INSERT INTO Curso_Disciplina VALUES (2, 2, 'Obrigado');
INSERT INTO Curso_Disciplina VALUES (3, 3, 'Obrigado');
INSERT INTO Curso_Disciplina VALUES (4, 4, 'Obrigado');
INSERT INTO Curso_Disciplina VALUES (5, 5, 'Obrigado');
go

select*from Endereco
select*from Disciplinas
select*from Alunos
select*from Professor
select*from Telefone_aluno
select*from Telefone_professor
select*from Notas
select*from Matricula
select*from Turma
select*from Email
select*from Curso_Disciplina
select*from Cursos
select*from Departamentos
select*from Historico
select*from Professor_Disciplina
go

select Alunos.ra_aluno, Disciplinas.cod_disciplina, Notas.nota 
from Notas
JOIN Alunos ON Notas.ra_aluno=Alunos.ra_aluno
JOIN Disciplinas ON Notas.cod_disciplina=Disciplinas.cod_disciplina
go