USE `classicmodels`;

SELECT
	employees.firstName , employees.lastName as nome_completo
FROM 
	employees
WHERE
	employees.reportsTo IS NULL;