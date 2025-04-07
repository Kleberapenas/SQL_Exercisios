use ContosoRetailDW;

-- ex1
select sum(SalesQuantity) as 'Quantidade Vendida', sum(ReturnQuantity) as 'Quantidade Devolvida'
from FactSales where ChannelKey = 1;

select*from DimEmployee

-- ex2
select * from DimStore;

-- ex3
-- a
select max(EmployeeCount) from DimStore;
-- b
select top(1) StoreName as 'Nom da Loja',
EmployeeCount as 'QTD. Funcionários'
from
DimStore
Order by EmployeeCount DESC;
-- c
select min(EmployeeCount) from DimStore;
-- d
select top(1) StoreName as 'Nome da Loja', EmployeeCount as 'QTD. Funcioários'
from DimStore where EmployeeCount is not null
order by EmployeeCount;


-- ex4
-- a
select
count(gender) as 'QtD. Funcionarios Masc'
from DimEmployee
where Gender ='M'

select
count(gender) as 'QtD. Funcionarios Fem'
from DimEmployee
where Gender ='F'
-- b
select
top(1) FirstName as 'Nome',
LastName as 'Sobrenome',
EmailAddress as 'E-mail',
gender as 'Gênero',
HireDate as 'Data da Contratação'
from
DimEmployee
where Gender='M'
order by HireDate;

select
top(1) FirstName as 'Nome',
LastName as 'Sobrenome',
EmailAddress as 'E-mail',
gender as 'Gênero',
HireDate as 'Data da Contratação'
from
DimEmployee
where Gender='F'
order by HireDate;

-- ex5
-- a
select*from DimProduct
select
count(distinct Brandname) as 'QTD. Marcas',
count(distinct Classname) as 'QTD. Classes de Produto',
count(Distinct ColorName) as 'QTD. Cores'
from
DimProduct
-- b

--- c
-- não fiz