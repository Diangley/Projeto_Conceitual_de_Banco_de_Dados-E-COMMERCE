# Modelo Conceitual para Loja Online

Este modelo conceitual representa a estrutura básica de um sistema de e-commerce. O objetivo é fornecer uma visão geral das entidades e relacionamentos envolvidos no processo de compra, desde o cadastro do cliente até a entrega do produto.

![Projeto Conceitual de Banco de Dados – E-COMMERCE](https://github.com/user-attachments/assets/223a52d8-feeb-422d-b2e9-5a33590bde5c)

## Modelo Conceitual

**Entidades principais:**

*1. CLIENTE*
   - ID_Cliente (PK)
   - Nome
   - Tipo_Cliente (PF ou PJ)

*2. PESSOA_FISICA (Especialização de CLIENTE)*
   - ID_Cliente (FK, PK)
   - CPF
   - Data_Nascimento

*3. PESSOA_JURIDICA (Especialização de CLIENTE)*
   - ID_Cliente (FK, PK)
   - CNPJ
   - Razao_Social

*4. CONTA*
   - ID_Conta (PK)
   - ID_Cliente (FK)
   - Saldo

*5. PEDIDO*
   - ID_Pedido (PK)
   - Data
   - Valor_Total
   - ID_Cliente (FK)

*6. PAGAMENTO*
   - ID_Pagamento (PK)
   - ID_Pedido (FK)
   - Tipo_Pagamento (Cartão, Pix, Boleto)
   - Valor

*7. ENTREGA*
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

## Código SQL para o Modelo Conceitual
```sql
-- Criação do banco de dados
CREATE DATABASE SistemaDeVendas;

-- Usar o banco de dados criado
USE SistemaDeVendas;

-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Tipo_Cliente ENUM('PF', 'PJ') NOT NULL
);

-- Tabela PESSOA_FISICA (Especialização de CLIENTE)
CREATE TABLE PESSOA_FISICA (
    ID_Cliente INT PRIMARY KEY,
    CPF CHAR(11) NOT NULL UNIQUE,
    Data_Nascimento DATE NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente)
);

-- Tabela PESSOA_JURIDICA (Especialização de CLIENTE)
CREATE TABLE PESSOA_JURIDICA (
    ID_Cliente INT PRIMARY KEY,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    Razao_Social VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente)
);

-- Tabela CONTA
CREATE TABLE CONTA (
    ID_Conta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    Saldo DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente)
);

-- Tabela PEDIDO
CREATE TABLE PEDIDO (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE NOT NULL,
    Valor_Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente)
);

-- Tabela PAGAMENTO
CREATE TABLE PAGAMENTO (
    ID_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT NOT NULL,
    Tipo_Pagamento ENUM('Cartão', 'Pix', 'Boleto') NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES PEDIDO(ID_Pedido)
);

-- Tabela ENTREGA
CREATE TABLE ENTREGA (
    ID_Entrega INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT NOT NULL,
    Status ENUM('Em processamento', 'Enviado', 'Entregue') NOT NULL,
    Codigo_Rastreio VARCHAR(50),
    FOREIGN KEY (ID_Pedido) REFERENCES PEDIDO(ID_Pedido)
);

-- Inserção de dados para teste
-- Inserindo clientes
INSERT INTO CLIENTE (Nome, Tipo_Cliente) VALUES ('João Silva', 'PF'), ('Empresa XYZ', 'PJ');

-- Inserindo pessoa física
INSERT INTO PESSOA_FISICA (ID_Cliente, CPF, Data_Nascimento) VALUES (1, '12345678901', '1990-05-20');

-- Inserindo pessoa jurídica
INSERT INTO PESSOA_JURIDICA (ID_Cliente, CNPJ, Razao_Social) VALUES (2, '12345678000190', 'Empresa XYZ Ltda');

-- Inserindo contas
INSERT INTO CONTA (ID_Cliente, Saldo) VALUES (1, 1000.50), (2, 5000.00);

-- Inserindo pedidos
INSERT INTO PEDIDO (Data, Valor_Total, ID_Cliente) VALUES ('2025-01-20', 200.00, 1), ('2025-01-21', 500.00, 2);

-- Inserindo pagamentos
INSERT INTO PAGAMENTO (ID_Pedido, Tipo_Pagamento, Valor) VALUES (1, 'Cartão', 200.00), (2, 'Pix', 500.00);

-- Inserindo entregas
INSERT INTO ENTREGA (ID_Pedido, Status, Codigo_Rastreio) VALUES (1, 'Enviado', 'AB123CD'), (2, 'Entregue', 'XY987ZT');
```
