create database ti;
use ti;

create table clientes (
cpf varchar(20),
nome varchar(200),
nascimento varchar(25),
endereco varchar(30),
cep varchar(20),
bairro varchar(20),
cidade varchar(20),
uf varchar(2)
);

desc clientes;

alter table clientes
add column dataUltimaCompra varchar(25);

insert into clientes
(cpf,nome,nascimento,endereco,cep,bairro,cidade,uf)
values
('02296332780', 'Marcos da Silva', '25/11/1970', 'Rua Pedro Marques', '88045968', 'Santana', 'São Paulo', 'SP'),
('08285031490', 'Ana Ana Julia', '21/10/1985', 'Rua Paradigma Novais', '99078923', 'Leblon', 'Rio de Janeiro', 'RJ'),
('05550314905', 'Jorge Soares', '05/03/1989', 'Rua das Banguelas', '77048917', 'Copacabana', 'Rio de Janeiro', 'RJ'),
('01150314905', 'Juvenal Soares', '15/04/1989', 'Rua das Tabuinhas', '69048917', 'Minerva', 'Minas Gerais', 'MG');

update clientes set dataUltimaCompra='16/6/2024' where cpf='02296332780';
update clientes set dataUltimaCompra='17/06/2024' where cpf='08285031490';
update clientes set dataUltimaCompra='18/06/2024' where cpf='05550314905';
update clientes set dataUltimaCompra='19/06/2024' where cpf='01150314905';

select*from clientes;

select*from clientes where cidade = 'Rio de Janeiro';

alter table clientes
add column produto varchar(20);

update clientes set produto='TV' where cpf='02296332780';
update clientes set produto='Geladeira' where cpf='08285031490';
update clientes set produto='Notebook' where cpf='05550314905';
update clientes set produto='Celular' where cpf='01150314905';

delete from clientes where produto = 'Celular';

delete from clientes where cidade =  'São Paulo';

