use ContosoRetailDW

declare @idade int
set @idade = 18

if @idade >= 18
begin
	print 'Maior de idade';
end
else
begin
	print 'Menor de idade';
end
go

declare @idade int
set @idade = 18
select iif(@idade >= 18, 'Maior de idade','Menor de idade');
go

use ContosoRetailDW;

select
	CustomerKey,
	firstname,
	gender,
	case	
		when gender = 'M' then 'Masculino'
		else 'Feminino'
	end as 'Sexo'
from
	DimCustomer
go

select
	CustomerKey,
	firstname,
	gender,
	case	
		when gender = 'M' then 'Masculino'
		when gender = 'F' then 'Feminino'
		else 'Empresa'
	end as 'Sexo'
from
	DimCustomer
go


select
	productname,
	BrandName,
	colorname,
	unitprice,
	case
		when brandname = 'contoso' and colorname = 'red' then 0.1
		else 0
	end as 'desconto'
from
	DimProduct
go

select
	productname,
	brandname,
	colorname,
	unitprice,
	case
		when brandname = 'Contoso' or brandname = 'Fabrikam' then 0.1
		else 0
	end as 'Desconto'
from
	DimProduct
go

select
	storekey,
	storename,
	storetype,
	status,
	employeecount,
	case
		when employeeCount >= 40 then
			case
				when status = 'off' then 'Loja fechada: acima de 40 funcionarios'
				when status = 'on' then 'Loja aberta: acima de 40 funcionarios'
				end
		when employeecount >= 30 then 'entre 30 e 39 fncionarios'
		when employeecount >= 20 then 'entre 20 e 25 funcionarios'
		else 'baixo de 19 funcionarios'
	end as 'categoria'
from
	dimstore
go

select
	productkey,
	productname,
	productcategoryname,
	productsubcategoryname,
	unitprice,
	case when productcategoryname = 'TV and Video'
		then 0.10 else 0.00 end
		+case when ProductSubcategoryName = 'televisions'
			then 0.05 else 0.00 end
from dimproduct
inner join dimproductsubcategory
	on dimproduct.productsubcategorykey = dimproductsubcategory.productsubcategorykey
		inner join dimproductcategory
			on dimproductsubcategory.productcategorykey = dimproductcategory.productcategorykey
go

declare @varclassificacao int
set @varclassificacao = 2

select
	iif(
		@varclassificacao >= 5,
		'Risco alto',
		'Risco Baixo') as 'Status'
go

select
	productkey,
	productname,
	stocktypename,
	iif(
		STOCKTYPENAME = 'High',
		'João',
		iif(
			stocktypename = 'mid',
			'maria',
			'luis')
		) as 'Responsavel'
from
	DimProduct
go

select
	GeographyKey,
	continentname,
	cityname,
	isnull(cityname, 'local desconhecido')
from
	DimGeography
go