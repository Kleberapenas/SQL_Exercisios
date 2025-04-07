use ContosoRetailDW;

select * 
from DimProduct
where ProductName like '%MP3%';

select*from dimProduct
where BrandName = 'Contoso' and ColorName = 'Silver';

select*from DimProduct 
where ColorName = 'Blue' or ColorName = 'Silver';

select*from DimProduct
where not ColorName = 'Blue';

select*from DimProduct
where ColorName in ('Blue','Silver','Black');

select*from DimProduct
where not ColorName in ('Blue','Silver','Black');

select top(1000) *from FactSales
where SalesQuantity between 10 and 15;

select * from DimCustomer
where FirstName is null;

select*from DimCustomer
where not FirstName is null;