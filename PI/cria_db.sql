DROP DATABASE IF EXISTS figurino;
CREATE DATABASE figurino;
USE figurino;

CREATE TABLE Personagem (
    id_personagem INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_personagem)
);

CREATE TABLE Cena (
    id_cena INT NOT NULL,
    minuto_inicio INT NOT NULL,
    minuto_final INT NOT NULL,
    PRIMARY KEY (id_cena)
);

CREATE TABLE Roupa (
    id_roupa INT NOT NULL,
    descricao VARCHAR(80) NOT NULL,
    PRIMARY KEY (id_roupa)
);

CREATE TABLE Figurino (
    id_roupa INT NOT NULL,
    id_cena INT NOT NULL,
    id_personagem INT NOT NULL,
    descricao VARCHAR(45) NULL,
    PRIMARY KEY (id_roupa , id_cena , id_personagem),
    CONSTRAINT fk_Figurino_Roupa FOREIGN KEY (id_roupa)
        REFERENCES Roupa (id_roupa),
    CONSTRAINT fk_Figurino_Cena FOREIGN KEY (id_cena)
        REFERENCES Cena (id_cena),
    CONSTRAINT fk_Figurino_Personagem FOREIGN KEY (id_personagem)
        REFERENCES Personagem (id_personagem)
);

INSERT INTO Cena (id_cena, minuto_inicio, minuto_final) VALUES

(1, 0, 5),
(2, 5, 10);

INSERT INTO Roupa (id_roupa, descricao) VALUES

(123, "vestido rosa"),

(456, "sapato branco"),

(789, "calca preta"),

(111, "camisa branca"),

(222, "sapato preto");

INSERT INTO Personagem (id_personagem, nome) VALUES

(20, "rapunzel"),

(21, "jose bezerra");

INSERT INTO Figurino (id_roupa, id_cena, id_personagem, descricao) VALUES

(123, 1, 20, "roupa passada"),

(456, 1, 20, "firme"),

(789, 1, 20, "roupa passada"),

(123, 2, 20, "roupa passada"),

(456, 2, 20, "firme"),

(789, 2, 20, "roupa passada"),

(111, 2, 20, "roupa passada"),

(789, 1, 21, "roupa passada"),

(222, 2, 21, "firme"),

(111, 2, 21, "roupa passada");
