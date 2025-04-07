use ContosoRetailDW;

-- ex1
-- a
select sum(SalesQuantity) from FactSales
group by channelKey
order by channelKey;
-- b
select sum(SalesQuantity), sum(ReturnQuantity) from FactSales
group by StoreKey
order by StoreKey;
-- c
select top(100)*from FactSales;
select channelKey, sum(SalesAmount) from FactSales
where DateKey like '%2007%'
group by channelKey;

-- ex2
-- a
select top(10) productKey, sum(SalesAmount) from FactOnlineSales
group by ProductKey
having sum(SalesAmount) >= 5000000
order by sum(SalesAmount) desc;
-- b
select top(10) sum(SalesAmount) from FactOnlineSales
group by ProductKey;

-- ex3
-- a
select top(1) CustomerKey,sum(TotalCost) from FactOnlineSales
group by CustomerKey
order by sum(SalesQuantity) desc;
-- b
select top(3) ProductKey,sum(TotalCost) from FactOnlineSales
where CustomerKey = '19037'
group by ProductKey
order by sum(SalesQuantity) desc;

-- ex4
-- a
select BrandName, count(ProductName) from DimProduct
group by BrandName;
-- b
select ClassName, avg(UnitPrice) from DimProduct
group by ClassName;
-- c
select ColorName, sum(weight) from DimProduct
group by ColorName;

-- ex5
select StockTypeName,sum(weight) from DimProduct
where BrandName = 'Contoso'
group by StockTypeName
order by sum(weight) desc;

-- ex6
select*from DimProduct 
select BrandName,
count(distinct ColorName) as 'Cores'
from DimProduct
group by BrandName;


-- ex7
select gender, avg(yearlyincome) from DimCustomer
where gender is not null
group by gender;

-- ex8
select Education, count(CustomerKey), avg(yearlyincome) from DimCustomer
where education is not null
group by Education;

-- ex9
select DepartmentName, count(EmployeeKey) from DimEmployee
where status = 'Current' or EndDate is null
group by DepartmentName;

-- ex10
select title as 'cargo', sum(vacationhours) from DimEmployee
select Title, sum(vacationhours) from DimEmployee
where gender = 'F' and departmentName in ('Production','Marketing','Enginnering','Finance') and Hiredate between '1990-01-01' and '2000-12-31'
group by Title;

