/*Mostrar el descuento total de cada orden según su ID y además el costo total de la misma orden.*/

select O.idOrden, sum(precioTotal) Costo_total_por_orden, sum(descuento) Cantidad_total_descuento
from Orden O
  join OrdenDetalles OD on O.idOrden = OD.idOrden
group by O.idOrden