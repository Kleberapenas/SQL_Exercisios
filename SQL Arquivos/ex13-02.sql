use exemplos;
create table new_cursos(
IDCurso int primary key auto_increment,
nome varchar(100) not null,
horas int not null,
preco decimal(10,2) not null
);
-- ex1
delimiter $
create procedure adicionar_info(
nome varchar(100), 
horas int, 
preco decimal(10,2)
)
begin
insert into new_cursos values
(null, nome,horas,preco);
end $
delimiter ;

-- ex2
delimiter $
create procedure atualizar_cursos(
novo_perc int, id int)
begin
update new_cursos
set preco = preco*(1+novo_perc/100)
where IDCurso = id ;
select 'Efetuado' as situacao;
end $
delimiter $

call atualizar_cursos(28,6);
select*from new_cursos;

-- ex3
delimiter $
create procedure mudar_precos(
novo_preco int, id int)
begin
update new_cursos
set preco = novo_preco
where IDCurso = id ;
select 'Efetuado as situacao';
end $
delimiter ;

call mudar_precos(350,6);
select*from new_cursos;

-- ex4
delimiter $
create procedure desconto(
valor_desconto int)
begin
update new_cursos
set preco = preco*(1*valor_desconto/100);
end $
delimiter ;

call desconto(35);
select*from new_cursos;

-- ex5
delimiter $
create procedure excluir(
id int)
begin
delete from new_cursos where IDCurso=id;
end $
delimiter ;
call excluir(1);

select*from new_cursos;

-- ex6
delimiter $
create procedure excluir_curso(
nome_del varchar(30))
begin
delete from new_cursos where nome=nome_del;
end $
delimiter ;

call excluir_curso('Mysql');