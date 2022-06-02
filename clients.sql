-- Authentification/Connexion
>mysql -u root -- Si l'utilisateur n'a pas de mot de passe
>mysql -u root -p -- Si l'utilisateur possède un mot de passe

-- 1. Lister toutes les bases de données

>mysql SHOW DATABASES;

-- 2. Création de la base de données

CREATE DATABASE poe_ventes;

-- 4. Utiliser/sélectionner la base de données

USE poe_ventes;

-- 5. Lister les tables de la base de données

SHOW TABLES;

-- 6. Création de la table clients

-- INTEGER : type "entier"
-- NOT NULL : cette colonne doit toujours contenir une information
-- AUTO_INCREMENT : fournir une valeur en incrémentant automatiquement les clés
-- PRIMARY KEY : marquer la colonne comme étant la clé primaire
-- VARCHAR : type "texte" (possible limitation du nombre de caractère)
-- UNIQUE : appliquer une contrainte d'unicité

CREATE TABLE clients(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
email VARCHAR(70) UNIQUE,
telephone VARCHAR(20) NOT NULL);

-- 7. Visualisation de la table clients

DESC clients

-- 8. Ajout d'une colonne dans la table clients

ALTER TABLE clients ADD COLUMN postnom VARCHAR(50);
-- Si ajout après une colonne en particulier
ALTER TABLE clients ADD COLUMN age INTEGER(2) AFTER postnom;

-- 9. Modification d'une colonne dans la table clients

ALTER TABLE clients MODIFY COLUMN email NOT NULL;

-- 10. Insertion de données dans la table clients

INSERT INTO clients(nom, prenom, email, telephone)
values("perez","marion","marion.oceane.perez@gmail.com","0786842676"); 
-- Si ajout multiple
INSERT INTO clients(nom, prenom, email, telephone)
values("dumortier","steven","stevendumortier59@gmail.com","0747474747"),
("raulin","ludovic","lraulin843@gmail.com","0621461941");

-- 11. Lire des données dans la table clients

SELECT * FROM clients
ou
SELECT email FROM clients

-- 12. Modification de données dans la table clients

UPDATE clients SET age=25 WHERE id=1

