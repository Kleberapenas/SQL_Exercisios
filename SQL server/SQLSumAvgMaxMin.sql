use ContosoRetailDW;

select
count(customerKey) as 'Qtd. Clientes'
from DimCustomer;

select
count(customerKey) as 'Qtd. Clientes'
from DimCustomer where Gender = 'F';

select
count(distinct departmentName) as 'Qtd. �reas'
from DimEmployee;

select
sum(salesquantity) as 'Total Vendido'
from factSales
where unitPrice >= 100;

select
avg(salesQuantity) as 'M�dia de Vendas'
from factSales
where UnitPrice >= 100;

select
min(SalesQuantity) as 'Min Venda'
from factSales;

select
max(salesquantity) as 'Max Venda'
from factSales;