-- CRIAÇÃO DO BANCO DE DADOS 'CINEARCADE'

CREATE DATABASE CINEARCADE;

-- UTILIZAR O BANCO 'CINEARCADE'

USE CINEARCADE;
 
-- CRIAÇÃO DA TABELA 'CLIENTES'

CREATE TABLE CLIENTES(
    cpf             VARCHAR(14) PRIMARY KEY,
    nome            VARCHAR(60) NOT NULL,
    telefone        VARCHAR(15) NOT NULL,
    email           VARCHAR(40) NOT NULL,
    endereco        VARCHAR(70) NOT NULL,
    cep             VARCHAR(9) NOT NULL,
    cidade          VARCHAR(30) NOT NULL,
    uf              VARCHAR(2) NOT NULL,
    complemento     VARCHAR(50),
    data_nascimento DATE
);

-- DADOS DOS CLIENTES

INSERT INTO CLIENTES (cpf, nome, telefone, email, endereco, cep, cidade, uf, complemento, data_nascimento) 
VALUES ('104.092.918-46', 'José Santana Pereira', '11 2350-7973', 'josesantana004@outlook.com', 'Rua Professor Jurandyr de Oliveira, Jardim Esperança, 888', '08743-180', 'Mogi Das Cruzes', 'SP', 'Casa Portão Vermelho', '1974-03-17');

INSERT INTO CLIENTES (cpf, nome, telefone, email, endereco, cep, cidade, uf, complemento, data_nascimento) 
VALUES ('099.784.428-04', 'Elza Sophia Lúcia Corte Real', '11 2512-1938', 'Elzasophiaa123@gmail.com', 'Avenida Capitão Arcílio Rizzi, Cézar de Souza, 798', '08820-130', 'Mogi Das Cruzes', 'SP', 'Condominio A', '1956-02-20');

INSERT INTO CLIENTES (cpf, nome, telefone, email, endereco, cep, cidade, uf, complemento, data_nascimento) 
VALUES ('255.527.438-30', 'Manoel Ryan Yago Rocha', '11 3543-8447', 'Manoelryanrocha@outlook.com', 'Rua Loyde Aéreo, Jardim Aeroporto III, 579', '08761-500', 'Mogi Das Cruzes', 'SP', 'Condominio Bloco 7', '1985-07-13');

INSERT INTO CLIENTES (cpf, nome, telefone, email, endereco, cep, cidade, uf, complemento, data_nascimento) 
VALUES ('826.387.678-83', 'Emanuel Rafael da Rocha', '11 2670-0066', 'Emanuelrocha444@gmail.com', 'Rua João Ribeiro de Brito, Vila Paulista, 546', '08744-030', 'Mogi Das Cruzes', 'SP', 'Villagio Vivendas', '1988-08-19');

INSERT INTO CLIENTES (cpf, nome, telefone, email, endereco, cep, cidade, uf, complemento, data_nascimento) 
VALUES ('715.395.898-38', 'Lara Caroline Souza', '11 2791-2532', 'Laracarolsouzaa@gmail.com', 'Rua Davi Duran, Mogi Moderno, 783', '08717-445', 'Mogi Das Cruzes', 'SP', 'Casa', '1999-01-11');

SELECT * FROM CLIENTES;

DESCRIBE CLIENTES;

-- CRIAÇÃO DA TABELA 'CARGO' 
 
CREATE TABLE CARGO(
    id_cargo INT PRIMARY KEY,
    funcoes  VARCHAR(30)
);

-- DADOS DE CARGO
 
INSERT INTO CARGO (id_cargo, funcoes)
VALUES (01, 'Diretor');
INSERT INTO CARGO (id_cargo, funcoes)
VALUES (02, 'Gerente');
INSERT INTO CARGO (id_cargo, funcoes)
VALUES (03, 'Supervisor');
INSERT INTO CARGO (id_cargo, funcoes)
VALUES (04, 'Assistente Geral');
INSERT INTO CARGO (id_cargo, funcoes)
VALUES (05, 'Atendente');

-- CRIAÇÃO DA TABELA 'FUNCIONÁRIOS'
 
CREATE TABLE FUNCIONARIOS(
    cpf              VARCHAR(14) PRIMARY KEY,
    nome             VARCHAR(60),
    telefone         VARCHAR(15),
    login            VARCHAR(30),
    senha            VARCHAR(30),
    data_contratacao VARCHAR(20),
    id_cargo         INT,
    FOREIGN KEY (id_cargo) REFERENCES CARGO(id_cargo)
);

-- SELECT PARA VISUALIZAR OS DADOS DOS FUNCIONARIOS

SELECT f.cpf, f.nome, f.telefone, f.login, f.senha, f.data_contratacao, c.funcoes AS cargo
FROM FUNCIONARIOS f
JOIN cargo c ON f.id_cargo = c.id_cargo;

-- DADOS DE FUNCIONARIO

INSERT INTO FUNCIONARIOS (cpf, nome, telefone, login, senha, data_contratacao, id_cargo)
VALUES ('220.959.228-32', 'Raimundo Filipe Lucas Almada', '11 35510-6125', 'Rai4763!', '47861@', '2023-07-10', 03);
INSERT INTO FUNCIONARIOS (cpf, nome, telefone, login, senha, data_contratacao, id_cargo)
VALUES ('765.709.178-97', 'Ryan Igor Thiago Silva', '11 39818-4192', 'Ryan00797@', '4709Ryan@', '2023-06-15', 02);
INSERT INTO FUNCIONARIOS (cpf, nome, telefone, login, senha, data_contratacao, id_cargo)
VALUES ('589.075.478-58', 'Aline Milena das Neves', '11 39631-3393', 'Aline1106@', '07976Aline!', '2023-01-20', 01);
INSERT INTO FUNCIONARIOS (cpf, nome, telefone, login, senha, data_contratacao, id_cargo)
VALUES ('148.091.898-99', 'Leonardo Ryan Figueiredo', '11 26482-6969', 'Leo1212@', '07797@', '2023-04-05', 04);
INSERT INTO FUNCIONARIOS (cpf, nome, telefone, login, senha, data_contratacao, id_cargo)
VALUES ('259.620.088-04', 'Davi Lucca Aparício', '11 38663-3326', 'Davi0079lucca@', '70970@', '2023-03-10', 05);


-- CRIAÇÃO DA TABELA 'SETOR'
 
CREATE TABLE SETOR(
    id_setor INT PRIMARY KEY,
    setor    VARCHAR(40)
);

-- DADOS DOS FONECEDORES

INSERT INTO SETOR(id_setor, setor)
VALUES (01, 'Fornecedor Filmes');
INSERT INTO SETOR(id_setor, setor)
VALUES (02, 'Fornecedor Jogos');
INSERT INTO SETOR(id_setor, setor)
VALUES (03, 'Fornecedor Fichas');
INSERT INTO SETOR(id_setor, setor)
VALUES (04, 'Fornecedor Arcade');
INSERT INTO SETOR(id_setor, setor)
VALUES (05, 'Fornecedor Alimentação');

-- CRIAÇÃO DA TABELA 'FORNECEDOR' 
 
CREATE TABLE FORNECEDOR(
    cnpj     VARCHAR(30) PRIMARY KEY,
    nome     VARCHAR(60),
    telefone VARCHAR(15),
    email    VARCHAR(40),
    endereco VARCHAR(70),
    cep      VARCHAR(9),
    cidade   VARCHAR(30),
    uf       VARCHAR(2),
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES SETOR(id_setor)
);

-- DADOS DOS FORNECEDORES

INSERT INTO FORNECEDOR(cnpj, nome, telefone, email, endereco, cep, cidade, uf, id_setor)
VALUES ('37.460.882/0001-88', 'Indie na tela', '11 99785-4356', 'Indienatela@indiefilmes.com', 'Avenida Quatorze de Abril, Jardim IV Centenário, 279', '07160-180', 'Guarulhos', 'SP', 01);
INSERT INTO FORNECEDOR(cnpj, nome, telefone, email, endereco, cep, cidade, uf, id_setor)
VALUES ('02.623.120/0001-70', 'LudiCube', '11 98153-1563', 'LudiCube@Cubeindie.com', 'Rua Romildo Ceola, Ferrazópolis, 381', '09781-090', 'São Bernardo do Campo', 'SP', 02);
INSERT INTO FORNECEDOR(cnpj, nome, telefone, email, endereco, cep, cidade, uf, id_setor)
VALUES ('00.575.978/0001-81', 'FichasNEST', '14 31539-0606', 'Fichasnest@nestfichas.com', 'Rua João Plana, Núcleo Residencial Beija-Flor, 852 ', '17025-450', 'Bauru', 'SP', 03);
INSERT INTO FORNECEDOR(cnpj, nome, telefone, email, endereco, cep, cidade, uf, id_setor)
VALUES ('18.956.203/0001-11', 'JoyQuest', '11 99450-0302','Joyquest@questjoy.com', 'Rua Bari, Utinga, 265', '09230-090', 'Santo André', 'SP', 04);
INSERT INTO FORNECEDOR(cnpj, nome, telefone, email, endereco, cep, cidade, uf, id_setor)
VALUES ('71.690.325/0001-91', 'Culinária e Sabor', '11 98723-0323', 'Culinariaesabor@culinariaesabor.com', 'Avenida Santo Amaro, Vila Nova Conceição, 182', '04506-001', 'São Paulo', 'SP', 05);

-- SELECT PARA VISUALIZAR OS DADOS DOS FORNECEDORES

SELECT f.cnpj, f.nome, f.telefone, f.email, f.endereco, f.cep, f.cidade, f.uf, s.setor
FROM FORNECEDOR f
JOIN setor s ON f.id_setor = s.id_setor;

-- CRIAÇÃO DA TABELA 'ARCADE' 
 
CREATE TABLE ARCADE(
    id_arcade INT PRIMARY KEY,
    nome      VARCHAR(30),
    id_fornecedor VARCHAR(30),
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(cnpj)
);

-- DADOS DOS ARCADES

INSERT INTO ARCADE(id_arcade, nome, id_fornecedor)
VALUES (01,'Pac-Man', '18.956.203/0001-11');
INSERT INTO ARCADE(id_arcade, nome, id_fornecedor)
VALUES (02,'Donkey Kong', '18.956.203/0001-11');
INSERT INTO ARCADE(id_arcade, nome, id_fornecedor)
VALUES (03,'Space Invaders', '18.956.203/0001-11');
INSERT INTO ARCADE(id_arcade, nome, id_fornecedor)
VALUES (04,'Street Fighter II', '18.956.203/0001-11');
INSERT INTO ARCADE(id_arcade, nome, id_fornecedor)
VALUES (05,'Galaga', '18.956.203/0001-11');

-- SELECT PARA VISUALIZAR OS DADOS DOS ARCADES

SELECT a.id_arcade, a.nome, f.nome AS nome_fornecedor
FROM ARCADE a
JOIN FORNECEDOR f ON a.id_fornecedor = f.cnpj;

-- CRIAÇÃO DA TABELA 'PEDIDO FILME' 
 
CREATE TABLE PEDIDO_FILME(
    id_pedido_filme   INT PRIMARY KEY,
    id_filme          INT,
    quantidade_pedida INT,
    valor_total       DECIMAL(6, 2),
    data_aluguel      DATE,
    data_devolucao    DATE
);

INSERT INTO PEDIDO_FILME(id_pedido_filme, id_filme, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (210, '0001', 01, 20.00, '2024-11-11','2024-11-18');
INSERT INTO PEDIDO_FILME(id_pedido_filme, id_filme, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (211, '0002', 01, 25.99, '2024-11-11','2024-11-18');
INSERT INTO PEDIDO_FILME(id_pedido_filme, id_filme, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (212, '0003', 01, 10.00, '2024-11-11','2024-11-18');
INSERT INTO PEDIDO_FILME(id_pedido_filme, id_filme, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (213, '0001', 01, 29.99, '2024-11-12','2024-11-19');
INSERT INTO PEDIDO_FILME(id_pedido_filme, id_filme, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (214, '0004', 02, 40.00, '2024-11-13','2024-11-20');

SELECT * FROM PEDIDO_FILME;

-- CRIAÇÃO DA TABELA 'PEDIDO JOGO'
 
CREATE TABLE PEDIDO_JOGO(
    id_pedido_jogo     INT PRIMARY KEY,
    id_jogo            INT,
    quantidade_pedida  INT,
    valor_total        DECIMAL(6, 2),
    data_aluguel       DATE,
    data_devolucao     DATE
);

INSERT INTO PEDIDO_JOGO(id_pedido_jogo, id_jogo, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (50, '0001', 01, 60.00, '2024-11-11','2024-11-18');
INSERT INTO PEDIDO_JOGO(id_pedido_jogo, id_jogo, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (51, '0003', 02, 60.00, '2024-11-11','2024-11-18');
INSERT INTO PEDIDO_JOGO(id_pedido_jogo, id_jogo, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (52, '0002', 02, 125.00, '2024-11-12','2024-11-19');
INSERT INTO PEDIDO_JOGO(id_pedido_jogo, id_jogo, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (53, '0008', 01, 50.00, '2024-11-12','2024-11-19');
INSERT INTO PEDIDO_JOGO(id_pedido_jogo, id_jogo, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES (54, '0010', 01, 100.00, '2024-11-13','2024-11-20');

SELECT * FROM PEDIDO_JOGO;

-- CRIAÇÃO DA TABELA 'FICHAS'
 
CREATE TABLE FICHAS(
    id_fichas   INT PRIMARY KEY, 
    id_arcade   INT, 
    quantidade  INT,
    valor_total DECIMAL(6, 2),
    FOREIGN KEY (id_arcade) REFERENCES ARCADE(id_arcade)
);

INSERT INTO FICHAS(id_fichas, id_arcade, quantidade, valor_total)
VALUES (01, '01', 500, 2500.00);
INSERT INTO FICHAS(id_fichas, id_arcade, quantidade, valor_total)
VALUES (02, '02', 100, 400.00);
INSERT INTO FICHAS(id_fichas, id_arcade, quantidade, valor_total)
VALUES (03, '03', 250, 1625.00);
INSERT INTO FICHAS(id_fichas, id_arcade, quantidade, valor_total)
VALUES (04, '04', 400, 4000.00);
INSERT INTO FICHAS(id_fichas, id_arcade, quantidade, valor_total)
VALUES (05, '05', 100, 350.00);

SELECT * FROM FICHAS;

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

-- PAREI POR AQUI

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