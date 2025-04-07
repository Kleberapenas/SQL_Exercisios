use ContosoRetailDW;
-- ex1
select top(100) * from factSales
order by SalesAmount desc;
-- ex2
select top(10)*from DimProduct
order by UnitPrice desc, weight desc, AvailableForSaleDate;
-- ex3
select ProductName as 'Nome',Weight as 'Peso' 
from DimProduct
where Weight > 100
order by Weight desc;
-- ex4
select StoreName as 'Nome loja', OpenDate as 'Horario de abertura', EmployeeCount as 'Quantia de funcionarios' 
from DimStore
where storeType = 'Store' and status = 'On';
-- ex5
select * from DimProduct where ProductName like '%Home Theater%' and
BrandName = 'Litware' and AvailableForSaleDate = '20090315';
-- ex6
-- a
select * from DimStore where status = 'Off' and storeType = 'Store';
-- b
select * from DimStore where CloseDate is not Null;
-- ex 7
select * from DimStore where EmployeeCount between 1 and 200;
select * from DimStore where EmployeeCount between 21 and 50;
select * from DimStore where EmployeeCount > 50;
-- ex8
select ProductKey,ProductDescription,ProductName, UnitCost from DimProduct where ProductDescription like '%LCD%';
-- ex9
select*from DimProduct where ColorName in ('Green','Orange','Black','Silver','Pink') and BrandName in ('Contose','Litware','Fabrikam')
-- ex10
select*from DimProduct where BrandName = 'Contoso' and ColorName = 'Silver' and UnitPrice between 10 and 30 order by UnitPrice desc;

