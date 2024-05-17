create database mapa;

use mapa;

-- TABLA USUARIO
-- ------------------------
create table usuario (
   id_user int auto_increment,
   nombre varchar(20) not null,
   apellido varchar(20) not null,
   fecha_nac date not null,
   PRIMARY KEY (id_user)
);

-- TABLA NEGOCIO
-- ------------------------
create table negocio (
   id_negocio int auto_increment,
   id_user int not null,
   id_direccion int not null,
   PRIMARY KEY (id_negocio)
);

-- TABLA PUBLICIDAD
-- ------------------------
create table publicidad (
   id_publicidad int auto_increment,
   id_negocio int not null,
   id_direccion int not null,
   PRIMARY KEY (id_publicidad)
);

-- TABLA DIRECCION
-- ------------------------
create table direccion (
   id_direccion int auto_increment,
   pais varchar(70) not null,
   ciudad varchar(70) not null,
   barrio varchar(70) not null,
   calle varchar(70) not null,
   numero_domicilio int not null,
   PRIMARY KEY (id_direccion)
);

-- TABLA LUGARES
-- ------------------------ esta tabla se habilitará más adelante en el curso junto con otras tablas
-- create table lugares (
--    nombre_pais varchar(100) not null,
--    nombre_ciudad varchar(100) not null,
--    id_pais int not null,
--    id_ciudad int not null,
--    id_barrio int not null,
--    id_calle int not null,
--    id_numero_domicilio int not null
-- );

-- TABLA COMUNIDAD
-- ------------------------
create table comunidad (
   id_user int not null,
   id_notas int not null,
   id_negocio int not null
);

-- TABLA CONTRIBUCIONES
-- ------------------------
create table contribuciones (
   id_notas int auto_increment,
   id_review int not null,
   id_user int not null,
   PRIMARY KEY (id_notas)
);

-- ------------------------- FOREIGN KEY ----------------------
-- ------------------------- FOREIGN KEY ----------------------

-- NEGOCIO / USUARIO
ALTER table negocio ADD CONSTRAINT FKnegocio_usuario FOREIGN KEY (id_user) REFERENCES usuario (id_user);

-- NEGOCIO / DIRECCION
ALTER table negocio ADD CONSTRAINT FKnegocio_direccion FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);

-- PUBLICIDAD / NEGOCIO
ALTER table publicidad ADD CONSTRAINT FKpublicidad_negocio FOREIGN KEY (id_negocio) REFERENCES negocio (id_negocio);

-- PUBLICIDAD / DIRECCION
ALTER table publicidad ADD CONSTRAINT FKpublicidad_direccion FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);

-- COMUNIDAD / USUARIO
ALTER table comunidad ADD CONSTRAINT FKcomunidad_usuario FOREIGN KEY (id_user) REFERENCES usuario (id_user);

-- COMUNIDAD / CONTRIBUCIONES
ALTER table comunidad ADD CONSTRAINT FKcomunidad_contribuciones FOREIGN KEY (id_notas) REFERENCES contribuciones (id_notas);

-- COMUNIDAD / NEGOCIO
ALTER table comunidad ADD CONSTRAINT FKcomunidad_negocio FOREIGN KEY (id_negocio) REFERENCES negocio (id_negocio);

-- CONTRIBUCIONES / USUARIO
ALTER table contribuciones ADD CONSTRAINT FKcontribuciones_usuario FOREIGN KEY (id_user) REFERENCES usuario (id_user);

-- ------------------------- VALORES ----------------------
-- ------------------------- VALORES ----------------------
--
-- insert into lugares values ('Argentina', 'Buenos Aires', null, null, null, null, null, null)