/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  jcgut
 * Created: 13/11/2022
 */

--crear la BBDD
CREATE DATABASE IF NOT EXISTS recursosiud;
DROP DATABASE IF EXISTS recursosiud;

USE recursosiud;-- selecciona la BBDD

/*
Creación de tablas
*/

CREATE TABLE IF NOT EXISTS tipos_identificacion (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(250) NOT NULL,
  PRIMARY KEY (id));


CREATE TABLE IF NOT EXISTS estados_civil (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));


CREATE TABLE IF NOT EXISTS funcionarios (
  id INT NOT NULL AUTO_INCREMENT,
  numero_identificacion VARCHAR(45) NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  sexo CHAR(5) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  fecha_creacion DATETIME NULL DEFAULT now(),
  fecha_actualizacion DATETIME NULL DEFAULT current_timestamp,
  tipos_identificacion_id INT NOT NULL,
  estados_civil_id INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (tipos_identificacion_id) REFERENCES tipos_identificacion (id),
    FOREIGN KEY (estados_civil_id) REFERENCES estados_civil (id)
);


CREATE TABLE IF NOT EXISTS parentesco (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));


CREATE TABLE IF NOT EXISTS grupo_familiares (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  fecha_creacion DATETIME NULL DEFAULT now(),
  fecha_actualizacion DATETIME NULL DEFAULT current_timestamp,
  funcionarios_id INT NOT NULL,
  parentesco_id INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios (id),
    FOREIGN KEY (parentesco_id) REFERENCES parentesco (id)
);


CREATE TABLE IF NOT EXISTS universidades (
  id INT NOT NULL AUTO_INCREMENT,
  universidadescol VARCHAR(45) NULL,
  PRIMARY KEY (id));


CREATE TABLE IF NOT EXISTS estados_formacion (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));


CREATE TABLE IF NOT EXISTS niveles_educativos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));


CREATE TABLE IF NOT EXISTS formaciones_academica (
  id INT NOT NULL AUTO_INCREMENT,
  nombres VARCHAR(45) NOT NULL,
  funcionarios_id INT NOT NULL,
  universidades_id INT NOT NULL,
  estados_formacion_id INT NOT NULL,
  niveles_educativos_id INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios (id),
    FOREIGN KEY (universidades_id) REFERENCES universidades (id),
    FOREIGN KEY (estados_formacion_id) REFERENCES estados_formacion (id),
    FOREIGN KEY (niveles_educativos_id) REFERENCES niveles_educativos (id)
   );

/*
TODO: hacer el resto de tablas
*/

/*
POPULATION (llenado) DE TABLAS
*/
-- llenado tabla tipos de identificación
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('CC', 'Cédula de ciudadanía');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('TI', 'Tarjeta de identidad');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('CE', 'Tarjeta de extranjería');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('PS', 'Pasaporte');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('OT', 'Otro documento de identificación');

-- llenado tabla estados civiles
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('SOL', 'Solterito y a la orden');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('CAS', 'Casado y no a la orden');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('ULB', 'En Unión libre');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('VAC', 'Vacilando con la muchacha de al lado');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('OTR', 'Otro estado civil');

-- llenado de tabla funcionario: se hace por la APP de Java
INSERT INTO funcionarios(
    numero_identificacion,
    nombres,
    apellidos,
    sexo,
    direccion,
    telefono,
    fecha_nacimiento,
    tipos_identificacion_id,
    estados_civil_id
) 
VALUES ('111111', 'Julio', 'Martinez', 'M', 'Calle 20',
'603522222', '1985-08-05', 1, 2);



-- llenado tabla estados formacion
INSERT INTO estados_formacion(nombre) 
VALUES ('En Progreso');
INSERT INTO estados_formacion(nombre) 
VALUES ('Terminado');


-- llenado tabla niveles_educativos
INSERT INTO niveles_educativos(nombre) 
VALUES ('Profesional');
INSERT INTO niveles_educativos(nombre) 
VALUES ('Tecnico');
INSERT INTO niveles_educativos(nombre) 
VALUES ('Tecnologo');


-- llenado tabla universidades
INSERT INTO universidades(universidadescol) 
VALUES ('IU Digital De Antioquia');
INSERT INTO universidades(universidadescol) 
VALUES ('Universidad De La Sabana');
INSERT INTO universidades(universidadescol) 
VALUES ('Universidad Catolica');

-- llenado de tabla formaciones_academica
INSERT INTO formaciones_academica(
    nombres,
    funcionarios_id,
    estados_formacion_id,
    niveles_educativos_id,
    universidades_id
) 
VALUES ('Administrador', 1, 2, 1, 1);

INSERT INTO formaciones_academica(
    nombres,
    funcionarios_id,
    estados_formacion_id,
    niveles_educativos_id,
    universidades_id
) 
VALUES ('Filosofo', 1, 1, 1, 2);


-- llenado tabla parentesco
INSERT INTO parentesco(nombre,descripcion) 
VALUES ('Hijo','');
INSERT INTO parentesco(nombre,descripcion) 
VALUES ('Hermano','');
INSERT INTO parentesco(nombre,descripcion)  
VALUES ('Conyuge','');

-- llenado de tabla grupo_familiares
INSERT INTO grupo_familiares(
    nombre,
    apellido,
    direccion,
    funcionarios_id,
    parentesco_id
) 
VALUES ('Carlos','Lopez', 'Cra 12 #12-23', 1, 1);

INSERT INTO grupo_familiares(
    nombre,
    apellido,
    direccion,
    funcionarios_id,
    parentesco_id
) 
VALUES ('Claudia','Garzon', 'Cra 12 #12-23', 1, 3);