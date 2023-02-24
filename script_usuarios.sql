#Creación de usuarios
USE mysql;

DROP USER 'usuario_solo_lectura'@'localhost';
DROP USER 'administrador'@'localhost';

#Creación del usuario de solo lectura llamado 'usuario_solo_lectura' con dominio local, es decir 'localhost' con contraseña '111222333'#
CREATE USER usuario_solo_lectura@localhost IDENTIFIED BY '111222333';

#Verificación de que se haya creado el usuario#
SELECT * FROM USER;

#En esta sentencia estoy otorgando el permiso de lectura en todas las tablas de la base de datos 'empresa_trenes' al usuario 'usuario_solo_lectura'
GRANT SELECT ON empresa_trenes.* TO usuario_solo_lectura@localhost;

#En esta sentencia estoy removiendo el permiso de eliminar registros en todas las tablas de la base de datos 'empresa_trenes' al usuario 'usuario_solo_lectura'
REVOKE DELETE ON empresa_trenes.* FROM usuario_solo_lectura@localhost;

#Verificando que el usuario 'usuario_solo_lectura' solo tenga permisos de lectura
SHOW GRANTS FOR usuario_solo_lectura@localhost;



#Creacion del usuario 'administrador' con dominio local con contraseña 'Celular@10&'
CREATE USER administrador@localhost IDENTIFIED BY 'Celular@10&';

#Verificación de que se haya creado el usuario
SELECT * FROM USER;


#Otorgación de permisos de selección, actualización, inserción y eliminación de datos en todas las tablas de la base de datos 'empresa_trenes' a 'administrador'
GRANT SELECT, UPDATE, INSERT, DELETE ON empresa_trenes.* TO administrador@localhost;


#Verificando que el usuario 'administrador' tenga los permisos mencionados anteriormente
SHOW GRANTS FOR administrador@localhost;





