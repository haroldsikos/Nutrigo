/*Por cada consumidor, indicar el nombre del consumidor y la cantidad de órdenes que ha adquirido en total*/

select  distinct nombreConsumidor, count (O.idConsumidor) Total
	from UsuarioConsumidor UC
		join Orden O on UC.idConsumidor = O.idConsumidor
	group by nombreConsumidor 
	order by Total asc
