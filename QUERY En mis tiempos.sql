SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos


SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
		DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion,
		DATE_PART('DAY', fecha_incorporacion) AS dia_incorporacion
FROM platzi.alumnos

-- RETO

SELECT EXTRACT(HOUR FROM fecha_incorporacion) AS hora,
       EXTRACT(MINUTE FROM fecha_incorporacion) AS minutos,
       EXTRACT(SECOND FROM fecha_incorporacion) AS segundos
FROM platzi.alumnos;