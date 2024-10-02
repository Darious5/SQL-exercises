/*EJ1*/
select fabricante.nombre, producto.nombre from producto,fabricante
where fabricante.nombre='lenovo'
and fabricante.id=producto.id_fabricante
/*EJ2*/
SELECT fabricante.nombre,producto.nombre FROM producto,fabricante
WHERE producto.precio=(select TOP 1 producto.precio from producto,fabricante
where fabricante.nombre='lenovo'
and fabricante.id=producto.id_fabricante)
AND fabricante.id=producto.id_fabricante
/*EJ3*/
select fabricante.nombre,producto.nombre from fabricante,producto
where producto.precio=(
select TOP 1 producto.precio from producto,fabricante
where fabricante.nombre='lenovo'
and fabricante.id=producto.id_fabricante
)
and fabricante.id=producto.id_fabricante
/*EJ4*/
select fabricante.nombre,producto.nombre,producto.precio from fabricante,producto
where producto.precio=(
select TOP 1 producto.precio from producto,fabricante
where fabricante.nombre='Hewlett-Packard'
and fabricante.id=producto.id_fabricante
order by precio desc
)
and fabricante.id=producto.id_fabricante
/*EJ5*/
select fabricante.nombre,producto.nombre from fabricante,producto
where producto.precio>=(
select TOP 1 producto.precio from producto,fabricante
where fabricante.nombre='lenovo'
and fabricante.id=producto.id_fabricante
)
and fabricante.id=producto.id_fabricante
/*EJ6*/
SELECT fabricante.nombre, producto.precio FROM fabricante,producto
WHERE  producto.precio>(SELECT AVG(precio) from producto,fabricante
WHERE producto.id_fabricante=fabricante.id
AND fabricante.nombre='ASUS')
AND producto.id_fabricante=fabricante.id
/*EJ8*/
SELECT producto.precio, producto.nombre FROM producto
WHERE producto.precio >= All
(SELECT producto.precio FROM producto)
/*EJ9*/
SELECT producto.precio, producto.nombre FROM producto
WHERE producto.precio <= All
(SELECT producto.precio FROM producto)
/*EJ10*/
SELECT DISTINCT fabricante.nombre FROM fabricante,producto
WHERE fabricante.id= ANY (SELECT producto.id_fabricante FROM producto)
/*EJ11*/
select fabricante.nombre from fabricante
where fabricante.id!= all (select producto.id_fabricante from producto)
/*EJ12*/
SELECT fabricante.nombre FROM fabricante
WHERE fabricante.id IN (SELECT producto.id_fabricante FROM producto)
/*EJ13*/
SELECT fabricante.nombre FROM fabricante
WHERE fabricante.id NOT IN (SELECT producto.id_fabricante FROM producto)
/*EJ14*/
SELECT fabricante.nombre FROM fabricante
WHERE EXISTS 
(SELECT producto.id_fabricante FROM producto
WHERE producto.id_fabricante=fabricante.id)
/*EJ15*/
SELECT fabricante.nombre FROM fabricante
WHERE NOT EXISTS
(SELECT producto.id_fabricante FROM PRODUCTO
WHERE producto.id_fabricante=fabricante.id)