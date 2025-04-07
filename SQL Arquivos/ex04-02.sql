create database loja;
use loja;

create table Clientes (
IDCliente int not null unique primary key auto_increment,
Nome varchar(100) not null,
Sexo enum('M','F') not null,
ID_Carro int
);

drop table Carro;

create table Telefones (
IDTelefone int not null primary key auto_increment,
Tipo enum('CEL','RES','COM') not null,
numero varchar(30),
ID_Clientes int
);

create table Carros (
IDCarro int not null unique primary key auto_increment,
Modelo varchar(50),
Placa varchar(7),
ID_Marca int
);

create table Marcas (
ID_Marca int not null unique primary key auto_increment,
Marca varchar(40) unique
);

create table Cores (
ID_Cor int not null unique primary key auto_increment,
Cor varchar(50)
);

create table Carro_Cor (
ID_Carro int,
ID_Cor int
);

alter table Telefones
add constraint fk_telefone_cliente
foreign key(ID_Clientes)
references Clientes(IDCliente);

alter table Clientes
add constraint fk_cliente_carro
foreign key (ID_Carro)
references Carros(IDCarro);

alter table Carros
add constraint fk_carro_marca
foreign key (ID_Marca)
references Marcas(ID_Marca);

