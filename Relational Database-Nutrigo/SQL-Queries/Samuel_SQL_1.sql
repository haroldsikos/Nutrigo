/*Listar los transportes cuyo estado sea igual a ‘Listo’. y el tipo de transporte sea ‘Motocicleta’*/

select idTransporte, capacidad
   from Transporte
   where estado='Listo' and tipoTransporte='Motocicleta'