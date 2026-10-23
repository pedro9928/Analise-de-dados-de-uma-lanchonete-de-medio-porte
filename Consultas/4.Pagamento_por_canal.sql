/* Qual a forma de pagamento mais usada em cada canal? */

WITH pagamento as(
	Select 
		Canal,
		Forma_pagamento,
		COUNT(forma_pagamento) qtd,
        row_number() Over(partition by canal order by COUNT(forma_pagamento) desc) rn
	FROM
		pedidos
	WHERE status = "concluido"
	GROUP BY canal, forma_pagamento
)
SELECT	Canal, forma_pagamento, rn ranking
FROM pagamento
Where rn = 1
;


	
