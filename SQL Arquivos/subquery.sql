create database TCL;
use TCL;
create table dados(
ID int not null auto_increment primary key,
Nome varchar(100),
endereco varchar(100),
CPF varchar(12),
Sexo enum('M','F')
);

insert into dados values
(null, 'Marcos', 'Rua Florença, 10','12345678978','M'),
(null, 'Eliana', 'Rua Florença, 16','32145678978','F'),
(null, 'Felipe', 'Rua Florença, 13','12345768978','M');

update dados
set nome = 'Naldo'
where id='1';

select*from dados;

start transaction;
delete from dados where id='3';
select*from dados;

rollback;

start transaction;

delete from dados where id='2';

commit;

rollback;
use diversas_tabelas;
select*from pedidos
where id_loja=3;

select id_loja from lojas where gerente='Pedro Martins';
set @varNomeGerente = 'Pedro Martins';
set @varNomeGerente = 'Carlos Henrique';
set @varNomeGerente = 'Amanda Lima';
select*from pedidos where id_loja=(select id_loja from lojas where gerente = @varNomeGerente);
select avg(preco_unit) from produtos;
select*from produtos where preco_unit>1788.1250;
select*from produtos where preco_unit>(select avg(preco_unit) from produtos);
select*from categorias;
select id_categoria from categorias where categoria='Notebook';
select*from produtos where id_categoria=(select id_categoria from categorias where categoria='Notebook');
select*from pedidos;
select*from produtos where marca_produto='DELL';
select id_produto from produtos where marca_produto = 'DELL';
select*from pedidos where id_produto in (select id_produto from produtos where marca_produto = 'dell');
select sum(receita_venda) as 'receita marca dell' from pedidos where ID_Produto in (select ID_Produto from produtos where Marca_Produto = 'Dell');
select concat('R$',replace(format(sum(receita_venda),2),',','.'))as 'Receita Marca Dell' from pedidos where id_produto in (select id_produto from produtos where Marca_Produto='Dell');
select concat('R$',format(sum(receita_venda),2,'de_DE')) as 'receita marca dell' from pedidos where id_produto in (select id_produto from produtos where Marca_Produto='DELL');