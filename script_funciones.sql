#Funciones 
DELIMITER $$

CREATE FUNCTION obtener_estacion_empleado (id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
RETURN (SELECT E.nombre_estacion AS 'Nombre de la estación'
		FROM empleados EM
        INNER JOIN estaciones E
        ON (EM.id_estacion = E.id_estacion)
        WHERE id=id_empleado);
END

$$
CREATE FUNCTION obtener_numero_accidentes_trenes_este_mes ()
RETURNS VARCHAR(255)
BEGIN
	DECLARE numero_reportes INT;
	DECLARE reportes_accidente VARCHAR (255);
    SELECT COUNT(*) INTO numero_reportes
    FROM reporte_accidentes_trenes
    WHERE MONTH(accidente_fecha_hora) = MONTH(CURDATE()) AND YEAR(accidente_fecha_hora) = YEAR(CURDATE());
	IF numero_reportes > 0 THEN
    SET reportes_accidente = CONCAT('Sí, hubo/hubieron ', numero_reportes, ' reporte(s) de accidentes en trenes este mes.');
  ELSE
    SET reportes_accidente = 'No hubieron reportes de accidentes en trenes este mes.';
  END IF;
  
  RETURN reportes_accidente;
END

$$

CREATE FUNCTION obtener_numero_accidentes_estaciones_este_mes ()
RETURNS VARCHAR(255)
BEGIN
	DECLARE numero_reportes INT;
	DECLARE reportes_accidente VARCHAR (255);
    SELECT COUNT(*) INTO numero_reportes
    FROM reporte_accidentes_estaciones
    WHERE MONTH(accidente_fecha_hora) = MONTH(CURDATE()) AND YEAR(accidente_fecha_hora) = YEAR(CURDATE());
	IF numero_reportes > 0 THEN
    SET reportes_accidente = CONCAT('Sí, hubo/hubieron ', numero_reportes, ' reporte(s) de accidentes en estaciones este mes.');
  ELSE
    SET reportes_accidente = 'No hubieron reportes de accidentes en estaciones este mes.';
  END IF;
  
  RETURN reportes_accidente;
END
    
$$

CREATE FUNCTION obtener_partida_pasajero( dni INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
RETURN (SELECT CONCAT('El pasajero ', P.nombre_pasajero, ' ', P.apellido_pasajero, ' sale de la estación ',R.partida_estacion, ' el dia y hora ', H.partida_fecha_hora) 
		FROM pasajeros P
		INNER JOIN pasajes PAS
		ON (PAS.id_pasaje=P.id_pasaje_comprado)
        INNER JOIN horarios H
        ON (PAS.id_horario=H.id_horario)
        INNER JOIN rutas R
        ON (R.id_ruta = PAS.id_ruta)
		WHERE dni=dni_pasajero);
END
$$


CREATE FUNCTION obtener_llegada_pasajero( dni INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
RETURN (SELECT CONCAT('El pasajero ', P.nombre_pasajero, ' ', P.apellido_pasajero, ' llega a la estación ',R.llegada_estacion, ' el dia y hora ', H.llegada_fecha_hora) 
		FROM pasajeros P
		INNER JOIN pasajes PAS
		ON (PAS.id_pasaje=P.id_pasaje_comprado)
        INNER JOIN horarios H
        ON (PAS.id_horario=H.id_horario)
        INNER JOIN rutas R
        ON (R.id_ruta = PAS.id_ruta)
		WHERE dni=dni_pasajero);
END
$$
 




