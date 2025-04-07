use comercio;
-- ex1
create view Valor_Total as 
select sum(clientes.valor_compra) from clientes;

-- ex2
create view Menor_Valor as
select min(clientes.valor_compra) as Menor_Valor from clientes;

-- ex3
create view Media_Valor as
select avg(clientes.valor_compra) as Valor_Medio from clientes;

-- ex4
create view Maior_Valor as
select max(clientes.valor_compra) as Maior_Valor from clientes;

-- ex5
create view Maior_Valor_Cliente as
select max(clientes.valor_compra) as Maior_Valor, clientes.nome from clientes
where valor_compra = (select max(valor_compra) from cliente);

select*from Maior_Valor_Cliente;