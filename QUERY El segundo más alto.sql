SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
	SELECT COUNT (DISTINCT colegiatura)
	FROM platzi.alumnos a2 
	WHERE a1.colegiatura <= a2.colegiatura
);

SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 20
ORDER BY colegiatura DESC 
LIMIT 1 OFFSET 1;

SELECT
FROM platzi.alumnos AS datos_alumnos
INNER JOIN(
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1

)AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;


SELECT *
FROM platzi.alumnos AS datos_alumnos 
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20 
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);

SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
    SELECT MAX(colegiatura)
    FROM platzi.alumnos
    WHERE tutor_id = 20
);
 
 
-- RETO

SELECT *
FROM platzi.alumnos
OFFSET (SELECT COUNT(*) FROM platzi.alumnos) / 2;

SELECT *
FROM platzi.alumnos
LIMIT (SELECT COUNT(*) FROM platzi.alumnos) / 2 OFFSET (SELECT COUNT(*) FROM platzi.alumnos) / 2;

SELECT *
FROM (
    SELECT *, NTILE(2) OVER (ORDER BY (SELECT NULL)) AS half
    FROM platzi.alumnos
) AS half_alumnos
WHERE half = 2;

WITH ranked_alumnos AS (
  SELECT *, PERCENT_RANK() OVER (ORDER BY (SELECT NULL)) AS rank
  FROM platzi.alumnos
)
SELECT *
FROM ranked_alumnos
WHERE rank > 0.5;

SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS row_num
  FROM platzi.alumnos
) AS ranked_alumnos
WHERE row_num > (SELECT COUNT(*) FROM platzi.alumnos) / 2;