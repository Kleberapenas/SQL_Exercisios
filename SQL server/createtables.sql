create database LojaDB
use LojaDB
go;

create table clientes(
clientID int primary Key,
NomeCliente varchar(100),
Cidade varchar(50)
);
go

create table produtos (
produtoID int primary key,
NomeProduto varchar(100),
CategoriaID int,
preco decimal(10,2)
);
go

create table pedidos(
pedidoID int primary key,
clientID int,
ProdutoID int,
DataPedido date,
foreign key (clientID) references produtos (produtoID),
foreign key (produtoID) references produtos (ProdutoID)
);
go

create table categorias(
categoriaID int primary key,
NomeCategoria varchar(100)
);
go

insert into clientes(clientID, NomeCliente, Cidade) values
(1, 'Maria Silva', 'São Paulo'),
(2,'João Santos','Rio De janeiro'),
(3,'Ana Costa','Belo Horizonte');
go

insert into produtos(produtoID, NomeProduto, CategoriaID, Preco) values
(1, 'Celular', 1, 1500.00),
(2, 'Televisão', 1, 3000.00),
(3, 'Camiseta', 2, 50.00);
go

insert into pedidos(pedidoID,clientID,ProdutoID,DataPedido) values
(1,1,1,'2024-01-15'),
(2,2,3,'2024-01-20'),
(3,1,2,'2024-02-10');
go

insert into categorias (categoriaID, NomeCategoria)
values
(1,'Eletronicos'),
(2,'Vestuario');
go

select*from clientes;
select*from produtos;
select*from categorias;
select*from pedidos;
go

select clientes.NomeCliente, pedidos.DataPedido
from pedidos
inner join clientes on clientes.clientID = pedidos.pedidoID
go

select clientes.NomeCliente, pedidos.DataPedido
from pedidos
right join clientes on clientes.clientID = pedidos.pedidoID
go

insert into pedidos(pedidoID, ClientID, ProdutoID, DataPedido) values
(1,1,1,'2024-01-15'),
(2,2,3,'2024-01-20'),
(3,1,2,'2024-02-10');
go

select
clientes.NomeCliente, pedidos.DataPedido, produtos.NomeProduto, categorias.NomeCategoria from clientes
inner join
pedidos on clientes.clientID = pedidos.clientID
inner join
produtos on produtos.produtoID = pedidos.ProdutoID
inner join
categorias on produtos.CategoriaID = categorias.categoriaID;
go


select Clientes.NomeCliente from Clientes
Union
Select Clientes.NomeCliente from Pedidos
inner join clientes on pedidos.clientID = Clientes.ClientID
go

select Clientes.NomeCliente from Clientes
union all
select Clientes.NomeCliente from pedidos
inner join clientes on pedidos.clientID = clientes.clientID
go