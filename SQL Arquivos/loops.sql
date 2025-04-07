use diversas_tabelas;
select*from categorias;
select*from produtos;
select ID_categoria from categorias;
select ID_categoria from produtos;
select ID_categoria from categorias
where exists(select id_categoria from produtos
where categorias.ID_Categoria = produtos.ID_Categoria);
select ID_Categoria from categorias
where not exists(select id_categoria from produtos
where categorias.ID_Categoria = produtos.ID_Categoria);
select*from categorias
where not exists(select id_categoria from produtos
where categorias.ID_Categoria = produtos.ID_categoria);

delimiter $
create procedure acumula(limite int)
begin
declare contador int default 0;
declare soma int default 0;
loop_teste: loop
set contador = contador + 1;
set soma = soma + contador;
if contador >= limite then
leave loop_teste;
end if;
end loop loop_teste;
select soma;
end $
delimiter ;

delimiter $
create procedure acumula (limite int)
begin
declare contador int default 0;
declare soma int default 0;
loop_teste: loop
	set contador = contador+1;
	set soma = soma+contador;
	if contador >= limite then
		leave loop_teste;
	end if;
end loop loop_teste;
select soma;
end $
delimiter ;

call acumula(5);

delimiter $
create procedure contador(limite int)
begin
	declare x int default 0;
    teste: loop
set x=x+1;
select x;
	if x=limite then
leave teste;
	end if;
    end loop teste;
    end $
delimiter ;
call contador(6);

delimiter $
create procedure contadorw(limite int)
begin
declare x int default 0;
	while x< limite do
    select x;
    set x = x+1;
    end while;
end $
delimiter ;

call contadorw(8);

delimiter $
create procedure contadorr(limite int)
begin
declare x int default 0;
repeat
	set x=x+1;
    select x;
    until x=limite
end repeat;
end$
delimiter ;

call contadorr(6);