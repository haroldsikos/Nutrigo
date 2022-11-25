/*Crear una función donde se ingrese el nombre de la región destinataria del pedido y retorne la cantidad total de órdenes registradas para dicho destino*/

create function f_ordenes_por_region(@region nvarchar(50)) returns int
begin
   declare @cantidad int
   select @cantidad = sum(cantidadProducto)
   from OrdenDetalles OD
       join Orden O on OD.idOrden = O.idOrden
  	join UsuarioConsumidor UC on O.idConsumidor = UC.idConsumidor
   	join Localizacion L on UC.idLocalizacion = L.idLocalizacion
   where L.region = @region
   return @cantidad
end

print dbo.f_ordenes_por_region('Lima metropolitana')