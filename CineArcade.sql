-- CRIAÇÃO DO BANCO DE DADOS 'CINEARCADE'

CREATE DATABASE CINEARCADE;

-- UTILIZAR O BANCO 'CINEARCADE'

USE CINEARCADE;
 
CREATE TABLE Enderecos(
	id_enderecos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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
	('Rua Professor Jurandyr de Oliveira, Jardim Esperança', 888, '08743-180', 'Mogi Das Cruzes', 'SP', 'Casa Portão Vermelho');
SET @id_endereco1 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Avenida Capitão Arcílio Rizzi, Cézar de Souza', 798, '08820-130', 'Mogi Das Cruzes', 'SP', 'Condominio A');
SET @id_endereco2 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Rua Loyde Aéreo, Jardim Aeroporto III', 579, '08761-500', 'Mogi Das Cruzes', 'SP', 'Condominio Bloco 7');
SET @id_endereco3 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Rua João Ribeiro de Brito, Vila Paulista', 546, '08744-030', 'Mogi Das Cruzes', 'SP', 'Villagio Vivendas');
SET @id_endereco4 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Rua Davi Duran, Mogi Moderno', 783, '08717-445', 'Mogi Das Cruzes', 'SP', 'Casa');
SET @id_endereco5 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Rua João Gomes, Jardim Planalto', 602, '08790-345', 'Mogi Das Cruzes', 'SP', 'LudiCube');
SET @id_enderecof01 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Avenida dos Trabalhadores, Centro', 2500, '08715-000', 'Mogi Das Cruzes', 'SP', 'FichasNest');
SET @id_enderecof02 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Rua dos Imigrantes, Vila Bertioga', 511, '08773-220', 'Mogi Das Cruzes', 'SP', 'Joyquest');
SET @id_enderecof03 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Avenida São Paulo, Parque das Laranjeiras', 872, '08734-101', 'Mogi Das Cruzes', 'SP', 'Brasil Indie');
SET @id_enderecof04 = LAST_INSERT_ID();
INSERT INTO Enderecos(logradouro, numero, cep, cidade, uf, complemento) 
VALUES 
	('Rua da Tecnologia, Jardim Novo Horizonte', 135, '08720-290', 'Mogi Das Cruzes', 'SP', 'IndieNaTela');
SET @id_enderecof05 = LAST_INSERT_ID();

SELECT * FROM Enderecos;

DESCRIBE Enderecos;

-- CRIAÇÃO DA TABELA 'CLIENTES'

CREATE TABLE Clientes(
    cpf             VARCHAR(14) PRIMARY KEY NOT NULL,
    nome            VARCHAR(60) NOT NULL,
    telefone        VARCHAR(15) NOT NULL,
    email           VARCHAR(40) NOT NULL,
    data_nascimento DATE,
    id_endereco_cliente INT,
    FOREIGN KEY (id_endereco_cliente) REFERENCES Enderecos(id_enderecos)
);

-- DADOS DOS CLIENTES

INSERT INTO Clientes(cpf, nome, telefone, email, data_nascimento, id_endereco_cliente) 
VALUES 
	('104.092.918-46', 'José Santana Pereira', '11 2350-7973', 'josesantana004@outlook.com', '1974-03-17', @id_endereco1),
    ('099.784.428-04', 'Elza Sophia Lúcia Corte Real', '11 2512-1938', 'Elzasophiaa123@gmail.com', '1956-02-20', @id_endereco2),
    ('255.527.438-30', 'Manoel Ryan Yago Rocha', '11 3543-8447', 'Manoelryanrocha@outlook.com', '1985-07-13', @id_endereco3),
    ('826.387.678-83', 'Emanuel Rafael da Rocha', '11 2670-0066', 'Emanuelrocha444@gmail.com', '1988-08-19', @id_endereco4),
    ('715.395.898-38', 'Lara Caroline Souza', '11 2791-2532', 'Laracarolsouzaa@gmail.com', '1999-01-11', @id_endereco5);

SELECT * FROM Clientes;

DESCRIBE Clientes;

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
    cnpj        VARCHAR(30) PRIMARY KEY,
    nome        VARCHAR(60),
    telefone    VARCHAR(15),
    email       VARCHAR(40),
    responsavel_setor INT, 
    id_endereco_fornecedor INT,
    FOREIGN KEY (id_endereco_fornecedor) REFERENCES Enderecos(id_enderecos),
    FOREIGN KEY (responsavel_setor) REFERENCES Setores(id_setor)
);

-- DADOS DOS FORNECEDORES

INSERT INTO Fornecedor(cnpj, nome, telefone, email, id_endereco_fornecedor, responsavel_setor)
VALUES 
	('37.460.882/0001-88', 'Indie na Tela', '11 99785-4356', 'Indienatela@indiefilmes.com', @id_enderecof01, 01),
	('02.623.120/0001-70', 'LudiCube', '11 98153-1563', 'LudiCube@Cubeindie.com', @id_enderecof02, 02),
	('00.575.978/0001-81', 'FichasNEST', '14 31539-0606', 'Fichasnest@nestfichas.com', @id_enderecof03, 03),
	('18.956.203/0001-11', 'JoyQuest', '11 99450-0302', 'Joyquest@questjoy.com', @id_enderecof04 , 02),
	('71.690.325/0001-91', 'Brasil Indie', '11 98723-0323', 'Brasilindie@filmesbrindie.com', @id_enderecof05, 01);

-- SELECT PARA VISUALIZAR OS DADOS DOS FORNECEDORES

SELECT f.cnpj, f.nome, f.telefone, f.email, f.id_endereco_fornecedor AS Endereço, s.setor
FROM Fornecedor f
JOIN Setores s ON f.responsavel_setor = s.id_setor;

-- CRIAÇÃO DA TABELA 'ARCADE' 
 
CREATE TABLE Maquinas(
    id_arcade INT PRIMARY KEY,
    nome      VARCHAR(30)
);

-- DADOS DOS ARCADES

INSERT INTO Maquinas(id_arcade, nome)
VALUES 
	(01,'Pac-Man'),
	(02,'Donkey Kong'),
	(03,'Space Invaders'),
	(04,'Street Fighter II'),
	(05,'Galaga');

-- CRIAÇÃO DA TABELA 'MIDIAS'

CREATE TABLE Midias(
   id_midia               INT PRIMARY KEY, 
   nome                   VARCHAR(40), 
   valor_unitario         DECIMAL(6,2),
   quantidade_total       INT, 
   valor_total_do_estoque INT, 
   tipo                   VARCHAR(10),
   status_                VARCHAR(10),
   cnpj_fornecedor		  VARCHAR(30),
   CONSTRAINT fk_cnpj_fornecedor FOREIGN KEY(cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);

-- DADOS DAS MIDIAS
INSERT INTO Midias(Id_midia, nome, valor_unitario, quantidade_total, valor_total_do_estoque, tipo, status_, cnpj_fornecedor)
VALUES (1, 'Chroma Squad', 30.99, 200, 30.99 * 200, 'Jogo', 'ON', '18.956.203/0001-11'),
       (2, 'Horizon Chase Turbo', 29.99, 50, 29.99 * 50, 'Jogo', 'ON', '02.623.120/0001-70'),
	   (3, 'Dandara', 15.00, 75, 15.00 * 75, 'Jogo', 'ON', '18.956.203/0001-11'),
       (4, 'Blazing Chrome', 17.99, 120, 17.99 * 120, 'Jogo', 'ON', '18.956.203/0001-11'),
       (5, 'Minoria', 21.55, 5, 21.55 * 5, 'Jogo', 'OFF', '02.623.120/0001-70'),
       (6, 'Além do Horizonte', 37.50, 20, 37.50 * 20, 'Filme', 'ON','37.460.882/0001-88'),
       (7, 'O Siléncio das Águas', 12.79, 0, 12.79 * 0, 'Filme', 'OFF', '71.690.325/0001-91'),
	   (8, 'Caminhos Cruzados', 15.00, 49, 15.00 * 49, 'Filme', 'ON', '71.690.325/0001-91'),
       (9, 'Entre Nós', 17.99, 12, 17.99 * 12, 'Filme', 'ON', '71.690.325/0001-91'),
       (10, 'Vidas Paralelas', 20.00, 46, 20.00 * 46, 'Filme', 'ON', '37.460.882/0001-88');

-- VISUALIZAR DADOS DA MIDIAS

SELECT id_midia, nome, valor_unitario, quantidade_total, valor_total_do_estoque AS Preço, tipo, status_, cnpj_fornecedor
FROM Midias;

-- CRIAÇÃO DA TABELA 'FICHAS'
 
CREATE TABLE Fichas(
    id_fichas   INT PRIMARY KEY, 
    quantidade  INT,
    valor_total DECIMAL(6, 2)
);

INSERT INTO Fichas(id_fichas, quantidade, valor_total)
VALUES 
	(01, 500, 2500.00),
	(02, 100, 400.00),
	(03, 250, 1625.00),
	(04, 400, 4000.00),
	(05, 100, 350.00);

SELECT * FROM Fichas;

-- CRIAÇÃO DA TABELA 'PEDIDO' 

CREATE TABLE Pedido(
    id_pedido               INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	quantidade_pedida       INT(30), 
    valor_total             DECIMAL(6, 2),
    data_retirada           DATE NOT NULL,
    data_prevista_devolucao DATE,
    data_efetiva_devolucao  DATE,
    id_midia				INT,
    CONSTRAINT fk_id_midia FOREIGN KEY(id_midia) REFERENCES Midias(id_midia)
);

INSERT INTO Pedido(quantidade_pedida, valor_total, data_retirada, data_prevista_devolucao, data_efetiva_devolucao, id_midia)
VALUES (2, 0, 14/11/2024,


DESCRIBE Pedido;

-- CRIAÇÃO DA TABELA 'PRODUTO'

CREATE TABLE Produto(
    id_produto INT PRIMARY KEY,
    Valor_total DECIMAL(6, 2)
);

-- CRIAÇÃO DA TABELA 'MÉTODO DE PAGAMENTO'

CREATE TABLE Metodo_De_Pagamento(
    id_pagamento       INT PRIMARY KEY,
    forma_de_pagamento VARCHAR(30)
);

-- DADOS DE 'METODO_DE_PAGAMENTO'

INSERT INTO Metodo_De_Pagamento(id_pagamento, forma_de_pagamento)
VALUES
	(01, 'Dinheiro'),
    (02, 'Pix'),
    (03, 'Crédito 1x'),
    (04, 'Crédito 2x'),
    (05, 'Clube Cinearcade');
    
SELECT * FROM Metodo_De_Pagamento;

DESCRIBE Metodo_De_Pagamento;
 
-- CRIAÇÃO DA TABELA 'COMANDA'
 
CREATE TABLE Comanda(
    id_comanda      INT PRIMARY KEY,
    data            DATE,
    horario         TIME,
    id_pagamento	INT NOT NULL,
    cpf_cliente		 VARCHAR(14) NOT NULL,
    cpf_funcionarios	VARCHAR(14) NOT NULL,
    CONSTRAINT fk_ide_pagamento FOREIGN KEY (id_pagamento) REFERENCES Metodo_De_Pagamento(id_pagamento),
    CONSTRAINT fk_cpf_cliente FOREIGN KEY (cpf_cliente) REFERENCES Clientes(cpf),
    CONSTRAINT fk_cpf_funcionarios FOREIGN KEY (cpf_funcionarios) REFERENCES Funcionarios(cpf)
);

SELECT * FROM Comanda;

DESCRIBE Comanda;