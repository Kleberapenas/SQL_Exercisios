use diversas_tabelas;
delimiter $
create function fn_BoasVindas(nome VARCHAR(100))
returns varchar(100) deterministic
begin
return concat('Bem Vindo ',nome,',tudo bem?');
end$
delimiter;


delimiter $
create function fn_Faturamento(preco DECIMAL(10,2),quantidade int)
returns decimal(10,2)deterministic
begin
return preco*quantidade;
end$
delimiter ;
select fn_Faturamento(133,7) as 'Faturamento';

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
select fn_RemoveAcentos('à aliança da discípula alemã')as Remove_Acento;

delimiter $
create function data_hoje()
returns date
deterministic
begin
return curdate();
end$
delimiter ;
select data_hoje() as 'Data';

delimiter $
create function data_mais_20_dias()
returns date
deterministic
begin
return date_add(curdate(),interval 20 day);
end$
delimiter ;
select data_mais_20_dias();

delimiter $
create function data_mais_2_anos_5_meses_18_dias()
returns date
deterministic
begin
return date_add(curdate(),interval 2 year)+interval 5 month+interval 18 day;
end$
delimiter ;
select data_mais_2_anos_5_meses_18_dias();

use exemplo;
select*from funcionarios;
delimiter $
create function tempo_servco(data_inicio date)
returns int
deterministic
begin
declare data_atual date;
select current_date()into data_atual;
return year(data_atual)-year(data_inicio);
end $
delimiter ;

select id_funcionario,nome,sobrenome,tempo_servco(data_contratacao)as'tempo de serviço' from funcionarios;