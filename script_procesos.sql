#Procesos
DELIMITER $$ 

CREATE PROCEDURE limpiar_registro_pasajeros_arribados()
BEGIN
    DECLARE fecha_actual DATE;
    SET fecha_actual = CURRENT_DATE();
  
  DELETE pasajes
FROM pasajes
JOIN horarios ON pasajes.id_horario = horarios.id_horario
WHERE DATEDIFF(CURRENT_DATE(), horarios.llegada_fecha_hora) >= 30;
END;
    
	$$

CREATE PROCEDURE obtener_horarios(
    IN p_id_tren INT,
    IN p_id_ruta INT
)
BEGIN
    SELECT 
			r.partida_estacion,
            h.partida_fecha_hora,
            r.llegada_estacion,
            h.llegada_fecha_hora
    FROM horarios h
    INNER JOIN pasajes p 
    ON p.id_horario = h.id_horario
	INNER JOIN rutas r
    ON r.id_ruta = p.id_ruta
    WHERE p.id_tren = p_id_tren AND p.id_ruta = p_id_ruta;
END;
$$

$$
CREATE PROCEDURE crear_horario(

    IN p_partida_fecha_hora DATETIME,
    IN p_llegada_fecha_hora DATETIME

)
BEGIN
    INSERT INTO horarios ( partida_fecha_hora, llegada_fecha_hora)
    VALUES ( p_partida_fecha_hora, p_llegada_fecha_hora);
END;

$$

CREATE PROCEDURE crear_pasaje(
    IN p_id_horario INT,
    IN p_id_tren INT,
    IN p_id_ruta INT,
    IN p_fecha_compra_pasaje DATE,
    IN p_retiro_boleteria VARCHAR(255),
    IN p_clase VARCHAR(255),
    IN p_asiento VARCHAR(255),
    IN p_puerta VARCHAR(255),
    IN p_precio_pasaje DECIMAL(19,2)
)
BEGIN
   INSERT INTO pasajes (id_horario,id_tren,id_ruta,fecha_compra_pasaje,retiro_boleteria,clase,asiento,puerta,precio_pasaje)
VALUES (p_id_horario,p_id_tren,p_id_ruta,p_fecha_compra_pasaje,p_retiro_boleteria,p_clase,p_asiento,p_puerta,p_precio_pasaje);
END;
 

 $$

 CREATE PROCEDURE crear_pasajero(
    IN p_id_pasaje INT,
    IN p_nombre_pasajero VARCHAR(255),
    IN p_apellido_pasajero VARCHAR(255),
    IN p_genero_pasajero ENUM('Masculino', 'Femenino', 'Otro'),
    IN p_dni_pasajero INT,
    IN p_email_pasajero VARCHAR(255),
    IN p_telefono_pasajero INT,
    IN p_direccion_pasajero VARCHAR(255),
    IN p_fecha_nacimiento_pasajero DATE
)
BEGIN
    INSERT INTO pasajeros(id_pasaje_comprado, nombre_pasajero, apellido_pasajero, genero_pasajero, dni_pasajero, email_pasajero, telefono_pasajero, direccion_pasajero, fecha_nacimiento_pasajero) 
    VALUES (p_id_pasaje, p_nombre_pasajero, p_apellido_pasajero, p_genero_pasajero, p_dni_pasajero, p_email_pasajero, p_telefono_pasajero, p_direccion_pasajero, p_fecha_nacimiento_pasajero);
END; 
$$

CREATE PROCEDURE consultar_empleados_por_estacion (IN id_estacion INT)
BEGIN
	SELECT *
    FROM empleados e
    JOIN estaciones es ON e.id_estacion = es.id_estacion
    WHERE es.id_estacion = id_estacion;
END
$$


CREATE PROCEDURE quien_cumple_años()
BEGIN
    SELECT *
    FROM pasajeros
    WHERE MONTH(fecha_nacimiento_pasajero) = MONTH(NOW()) AND DAY(fecha_nacimiento_pasajero) = DAY(NOW());
END;
$$

CREATE PROCEDURE brindar_descuento_cumpleaños ()
BEGIN

    
    
    UPDATE pasajes p 
    JOIN pasajeros pas ON pas.id_pasaje_comprado = p.id_pasaje
    JOIN descuento_nacimiento_pasajeros des ON des.id_pasajero = pas.id_pasajero
    SET p.precio_pasaje = p.precio_pasaje * (1 - des.porcentaje_descuento / 100)
    WHERE MONTH(fecha_nacimiento_pasajero) = MONTH(NOW()) AND DAY(fecha_nacimiento_pasajero) = DAY(NOW());

            
            
END
$$


CREATE PROCEDURE restaurar_precio_pasaje(IN p_id_pasaje INT)
BEGIN
	DECLARE precio_anterior DECIMAL(19, 2);

	SELECT valor_anterior INTO precio_anterior
    FROM log
    WHERE (tabla = 'pasajes') AND (columna_modificada = 'precio_pasaje') AND (id_entidad = p_id_pasaje)
    ORDER BY id_log DESC
    LIMIT 1;

    
     IF precio_anterior IS NOT NULL THEN
        UPDATE pasajes SET precio_pasaje = precio_anterior WHERE id_pasaje = p_id_pasaje;
    END IF;
    
END
$$

CREATE PROCEDURE obtener_accidentes_trenes_mes()
BEGIN
	SELECT 	
			t.marca AS 'Marca del tren',
            t.patente AS 'Patente del tren',
            r.accidente_descripcion AS 'Descripción del accidente',
            r.accidente_fecha_hora AS 'Fecha y hora del accidente'
    FROM reporte_accidentes_trenes r
    INNER JOIN trenes t
    ON t.id_tren = r.id_tren
	WHERE MONTH(accidente_fecha_hora) = MONTH(CURRENT_DATE());
END;
$$


CREATE PROCEDURE obtener_accidentes_estaciones_mes()
BEGIN
	SELECT 	
			e.nombre_estacion AS 'Nombre de la estación',
            r.accidente_descripcion AS 'Descripción del accidente',
            r.accidente_fecha_hora AS 'Fecha y hora del accidente'
    FROM reporte_accidentes_estaciones r
    INNER JOIN estaciones e
    ON e.id_estacion = r.id_estacion
	WHERE MONTH(accidente_fecha_hora) = MONTH(CURRENT_DATE());
END;
$$
