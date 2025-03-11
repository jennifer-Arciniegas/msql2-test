use sakilacampus;
-- basadas en el diagrama suministrado. 
-- 1. TotalIngresosCliente(ClienteID, Año): Calcula los ingresos generados por un cliente en un año específico.
delimiter $$
create function TotalIngresosCliente(in cliente int, in año year)
returns decimal(10,2);
deterministic 
begin

	declare valor decimal (10,2)
	SELECT sum(total) into valor
	from pago p
	join alquiler a on p.id_alquiler = a.id_alquiler
	where a.id_cliente = cliente and year(fecha_pago) = año;
	return valor;
	
end$$

delimiter ; 
-- 2. PromedioDuracionAlquiler(PeliculaID): Retorna la duración promedio de alquiler de una película específica.
delimiter $$ 
create function (in pelicula int)
returns double 
deterministic
begin
		
	declare promedio double;

	select avg(duracion) into promedio
	from pelicula 
	where id_pelicula = pelicula;
	return promedio;
end$$

delimiter ;

-- 3. IngresosPorCategoria(CategoriaID): Calcula los ingresos totales generados por una categoría específica de películas.
delimiter $$
create function IngresosPorCategoria(in categoria int)
returns decimal(10,2)
begin
	
	declare ingresos decimal(10,2)
	SELECT rental_rate into ingresos
	from pelicula_categoria p
	join pelicula pe on pe.id_pelicula = p.id_pelicula ;
	return ingresos;
end$$

delimiter ;

-- 4. DescuentoFrecuenciaCliente(ClienteID): Calcula un descuento basado en la frecuencia de alquiler del cliente.
delimiter $$
create function DescuentoFrecuenciaCliente(in clienteid int)
returns decimal(2,2);
deterministic
begin
	
	declare contador int

	select count(*) into contador
	from alquiler a
	where id_cliente = clienteid;

	if contador > 10 then
		return 12.5;
	elseif contador  > 20 then
		return 30;
	elseif contador > 50 then
		return  50;
	else
		return 60;
		
	end if
	
	
end$$


delimiter ;
-- 5. EsClienteVIP(ClienteID): Verifica si un cliente es "VIP" basándose en la cantidad de alquileres realizados y los ingresos generados.
delimiter $$
create function EsClienteVIP(in clienteid int)
returns varchar(10);
deterministic
begin
	declare contador int

	select count(*) into contador
	from alquiler a
	where id_cliente = clienteid;

	if contador > 60 then
		return "VIP";
	end if;
end$$

delimiter ; 



