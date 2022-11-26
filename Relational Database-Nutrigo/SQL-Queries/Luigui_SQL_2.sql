/*Función que indica  la lista de repartidores y el transporte utilizado por estos.*/

create function lista_repartidor_por_vehiculo () 
returns table
  return
     select nombreRepartidor, tipoTransporte
     from Repartidor R
     join Transporte T on  R.idTransporte=T.idTransporte
     group by nombreRepartidor, tipoTransporte;

select nombreRepartidor, tipoTransporte from dbo.lista_repartidor_por_vehiculo()
