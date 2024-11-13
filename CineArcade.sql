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
    data_nascimento DATE
);

-- DADOS DOS CLIENTES

INSERT INTO Clientes(cpf, nome, telefone, email, data_nascimento, id_endereco) 
VALUES 
	('104.092.918-46', 'José Santana Pereira', '11 2350-7973', 'josesantana004@outlook.com', '1974-03-17'),
	('099.784.428-04', 'Elza Sophia Lúcia Corte Real', '11 2512-1938', 'Elzasophiaa123@gmail.com', '1956-02-20'),
	('255.527.438-30', 'Manoel Ryan Yago Rocha', '11 3543-8447', 'Manoelryanrocha@outlook.com', '1985-07-13'),
	('826.387.678-83', 'Emanuel Rafael da Rocha', '11 2670-0066', 'Emanuelrocha444@gmail.com', '1988-08-19'),
	('715.395.898-38', 'Lara Caroline Souza', '11 2791-2532', 'Laracarolsouzaa@gmail.com', '1999-01-11');

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
    cnpj        VARCHAR(30) PRIMARY KEY,
    nome        VARCHAR(60),
    telefone    VARCHAR(15),
    email       VARCHAR(40),
    responsavel VARCHAR(40),
    FOREIGN KEY (responsavel) REFERENCES Setor(id_setor)
);

-- DADOS DOS FORNECEDORES

INSERT INTO Fornecedor(cnpj, nome, telefone, email, endereco, cep, cidade, uf, responsavel)
VALUES 
	('37.460.882/0001-88', 'Indie na tela', '11 99785-4356', 'Indienatela@indiefilmes.com', 01),
	('02.623.120/0001-70', 'LudiCube', '11 98153-1563', 'LudiCube@Cubeindie.com', 02),
	('00.575.978/0001-81', 'FichasNEST', '14 31539-0606', 'Fichasnest@nestfichas.com', 03),
	('18.956.203/0001-11', 'JoyQuest', '11 99450-0302','Joyquest@questjoy.com',  04),
	('71.690.325/0001-91', 'Culinária e Sabor', '11 98723-0323', 'Culinariaesabor@culinariaesabor.com', 05);

-- SELECT PARA VISUALIZAR OS DADOS DOS FORNECEDORES

SELECT f.cnpj, f.nome, f.telefone, f.email, s.setor
FROM Fornecedor f
JOIN setor s ON f.responsavel = s.id_setor;

-- CRIAÇÃO DA TABELA 'ARCADE' 
 
CREATE TABLE Maquinas(
    id_arcade INT PRIMARY KEY,
    nome      VARCHAR(30)
);

-- DADOS DOS ARCADES

INSERT INTO Arcade(id_arcade, nome)
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

SELECT * FROM Pedido;

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