SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

SELECT carrera_id, 
	MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;

-- RETO

SELECT MIN(nombre) AS nombre_minimo
FROM platzi.alumnos;

SELECT MIN(nombre) AS nombre_minimo, tutor_id
FROM platzi.alumnos
GROUP BY tutor_id;