# Triggers

Triggers de insertación de datos en las tablas ´log´, ´new_pasaje´ y ´new_pasajero´:

- ´tr_add_new_pasajero´ : Este trigger inserta los pasajeros en una tabla llamada ´new_pasajero´ cuando se inserta nuevos datos de la tabla ´pasajeros´.
- ´tr_log_insert_pasajero´ : Cuando se inserta un nuevo registro en la tabla ´pasajeros´, este trigger inserta en la tabla ´log´ información acerca del registro insertado.
- ´tr_add_new_pasaje´ : Cuando se inserta un nuevo registro en la tabla ´pasajes´, este trigger copia el registro y lo inserta en la tabla ´new_pasaje´.
- ´tr_log_insert_pasajes´ : Cuando se inserta un nuevo registro en la tabla ´pasajes´, este trigger inserta en la tabla ´log´ información acerca del registro insertado.
- ´tr_log_update_pasajes´ : Cuando se modifica un valor de la tabla ´pasajes´, este trigger inserta en la tabla ´log´ información acerca del registro insertado (se agrega valor_anterior y valor_nuevo como nuevas columnas).
- ´tr_log_update_pasajeros´ : Cuando se modifica un valor de la tabla ´pasajeros´, este trigger inserta en la tabla ´log´ información acerca del registro insertado (se agrega valor_anterior y valor_nuevo como nuevas columnas).

Triggers de validación de datos:

- ´tr_validar_genero_pasajero_insert´ : Antes de insertar un registro en la tabla ´pasajero´, se chequea si el género es 'Masculino', 'Femenino' u 'Otro'. Si no se cumple devuelve un error con la respuesta 'El género ingresado no es correcto.'.
- ´tr_validar_genero_pasajero_update´ : Antes de modificar un valor en la columna ´genero_pasajero´ de la tabla ´pasajero´, se chequea si el género es 'Masculino', 'Femenino' u 'Otro'. Si no se cumple devuelve un error con la respuesta 'El género ingresado no es correcto.'.
- ´validar_dni_insert´ : Antes de insertar un registro en la tabla ´pasajero´, se chequea si el DNI es menor a 1000000. Si no se cumple devuelve un error con la respuesta 'El DNI indicado no es correcto.'.
- ´validar_dni_update´ : Antes de modificar un valor en la columna ´dni_pasajero´ en la tabla ´pasajero´, se chequea si el DNI es menor a 1000000. Si no se cumple devuelve un error con la respuesta 'El DNI indicado no es correcto.'.


# Procedimientos almacenados

- ´limpiar_registro_pasajeros_arribados´ : Este proceso limpia el registro almacenado en la tabla ´pasajes´ y sus registros relacionados por FK de las tablas ´pasajeros´ y ´descuento_nacimiento_pasajeros´ cuando la diferencia entre la fecha de llegada del pasajero y la fecha actual es de 30 días. Es decir si el pasajero arribó la fecha '2022-01-03' y llamas a este proceso la fecha '2022-02-27', se limpiara el registro, mejorando así la seguridad de la información de los pasajeros.
- ´obtener_horarios´ : Este proceso utiliza como parámetros ´id_ruta´ e ´id_tren´ para saber los horarios de un tren en una determinada ruta.
- ´crear_horario´ : Este proceso inserta un nuevo registro de la tabla ´horarios´.
- ´crear_pasaje´ : Este proceso inserta un nuevo registro de la tabla ´pasajes´.
- ´crear_pasajeros´ : Este proceso inserta un nuevo registro de la tabla ´pasajeros´. Estos procesos de creación de nuevo registro los creé ya que estas tablas son las de mayor números de registro y constantemente se agregan y modifican.
- ´consultar_empleados_por_estacion´ : Este proceso utiliza como parámetro ´id_estacion´, para saber los empleados que se encuentran en esa estación.
- ´quien_cumple_años´ : Este proceso devuelve la información de los pasajeros esten cumpliendo años, al momento de llamar este proceso.
- ´brindar_descuento_cumpleaños´ : Este proceso da uso de la tabla ´descuento_nacimiento_pasajeros´, ya que con el descuento asignado al pasajero que haya cumplido años, se modifica el precio del pasaje. Este proceso esta hecho para que te sea mas barato moverte cuando sea tu cumpleaños (ir de fiesta, ir a algun restaurante, etc),
- ´restaurar_precio_pasaje´ : Este proceso actualiza el precio modificado por el descuento a su valor anterior, es decir, sin el descuento aplicado. Obviamente esto es poco eficiente ya que es un trabajo manual (todos los dias tenés que llamar a estos procesos). Eso se soluciona haciéndolos eventos, pero como no lo vimos y no lo pide la consigna, no lo hice.
- ´obtener_accidentes_trenes_mes´ Este proceso utiliza la tabla ´reporte_accidentes_trenes´ para saber si en este mes hubieron accidentes de trenes. Se debería llamar LUEGO de haber utilizado la función ´obtener_numero_accidentes_trenes_este_mes´, aunque funciona igual sin utilizar la función, solo que el proceso, si no hay accidentes, no te devuelve nada.
- ´obtener_accidentes_estaciones_mes´ Este proceso utiliza la tabla ´reporte_accidentes_estaciones´ para saber si en este mes hubieron accidentes en las estaciones. Se debería llamar LUEGO de haber utilizado la función ´obtener_numero_accidentes_estaciones_este_mes´, aunque funciona igual sin utilizar la función, solo que el proceso, si no hay accidentes, no te devuelve nada.

# Funciones

- ´obtener_estacion_empleado´ : Esta función recibe como parámetro ´id_empleado´ para saber en qué estación trabaja este empleado.
- ´obtener_numero_accidentes_trenes_este_mes´ : Esta función devuelve un texto donde informa si hubieron accidentes de trenes en este mes, la cantidad, y si no hubo, devuelve que no hubieron accidentes reportados de trenes en este mes.
- ´obtener_numero_accidentes_estaciones_este_mes´ : Esta función devuelve un texto donde informa si hubieron accidentes en las estaciones en este mes, la cantidad, y si no hubo, devuelve que no hubieron accidentes reportados en las estaciones en este mes.
- ´obtener_partida_pasajero´ : Esta función recibe como parámetro el dni del pasajero para saber de qué estación parte y la fecha y hora de ésta.
- ´obtener_llegada_pasajero´ : Esta función recibe como parámetro el dni del pasajero para saber a qué estación llega y la fecha y hora de ésta.

# Vistas

- ´informacion_pasajero´ : Esta vista devuelve la información de los pasajeros, excluyendo los identificadores.
- ´informacion_empleado´ : Esta vista devuelve la información de los empleados y la estación en donde trabaja, excluyendo los identificadores.
- ´informacion_rutas´ : Esta vista devuelve la información de las rutas y la ciudad y provincia de donde se encuentra, excluyendo los identificadores.
- ´pasajes_partida_madrugada´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de la partida y su estación con la condición de que su partida sea entre las 00:00 y 06:00.
- ´pasajes_partida_mañana´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de la partida y su estación con la condición de que su partida sea entre las 06:00 y 12:00.
- ´pasajes_partida_tarde´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de la partida y su estación con la condición de que su partida sea entre las 12:00 y 18:00.
- ´pasajes_partida_noche´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de la partida y su estación con la condición de que su partida sea entre las 18:00 y 23:59.
- ´pasajes_llegada_madrugada´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de su llegada y la estación a la que llega con la condición de que su llegada sea entre las 00:00 y 06:00.
- ´pasajes_llegada_mañana´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de su llegada y la estación a la que llega con la condición de que su llegada sea entre las 06:00 y 12:00.
- ´pasajes_llegada_tarde´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de su llegada y la estación a la que llega con la condición de que su llegada sea entre las 12:00 y 18:00.
- ´pasajes_llegada_noche´ : Esta vista devuelve nombre, apellido y dni del pasajero, junto con el id del pasaje y la fecha y hora de su llegada y la estación a la que llega con la condición de que su llegada sea entre las 18:00 y 23:59.

# Usuarios

- ´usuario_solo_lectura´ : Este usuario solo puede usar SELECT y fue creado para que los usen los empleados, principalmente los de seguridad, para conocer el flujo de pasajeros a una hora determinada.
- ´administrador´ : Este usuario tiene todos los permisos.



