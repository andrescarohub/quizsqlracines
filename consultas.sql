-- Listar todos los libros disponibles
SELECT libros.id, libros.nombre 
FROM libros
JOIN estado ON libros.estado = estado.id
WHERE estado.nombre = 'Disponible';

-- Buscar libros por género
SELECT libros.id, libros.nombre, genero.tipo 
FROM libros
JOIN genero ON libros.genero = genero.id
WHERE genero.tipo = 'Ciencia Ficción'; -- Cambia el género según la búsqueda

-- Obtener información de un libro por ISBN
SELECT libros.id, libros.nombre, libros.genero, libros.estado, libros.autor, libros.editorial 
FROM libros 
WHERE libros.id = 1; -- Cambia el ID por el ISBN específico

-- Contar el número de libros en la biblioteca
SELECT COUNT(libros.id) 
FROM libros;

-- Listar todos los autores
SELECT autor.id, autor.nombre 
FROM autor;

-- Buscar autores por nombre
SELECT autor.id, autor.nombre 
FROM autor
WHERE autor.nombre LIKE '%Carlos%'; -- Cambia el nombre según la búsqueda

-- Obtener todos los libros de un autor específico
SELECT libros.id, libros.nombre 
FROM libros
JOIN autor ON libros.autor = autor.id
WHERE autor.nombre = 'Lucía Fernández'; -- Cambia el nombre del autor

-- Listar todas las ediciones de un libro
SELECT editorial.id, editorial.edicion, editorial.nombre, editorial.fechapublicacion 
FROM editorial
JOIN libros ON editorial.id = libros.editorial
WHERE libros.nombre = 'El destino oculto'; -- Cambia el nombre del libro

-- Obtener la última edición de un libro
SELECT editorial.id, editorial.edicion, editorial.nombre, editorial.fechapublicacion 
FROM editorial
JOIN libros ON editorial.id = libros.editorial
WHERE libros.nombre = 'El destino oculto' 
ORDER BY editorial.fechapublicacion DESC 
LIMIT 1;

-- Contar cuántas ediciones hay de un libro específico
SELECT COUNT(editorial.id)
FROM editorial
JOIN libros ON editorial.id = libros.editorial
WHERE libros.nombre = 'El destino oculto';

-- Listar todas las transacciones de préstamo
SELECT transacciones.id, transacciones.id_libro, transacciones.id_estado 
FROM transacciones;

-- Obtener los libros prestados actualmente
SELECT libros.id, libros.nombre, estado.nombre 
FROM libros
JOIN estado ON libros.estado = estado.id
WHERE estado.nombre = 'Prestado';

-- Contar el número de transacciones de un miembro específico
SELECT COUNT(transacciones.id) 
FROM transacciones
JOIN detalle_transaccion ON transacciones.id = detalle_transaccion.id_transacciones
JOIN miembro ON transacciones.id = miembro.id
WHERE miembro.nombre = 'Andrea Pérez'; -- Cambia el nombre del miembro

-- Listar todos los miembros de la biblioteca
SELECT miembro.id, miembro.fecha, miembro.nombre, miembro.email 
FROM miembro;

-- Buscar un miembro por nombre
SELECT miembro.id, miembro.fecha, miembro.nombre, miembro.email 
FROM miembro
WHERE miembro.nombre 

-- Obtener las transacciones de un miembro específico
SELECT transacciones.id, transacciones.id_libro, libros.nombre, transacciones.id_estado, estado.nombre
FROM transacciones
JOIN libros ON transacciones.id_libro = libros.id
JOIN estado ON transacciones.id_estado = estado.id
JOIN miembro ON transacciones.id = miembro.id
WHERE miembro.nombre = 'Andrea Pérez'; -- Cambia el nombre del miembro

-- Listar todos los libros y sus autores
SELECT libros.id, libros.nombre, autor.nombre 
FROM libros
JOIN autor ON libros.autor = autor.id;

-- Obtener el historial de préstamos de un libro específico
SELECT transacciones.id, libros.id, libros.nombre, transacciones.id_estado, estado.nombre, miembro.id, miembro.nombre
FROM transacciones
JOIN libros ON transacciones.id_libro = libros.id
JOIN estado ON transacciones.id_estado = estado.id
JOIN miembro ON transacciones.id = miembro.id
WHERE libros.nombre = 'El destino oculto'; -- Cambia el nombre del libro

-- Contar cuántos libros han sido prestados en total
SELECT COUNT(transacciones.id)
FROM transacciones
JOIN estado ON transacciones.id_estado = estado.id
WHERE estado.nombre = 'Prestado';

-- Listar todos los libros junto con su última edición y estado de disponibilidad
SELECT libros.id, libros.nombre, editorial.nombre, editorial.edicion, editorial.fechapublicacion, estado.nombre
FROM libros
LEFT JOIN editorial ON libros.editorial = editorial.id
LEFT JOIN estado ON libros.estado = estado.id
ORDER BY editorial.fechapublicacion DESC;
