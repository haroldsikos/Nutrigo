/*Función que indica el producto y sus calorias respectivamente*/

create function f_valor_calorias_por_producto()
returns table
return
select nombreProducto,calorias
from Producto P
join ValorNutricional V on P.idValorNutricional=V.idValorNutricional
group by nombreProducto,calorias;
select nombreProducto,calorias from dbo.f_valor_calorias_por_producto()
