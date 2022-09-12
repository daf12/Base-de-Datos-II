create database  POLLOS_COPA;

use POLLOS_COPA;

CREATE TABLE cliente
(
 id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
 nombres VARCHAR(50),
 apellidos VARCHAR(50),
 edad INTEGER,
 direccion VARCHAR(100)
);

select  cl.*
from  cliente as cl;

INSERT INTO cliente (nombres, apellidos, edad,  direccion)
  VALUES ('Miguel' ,'Gonzales Veliz', 20, 'Av. 6 de Agosto');
INSERT INTO cliente (nombres, apellidos, edad,  direccion)
  VALUES ('carla' ,'villanueva', 22, 'Av. 6 de Mrzo');
-- crear la consulta que modifique el campo gestion y que asigne
-- el valor 2022


CREATE TABLE pedido
(
  id_pedido INTEGER AUTO_INCREMENT PRIMARY KEY  NOT NULL,
  articulo VARCHAR(100),
  costo VARCHAR(100),
  fecha VARCHAR(100)
);

CREATE TABLE realizar_pedido
(
  id_detalle_pedido INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_cliente INT NOT NULL,
  id_pedido INT NOT NULL,

  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);


INSERT INTO pedido (articulo, costo, fecha)
VALUES('pollo ala cnasta','100','26-agosto');
  INSERT INTO pedido (articulo, costo, fecha) VALUES
('pollo ala diabla','80','12/julio');









create database  tarea_hito2;

use tarea_hito2;

CREATE TABLE estudiantes
(
 id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
 nombres VARCHAR(50),
 apellidos VARCHAR(50),
 edad INTEGER,
 gestion INTEGER,
 fono INTEGER,
 email VARCHAR(100),
 direccion VARCHAR(100),
 sexo VARCHAR(10)
);

select  est.*
from  estudiantes as est;

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino');


CREATE TABLE materias
(
  id_mat INTEGER AUTO_INCREMENT PRIMARY KEY  NOT NULL,
  nombre_mat VARCHAR(100),
  cod_mat VARCHAR(100)
);

CREATE TABLE inscripcion
(
  id_ins INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_est INT NOT NULL,
  id_mat INT NOT NULL,
  semestre VARCHAR(20),
  gestion INTEGER,
  FOREIGN KEY (id_est) REFERENCES estudiantes (id_est),
  FOREIGN KEY (id_mat) REFERENCES materias (id_mat)
);


INSERT INTO materias (nombre_mat, cod_mat) VALUES
('Introduccion a la Arquitectura','ARQ-101'),
 ('Urbanismo y Diseno','ARQ-102'),
 ('Dibujo y Pintura Arquitectonico','ARQ-103'),
 ('Matematica discreta','ARQ-104'),
 ('Fisica Basica','ARQ-105');

INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES
(1, 1, '1er Semestre', 2015),
 (1, 2, '2do Semestre', 2015),
(2, 4, '1er Semestre', 2016),
(2, 3, '2do Semestre', 2016),
(3, 3, '2do Semestre', 2017),
(3, 1, '3er Semestre', 2017),
 (4, 4, '4to Semestre', 2017),
(5, 5, '5to Semestre', 2017);

-- Mostrar los nombres y apellidos de los estudiantes inscritos en la
-- materia ARQ-105, adicionalmente mostrar el nombre de la materia.
CREATE OR REPLACE FUNCTION ComparaMaterias(COD_MAT VARCHAR(50),NOMBRE_MAT VARCHAR(50))
RETURNS BOOLEAN
BEGIN
    DECLARE respuesta BOOLEAN;

        IF COD_MAT=NOMBRE_MAT
        THEN
        SET respuesta=1;
        END IF;
    RETURN respuesta;
END;

SELECT ESTUDIANTES.id_est, ESTUDIANTES.NOMBRES,ESTUDIANTES.APELLIDOS,
       MATERIAS.NOMBRE_MAT,MATERIAS.COD_MAT
FROM inscripcion
INNER JOIN estudiantes ON inscripcion.id_est = estudiantes.id_est
INNER JOIN materias ON inscripcion.id_mat = materias.id_mat

WHERE ComparaMaterias(materias.cod_mat,'ARQ-105');

-- Crear una función que permita obtener el promedio de las edades del género
 -- masculino o femenino de los estudiantes inscritos en la asignatura ARQ-104.
#PREGUNTA 14
CREATE OR REPLACE FUNCTION generoCodigoMateria( GENERO VARCHAR(11),MATERIA_COD VARCHAR(100))
RETURNS INTEGER
BEGIN
    DECLARE PROMEDIO INTEGER DEFAULT 0;

    SELECT AVG(estudiantes.edad) INTO PROMEDIO
    FROM inscripcion
    INNER JOIN estudiantes ON inscripcion.id_est = estudiantes.id_est
    INNER JOIN materias ON inscripcion.id_mat = materias.id_mat
    WHERE estudiantes.sexo= GENERO AND materias.cod_mat=MATERIA_COD;
    RETURN PROMEDIO;
END;

SELECT generoCodigoMateria('femenino','ARQ-104') as promediodeedad;
SELECT generoCodigoMateria('masculino','ARQ-104')as promediodeedad;
-- Crear una función que permita concatenar 3 cadenas.


CREATE OR REPLACE FUNCTION CONCATENAR (par1 VARCHAR(10),par2 VARCHAR(10),par3 VARCHAR(10))
RETURNS VARCHAR(90)
BEGIN
    DECLARE CONCATENA VARCHAR(90) DEFAULT '';
    SET CONCATENA= CONCAT('(',par1,') (',par2,') (',par3,')');

    RETURN CONCATENA ;
END;

SELECT CONCATENAR('PEPITO','PEP','50') AS CONCATENADO_TOTAL;

-- Crear una función de acuerdo a lo siguiente:
-- Mostrar el nombre, apellidos, edad y el semestre de todos los estudiantes que estén inscritos.
-- Siempre y cuando la suma de las edades del sexo femenino(tambien puede ser masculino) sea par y mayores a cierta edad.
-- Debe de crear una función que sume las edades (recibir como parámetro elsexo, y la edad).
-- Ejemplo: sexo=’Masculino’ y edad=22



CREATE OR REPLACE FUNCTION preg16(SEXO VARCHAR(11),EDAD INTEGER)
RETURNS BOOLEAN
BEGIN
    DECLARE SUMA INTEGER DEFAULT 0;
    DECLARE SIoNO BOOLEAN;

    SELECT SUM(ESTUDIANTES.EDAD) INTO SUMA
    FROM estudiantes
    WHERE estudiantes.SEXO=SEXO;

    IF SUMA%2=0 AND SUMA>EDAD
    THEN
        SET SIoNO=1;
    END IF;
    RETURN SIoNO;
END;

SELECT ESTUDIANTES.NOMBRES, ESTUDIANTES.APELLIDOS,ESTUDIANTES.EDAD,INSCRIPCION.SEMESTRE
FROM inscripcion
INNER  JOIN estudiantes ON inscripcion.id_est = estudiantes.id_est
WHERE preg16('MASCULINO',22);

SELECT SUM(EDAD) as sumaEdad
FROM estudiantes
GROUP BY(ESTUDIANTES.SEXO);

-- Crear una función de acuerdo a lo siguiente:
-- Crear una función sobre la tabla estudiantes que compara un nombre y apellidos. (si existe este nombre y apellido mostrar todos los datos del estudiante).


CREATE OR REPLACE FUNCTION COMPARAR(nombre varchar(50),apellidos varchar(50),nombre_c varchar (50),apellido_c varchar(50))

    RETURNS BOOLEAN
    BEGIN
        DECLARE BUSCAR BOOLEAN;
        if nombre=nombre_c and apellidos=apellido_c
        then
        set BUSCAR=1;
        end if;
        RETURN BUSCAR;

    END;


select *
from estudiantes
where  COMPARAR(estudiantes.nombres, estudiantes.apellidos,'Andrea','Arias Ballesteros');
