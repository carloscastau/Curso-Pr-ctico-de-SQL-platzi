SELECT *
FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
		AND carrera_id = 31
);


-- RETO 

SELECT *
FROM platzi.alumnos
WHERE id NOT IN (
  SELECT id
  FROM platzi.alumnos
  WHERE tutor_id = 30
);