SELECT lpad('sql',15,'+');

SELECT  lpad('*',id,'*')
FROM platzi.alumnos
WHERE id < 10
ORDER BY carrera_id;

SELECT lpad('*',CAST(row_id AS int),'*')
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) AS row_id, *
	FROM platzi.alumnos
)AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;

-- La función RPAD se utiliza para agregar caracteres a la derecha de una cadena. Si la cadena original es más corta que la longitud especificada, se agregarán caracteres a la derecha hasta alcanzar esa longitud.