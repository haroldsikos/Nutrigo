/*Mostrar el costo total de cada orden realizada según id*/

create function f_Costo_total_por_orden()
  returns table
return
select  OrdenDetalles.idOrden, sum(precioTotal) Costo_total_por_orden
          from OrdenDetalles join Orden O on OrdenDetalles.idOrden = O.idOrden
           group by  OrdenDetalles.idOrden

select * from f_Costo_total_por_orden()