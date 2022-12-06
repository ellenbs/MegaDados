USE emprestimos;

DROP FUNCTION IF EXISTS total_saldos;

DELIMITER //
CREATE FUNCTION total_saldos() RETURNS DECIMAL(30, 2) READS SQL DATA
BEGIN

    -- Insira seu SQL aqui.
    DECLARE saldo_total DECIMAL(30, 2);
    SELECT SUM(saldo) INTO saldo_total FROM usuario;
	RETURN saldo_total;

END//
DELIMITER ;