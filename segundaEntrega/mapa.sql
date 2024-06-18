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

-- TABLA NUEVO USUARIO
-- ------------------------
create table new_usuario (
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

-- TABLA COMUNIDAD
-- ------------------------
create table comunidad (
   id_user int not null,
   id_notas int not null,
   id_negocio int not null,
   id_lugar int not null,
   notas varchar(400)
);

-- TABLA NOTAS
-- ------------------------
create table notas (
   id_notas int auto_increment,
   nota text not null,
   id_user int not null,
   -- id_contribucion int not null,
   PRIMARY KEY (id_notas)
);

-- TABLA REVIEW
-- ------------------------
create table review (
   id_review int auto_increment,
   review varchar(400),
   id_user int not null,
   PRIMARY KEY (id_review)
);

-- TABLA CONTRIBUCIONES
-- ------------------------
create table contribuciones (
   id_contribucion int auto_increment,
   id_notas int not null,
   id_review int not null,
   id_user int not null,
   PRIMARY KEY (id_contribucion)
);

-- TABLA PAIS
-- ------------------------
create table pais (
   id_pais int auto_increment,
   nombre_pais varchar(100) not null,
   PRIMARY KEY (id_pais)
);

-- TABLA NUEVO PAIS
-- ------------------------
create table new_pais (
   id_pais int auto_increment,
   nombre_pais varchar(100) not null,
   PRIMARY KEY (id_pais)
);

-- TABLA CIUDAD
-- ------------------------
create table ciudad (
   id_ciudad int auto_increment,
   nombre_ciudad varchar(100) not null,
   PRIMARY KEY (id_ciudad)
);

-- TABLA BARRIO
-- ------------------------
create table barrio (
   id_barrio int auto_increment,
   nombre_barrio varchar(100) not null,
   PRIMARY KEY (id_barrio)
);

-- TABLA CALLE
-- ------------------------
create table calle (
   id_calle int auto_increment,
   nombre_calle varchar(100) not null,
   PRIMARY KEY (id_calle)
);

-- TABLA NÚMERO DE DOMICILIO
-- ------------------------
create table numero_domicilio (
   id_numero_domicilio int auto_increment,
   PRIMARY KEY (id_numero_domicilio)
);

-- TABLA LUGARES
-- ------------------------
create table lugares (
   id_lugar int auto_increment,
   nombre_lugar varchar(100) not null,
   nombre_pais varchar(100) not null,
   nombre_ciudad varchar(100) not null,
   nombre_barrio varchar(100) not null,
   nombre_calle varchar(100) not null,
   id_pais int not null,
   id_ciudad int not null,
   id_barrio int not null,
   id_calle int not null,
   id_numero_domicilio int,
   PRIMARY KEY (id_lugar)
);

-- TABLA NUEVOS LUGARES
-- ------------------------
create table new_lugares (
   id_lugar int auto_increment,
   nombre_lugar varchar(100) not null,
   nombre_pais varchar(100) not null,
   nombre_ciudad varchar(100) not null,
   nombre_barrio varchar(100) not null,
   nombre_calle varchar(100) not null,
   id_pais int not null,
   id_ciudad int not null,
   id_barrio int not null,
   id_calle int not null,
   id_numero_domicilio int,
   PRIMARY KEY (id_lugar)
);


-- ------------------------- FOREIGN KEY ----------------------
-- ------------------------- FOREIGN KEY ----------------------

-- NEGOCIO / USUARIO
ALTER table negocio ADD CONSTRAINT FKnegocio_usuario FOREIGN KEY (id_user) REFERENCES usuario (id_user);

-- NEGOCIO / NEW USUARIO
ALTER table negocio ADD CONSTRAINT FKnegocio_new_usuario FOREIGN KEY (id_user) REFERENCES new_usuario (id_user);

-- NEGOCIO / DIRECCION
ALTER table negocio ADD CONSTRAINT FKnegocio_direccion FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);

-- PUBLICIDAD / NEGOCIO
ALTER table publicidad ADD CONSTRAINT FKpublicidad_negocio FOREIGN KEY (id_negocio) REFERENCES negocio (id_negocio);

-- PUBLICIDAD / DIRECCION
ALTER table publicidad ADD CONSTRAINT FKpublicidad_direccion FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion);

-- COMUNIDAD / USUARIO
ALTER table comunidad ADD CONSTRAINT FKcomunidad_usuario FOREIGN KEY (id_user) REFERENCES usuario (id_user);

-- COMUNIDAD / NOTAS
ALTER table comunidad ADD CONSTRAINT FKcomunidad_notas FOREIGN KEY (id_notas) REFERENCES notas (id_notas);

-- COMUNIDAD / NEGOCIO
ALTER table comunidad ADD CONSTRAINT FKcomunidad_negocio FOREIGN KEY (id_negocio) REFERENCES negocio (id_negocio);

-- COMUNIDAD / LUGARES
ALTER table comunidad ADD CONSTRAINT FKcomunidad_lugares FOREIGN KEY (id_lugar) REFERENCES lugares (id_lugar);

-- CONTRIBUCIONES / USUARIO
ALTER table contribuciones ADD CONSTRAINT FKcontribuciones_usuario FOREIGN KEY (id_user) REFERENCES usuario (id_user);

-- LUGARES / PAIS
ALTER table lugares ADD CONSTRAINT FKlugares_pais FOREIGN KEY (id_pais) REFERENCES pais (id_pais);

-- LUGARES / CIUDAD
ALTER table lugares ADD CONSTRAINT FKlugares_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad);

-- LUGARES / BARRIO
ALTER table lugares ADD CONSTRAINT FKlugares_barrio FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio);

-- LUGARES / CALLE
ALTER table lugares ADD CONSTRAINT FKlugares_calle FOREIGN KEY (id_calle) REFERENCES calle (id_calle);

-- LUGARES / NÚMERO DE DOMICILIO
ALTER table lugares ADD CONSTRAINT FKlugares_numeroDomicilio FOREIGN KEY (id_numero_domicilio)
            REFERENCES numero_domicilio (id_numero_domicilio);

-- ------------------------- VALORES ----------------------
-- ------------------------- VALORES ----------------------

-- INSERT USUARIOS
insert into usuario values (null, 'Abigail', 'Gómez', '2010-7-25'), (null, 'Samuel', 'Martinez', '1998-8-5'),
                           (null, 'Mayra', 'Ayala', '1989-8-25'), (null, 'William', 'Lozano', '1983-9-14'),
                           (null, 'Anna', 'Milanesa', '1998-5-6'), (null, 'Leyla', 'Ramirez', '1950-8-7'),
                           (null, 'Samira', 'Ortiz', '1987-1-20');

-- INSERT NOTAS
insert into notas values (null, 'Alguien recomienda algun lugar?', 7), (null, 'No encuentro una buena bicicletería', 1),
                         (null, 'accidente en la panamericana', 4), (null, 'Solo hay dos plazas en este pueblo', 10),
                         (null, 'Muchos edificios que tapan la belleza del lugar', 2), (null, 'Algun lugar para comer milanesas en rio negro?', 3),
                         (null, 'Alguien por Barrio Obrero?', 14);

-- INSERT PAISES
insert into pais values (null, 'Argentina'), (null, 'Paraguay'), (null, 'Brasil'), (null, 'Uruguay'),
                        (null, 'Bolivia'), (null, 'Chile'), (null, 'Peru');

-- INSERT CIUDADES
insert into ciudad values (null, 'Buenos Aires'), (null, 'Asunción'), (null, 'Brasilia'), (null, 'Montevideo'),
                          (null, 'Sucre'), (null, 'Santiago'), (null, 'Lima');

-- INSERT BARRIOS
insert into barrio values (null, 'Don Orione'), (null, 'Barrio Obrero'), (null, 'almagro'), (null, 'belgrano'),
                          (null, 'constitución'), (null, 'Claypole'), (null, 'Retiro');

-- INSERT CALLES
insert into calle values (null, '9 de julio'), (null, '22'), (null, 'Brasil'), (null, 'Venezuela'),
                         (null, 'monteverde'),(null, 'lacalle'),  (null, 'Eva Perón');

-- INSERT LUGARES
insert into lugares values (null, 'Hamburguesas', 'Argentina', 'Buenos Aires', 'Don Orione', 'Monteverde', (select id_pais from pais where nombre_pais = 'Argentina'), (select id_ciudad from ciudad where nombre_ciudad = 'Buenos Aires'), (select id_barrio from barrio where nombre_barrio = 'Don Orione'), (select id_calle from calle where nombre_calle = 'Eva Perón'), null),
                           (null, 'Bicicletas', 'Argentina', 'Buenos Aires', 'Don Orione', 'Monteverde', (select id_pais from pais where nombre_pais = 'Argentina'), (select id_ciudad from ciudad where nombre_ciudad = 'Buenos Aires'), (select id_barrio from barrio where nombre_barrio = 'Don Orione'), (select id_calle from calle where nombre_calle = 'Eva Perón'), null),
                           (null, 'Playa', 'Argentina', 'Buenos Aires', 'Don Orione', 'Monteverde', (select id_pais from pais where nombre_pais = 'Argentina'), (select id_ciudad from ciudad where nombre_ciudad = 'Buenos Aires'), (select id_barrio from barrio where nombre_barrio = 'Don Orione'), (select id_calle from calle where nombre_calle = 'Eva Perón'), null),
                           (null, 'Autos', 'Argentina', 'Buenos Aires', 'Don Orione', 'Monteverde', (select id_pais from pais where nombre_pais = 'Argentina'), (select id_ciudad from ciudad where nombre_ciudad = 'Buenos Aires'), (select id_barrio from barrio where nombre_barrio = 'Don Orione'), (select id_calle from calle where nombre_calle = 'Eva Perón'), null),
                           (null, 'Supermercado', 'Argentina', 'Buenos Aires', 'Don Orione', 'Monteverde', (select id_pais from pais where nombre_pais = 'Argentina'), (select id_ciudad from ciudad where nombre_ciudad = 'Buenos Aires'), (select id_barrio from barrio where nombre_barrio = 'Don Orione'), (select id_calle from calle where nombre_calle = 'Eva Perón'), null),
                           (null, 'Hospital', 'Argentina', 'Buenos Aires', 'Don Orione', 'Monteverde', (select id_pais from pais where nombre_pais = 'Argentina'), (select id_ciudad from ciudad where nombre_ciudad = 'Buenos Aires'), (select id_barrio from barrio where nombre_barrio = 'Don Orione'), (select id_calle from calle where nombre_calle = 'Eva Perón'), null),
                           (null, 'Escuela', 'Argentina', 'Buenos Aires', 'Don Orione', 'Monteverde', (select id_pais from pais where nombre_pais = 'Argentina'), (select id_ciudad from ciudad where nombre_ciudad = 'Buenos Aires'), (select id_barrio from barrio where nombre_barrio = 'Don Orione'), (select id_calle from calle where nombre_calle = 'Eva Perón'), null);

-- ------------------------- VIEWS ----------------------
-- ------------------------- VIEWS ----------------------

-- DEVUELVE LOS DATOS PERSONALES DE USUARIOS 
-- --------------------------- I
create VIEW user_dato as (select nombre, apellido, fecha_nac from usuario);

-- DEVUELVE EL NOMBRE DE LOS LUGARES + EL PAIS Y CIUDAD AL QUE PERTENECE
-- --------------------------- II
create VIEW lugar as (select nombre_lugar, nombre_pais, nombre_ciudad from lugares);

-- DEVUELVE EL NOMBRE DE LOS USUARIOS QUE CONTRIBUYERÓN
-- --------------------------- III
create VIEW contribution_view as (select nombre, apellido from usuario where id_user in (select id_user from notas));

-- ------------------------- FUNCIONES ----------------------
-- ------------------------- FUNCIONES ----------------------

-- DEVUELVE LA CANTIDAD DE LUGARES CON EL MISMO NOMBRE
-- --------------------------- I
delimiter $$
create function getLugares(lugar char(200))
returns integer
deterministic
begin 
     declare resultado int;
     set resultado = (select count(nombre_lugar) from lugares where nombre_lugar like lugar);
     return resultado;
end$$

-- DEVUELVE EL NOMBRE DEL USUARIO
-- --------------------------- II
delimiter $$
create function getUser_nombre(userId int)
returns text
deterministic
begin 
     declare nombreCompleto char(100);
     declare resultado text;
     set nombreCompleto = (select concat(nombre, ' ', apellido) from usuario where id_user like userId);
     set resultado = nombreCompleto;
     return resultado;
end$$

-- DEVUELVE EDAD DEL USUARIO
-- --------------------------- III
delimiter $$
create function user_edad(nombre_user char(70))
returns int
deterministic
begin
      declare nacimiento date;
      declare res int;
      set nacimiento = (select fecha_nac from usuario where nombre like nombre_user);
      set res = year(curdate()) - year(nacimiento);
      if (month(curdate()) < month(nacimiento)) or (month(curdate()) = month(nacimiento) and day(curdate()) < day(nacimiento))
      then set res = res - 1;
	   end if;
	   return res;
end$$

-- DEVUELVE EL NOMBRE DEL USUARIO SU CONTRIBUCIÓN
-- --------------------------- IV
delimiter $$
create function userContribution(nombre_user char(70))
returns text
deterministic
begin 
     declare comienzo text;
     declare getNombre char(100);
     declare contribucion text;
     declare res text;
     set comienzo = (select id_user from usuario where id_user like nombre_user);
     set getNombre = (select concat(nombre, ' ', apellido) as nombre_completo from usuario where id_user like comienzo);
     set contribucion = (select nota as 'contribuciones' from notas where id_user like comienzo);
     set res = concat(getNombre, ': ', contribucion);
     return res;
end$$

-- ------------------------- STORED PROCEDURES ----------------------
-- ------------------------- STORED PROCEDURES ----------------------

-- DEVUELVE AL USUARIO QUE COINCIDE CON EL NOMBRE REQUERIDO
-- --------------------------- I
delimiter $$
create procedure get_user(in user_name char(100), in user_last char(100))
begin
   select * from usuario where nombre like user_name and apellido like user_last;
end$$
delimiter ;

-- DEVUELVE EL PAIS AL QUE PERTENECE EL NÚMERO DE ID
-- --------------------------- II
delimiter $$
create procedure get_pais(in paisId int)
begin
   select nombre_pais from pais where id_pais like paisId;
end$$
delimiter ;

-- DEVUELVE AL LUGAR REQUERIDO
-- --------------------------- III
delimiter $$
create procedure get_lugares(in pais char(100))
begin
   select nombre_lugar, nombre_pais, nombre_ciudad, nombre_barrio from lugares where nombre_pais like pais;
end$$
delimiter ;

-- ------------------------- TRIGGERS ----------------------
-- ------------------------- TRIGGERS ----------------------

-- NUEVOS REGISTROS PARA LA TABLA USUARIO
-- --------------------------- I
create trigger `usuario_tr`
after insert on `usuario`
for each row
insert into new_usuario (id_user, nombre, apellido, fecha_nac)
values (new.id_user, new.nombre, new.apellido, new.fecha_nac);

insert into usuario (id_user, nombre, apellido, fecha_nac) values (null, 'Susan', 'Michael', '1998-8-5'),
                                                                  (null, 'Alex', 'Ramirez', '1998-8-5'),
                                                                  (null, 'María', 'Sosa', '1998-8-5'),
                                                                  (null, 'Joaquin', 'Bruno', '1998-8-5'),
                                                                  (null, 'Eduardo', 'Acosta', '1998-8-5'),
                                                                  (null, 'Patricia', 'Sanchez', '1998-8-5'),
                                                                  (null, 'Jazmin', 'Alcaraz', '1998-8-5');

-- NUEVOS REGISTROS PARA LA TABLA PAISES
-- --------------------------- II
create trigger `pais_tr`
after insert on `pais`
for each row
insert into new_pais (id_pais, nombre_pais)
values (new.id_pais, new.nombre_pais);

insert into pais values (null, 'Venezuela'), (null, 'España'), (null, 'Portugal'), (null, 'Ecuador'),
                        (null, 'Colombia'), (null, 'Cuba'), (null, 'Guatemala');

-- NUEVOS REGISTROS PARA LA TABLA LUGARES
-- --------------------------- III
create trigger `lugares_tr`
after insert on `lugares`
for each row
insert into new_lugares (id_lugar, nombre_lugar, nombre_pais, nombre_ciudad, nombre_barrio, nombre_calle, id_pais, id_ciudad, id_barrio, id_calle, id_numero_domicilio)
values (new.id_lugar, new.nombre_lugar, new.nombre_pais, new.nombre_ciudad, new.nombre_barrio, new.nombre_calle, new.id_pais, new.id_ciudad, new.id_barrio, new.id_calle, new.id_numero_domicilio);

insert into lugares (id_lugar, nombre_lugar, nombre_pais, nombre_ciudad, nombre_barrio, nombre_calle, id_pais, id_ciudad, id_barrio, id_calle, id_numero_domicilio)
             values (null, 'Escuela', 'Paraguay', 'San Lorenzo', 'Villa', 'Calle', (select id_pais from pais where nombre_pais = 'Paraguay'), (select id_ciudad from ciudad where nombre_ciudad = 'Asunción'), (select id_barrio from barrio where nombre_barrio = 'Barrio Obrero'), (select id_calle from calle where nombre_calle = '22'), null),
                    (null, 'Peluquería', 'Paraguay', 'San Lorenzo', 'Villa', 'Calle', (select id_pais from pais where nombre_pais = 'Paraguay'), (select id_ciudad from ciudad where nombre_ciudad = 'Asunción'), (select id_barrio from barrio where nombre_barrio = 'Barrio Obrero'), (select id_calle from calle where nombre_calle = '22'), null),
                    (null, 'Parrilla', 'Paraguay', 'San Lorenzo', 'Villa', 'Calle', (select id_pais from pais where nombre_pais = 'Paraguay'), (select id_ciudad from ciudad where nombre_ciudad = 'Asunción'), (select id_barrio from barrio where nombre_barrio = 'Barrio Obrero'), (select id_calle from calle where nombre_calle = '22'), null),
                    (null, 'Shopping', 'Paraguay', 'San Lorenzo', 'Villa', 'Calle', (select id_pais from pais where nombre_pais = 'Paraguay'), (select id_ciudad from ciudad where nombre_ciudad = 'Asunción'), (select id_barrio from barrio where nombre_barrio = 'Barrio Obrero'), (select id_calle from calle where nombre_calle = '22'), null),
                    (null, 'Supermercado', 'Paraguay', 'San Lorenzo', 'Villa', 'Calle', (select id_pais from pais where nombre_pais = 'Paraguay'), (select id_ciudad from ciudad where nombre_ciudad = 'Asunción'), (select id_barrio from barrio where nombre_barrio = 'Barrio Obrero'), (select id_calle from calle where nombre_calle = '22'), null),
                    (null, 'Parque', 'Paraguay', 'San Lorenzo', 'Villa', 'Calle', (select id_pais from pais where nombre_pais = 'Paraguay'), (select id_ciudad from ciudad where nombre_ciudad = 'Asunción'), (select id_barrio from barrio where nombre_barrio = 'Barrio Obrero'), (select id_calle from calle where nombre_calle = '22'), null),
                    (null, 'Cancha', 'Paraguay', 'San Lorenzo', 'Villa', 'Calle', (select id_pais from pais where nombre_pais = 'Paraguay'), (select id_ciudad from ciudad where nombre_ciudad = 'Asunción'), (select id_barrio from barrio where nombre_barrio = 'Barrio Obrero'), (select id_calle from calle where nombre_calle = '22'), null);


-- ------------------------- RESULTADOS ----------------------
-- ------------------------- RESULTADOS ----------------------

-- ------------------------------------- MUESTRA TODOS LOS VALORES DE LAS TABLAS
-- -------------------------------------

-- select * from usuario;

-- select * from pais;

-- select * from lugares;

-- ------------------------------------- MUESTRA DATOS PARCIALES SEGUN LA NECESIDAD DEL QUE LO BUSCA
-- ------------------------------------- VIEWS

-- select * from user_dato;

-- select * from lugar;

-- select * from contribution_view;

-- ------------------------------------- MUESTRA RESULTADO DE BUSQUEDA
-- ------------------------------------- FUNCIONES

-- select getLugares('escuela');

-- select getUser_nombre(7);

-- select user_edad('anna');

-- select userContribution(1);

-- ------------------------------------- MUESTRA LOS VALORES REQUERIDOS
-- ------------------------------------- STORED PROCEDURES

-- call get_user('Jazmin', 'Alcaraz');

-- call get_pais(7);

-- call get_lugares('Argentina');

-- ------------------------------------- MUESTRA NUEVAS INSERCIONES
-- ------------------------------------- TRIGGERS

-- select * from new_usuario;

-- select * from new_pais;

-- select * from new_lugares;