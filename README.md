# Modelo Conceitual para Loja Online

Este modelo conceitual representa a estrutura básica de um sistema de e-commerce. O objetivo é fornecer uma visão geral das entidades e relacionamentos envolvidos no processo de compra, desde o cadastro do cliente até a entrega do produto.

![Projeto Conceitual de Banco de Dados – E-COMMERCE](https://github.com/user-attachments/assets/0becce17-cbcf-4cb3-b686-d5c7b015aab2)

**Entidades:**

* **Cliente:** Representa um cliente da loja, podendo ser pessoa física ou jurídica.
* **Conta:** Representa a conta bancária do cliente associada aos pagamentos.
* **Pagamento:** Armazena as informações sobre os métodos de pagamento cadastrados pelo cliente.
* **Entrega:** Armazena informações sobre o status e o rastreamento das entregas.

**Relacionamentos:**

* Um cliente pode ter uma ou mais contas.
* Um cliente pode ter múltiplos métodos de pagamento cadastrados.
* Uma entrega está associada a um pedido.

**Considerações:**

* O atributo "Tipo" na entidade Cliente serve para diferenciar entre pessoa física e jurídica.
* A entidade Pedido não foi detalhada neste modelo, mas seria responsável por armazenar informações sobre os produtos comprados, data do pedido, etc.

**Próximos passos:**

* Desenvolver o modelo lógico e físico do banco de dados.
* Implementar as funcionalidades do sistema.
* Realizar testes e ajustes no modelo.
