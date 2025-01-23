-- 1. Recuperações simples com SELECT Statement
-- Recuperar todos os clientes
SELECT * FROM CLIENTE;

-- Listar todas as entregas e seus status
SELECT ID_Entrega, Status, Codigo_Rastreio FROM ENTREGA;

-- 2. Filtros com WHERE Statement
-- Listar pedidos feitos por um cliente específico (João Silva)
SELECT * 
FROM PEDIDO
WHERE ID_Cliente = 1;

-- Recuperar pagamentos com valor acima de 300
SELECT * 
FROM PAGAMENTO
WHERE Valor > 300;

-- 3. Atributos derivados
-- Calcular o saldo restante em contas após a realização de pedidos
SELECT C.ID_Cliente, C.Saldo - SUM(P.Valor_Total) AS Saldo_Restante
FROM CONTA C
JOIN PEDIDO P ON C.ID_Cliente = P.ID_Cliente
GROUP BY C.ID_Cliente;

-- Calcular o total pago em todos os pedidos
SELECT ID_Pedido, SUM(Valor) AS Total_Pago
FROM PAGAMENTO
GROUP BY ID_Pedido;

-- Listar clientes ordenados pelo nome
SELECT * 
FROM CLIENTE
ORDER BY Nome ASC;

-- 4. Ordenações com ORDER BY
-- Listar pedidos em ordem decrescente de valor total
SELECT * 
FROM PEDIDO
ORDER BY Valor_Total DESC;

-- 5. Condições de filtros aos grupos – HAVING Statement
-- Listar clientes que possuem saldo acima de 2000 após pedidos
SELECT C.ID_Cliente, C.Saldo - SUM(P.Valor_Total) AS Saldo_Restante
FROM CONTA C
JOIN PEDIDO P ON C.ID_Cliente = P.ID_Cliente
GROUP BY C.ID_Cliente
HAVING Saldo_Restante > 2000;


-- Listar os pedidos, seus pagamentos e status de entrega
SELECT PED.ID_Pedido, PED.Valor_Total, PAG.Tipo_Pagamento, ENT.Status
FROM PEDIDO PED
JOIN PAGAMENTO PAG ON PED.ID_Pedido = PAG.ID_Pedido
JOIN ENTREGA ENT ON PED.ID_Pedido = ENT.ID_Pedido;

-- Listar os clientes e o total de pedidos feitos por eles
SELECT C.Nome, COUNT(P.ID_Pedido) AS Total_Pedidos
FROM CLIENTE C
LEFT JOIN PEDIDO P ON C.ID_Cliente = P.ID_Cliente
GROUP BY C.Nome;

-- Listar todos os clientes PF com seus CPFs
SELECT C.Nome, PF.CPF
FROM CLIENTE C
JOIN PESSOA_FISICA PF ON C.ID_Cliente = PF.ID_Cliente;

-- 6. Junções complexas entre tabelas
-- Listar todas as entregas com os dados dos clientes associados
SELECT E.ID_Entrega, E.Status, E.Codigo_Rastreio, C.Nome
FROM ENTREGA E
JOIN PEDIDO P ON E.ID_Pedido = P.ID_Pedido
JOIN CLIENTE C ON P.ID_Cliente = C.ID_Cliente;
