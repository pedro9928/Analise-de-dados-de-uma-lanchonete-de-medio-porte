/* Qual o ticket médio por canal (balcão, delivery, app)? */


WITH Faturamento as (
	SELECT 
		pedidos.id_pedido, SUM(itens_pedido.quantidade * itens_pedido.preco_unitario) + pedidos.taxa_entrega - pedidos.desconto Faturamento_PorVenda
	FROM 
		pedidos
	JOIN itens_pedido
		ON itens_pedido.id_pedido = pedidos.id_pedido
	WHERE status = "concluido"
    GROUP BY pedidos.id_pedido
)
SELECT pedidos.canal, ROUND(SUM(faturamento.Faturamento_PorVenda) / COUNT(distinct pedidos.id_pedido), 2) ticket_medio
FROM 
	pedidos
JOIN Faturamento
	ON Faturamento.id_pedido = pedidos.id_pedido
GROUP BY pedidos.canal
ORDER BY ticket_medio
;
