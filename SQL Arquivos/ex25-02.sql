use diversas_tabelas;
-- ex1
set @varcategoria = 'Microfone';
select*from produtos where(select ID_Categoria from categorias where Categoria=@varcategoria);

-- ex2
select ID_Produto,count(*) as 'QTD_Vendas' from pedidos
group by ID_Produto
order by QTD_Vendas;
select max(QTD_Vendas) as 'máximo de vendas',
min(QTD_Vendas) as 'Mínimo vendas',
avg(QTD_Vendas) as 'média vendas' from (
select ID_Produto,count(*) as 'QTD_Vendas' from pedidos
group by ID_Produto
order by QTD_Vendas) as V;
-- errados
set @varpedido = '1';
select max(Preco_Unit) as 'maior' from produtos where(select ID_Produto from pedidos where 
ID_Pedido=@varpedido);
select min(Preco_Unit) as 'menor' from produtos where(select ID_Produto from pedidos where 
ID_Pedido=@varpedido);
select avg(Preco_Unit) as 'media' from produtos where(select ID_Produto from pedidos where 
ID_Pedido=@varpedido);

-- ex3
select ID_Cliente,sum(receita_venda)  from pedidos
group by ID_Cliente
order by sum(receita_venda) desc;
select id_cliente, sum(receita_venda) from pedidos
group by ID_Cliente
order by sum(receita_venda) desc limit 1;

-- ex4
select cidade from locais where região = 'Sudeste';
select*from lojas where loja in (select cidade from locais where região='Sudeste');