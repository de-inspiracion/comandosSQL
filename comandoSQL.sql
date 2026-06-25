
/// DDL (Data Definition Language) //////

// Crear una tabla con diferentes tipos de datos y restricciones
CREATE TABLE NOMBRETABLA (
   ID_TABLA_1 NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, // PK autoincrementable
   atributo1 number not null, // atributo es numerico y no puede ser null
   atributo2 varchar2(30) not null,// atributo es texto de largo 30 y no puede ser null
   atributo3 date not null, // // atributo es una fecha y no puede ser null
   atributo4 char(3), // atributo es texto de un largo 3 y puede ser null
   atributo5 varchar2(30) default 'texto por defecto', //texto e inserta un dato por default si no se introduce
   atributo6 timestamp // atributo de tipo fech, minutos y segundos
);

// Crear una tabla con una clave foranea
CREATE TABLE NOMBRETABLA2 (
   ID_TABLA_2 NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, // PK autoincrementable
   ID_TABLA_1 number not null, // atributo es numerico y no puede ser null
   CONSTRAINT fk_nombrefk FOREIGN KEY (ID_TABLA_1) REFERENCES NOMBRETABLA(ID_TABLA_1) // clave foranea
);

// Crear una tabla interna con una clave foranea
CREATE TABLE NOMBRETABLAINTERMEDIA (
    ID_TABLA_1 number,
    ID_TABLA_2 number,
    CONSTRAINT pk_tablas PRIMARY KEY(ID_TABLA_1,ID_TABLA_2), // PK compuesta por dos atributos
    CONSTRAINT fk_tablas FOREIGN KEY(ID_TABLA_1) REFERENCES NOMBRETABLA(ID_TABLA_1), // FK a la tabla 1
    CONSTRAINT fk_tablas2 FOREIGN KEY(ID_TABLA_2) REFERENCES NOMBRETABLA2(ID_TABLA_2) // FK a la tabla 2
);

// renombra una tabla
ALTER TABLE nombreactual RENAME TO nombrenuevo;

// crea una clave foranea
ALTER TABLE nombretabla 
ADD constraint fk_nombrefk foreign key(idtabla) references tablaoriginal(idtablaoriginal)

// agrega una columna
ALTER TABLE nombretabla ADD atributo CHAR(3)

// eliminar una columna
ALTER TABLE nombretabla DROP COLUMN nombrecolumna;

// renombra una columna
ALTER TABLE nombretabla RENAME COLUMN nombrecolumna to nuevonombrecolumna;

// modiifca el tipo de dato de una columna
ALTER TABLE nombretabla MODIFY nombrecolumna varchar2(14)

// modifiy  null constraint
ALTER TABLE nombretabla MODIFY nombrecolumna NULL;
ALTER TABLE nombretabla MODIFY nombrecolumna NOT NULL;

// elimina una tabla
DROP TABLE NOMBRETABLA;

// elimina todos los datos de una tabla
TRUNCATE TABLE NOMBRETABLA;





/////// DML (Data Manipulation Language) ////////

// insertar datos
INSERT INTO NOMBRETABLA (atributo1,atributo2,atributo3,atributo4,atributo5,atributo6) VALUES (1,'hola','2020-01-01','hola','hola','2020-01-01 00:00:00');
INSERT INTO NOMBRETABLA (atributo1,atributo2,atributo3,atributo4,atributo5,atributo6) VALUES (2,'hola','2020-01-01','hola','hola','2020-01-01 00:00:00');

// insert multiple rows
INSERT INTO NOMBRETABLA (atributo1,atributo2,atributo3,atributo4,atributo5,atributo6) 
VALUES (1,'hola','2020-01-01','hola','hola','2020-01-01 00:00:00'),
       (2,'adios','2020-01-02','adios','adios','2020-01-02 00:00:00'),
       (3,'hola','2020-01-03','hola','hola','2020-01-03 00:00:00')  ;

// update
UPDATE NOMBRETABLA SET atributo1 = 3 WHERE atributo1 = 1;

// delete
DELETE FROM NOMBRETABLA WHERE atributo1 = 1;


///// DQL (Data Query Language) //////

//seleccionar datos
SELECT * FROM NOMBRETABLA;

// select con atributos 
SELECT atributo1, atributo2 FROM NOMBRETABLA;

// select con alias
SELECT atributo1 AS nombreatributo1, atributo2 AS nombreatributo2 FROM NOMBRETABLA;


//seleccionar datos con restricciones
SELECT * FROM NOMBRETABLA WHERE atributo1 = 1;
SELECT * FROM NOMBRETABLA WHERE atributo1 = 1 AND atributo2 = 'hola';



// selecct con restricciones
SELECT * FROM NOMBRETABLA, NOMBRETABLA2 WHERE NOMBRETABLA.atributo1 = NOMBRETABLA2.atributo1 AND NOMBRETABLA.atributo2 = 'hola';

// select con inner join
SELECT * FROM NOMBRETABLA INNER JOIN NOMBRETABLA2 ON NOMBRETABLA.atributo1 = NOMBRETABLA2.atributo1;




// select con left join


select * from customers custom inner join countries country on customers.country_id = countries.country_id;

select custom.full_name, countries.name from customers custom inner join countries country on customers.country_id = countries.country_id;

select customers.full_name as nombre_completo, countries.name as pais from customers inner join countries on customers.country_id = countries.country_id;


SELECT * FROM NOMBRETABLA LEFT JOIN NOMBRETABLA2 ON NOMBRETABLA.atributo1 = NOMBRETABLA2.atributo1;

// select con right join
SELECT * FROM NOMBRETABLA RIGHT JOIN NOMBRETABLA2 ON NOMBRETABLA.atributo1 = NOMBRETABLA2.atributo1;

// select con full join
SELECT * FROM NOMBRETABLA FULL JOIN NOMBRETABLA2 ON NOMBRETABLA.atributo1 = NOMBRETABLA2.atributo1;


//seleccionar datos con restricciones y ordenar (DESC)
SELECT * FROM NOMBRETABLA WHERE atributo1 = 1 ORDER BY atributo2 DESC;

//seleccionar datos con restricciones y ordenar y paginar
SELECT * FROM NOMBRETABLA WHERE atributo1 = 1 ORDER BY atributo2 LIMIT 10 OFFSET 10;

//seleccionar datos con restricciones y ordenar y paginar y contar el total de resultados
SELECT COUNT(*) OVER() AS total, * FROM NOMBRETABLA WHERE atributo1 = 1 ORDER BY atributo2 LIMIT 10 OFFSET 10;

// seleccionar datos con restricciones y ordenar y paginar y contar el total de resultados
SELECT COUNT(*) OVER() AS total, * FROM NOMBRETABLA WHERE atributo1 = 1 ORDER BY atributo2 LIMIT 10 OFFSET 10;

// seleccionar datos con restricciones y ordenar y paginar y contar el total de resultados
SELECT SUM(atributo1) OVER() AS total, * FROM NOMBRETABLA WHERE atributo1 = 1 ORDER BY atributo2 LIMIT 10 OFFSET 10;