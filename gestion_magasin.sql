CREATE DATABASE gestion_magasin;
USE gestion_magasin;

-- Table de jointure application

CREATE TABLE clients(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(20) NOT NULL,
    Prenom VARCHAR(20) NOT NULL,
    Adresse_email VARCHAR(50) NOT NULL UNIQUE);

INSERT INTO clients(id, Nom, Prenom, Adresse_email) VALUES 
(1, "Barthel", "Kerner", "bkerner0@cloudflare.com"),
(2, "Quentin", "Lettington", "qlettington1@liveinternet.ru"),
(3, "Fidela", "Duncan", "fduncan2@elegantthemes.com"),
(4, "Nert", "Zorzni", "nzorzini3@ovh.net");

SELECT * FROM clients;

CREATE TABLE produits(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Designation VARCHAR(50) NOT NULL,
    Prix_UHT FLOAT NOT NULL,
    Prix_TTC FLOAT GENERATED ALWAYS AS (prix_UHT*1.2) STORED,
    Quantite_stock INTEGER);

INSERT INTO produits(id, Designation, Prix_UHT, Quantite_stock) VALUES
(1, "Marsala - Sperone, Fine, D.o.c.", 66, 511),
(2, "Chocolate Bar - Coffee Crisp", 69, 425),
(3, "Pork - Side Ribs", 183, 795),
(4, "Wine - Sauvignon Blanc", 115, 600),
(5, "Wine - Semi Dry Riesling Vineland", 238, 331),
(6, "Potatoes - Pei 10 Oz", 108, 934),
(7, "Cut Wakame - Hanawakaba", 159, 354),
(8, "Coffee - Egg Nog Capuccino", 262, 881),
(9, "Lemonade - Natural, 591 Ml", 294, 587),
(10, "Red Snapper - Fresh, Whole", 269, 77);

SELECT * FROM produits;

CREATE TABLE achats(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_client INTEGER,
    id_produit INTEGER NOT NULL,
    FOREIGN KEY(id_client) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY(id_produit) REFERENCES produits(id) ON UPDATE CASCADE ON DELETE RESTRICT);

INSERT INTO achats(id, id_client, id_produit) VALUES
(1, 2, 7), (2, 2, 8), (3, 1, 6), (4, 2, 2), (5, 4, 7), (6, 3, 2), (7, 3, 1), (8, 3, 8),
(9, 3, 4), (10, 3, 2), (11, 1, 2), (12, 2, 5), (13, 4, 7), (14, 1, 2), (15, 3, 8), (16, 1, 1),
(17, 4, 5), (18, 1, 7), (19, 2, 8), (20, 2, 4), (21, 3, 10), (22, 3, 5), (23, 2, 2), (24, 2, 7),
(25, 4, 1), (26, 3, 7), (27, 2, 8), (28, 4, 7), (29, 1, 6), (30, 3, 2), (31, 4, 4), (32, 2, 6),
(33, 4, 6), (34, 3, 7), (35, 2, 2), (36, 4, 2), (37, 3, 7), (38, 2, 1), (39, 2, 9), (40, 3, 6);

SELECT * FROM achats;

-- Afficher tous les clients et les achats effectués (double jointure)

SELECT CONCAT(clients.Prenom," ",clients.Nom) AS Client, produits.Designation FROM clients 
JOIN achats ON clients.id=achats.id_client JOIN produits ON produits.id=achats.id_produit;