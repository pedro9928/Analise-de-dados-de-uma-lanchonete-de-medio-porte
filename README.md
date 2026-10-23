# Análise de dados de uma lanchonete (SQL)

Projeto de portfólio em SQL: dois bancos relacionais fictícios de uma lanchonete de médio porte, com 6 meses de operação (abril a setembro de 2026), e consultas que respondem perguntas de negócio.

**Ferramentas:** MySQL 8.0 e MySQL Workbench.
**Técnicas:** JOIN e LEFT JOIN, CTE, GROUP BY, funções de data e agregação.

## Dados

Todos os dados são fictícios.

| Banco | Tabelas | Conteúdo |
|---|---|---|
| `lanchonete_vendas` | categorias, produtos, clientes, pedidos, itens_pedido | Cardápio, clientes e ~20 mil pedidos |
| `lanchonete_operacao` | cargos, funcionarios, escalas, fornecedores, insumos, compras_insumos | Equipe, escalas e compras de insumos |

## Como rodar

1. Instale o MySQL Server e o Workbench.
2. Execute `banco/01_lanchonete_vendas.sql` e `banco/02_lanchonete_operacao.sql`. Eles recriam os bancos do zero.
3. Abra os arquivos da pasta `Consultas/` e rode um por vez.

## Perguntas respondidas

- Quantos pedidos e qual o faturamento por mês?
- Qual o ticket médio por canal?
- Em quais dias da semana e horários a casa vende mais?
- Qual a forma de pagamento mais usada em cada canal?
- Quais clientes nunca fizeram um pedido?
- Quais produtos nunca foram vendidos?
- Qual o faturamento por categoria?

## Principais achados

- **Faturamento:** de R$ 148 mil (abril) a R$ 171 mil (setembro) por mês, com pico de R$ 181 mil em agosto.
- **Ticket médio:** R$ 48,47 no balcão, R$ 48,92 no app e R$ 55,41 no delivery. A diferença vem da taxa de entrega de R$ 6,00, e sem ela os três canais ficam perto de R$ 49.
- **Quando vende:** sábado, sexta e domingo concentram as vendas, com picos às 12h-13h e às 19h-20h.
- **Pagamento:** o pix lidera nos três canais, com cerca de 38% dos pedidos em cada um.
- **Clientes:** 64 clientes cadastrados nunca compraram.
- **Cardápio:** dois produtos nunca venderam, um descontinuado e a Torta de Limão, que está ativa e parada.
- **Categorias:** Lanches e Combos somam cerca de 69% do faturamento.

## Decisões de cálculo

- Faturamento considera só pedidos `concluido`.
- O valor do pedido é a soma dos itens (`quantidade * preco_unitario`) mais a taxa de entrega, menos o desconto. Taxa e desconto entram uma vez por pedido, e não uma vez por item.
- O preço histórico vem de `itens_pedido.preco_unitario`, e não de `produtos.preco`, porque houve reajuste em julho de 2026.
