create database exemplos;
use exemplos;
create table p_curso (
id_curso int primary key auto_increment,
nome_curso varchar(100),
preco_curso decimal(10,2)
);

insert into p_curso
(id_curso,nome_curso,preco_curso)
values
(null,'Excel',500.00),
(null,'VBA',280.00),
(null,'Power BI',150.00);

delimiter $
create procedure p_atualiza_preco (
novo_preco decimal(10,2),
id int)
begin
update p_curso
set preco_curso = novo_preco
where id_curso = id;
select 'preço atualizado com sucesso!';
end $
delimiter ;

call p_atualiza_preco(600,1);
call p_atualiza_preco(330,2);

select*from p_curso;

delimiter $
create procedure p_cadastrar_cursos (
id int,
nome varchar(100),
preco decimal(10.2)
)
begin insert into p_curso values
(null,nome,preco);
end $
delimiter ;

call p_cadastrar_cursos
(null,'Banco de Dados',1000);
call p_cadastrar_cursos
(null,'Python',1200);

delimiter $
create procedure p_acrescimo_geral
(acrescimo decimal (10,2))
begin
update p_curso
set preco_curso = preco_curso*(1+acrescimo/100);
select 'acrescimo atualizado com sucesso' as situacao;
end $
delimiter ;

select*from p_curso;
call p_acrescimo_geral(10.00);

delimiter $
create procedure p_excluir_cursos(
id int)
begin
delete from p_curso
where id_curso = id;
end $
delimiter ;

call p_excluir_cursos(5)

delimiter $
create procedure p_excluir_curso_por_nome(
nome varchar(100))
begin
delete from p_curso
where nome_curso=nome;
end $
delimiter ;

call p_excluir_curso_por_nome('VBA');
