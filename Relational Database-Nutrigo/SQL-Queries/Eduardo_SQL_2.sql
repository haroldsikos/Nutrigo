
/*Indicar el nombre de la empresa con más categorías diferentes, así como la cantidad de categorías de productos que ofrece.*/

create function f_categoria_por_empresa()
returns table
    return
    select nombreEmpresa,count(nombreCategoria) cantidad
    from UsuarioEmpresa UE
        JOIN Producto P on UE.idEmpresa = P.idEmpresa
        JOIN Categoria C on P.idCategoria = C.idCategoria
    GROUP BY nombreEmpresa;

select nombreEmpresa, cantidad
from dbo.f_categoria_por_empresa()
where cantidad = (select max(cantidad)
                    from dbo.f_categoria_por_empresa())

