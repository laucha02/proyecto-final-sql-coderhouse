#Creación de vistas
CREATE OR REPLACE VIEW informacion_pasajero AS (SELECT

	P.id_pasaje_comprado,
	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    P.genero_pasajero,
    P.email_pasajero,
    P.telefono_pasajero,
    P.direccion_pasajero,
    P.fecha_nacimiento_pasajero
    
    FROM pasajeros P);



CREATE OR REPLACE VIEW informacion_empleado AS (SELECT

	E.nombre_empleado,
    E.apellido_empleado,
    E.cargo_empleado,
    E.salario_empleado,
    E.telefono_empleado,
    E.carga_horaria_semanal,
    E.fecha_contratacion,
    ES.nombre_estacion
    
    FROM empleados E
	INNER JOIN estaciones ES
    ON (E.id_estacion = ES.id_estacion)
    
    );
    


CREATE OR REPLACE VIEW informacion_rutas AS (SELECT

	R.nombre_ruta,
    R.partida_estacion,
    R.llegada_estacion,
    C.nombre_ciudad,
    P.nombre_provincia
    
    FROM rutas R
	INNER JOIN estaciones E
    ON (R.id_estacion = E.id_estacion)
    INNER JOIN ciudades C
    ON (E.id_ciudad = C.id_ciudad)
    INNER JOIN provincias P
    ON (C.id_provincia = P.id_provincia)
    
    );
    



CREATE OR REPLACE VIEW pasajes_partida_madrugada AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.partida_estacion,
    H.partida_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.partida_fecha_hora) BETWEEN '00:00:00' AND '06:00:00'
    );
    
CREATE OR REPLACE VIEW pasajes_partida_mañana AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.partida_estacion,
    H.partida_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.partida_fecha_hora) BETWEEN '06:00:00' AND '12:00:00'
    );
    
CREATE OR REPLACE VIEW pasajes_partida_tarde AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.partida_estacion,
    H.partida_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.partida_fecha_hora) BETWEEN '12:00:00' AND '18:00:00'
    );    
CREATE OR REPLACE VIEW pasajes_partida_noche AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.partida_estacion,
    H.partida_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.partida_fecha_hora) BETWEEN '18:00:00' AND '23:59:59'
    );    
  

CREATE OR REPLACE VIEW pasajes_llegada_madrugada AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.llegada_estacion,
    H.llegada_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.llegada_fecha_hora) BETWEEN '00:00:00' AND '06:00:00'
    );
    
CREATE OR REPLACE VIEW pasajes_llegada_mañana AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.llegada_estacion,
    H.llegada_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.llegada_fecha_hora) BETWEEN '06:00:00' AND '12:00:00'
    );
    
CREATE OR REPLACE VIEW pasajes_llegada_tarde AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.llegada_estacion,
    H.llegada_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.llegada_fecha_hora) BETWEEN '12:00:00' AND '18:00:00'
    );    
CREATE OR REPLACE VIEW pasajes_llegada_noche AS (
SELECT 

	P.nombre_pasajero,
    P.apellido_pasajero,
    P.dni_pasajero,
    PAS.id_pasaje,
    R.llegada_estacion,
    H.llegada_fecha_hora
   
    
    FROM pasajeros P
    INNER JOIN pasajes PAS
	ON (PAS.id_pasaje=P.id_pasaje_comprado)
    INNER JOIN horarios H
	ON (H.id_horario=PAS.id_horario)
    INNER JOIN rutas R
    ON (R.id_ruta = PAS.id_ruta)
	WHERE TIME(H.llegada_fecha_hora) BETWEEN '18:00:00' AND '23:59:59'
    );   
  

    
