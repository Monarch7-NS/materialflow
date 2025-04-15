-- Création de la structure de la base de données
CREATE DATABASE IF NOT EXISTS suivi_materiel;
USE suivi_materiel;

-- Table des projets
CREATE TABLE Projets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    annee YEAR NOT NULL,
    description TEXT,
    date_debut DATE,
    date_fin DATE,
    filiere VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table des étudiants
CREATE TABLE Etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    promotion VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des types de matériel
CREATE TABLE Types_Materiel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table du matériel
CREATE TABLE Materiel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    type_id INT,
    marque VARCHAR(100),
    modele VARCHAR(100),
    etat VARCHAR(50) NOT NULL DEFAULT 'disponible',
    lieu_stockage VARCHAR(255) NOT NULL,
    date_achat DATE,
    prix DECIMAL(10,2),
    details_achat TEXT,
    documentation TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (type_id) REFERENCES Types_Materiel(id)
);

-- Table d'utilisation du matériel
CREATE TABLE Utilisation_Materiel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projet_id INT,
    materiel_id INT,
    date_debut DATE NOT NULL,
    date_fin DATE,
    commentaire TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (projet_id) REFERENCES Projets(id),
    FOREIGN KEY (materiel_id) REFERENCES Materiel(id)
);

-- Table des ressources
CREATE TABLE Ressources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    chemin_fichier VARCHAR(255),
    lien VARCHAR(255),
    projet_id INT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (projet_id) REFERENCES Projets(id)
);

-- Table de liaison projets-étudiants
CREATE TABLE Projets_Etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projet_id INT,
    etudiant_id INT,
    role VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (projet_id) REFERENCES Projets(id),
    FOREIGN KEY (etudiant_id) REFERENCES Etudiants(id)
);

-- Table des utilisateurs de l'application
CREATE TABLE Utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'utilisateur',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table d'historique des modifications
CREATE TABLE Historique (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_affectee VARCHAR(50) NOT NULL,
    id_entite INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    ancienne_valeur TEXT,
    nouvelle_valeur TEXT,
    utilisateur_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id)
);
