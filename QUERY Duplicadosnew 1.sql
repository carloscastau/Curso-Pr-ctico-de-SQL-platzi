SELECT *
FROM platzi.alumnos AS ou
WHERE (
	SELECT COUNT(*)
	FROM platzi.alumnos AS inr
	WHERE ou.id = inr.id
) > 1;

SELECT (platzi.alumnos.*)::text, COUNT(*)
FROM platzi.alumnos 
GROUP BY platzi.alumnos.*
HAVING COUNT(*) > 1;

SELECT (
	   platzi.alumnos.nombre,
	   platzi.alumnos.apellido,
	   platzi.alumnos.email,
	   platzi.alumnos.colegiatura,
	   platzi.alumnos.fecha_incorporacion,
 	   platzi.alumnos.carrera_id,
	   platzi.alumnos.tutor_id
	   )::text, COUNT(*)
FROM platzi.alumnos 
GROUP BY  platzi.alumnos.nombre,
	   platzi.alumnos.apellido,
	   platzi.alumnos.email,
	   platzi.alumnos.colegiatura,
	   platzi.alumnos.fecha_incorporacion,
 	   platzi.alumnos.carrera_id,
	   platzi.alumnos.tutor_id
HAVING COUNT(*) > 1;

SELECT *
FROM (
	SELECT id,
	ROW_NUMBER() OVER(
		PARTITION BY
			nombre,
			apellido,
	email,
	colegiatura,
	fecha_incorporacion,
	carrera_id,
	tutor_id
	ORDER BY id ASC
	)AS row,
	*
	FROM platzi.alumnos
)AS duplicados
WHERE duplicados.row > 1;

DELETE
    FROM platzi.alumnos
    WHERE id IN (SELECT id FROM (
        SELECT *
            FROM (SELECT id, ROW_NUMBER() OVER(
            PARTITION BY 
                nombre, apellido, 
                email, colegiatura,
                fecha_incorporacion, carrera_id,
                tutor_id
            ORDER BY id ASC) AS row
            FROM platzi.alumnos
    ) AS duplicados
    WHERE duplicados.row > 1) AS duplicados_id);