-- Triggers pour la gestion automatique

-- 1. Mise à jour de l'état du matériel lors de son utilisation
DELIMITER //
CREATE TRIGGER after_utilisation_insert
AFTER INSERT ON Utilisation_Materiel
FOR EACH ROW
BEGIN
    IF NEW.date_fin IS NULL THEN
        UPDATE Materiel SET etat = 'utilisé' WHERE id = NEW.materiel_id;
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_utilisation_update
AFTER UPDATE ON Utilisation_Materiel
FOR EACH ROW
BEGIN
    IF NEW.date_fin IS NOT NULL THEN
        UPDATE Materiel SET etat = 'disponible' WHERE id = NEW.materiel_id;
    ELSE
        UPDATE Materiel SET etat = 'utilisé' WHERE id = NEW.materiel_id;
    END IF;
END//
DELIMITER ;

-- 2. Historique des modifications
DELIMITER //
CREATE TRIGGER after_projet_update
AFTER UPDATE ON Projets
FOR EACH ROW
BEGIN
    INSERT INTO Historique (table_affectee, id_entite, action, ancienne_valeur, nouvelle_valeur)
    VALUES ('Projets', NEW.id, 'update', 
            CONCAT('titre:', OLD.titre, ';annee:', OLD.annee, ';description:', OLD.description),
            CONCAT('titre:', NEW.titre, ';annee:', NEW.annee, ';description:', NEW.description));
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_materiel_update
AFTER UPDATE ON Materiel
FOR EACH ROW
BEGIN
    IF OLD.etat != NEW.etat THEN
        INSERT INTO Historique (table_affectee, id_entite, action, ancienne_valeur, nouvelle_valeur)
        VALUES ('Materiel', NEW.id, 'changement_etat', OLD.etat, NEW.etat);
    END IF;
END//
DELIMITER ;

-- 3. Validation des données
DELIMITER //
CREATE TRIGGER before_materiel_insert
BEFORE INSERT ON Materiel
FOR EACH ROW
BEGIN
    IF NEW.date_achat > CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La date d achat ne peut pas être dans le futur';
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_utilisation_insert
BEFORE INSERT ON Utilisation_Materiel
FOR EACH ROW
BEGIN
    DECLARE materiel_etat VARCHAR(50);
    SELECT etat INTO materiel_etat FROM Materiel WHERE id = NEW.materiel_id;
    
    IF materiel_etat != 'disponible' AND NEW.date_fin IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Le matériel n est pas disponible pour une nouvelle utilisation';
    END IF;
END//
DELIMITER ;
