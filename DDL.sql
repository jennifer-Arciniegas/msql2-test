drop database if exists sakilacampus;
create database sakilacampus;
use sakilacampus;

-- tablas 
CREATE table actor (ID int auto_increment primary key, nombre varchar(45) not null, apellidos varchar(45) not null, ultima_actualizacion timestamp);

create table pais(ID int auto_increment primary key,  nombre varchar(45) not null, ultima_actualizacion timestamp);

 create table ciudad (ID int auto_increment primary key, nombre varchar(50), 
 id_pais int, ultima_actualizacion timestamp, foreign key(id_pais) references pais(ID));
 
create table direccion (ID int auto_increment primary key, direccion varchar(50), 
direccion2 varchar(50), distrito varchar(20) not null, id_ciudad int, codigo_postal varchar(10),
telefono varchar(20), ultima_actualizacion timestamp, foreign key(id_ciudad) references ciudad(ID));

create table empleado (ID int auto_increment primary key, nombre varchar(45) not null, apellidos varchar(45) not null,
id_direccion int, imagen blob, email varchar(50),  id_almacen int, activo tinyint(1), username varchar(16), password varchar(40), 
ultima_actualizacion timestamp, foreign key(id_direccion) references direccion(ID));

create table almacen (ID int auto_increment primary key, id_empleado_jefe int, id_direccion int, ultima_actualizacion timestamp, foreign key(id_empleado_jefe) 
references empleado(ID), foreign key(id_direccion) references direccion(ID));

-- alter table empleado (foreign key(id_almacen) references almacen(ID));
create table cliente (ID int auto_increment primary key, id_almacen int, nombre varchar(45), apellidos varchar(45),
email varchar(50), id_direccion int, activo tinyint(1), fecha_declaracion datetime, fecha_actualizacion timestamp,
foreign key (id_direccion) references direccion(ID));

create table idioma (ID int auto_increment primary key, nombre varchar(20), fecha_actualizacion timestamp);

create table pelicula(ID int auto_increment primary key, titulo varchar(225), descripcion text, anyo_lanzamiento year, id_idioma int, 
id_idioma_original int, duracion_alquiler decimal, rental_rate decimal(4,2), duracion int, remplacement_cost decimal(5,2),
clasificacion enum("G", "PG", "PG-13", "R", "NC-17"), 
caracteristicas_especiales set("Trailers", "Commentaries", "Deleted Scenes", "Behind the Scenes"), ultima_actualizacion timestamp, 
foreign key(id_idioma) references idioma(ID), foreign key(id_idioma_original) references idioma(ID));

create table inventario (ID int auto_increment primary key, id_pelicula int, id_almacen int, ultima_actualizacion timestamp ,
foreign key(id_pelicula) references pelicula(ID), foreign key(id_almacen) references almacen(ID));
 
create table alquiler(ID int auto_increment primary key, fecha_alquiler datetime, id_inventario int,
id_cliente int, fecha_devolucion datetime, id_empleado int, ultima_actualizacion timestamp,
foreign key (id_cliente) references cliente(ID), foreign key (id_inventario) references inventario(ID), foreign key(id_empleado) references empleado(ID));

create table pago (ID int auto_increment primary key, id_cliente int, id_empleado int, id_alquiler int, total decimal(5,2), fecha_pago datetime, 
ultima_actualizacion timestamp, foreign key(id_cliente) references cliente(ID), foreign key (id_empleado) references empleado(ID),
foreign key(id_alquiler) references alquiler(ID));

create table pelicula_actor (ID int auto_increment primary key, id_actor int, id_pelicula int, foreign key(id_actor) references actor(ID),
foreign key(id_pelicula) references pelicula(ID) );

create table categoria (ID int auto_increment primary key, nombre varchar(25), ultima_actualizacion timestamp);

create table pelicula_categoria(ID int auto_increment primary key, id_pelicula int, id_categoria int, foreign key(id_pelicula) references pelicula(ID),
foreign key(id_categoria) references categoria(ID));

