use diversas_tabelas;
-- ex1
set @Nota = 9;
 select if(@Nota>=6,'Aprovado','Reprovado') as nota_aluno;
 
 -- ex2
 set @Nota = 10;
 select if(@Nota>=6, 'Aprovado', if(@Nota>=4,'Recuperação','Reprovado')) as status_aluno;
 
 -- ex3
 select*,if(Preco_Unit>=4000,'Luxo',if(Preco_unit>=1000,'Econômico','Básico')) as Nivel from Produtos;