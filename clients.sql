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
-- PRIMARY KEY : marqueuer la colonne comme étant la clé primaire
CREATE TABLE clients(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY

);