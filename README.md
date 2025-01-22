# Modelo Conceitual para Loja Online

Este modelo conceitual representa a estrutura básica de um sistema de e-commerce. O objetivo é fornecer uma visão geral das entidades e relacionamentos envolvidos no processo de compra, desde o cadastro do cliente até a entrega do produto.

![Projeto Conceitual de Banco de Dados – E-COMMERCE](https://github.com/user-attachments/assets/223a52d8-feeb-422d-b2e9-5a33590bde5c)

# Modelo Conceitual

Entidades principais:

1. CLIENTE
   - ID_Cliente (PK)
   - Nome
   - Tipo_Cliente (PF ou PJ)

2. PESSOA_FISICA (Especialização de CLIENTE)
   - ID_Cliente (FK, PK)
   - CPF
   - Data_Nascimento

3. PESSOA_JURIDICA (Especialização de CLIENTE)
   - ID_Cliente (FK, PK)
   - CNPJ
   - Razao_Social

4. CONTA
   - ID_Conta (PK)
   - ID_Cliente (FK)
   - Saldo

5. PEDIDO
   - ID_Pedido (PK)
   - Data
   - Valor_Total
   - ID_Cliente (FK)

6. PAGAMENTO
   - ID_Pagamento (PK)
   - ID_Pedido (FK)
   - Tipo_Pagamento (Cartão, Pix, Boleto)
   - Valor

7. ENTREGA
   - ID_Entrega (PK)
   - ID_Pedido (FK)
   - Status (Em processamento, Enviado, Entregue)
   - Codigo_Rastreio

**Entidades:**

* **CLIENTE e CONTA**

* **CLIENTE e PEDIDO**

* **PEDIDO e PAGAMENTO**

* **PEDIDO e ENTREGA**

**Relacionamentos:**

* Um cliente pode ter uma conta associada. Cada conta pertence exclusivamente a um cliente.
Relacionamento 1:1.
* Um cliente pode realizar vários pedidos.
Relacionamento 1:N.
* Um pedido pode ser pago com várias formas de pagamento.
Relacionamento 1:N.
* Cada pedido possui uma única entrega associada.
Relacionamento 1:1.

**Regras Adicionais:**

* Um cliente é obrigatoriamente Pessoa Física ou Jurídica, mas nunca ambos.
* O valor total de um pedido deve ser igual à soma dos valores das formas de pagamento associadas.
* O status da entrega deve ser atualizado conforme o progresso do pedido.
