/* Quantos pedidos e qual faturamento por mês? */
/* O faturamento considera só pedidos concluido */
/* no valor inclui a taxa de entrega e desconta o desconto */


WITH Faturado as(
	SELECT
		pedidos.id_pedido, SUM(itens_pedido.quantidade * itens_pedido.preco_unitario) + pedidos.taxa_entrega - pedidos.desconto valor_vendido
	FROM 
		pedidos
	JOIN itens_pedido
		ON itens_pedido.id_pedido = pedidos.id_pedido
	WHERE pedidos.status = 'concluido'
	group by pedidos.id_pedido
)	
SELECT YEAR(pedidos.data_pedido) ano, MONTH(pedidos.data_pedido) mes, COUNT(distinct pedidos.id_pedido) Pedidos_total, SUM(Faturado.valor_vendido) faturamento 
FROM 
	pedidos
JOIN Faturado
	ON Faturado.id_pedido = pedidos.id_pedido
GROUP BY YEAR(data_pedido), MONTH(data_pedido) 
ORDER BY YEAR(data_pedido), MONTH(data_pedido) 
;
