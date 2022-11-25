/*Indicar el repartidor o repartidores con más órdenes completadas.*/

create function f_max_cantidad_ordenes_por_Repartidor()
   returns table
    return (select nombreRepartidor, count(O.idRepartidor) Total
from Repartidor R
   join Orden O on R.idRepartidor = O.idRepartidor
group by nombreRepartidor)

select nombreRepartidor, Total from dbo.f_max_cantidad_ordenes_por_Repartidor()
where Total = (select max(Total) from dbo.f_max_cantidad_ordenes_por_Repartidor())