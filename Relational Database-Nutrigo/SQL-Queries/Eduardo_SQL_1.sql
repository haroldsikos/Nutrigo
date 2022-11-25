/*Listar los nombres de los repartidores de mayor a menor según su promedio valoración*/

Select nombreRepartidor,promedioValoracion
from Repartidor
    order by promedioValoracion DESC;
