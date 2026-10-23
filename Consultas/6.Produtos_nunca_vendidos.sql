/*Quais produtos nunca foram vendidos?*/
/*Dois produtos sem venda registrada um descontinuado e outro sem vendas desde seu lançamento*/
/*vale promover ou tirar do cardapio*/

select produtos.nome, produtos.ativo, produtos.data_lancamento	
from produtos
left join itens_pedido
	on produtos.id_produto = itens_pedido.id_produto
where itens_pedido.id_pedido is null
;