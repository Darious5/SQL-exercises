/*WITHOUT JOIN*/

/*EJ1*/
select producto.nombre AS PRODUCTO,producto.precio,fabricante.nombre AS FABRICANTE from fabricante,producto
where producto.id_fabricante=fabricante.id
/*EJ2*/
select producto.nombre AS PRODUCTO,producto.precio,fabricante.nombre AS FABRICANTE from fabricante,producto
where producto.id_fabricante=fabricante.id
ORDER BY fabricante.nombre
/*EJ3*/
select PRODUCTO.ID,producto.nombre AS PRODUCTO,FABRICANTE.id,fabricante.nombre AS FABRICANTE from fabricante,producto
where producto.id_fabricante=fabricante.id
/*EJ4*/
SELECT TOP 1 producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,producto.precio FROM fabricante,producto
where producto.id_fabricante=fabricante.id
ORDER BY producto.precio ASC
/*EJ5*/
SELECT TOP 1 producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,producto.precio FROM fabricante,producto
where producto.id_fabricante=fabricante.id
ORDER BY producto.precio DESC
/*EJ6*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,fabricante.nombre FROM fabricante,producto
where producto.id_fabricante=fabricante.id
AND fabricante.nombre='Lenovo'
/*EJ7*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,fabricante.nombre FROM fabricante,producto
where producto.id_fabricante=fabricante.id
AND fabricante.nombre='Crucial'
AND producto.precio>200
/*EJ8*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE FROM fabricante,producto
WHERE (fabricante.nombre='Asus'
OR fabricante.nombre='Hewlett-Packard'
OR fabricante.nombre='Seagate')
AND producto.id_fabricante=fabricante.id
/*EJ9*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE FROM fabricante,producto
WHERE producto.id_fabricante=fabricante.id
AND fabricante.nombre IN ('Asus','Hewlett-Packard','Seagate')
/*EJ10*/
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto,fabricante
WHERE fabricante.nombre LIKE '%E'
AND fabricante.id=producto.id_fabricante
/*EJ11*/
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto,fabricante
WHERE fabricante.nombre LIKE '%W%'
AND fabricante.id=producto.id_fabricante
/*EJ12*/
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto,fabricante
WHERE producto.precio>=180
AND fabricante.id=producto.id_fabricante
ORDER BY producto.precio DESC, producto.nombre ASC
/*EJ13*/
SELECT DISTINCT fabricante.id, fabricante.nombre FROM fabricante, PRODUCTO
WHERE fabricante.id=producto.id_fabricante

/*WITH JOIN*/

/*EJ1 join*/ 
select producto.nombre AS PRODUCTO,producto.precio,fabricante.nombre AS FABRICANTE from fabricante
join producto on producto.id_fabricante=fabricante.id
/*EJ2 join*/
select producto.nombre AS PRODUCTO,producto.precio,fabricante.nombre AS FABRICANTE from fabricante
join producto on producto.id_fabricante=fabricante.id
ORDER BY fabricante.nombre
/*EJ3 join*/
select PRODUCTO.ID,producto.nombre AS PRODUCTO,FABRICANTE.id,fabricante.nombre AS FABRICANTE from fabricante
join producto on producto.id_fabricante=fabricante.id
/*EJ4 join*/
SELECT TOP 1 producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,producto.precio FROM fabricante
join producto on producto.id_fabricante=fabricante.id
ORDER BY producto.precio ASC
/*EJ5 join*/
SELECT TOP 1 producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,producto.precio FROM fabricante
join producto on producto.id_fabricante=fabricante.id
ORDER BY producto.precio DESC
/*EJ6 join*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,fabricante.nombre FROM fabricante
join producto on producto.id_fabricante=fabricante.id
AND fabricante.nombre='Lenovo'
/*EJ7 join*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE,fabricante.nombre FROM fabricante
join producto on producto.id_fabricante=fabricante.id
AND fabricante.nombre='Crucial'
AND producto.precio>200
/*EJ8 join*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE FROM fabricante
join producto on (fabricante.nombre='Asus'
OR fabricante.nombre='Hewlett-Packard'
OR fabricante.nombre='Seagate')
AND producto.id_fabricante=fabricante.id
/*EJ9 join*/
SELECT producto.nombre AS PRODUCTO,fabricante.nombre AS FABRICANTE FROM fabricante
join producto on producto.id_fabricante=fabricante.id
AND fabricante.nombre IN ('Asus','Hewlett-Packard','Seagate')
/*EJ10 join*/
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto
join fabricante on fabricante.nombre LIKE '%E'
AND fabricante.id=producto.id_fabricante
/*EJ11 join*/
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto
join fabricante on fabricante.nombre LIKE '%W%'
AND fabricante.id=producto.id_fabricante
/*EJ12 join*/
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto
join fabricante on producto.precio>=180
AND fabricante.id=producto.id_fabricante
ORDER BY producto.precio DESC, producto.nombre ASC
/*EJ13 join*/
SELECT DISTINCT fabricante.id, fabricante.nombre FROM fabricante
join producto on fabricante.id=producto.id_fabricante