-- Authentification/Connexion
>mysql -u root -- Si l'utilisateur n'a pas de mot de passe
>mysql -u root -p -- Si l'utilisateur possède un mot de passe

-- 1. Lister toutes les bases de données

>mysql SHOW DATABASES;

-- 2. Création de la base de données

CREATE DATABASE poe_ventes;

-- 5. Utiliser/sélectionner la base de données

USE poe_ventes;

-- 4. Création de la table clients