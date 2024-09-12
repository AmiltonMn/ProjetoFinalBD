USE MML;

DELIMITER //

CREATE PROCEDURE selecionarUsuario(Usuario varchar(255))
BEGIN
	SELECT 
		*
	FROM usuario U
    WHERE U.Usuario = Usuario;
END //

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE selecionarFilmeID(IDFilme int)
BEGIN
	SELECT 
		*
	FROM filme F
    WHERE F.IDFilme = IDFilme;
END //

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE selectGeneros(IDFilme int)
BEGIN
	SELECT 
		G.Nome
	FROM genero G
    INNER JOIN generoFilme GFi
    ON GFi.IDFilme = IDFilme;
END //

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE addFilme(Titulo varchar(255), Sinopse varchar(255), Lancamento Date, NotaGeral float, IdadeIndicativa VARCHAR(255), Imagem VARCHAR(255))
BEGIN
START TRANSACTION;
	INSERT INTO filme values (default, Titulo, Sinopse, Lancamento, NotaGeral, IdadeIndicativa, Imagem);
IF NotaGeral != 0 OR IdadeIndicativa < 0 OR IdadeIndicativa > 6 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;
END

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE addGeneroFilme(IN IDFilme int, IN IDGenero int)
BEGIN
START TRANSACTION;
	INSERT INTO generofilme VALUES (DEFAULT, IDFilme, IDGenero);
IF IDFilme NOT IN (SELECT IDFilme FROM filme) OR IDGenero NOT IN (SELECT IDGenero FROM genero) THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;
END

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE solicitaçãoAmizade(IN IDUsuario1 int, IN IDUsuario2 int)
BEGIN
START TRANSACTION;
	INSERT INTO amizade VALUES (DEFAULT, 0, now(), IDUsuario2, IDUsuario1);
IF IDUsuario1 NOT IN (SELECT IDUsuario FROM usuario) OR IDUsuario2 NOT IN (SELECT IDUsuario FROM usuario) THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;
END

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE aceiteSolicitaçãoAmizade(IN IDUsuario1 int, IN IDUsuario2 int)
BEGIN
START TRANSACTION;
	UPDATE amizade SET state = 1 WHERE IDUsuario1 = Seguidor AND IDUsuario2 = Seguido;
IF IDUsuario1 NOT IN (SELECT IDUsuario FROM usuario) OR IDUsuario2 NOT IN (SELECT IDUsuario FROM usuario) THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;
END

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE recusaSolicitaçãoAmizade(IN IDUsuario1 int, IN IDUsuario2 int)
BEGIN
START TRANSACTION;
	UPDATE amizade SET state = 2 WHERE IDUsuario1 = Seguidor AND IDUsuario2 = Seguido;
IF IDUsuario1 NOT IN (SELECT IDUsuario FROM usuario) OR IDUsuario2 NOT IN (SELECT IDUsuario FROM usuario) THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;
END

//
DELIMITER ;

/* INSERT INTO usuario VALUES (default, "Amilton", "Amilton Moreira Neto", "2004-05-29", "123", "amilton@email.com", 1, "...");

INSERT INTO filme VALUES (default, "Procurando Nemo", "Aquele filme que o peixe é sequestrado", "2004-05-29", 0, 3, '...');

INSERT INTO genero VALUES (DEFAULT, 'Ação');

INSERT INTO generoFilme VALUES (DEFAULT, 1, 1);

CALL selecionarUsuario("Amilton");

CALL selecionarFilmeID(1);

CALL selectGeneros(1);

CALL addFilme('Ish', 'Não era isso que eu queria dizer', '2024-09-08', 2, '6', '...');

CALL addFilme('Ish 2', 'Não era isso que eu queria dizer 2', '2024-09-08', 0, '7', '...');

CALL addFilme('Ish 2', 'Não era isso que eu queria dizer 2', '2024-09-08', 0, '6', '...');

CALL addGeneroFilme(1, 4);

DROP PROCEDURE selecionarUsuario;
DROP PROCEDURE addGeneroFilme;
SELECT * FROM generofilme;

*/