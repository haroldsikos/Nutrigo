/*Listar los nombres de los clientes que son de Lima metropolitana*/

select nombreConsumidor
from UsuarioConsumidor UC
   join Localizacion L on UC.idLocalizacion = L.idLocalizacion
where region = 'Lima metropolitana'