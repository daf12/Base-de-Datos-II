create database  funcion_de_agregacion;

use funcion_de_agregacion;

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

-- crear la consulta que modifique el campo gestion y que asigne
-- el valor 2022

update  estudiantes
set gestion = '2022'
where id_est > 0;

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

select *
from materias;

-- Mostrar los nombres y apellidos de los estudiantes inscritos en la materia
-- ARQ-104, adicionalmente mostrar el nombre el nombre de la materia.


select est.nombres, est.apellidos, mat.nombre_mat
from inscripcion as ins
inner join estudiantes as est on ins.id_est = est.id_est
inner join materias mat on ins.id_mat = mat.id_mat

where mat.cod_mat= 'ARQ-104';

-- Contar cuantos registros tiene la tabla estudiantes

SELECT COUNT(est.id_est) as 'cantidad de estudiantes'
FROM estudiantes as est;

--  Contar cuántos valores tiene la columna id_est de la tabla estudiantes.
SELECT count(est.id_est)
FROM estudiantes AS est;

-- Mostrar el promedio de edad en la tabla estudiantes.

SELECT AVG(est.edad) as 'promedio de las edades'
FROM estudiantes AS est;

CREATE FUNCTION  suma_edades () returns integer
BEGIN
    RETURN (
        SELECT SUM(est.edad)
        FROM estudiantes as est
        where est.sexo='femenino'
        );
end;
select est.nombres, est.apellidos
from estudiantes as est
where suma_edades()%2=0;

CREATE FUNCTION  suma_edades_masculino () returns integer
BEGIN
    RETURN (
        SELECT SUM(est.edad)
        FROM estudiantes as est
        where est.sexo='masculino'
        );
end;
select est.nombres, est.apellidos
from estudiantes as est
where suma_edades()%2=0;


-- volver parametrizable la anterior funcion


create function SUMA_EDADES_v2(SEXOEST VARCHAR(30))  RETURNS int
    BEGIN
       DECLARE SEXOEST INT DEFAULT 0;

            SELECT SUM(ESS.edad) INTO SEXOEST
             FROM estudiantes AS ESS
             WHERE ESS.sexo= SEXOEST;
             RETURN SEXOEST;

     END;


SELECT nombres,apellidos
    FROM estudiantes AS ES
WHERE SUMA_EDADES_v2('masculino') %2=0;


-- versio2

create function SUMA_EDADES_v2_2(SEXOEST VARCHAR(30))
 RETURNS integer
    BEGIN
        # sirve para declarar una variable en una funcion
       DECLARE SEXOEST INTEGER DEFAULT 0;
            SELECT SUM(ESS.edad) INTO SEXOEST
             FROM estudiantes AS ESS
             WHERE ESS.sexo= SEXOEST;
             RETURN SEXOEST;
     END;

SELECT nombres,apellidos
    FROM estudiantes AS ES
WHERE SUMA_EDADES_v2_2('masculino') %2=0;

create or replace function get_Avg_edad(edadEST integer)
        RETURNS integer
        begin
            DECLARE edadEST integer default 0;
               SELECT Avg(est.edad) INTO edadEST
                   FROM estudiantes AS est
               WHERE  est.edad = edadEST;
             RETURN edadEST
                ;
        end;

select get_Avg_edad();
FROM estudiante as es
where get_avg_edad('femenino')%2=0;

create function get_Avg(sexoest varchar(20))
        RETURNS integer
        begin
            DECLARE EDADES INTEGER DEFAULT 0;
-- real para decimales

                    SELECT Avg(est.edad) INTO EDADES
                   FROM estudiantes AS est
                   WHERE  est.sexo = sexoest;
            return EDADES;

        end;

select get_Avg ('femenino') as sexo;


#Crear una función que permita concatenar dos columnas.
#Concatena el nombre y apellidos de la tabla estudiante.
#El nombre de la función deberá ser getNombreCompleto
#La función deberá recibir 2 parámetros (nombre y apellidos)
select concat('wiliam','barra');

create function getnombrecompleto1(par1 varchar(25), par2 varchar(25))
returns varchar(50)
begin
    declare  concatenado varchar (50)default '';

     set concatenado=concat((par1,'-',par2));
    return concatenado;
    end;

select getnombrecompleto1('pepido','perez');


      #set concatenado='dafnet mamani';


      CREATE OR REPLACE FUNCTION getNombreCompleto(par1 VARCHAR(25), par2 VARCHAR(25))
    RETURNS VARCHAR(50)
BEGIN
    DECLARE concatenado VARCHAR(50) DEFAULT '';

    SET concatenado  = CONCAT('nombres:', par1, ' - ','apellidos:', par2);

    RETURN concatenado;

END;

#SELECT getNombreCompleto('Pepito', 'Pep');
SELECT getNombreCompleto(est.nombres , est.apellidos ) AS Fullname
FROM estudiantes AS est;

 CREATE OR REPLACE FUNCTION getEDADgestion(par1 INTEGER, par2 INTEGER)
    RETURNS VARCHAR(50)
BEGIN
    DECLARE concatenado  VARCHAR(50) DEFAULT 'edad y gestion';

     SET concatenado  = CONCAT('EDAD:', par1, ' - ','GESTION:', par2);

    RETURN concatenado;

END;

SELECT getEDADgestion (est.edad, est.gestion) AS GestionEdad
FROM estudiantes AS est ;

SELECT getNombreCompleto(ES.nombres,ES.apellidos) AS DATOS1, getEDADgestion(ES.gestion,ES.edad) AS DATOS2
FROM estudiantes AS ES;


CREATE OR REPLACE FUNCTION CONCATENADO1(par1 VARCHAR(25), par2 VARCHAR(25),par3 integer , par4 integer)
    RETURNS VARCHAR(100)
BEGIN
    DECLARE concatenado1 VARCHAR(100) DEFAULT '';

    SET concatenado1  = CONCAT('nombres: ', par1, ' - ','apellidos: ', par2,' - ', ' EDAD :', par3, ' - ','GESTION: ', par4);

    RETURN concatenado1;

END;
SELECT CONCATENADO1(ES.nombres,ES.apellidos ,ES.edad,ES.gestion) AS DATOS2
FROM estudiantes AS ES;


select est.nombres, est.apellidos, ins.semestre
from estudiantes est
inner join inscripcion ins on est.id_est = ins.id_est
where ins.gestion = 2015;

select est.nombres, est.apellidos, ins.semestre
from estudiantes est
inner join inscripcion ins on est.id_est = ins.id_est
inner join materias mat on ins.id_mat = mat.id_mat
where ins.gestion = 2015 and mat.cod_mat='ARQ-101';

select est.nombres, est.apellidos, ins.semestre
from estudiantes est
inner join inscripcion ins on est.id_est = ins.id_est
where ins.semestre = '5to semestre';

select est.nombres, est.apellidos, ins.semestre
from estudiantes est
inner join inscripcion ins on est.id_est = ins.id_est
where ins.gestion = 2016 or  2017 ;