USE `classicmodels`;

SELECT 
	customers.customerName, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) as ordens_totais
FROM 
	customers
    LEFT OUTER JOIN orders USING (customerNumber)
    INNER JOIN orderdetails USING (orderNumber)
GROUP BY 
	customerNumber
ORDER BY
	ordens_totais DESC
LIMIT 5;