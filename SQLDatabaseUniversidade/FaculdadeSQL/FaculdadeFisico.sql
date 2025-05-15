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
	PRIMARY KEY (cod_notas)
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

