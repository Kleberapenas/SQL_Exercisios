use ContosoRetailDW

-- ex1
-- a
select ProductName as 'produto', DATALENGTH(productname) as 'quantidade letras' from DimProduct order by 'quantidade letras' desc
go
-- b
select avg(DATALENGTH(productname))  as 'quantidade letras' 
from DimProduct
go
-- c
select productname, brandname, colorname, replace(replace(productname, BrandName, ''),ColorName,' ') as 'Sem informações redundantes'
from dimproduct
-- d
select avg(len(replace(replace(productname, BrandName, ''),ColorName,' '))) from DimProduct
go

-- 2
select translate(stylename, '0123456789','ABCDEFGHIJ') from DimProduct
go

-- 3
select left(emailaddress,charindex('@',EmailAddress)-1), concat(upper(Firstname),day(birthdate)) as 'senha' from DimEmployee
go

-- 4
select firstname, emailaddress, addressline1, datefirstpurchase
from DimCustomer
where datename(YY,datefirstpurchase) = '2001' 
order by DateFirstPurchase
go

-- 5
select Firstname as 'Nome', EmailAddress as 'email', HireDate as 'Contrato',
	datename(DD,Hiredate) as 'Dia de contrato',
	datename(MM,Hiredate) as 'Mês de contrato',
	datename(YY,Hiredate) as 'Ano de contrato'
from DimEmployee
go

-- 6
select top 1
storekey,
storename,
datediff(day, opendate, getdate()) as 'Dias em atividade'
from DimStore
order by 'Dias em Atividade' desc
go

-- 7
select
nome, telefone,
stuff(stuff(replace(translate(telefone, '().-','    '), ' ',''),1,2, '(' + 
left(replace(translate(telefone, '().-','    '),' ',''),2)+')'),9,0,'-')
as telefone_padronizado
from clientes;