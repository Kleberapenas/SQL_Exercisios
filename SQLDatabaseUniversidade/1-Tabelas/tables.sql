create database Universidade;
use Universidade;

create table Alunos (
	id_aluno int primary key,
	registro int,
	nome varchar(200),
	periodo_aula enum('Diurno','Tarde','Noturno','Integral'),
	Status_Escolar enum ('Ativo', 'trancado')
	FOREIGN key id_curso REFERENCES curso_aluno(id_curso)
);
go

create table Professores (
	id_professor int primary key,
	registro int,
	nome varchar(200),
	periodo_ativo enum('Diurno','Tarde','Noturno','Integral')
);
go

create table aulas(
id_aula int primary key,
horario_aula timestamp
);
go

create table Cursos(
id_curso int primary key,
nome varchar(200)
);
go

create table Disciplinas(
	id_disciplinas int primary key,
	nome varchar(200)
);
go

create table Departamentos(
	id_departamento int primary key,
	nome varchar(200)
);
go

create tab
