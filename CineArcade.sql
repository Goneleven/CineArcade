-- CRIAÇÃO DO BANCO DE DADOS 'CINEARCADE'

CREATE DATABASE CINEARCADE;

-- UTILIZAR O BANCO 'CINEARCADE'

USE CINEARCADE;
 
-- CRIAÇÃO DA TABELA 'CLIENTES'

CREATE TABLE Clientes(
    cpf             VARCHAR(14) PRIMARY KEY NOT NULL,
    nome            VARCHAR(60) NOT NULL,
    telefone        VARCHAR(15) NOT NULL,
    email           VARCHAR(40) NOT NULL,
    data_nascimento DATE,
    id_endereco 	INT NOT NULL,
    CONSTRAINT fk_id_endereco FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

-- DADOS DOS CLIENTES

INSERT INTO Clientes(cpf, nome, telefone, email, data_nascimento, id_endereco) 
VALUES 
	('104.092.918-46', 'José Santana Pereira', '11 2350-7973', 'josesantana004@outlook.com', '1974-03-17', 1),
	('099.784.428-04', 'Elza Sophia Lúcia Corte Real', '11 2512-1938', 'Elzasophiaa123@gmail.com', '1956-02-20', 2),
	('255.527.438-30', 'Manoel Ryan Yago Rocha', '11 3543-8447', 'Manoelryanrocha@outlook.com', '1985-07-13', 3),
    ('826.387.678-83', 'Emanuel Rafael da Rocha', '11 2670-0066', 'Emanuelrocha444@gmail.com', '1988-08-19', 4),
	('715.395.898-38', 'Lara Caroline Souza', '11 2791-2532', 'Laracarolsouzaa@gmail.com', '1999-01-11', 5);

SELECT * FROM Clientes;

DESCRIBE Clientes;

-- CRIAÇÃO DA TABELA 'ENDEREÇOS'

CREATE TABLE Enderecos(
	id_endereco INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT(10) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    complemento VARCHAR(100) NOT NULL
);

-- DADOS DE ENDEREÇOS

INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Rua Professor Jurandyr de Oliveira, Jardim Esperança', 888, '08743-180', 'Mogi Das Cruzes', 'SP', 'Casa Portão Vermelho'),
	('Avenida Capitão Arcílio Rizzi, Cézar de Souza', 798, '08820-130', 'Mogi Das Cruzes', 'SP', 'Condominio A'),
	('Rua Loyde Aéreo, Jardim Aeroporto III', 579, '08761-500', 'Mogi Das Cruzes', 'SP', 'Condominio Bloco 7'),
    ('Rua João Ribeiro de Brito, Vila Paulista', 546, '08744-030', 'Mogi Das Cruzes', 'SP', 'Villagio Vivendas'),
	('Rua Davi Duran, Mogi Moderno', 783, '08717-445', 'Mogi Das Cruzes', 'SP', 'Casa');

SELECT * FROM Enderecos;

DESCRIBE Enderecos;

-- CRIAÇÃO DA TABELA 'CARGOS' 
 
CREATE TABLE Cargos(
    id_cargo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    funcoes  VARCHAR(30) NOT NULL
);

-- DADOS DE CARGOS
 
INSERT INTO Cargos(funcoes)
VALUES 
	('Diretor'),
	('Gerente'),
	('Supervisor'),
	('Assistente Geral'),
	('Atendente'),
    ('Suporte TI');

SELECT * FROM Cargos;

DESCRIBE Cargos;

-- CRIAÇÃO DA TABELA 'FUNCIONÁRIOS'
 
CREATE TABLE Funcionarios(
    cpf              VARCHAR(14) PRIMARY KEY,
    nome             VARCHAR(60),
    telefone         VARCHAR(15),
    login            VARCHAR(30),
    senha            VARCHAR(30),
    data_contratacao VARCHAR(20),
    id_cargo         INT,
    CONSTRAINT fk_id_cargo FOREIGN KEY (id_cargo) REFERENCES Cargos(id_cargo)
);

-- SELECT PARA VISUALIZAR OS DADOS DOS FUNCIONARIOS

SELECT f.cpf, f.nome, f.telefone, f.login, f.senha, f.data_contratacao, c.funcoes AS cargos
FROM FUNCIONARIOS f
JOIN cargos c ON f.id_cargo = c.id_cargo;

-- DADOS DE FUNCIONARIO

INSERT INTO Funcionarios (cpf, nome, telefone, login, senha, data_contratacao, id_cargo)
VALUES 
	('220.959.228-32', 'Raimundo Filipe Lucas Almada', '11 35510-6125', 'Rai4763!', '47861@', '2023-07-10', 03),
	('765.709.178-97', 'Ryan Igor Thiago Silva', '11 39818-4192', 'Ryan00797@', '4709Ryan@', '2023-06-15', 02),
	('589.075.478-58', 'Aline Milena das Neves', '11 39631-3393', 'Aline1106@', '07976Aline!', '2023-01-20', 01),
	('148.091.898-99', 'Leonardo Ryan Figueiredo', '11 26482-6969', 'Leo1212@', '07797@', '2023-04-05', 04),
	('259.620.088-04', 'Davi Lucca Aparício', '11 38663-3326', 'Davi0079lucca@', '70970@', '2023-03-10', 05);

-- CRIAÇÃO DA TABELA 'SETOR'
 
CREATE TABLE Setores (
    id_setor INT(10) AUTO_INCREMENT PRIMARY KEY,
    setor    VARCHAR(40)
);

-- DADOS DOS FONECEDORES

INSERT INTO Setores (setor)
VALUES 
	('Fornecedor Filmes'),
	('Fornecedor Jogos'),
	('Fornecedor Arcade');
    
SELECT * FROM Setores;

-- CRIAÇÃO DA TABELA 'FORNECEDOR'
 
CREATE TABLE Fornecedor(
    cnpj     VARCHAR(30) PRIMARY KEY,
    nome     VARCHAR(60),
    telefone VARCHAR(15),
    email    VARCHAR(40),
    endereco VARCHAR(70),
    cep      VARCHAR(9),
    cidade   VARCHAR(30),
    uf       VARCHAR(2),
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES Setor(id_setor)
);

-- DADOS DOS FORNECEDORES

INSERT INTO Fornecedor(cnpj, nome, telefone, email, endereco, cep, cidade, uf, id_setor)
VALUES 
	('37.460.882/0001-88', 'Indie na tela', '11 99785-4356', 'Indienatela@indiefilmes.com', 'Avenida Quatorze de Abril, Jardim IV Centenário, 279', '07160-180', 'Guarulhos', 'SP', 01),
	('02.623.120/0001-70', 'LudiCube', '11 98153-1563', 'LudiCube@Cubeindie.com', 'Rua Romildo Ceola, Ferrazópolis, 381', '09781-090', 'São Bernardo do Campo', 'SP', 02),
	('00.575.978/0001-81', 'FichasNEST', '14 31539-0606', 'Fichasnest@nestfichas.com', 'Rua João Plana, Núcleo Residencial Beija-Flor, 852 ', '17025-450', 'Bauru', 'SP', 03),
	('18.956.203/0001-11', 'JoyQuest', '11 99450-0302','Joyquest@questjoy.com', 'Rua Bari, Utinga, 265', '09230-090', 'Santo André', 'SP', 04),
	('71.690.325/0001-91', 'Culinária e Sabor', '11 98723-0323', 'Culinariaesabor@culinariaesabor.com', 'Avenida Santo Amaro, Vila Nova Conceição, 182', '04506-001', 'São Paulo', 'SP', 05);

-- SELECT PARA VISUALIZAR OS DADOS DOS FORNECEDORES

SELECT f.cnpj, f.nome, f.telefone, f.email, f.endereco, f.cep, f.cidade, f.uf, s.setor
FROM Fornecedor f
JOIN setor s ON f.id_setor = s.id_setor;

-- CRIAÇÃO DA TABELA 'ARCADE' 
 
CREATE TABLE Arcade(
    id_arcade INT PRIMARY KEY,
    nome      VARCHAR(30),
    id_fornecedor VARCHAR(30),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(cnpj)
);

-- DADOS DOS ARCADES

INSERT INTO Arcade(id_arcade, nome, id_fornecedor)
VALUES 
	(01,'Pac-Man', '18.956.203/0001-11'),
	(02,'Donkey Kong', '18.956.203/0001-11'),
	(03,'Space Invaders', '18.956.203/0001-11'),
	(04,'Street Fighter II', '18.956.203/0001-11'),
	(05,'Galaga', '18.956.203/0001-11');

-- SELECT PARA VISUALIZAR OS DADOS DOS ARCADES

SELECT a.id_arcade, a.nome, f.nome AS nome_fornecedor
FROM Arcade a
JOIN Fornecedor f ON a.id_fornecedor = f.cnpj;

-- CRIAÇÃO DA TABELA 'PEDIDO FILME' 
 
CREATE TABLE Pedido_Filme(
    id_pedido_filme   INT PRIMARY KEY,
    id_filme          INT,
    quantidade_pedida INT,
    valor_total       DECIMAL(6, 2),
    data_aluguel      DATE,
    data_devolucao    DATE
);

INSERT INTO Pedido_Filme(id_pedido_filme, id_filme, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES 
	(210, '0001', 01, 20.00, '2024-11-11','2024-11-18'),
	(211, '0002', 01, 25.99, '2024-11-11','2024-11-18'),
	(212, '0003', 01, 10.00, '2024-11-11','2024-11-18'),
	(213, '0001', 01, 29.99, '2024-11-12','2024-11-19'),
	(214, '0004', 02, 40.00, '2024-11-13','2024-11-20');

SELECT * FROM Pedido_Filme;

-- CRIAÇÃO DA TABELA 'PEDIDO JOGO'
 
CREATE TABLE Pedido_Jogo(
    id_pedido_jogo     INT PRIMARY KEY,
    id_jogo            INT,
    quantidade_pedida  INT,
    valor_total        DECIMAL(6, 2),
    data_aluguel       DATE,
    data_devolucao     DATE
);

INSERT INTO Pedido_Jogo(id_pedido_jogo, id_jogo, quantidade_pedida, valor_total, data_aluguel, data_devolucao)
VALUES 
	(50, '0001', 01, 60.00, '2024-11-11','2024-11-18'),
	(51, '0003', 02, 60.00, '2024-11-11','2024-11-18'),
	(52, '0002', 02, 125.00, '2024-11-12','2024-11-19'),
	(53, '0008', 01, 50.00, '2024-11-12','2024-11-19'),
	(54, '0010', 01, 100.00, '2024-11-13','2024-11-20');

SELECT * FROM Pedido_Jogo;

-- CRIAÇÃO DA TABELA 'FICHAS'
 
CREATE TABLE Fichas(
    id_fichas   INT PRIMARY KEY, 
    id_arcade   INT, 
    quantidade  INT,
    valor_total DECIMAL(6, 2),
    FOREIGN KEY (id_arcade) REFERENCES Arcade(id_arcade)
);

INSERT INTO Fichas(id_fichas, id_arcade, quantidade, valor_total)
VALUES 
	(01, '01', 500, 2500.00),
	(02, '02', 100, 400.00),
	(03, '03', 250, 1625.00),
	(04, '04', 400, 4000.00),
	(05, '05', 100, 350.00);

SELECT * FROM Fichas;

-- CRIAÇÃO DA TABELA 'PRODUTO' 

CREATE TABLE Produto(
    id_produto      INT PRIMARY KEY,
    id_pedido_filme INT, 
    id_pedido_jogo  INT,
    id_fichas       INT,
    valor_total     DECIMAL(6, 2),
	CONSTRAINT fk_id_pedido_filme FOREIGN KEY (id_pedido_filme) REFERENCES Pedido_Filme(id_pedido_filme),
	CONSTRAINT fk_id_pedido_jogo FOREIGN KEY (id_pedido_jogo) REFERENCES Pedido_Jogo(id_pedido_jogo),
    CONSTRAINT fk_id_fichas FOREIGN KEY (id_fichas) REFERENCES Fichas(id_fichas)
);

-- CRIAÇÃO DA TABELA 'MÉTODO DE PAGAMENTO'

CREATE TABLE Metodo_De_Pagamento(
    id_pagamento       INT PRIMARY KEY,
    forma_de_pagamento VARCHAR(30)
);
 
-- CRIAÇÃO DA TABELA 'COMANDA'
 
CREATE TABLE Comanda(
    id_comanda      INT PRIMARY KEY,
    id_cliente      VARCHAR(14),
    id_produto      INT,
    id_funcionario  VARCHAR(14),
    data            DATE,
    horario         TIME,
    id_pagamento    INT,
    FOREIGN KEY (id_pagamento) REFERENCES Metodo_De_Pagamento(id_pagamento),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(cpf),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(cpf)
);
 
-- CRIAÇÃO DA TABELA 'ESTOQUE FILME' 
 
CREATE TABLE Estoque_Filme(
    id_filme               INT PRIMARY KEY,
    nome                   VARCHAR(40),
    quantidade_total       INT,
    valor_unitario         DECIMAL(6, 2),
    valor_total_do_estoque DECIMAL(8, 2),
    id_aluguel             INT,
    id_fornecedor          VARCHAR(30),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(cnpj)
);

-- PAREI AQUI!!!
-- INSERT INTO Estoque_Filme(id_filme, nome, quantidade_total, valor_unitario, valor_total_do_estoque, id_aluguel, id_fornecedor)
-- VALUES 
-- 	(01, 'Nise, o coração da loucura', 2, 20.00, ),

-- CRIAÇÃO DA TABELA 'ESTOQUE JOGO'

CREATE TABLE Estoque_Jogo(
    id_jogo                INT PRIMARY KEY, 
    nome                   VARCHAR(40),
    quantidade_total       INT,
    valor_unitario         DECIMAL(6, 2),
    valor_total_do_estoque DECIMAL(8, 2),
    id_aluguel             INT, 
    id_fornecedor          VARCHAR(30),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(cnpj)
);