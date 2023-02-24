# proyecto-final-sql-coderhouse
Proyecto final del curso SQL comisión 48110 de Coderhouse

# Introducción
El proyecto realizado para el curso de SQL se enfocó en el desarollo de una base de datos para una empresa ficticia de trenes a escala nacional. Contiene información acerca de los trenes que utiliza, sus horarios de partida y llegada, sus rutas e información de los pasajeros que compran sus respectivos pasajes para utilizar los servicios de la empresa.

# Objetivos
Los objetivos son brindar servicios de transporte de calidad a sus clientes, mejorar la experiencia gracias a sus opiniones y reportes, permitir la gestión de información de una manera optimizada y seguir creciendo en el mercado de transporte, utilizando en un futuro nuevas formas de transportar, como subtes, colectivos, entre otros.

# Situación problemática
Las situaciones problemáticas que va a enfrentar esta empresa son:

 - Problemas de seguridad de datos: como cualquier base de datos, puede ser vulnerables a ciberataques, ya que son datos de información personal de los pasajeros, como dni, teléfono, dirección. No son tan sensibles como contraseñas, o información de las tarjetas de crédito pero nadie quisiera que alguien tenga tu dirección.
 - Problemas de rendimiento: al tener un flujo de personas muy amplio, aumentando las tablas de pasajeros, pasajes, reportes, opiniones, entre otros, podría tener un impacto en el rendimiento y la eficiencia.

# Modelo de negocio
El modelo de negocio de esta empresa es generar ingresos a través de la venta de pasajes del tren a los pasajeros.

# Antes de la ejecución

- Algunos datos son incongruentes ya que fueron generados al azar. Por ejemplo, la fecha y hora de una partida de tren es '2022-04-23 20:00:00' y la llegada de éste es '2023-07-17 15:00:00' (actualmente ningún tren viaja durante meses para llegar a su destino); ó como su nombre fuera de género masculino pero en la columna ´genero_masculino´ diga Femenino; entre otros
- Para ejecutar correctamente los scripts, tiene que hacerlo en orden:
1)script_tablas
2)script_datos
3)script_triggers
Y luego para script_procesos, script_funciones, script_vistas y script_usuarios es indiferente el orden
Si quiere saber qué hace cada proceso, funcion, vista, trigger y usuario, fíjese en el archivo INFORMACION_OBJETOS, allí se explica de manera detallada

# Diagrama Entidad-Relación

Se encuentra en el repositorio con el nombre de DER+Trueba.

#Listado de tablas con descripción de estructura

Se encuentra en el repositorio bajo el nombre de TABLAS+Trueba.

#Scripts de inserción de datos

Se encuentra en el repositorio con el nombre de script_datos.

#Listado de los scripts de vistas, procesos, funciones y triggers

Se encuentra en el repositorio con el nombre de script_vistas, script_procesos, script_funciones y script_triggers.

#Informes generados en base a la información de la base

Esto se hace a partir de las vistas ´informacion_pasajero´, ´informacion_empleado´ y ´informacion_rutas´.


# Herramientas y tecnologías usadas

-Mysql Workbench
-Google Drive
-generatedata.com
-Microsoft Word
-Microsoft Excel
-Git
-Github
