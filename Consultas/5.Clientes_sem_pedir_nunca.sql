/*Quais clientes nunca fizeram um pedido?*/
/*Esses 64 clientes têm cadastro, mas nunca compraram*/

select
	clientes.id_cliente, clientes.nome, clientes.email, clientes.telefone
from
	clientes
left join pedidos
	on clientes.id_cliente = pedidos.id_cliente
where pedidos.id_pedido is null
;