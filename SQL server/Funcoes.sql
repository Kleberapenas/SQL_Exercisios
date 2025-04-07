use ContosoRetailDW

select
len('SQL dev  ') as 'len',
datalength ('SQL Dev   ') as 'Datalength'
go

use ContosoRetailDW
select
	Firstname as 'nome',
	lastname as 'Sobrenome',
	EmailAddress as 'e-mail',
	CONCAT(firstname,' ',Lastname) as 'Nome Completo'
from
	DimCustomer
go

select
	productname as 'produto',
	unitprice as 'preço',
	left(StyleName, 7) as 'Cod 1',
	right(stylename, 7) as 'Cod 2'
from
	DimProduct
go

select
	concat(firstname, ' ', lastname) as 'Nome Completo',
	gender as 'sexo (abrev)',
	replace(replace(gender, 'M', 'Masculino'), 'F', 'Feminino') as 'Sexo (Extenso)'
from
	DimCustomer
go

create table clientes(
	nome varchar(255),
	telefone varchar(220));
insert into clientes (nome, telefone) values
('João da Silva', '(11) 98765-4321'),
('Maria Oliveira','11.98765.4321'),
('Carlos Pereira','11 98765 4321'),
('Ana Souza','11-98765-4321');
go

select translate(telefone,'().-','    ') as telefone_padronizado from clientes;
go

select
	stuff(stuff('11988887777',8,0,'-'), 3, 0, ' ') as telefone_formatado
go

select
stuff(stuff(stuff(stuff('5511987654321',1,0,'('), 4, 0, ')'), 8, 0, ' '),
14, 0, '-');
go

select
	upper(FirstName) as 'Nome',
	lower(FirstName) as 'nome',
	emailaddress as 'e-mail'
from
	DimCustomer;
go

select 'Raquel Moreno' as 'Nome'
select charindex('Moreno','Raquel Moreno') as 'Posição Sobrenome'
select substring('Raquel Moreno',8,6) as 'Sobrenome'
go

declare @varCodigo varchar(50)
set @varCodigo = '   ABC123    '

select
	trim(@varCodigo) as 'Trim',
	ltrim(@varCodigo) as 'Ltrim',
	rtrim(@varcodigo) as 'rtrim'
go


declare @varData datetime
set @vardata = '18/05/2020'

select
	day(@varData ) as 'Dia',
	month(@vardata) as 'Mês',
	year(@vardata) as 'Ano'
go

declare @varDia int, @varMes int, @varAno int
set @vardia = 29
set @varMes = 12
set @varAno = 2020

select
	DATEFROMPARTS(@varAno, @varMes, @varDia) as 'Data'
go

select getdate()
select sysdatetime()
go

select
	datename(day, '2017/08/25') as 'Dia',
	datename(dayofyear, '2017/08/25') as 'Dia do ano',
	datename(DW, '2017/08/25') as 'Nome Dia',
	datename(MM,'2017/08/25') as 'Meês',
	datename(quarter, '2017/08/25') as 'Trimestre',
	datename(YY, '2017/08/25') as 'Ano'
go

declare @varData1 datetime, @varData2 datetime, @vardata3 datetime
set @varData1 = '10/07/2020'
set @vardata2 = '05/03/2020'
set @vardata3 = '14/11/2020'

select
	dateadd(month, -1, @vardata1) as 'Dateadd'

select
	datediff(day, @vardata2, @vardata3) as 'Dateadd'
go

