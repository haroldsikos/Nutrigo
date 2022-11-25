/*Indicar el repartidor con mayor promedio de valoración*/

select nombreRepartidor
from (select nombreRepartidor, sum(promedioValoracion) Total
     from Repartidor
     group by nombreRepartidor) [ITEMS PER VALORACION]
where Total = (SELECT max(Total)
              FROM (select nombreRepartidor, sum(promedioValoracion) Total
                    from Repartidor
                    group by nombreRepartidor) [ITEMS PER VALORACION])