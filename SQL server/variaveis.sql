use ContosoRetailDW

select 10 as 'Numero'
select 'marcus' as 'nome'
select '21/06/2021' as 'data'

select 10+20
select 20-5
select 31*40
select 431.0/23

select 'SQL'+' '+'Impressionador'


select SQL_Variant_Property('31/05/2014', 'BaseType') as 'Data 1'
select SQL_Variant_Property(cast('31/05/2014' as datetime), 'Basetype') as 'Data 2'


select format(1000, 'N') as 'Numero'
select format(1000, 'G') as 'Geral'
select format(1000, 'C') as 'Moeda'

select format(123456789, '###-##-####') as 'Personalizado'

select format(cast('21/03/2021' as datetime), 'dd/MM/yyyy') as 'data'


select round(18.739130, 2) as 'Round 1'

select round(18.739130, 2, 1) as 'Round 2'

select floor(18.739130) as 'Floor'

select ceiling(18.739130) as 'Ceiling'


-- declare @quantidade int
-- set @quantidade = 100

--declare @quantidade int, @preco float, @faturamento float
--set @quantidade = 100
--set @preco = 8.99
--set @faturamento = @quantidade*@preco

--select @faturamento as 'faturamento'

-- exemplo 1
declare @idade int
set @idade = 30
select @idade

-- exemplo 2
declare @preco float
set @preco = 10.89
select @preco

-- Exemplo 3
declare @nome varchar(50)
set @nome = 'Mateus'
select @nome

-- exemplo 4
declare @data date
set @data = '2021-10-28'
select @data

declare @varDesconto float
set @vardesconto = 0.1

select
productKey as 'ID',
productName as 'Nome do Produto',
unitprice as 'preco',
unitprice*(1-@varDesconto) as 'Preco com desconto'
from dimproduct


declare @vardata datetime
set @vardata = '01/01/1978'

select
	firstname as 'Nome',
	lastname as 'Sobrenome',
	birthdate as 'Nascimento',
	'cliente' as 'tipo'
from
	DimCustomer
where BirthDate >= @vardata
union
select
	firstname as 'Nome',
	lastname as 'Sobrenome',
	birthdate as 'Nascimento',
	'funcionario' as 'tipo'
from  dimemployee
where birthdate >= @vardata
order by nascimento
go

declare @vardata datetime
declare @varnumfuncionarios int
declare @varnumclientes int
set @vardata = '01/01/1980'
set @varnumfuncionarios = (select count(*) from DimEmployee where birthdate >= @vardata)
set @varnumclientes = (select count(*) from DimCustomer where birthdate >= @vardata)

select 'Numero de Funcionarios', @varnumfuncionarios
union
select 'numero de clientes', @varnumclientes
go

set nocount on

declare @vardata datetime
declare @varnumfuncionarios int
declare @varnumclientes int
set @vardata = '01/01/1980'
set @varnumfuncionarios = (select count(*) from DimEmployee where birthdate >= @vardata)
set @varnumclientes = (select count(*) from dimcustomer where birthdate >= @varData)

print 'Numero de Funcionarios = ' + cast(@varnumfuncionarios as varchar(max))
print 'Numero de Clientes = ' + cast(@varnumclientes as varchar(max))
go

select top(100) * from factsales
declare @varprodutomaisvendido int
declare @vartotalmaisvendido float

select top(1)
	@varprodutomaisvendido = productkey,
	@vartotalmaisvendido = salesamount
from
	factsales
order by salesamount desc

select @varprodutomaisvendido as 'produto', @vartotalmaisvendido as 'total'
select
	productName
from
	DimProduct
where productkey = @varprodutomaisvendido

select * from DimProduct
go

declare @listanomes varchar(max)
set @listanomes =''

select
	@listanomes = @listanomes + firstname+','+char(10)
from
	DimEmployee
where DepartmentName = 'Marketing'
print left(@listanomes, datalength(@listanomes)-3)
go

select @@servername as 'nome do servidor'

select @@version as 'versão'

select @@rowcount as 'contagem de linhas'
go

