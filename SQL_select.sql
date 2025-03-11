-- consultas 

-- Encuentra el cliente que ha realizado la mayor cantidad de alquileres en los últimos 6 meses.
select e.nombre
from alquiler a
join left cliente e on e.ID = a.id_cliente 
where id_cliente 

-- 2. Lista las cinco películas más alquiladas durante el último año.
SELECT 
from alquiler a 

-- 3 Obtén el total de ingresos y la cantidad de alquileres realizados por cada categoría de película.
select count(total), count(a.ID)
from pago p
join alquiler a = a.ID =  p.id_alquiler


-- 4. Calcula el número total de clientes que han realizado alquileres por cada idioma disponible en un mes específico.
select 
from inventario a 
join pelicula p on p.ID = a.id_pelicula 

-- 17 Encuentra el cliente que ha realizado el alquiler más caro en el último año.
select id_cliente, p.total as alquiler
from alquiler a
join pago p on a.ID = p.id_alquiler 
group by id_cliente
order by alquiler desc  
limit 1;
