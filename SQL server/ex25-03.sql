use LojaDB;

select Clientes.NomeCliente, count(pedidos.pedidoID) as totalpedidos
from clientes
left join pedidos on clientes.clientID = pedidos.clientID
group by clientes.NomeCliente
go

select clientes.NomeCliente, sum(detalhespedidos.quantidade) as total
from clientes
inner join pedidos on clientes.clientID = pedidos.clientID
inner join detalhespedidos on pedidos.pedidoID = detalhespedidos.pedidoID
group by clientes.NomeCliente
go

select clientes.nomecliente, sum(detalhespedidos.quantidade*produtos.preco) as totalgasto from clientes
inner join pedidos on clientes.clientID = pedidos.clientID
inner join detalhespedidos on pedidos.pedidoID = detalhespedidos.pedidoID
inner join produtos on detalhespedidos.produtoid = produtos.produtoID
group by clientes.NomeCliente
go

select produtos.NomeProduto, sum(detalhespedidos.quantidade) as maisvendido from produtos
inner join detalhespedidos on produtos.produtoID = detalhespedidos.produtoID
group by produtos.NomeProduto
order by maisvendido
go

select pedidos.DataPedido, sum(detalhespedidos.quantidade*produtos.preco) from pedidos
inner join detalhespedidos on pedidos.pedidoID = detalhespedidos.pedidoID
inner join produtos on detalhespedidos.produtoID = produtos.produtoID
group by pedidos.DataPedido
order by pedidos.datapedido desc
go
