select*, case
	when Sexo = 'M' then 'Masculino'
    else 'Feminino'
end as 'Sexo 2'
from clientes;

select*, case
	when Receita_Venda >= 3000 then 'Faturamento alto'
    when Receita_Venda >= 1000 then 'Faturamento Médio' 
    else 'Faturamento Baixo'
end as 'Faturamento'
from pedidos;
desc clientes;

select *, case
	when Sexo = 'F' and Qtd_Filhos>0 then "Promoção dias das mães"
    when Sexo = 'M' and Qtd_Filhos>0 then "Promoção dias dos pais"
    else "Sem promoção"
end as "Promoção"
from clientes;

select*, case
	when Marca_Produto = 'DELL' or Marca_Produto = 'SAMSUNG' then Preco_Unit-Preco_Unit*0.15
    else "Sem desconto"
end as "Desconto"
from produtos;

select*, case
	when Marca_Produto in('DELL','SAMSUNG')then(1-0.15)*Custo_Unit
    else Custo_Unit
end as 'Preco_com_Desconto?' from produtos;