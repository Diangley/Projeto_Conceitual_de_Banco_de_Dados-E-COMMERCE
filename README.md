# Modelo Conceitual para Loja Online

Este modelo conceitual representa a estrutura básica de um sistema de e-commerce. O objetivo é fornecer uma visão geral das entidades e relacionamentos envolvidos no processo de compra, desde o cadastro do cliente até a entrega do produto.

![Projeto Conceitual de Banco de Dados – E-COMMERCE](https://github.com/user-attachments/assets/0becce17-cbcf-4cb3-b686-d5c7b015aab2)

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

**Considerações:**

* O atributo "Tipo" na entidade Cliente serve para diferenciar entre pessoa física e jurídica.
* A entidade Pedido não foi detalhada neste modelo, mas seria responsável por armazenar informações sobre os produtos comprados, data do pedido, etc.

**Próximos passos:**

* Desenvolver o modelo lógico e físico do banco de dados.
* Implementar as funcionalidades do sistema.
* Realizar testes e ajustes no modelo.
