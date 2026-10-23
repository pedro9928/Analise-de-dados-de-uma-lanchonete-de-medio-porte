/*Qual o faturamento por categoria de produto?*/
/*Lanches e Combos juntos respondem por cerca de 69% do faturamento. As Bebidas vendem muitas unidades (13 mil) mas faturam pouco, porque o preço unitário é baixo*/

select 
	categorias.nome, sum(itens_pedido.preco_unitario * itens_pedido.quantidade) faturamento
from produtos
join itens_pedido
	on produtos.id_produto = itens_pedido.id_produto
join categorias 
	on produtos.id_categoria = categorias.id_categoria
join pedidos 
	on itens_pedido.id_pedido = pedidos.id_pedido
where pedidos.status = "concluido"
group by produtos.id_categoria
order by faturamento desc
;