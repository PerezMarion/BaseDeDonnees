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

-- 4. Afficher le nom et prénom de tous les élèves ayant eu un avis défavorable en mathématiques

SELECT Avis_classe_sup.Nom AS Nom, Avis_classe_sup.Prenom AS Prenom 
FROM Avis_classe_sup JOIN Notes_Mathematiques ON Avis_classe_sup.id=Notes_Mathematiques.m_id
WHERE Avis_classe_sup.Mathematiques="Defavorable";

-- 5. Afficher le nom et prénom de tous les élèves n'ayant eu que des notes supérieures à 10 en devoir surveillé de francais 

SELECT Avis_classe_sup.Nom AS Nom, Avis_classe_sup.Prenom AS Prenom
FROM Avis_classe_sup JOIN Notes_Francais ON Avis_classe_sup.id=Notes_Francais.f_id
WHERE Notes_Francais.f_ds1>10 AND Notes_Francais.f_ds2>10 AND Notes_Francais.f_ds3>10;

-- 6. Créer une vue avec la moyenne de classe obtenue pour chaque devoir surveillé de mathématiques

CREATE VIEW v_moyennes_mathematiques AS SELECT AVG(m_ds1) AS moyenne_m_ds1, AVG(m_ds2) AS moyenne_m_ds2, AVG(m_ds3) AS moyenne_m_ds3 
FROM Notes_Mathematiques;

SELECT * FROM v_moyennes_mathematiques

-- 7. Afficher le nom, le prénom et la note obtenue par l'élève ayant la meilleure note à l'exposé de francais

SELECT Avis_classe_sup.Nom AS Nom, Avis_classe_sup.Prenom AS Prenom, MAX(Notes_Francais.f_expose) AS Note_maximale
FROM Avis_classe_sup JOIN Notes_Francais ON Avis_classe_sup.id=Notes_Francais.f_id;

-- 8. Afficher le nombre d'élèves ayant eu 15 ou plus aux deux devoirs maisons de mathematiques

SELECT COUNT(*) FROM Notes_Mathematiques WHERE m_dm1>=15 AND m_dm2>=15;

-- 9. Classer par ordre alphabétique le nom des élèves

SELECT id, Nom, Prenom FROM Avis_classe_sup ORDER By Nom ASC;

-- 10. Calculer la moyenne de français de Camille Maillet

SELECT ((f_ds1+f_ds2+f_ds3+f_expose)/4) AS moyenne_francais FROM Notes_Francais WHERE f_id=101;