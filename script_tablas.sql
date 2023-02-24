#Creación de la base de datos

DROP SCHEMA IF EXISTS empresa_trenes;
CREATE SCHEMA empresa_trenes;
USE empresa_trenes;
SET SQL_SAFE_UPDATES=0;

#Creación de las tablas

CREATE TABLE provincias (

	id_provincia INT,
    nombre_provincia VARCHAR(255),
    
    PRIMARY KEY (id_provincia)

);

CREATE TABLE ciudades (

	id_ciudad INT,
    id_provincia INT,
    nombre_ciudad VARCHAR(255),
    
    PRIMARY KEY (id_ciudad),
    FOREIGN KEY (id_provincia) REFERENCES provincias (id_provincia)

);

CREATE TABLE trenes (

	id_tren INT,
    marca VARCHAR(255),
    patente VARCHAR(255),
    capacidad INT,
    
    PRIMARY KEY (id_tren)

);



CREATE TABLE estaciones (

	id_estacion INT,
    id_ciudad INT,
	nombre_estacion VARCHAR(255),
    
    PRIMARY KEY (id_estacion),
    FOREIGN KEY (id_ciudad) REFERENCES ciudades (id_ciudad)

);

CREATE TABLE rutas (

	id_ruta INT,
    id_estacion INT,
    nombre_ruta VARCHAR(255),
    partida_estacion VARCHAR(255),
    llegada_estacion VARCHAR(255),
    
    PRIMARY KEY (id_ruta),
	FOREIGN KEY (id_estacion) REFERENCES estaciones (id_estacion)

);

CREATE TABLE empleados (

	id_empleado INT,
    id_estacion INT,
    nombre_empleado VARCHAR(255),
    apellido_empleado VARCHAR(255),
	cargo_empleado VARCHAR(255),
    salario_empleado VARCHAR(255),
    telefono_empleado INT,
    carga_horaria_semanal INT,
    fecha_contratacion DATE,
    
    
    PRIMARY KEY (id_empleado),
    FOREIGN KEY (id_estacion) REFERENCES estaciones (id_estacion) ON DELETE CASCADE
    
);



CREATE TABLE horarios (

	id_horario INT auto_increment,
    partida_fecha_hora DATETIME,
    llegada_fecha_hora DATETIME,
    
    PRIMARY KEY (id_horario)


);


CREATE TABLE pasajes (

	id_pasaje INT auto_increment,
    id_horario INT,
    id_tren INT,
    id_ruta INT,
    fecha_compra_pasaje DATE,
    retiro_boleteria VARCHAR(255),
	clase VARCHAR(255),
    asiento VARCHAR(255),
    puerta VARCHAR(255),
    precio_pasaje DECIMAL (19,2),
    
    PRIMARY KEY (id_pasaje),
    FOREIGN KEY (id_horario) REFERENCES horarios (id_horario) ON DELETE CASCADE,
	FOREIGN KEY (id_tren) REFERENCES trenes (id_tren) ON DELETE CASCADE,
    FOREIGN KEY (id_ruta) REFERENCES rutas (id_ruta) ON DELETE CASCADE

);

CREATE TABLE pasajeros (

	id_pasajero INT auto_increment,
    id_pasaje_comprado INT,
    nombre_pasajero VARCHAR(255),
    apellido_pasajero VARCHAR(255),
    genero_pasajero ENUM( 'Masculino' , 'Femenino', 'Otro' ),
    dni_pasajero INT,
    email_pasajero VARCHAR(255),
    telefono_pasajero INT,
    direccion_pasajero VARCHAR(255),
    fecha_nacimiento_pasajero DATE,
    
    PRIMARY KEY (id_pasajero),
    FOREIGN KEY (id_pasaje_comprado) REFERENCES pasajes (id_pasaje) ON DELETE CASCADE
    
);


CREATE TABLE opiniones_pasajeros (

	id_opinion INT,
    id_pasajero INT,
    opinion_texto TEXT,
    opinion_puntuacion INT,
    
    PRIMARY KEY (id_opinion),
    FOREIGN KEY (id_pasajero) REFERENCES pasajeros (id_pasajero) ON DELETE CASCADE

);

CREATE TABLE descuento_nacimiento_pasajeros (

	id_descuento INT,
    id_pasajero INT,
    porcentaje_descuento INT,
    
	PRIMARY KEY (id_descuento),
    FOREIGN KEY (id_pasajero) REFERENCES pasajeros (id_pasajero) ON DELETE CASCADE
    
);


ALTER TABLE descuento_nacimiento_pasajeros
ADD CONSTRAINT ck_porcentaje_descuento
CHECK (porcentaje_descuento >= 50 AND porcentaje_descuento <= 70);


CREATE TABLE reporte_accidentes_trenes (

	id_accidente_tren INT,
    id_tren INT,
    id_ruta INT,
    accidente_descripcion TEXT,
    accidente_fecha_hora DATETIME,
    
    PRIMARY KEY (id_accidente_tren),
    FOREIGN KEY (id_tren) REFERENCES trenes (id_tren),
    FOREIGN KEY (id_ruta) REFERENCES rutas (id_ruta)
    

);

CREATE TABLE reporte_accidentes_estaciones (

	id_accidente_estacion INT,
    id_estacion INT,
    accidente_descripcion TEXT,
    accidente_fecha_hora DATETIME,
    
    PRIMARY KEY (id_accidente_estacion),
    FOREIGN KEY (id_estacion) REFERENCES estaciones (id_estacion)

);

CREATE TABLE negocios_estaciones (

	id_negocio INT,
    id_estacion INT,
    nombre_negocio VARCHAR(255),
    tipo_negocio VARCHAR(255),
    
    PRIMARY KEY (id_negocio),
    FOREIGN KEY (id_estacion) REFERENCES estaciones (id_estacion)

);

CREATE TABLE mantenimiento_trenes (

	id_mantenimiento_tren INT,
    id_tren INT,
    id_empleado INT,
	fecha_mantenimiento DATE,
    descripcion_mantenimiento TEXT,
    tipo_mantenimiento VARCHAR(255),
    
    PRIMARY KEY (id_mantenimiento_tren),
    FOREIGN KEY (id_tren) REFERENCES trenes (id_tren),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
    
);

CREATE TABLE mantenimiento_estaciones (

	id_mantenimiento_estacion INT,
    id_empleado INT,
    id_estacion INT,
    fecha_mantenimiento DATE,
	descripcion_mantenimiento TEXT,
    tipo_mantenimiento VARCHAR(255),
    
    PRIMARY KEY (id_mantenimiento_estacion),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
    FOREIGN KEY (id_estacion) REFERENCES estaciones (id_estacion)

);

#Creación tablas temporales

CREATE TABLE log (

  id_log INT AUTO_INCREMENT,
  fecha_hora DATETIME NOT NULL,
  usuario VARCHAR(50) NOT NULL,
  accion VARCHAR(50) NOT NULL,
  tabla VARCHAR(50) NOT NULL,
  columna_modificada VARCHAR(50),
  valor_anterior VARCHAR(255),
  valor_nuevo VARCHAR(255),
  id_entidad INT,
  
  PRIMARY KEY (id_log)
  
);

CREATE TABLE new_pasajero(
	
	id_pasajero INT,
    id_pasaje_comprado INT,
    nombre_pasajero VARCHAR(255),
    apellido_pasajero VARCHAR(255),
    genero_pasajero ENUM( 'Masculino' , 'Femenino', 'Otro' ),
    dni_pasajero INT,
    email_pasajero VARCHAR(255),
    telefono_pasajero INT,
    direccion_pasajero VARCHAR(255),
    fecha_nacimiento_pasajero DATE,
    
    PRIMARY KEY (id_pasajero)
    
);

CREATE TABLE new_pasaje (

	id_pasaje INT auto_increment,
    id_horario INT,
    id_tren INT,
    id_ruta INT,
    fecha_compra_pasaje DATE,
    retiro_boleteria VARCHAR(255),
	clase VARCHAR(255),
    asiento VARCHAR(255),
    puerta VARCHAR(255),
    precio_pasaje DECIMAL (19,2),
    
    PRIMARY KEY (id_pasaje)

);
