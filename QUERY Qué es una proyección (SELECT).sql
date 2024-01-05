SELECT *; -- Select mas sencillo

SELECT field AS alias;

SELECT COUNT(id), SUM(quantity),
AVG(age);

SELECT MIN(date), MAX(quantity);

SELECT IF(500<1000, 'YES', 'NO');

SELECT OrderID, Quantity,
CASE
		WHEN Quantity > 30 THEN 'Over 30'
		WHEN Quantity = 30 THEN 'Equal30'
		ELSE 'Under 30'
END AS QUantityText