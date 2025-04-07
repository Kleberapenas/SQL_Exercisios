#comentario de uma linha
-- comentarío de uma linha
/**/
-- Cria uma database cadastro
create database Cadastro;
-- Mostra todas as databases
show databases;
-- Usa a database Cadastro
use Cadastro;

-- Cria uma tabela clientes
create table clientes (
nome varchar (40), -- valor variavel com limite de 40 characteres
idade tinyint (3), -- inteiro com limite de 3 caracteres
sexo char(1),
peso float, -- valor float
altura  float,
nacionalidade varchar(25)
);
-- Deleta a tabela Cadastro
drop database Cadastro;
-- Cria a tabela Clientes
create table Clientes (
-- A keyword unique garante que todos os valores da coluna sejam unicos
IDCliente int not null unique primary key,
NomeCliente varchar(255) not null
);

create database cadastro;
use cadastro;
create table clientes (
nome varchar (45) not null, -- 'not null' impede que o valor seja nulo
nascimento date,
sexo enum ('M','F'), -- enum 
peso decimal (5,2),
altura decimal (3,2), -- valor decimal com limite de 3 digitos inteiros e duas casas decimais
nacionalidade varchar(25) default 'Brasil' -- 'default' é o valor que sera atribuido caso nenhum seja indicado
);

desc clientes;

alter table clientes
add column id int not null auto_increment primary key;

alter table clientes
drop column id;

alter table clientes
add column id int not null auto_increment primary key first;
desc clientes;
alter table clientes
add column estado_civil varchar(40) after nascimento;
desc clientes;

alter table clientes
drop column estado_civil;
desc clientes;

insert into clientes
(nome,nascimento,sexo,peso,altura,nacionalidade)
values
('Marcelo','1968-11-15','M','88.10','1.85',' ');
select * from clientes;

update clientes
set nacionalidade='Brasil'Where id='1';
select*from clientes;

insert into clientes
(nome,nascimento,sexo,peso,altura,nacionalidade)
values
('Simone','1970-10-28','F','75','1.67',default);
select*from clientes;

alter table clientes
modify column nome varchar(60);
select*from clientes;
desc clientes;

alter table clientes
change column sexo genero enum('M','F');

alter table clientes rename to clientes1;
show tables;
alter table clientes1 rename to clientes;

insert into clientes
(nome,nascimento,genero,peso,altura,nacionalidade)
values
('Fernando','1978-10-28','F','70.5','1.58',default),
('Julio','2010-08-26','M','55.6','1.69',default),
('Davi','2014-06-30','M','34.8','1.48',default),
('Silvana','1963-03-11','F','64.5','1.52',default);

delete from clientes where id=6;

desc clientes;

alter table clientes
add column profissao varchar(20) after nome;
select*from clientes;
alter table clientes
change column profissao cargo varchar(20);
update clientes set cargo='TI' where id=1;
update clientes set cargo='Gerente' where id=2;
update clientes set cargo='Administrativo' where id=3;
update clientes set cargo='Assist. Contábil' where id=4;
update clientes set cargo='Aux. ADM' where id=5;

create table if not exists cursos(
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
qtdaulas int unsigned,
ano year default '2024');

alter table cursos
add column id int not null auto_increment primary key first;
desc cursos; 

insert into cursos
(nome,descricao,carga,qtdaulas,ano)
values
('Pacote officce','Nivel Básico','96','24','2000'),
("Exel básico","Nível intermediário","40","10","2012"),
("Excel Avançado","Nível Avançado","160","40","2028"),
("SQL","Nível Avançado","120","30","2004");
select*from cursos;

update cursos
set ano = '2025'
where id=4;

delete from cursos
where id=3;

update cursos
set nome ='Excel básico', ano='2020',carga='40'
where id = '2';

update cursos
set ano='2040',carga='500'
where ano = '2020';

-- Muda a informação em cargo se a informação dentro dele for igual a 'Aux. ADM'
update clientes
set cargo='Aux. Administrativo'
where cargo='Aux. ADM';

create table clientes2 as select*from clientes;

-- Deleta a data dentro de uma tabela porém não deleta a tabela em si
truncate table clientes2;

-- Seleciona todas a colunas em clientes2 e mostra elas na tela
select*from clientes2;

drop table clintes2;

-- mostra uma descrição de cursos
desc cursos;

-- Cria uma nova tabela chamada cursos2 com todas a colunas de cursos
create table cursos2 select*from cursos;

-- deleta a tabela cursos
drop table cursos;

-- ordena a tabela cursos
select*from cursos
order by nome desc;

-- ordena a tabela em ordem descendente
select*from cursos
order by nome desc;

select*from cursos;

-- Indica apenas as colunas desejadas ao invez de todas as colunas como como *
select nome, carga, ano from cursos
order by nome;

select ano, nome, carga from cursos
order by ano;

-- Seleciona todas as mostra todas as colunas de curso porém mostra apenas as linhas cujo o valor de anos é igual a 2016 e as ordenas por nome
select*from cursos
where ano='2016'
order by nome;

-- mostra as colunas nome e carga onde a linha tiver valor de 2016 na coluna ano e ordena pelo nome
select nome, carga from cursos
where ano = '2016'
order by nome;

-- mostra as colunas ano, nome e descricao onde a linha tem valor igual ou menor a 2015
select ano, nome, descricao from cursos
where ano <= '2015'
order by nome;

-- se o valor de ano for diferente de 2016
select ano, nome, descricao from cursos
where ano != '2016'
order by ano, nome;

-- Mostra as colunas Ano e Nome onde Ano esta entre 2014 e 2016
select ano, nome from cursos
where ano between '2014' and '2016';

-- Mostras todas as colunas, onde Carga maior que 35 E totaulas menor que 30
select * from cursos
where carga > 35 and totaulas < 30
order by nome;

-- Mostra as colunas Nome, Carga e totaulas onde carga maior 35 OU totaulas menor 30
select nome, carga, totaulas from cursos
where carga > 35 or totaulas < 30
order by nome;

-- Mostra idcurso, ano e nome onde Ano é 2016, 2014, 2018
select idcurso, ano, nome from cursos where ano in ( 2016,2014, 2018);

-- Seleciona todas as colunas do cursos e mostra os valores cujo a fileira nome termine em a
select*from cursos
where nome like '%a';

-- Seleciona
select * from cursos
where nome like 'PH%P_';

select count(*) from cursos;
select * from cursos where carga > 40;
select max(totaulas) from cursos where ano = 2016;
select min(totaulas) from cursos;
select sum(totaulas) from cursos;
select avg(totaulas) from cursos;

select*from alunos 
where seco = 'F' order by nome;

select*from alunos 
where nascimento between '2000-01-01' and '2015-12-31';

select carga, totaulas from cursos
where totaulas = 30
group by carga;

select carga, count(nome) from cursos
where totaulas = 30
group by carga;

select ano, count(nome) from cursos
group by ano
order by ano;

select ano, count(nome) from cursos
group by ano
order by count(*);

select ano, count(nome) from cursos
group by ano
order by count(*) desc;

select ano, count(nome) from cursos
group by ano
having count(ano) >= 5
order by count(*) desc;

select ano, count(nome) from cursos
where totaulas > 30
group by ano
having ano > 2013
order by count(*);

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

select nome, carga, ano from cursos
group by nome, carga, ano
order by idcurso;

use cadastro;
create table Vendas (
ID Smallint auto_increment Primary Key,
Nome_Vendedor Varchar(80),
Quantidade Int,
Produto Varchar(60),
Cidade Varchar(50),
UF Varchar (2)
);

insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade, UF)
values
(default,'Luana',1800,'Celular','São Paulo', 'SP'),
(default,'Carla',2300,'Webcam','Recife', 'PE'),
(default,'Joao',1900,'Mouse','São Paulo', 'SP'),
(default,'Jorge',1700,'Webcam','Rio de Janeiro','RJ'),
(default,'Pedro',2120,'Celular','Recife', 'PE'),
(default,'andre',3980,'Mouse','São Paulo','SP'),
(default,'Fabiana',2120,'Webcam','Recife', 'PE'),
(default,'Rosana',1480,'Mouse','Rio de Janeiro','RJ'),
(default,'Roberto',4150,'Celular','Minas Gerais','MG'),
(default,'Rose',2100,'Celular','São Paulo','SP'),
(default,'Marcos',3200,'Mouse','Minas Gerais','MG'),
(default,'Davi',1500,'Webcam','Recife', 'PE'),
(default,'Marcelo',3010,'Mouse','Rio de Janeiro','RJ'),
(default,'Roberto',5620,'Celular','São Paulo','SP');

select*from vendas;

select sum(Quantidade) as Total_Celular
from Vendas
where Produto='celular';

select Cidade, sum(Quantidade) as Total
from Vendas
group by Cidade;

select Cidade, sum(Quantidade) as Total
from Vendas
group by Cidade
having Cidade='Recife';

select Cidade, sum(Quantidade) as Total
from Vendas
group by Cidade
having Cidade='São Paulo';

select alunos.nome, alunos.cursopreferido, cursos.nome, cursos.ano
from alunos join cursos
on cursos.idcurso = alunos.cursopreferido;

select a.nome, a.cursopreferido, c.nome, c.ano
from alunos as a join cursos as c
on c.idcurso = a.cursopreferido
order by a.nome;

select * from alunos;
select * from cursos;

create table aluno_assiste_curso (
id int not null auto_increment,
data date,
idalunos int,
idcurso int,
primary key(id),
foreign key (idalunos) references alunos(id),
foreign key (idcurso) references cursos (idcurso)
);

desc alunos;

insert into aluno_assiste_curso values
(default, '2014-03-01','1','2'),
(default, '2014-12-22','3','6'),
(default, '2014-01-01','22','12'),
(default, '2014-05-12','1','19');

select * from alunos
join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idalunos;

select alunos.nome, aluno_assiste_curso.idcurso from alunos
join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idalunos
order by alunos.nome;

select alunos.nome, cursos.nome from alunos
join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idalunos
join cursos
on cursos.idcurso = aluno_assiste_curso.idcurso
order by alunos.nome;

select alunos.nome, cursos.nome from alunos
left join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idcurso
left join cursos
on cursos.idcurso = aluno_assiste_curso.idcurso;

select alunos.nome, cursos.nome from alunos
right join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idcurso
right join cursos
on cursos.idcurso = aluno_assiste_curso.idcurso;

use comercio;

create view V_Relatorio as
select clientes.nome, clientes.sexo, clientes.email,
telefone.tipo, telefone.numero,
endereco.bairro, endereco.cidade, endereco.estado from clientes
join telefone
on clientes.IDCliente = telefone.id_cliente
join endereco
on clientes.IDCliente = endereco.id_cliente;

select*from V_Relatorio;

select nome, numero, estado from V_Relatorio;

update V_Relatorio
set nome='Jose'
where nome = 'Jorge';

select*from V_Relatorio
where sexo='F'
order by 'nome';

alter table clientes
add column data_ult_compra date;
update clientes set data_ult_compra = '2024-08-01' where idcliente = '1';
update clientes set data_ult_compra = '2025-08-01' where idcliente = '2';
update clientes set data_ult_compra = '2024-08-01' where idcliente = '3';
update clientes set data_ult_compra = '2025-08-01' where idcliente = '4';
update clientes set data_ult_compra = '2024-08-01' where idcliente = '5';
update clientes set data_ult_compra = '2025-08-01' where idcliente = '6';

alter table clientes
add column valor_compra decimal;

update clientes set valor_compra = 1000 where idcliente = '1';
update clientes set valor_compra = 2000 where idcliente = '2';
update clientes set valor_compra = 3000 where idcliente = '3';
update clientes set valor_compra = 4000 where idcliente = '4';
update clientes set valor_compra = 5000 where idcliente = '5';
update clientes set valor_compra = 6000 where idcliente = '6';

alter view V_Relatorio as
select clientes.data_ult_compra, clientes.nome, clientes.sexo, clientes.email,
telefone.tipo, telefone.numero,
endereco.bairro, endereco.cidade, endereco.estado,
clientes.valor_compra from clientes
join telefone
on clientes.IDCliente = telefone.id_cliente
join endereco
on clientes.IDCliente = endereco.id_cliente;

create view V_CompraAcima3000 as
select*from clientes
where valor_compra>'3000';

select*from clientes;

select*from clientes;

delimiter $
create procedure nome_senai()
begin
select 'escola senai' as Nome_Escola;
end $
delimiter ;

call nome_senai();

drop procedure nome_senai;

delimiter $$
create procedure soma(N1 int, N2 int)
begin
select N1 + N2 as soma;
end $$
delimiter ;

call soma(20,500);