-- Crear la base de datos
CREATE DATABASE biblioteca;
USE biblioteca;

-- Crear tabla genero
CREATE TABLE genero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20)
);

-- Crear tabla autor
CREATE TABLE autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

-- Crear tabla estado
CREATE TABLE estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

-- Crear tabla editorial
CREATE TABLE editorial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    edicion VARCHAR(20),
    nombre VARCHAR(20),
    fechapublicacion DATE
);

-- Crear tabla libros
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
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

-- Crear tabla miembro
CREATE TABLE miembro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    nombre VARCHAR(25),
    email VARCHAR(25)
);

-- Crear tabla autor_libro (relación muchos a muchos entre autor y libro)
CREATE TABLE autor_libro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_autor INT,
    id_libro INT,
    FOREIGN KEY (id_autor) REFERENCES autor(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);

-- Crear tabla libro_genero (relación muchos a muchos entre libro y genero)
CREATE TABLE libro_genero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_genero INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_genero) REFERENCES genero(id)
);

-- Crear tabla estado_libro (relación entre libro y estado)
CREATE TABLE estado_libro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    id_estado INT,
    id_libro INT,
    FOREIGN KEY (id_estado) REFERENCES estado(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);

-- Crear tabla transacciones
CREATE TABLE transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_estado INT,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_estado) REFERENCES estado(id)
);

-- Crear tabla detalle_transaccion
CREATE TABLE detalle_transaccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_transacciones INT,
    id_libro INT,
    FOREIGN KEY (id_transacciones) REFERENCES transacciones(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);