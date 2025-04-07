use Cadastro;
set@var = 0;
set@nome = 'SQL';
set @varQuantidade = 10;
set @varPreco = 10.9;
select(@varQuantidade*@varPreco) as 'receita Total';
select round(@varQuantidade*@varPreco,2)as'Receita Total';

select if(10>5,'Verdadeiro','Falso')as situacao;
select if(10>12, 'Verdadeiro','Falso')as situacao;

set @varNotaDesempenho = 8.5;
select if(@varNotaDesempenho >= 7,@varNotaDesempenho+@varNotaDesempenho*0.1,'Sem Bonus')as Bonus;


set @varNotaDesempenho = 9;
select
if(@varNotaDesempenho >= 7,'Recebe Bônus de 10%',
if (@varNotaDesempenho >= 5, 'Receba bônus de 5%','Não Recebe bônus')) as 'Resultado';
set @varNotaDesempenho = 6;
set @varNotaDesempenho = 2;

use diversas_tabelas;
select*from lojas;

select if(Num_Funcionarios >= 20,'Recebe Reforma','Não recebe reforma') as 'status' from lojas;

select ifnull(null,'valor alternativo') as tipo;
select ifnull(100,'valor alternativo') as tipo;

select*from lojas;
select*, ifnull(Telefone, '0800-999-9999') as 'Telefone corrigido' from lojas;

select*,isnull(Telefone)as 'Check' from clientes;
select*,if(isnull(telefone),'Verficiar','Ok')as 'Status' from clientes;

set @var1 = 100;
set @var2 = 100;

select nullif(@var1,@var2) as Tipo;

set @var1 = 50;
set @var2 = 500;
 select nullif(@var1,@var2) as Tipo;
 
  set @Nota = 9;
 select if(@Nota>=6,'Aprovado','Reprovado') as nota_aluno;
