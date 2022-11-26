/*Listar los nombres de los productos que pertenecen a la categoría snacks*/

select nombreProducto
from Producto UC
 join Categoria L on UC.idCategoria =L.idCategoria
 where nombreCategoria ='Snacks'
