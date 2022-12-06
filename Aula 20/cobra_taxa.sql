USE emprestimos;

DROP PROCEDURE IF EXISTS cobra_taxa;

DELIMITER //
CREATE PROCEDURE cobra_taxa(IN taxa DECIMAL(30, 2))
BEGIN
    # Gambiarra para desligar o aviso de segurança que previne
    # UPDATES gerais (sem WHERE).
    SET @OLD_SQL_SAFE_UPDATES = @@SQL_SAFE_UPDATES;
    SET SQL_SAFE_UPDATES=0;

    # Insira seu código aqui.
	UPDATE usuario SET saldo = saldo - IF(saldo > taxa, saldo - taxa, 0.0);
    # Desliga a gambiarra.
    SET SQL_SAFE_UPDATES=@OLD_SQL_SAFE_UPDATES;
END //
DELIMITER ;