use ContosoRetailDW

-- ex1
declare @valor1 int
set @valor1 = 10

declare @valor2 int
set @valor1 = 5

declare @valor3 int
set @valor3 = 34

declare @valor4 int
set @valor4 = 7

declare @soma int
set @soma = @valor1 + @valor2

declare @subtracao int
set @subtracao = @valor3 - @valor4

declare @multiplicacao int
set @multiplicacao = @valor1*@valor4

declare @divisao float
set @divisao = @valor3/@valor4

select round(@divisao, 2)
go

-- ex2
declare @produto varchar(20)
set @produto ='Celular'

declare @quantidade int
set @quantidade = 12

declare @preco float
set @preco = 9.99

declare @faturamento float
set @faturamento = @quantidade*@preco

select @produto,@quantidade,@preco,@faturamento
go

-- ex3
declare @nome varchar(30)
declare @data_nascimento date
declare @num_pets int

set @nome = 'Kleber'
set @data_nascimento = '10/02/2005'
set @num_pets = 2

print 'Meu nome é '+cast(@nome as varchar(max))+', nasci em '
+format(cast(@data_nascimento as datetime),'dd/MM/yyyy')
+' tenho '+format(@num_pets, 'G')+' pets.'
go

-- ex4
declare @nome_loja varchar(100)
set @nome_loja = ' '
select
@nome_loja = @nome_loja + storename + ','
from Dimstore
where format(CloseDate, 'yyyy') = 2008
print 'As lojas fechadas no ano de 2008 foram: ' + @nome_loja

go

-- ex5
select*from DimProductsubcategory
declare @id_subcategoria int
declare @subcategoria varchar(100)
set @subcategoria = 'Radio'
set @id_subcategoria = (Select productSubcategoryKey from DimSubcategory where ProductSubcategoryName = @subcategoria)
select*from 
