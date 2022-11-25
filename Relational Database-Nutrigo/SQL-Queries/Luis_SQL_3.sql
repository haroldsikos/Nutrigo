/*Mostrar una lista de los repartidores y la capacidad en el transporte de cada uno respectivamente.*/

create function f_lista_de_repartidores_por_cantidad()
returns table
  return
     select nombreRepartidor, capacidad
     from Repartidor R
     join Transporte T on  R.idTransporte=T.idTransporte
     group by nombreRepartidor, capacidad;

select nombreRepartidor, capacidad from dbo.f_lista_de_repartidores_por_cantidad()