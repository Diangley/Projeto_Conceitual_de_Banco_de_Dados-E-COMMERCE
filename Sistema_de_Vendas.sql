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
