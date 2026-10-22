/* Em quais horários e dias da semana a casa vende mais? */


WITH FATURAMENTO AS(
	SELECT
		pedidos.id_pedido, SUM(itens_pedido.quantidade * itens_pedido.preco_unitario) + pedidos.taxa_entrega - pedidos.desconto Faturamento_ID
	FROM
		pedidos
	JOIN itens_pedido
		ON itens_pedido.id_pedido = pedidos.id_pedido
	WHERE status = "concluido"    
	GROUP BY pedidos.id_pedido
)
SELECT 
	HOUR(pedidos.data_pedido) hora, COUNT(pedidos.id_pedido) total_pedidos, SUM(FATURAMENTO.Faturamento_ID) Faturamento
FROM
	pedidos
JOIN FATURAMENTO
	ON FATURAMENTO.id_pedido = pedidos.id_pedido
GROUP BY hora
ORDER BY total_pedidos desc
;