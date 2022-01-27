--Parte 1: Creación, inserciones, modificaciones y eliminaciones en la tabla “Posts”

--1. Crea un usuario con nombre “Posts”
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER "Posts" IDENTIFIED BY "1234";
GRANT ALL PRIVILEGES TO "Posts";

--2. Crea tabla “post”, con atributos id, nombre de usuario, fecha de creación, contenido y descripción
CREATE TABLE posts
(
id NUMBER,
nombre_de_usuario VARCHAR2(25),
fecha_de_creación DATE,
contenido VARCHAR2(150),
descripción VARCHAR2(250),
PRIMARY KEY (id)
);

--3. Inserta 3 post (2 para el usuario "Pamela" y 1 para "Carlos")
INSERT INTO Posts(id, nombre_de_usuario, fecha_de_creación, contenido, descripción)
VALUES(001,'Pamela',TO_DATE('2022-01-25', 'yyyy-mm-dd'),'1er posts', 'Blablablabla blablabla blaaabla!');
INSERT INTO Posts(id, nombre_de_usuario, fecha_de_creación, contenido, descripción)
VALUES(002,'Pamela',TO_DATE('2022-01-25', 'yyyy-mm-dd'),'2do posts', 'Blablablabla blablabla blaaabla!2');
INSERT INTO Posts(id, nombre_de_usuario, fecha_de_creación, contenido, descripción)
VALUES(003,'Carlos',TO_DATE('2022-01-25', 'yyyy-mm-dd'),'3ro posts', 'Blablablabla blablabla blaaabla!3');

--4. Modifica tabla post, agregando columna título
ALTER TABLE
posts
ADD
título VARCHAR2(25);

--5. Agregas títulos a las publicaciones ya ingresadas
UPDATE Posts SET título='Título 1' WHERE id=001;
UPDATE Posts SET título='Título 2' WHERE id=002;
UPDATE Posts SET título='Título 3' WHERE id=003;

--6. Inserta 2 post para el usuario "Pedro"
INSERT INTO Posts(id, nombre_de_usuario, fecha_de_creación, contenido,descripción, título)
VALUES(004,'Pedro',TO_DATE('2022-01-25', 'yyyy-mm-dd'),'4to posts', 'Blablablabla blablabla blaaabla!4', 'Título 4');
INSERT INTO Posts(id, nombre_de_usuario, fecha_de_creación, contenido,descripción, título)
VALUES(005,'Pedro',TO_DATE('2022-01-25', 'yyyy-mm-dd'),'5to posts', 'Blablablabla blablabla blaaabla!5', 'Título 5');

--7. Elimina el post de Carlos
DELETE FROM Posts WHERE nombre_de_usuario='Carlos';

--8. Ingresa nuevo post para el usuario "Carlos"
INSERT INTO Posts(id, nombre_de_usuario, fecha_de_creación, contenido, descripción, título)
VALUES(006,'Carlos',TO_DATE('2022-01-25', 'yyyy-mm-dd'),'6to posts', 'Blablablabla blablabla blaaabla!6', 'Título 6');


--Parte 2: Creación e inserciones en la tabla “comentarios”
--1. Crea nueva tabla “comentarios”, 
--con atributos id, fecha, hora de creación y contenido (relacionada con la tabla posts)
CREATE TABLE comentarios
(
id NUMBER,
fecha DATE,
hora_de_creación VARCHAR2(8),
contenido VARCHAR2(150),
FOREIGN KEY (id) REFERENCES Posts (id)
);

--2. Crea 2 comentarios para el post de "Pamela" y 4 para "Carlos"
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(001, TO_DATE('2022-01-25', 'yyyy-mm-dd'), '12:30', 'Comentario 1 para 1er Posts de Pamela');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(002, TO_DATE('2022-01-25', 'yyyy-mm-dd'), '12:30', 'Comentario 2 para 2do Posts de Pamela');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(006, TO_DATE('2022-01-25', 'yyyy-mm-dd'), '12:30', 'Comentario 1 para el Posts de Carlos');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(006, TO_DATE('2022-01-25', 'yyyy-mm-dd'), '12:30', 'Comentario 2 para el Posts de Carlos');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(006, TO_DATE('2022-01-25', 'yyyy-mm-dd'), '12:30', 'Comentario 3 para el Posts de Carlos');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(006, TO_DATE('2022-01-25', 'yyyy-mm-dd'), '12:30', 'Comentario 4 para el Posts de Carlos');

--3. Crea nuevo post para "Margarita"
INSERT INTO Posts(id, nombre_de_usuario, fecha_de_creación, contenido, descripción, título)
VALUES(007,'Margarita',TO_DATE('2022-01-26', 'yyyy-mm-dd'),'7mo posts', 'Blablablabla blablabla blaaabla!7', 'Título 7');

--4. Ingresa 5 comentarios para el post de Margarita
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(007, TO_DATE('2022-01-26', 'yyyy-mm-dd'), '18:15', 'Comentario 1 para el Posts de Margarita');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(007, TO_DATE('2022-01-26', 'yyyy-mm-dd'), '18:20', 'Comentario 2 para el Posts de Margarita');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(007, TO_DATE('2022-01-26', 'yyyy-mm-dd'), '18:25', 'Comentario 3 para el Posts de Margarita');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(007, TO_DATE('2022-01-26', 'yyyy-mm-dd'), '18:30', 'Comentario 4 para el Posts de Margarita');
INSERT INTO comentarios(id, fecha, hora_de_creación, contenido)
VALUES(007, TO_DATE('2022-01-26', 'yyyy-mm-dd'), '18:30', 'Comentario 5 para el Posts de Margarita');

SELECT * FROM posts;
SELECT * FROM comentarios;