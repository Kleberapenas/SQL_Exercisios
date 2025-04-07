use ContosoRetailDW;

select
departmentName,
count(DepartmentName) as 'Total de Funcionários'
from DimEmployee group by DepartmentName;

select
storeType,
sum(EmployeeCount) as 'QTD. Total Funcionários'
from DimStore
group by StoreType
order by sum(EmployeeCount) desc;

select
ColorName as 'Cor de Produto',
count(Colorname) as 'Qtd. Total'
from
DimProduct
where BrandName = 'Contoso'
group by ColorName;

select
BrandName as 'Marca',
count(BrandName) as 'Total Marca'
from
DimProduct group by BrandName
having count(BrandName) >= 200;

select
BrandName as 'Marca',
count(BrandName) as 'Total Marca'
from DimProduct where ClassName = 'Economy'
group by BrandName
having Count(BrandName) >= 200;

