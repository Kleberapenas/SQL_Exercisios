use exemplo;
-- ex1
delimiter $
create function Bem_Vindo(Nome varchar(100))
returns varchar(100) deterministic
begin
return concat('Olá ',nome,',seja bem vindo ao curso de banco de dados');
end$
delimiter ;
select Bem_Vindo('Kleber');

-- ex2
delimiter $
create function fn_Total_Vendas(preco decimal(10,2),quantidade int)
returns decimal(10,2)deterministic
begin
return preco*quantidade;
end$
delimiter ;
select fn_Total_Vendas(30,10);

-- ex3
use diversas_tabelas;
delimiter $
create function fn_RemoveAcentos(texto varchar(100))
returns varchar(100) deterministic
begin
set texto=replace(texto,'à','a'),
texto=replace(texto,'á','a'),
texto=replace(texto,'â','a'),
texto=replace(texto,'ã','a'),
texto=replace(texto,'é','e'),
texto=replace(texto,'è','e'),
texto=replace(texto,'ê','e'),
texto=replace(texto,'ë','e'),
texto=replace(texto,'í','i'),
texto=replace(texto,'ì','i'),
texto=replace(texto,'î','i'),
texto=replace(texto,'ï','i'),
texto=replace(texto,'ó','o'),
texto=replace(texto,'ò','o'),
texto=replace(texto,'ô','o'),
texto=replace(texto,'õ','o'),
texto=replace(texto,'ö','o'),
texto=replace(texto,'ú','u'),
texto=replace(texto,'ù','u'),
texto=replace(texto,'ü','u'),
texto=replace(texto,'ç','c');
return texto;
end$
delimiter ;

select loja,endereco,fn_RemoveAcentos(endereco) from lojas;

-- ex4
delimiter $
create function data_mais_2_anos()
returns date
deterministic
begin
return date_add(curdate(),interval 2 year);
end$
delimiter ;
select data_mais_2_anos();

-- ex5
select*from funcionarios;
delimiter $
create function tempo_menos()
returns date
deterministic
begin
return date_sub(curdate(),interval 2 year)-interval 11 month-interval 29 day;
end $
delimiter ;
select tempo_menos();