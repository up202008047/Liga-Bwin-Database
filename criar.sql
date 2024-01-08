PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

.mode columns
.headers on

DROP TABLE IF EXISTS JogoBilhete;
DROP TABLE IF EXISTS ClaqueAdepto;
DROP TABLE IF EXISTS JogoArbitro;
DROP TABLE IF EXISTS AdeptoCartao;
DROP TABLE IF EXISTS CartaoSocio;
DROP TABLE IF EXISTS Resultado;
DROP TABLE IF EXISTS Treinador;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Claque;
DROP TABLE IF EXISTS Bilhete;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Estadio;
DROP TABLE IF EXISTS Adepto;
DROP TABLE IF EXISTS Arbitro;

CREATE TABLE Estadio(
    nome TEXT PRIMARY KEY,
    data_ DATA,
    capacidade INTEGER NOT NULL,
    clube_id TEXT,
    FOREIGN KEY(clube_id) REFERENCES Clube(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(capacidade > 4000)
);

CREATE TABLE Clube(
    nome TEXT PRIMARY KEY,
    data_de_criacao DATA NOT NULL,
    fundador TEXT NOT NULL,
    cidade TEXT NOT NULL,
    rating INTEGER NOT NULL,
    CHECK(1 <= rating AND rating <= 5)
);

CREATE TABLE Jogo(
    id_jogo INTEGER PRIMARY KEY,
    duracao INTEGER NOT NULL,
    data_ DATA NOT NULL,
    nome_estadio TEXT,
    FOREIGN KEY(nome_estadio) REFERENCES Estadio(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(duracao > 89)
);


CREATE TABLE Claque(
    nome TEXT PRIMARY KEY,
    data_de_criacao DATA NOT NULL,
    numero_de_adeptos INTEGER NOT NULL,
    nome_clube TEXT,
    FOREIGN KEY(nome_clube) REFERENCES Clube(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(numero_de_adeptos>0)
);

CREATE TABLE Adepto(
    nif INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    nacionalidade TEXT NOT NULL,
    data_de_nascimento DATA NOT NULL,
    telemovel INTEGER NOT NULL,
    email TEXT NOT NULL,
    CHECK(900000000 <= telemovel AND telemovel <= 999999999)
    CHECK(100000000 <= nif AND nif <= 999999999)
);

CREATE TABLE Bilhete(
    id_bilhete INTEGER PRIMARY KEY,
    lugar INTEGER UNIQUE  NOT NULL,
    metodo_pagamento TEXT  NOT NULL,
    preco INTEGER NOT NULL,
    desconto INTEGER  NOT NULL,
    id_adepto INTEGER  NOT NULL,
    id_jogo INTEGER  NOT NULL,
    id_cartao INTEGER  NOT NULL,
    UNIQUE (lugar),
    FOREIGN KEY(id_adepto) REFERENCES Adepto(nif) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_jogo) REFERENCES Jogo(id_jogo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_cartao) REFERENCES CartaoSocio(numero_socio) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(metodo_pagamento = "multibanco" OR metodo_pagamento = "dinheiro"),
    CHECK(preco>0)
);

CREATE TABLE Arbitro(
    nif INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    nacionalidade TEXT NOT NULL,
    data_de_nascimento DATA,
    numero_de_jogos INTEGER NOT NULL,
    telemovel INTEGER NOT NULL,
    CHECK(900000000 <= telemovel AND telemovel <= 999999999),
    CHECK(100000000 <= nif AND nif <= 999999999),
    CHECK(numero_de_jogos>0)
);

CREATE TABLE Treinador(
    nif INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    nacionalidade TEXT NOT NULL,
    data_de_nascimento DATA,
    numero_de_jogos_realizados INTEGER NOT NULL,
    telemovel INTEGER,
    posicao TEXT NOT NULL,
    numero_de_trofeus_conquistados INTEGER NOT NULL,
    data_comeco_carreira DATA NOT NULL,
    id_clube TEXT NOT NULL,
    FOREIGN KEY(id_clube) REFERENCES Clube(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(900000000 <= telemovel AND telemovel <= 999999999),
    CHECK(posicao = "principal" OR posicao = "adjunto"),
    CHECK(100000000 <= nif AND nif <= 999999999)
);

CREATE TABLE Jogador(
    nif INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    nacionalidade TEXT NOT NULL,
    data_de_nascimento DATA,
    numero_de_jogos INTEGER NOT NULL,
    telemovel INTEGER,
    golos INTEGER NOT NULL,
    assistencias INTEGER NOT NULL,
    posicao TEXT NOT NULL,
    numero_de_lesoes INTEGER NOT NULL,
    valor_mercado INTEGER NOT NULL,
    id_clube TEXT,
    FOREIGN KEY(id_clube) REFERENCES Clube(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(golos >= 0),
    CHECK(numero_de_lesoes >= 0),
    CHECK(assistencias >= 0),
    CHECK(900000000 <= telemovel AND telemovel <= 999999999),
    --CHECK(100000000 <= nif AND nif <= 999999999),
    CHECK(5000000 <valor_mercado)
);

CREATE TABLE CartaoSocio(
    numero_socio INTEGER PRIMARY KEY,
    id_clube TEXT,
    id_adepto INTEGER,
    FOREIGN KEY(id_clube) REFERENCES Clube(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_adepto) REFERENCES Adepto(nif) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(100000000 <= numero_socio AND numero_socio <= 999999999)
);

CREATE TABLE Resultado(
    resultado TEXT NOT NULL,
    id_clube TEXT,
    id_jogo INTEGER,
    FOREIGN KEY(id_clube) REFERENCES Clube(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_jogo) REFERENCES Jogo(id_jogo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ClaqueAdepto(
    id_claque TEXT,
    id_adepto INTEGER,
    FOREIGN KEY(id_claque) REFERENCES Claque(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_adepto) REFERENCES Adepto(nif) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE JogoArbitro(
    id_jogo INTEGER,
    id_arbitro INTEGER,
    FOREIGN KEY(id_jogo) REFERENCES Jogo(id_jogo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_arbitro) REFERENCES Arbitro(nif) ON DELETE CASCADE ON UPDATE CASCADE
);



COMMIT TRANSACTION;
PRAGMA foreign_keys = on;