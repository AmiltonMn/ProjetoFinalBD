CREATE TABLE logMML(
	IDLog int not null primary key auto_increment,
    comentario varchar(255)
);

DELIMITER //

CREATE TRIGGER afterAddFilme
BEFORE INSERT ON filme
FOR EACH ROW
BEGIN
	INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O filme ', new.Titulo, ' foi adicionado no banco de filmes!'));
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER beforeDeleteFilme
BEFORE DELETE ON filme
FOR EACH ROW
BEGIN
	INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O filme ', old.Titulo, ' foi retirado do banco de filmes!'));
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER afterAddUsuario
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O usuario ', new.Usuario, ' foi adicionado no banco de usuarios!'));
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER beforeDeleteUsuario
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O usuario ', old.Usuario, ' foi retirado do banco de usuarios!'));
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER afterAddGenero
BEFORE INSERT ON genero
FOR EACH ROW
BEGIN
	INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O genero ', new.Nome, ' foi adicionado no banco de generos!'));
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER beforeDeleteGenero
BEFORE DELETE ON genero
FOR EACH ROW
BEGIN
	INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O genero ', old.Nome, ' foi retirado do banco de generos!'));
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER solicitaçãoAmizade
AFTER INSERT ON amizade
FOR EACH ROW
BEGIN
	INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O usuário ', (SELECT Usuario FROM usuario WHERE IDUsuario = NEW.Seguidor), ' mandou uma solicitação de amizade para ', (SELECT Usuario FROM usuario WHERE IDUsuario = NEW.Seguido)));
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER respostaSolicitaçãoAmizade
AFTER UPDATE ON amizade
FOR EACH ROW
BEGIN
	IF OLD.State = 1 AND NEW.State = 0 THEN
		INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O usuário ', (SELECT Usuario FROM usuario WHERE IDUsuario = Seguidor), ' desfez a amizade com ', (SELECT Usuario FROM usuario WHERE IDUsuario = Seguido)));
	ELSE 
		IF OLD.State = 0 AND NEW.State = 2 THEN
			INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O usuário ', (SELECT Usuario FROM usuario WHERE IDUsuario = Seguido), ' aceitou a solicitação de amiza de ', (SELECT Usuario FROM usuario WHERE IDUsuario = Seguidor)));
		ELSE
			INSERT INTO logMML (IDLog, comentario) VALUES (DEFAULT, CONCAT('O usuário ', (SELECT Usuario FROM usuario WHERE IDUsuario = Seguido), ' recusou a solicitação de amizade de ', (SELECT Usuario FROM usuario WHERE IDUsuario = Seguidor)));
		END IF;
	END IF;
END

//
DELIMITER ;