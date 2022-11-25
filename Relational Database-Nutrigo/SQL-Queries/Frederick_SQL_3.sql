/*Indicar el  o los distritos con más clientes inscritos en nuestra app.*/

create function f_max_clientes_por_distrito() returns table
return
select distrito, count(idConsumidor) as Total
from UsuarioConsumidor UC
   join Localizacion L on UC.idLocalizacion = L.idLocalizacion
group by distrito

select distrito, Total from dbo.f_max_clientes_por_distrito()
       where Total = (select max(Total) from dbo.f_max_clientes_por_distrito())