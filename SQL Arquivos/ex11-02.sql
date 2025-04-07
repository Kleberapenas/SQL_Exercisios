create database comercio;
use comercio;

create table clientes (
IDCliente int not null primary key auto_increment,
Nome varchar(30) not null,
Sexo enum('M','F') not null,
email varchar(50) unique,
cpf varchar(15) unique
);

create table endereco (
IDEndereco int not null primary key auto_increment,
rua varchar(30) not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
estado varchar(2) not null,
id_cliente int unique,
foreign key (id_cliente) references clientes(IDCliente)
);

create table telefone (
IDTelefone int not null primary key auto_increment,
tipo enum('Res','Com','Cel') not null,
numero varchar(10) not null,
id_cliente int,
foreign key (id_cliente) references clientes(IDCliente)
);

insert into clientes values
(default,'Joao','M','joao@bol.com','76984352456'),
(default,'Carla','F','carla@bol.com','76984356699'),
(default,'Ana','F','ana@bol.com','76984357755'),
(default,'Clara','F','clara@bol.com','76984353344'),
(default,'Jorge','M','jorge@bol.com','76984352211'),
(default,'Celia','F','celia@bol.com','76984359988');

insert into endereco values
(default,'Rua Antonio SA','Centro','B. Horizonte','MG',4),
(default,'Rua Capitao Hermes','Centro','Rio de Janeiro','RJ',1),
(default, 'Rua Pres Vargas','Jardins','Sao Paulo','SP',3),
(default,'Rua Alfandega', 'Estacio','Rio de Janeiro','RJ',2),
(default,'Rua do Ouvidor','Flamengo','Rio de Janeiro','RJ',6),
(default,'Rua Uruguaiana','Centro','Vitoria','ES',5);

insert into telefone values
(default,'cel','78458743','5'),
(default,'res','56576876','5'),
(default,'cel','87999898','1'),
(default,'com','54768899','2'),
(default,'res','78989765','1'),
(default,'cel','99766676','3'),
(default,'cel','78458743','3'),
(default,'com','66687899','1'),
(default,'res','89985558','5'),
(default,'cel','8867909','2');

-- ex4
select clientes.Nome,clientes.sexo,endereco.bairro,endereco.cidade from clientes
join endereco
on clientes.IDCliente = endereco.id_cliente
where clientes.sexo = 'F'
order by clientes.nome;

-- ex5
select clientes.Nome,clientes.sexo,endereco.bairro,endereco.cidade,telefone.tipo,telefone.numero from clientes
join endereco
on clientes.IDCliente = endereco.id_cliente
join telefone
on clientes.IDCliente = telefone.id_cliente
order by clientes.nome;

-- ex6
select clientes.nome, clientes.sexo, endereco.cidade, telefone.numero from clientes
join endereco
on clientes.IDCliente = endereco.id_cliente
join telefone
on clientes.IDCliente = telefone.id_cliente
where clientes.sexo = 'M'
order by nome;

-- ex7
select clientes.IDCliente,clientes.email,endereco.bairro,endereco.cidade,telefone.numero from clientes
inner join endereco
on clientes.IDCliente = endereco.id_cliente
inner join telefone
on clientes.IDCliente = telefone.id_cliente
where endereco.bairro = 'Centro' and endereco.cidade = 'Rio de Janeiro'
order by telefone.numero;