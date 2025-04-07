create database livraria;
use livraria;
create table livros (
id int not null auto_increment primary key,
Nome_Do_Livro varchar(300),
Nome_Do_Autor varchar(150),
Sexo_Do_Autor enum('M','F'),
Numero_De_Paginas int unsigned,
UF_Editora varchar(2),
Ano_Publicacao date
);

desc livros;

alter table livros change column Ano_Publicacao Ano_Publicacao YEAR;
alter table livros add column Nome_Da_Editora varchar(100) after Numero_De_Paginas;
alter table livros add column Valor_Do_Livro decimal(65,2) after Nome_Da_Editora;

insert into livros
(Nome_Do_Livro,Nome_Do_Autor,Sexo_Do_Autor,Numero_De_Paginas,Nome_Da_Editora,Valor_Do_Livro,UF_Editora,Ano_Publicacao)
values
('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009),
('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018),
('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008),
('Pessoas efetivas','Eduardo Santos','M',390,'Beta',78.99,'RJ',2018),
('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150.98,'RJ',2019),
('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016),
('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015),
('Pra sempre amigas','Leda Silva','F',510,'Insignia',78.98,'ES',2011),
('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130.98,'RS',2018),
('O poder da mente','Clara Mafra','F',120,'Continental',56.58,'SP',2017);

select*from livros;
select Nome_Do_Livro, Nome_da_Editora from livros;
select Nome_Do_Livro,UF_Editora from livros
where Sexo_Do_Autor = 'M';
select Nome_Do_Livro,Numero_De_Paginas from livros
where Sexo_Do_Autor = 'F';
select Valor_Do_Livro from livros
where UF_Editora = 'SP';
select * from livros
where Sexo_Do_Autor = 'M' and UF_Editora in ('SP','RJ');