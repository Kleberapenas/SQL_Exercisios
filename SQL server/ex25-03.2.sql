use ContosoRetailDW

-- ex1
select productkey, productname, productsubcategoryname from DimProduct
inner join dimproductsubcategory
on dimproduct.productsubcategorykey = dimproductsubcategory.productsubcategorykey
go

-- ex2
select ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryName from DimProductSubcategory
inner join DimProductCategory
on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
go

-- ex3
select DimStore.StoreKey, dimstore.StoreName, DimStore.EmployeeCount, DimGeography.ContinentName, DimGeography.RegionCountryName
from DimStore
left join DimGeography on DimGeography.GeographyKey = DimStore.GeographyKey
order by DimStore.StoreKey
go

-- ex4
select ProductName, ProductCategoryDescription
from DimProduct
left join DimProductSubcategory on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
left join DimProductCategory on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
go

-- ex5
select productsubcategoryname from DimProduct
right join DimProductSubcategory on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where ProductName is null