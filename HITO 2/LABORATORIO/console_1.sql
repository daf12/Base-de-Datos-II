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



