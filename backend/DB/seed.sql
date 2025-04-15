-- Peuplement initial de la base de données

-- Types de matériel
INSERT INTO Types_Materiel (nom, description) VALUES
('Ordinateur', 'Ordinateurs et composants informatiques'),
('Capteur', 'Capteurs divers (température, humidité, etc.)'),
('Electronique', 'Composants électroniques'),
('Affichage', 'Écrans et dispositifs d affichage'),
('Drone', 'Composants pour drones');

-- Matériel
INSERT INTO Materiel (nom, type_id, marque, modele, etat, lieu_stockage, date_achat, prix, details_achat, documentation) VALUES
('Raspberry Pi 4', 1, 'Raspberry Pi', 'Model B 4GB', 'disponible', 'Bureau A119', '2023-03-15', 59.90, 'Acheté sur Amazon', 'https://www.raspberrypi.com/products/raspberry-pi-4-model-b/'),
('Capteur DHT22', 2, 'Aosong', 'DHT22', 'disponible', 'Labo B205', '2024-01-10', 12.50, 'Acheté sur Gotronic', 'https://www.gotronic.fr/art-capteur-de-t-et-d-humidite-dht22-20719.htm'),
('Ecran tactile', 4, 'Elecrow', '5 pouces', 'utilisé', 'Labo B205', '2022-11-20', 89.99, 'Acheté avec kit Blueconnect', 'https://www.elecrow.com/5-inch-hdmi-lcd-with-touch-screen.html'),
('Batterie LiPo', 5, 'Tattu', '3S 2200mAh', 'disponible', 'Bureau A119', '2023-09-05', 24.90, '2 unités achetées', 'https://www.gettattu.com/product/tattu-3s-2200mah-45c-lipo-battery-pack.html');

-- Étudiants
INSERT INTO Etudiants (nom, email, promotion) VALUES
('Alexandre Duché', 'alexandre.duche@ecole.fr', 'SNI 2025'),
('Maël Laquiti', 'mael.laquiti@ecole.fr', 'SNI 2025'),
('Chris Pecheux', 'chris.pecheux@ecole.fr', 'SNI 2025'),
('Élise Tornier', 'elise.tornier@ecole.fr', 'SNI 2025'),
('Simon Vignoux', 'simon.vignoux@ecole.fr', 'SNI 2025'),
('Romain Uran', 'romain.uran@ecole.fr', 'PEIP 2024');

-- Projets
INSERT INTO Projets (titre, annee, description, date_debut, date_fin, filiere) VALUES
('Blueconnect', 2022, 'Système embarqué de contrôle du confort en salle', '2022-09-15', '2025-06-30', 'SNI'),
('QPAS', 2024, 'Développement de fonctionnalités pour Blueconnect', '2024-01-10', '2024-05-20', 'PEIP'),
('IA Embarquée', 2023, 'Conception d un drone avec IA', '2023-10-01', '2026-06-30', 'SNI');

-- Association projets-étudiants
INSERT INTO Projets_Etudiants (projet_id, etudiant_id, role) VALUES
(1, 1, 'Chef de projet'),
(1, 2, 'Développeur'),
(1, 3, 'Électronique'),
(1, 4, 'Design'),
(1, 5, 'Documentation'),
(2, 6, 'Développeur Python');

-- Utilisation du matériel
INSERT INTO Utilisation_Materiel (projet_id, materiel_id, date_debut, date_fin, commentaire) VALUES
(1, 3, '2023-01-10', NULL, 'Utilisé pour l interface principale'),
(1, 2, '2023-02-15', '2024-01-05', 'Capteur de température/humidité'),
(2, 2, '2024-01-10', NULL, 'Réutilisé pour QPAS');

-- Ressources
INSERT INTO Ressources (type, nom, lien, projet_id, description) VALUES
('rapport', 'Rapport intermédiaire 2023', NULL, 1, 'Rapport de mi-parcours'),
('code', 'Dépôt Git Blueconnect', 'https://github.com/ecole/blueconnect', 1, 'Code source principal'),
('photo', 'Prototype v1', NULL, 1, 'Première version du prototype');

-- Utilisateurs
INSERT INTO Utilisateurs (nom, email, mot_de_passe, role) VALUES
('Admin', 'admin@ecole.fr', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'admin'), -- motdepasse
('Enseignant', 'prof@ecole.fr', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'enseignant'),
('Technicien', 'tech@ecole.fr', '$2a$10$xJwL5v5Jz5UZJZ5UZJZ5Ue', 'technicien');
