-- ex1
set @Produto = '10/07/23';
select
case
	when @Produto>='10/06/23' then 'Produto passou da data de validade"'
    else 'Produto esta bom'
    end as 'Vencimento';

-- ex2
use diversas_tabelas;
select*,case
	when Renda_Anual>=80000 then 'Bonus 0.05'
    when Renda_Anual>=80000 and Estado_Civil='C' then 'Bonus 0.07'
    when Renda_Anual>= 60000 then 'Bonus 0.1'
    when Renda_Anual>= 40000 then 'Bonus 0.15'
    else 'Bonus 0.2'
end as 'Desconto Renda'
from clientes;

-- ex3
select*,case
	when Renda_Anual>=80000 then 'Desconto de 5%'
    when Renda_Anual>=80000 and Estado_Civil='C' then 'Desconto de 7%'
    when Renda_Anual>= 60000 then 'Desconto de 10%'
    when Renda_Anual>= 40000 then 'Desconto de 15%'
    else 'Desconto de 20%'
end as 'Desconto Renda'
from clientes;

-- ex4
	select*,case
	when Renda_Anual>=80000 then Renda_Anual*(1-0.05)
    when Renda_Anual>=80000 and Estado_Civil='C' then Renda_Anual*(1-0.007)
    when Renda_Anual>= 60000 then Renda_Anual*(1-0.1)
    when Renda_Anual>= 40000 then Renda_Anual*(1-0.15)
    else Renda_Anual*(1-0.2)
end as 'Desconto Renda'
from clientes;