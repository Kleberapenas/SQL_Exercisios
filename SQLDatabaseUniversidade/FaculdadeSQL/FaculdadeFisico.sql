use Universidade
go

create table Departamento (
	Cod_departamento INT PRIMARY KEY IDENTITY(1,1),
	Nome_departamento VARCHAR(100) NOT NULL,
)
go

create table Endereco (
	Cod_endereco INT PRIMARY KEY,
	complemento INT,
	rua VARCHAR(255),
	numero INT,
	bairro VARCHAR(255),
	cidade VARCHAR(255),
	estado VARCHAR(255),
	cep INT
)
go

CREATE TABLE Curso_Disciplina (
	Cod_curso INT,
	Cod_disciplina INT,
	tipo_disciplina VARCHAR(20) NOT NULL,
	PRIMARY KEY(Cod_curso, Cod_disciplina),
	FOREIGN KEY (Cod_curso) REFERENCES Curso(Cod_Curso),
	FOREIGN KEY (Cod_disciplina) REFERENCES Disciplina(Cod_disciplina)
)
go

create table Alunos (
	RA_Aluno INT PRIMARY KEY,
	Cod_endereco INT,
	Cod_telefone INT,
	Cod_email INT,
	Nome_aluno VARCHAR(255),
	FOREIGN KEY(Cod_endereco) REFERENCES Endereco(Cod_endereco)
)
go

create table Professor (
	Cod_professor INT PRIMARY KEY,
	Cod_endereco INT,
	Cod_telefone INT,
	Cod_email INT,
	Nome_professor VARCHAR(255),
	Sobrenome_professor VARCHAR(255),
	Data_contratacao DATE,
	Tipo_vinculo VARCHAR(50),
	CPF VARCHAR(14),
	RG VARCHAR(20),
	titulacao VARCHAR(255),
	cod_departamento INT,
	status_professor enum('ativo','inativo')
)
go