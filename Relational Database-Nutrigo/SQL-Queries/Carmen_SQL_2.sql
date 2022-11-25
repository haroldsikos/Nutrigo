/*Crear una función que liste el nombre de los clientes y el nombre de los productos adquiridos y la cantidad de cada producto*/



create function f_lista_de_productos_por_cliente()
   returns table
return
select nombreConsumidor, nombreProducto, sum(cantidadProducto) [Cantidad de productos]
           from UsuarioConsumidor UC
              join Orden O on UC.idConsumidor = O.idConsumidor
               join OrdenDetalles OD on O.idOrden = OD.idOrden
               join Producto P on OD.idProducto = P.idProducto
           group by nombreConsumidor, nombreProducto;

select * from f_lista_de_productos_por_cliente()