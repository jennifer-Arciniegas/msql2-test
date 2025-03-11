-- triggers 
-- ActualizarTotalAlquileresEmpleado: Al registrar un alquiler, actualiza el total de alquileres gestionados por el empleado correspondiente.
delimiter $$
create trigger ActualizarTotalAlquileresEmpleado
after insert on alquiler 
BEGIN 
	update alquiler 
	set 
END$$


delimiter ;
-- 2 . AuditarActualizacionCliente: Cada vez que se modifica un cliente, registra el cambio en una tabla de auditoría.
delimiter $$
drop if exists trigger AuditarActualizacionCliente;
drop  if exists table auditoriaTabla;
create  if not exists table auditoriaTabla(id int auto_increment primary key, usuario varchar(50), accion varchar(20), fecha timestamp default current_timestamp, detalle txt);

create if not exists trigger AuditarActualizacionCliente
after update on cliente 
begin
	insert into auditoriaTabla (usuario, accion, detalle) values
	(user(), "Update", current_timestamp(), "se realizo una actualizacion a un registro en clientes");
end$$

delimiter ; 
-- 3 RegistrarHistorialDeCosto: Guarda el historial de cambios en los costos de alquiler de las películas
delimiter $$
drop if  exists trigger RegistrarHistorialDeCosto;
drop if exists table historialCambios;
create  if not exists table historialCambios(id int auto_increment primary key, usuario varchar(50), accion varchar(20), fecha timestamp default current_timestamp, detalle txt);

create if not exists trigger RegistrarHistorialDeCosto
after update on alquiler;
begin
	insert into historialCambios (usuario, accion, detalle) values 
	(user(), "Update", "se ha actualizado el costo en el alquiler de una pelicula");
end$$

delimiter ;

-- 4 NotificarEliminacionAlquiler: Registra una notificación cuando se elimina un registro de alquiler.
delimiter $$
 drop if  exists trigger NotificarEliminacionAlquiler;
drop if exists table historialEliminados;

create  if not exists table historialEliminados(id int auto_increment primary key, usuario varchar(50), accion varchar(20), fecha timestamp default current_timestamp, detalle txt);

create if not exists trigger NotificarEliminacionAlquiler
 after delete on alquiler;
begin
	insert into historialEliminados  (usuario, accion, detalle) values 
	(user(), "Delete", "se ha eliminado un registro");
end$$

delimiter ;

-- 5 RestringirAlquilerConSaldoPendiente: Evita que un cliente con saldo pendiente pueda realizar nuevos alquileres.

delimiter $$
create if not exists trigger RestringirAlquilerConSaldoPendiente
before insert on alquiler
BEGIN 
	
END$$

delimiter ; 



