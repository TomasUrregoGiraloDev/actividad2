[11:20 p. m., 12/3/2025] Santiago Garcia Patiño: -- 1. Crear la base de datos
CREATE DATABASE escuela_secundaria;
USE escuela_secundaria;

-- 2. Listado de tablas y su clasificación:
-- Tablas referenciales:
--  * acudientes
--  * docentes
--  * materias
-- Tablas de movimiento:
--  * estudiantes
--  * estudiantes_materias

-- 3. Diseñar la estructura de cada tabla

-- Tabla Acudientes
CREATE TABLE acudientes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);

-- Tabla Docentes
CREATE TABLE docentes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);

-- Tabla Materias
CREATE TABLE materias (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla Estudiantes
CREATE TABLE estudiantes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre TEXT NOT NULL,
    direccion TEXT,
    telefono TEXT,
    email TEXT,
    acudiente_id BIGINT NOT NULL,
    CONSTRAINT fk_estudiantes_acudiente FOREIGN KEY (acudiente_id) REFERENCES acudientes(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla Estudiantes_Materias (Relación muchos a muchos entre estudiantes y materias con docentes asignados)
CREATE TABLE estudiantes_materias (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id BIGINT NOT NULL,
    materia_id BIGINT NOT NULL,
    docente_id BIGINT NOT NULL,
    CONSTRAINT fk_estudiantes_materias_estudiante FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_estudiantes_materias_materia FOREIGN KEY (materia_id) REFERENCES materias(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_estudiantes_materias_docente FOREIGN KEY (docente_id) REFERENCES docentes(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 6. Insertar 10 registros en cada tabla

-- Insertar acudientes
INSERT INTO acudientes (nombre, telefono, email) VALUES
('Carlos Pérez', '3001234567', 'carlos.perez@example.com'),
('María Gómez', '3107654321', 'maria.gomez@example.com'),
('Juan Rodríguez', '3209876543', 'juan.rodriguez@example.com'),
('Ana Martínez', '3012345678', 'ana.martinez@example.com'),
('Luis Sánchez', '3112233445', 'luis.sanchez@example.com'),
('Pedro Ramírez', '3223344556', 'pedro.ramirez@example.com'),
('Laura Díaz', '3009988776', 'laura.diaz@example.com'),
('José López', '3121122334', 'jose.lopez@example.com'),
('Marta Castillo', '3195544332', 'marta.castillo@example.com'),
('Roberto Herrera', '3156677889', 'roberto.herrera@example.com');

-- Insertar docentes
INSERT INTO docentes (nombre, telefono, email) VALUES
('Fernando Suárez', '3002223334', 'fernando.suarez@example.com'),
('Carmen Rojas', '3101122334', 'carmen.rojas@example.com'),
('Javier Vargas', '3204455667', 'javier.vargas@example.com'),
('Silvia Patiño', '3015566778', 'silvia.patino@example.com'),
('Raúl Cifuentes', '3116677889', 'raul.cifuentes@example.com'),
('Patricia Mendieta', '3227788990', 'patricia.mendieta@example.com'),
('Daniel Estrada', '3008877665', 'daniel.estrada@example.com'),
('Andrea Quintero', '3123344556', 'andrea.quintero@example.com'),
('Sergio Benítez', '3199988776', 'sergio.benitez@example.com'),
('Monica López', '3155544332', 'monica.lopez@example.com');

-- Insertar materias
INSERT INTO materias (nombre) VALUES
('Matemáticas'),
('Español'),
('Ciencias'),
('Historia'),
('Inglés'),
('Física'),
('Química'),
('Biología'),
('Geografía'),
('Educación Física');

-- Insertar estudiantes
INSERT INTO estudiantes (nombre, direccion, telefono, email, acudiente_id) VALUES
('Juan López', 'Calle 123 #45-67', '3112233445', 'juan.lopez@example.com', 1),
('Mariana Pérez', 'Avenida 89 #12-34', '3005566778', 'mariana.perez@example.com', 2),
('Ricardo Gómez', 'Carrera 56 #78-90', '3209876543', 'ricardo.gomez@example.com', 3),
('Paula Ramírez', 'Calle 101 #23-45', '3019988776', 'paula.ramirez@example.com', 4),
('Esteban Cifuentes', 'Diagonal 33 #67-89', '3123344556', 'esteban.cifuentes@example.com', 5),
('Sofía Herrera', 'Transversal 88 #45-67', '3195544332', 'sofia.herrera@example.com', 6),
('Felipe Castillo', 'Calle 200 #56-78', '3156677889', 'felipe.castillo@example.com', 7),
('Luciana Benítez', 'Carrera 20 #12-45', '3001122334', 'luciana.benitez@example.com', 8),
('David Quintero', 'Avenida 45 #78-90', '3109988776', 'david.quintero@example.com', 9),
('Carolina Vargas', 'Diagonal 60 #23-67', '3223344556', 'carolina.vargas@example.com', 10);

-- Insertar estudiantes_materias
INSERT INTO estudiantes_materias (estudiante_id, materia_id, docente_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- 8. Crear una copia de la base de datos
CREATE DATABASE escuela_secundaria_backup;
USE escuela_secundaria;

-- Copiar las tablas y datos de la base de datos original
CREATE TABLE escuela_secundaria_backup.acudientes LIKE escuela_secundaria.acudientes;
INSERT INTO escuela_secundaria_backup.acudientes SELECT * FROM escuela_secundaria.acudientes;

CREATE TABLE escuela_secundaria_backup.docentes LIKE escuela_secundaria.docentes;
INSERT INTO escuela_secundaria_backup.docentes SELECT * FROM escuela_secundaria.docentes;

CREATE TABLE escuela_secundaria_backup.materias LIKE escuela_secundaria.materias;
INSERT INTO escuela_secundaria_backup.materias SELECT * FROM escuela_secundaria.materias;

CREATE TABLE escuela_secundaria_backup.estudiantes LIKE escuela_secundaria.estudiantes;
INSERT INTO escuela_secundaria_backup.estudiantes SELECT * FROM escuela_secundaria.estudiantes;

CREATE TABLE escuela_secundaria_backup.estudiantes_materias LIKE escuela_secundaria.estudiantes_materias;
INSERT INTO escuela_secundaria_backup.estudiantes_materias SELECT * FROM escuela_secundaria.estudiantes_materias;
 
 
 
 
 
 
 
 
CREATE TABLE acudientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL
);

CREATE TABLE docentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOINT
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL
);

CREATE TABLE materias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL
);

CREATE TABLE estudiantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    acudiente_id BIGINT NOT NULL,
    CONSTRAINT fk_estudiantes_acudiente FOREIGN KEY (acudiente_id) REFERENCES acudientes(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE estudiantes_materias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id BIGINT NOT NULL ,
    materia_id BIGINT NOT NULL,
    docente_id BIGINT NOT NULL,
    CONSTRAINT fk_estudiantes_materias_estudiante FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_estudiantes_materias_materia FOREIGN KEY (materia_id) REFERENCES materias(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_estudiantes_materias_docente FOREIGN KEY (docente_id) REFERENCES docentes(id) ON UPDATE CASCADE ON DELETE CASCADE
);
[11:21 p. m., 12/3/2025] Santiago Garcia Patiño: -- 1. Crear la base de datos
CREATE DATABASE escuela_secundaria;
USE escuela_secundaria;

-- 2. Listado de tablas y su clasificación:
-- Tablas referenciales:
--  * acudientes
--  * docentes
--  * materias
-- Tablas de movimiento:
--  * estudiantes
--  * estudiantes_materias

-- 3. Diseñar la estructura de cada tabla
 full abajo

-- 6. Insertar 10 registros en cada tabla

-- Insertar acudientes
INSERT INTO acudientes (nombre, telefono, email) VALUES
('Carlos Pérez', '3001234567', 'carlos.perez@example.com'),
('María Gómez', '3107654321', 'maria.gomez@example.com'),
('Juan Rodríguez', '3209876543', 'juan.rodriguez@example.com'),
('Ana Martínez', '3012345678', 'ana.martinez@example.com'),
('Luis Sánchez', '3112233445', 'luis.sanchez@example.com'),
('Pedro Ramírez', '3223344556', 'pedro.ramirez@example.com'),
('Laura Díaz', '3009988776', 'laura.diaz@example.com'),
('José López', '3121122334', 'jose.lopez@example.com'),
('Marta Castillo', '3195544332', 'marta.castillo@example.com'),
('Roberto Herrera', '3156677889', 'roberto.herrera@example.com');

-- Insertar docentes
INSERT INTO docentes (nombre, telefono, email) VALUES
('Fernando Suárez', '3002223334', 'fernando.suarez@example.com'),
('Carmen Rojas', '3101122334', 'carmen.rojas@example.com'),
('Javier Vargas', '3204455667', 'javier.vargas@example.com'),
('Silvia Patiño', '3015566778', 'silvia.patino@example.com'),
('Raúl Cifuentes', '3116677889', 'raul.cifuentes@example.com'),
('Patricia Mendieta', '3227788990', 'patricia.mendieta@example.com'),
('Daniel Estrada', '3008877665', 'daniel.estrada@example.com'),
('Andrea Quintero', '3123344556', 'andrea.quintero@example.com'),
('Sergio Benítez', '3199988776', 'sergio.benitez@example.com'),
('Monica López', '3155544332', 'monica.lopez@example.com');

-- Insertar materias
INSERT INTO materias (nombre) VALUES
('Matemáticas'),
('Español'),
('Ciencias'),
('Historia'),
('Inglés'),
('Física'),
('Química'),
('Biología'),
('Geografía'),
('Educación Física');

-- Insertar estudiantes
INSERT INTO estudiantes (nombre, direccion, telefono, email, acudiente_id) VALUES
('Juan López', 'Calle 123 #45-67', '3112233445', 'juan.lopez@example.com', 1),
('Mariana Pérez', 'Avenida 89 #12-34', '3005566778', 'mariana.perez@example.com', 2),
('Ricardo Gómez', 'Carrera 56 #78-90', '3209876543', 'ricardo.gomez@example.com', 3),
('Paula Ramírez', 'Calle 101 #23-45', '3019988776', 'paula.ramirez@example.com', 4),
('Esteban Cifuentes', 'Diagonal 33 #67-89', '3123344556', 'esteban.cifuentes@example.com', 5),
('Sofía Herrera', 'Transversal 88 #45-67', '3195544332', 'sofia.herrera@example.com', 6),
('Felipe Castillo', 'Calle 200 #56-78', '3156677889', 'felipe.castillo@example.com', 7),
('Luciana Benítez', 'Carrera 20 #12-45', '3001122334', 'luciana.benitez@example.com', 8),
('David Quintero', 'Avenida 45 #78-90', '3109988776', 'david.quintero@example.com', 9),
('Carolina Vargas', 'Diagonal 60 #23-67', '3223344556', 'carolina.vargas@example.com', 10);

-- Insertar estudiantes_materias
INSERT INTO estudiantes_materias (estudiante_id, materia_id, docente_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- 8. Crear una copia de la base de datos
CREATE DATABASE escuela_secundaria_backup;
USE escuela_secundaria;

-- Copiar las tablas y datos de la base de datos original
CREATE TABLE escuela_secundaria_backup.acudientes LIKE escuela_secundaria.acudientes;
INSERT INTO escuela_secundaria_backup.acudientes SELECT * FROM escuela_secundaria.acudientes;

CREATE TABLE escuela_secundaria_backup.docentes LIKE escuela_secundaria.docentes;
INSERT INTO escuela_secundaria_backup.docentes SELECT * FROM escuela_secundaria.docentes;

CREATE TABLE escuela_secundaria_backup.materias LIKE escuela_secundaria.materias;
INSERT INTO escuela_secundaria_backup.materias SELECT * FROM escuela_secundaria.materias;

CREATE TABLE escuela_secundaria_backup.estudiantes LIKE escuela_secundaria.estudiantes;
INSERT INTO escuela_secundaria_backup.estudiantes SELECT * FROM escuela_secundaria.estudiantes;

CREATE TABLE escuela_secundaria_backup.estudiantes_materias LIKE escuela_secundaria.estudiantes_materias;
INSERT INTO escuela_secundaria_backup.estudiantes_materias SELECT * FROM escuela_secundaria.estudiantes_materias;
 
 
 
 
 
 
 
 
CREATE TABLE acudientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL
);

CREATE TABLE docentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOINT
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL
);

CREATE TABLE materias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL
);

CREATE TABLE estudiantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    acudiente_id BIGINT NOT NULL,
    CONSTRAINT fk_estudiantes_acudiente FOREIGN KEY (acudiente_id) REFERENCES acudientes(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE estudiantes_materias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id BIGINT NOT NULL ,
    materia_id BIGINT NOT NULL,
    docente_id BIGINT NOT NULL,
    CONSTRAINT fk_estudiantes_materias_estudiante FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_estudiantes_materias_materia FOREIGN KEY (materia_id) REFERENCES materias(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_estudiantes_materias_docente FOREIGN KEY (docente_id) REFERENCES docentes(id) ON UPDATE CASCADE ON DELETE CASCADE
);