SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2019

SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2018

SELECT *
FROM (
	SELECT *,
		DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
	FROM platzi.alumnos
)AS alumnos_con_anio
WHERE anio_incorporacion = 2020;

-- RETO

SELECT *
FROM (
    SELECT *,
        DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
        DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion
    FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE anio_incorporacion = 2020
    AND mes_incorporacion = 7;