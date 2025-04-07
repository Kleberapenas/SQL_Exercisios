use ContosoRetailDW;
-- Ex 1
-- a
select productName from DimProduct;
-- b
select FirstName from DimCustomer; -- diminuiu
-- ex 2
-- a
-- b
select CustomerKey as 'Id Cliente', 
FirstName as 'Primeiro Nome', 
EmailAddress as 'Email', 
BirthDate as 'Data de Nascimento'
from DimCustomer;
-- Ex3
-- a
select top(100)* from DimCustomer;
-- b
select top(20) percent * from DimCustomer;
-- c
select top(100) FirstName, EmailAddress, BirthDate from DimCustomer;
-- d
select top(100) 
FirstName as 'Primeiro Nome'
, EmailAddress as 'Endereço de Email'
, BirthDate as 'Data de Nascimento'
from DimCustomer;
-- ex 4
select distinct Manufacturer from DimProduct;
-- ex 5
select * from DimProduct;

select top(100)
StoreName,
EmployeeCount
from DimStore
order by EmployeeCount;

select top(100)
StoreName,
EmployeeCount
from DimStore
order by EmployeeCount desc;

select top(100) Storekey, StoreName
from DimStore
order by StoreName;

select top(100) Storekey, StoreName
from DimStore
order by StoreName desc;

select top(100)
ProductName,
Weight,
UnitCost
from DimProduct
order by UnitCost desc, Weight ASC;
