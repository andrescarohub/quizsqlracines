![image](https://github.com/user-attachments/assets/33c7f58c-4179-4601-a5ce-6ceb25b5acad)



-- Crear tabla genero
CREATE TABLE genero (
    id INT  AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20)
);

-- Crear tabla autor
CREATE TABLE autor (
    id INT AUTO_INCREMENT  PRIMARY KEY ,
    nombre VARCHAR(20)
);
-- Crear tabla libros
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20),
    genero INT,
    estado INT,
    autor INT,
    editorial INT,
    FOREIGN KEY (genero) REFERENCES genero(id),
    FOREIGN KEY (estado) REFERENCES estado(id),
    FOREIGN KEY (autor) REFERENCES autor(id),
    FOREIGN KEY (editorial) REFERENCES editorial(id)
);
-- Crear tabla editorial
CREATE TABLE editorial (
    id INT AUTO_INCREMENT  PRIMARY KEY,
    edicion VARCHAR(20),
    nombre VARCHAR(20),
    fechapublicacion DATE,
    libros INT
    FOREIGN KEY (libros) REFERENCES libros(id)
);

-- Crear tabla estado
CREATE TABLE estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

-- Crear tabla miembro
CREATE TABLE miembro (
    id AUTO_INCREMENT  INT PRIMARY KEY,
    fecha DATE,
    nombre VARCHAR(25),
    email VARCHAR(25)
);



-- Crear tabla autor_libro (relación muchos a muchos entre autor y libro)
CREATE TABLE autor_libro (
    id AUTO_INCREMENT  INT PRIMARY KEY ,
    id_autor INT,
    id_libro INT,
    FOREIGN KEY (id_autor) REFERENCES autor(id_int),
    FOREIGN KEY (id_libro) REFERENCES libros(id_int)
);

-- Crear tabla libro_genero (relación muchos a muchos entre libro y genero)
CREATE TABLE libro_genero (
    id INT PRIMARY KEY,
    id_libro INT,
    id_genero INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_genero) REFERENCES genero(id)
);

-- Crear tabla estado_libro (relación entre libro y estado)
CREATE TABLE estado_libro (
    id AUTO_INCREMENT  INT PRIMARY KEY,
    nombre VARCHAR(20),
    id_estado INT,
    id_libro INT,
    FOREIGN KEY (id_estado) REFERENCES estado(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);

-- Crear tabla transacciones
CREATE TABLE transacciones (
    id INT PRIMARY KEY,
    id_libro INT,
    id_estado INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_estado) REFERENCES estado(id)
);

-- Crear tabla detalle_transaccion
CREATE TABLE detalle_transaccion (
    id INT AUTO_INCREMENT  PRIMARY KEY,
    id_transacciones INT,
    id_libro INT,
    FOREIGN KEY (id_transacciones) REFERENCES transacciones(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);
-- Insertar datos en la tabla genero
INSERT INTO genero (id, tipo) VALUES 
(1, 'Novela'),
(2, 'Ciencia Ficción'),
(3, 'Historia'),
(4, 'Poesía'),
(5, 'Biografía');

-- Insertar datos en la tabla autor
INSERT INTO autor (id, nombre) VALUES 
(1, 'Gabriel García Márquez'),
(2, 'Isabel Allende'),
(3, 'Julio r'),
(4, 'Jorge Ls'),
(5, 'Mario V');

-- Insertar datos en la tabla estado
INSERT INTO estado (id, nombre) VALUES 
(1, 'Disponible'),
(2, 'Prestado'),
(3, 'En reparación'),
(4, 'Extraviado');

-- Insertar datos en la tabla miembro
INSERT INTO miembro (id, fecha, nombre, email) VALUES 
(1, '2023-01-10', 'amanda ', 'aa.pez@email.com'),
(2, '2023-02-15', 'andres ', 'ca.riz@email.com'),
(3, '2023-03-20', 'hola', 'mara.gmez@email.com');

-- Primero insertar los datos en la tabla libros sin la referencia a editorial
-- (ya que hay una dependencia circular)
INSERT INTO libros (id, nombre, genero, estado, autor, editorial) VALUES 
(1, 'Cien años de soledad', 1, 1, 1, NULL),
(2, 'La casa de los espíritus', 1, 2, 2, NULL),
(3, 'mackuin', 1, 1, 3, NULL),
(4, 'hola', 2, 1, 4, NULL),
(5, 'canes', 1, 3, 5, NULL);

-- Insertar datos en la tabla editorial
INSERT INTO editorial (id, edicion, nombre, fechapublicacion, libros) VALUES 
(1, 'Primera', 'Alfaguara', '2000-01-15', 1),
(2, 'Segunda', 'Planeta', '1995-06-20', 2),
(3, 'Tercera', 'Seix Barral', '2010-11-10', 3);

-- Actualizar la referencia editorial en libros después de insertar editoriales
UPDATE libros SET editorial = 1 WHERE id = 1;
UPDATE libros SET editorial = 2 WHERE id = 2;
UPDATE libros SET editorial = 3 WHERE id = 3;
UPDATE libros SET editorial = 2 WHERE id = 4;
UPDATE libros SET editorial = 1 WHERE id = 5;

-- Insertar datos en la tabla autor_libro
INSERT INTO autor_libro (id, id_autor, id_libro) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Insertar datos en la tabla libro_genero
INSERT INTO libro_genero (id, id_libro, id_genero) VALUES 
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1);

-- Insertar datos en la tabla estado_libro
INSERT INTO estado_libro (id, nombre, id_estado, id_libro) VALUES 
(1, 'En estantería', 1, 1),
(2, 'Prestado a socio', 2, 2),
(3, 'En estantería', 1, 3),
(4, 'En estantería', 1, 4),
(5, 'En reparación', 3, 5);

-- Insertar datos en la tabla transacciones
INSERT INTO transacciones (id, id_libro, id_estado) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 5, 3);

-- Insertar datos en la tabla detalle_transaccion
INSERT INTO detalle_transaccion (id, id_transacciones, id_libro) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 5);

