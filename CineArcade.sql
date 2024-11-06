-- CRIAÇÃO DO BANCO DE DADOS 'CINEARCADE'

CREATE DATABASE CINEARCADE;

-- UTILIZAR O BANCO 'CINEARCADE'

USE CINEARCADE;
 
-- CRIAÇÃO DA TABELA 'CLIENTES'

CREATE TABLE CLIENTES(
    cpf             VARCHAR(14) PRIMARY KEY,
    nome            VARCHAR(40) NOT NULL,
    telefone        VARCHAR(11) NOT NULL,
    email           VARCHAR(40) NOT NULL,
    endereco        VARCHAR(50) NOT NULL,
    cep             VARCHAR(9) NOT NULL,
    cidade          VARCHAR(30) NOT NULL,
    uf              VARCHAR(2) NOT NULL,
    complemento     VARCHAR(50),
    data_nascimento DATE
);

DESCRIBE CLIENTES;
 
-- CRIAÇÃO DA TABELA 'FUNCIONÁRIOS'
 
CREATE TABLE FUNCIONARIOS(
    cpf              VARCHAR(14) PRIMARY KEY,
    nome             VARCHAR(40),
    telefone         VARCHAR(11),
    login            VARCHAR(30),
    senha            VARCHAR(30),
    data_contratacao VARCHAR(20),
    id_cargo         INT,
    FOREIGN KEY (id_cargo) REFERENCES CARGO(id_cargo)
);
 
-- CRIAÇÃO DA TABELA 'PRODUTO' 
 
CREATE TABLE PRODUTO(
    id_produto      INT PRIMARY KEY,
    id_pedido_filme INT, 
    id_pedido_jogo  INT,
    id_fichas       INT,
    valor_total     DECIMAL(6, 2),
	CONSTRAINT fk_id_pedido_filme FOREIGN KEY (id_pedido_filme) REFERENCES PEDIDO_FILME(id_pedido_filme),
	CONSTRAINT fk_id_pedido_jogo FOREIGN KEY (id_pedido_jogo) REFERENCES PEDIDO_JOGO(id_pedido_jogo),
    CONSTRAINT fk_id_fichas FOREIGN KEY (id_fichas) REFERENCES FICHAS(id_fichas)
);

-- CRIAÇÃO DA TABELA 'MÉTODO DE PAGAMENTO'

CREATE TABLE METODO_DE_PAGAMENTO(
    id_pagamento       INT PRIMARY KEY,
    forma_de_pagamento VARCHAR(30)
);
 
-- CRIAÇÃO DA TABELA 'COMANDA'
 
CREATE TABLE COMANDA(
    id_comanda      INT PRIMARY KEY,
    id_cliente      VARCHAR(14),
    id_produto      INT,
    id_funcionario  VARCHAR(14),
    data            DATE,
    horario         TIME,
    id_pagamento    INT,
    FOREIGN KEY (id_pagamento) REFERENCES METODO_DE_PAGAMENTO(id_pagamento),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(cpf),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIOS(cpf)
);
 
-- CRIAÇÃO DA TABELA 'CARGO' 
 
CREATE TABLE CARGO(
    id_cargo INT PRIMARY KEY,
    funcoes  VARCHAR(30)
);
 
-- CRIAÇÃO DA TABELA 'FORNECEDOR' 
 
CREATE TABLE FORNECEDOR(
    cnpj     VARCHAR(30) PRIMARY KEY,
    nome     VARCHAR(40),
    telefone VARCHAR(11),
    email    VARCHAR(40),
    endereco VARCHAR(50),
    cep      VARCHAR(9),
    cidade   VARCHAR(30),
    uf       VARCHAR(2),
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES SETOR(id_setor)
);

-- CRIAÇÃO DA TABELA 'SETOR'
 
CREATE TABLE SETOR(
    id_setor INT PRIMARY KEY,
    setor    VARCHAR(40)
);
 
-- CRIAÇÃO DA TABELA 'PEDIDO FILME' 
 
CREATE TABLE PEDIDO_FILME(
    id_pedido_filme   INT PRIMARY KEY,
    id_filme          INT,
    quantidade_pedida INT,
    valor_total       DECIMAL(6, 2),
    data_aluguel      DATE,
    data_devolucao    DATE
);
 
-- CRIAÇÃO DA TABELA 'ESTOQUE FILME' 
 
CREATE TABLE ESTOQUE_FILME(
    id_filme               INT PRIMARY KEY,
    nome                   VARCHAR(40),
    quantidade_total       INT,
    valor_unitario         DECIMAL(6, 2),
    valor_total_do_estoque DECIMAL(8, 2),
    id_aluguel             INT,
    id_fornecedor          VARCHAR(30),
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(cnpj)
);

-- CRIAÇÃO DA TABELA 'FICHAS'
 
CREATE TABLE FICHAS(
    id_fichas   INT PRIMARY KEY, 
    id_arcade   INT, 
    quantidade  INT,
    valor_total DECIMAL(6, 2),
    FOREIGN KEY (id_arcade) REFERENCES ARCADE(id_arcade)
);
 
-- CRIAÇÃO DA TABELA 'ARCADE' 
 
CREATE TABLE ARCADE(
    id_arcade INT PRIMARY KEY,
    nome      VARCHAR(30),
    id_fornecedor VARCHAR(30),
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(cnpj)
);

-- CRIAÇÃO DA TABELA 'PEDIDO JOGO'
 
CREATE TABLE PEDIDO_JOGO(
    id_pedido_jogo     INT PRIMARY KEY,
    id_jogo            INT,
    quantidade_pedida  INT,
    valor_total        DECIMAL(6, 2),
    data_aluguel       DATE,
    data_devolucao     DATE
);

-- CRIAÇÃO DA TABELA 'ESTOQUE JOGO'

CREATE TABLE ESTOQUE_JOGO(
    id_jogo                INT PRIMARY KEY, 
    nome                   VARCHAR(40),
    quantidade_total       INT,
    valor_unitario         DECIMAL(6, 2),
    valor_total_do_estoque DECIMAL(8, 2),
    id_aluguel             INT, 
    id_fornecedor          VARCHAR(30),
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(cnpj)
);