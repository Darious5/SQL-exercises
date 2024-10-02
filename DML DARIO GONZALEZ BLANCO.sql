/*EJ1 Inserta un nuevo fabricante indicando su código y su nombre.*/
insert into fabricante values ('10','prueba')
/*EJ2 Inserta un nuevo fabricante indicando solamente su nombre.	*/
/*NO SE PUEDE EN SQL SERVER*/
/*EJ3 Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: código, nombre, precio y código_fabricante.*/
INSERT INTO producto VALUES ('12','TABLETA GRAFICA','90','10')
/*EJ4 Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: nombre, precio y código_fabricante.*/
INSERT INTO producto (nombre,precio,id_fabricante)
VALUES ('NVME','120','10')
/*EJ5 Crea una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio. Una vez creada la tabla inserta todos los registros de la base de datos tienda en esta tabla haciendo uso de única operación de inserción.*/
create table fabricante_productos(
nombre_fabricante varchar,
nombre_producto varchar,
precio int
)
alter table fabricante_productos alter column nombre_fabricante varchar(100)
alter table fabricante_productos alter column nombre_producto varchar(100)
alter table fabricante_productos alter column precio decimal

insert into fabricante_productos (nombre_fabricante,nombre_producto,precio)
select fabricante.nombre as fabricante,producto.nombre as producto,producto.precio as precio from fabricante,producto
where fabricante.id=producto.id_fabricante
select * from fabricante_productos
/*EJ6 Crea una vista con el nombre vista_fabricante_productosque tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio.*/
CREATE VIEW vista_fabricante_productos AS
SELECT fabricante.nombre as fabricante,producto.nombre as producto,producto.precio from fabricante, producto
where producto.id_fabricante=fabricante.id
/*EJ7 Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?*/
delete from fabricante
where fabricante.nombre='asus'
delete from producto
where producto.id_fabricante=1
/*EJ8 Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?*/
DELETE FROM fabricante
WHERE fabricante.nombre='XIAOMI'
/*EJ9 Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?*/
UPDATE PRODUCTO
SET id_fabricante=20
WHERE ID=2

UPDATE fabricante
SET id=20
WHERE nombre='LENOVO'

SELECT * FROM fabricante
/*NO FUNCIONA PORQUE EN CUALQUIERA DE LOS DOS CASOS HAY CONFLITO CON LA FOREIGN KEY, TENEMOS QUE BORRAR DATOS DE UNA DE LAS DOS TABLAS*/

DELETE PRODUCTO
WHERE id_fabricante=2

UPDATE fabricante
SET id=20
WHERE nombre='LENOVO'
/*EJ10 Actualiza el código del fabricante Huawei y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?*/
UPDATE fabricante
SET id=30
WHERE nombre='HUAWEI'
/*EJ11 Actualiza el precio de todos los productos sumándole 5 € al precio actual.*/
UPDATE producto
SET precio=PRECIO+5
/*EJ12 Elimina todas las impresoras que tienen un precio menor de 200 €.*/
DELETE producto
WHERE precio<200 AND nombre LIKE 'IMPRESORA%'