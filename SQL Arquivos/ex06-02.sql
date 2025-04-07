create database joins;
use joins;

create table autor (
ID_Autor int not null auto_increment primary key,
Nome_Autor varchar(50)
);

create table livro (
ID_Livro int not null auto_increment primary key,
Nome_Livro varchar(50),
FK_A int,
foreign key(FK_A) references autor(ID_Autor)
);

insert into autor(ID_Autor,Nome_Autor)
values
(default,'Luana Farias'),
(default,'Ronaldo'),
(default,'Marcos'),
(default,'Alessandra'),
(default,'Fabiano');

insert into livro(ID_Livro,Nome_Livro,FK_A)
values
(default,'CSS',5),
(default,'HTML',1),
(default,'C++',3),
(default,'Python',NULL),
(default,'PHP',2);

select*from autor;
select*from livro;

-- 8
select autor.Nome_Autor, livro.Nome_Livro from autor
inner join livro
on autor.ID_Autor = livro.FK_A;

-- 9
select autor.Nome_Autor, livro.Nome_Livro from autor
left join livro
on autor.ID_Autor = livro.FK_A;

-- 10
select autor.Nome_Autor, livro.Nome_livro from autor
right join livro
on autor.ID_Autor = livro.FK_A;

select autor.Nome_Autor, livro.Nome_Livro from autor
left join livro
on autor.ID_Autor = livro.FK_A
union
select autor.Nome_Autor, livro.Nome_Livro from autor
right join livro
on autor.ID_Autor = livro.FK_A

