CREATE DATABASE Conseil_de_classe;

USE DATABASE Conseil_de_classe;

-- 1. Créer une table pour les avis de passage en classe supérieure

CREATE TABLE Avis_classe_sup(
    id INTEGER(3) NOT NULL PRIMARY KEY,
    Nom VARCHAR(20) NOT NULL,
    Prenom VARCHAR(20) NOT NULL,
    Mathematiques VARCHAR(15) NOT NULL,
    Francais VARCHAR(15) NOT NULL,
    Sport VARCHAR(15) NOT NULL,
    Histoire_Geographie VARCHAR(15) NOT NULL,
    SVT VARCHAR(15) NOT NULL,
    Physique_Chimie VARCHAR(15) NOT NULL);

DESC Avis_classe_sup;

INSERT INTO Avis_classe_sup(id,Nom,Prenom,Mathematiques,Francais,Sport,Histoire_Geographie,SVT,Physique_Chimie) VALUES
(132,"Pichon","Olivier","Favorable","Defavorable","Favorable","Defavorable","Favorable","Favorable"),
(28,"Briand","Guillaume","Favorable","Favorable","Favorable","Favorable","Favorable","Favorable"),
(66,"Guibert","Suzanne","Favorable","Favorable","Favorable","Favorable","Favorable","Favorable"),
(65,"Guibert","Pierre","Defavorable","Favorable","Favorable","Favorable","Favorable","Defavorable"),
(23,"Boucher","Daniel","Favorable","Favorable","Favorable","Favorable","Favorable","Favorable"),
(74,"Hernandez","Gregoire","Favorable","Favorable","Favorable","Favorable","Defavorable","Favorable"),
(49,"Dupont","Virginie","Favorable","Favorable","Favorable","Favorable","Favorable","Defavorable"),
(17,"Blin","Luc","Favorable","Favorable","Favorable","Defavorable","Favorable","Favorable"),
(180,"Toussaint","Margaux","Favorable","Favorable","Favorable","Favorable","Favorable","Favorable"),
(101,"Maillet","Camille","Favorable","Favorable","Favorable","Defavorable","Favorable","Favorable");

SELECT * FROM Avis_classe_sup;

-- 2. Créer une table pour les notes de mathematiques

CREATE TABLE Notes_Mathematiques(
    id INTEGER(3) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    m_id INTEGER(3),
    m_ds1 INTEGER(2) NOT NULL,
    m_ds2 INTEGER(2) NOT NULL,
    m_dm1 INTEGER(2) NOT NULL,
    m_ds3 INTEGER(2) NOT NULL,
    m_dm2 INTEGER(2) NOT NULL, 
    FOREIGN KEY(m_id) REFERENCES Avis_classe_sup(id) ON DELETE SET NULL);

DESC Notes_Mathematiques;

INSERT INTO Notes_Mathematiques(m_id,m_ds1,m_ds2,m_dm1,m_ds3,m_dm2) VALUES
(132,12,11,14,11,16),
(28,14,13,17,12,16),
(66,9,10,12,8,12),
(65,9,6,11,7,11),
(23,15,14,17,16,18),
(74,13,10,14,9,13),
(49,11,13,13,14,15),
(17,10,11,11,10,14),
(180,14,13,16,13,17),
(101,16,16,15,15,19);

SELECT * FROM Notes_Mathematiques;

-- 3. Créer une table pour les notes de français

CREATE TABLE Notes_Francais(
    id INTEGER(3) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    f_id INTEGER(3),
    f_ds1 INTEGER(2) NOT NULL,
    f_ds2 INTEGER(2) NOT NULL,
    f_expose INTEGER(2) NOT NULL,
    f_ds3 INTEGER(2) NOT NULL
    FOREIGN KEY(f_id) REFERENCES Avis_classe_sup(id) ON DELETE SET NULL);

DESC Notes_Francais;

INSERT INTO Notes_Francais(f_id,f_ds1,f_ds2,f_expose,f_ds3) VALUES
(132,6,9,15,10),
(28,12,12,16,15),
(66,9,10,14,11),
(65,15,14,17,12),
(23,13,13,14,9),
(74,14,12,13,14),
(49,16,17,18,15),
(17,10,12,14,13),
(180,11,15,15,16),
(101,12,11,12,10);

SELECT * FROM Notes_Francais;
