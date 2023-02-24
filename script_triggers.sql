#Creación de triggers
DELIMITER $$



CREATE TRIGGER tr_add_new_pasajero
AFTER INSERT ON pasajeros
FOR EACH ROW
INSERT INTO new_pasajero(id_pasajero,id_pasaje_comprado, nombre_pasajero, apellido_pasajero, genero_pasajero, dni_pasajero, email_pasajero, telefono_pasajero, direccion_pasajero, fecha_nacimiento_pasajero) 
    VALUES (NEW.id_pasajero, NEW.id_pasaje_comprado, NEW.nombre_pasajero, NEW.apellido_pasajero, NEW.genero_pasajero, NEW.dni_pasajero, NEW.email_pasajero, NEW.telefono_pasajero, NEW.direccion_pasajero, NEW.fecha_nacimiento_pasajero);
$$


CREATE TRIGGER tr_log_insert_pasajero
AFTER INSERT ON pasajeros
FOR EACH ROW
BEGIN
	INSERT INTO log (fecha_hora, usuario, accion, tabla, columna_modificada, valor_anterior, valor_nuevo, id_entidad)
    VALUES (NOW(), USER(), 'Insert', 'pasajero','-','-','-', NEW.id_pasajero);
END

$$


CREATE TRIGGER tr_add_new_pasaje
AFTER INSERT ON pasajes
FOR EACH ROW
INSERT INTO new_pasaje ( id_pasaje, id_horario, id_tren, id_ruta, fecha_compra_pasaje, retiro_boleteria, clase, asiento, puerta, precio_pasaje) values
						(NEW.id_pasaje, NEW.id_horario, NEW.id_tren, NEW.id_ruta, NEW.fecha_compra_pasaje, NEW.retiro_boleteria,NEW.clase, NEW.asiento, NEW.puerta, NEW.precio_pasaje);


$$


CREATE TRIGGER tr_log_insert_pasajes
AFTER INSERT ON pasajes
FOR EACH ROW
BEGIN
	INSERT INTO log (fecha_hora, usuario, accion, tabla, columna_modificada, valor_anterior, valor_nuevo, id_entidad)
    VALUES (NOW(), USER(), 'Insert', 'pasajes','-','-','-', NEW.id_pasaje);
END


$$


CREATE TRIGGER tr_log_update_pasajes
AFTER UPDATE ON pasajes
FOR EACH ROW
BEGIN
    INSERT INTO log (fecha_hora, usuario, accion, tabla, columna_modificada, valor_anterior, valor_nuevo, id_entidad)
    VALUES (NOW(), USER(), 'Update', 'pasajes', 
            CASE 
                WHEN OLD.fecha_compra_pasaje <> NEW.fecha_compra_pasaje THEN 'fecha_compra_pasaje'
                WHEN OLD.retiro_boleteria <> NEW.retiro_boleteria THEN 'retiro_boleteria'
                WHEN OLD.clase <> NEW.clase THEN 'clase'
                WHEN OLD.asiento <> NEW.asiento THEN 'asiento'
                WHEN OLD.puerta <> NEW.puerta THEN 'puerta'
                WHEN OLD.precio_pasaje <> NEW.precio_pasaje THEN 'precio_pasaje'
            END,
            CASE 
                WHEN OLD.fecha_compra_pasaje <> NEW.fecha_compra_pasaje THEN OLD.fecha_compra_pasaje
                WHEN OLD.retiro_boleteria <> NEW.retiro_boleteria THEN OLD.retiro_boleteria
                WHEN OLD.clase <> NEW.clase THEN OLD.clase
                WHEN OLD.asiento <> NEW.asiento THEN OLD.asiento
                WHEN OLD.puerta <> NEW.puerta THEN OLD.puerta
                WHEN OLD.precio_pasaje <> NEW.precio_pasaje THEN OLD.precio_pasaje
            END,
            CASE 
				WHEN OLD.fecha_compra_pasaje <> NEW.fecha_compra_pasaje THEN NEW.fecha_compra_pasaje
                WHEN OLD.retiro_boleteria <> NEW.retiro_boleteria THEN NEW.retiro_boleteria
                WHEN OLD.clase <> NEW.clase THEN NEW.clase
                WHEN OLD.asiento <> NEW.asiento THEN NEW.asiento
                WHEN OLD.puerta <> NEW.puerta THEN NEW.puerta
                WHEN OLD.precio_pasaje <> NEW.precio_pasaje THEN NEW.precio_pasaje
            END,
            OLD.id_pasaje);
END;


$$


CREATE TRIGGER tr_log_update_pasajeros
AFTER UPDATE ON pasajeros
FOR EACH ROW
BEGIN
    INSERT INTO log (fecha_hora, usuario, accion, tabla, columna_modificada, valor_anterior, valor_nuevo, id_entidad)
    VALUES (NOW(), USER(), 'Update', 'pasajeros', 
            CASE 
                WHEN OLD.nombre_pasajero <> NEW.nombre_pasajero THEN 'nombre_pasajero'
                WHEN OLD.apellido_pasajero <> NEW.apellido_pasajero THEN 'apellido_pasajero'
                WHEN OLD.genero_pasajero <> NEW.genero_pasajero THEN 'genero_pasajero'
                WHEN OLD.dni_pasajero <> NEW.dni_pasajero THEN 'dni_pasajero'
                WHEN OLD.email_pasajero <> NEW.email_pasajero THEN 'email_pasajero'
                WHEN OLD.telefono_pasajero <> NEW.telefono_pasajero THEN 'telefono_pasajero'
                WHEN OLD.direccion_pasajero <> NEW.direccion_pasajero THEN 'direccion_pasajero'
                WHEN OLD.fecha_nacimiento_pasajero <> NEW.fecha_nacimiento_pasajero THEN 'fecha_nacimiento_pasajero'
            END,
            CASE 
                WHEN OLD.nombre_pasajero <> NEW.nombre_pasajero THEN OLD.nombre_pasajero
                WHEN OLD.apellido_pasajero <> NEW.apellido_pasajero THEN OLD.apellido_pasajero
                WHEN OLD.genero_pasajero <> NEW.genero_pasajero THEN OLD.genero_pasajero
                WHEN OLD.dni_pasajero <> NEW.dni_pasajero THEN OLD.dni_pasajero
                WHEN OLD.email_pasajero <> NEW.email_pasajero THEN OLD.email_pasajero
                WHEN OLD.telefono_pasajero <> NEW.telefono_pasajero THEN OLD.telefono_pasajero
                WHEN OLD.direccion_pasajero <> NEW.direccion_pasajero THEN OLD.direccion_pasajero
                WHEN OLD.fecha_nacimiento_pasajero <> NEW.fecha_nacimiento_pasajero THEN OLD.fecha_nacimiento_pasajero
            END,
            CASE 
				WHEN OLD.nombre_pasajero <> NEW.nombre_pasajero THEN NEW.nombre_pasajero
                WHEN OLD.apellido_pasajero <> NEW.apellido_pasajero THEN NEW.apellido_pasajero
                WHEN OLD.genero_pasajero <> NEW.genero_pasajero THEN NEW.genero_pasajero
                WHEN OLD.dni_pasajero <> NEW.dni_pasajero THEN NEW.dni_pasajero
                WHEN OLD.email_pasajero <> NEW.email_pasajero THEN NEW.email_pasajero
                WHEN OLD.telefono_pasajero <> NEW.telefono_pasajero THEN NEW.telefono_pasajero
                WHEN OLD.direccion_pasajero <> NEW.direccion_pasajero THEN NEW.direccion_pasajero
                WHEN OLD.fecha_nacimiento_pasajero <> NEW.fecha_nacimiento_pasajero THEN NEW.fecha_nacimiento_pasajero
            END,
            OLD.id_pasajero);
END;


$$


CREATE TRIGGER tr_validar_genero_pasajero_insert
BEFORE INSERT ON pasajeros
FOR EACH ROW
BEGIN
    IF NEW.genero_pasajero NOT IN ('Masculino', 'Femenino', 'Otro') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El género ingresado en es correcto.';
    END IF;
END;


$$


CREATE TRIGGER tr_validar_genero_pasajero_update
BEFORE UPDATE ON pasajeros
FOR EACH ROW
BEGIN
    IF NEW.genero_pasajero NOT IN ('Masculino', 'Femenino', 'Otro') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El género ingresado en es correcto.';
    END IF;
END;


$$


CREATE TRIGGER validar_dni_insert
BEFORE INSERT ON pasajeros
FOR EACH ROW 
BEGIN
	IF (NEW.dni_pasajero < 1000000) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'El DNI indicado no es correcto';
    END IF;
END;


$$


CREATE TRIGGER validar_dni_update
BEFORE UPDATE ON pasajeros
FOR EACH ROW 
BEGIN
	IF (NEW.dni_pasajero < 1000000) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'El DNI indicado no es correcto';
    END IF;
END;


$$




