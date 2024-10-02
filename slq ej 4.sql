/*EJ1 left join*/
select fabricante.nombre, producto.nombre from fabricante
left join producto on fabricante.id=producto.id_fabricante
/*EJ1 right join*/
select fabricante.nombre, producto.nombre from producto
right join fabricante on fabricante.id=producto.id_fabricante
/*EJ2 left join*/
select fabricante.nombre, producto.nombre from fabricante
left join producto on fabricante.id=producto.id_fabricante
WHERE producto.nombre IS NULL
/*EJ2 left join*/
select fabricante.nombre, producto.nombre from producto
right join fabricante on fabricante.id=producto.id_fabricante
WHERE producto.nombre IS NULL
/*EJ3*/
/*
	No puede ocurrir eso gracias a que la tabla producto esta como
	clave foranea el id_fabricante, lo cual significa que cada
	producto ha de tener asociado un fabricante
*/