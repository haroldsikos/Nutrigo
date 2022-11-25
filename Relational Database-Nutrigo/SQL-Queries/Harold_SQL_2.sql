/*Cree una función que indique el consumidor o  consumidores con menos órdenes realizadas*/

create function f_MIN_nombreConsumidor_Ordenes()
  returns table
     return
     select nombreConsumidor, count(O.idConsumidor) Total
        from UsuarioConsumidor UC
           join Orden O on UC.idConsumidor = O.idConsumidor
        group by nombreConsumidor;


SELECT nombreConsumidor, Total
from dbo.f_MIN_nombreConsumidor_Ordenes()
where Total = (SELECT MAX(Total) from dbo.f_MIN_nombreConsumidor_Ordenes());