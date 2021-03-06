-- 1. Créer une base de données appelée sales

CREATE DATABASE sales;

USE sales;

-- 2. Créer une table appelée telephones avec les colonnes suivantes :
-- name : chaîne de caractères qui représente le modèle du téléphone
-- manufacturer : chaîne de caractères qui représente le fabricant
-- price : un nombre qui représente le prix UHT
-- units_sold : nombre qui représentent la quantité vendue

CREATE TABLE telephones(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    price INTEGER NOT NULL,
    units_sold INTEGER);

-- 3. Insérer les informations

INSERT INTO telephones (name, manufacturer, price, units_sold) VALUES
("N1280","Nokia",199,1925),
("Iphone 4","Apple",399,9436),
("Galaxy S 5","Samsung",299,2359),
("S5620 Monte","Samsung",250,2385),
("N8","Nokia",150,7543),
("Droid","Motorola",150,8395),
("Iphone 13 Pro Max","Apple",1300,12849),
("Galaxy Note 20","Samsung",1100,10353);

-- 4. Ecrire une requête pour liste tous les modèles de téléphones

SELECT name FROM telephones;

-- 5. Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphones dont le prix est supérieur à 200€

SELECT name, manufacturer FROM telephones WHERE price>200;

-- 6. Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphone dont le prix est varie entre 150 et 200€

SELECT name, manufacturer FROM telephones WHERE price>=150 AND price <=200;
ou
SELECT name, manufacturer FROM telephones WHERE price BETWEEN 150 AND 200;

-- 7. Lister tous les téléphones de marque Samsung et Apple

SELECT * FROM telephones WHERE manufacturer='Apple' OR manufacturer='Samsung';
ou
SELECT * FROM telephones WHERE manufacturer IN("Apple","Samsung");

-- 8. Lister tous les téléphones(id, name, manufacturer, price) par ordre croissant/décroissant de prix

SELECT id, name, manufacturer, price FROM telephones ORDER by price ASC;
SELECT id, name, manufacturer, prixe FROM telephones ORDER by price DESC;

-- 9. Lister tous les téléphones par ordre de prix décroissant puis à prix égal par fabriquant par ordre alphabétique

SELECT * FROM telephones ORDER BY price DESC, manufacturer ASC;

-- 10. Obtenir le chiffre d'affaire réalisé pour chaque téléphone (price x units_sold)

SELECT name, manufacturer, (price*units_sold) FROM telephones;

-- 11. Réaliser un renommage de colonne uniquement pour l'affichage

SELECT name AS modele, manufacturer AS marque, price AS prix, (price*units_sold) AS chiffre_d_affaire FROM telephones;

-- 12. Concaténer (mettre bout à bout deux chaînes de caractères) 

SELECT name, facturer, CONCAT(price," euros") FROM telephones;
SELECT CONCAT(name," ",manufacturer), price FROM telephones;

-- 13. Faire la fois : obtenir le chiffre d'affaire, renommer la colonne et concater

SELECT name AS modele, manufacturer AS marque, CONCAT(price*units_sold," euros") AS chiffre_d_affaire FROM telephones;

-- 14. Créer une vue à partir d'une requête (pour ne pas avoir à réécrire une longue requête)

CREATE VIEW v_revenu_total AS SELECT name AS modele, manufacturer AS marque, CONCAT(price*units_sold," euros") AS chiffre_d_affaire FROM telephones;

-- 15. Afficher une vue

SELECT * FROM v_revenu_total;

-- 16. Lister toutes les marques sans redondance

SELECT DISTINCT(manufacturer) FROM telephones;

-- 17. Compter le nombre d'enregistrement dans la table

SELECT COUNT(*) FROM telephones;

-- 18. Compter le nombre de téléphones de marque Apple dans la table

SELECT COUNT(*) FROM telephones WHERE manufacturer="Apple";

-- 19. Calculer le total des ventes de tous les téléphones (somme)

SELECT SUM(units_sold) FROM telephones;

-- 20. Calculer la moyenne des ventes de tous les téléphones

SELECT AVG(units_sold) FROM telephones;

-- 21. Afficher la vente la plus importante

SELECT MAX(units_sold) FROM telephones;

-- 22. Afficher la vente la moins importante

SELECT MIN(units_sold) FROM telephones;

-- 23. Afficher le nombre d'unités vendues au total pour chaque fabricants

SELECT manufacturer, SUM(units_sold) FROM telephones GROUP BY manufacturer;

-- 24. Afficher par ordre décroissant le chiffre d'affaire pour chaque fabricants

SELECT manufacturer, SUM(price*units_sold) AS chiffre_d_affaire FROM telephones GROUP BY manufacturer ORDER BY chiffre_d_affaire DESC;

-- 25. Afficher par odre croissant les fabricants dont le chiffre d'affaire est supérieur à 10 000 000 euros
-- On n'utilise pas "WHERE" mais "HAVING" lorqu'on a fait un groupage

SELECT manufacturer, SUM(price*units_sold) AS chiffre_d_affaire FROM telephones GROUP BY manufacturer HAVING chiffre_d_affaire>10000000 ORDER BY chiffre_d_affaire ASC;

--26. Untiliser une requête dans une condition
-- Afficher par ordre croissant le nom et le prix des téléphones dont le prix est inférieur à la moyenne des prix

SELECT name, price FROM telephones WHERE price<(SELECT AVG(price) FROM telephones) ORDER BY price ASC;

-- 27. Notion de table de jointure / Relation many to many
-- Table 1 clients : id, nom, prénom, mail
-- Table 2 telephones : id, désignation, prix, quantité en stock
-- Table de jointure achat qui fait le lien entre les deux : id, id_client, id_telephone, quantite_achetee ...
