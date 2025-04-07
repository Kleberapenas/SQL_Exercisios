use cadastro;
alter table alunos add column profissoes varchar(20);

desc alunos;
-- ex1
select profissao, count(*) as qtd_prof
from alunos
group by profissao;

-- ex2
select profissao, count(*) as qtd_prof
from alunos
group by profissao
order by qtd_prof;

-- ex3
select sexo, count(nascimento) as qtd_nascidos
from alunos where nascimento>2005-01-01
group by sexo;

-- ex4
select sexo,nacionalidade, count(nacionalidade) as nascidos_fora from alunos
where nacionalidade!='Brasil'
group by sexo,nacionalidade
having n>=3;

-- ex5
select avg(altura) from alunos;
select altura, count(*) from alunos
where peso>100
group by altura
having altura>(select avg(altura) from alunos)
order by altura;

alter table alunos
add column cursopreferido int;

alter table alunos
add foreign key (cursopreferido)
references cursos (idcurso);

update alunos
set cursopreferido = "6" where id='1';

update alunos set cursopreferido = '22' where(id='2');
update alunos set cursopreferido = '12' where(id='3');
update alunos set cursopreferido = '7' where(id='4');
update alunos set cursopreferido = '1' where(id='5');
update alunos set cursopreferido = '8' where(id='6');
update alunos set cursopreferido = '4' where(id='7');
update alunos set cursopreferido = '5' where(id='8');
update alunos set cursopreferido = '3' where(id='9');
update alunos set cursopreferido = '30' where(id='10');
update alunos set cursopreferido = '22' where(id='11');

delete from cursos where idcurso = '9';
delete from cursos where idcurso ='28';
select*from cursos;

delete from cursos where idcurso='6';

select nome, cursopreferido from alunos;
