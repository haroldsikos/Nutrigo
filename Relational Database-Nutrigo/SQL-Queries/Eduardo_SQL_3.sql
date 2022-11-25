/*Listar los nombres de las empresas de mayor a menor según la cantidad de productos vendidos por cada una de ellas.*/

create function f_ventas_por_empresa()
returns table
    return
    select nombreEmpresa,sum(cantidadProducto) cantidad
    from UsuarioEmpresa UE
        join Producto P on UE.idEmpresa = P.idEmpresa
        join OrdenDetalles OD on P.idProducto = OD.idProducto
    GROUP BY nombreEmpresa;

select * from f_ventas_por_empresa()
order by cantidad desc;
