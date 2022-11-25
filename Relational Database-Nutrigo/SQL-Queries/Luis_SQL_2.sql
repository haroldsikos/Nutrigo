/*Función que muestre el nombre empresa que contenga el mayor stock*/

create function f_empresa_por_mayor_stock()
returns table
return
select nombreEmpresa, stock
from UsuarioEmpresa UE
join Producto P on UE.idEmpresa = P.idEmpresa
group by nombreEmpresa, stock;
select nombreEmpresa,stock
from dbo.f_empresa_por_mayor_stock()
where stock=(select max(stock) from dbo.f_empresa_por_mayor_stock())
group by nombreEmpresa, stock;