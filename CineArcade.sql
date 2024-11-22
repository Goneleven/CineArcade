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

-- DADOS DE ENDEREÇO DE CLIENTE E FORNECEDOR

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

-- UPDATE DE ATUALIZAÇÃO DE DADOS DE ENDEREÇO

UPDATE Enderecos
SET complemento = 'Casa Portão vermelho do lado do Bar do Zé'
WHERE id_enderecos = @id_endereco1;

-- SELECT PARA VISUALIZAR OS ENDEREÇOS

SELECT * FROM Enderecos;

-- DESCREVE A ESTRUTURA DA TABELA ENDEREÇO

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
	('104.092.918-46', 'José Santana Pereira', '11 92350-7973', 'josesantana004@outlook.com', '1974-03-17', @id_endereco1),
    ('099.784.428-04', 'Elza Sophia Lúcia Corte Real', '11 92512-1938', 'Elzasophiaa123@gmail.com', '1956-02-20', @id_endereco2),
    ('255.527.438-30', 'Manoel Ryan Yago Rocha', '11 93543-8447', 'Manoelryanrocha@outlook.com', '1985-07-13', @id_endereco3),
    ('826.387.678-83', 'Emanuel Rafael da Rocha', '11 92670-0066', 'Emanuelrocha444@gmail.com', '1988-08-19', @id_endereco4),
    ('715.395.898-38', 'Lara Caroline Souza', '11 92791-2532', 'Laracarolsouzaa@gmail.com', '1999-01-11', @id_endereco5);

-- UPDATE DE ATUALIZAÇÃO DE DADOS DO CLIENTE UTILIZANDO O ID_ENDERECO

UPDATE Clientes
SET telefone = '11 92512-1939'
WHERE id_endereco_cliente = @id_endereco2;

-- SELECT PARA VISUALIZAR OS DADOS DOS CLIENTES

SELECT * FROM Clientes;

-- DESCREVE A ESTRUTURA DA TABELA CLIENTES

DESCRIBE Clientes;

-- CRIA UM INDICE PARA FACILITAR AS CONSULTAS DE CLIENTES

CREATE INDEX idx_clientes_cpf ON Clientes(cpf);

-- VISUALIZAÇÃO DO INDEX

SHOW INDEX FROM Clientes;

-- SELECT PARA VISUALIZAR O CLIENTE COM NOME QUE INICIA COM "E"

SELECT cpf
FROM Clientes
WHERE nome LIKE 'E%';

-- CRIAÇÃO DA VIEW DO ENDEREÇO E CLIENTES PEGANDO INFORMAÇÃO DAS DUAS TABELAS

CREATE VIEW v_clientes_endereco AS
SELECT c.cpf, c.nome AS cliente, c. telefone, c.email, e.logradouro, e.cep, e.numero, e.cidade, e.uf
FROM     Clientes c
JOIN     Enderecos e ON c.id_endereco_cliente = e.id_enderecos
ORDER BY c.nome;

-- SELECT PARA VISUALIZAR A VIEW CLIENTE E ENDEREÇO JUNTAS

SELECT * FROM v_clientes_endereco;


-- CRIAÇÃO DA TABELA 'CARGOS' 
 
CREATE TABLE Cargos(
    id_cargo INT PRIMARY KEY NOT NULL,
    funcoes  VARCHAR(30) NOT NULL
);

-- DADOS DE CARGOS
 
INSERT INTO Cargos(id_cargo, funcoes)
VALUES 
	(1, 'Diretor'),
	(2, 'Gerente'),
	(3, 'Supervisor'),
	(4, 'Suporte TI'),
	(5, 'Assistente Geral'),
	(6, 'Atendente');

-- UPDATE DE ATUALIZAÇÃO NA TABELA CARGOS

UPDATE Cargos
SET funcoes = 'Gerência'
WHERE id_cargo = 2;

-- SELECT PARA VISUALIZAR A TABELA CARGOS

SELECT * FROM Cargos;

-- DESCREVE A ESTRUTURA DA TABELA CARGOS

DESCRIBE Cargos;

-- CRIAÇÃO DA TABELA FUNCIONARIOS
 
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

-- DADOS DE FUNCIONARIOS

INSERT INTO Funcionarios (cpf, nome, telefone, login, senha, data_contratacao, id_cargo)
VALUES 
	('220.959.228-32', 'Raimundo Filipe Lucas Almada', '11 95510-6125', 'Rai4763!', '47861@', '2023-07-10', 03),
	('765.709.178-97', 'Ryan Igor Thiago Silva', '11 99818-4192', 'Ryan00797@', '4709Ryan@', '2023-06-15', 02),
	('589.075.478-58', 'Aline Milena das Neves', '11 99631-3393', 'Aline1106@', '07976Aline!', '2023-01-20', 01),
	('148.091.898-99', 'Leonardo Ryan Figueiredo', '11 96482-6969', 'Leo1212@', '07797@', '2023-04-05', 05),
	('259.620.088-04', 'Davi Lucca Aparício', '11 98663-3326', 'Davi0079lucca@', '70970@', '2023-03-10', 06),
    ('648.559.478-73', 'Yan Baumgarten Costa', '11 94745-4113', 'YanTI001@', 'Yan716479@!', '2023-01-05', 04);

-- UPDATE DE ATUALIZAÇÃO DA TABELA FUNCIONARIOS

UPDATE Funcionarios
SET senha = '80494@'
WHERE cpf = '220.959.228-32';

-- SELECT PARA VISUALIZAR OS DADOS DOS FUNCIONARIOS

SELECT f.cpf, f.nome, f.telefone, f.login, f.senha, f.data_contratacao, c.funcoes AS cargos
FROM FUNCIONARIOS f
JOIN cargos c ON f.id_cargo = c.id_cargo;
    
-- VIEW PARA VISUALIZAÇÃO DE CARGOS E FUNCIONARIOS
    
CREATE VIEW v_cargo_funcionario AS
SELECT f.cpf, nome AS funcionário, telefone, data_contratacao AS 'Inicio de Contrato', c.funcoes AS cargo
FROM     Funcionarios f
JOIN     Cargos c ON f.id_cargo = c.id_cargo
ORDER BY f.data_contratacao;

-- SELECT PARA 'CARGOS' E 'FUNCIONÁRIOS'

SELECT * FROM v_cargo_funcionario;
        
-- CRIAÇÃO DA TABELA 'SETORES'
 
CREATE TABLE Setores (
    id_setor INT(10) AUTO_INCREMENT PRIMARY KEY,
    setor    VARCHAR(40)
);

-- DADOS DOS 'SETORES'

INSERT INTO Setores (setor)
VALUES 
	('Fornecedor de Filmes'),
	('Fornecedor Jogos'),
	('Fornecedor de Arcade');

-- UPDATE DE ATUALIZAÇÃO DA TABELA 'SETORES'

UPDATE Setores
SET setor = 'Fornecedor de jogos'
WHERE id_setor = '3';

-- SELECT DE VISUALIZAÇÃO DA TABELA 'SETORES'
    
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

-- DADOS DOS 'FORNECEDOR'

INSERT INTO Fornecedor(cnpj, nome, telefone, email, id_endereco_fornecedor, responsavel_setor)
VALUES 
	('37.460.882/0001-88', 'Indie na Tela', '11 99785-4356', 'Indienatela@indiefilmes.com', @id_enderecof01, 01),
	('02.623.120/0001-70', 'LudiCube', '11 98153-1563', 'LudiCube@Cubeindie.com', @id_enderecof02, 02),
	('00.575.978/0001-81', 'FichasNEST', '14 31539-0606', 'Fichasnest@nestfichas.com', @id_enderecof03, 03),
	('18.956.203/0001-11', 'JoyQuest', '11 99450-0302', 'Joyquest@questjoy.com', @id_enderecof04 , 02),
	('71.690.325/0001-91', 'Brasil Indie', '11 98723-0323', 'Brasilindie@filmesbrindie.com', @id_enderecof05, 01);

-- UPDATE DE ATUALIZAÇÃO PARA TABELA 'FORNECEDOR'

UPDATE Fornecedor
SET email = 'Indiesnatela@indiefilmes.com'
WHERE cnpj = '37.460.882/0001-88';

-- SELECT PARA VISUALIZAR OS DADOS DO 'FORNECEDOR'

SELECT f.cnpj, f.nome, f.telefone, f.email, f.id_endereco_fornecedor AS Endereço, s.setor
FROM Fornecedor f
JOIN Setores s ON f.responsavel_setor = s.id_setor;

-- VIEW RELACIONAL DA TABELA 'SETOR' E 'FORNECEDOR'

CREATE VIEW v_fornecedor_setor AS
SELECT    f.cnpj, f.nome AS fornecedor, f.telefone, f.email, s.setor
FROM      Fornecedor f
JOIN      Setores s ON f.responsavel_setor = s.id_setor
ORDER BY  s.setor, f.nome;     

-- SELECT PARA VISUALIZAR A VIEW 'SETOR' E 'FORNECEDOR'

SELECT * FROM v_fornecedor_setor;

-- CRIAÇÃO DA TABELA 'MAQUINAS' 
 
CREATE TABLE Maquinas(
    id_arcade INT PRIMARY KEY,
    nome      VARCHAR(30)
);

-- DADOS DAS 'MAQUINAS'

INSERT INTO Maquinas(id_arcade, nome)
VALUES 
	(1,'Pac-Man'),
	(2,'Donkey Kong'),
	(3,'Space Invaders'),
	(4,'Street Fighter'),
	(5,'Galaga');

-- UPDATE DE ATUALIZAÇÃO NA TABELA 'MAQUINAS'
    
    UPDATE Maquinas
SET nome = 'Street Fighter II'
WHERE id_arcade = 4;

-- SELECT DE VISUALIZAÇÃO DA TABELA 'MAQUINA'

SELECT * FROM Maquinas;

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

-- UPDATE DE ATUALIZAÇÃO PARA A TABELA 'MIDIAS'       
       
UPDATE Midias
SET quantidade_total = 20, 
    valor_total_do_estoque = 12.79 * 20
WHERE id_midia = 7;

-- UPDATE DE EXCLUSÃO LÓGICA PARA TABELA 'MIDIAS'

UPDATE Midias
SET status_ = 'ON'
WHERE id_midia = 7;

-- VISUALIZAR DADOS DA TABELA 'MIDIAS'

SELECT id_midia, nome, CONCAT('R$ ', FORMAT(valor_unitario, 2, 'de_DE')) AS valor_unitario, quantidade_total, CONCAT('R$ ', FORMAT(valor_total_do_estoque, 2, 'de_DE')) AS Preço, tipo, status_, cnpj_fornecedor
FROM Midias;

-- CRIAÇÃO DA TABELA 'FICHAS'
 
CREATE TABLE Fichas(
    id_fichas   INT PRIMARY KEY, 
    quantidade  INT,
    valor_total DECIMAL(6, 2)
);

-- INSERÇÃO DE DADOS DA TABELA 'FICHAS'

INSERT INTO Fichas(id_fichas, quantidade, valor_total)
VALUES 
	(1, 500, 5 * 500),
	(2, 100, 5 * 100),
	(3, 250, 5 * 250),
	(4, 400, 5 * 400),
	(5, 100, 5 * 100);

-- UPDATE DE ATUALIZAÇÃO PARA TABELA 'FICHAS'

UPDATE Fichas
SET quantidade = 800
WHERE id_fichas = 5;

-- SELECT DE VISUALIZAÇÃO DA TABELA 'FICHAS'

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

-- TRANSACTION

START TRANSACTION;

-- INSERT DA TABELA 'PEDIDO'

INSERT INTO Pedido(quantidade_pedida, valor_total, data_retirada, data_prevista_devolucao, data_efetiva_devolucao, id_midia)
VALUES 
    (2, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 1), '2024-11-01', '2024-11-01' + INTERVAL 30 DAY, '2024-11-10', 1),
    (3, 3 * (SELECT valor_unitario FROM Midias WHERE id_midia = 6), '2024-10-25', '2024-10-25' + INTERVAL 30 DAY, '2024-11-06', 6),
    (1, 1 * (SELECT valor_unitario FROM Midias WHERE id_midia = 3), '2024-11-02', '2024-11-02' + INTERVAL 30 DAY, '2024-11-17', 3),
    (2, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 9), '2024-10-31', '2024-10-31' + INTERVAL 30 DAY, '2024-11-07', 9),
    (1, 1 * (SELECT valor_unitario FROM Midias WHERE id_midia = 4), '2024-11-10', '2024-11-10' + INTERVAL 30 DAY, '2024-11-24', 4),
    (2, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 2), '2024-10-15', '2024-10-15' + INTERVAL 30 DAY, '2024-11-05', 2),
    (1, 1 * (SELECT valor_unitario FROM Midias WHERE id_midia = 7), '2024-10-10', '2024-10-10' + INTERVAL 30 DAY, NULL, 7),
    (2, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 8), '2024-09-25', '2024-09-25' + INTERVAL 30 DAY, '2024-10-10', 8);

-- BAIXA DO PEDIDO COM MULTA COM DEVOLUÇÃO APÓS DO PRAZO COM UPDATE DE ATUALIZAÇÃO

UPDATE Pedido
SET 
    valor_total = valor_total + 
    (CASE 
        WHEN data_efetiva_devolucao > data_prevista_devolucao THEN 
            DATEDIFF(data_efetiva_devolucao, data_prevista_devolucao) * 0.08 * valor_total
        ELSE 
            0 
    END)
WHERE data_efetiva_devolucao IS NOT NULL 
    AND data_efetiva_devolucao > data_prevista_devolucao;

COMMIT;

UPDATE Pedido
SET data_efetiva_devolucao = '2024-11-11'
WHERE id_midia = 1;

-- SELECT PARA VISUALIZAR MULTA

SELECT
    p.id_pedido, 
    p.quantidade_pedida, 
    p.valor_total, 
    p.data_retirada, 
    p.data_prevista_devolucao, 
    DATEDIFF(CURDATE(), p.data_prevista_devolucao) AS dias_de_atraso,
    CONCAT('R$', FORMAT(DATEDIFF(CURDATE(), p.data_prevista_devolucao) * 0.08 * p.valor_total, 2)) AS multa
FROM 
    Pedido p
WHERE 
    p.data_efetiva_devolucao IS NULL 
    AND p.data_prevista_devolucao < CURDATE()
ORDER BY 
    p.data_prevista_devolucao;

-- SELECT DA TABELA 'PEDIDO'

SELECT* FROM Pedido;

-- CRIAÇÃO DA VIEW PARA TABELA 'PEDIDO' E 'MIDIAS'

CREATE VIEW v_pedido_midias AS
SELECT 
    p.id_pedido,
    p.quantidade_pedida,
    p.valor_total,
    p.data_retirada,
    p.data_prevista_devolucao,
    m.nome AS midia
FROM Pedido p
JOIN Midias m ON p.id_midia = m.id_midia
ORDER BY id_pedido;

-- VISUALIZAR A VIEW DA TABELA 'PEDIDO' E 'MIDIAS'

SELECT * FROM v_pedido_midias;

-- CRIAÇÃO DO INDEX DA TABELA 'PEDIDO' PARA 'DATA_RETIRADA' E 'DATA_EFETIVA_DEVOLUCAO'

CREATE INDEX idx_data_saida_data_retorno ON Pedido(data_retirada, data_efetiva_devolucao);

-- SELECT PARA VISUALIZAR 'DATA_RETIRADA' E 'DATA_EFETIVA_DEVOLUÇÃO'

SELECT data_retirada, data_efetiva_devolucao
FROM Pedido
WHERE id_midia IN ('1', '3' ,'4');

-- DESCREVER TABELA 'PEDIDO'

DESCRIBE Pedido;

-- CRIAÇÃO DA TABELA 'PRODUTO'

CREATE TABLE Produto(
    id_produto INT PRIMARY KEY,
    id_fichas INT,
    quantidade_fichas INT,
    id_pedido INT,
    valor_total DECIMAL(6, 2),
    CONSTRAINT fk_id_fichas FOREIGN KEY(id_fichas) REFERENCES Fichas(id_fichas),
    CONSTRAINT fk_id_pedido FOREIGN KEY(id_pedido) REFERENCES Pedido(id_pedido)
);

-- INSERÇÃO DE DADOS DA TABELA 'PRODUTO' 

INSERT INTO Produto(id_produto, valor_total, id_fichas, quantidade_fichas, id_pedido)
VALUES 
    (1, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 1), NULL, NULL, 1), 
    (2, 3 * (SELECT valor_unitario FROM Midias WHERE id_midia = 6), 1, 8, 2), 
    (3, 1 * (SELECT valor_unitario FROM Midias WHERE id_midia = 3), 2, 10, 3), 
    (4, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 9), 5, 3, 4), 
    (5, 1 * (SELECT valor_unitario FROM Midias WHERE id_midia = 4), 3, 1, 5), 
    (6, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 2), NULL, NULL, 6), 
    (7, 1 * (SELECT valor_unitario FROM Midias WHERE id_midia = 7), 4, 1, 7), 
    (8, 2 * (SELECT valor_unitario FROM Midias WHERE id_midia = 8), 3, 7, 8); 

-- UPDATE DE ATUALIZAÇÃO DA TABELA 'PRODUTO'
    
    UPDATE Produto
SET quantidade_fichas = 9
WHERE id_pedido = 3;

-- SELECT DE VISUALIZAÇÃO DA TABELA 'PRODUTO'

SELECT * FROM PRODUTO;

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
    (05, 'Clube Cinearcade'),
    (06, 'Débito');

-- UPDATE DE ATUALIZAÇÃO PARA TABELA 'METODO_DE_PAGAMENTO'
    
UPDATE Metodo_De_Pagamento
SET forma_de_pagamento = 'Cartão de Débito'
WHERE id_pagamento = 06;

-- SELECT PARA VISUALIZAR TABELA 'METODO_DE_PAGAMENTO'
    
SELECT * FROM Metodo_De_Pagamento;

-- DESCREVER 'METODO_DE_PAGAMENTO'

DESCRIBE Metodo_De_Pagamento;
 
-- CRIAÇÃO DA TABELA 'COMANDA'
 
CREATE TABLE Comanda(
    id_comanda          INT PRIMARY KEY AUTO_INCREMENT,
    data                DATE,
    horario             TIME,
    id_pagamento        INT NOT NULL,
    cpf_cliente         VARCHAR(14) NOT NULL,
    cpf_funcionarios    VARCHAR(14) NOT NULL,
    valor_total_produto DECIMAL(6, 2),
    CONSTRAINT fk_id_pagamento FOREIGN KEY (id_pagamento) REFERENCES Metodo_De_Pagamento(id_pagamento),
    CONSTRAINT fk_cpf_cliente FOREIGN KEY (cpf_cliente) REFERENCES Clientes(cpf),
    CONSTRAINT fk_cpf_funcionarios FOREIGN KEY (cpf_funcionarios) REFERENCES Funcionarios(cpf)
);

-- INSERÇÃO DE DADOS NA TABELA 'COMANDA'

INSERT INTO Comanda (data, horario, id_pagamento, cpf_cliente, cpf_funcionarios)
VALUES 
    ('2024-11-16', '15:30:00', 1, '104.092.918-46', '220.959.228-32'),
    ('2024-11-17', '16:00:00', 2, '099.784.428-04', '765.709.178-97'),
    ('2024-11-18', '17:45:00', 3, '255.527.438-30', '589.075.478-58'),
    ('2024-11-19', '18:15:00', 4, '826.387.678-83', '148.091.898-99'),
    ('2024-11-20', '14:30:00', 5, '715.395.898-38', '259.620.088-04');

-- UPDATE DE ATUALIZAÇÃO NA TABELA 'COMANDA'
   
UPDATE Comanda
SET horario = '15:29:45'
WHERE id_pagamento = 1;

-- SELECT DE VISUALIZAÇÃO DA TABELA 'COMANDA' E 'FUNCIONARIOS'

SELECT 
    c.id_comanda, c.data, c.horario, c.id_pagamento, c.cpf_cliente, f.nome AS nome_funcionario
FROM Comanda c
JOIN Funcionarios f ON c.cpf_funcionarios = f.cpf;

-- VIEW PARA 'COMANDA', 'CLIENTES, 'METODO_DE_PAGAMENTO' E 'FUNCIONARIOS'

CREATE VIEW v_comanda_pagamento AS
SELECT co.id_comanda, co.data, co.horario, mp.forma_de_pagamento, c.nome AS cliente, f.nome AS funcionario
FROM Comanda co
JOIN Metodo_De_Pagamento mp ON co.id_pagamento = mp.id_pagamento
JOIN Clientes c ON co.cpf_cliente = c.cpf
JOIN Funcionarios f ON co.cpf_funcionarios = f.cpf
ORDER BY co.data DESC;

-- SELECT PARA VISUALIZAR 'COMANDA' E 'PAGAMENTO'

SELECT * FROM v_comandas_pagamento;

-- DESCREVER A ESTRUTURA DA TABELA 'COMANDA'

DESCRIBE Comanda;