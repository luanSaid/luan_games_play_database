/*DROP DATABASE luan_games_play;*/
CREATE DATABASE luan_games_play;
USE luan_games_play;

--  Entidade local
CREATE TABLE local (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    PRIMARY KEY (codigo)
);

-- Entidade Torneio
CREATE TABLE torneio (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    modalidade VARCHAR(20),
    n_vaga INT,
    coin INT,
    codigo_local INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_local)
        REFERENCES local (codigo)
);

-- Entidade patrocinador
CREATE TABLE patrocinador (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    verba FLOAT,
    codigo_torneio INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_torneio)
        REFERENCES torneio (codigo)
);

-- Entidade cliente
CREATE TABLE cliente (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR(50),
    idade INT,
    sexo VARCHAR(100),
    login VARCHAR(20) UNIQUE,
    senha VARCHAR(20),
    n_vitoria INT,
    codigo_torneio INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_torneio)
        REFERENCES torneio (codigo)
);
-- Entidade app
CREATE TABLE app (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) UNIQUE,
    descricao VARCHAR(100),
    tamanho VARCHAR(15),
    PRIMARY KEY (codigo)
);
-- Entidade jogo
CREATE TABLE jogo (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) UNIQUE,
    descricao VARCHAR(100),
    tamanho VARCHAR(15),
    PRIMARY KEY (codigo)
);
-- Entidade desenvolvedor

CREATE TABLE desenvolvedor (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    empresa VARCHAR(50),
    PRIMARY KEY (codigo)
);
-- Entidade plataforma
CREATE TABLE plataforma (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    versao VARCHAR(100),
    PRIMARY KEY (codigo)
);
-- Intermediaria Plataforma e App
CREATE TABLE plataApp (
    codigo INT NOT NULL AUTO_INCREMENT,
    codigo_app INT,
    codigo_plata INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_app)
        REFERENCES app (codigo),
    FOREIGN KEY (codigo_plata)
        REFERENCES plataforma (codigo)
);
-- Intermediaria Plataforma e jogo
CREATE TABLE plataJogo (
    codigo INT NOT NULL AUTO_INCREMENT,
    codigo_jogo INT,
    codigo_plata INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_jogo)
        REFERENCES jogo (codigo),
    FOREIGN KEY (codigo_plata)
        REFERENCES plataforma (codigo)
);
-- Intermediaria cliente e app
CREATE TABLE baixaApp (
    codigo INT NOT NULL AUTO_INCREMENT,
    codigo_cliente INT,
    codigo_app INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_cliente)
        REFERENCES cliente (codigo),
    FOREIGN KEY (codigo_app)
        REFERENCES app (codigo)
);
-- intermediaria cliente e jogo
CREATE TABLE baixaJogo (
    codigo INT NOT NULL AUTO_INCREMENT,
    codigo_cliente INT,
    codigo_jogo INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_cliente)
        REFERENCES cliente (codigo),
    FOREIGN KEY (codigo_jogo)
        REFERENCES jogo (codigo)
);
-- Intermediaria desenvolvedor e app
CREATE TABLE desenvolApp (
    codigo INT NOT NULL AUTO_INCREMENT,
    codigo_desenvol INT,
    codigo_app INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_desenvol)
        REFERENCES desenvolvedor (codigo),
    FOREIGN KEY (codigo_app)
        REFERENCES app (codigo)
);

-- Intermediaria desenvolvedor e jogo
CREATE TABLE desenvolJogo (
    codigo INT NOT NULL AUTO_INCREMENT,
    codigo_desenvol INT,
    codigo_jogo INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_desenvol)
        REFERENCES desenvolvedor (codigo),
    FOREIGN KEY (codigo_jogo)
        REFERENCES jogo (codigo)
);

-- Local
INSERT INTO local (nome) VALUES 
('Arena combate'),
('Gamer shakers'),
('Ambiente virtual Kolombo');

-- Torneio
INSERT INTO torneio (nome, modalidade, n_vaga, coin, codigo_local) VALUES 
('Torneio de RE7', 'Avançado', 25, 100, 1),
('Torneio de LOL', 'Junior', 15, 100, 1),
('Torneio de Mortal Kombat 9', 'Avançado', 5, 100, 1);

-- Cliente
INSERT INTO cliente (nome_cliente, idade, sexo, login, senha, n_vitoria, codigo_torneio) VALUES
('Pivinha', 17, 'masculino', 'pivinha@gamer', 'senha123', 3, 2),
('Thalles', 35, 'masculino', 'thales@campeao', 'senha090', 100, 3),
('Kamya', 20, 'feminino', 'kamy@gamer', 'senha908', 28, 1);

-- App
INSERT INTO app (nome, descricao, tamanho) VALUES
('Facebook', 'Rede social', '4Gb'),
('Editor Deluxe', 'Editor de fotos', '1Gb'),
('Tinder Vip', 'Rede Social', '7Gb');

-- Jogo
INSERT INTO jogo (nome, descricao, tamanho) VALUES
('Plant VS Zombie 4', 'Jogo de estratégia', '6Gb'),
('Resident Evil 7', 'Jogo de suspense', '9Gb'),
('Mortal Kombat 9', 'Jogo de luta', '3Gb');

-- Plataforma
INSERT INTO plataforma (nome, versao) VALUES
('Android', 'Versão 7.0'),
('Mac', 'Versão 10.0'),
('Xbox one', 'Versão 8.0');

-- Desenvolvedor
INSERT INTO desenvolvedor (nome, empresa) VALUES
('Mark Zuckerberg', 'Sucesso LTDA'),
('George Fan', 'EA Games'),
('Dan Forden', 'Capcom');

-- Patrocinador
INSERT INTO patrocinador (nome, verba, codigo_torneio) VALUES
('Sony', 300000, 1),
('Nike', 300000, 2),
('Panasonic', 300000, 3);

-- Plataformas e Apps
INSERT INTO plataApp (codigo_app, codigo_plata) VALUES
(1, 1),
(3, 2),
(2, 1);

-- Plataformas e Jogos
INSERT INTO plataJogo (codigo_jogo, codigo_plata) VALUES
(3, 3),
(1, 1),
(2, 2);

-- Desenvolvedores e Apps
INSERT INTO desenvolApp (codigo_desenvol, codigo_app) VALUES
(1, 1),
(1, 3),
(3, 2);

-- Desenvolvedores e Jogos
INSERT INTO desenvolJogo (codigo_desenvol, codigo_jogo) VALUES
(3, 3),
(2, 1),
(2, 2);

-- Cliente e App
INSERT INTO baixaApp (codigo_cliente, codigo_app) VALUES
(1, 3),
(2, 1),
(3, 2);

-- Cliente e Jogo
INSERT INTO baixaJogo (codigo_cliente, codigo_jogo) VALUES
(1, 1),
(2, 2),
(3, 3);

/*
Consultas específicas para exploração das tabelas (read) 
e simulações de operações (delete, update).*/
select * from cliente;
-- Cliente e Jogo baixado
SELECT 
    c.nome_cliente AS Nome_do_cliente, j.nome AS Jogo_baixado
FROM
    cliente c
        INNER JOIN
    baixaJogo bj ON bj.codigo_cliente = c.codigo
        INNER JOIN
    jogo j ON bj.codigo_jogo = j.codigo;

-- Clientes com mais de 10 vitórias e seu torneio
SELECT 
    c.nome_cliente AS Cliente, t.nome AS Torneio
FROM
    cliente c
        INNER JOIN
    torneio t ON c.codigo_torneio = t.codigo
WHERE
    c.n_vitoria > 10;

-- Clientes com apps e jogos que rodam na plataforma Android
SELECT 
    c.nome_cliente,
    j.nome AS Jogo_baixado,
    a.nome AS App_baixado
FROM
    cliente c
        INNER JOIN
    baixaApp ap ON ap.codigo_cliente = c.codigo
        INNER JOIN
    app a ON ap.codigo_app = a.codigo
        INNER JOIN
    baixaJogo bj ON bj.codigo_cliente = c.codigo
        INNER JOIN
    jogo j ON bj.codigo_jogo = j.codigo
        INNER JOIN
    plataApp pa ON pa.codigo_app = a.codigo
        INNER JOIN
    plataforma p ON pa.codigo_plata = p.codigo
        INNER JOIN
    plataJogo pg ON pg.codigo_jogo = j.codigo
        INNER JOIN
    plataforma tp ON pg.codigo_plata = tp.codigo
WHERE
    tp.nome = 'Android';

-- Soma de vitórias dos clientes por torneio (apenas > 10)
SELECT 
    c.nome_cliente,
    t.nome AS Torneio,
    SUM(c.n_vitoria) AS Quantidade_de_vitorias
FROM
    cliente c
        INNER JOIN
    torneio t ON c.codigo_torneio = t.codigo
GROUP BY c.nome_cliente , t.nome
HAVING Quantidade_de_vitorias > 10;

-- Apps dos clientes do sexo masculino por plataforma
SELECT 
    c.nome_cliente,
    a.nome AS Nome_do_app,
    p.nome AS nome_da_plataforma
FROM
    cliente c
        INNER JOIN
    baixaApp ba ON c.codigo = ba.codigo_cliente
        INNER JOIN
    app a ON a.codigo = ba.codigo_app
        INNER JOIN
    plataApp pa ON pa.codigo_app = a.codigo
        INNER JOIN
    plataforma p ON pa.codigo_plata = p.codigo
WHERE
    c.sexo = 'masculino';

-- Patrocinadores, valores e torneios
SELECT 
    p.nome AS Investidor,
    p.verba AS Investimento,
    t.nome AS Nome_do_Torneio
FROM
    patrocinador p
        INNER JOIN
    torneio t ON t.codigo = p.codigo_torneio
ORDER BY p.nome;

-- Cliente, login e jogo - nome começa com 'K' e mínimo 5 letras no Torneio RE7
SELECT 
    c.nome_cliente AS Nome_do_cliente,
    c.login AS Nome_de_login,
    j.nome AS Jogo_baixado
FROM
    cliente c
        INNER JOIN
    baixaJogo bj ON bj.codigo_cliente = c.codigo
        INNER JOIN
    jogo j ON j.codigo = bj.codigo_jogo
        INNER JOIN
    torneio t ON t.codigo = c.codigo_torneio
WHERE
    t.nome = 'Torneio de RE7'
        AND c.nome_cliente LIKE 'K____'
ORDER BY c.login;

-- Clientes, coins e torneios
SELECT 
    c.nome_cliente,
    t.nome AS Nome_do_Torneio,
    (c.n_vitoria * t.coin) AS Numero_de_coins
FROM
    cliente c
        INNER JOIN
    torneio t ON c.codigo_torneio = t.codigo
ORDER BY c.nome_cliente;

-- Desenvolvedor de apps e clientes que baixaram
SELECT 
    d.nome AS Nome_do_Desenvolvedor,
    a.nome AS App_criado,
    c.login AS Usuario_do_app
FROM
    desenvolvedor d
        INNER JOIN
    desenvolApp da ON da.codigo_desenvol = d.codigo
        INNER JOIN
    app a ON da.codigo_app = a.codigo
        INNER JOIN
    baixaApp ba ON ba.codigo_app = a.codigo
        INNER JOIN
    cliente c ON ba.codigo_cliente = c.codigo
ORDER BY c.nome_cliente;

-- Desenvolvedor de jogos e clientes que baixaram
SELECT 
    d.nome AS Nome_do_Desenvolvedor,
    a.nome AS Jogo_criado,
    c.login AS Usuario_do_jogo
FROM
    desenvolvedor d
        INNER JOIN
    desenvolJogo da ON da.codigo_desenvol = d.codigo
        INNER JOIN
    jogo a ON da.codigo_jogo = a.codigo
        INNER JOIN
    baixaJogo ba ON ba.codigo_jogo = a.codigo
        INNER JOIN
    cliente c ON ba.codigo_cliente = c.codigo
ORDER BY c.nome_cliente;

-- Atualizar senha do Pivinha
UPDATE cliente 
SET 
    senha = '123senha'
WHERE
    nome_cliente = 'Pivinha';

-- Atualizar verba do patrocinador do MK9
UPDATE patrocinador 
SET 
    verba = 1000000
WHERE
    codigo_torneio = (SELECT 
            codigo
        FROM
            torneio
        WHERE
            nome = 'Torneio de Mortal Kombat 9');

-- Remover clientes sem vitórias
DELETE FROM cliente 
WHERE
    n_vitoria = 0;





