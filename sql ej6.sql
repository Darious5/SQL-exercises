/*EJ1.1*/
select pedido.* from pedido
order by pedido.fecha desc
/*EJ1.2*/
SELECT TOP 2 pedido.* FROM pedido
ORDER BY pedido.total DESC
/*EJ1.3*/
SELECT DISTINCT cliente.id FROM pedido,cliente
WHERE pedido.id_cliente=cliente.ID
/*EJ1.4*/
/*EJ1.1*/
select pedido.* from pedido
order by pedido.fecha desc
/*EJ1.2*/
SELECT TOP 2 pedido.* FROM pedido
ORDER BY pedido.total DESC
/*EJ1.3*/
SELECT DISTINCT cliente.id FROM pedido,cliente
WHERE pedido.id_cliente=cliente.ID
/*EJ1.4*/
SELECT pedido.* FROM pedido
WHERE pedido.fecha LIKE ('2017%') AND pedido.total>500
/*EJ1.5*/
SELECT comercial.nombre,comercial.apellido1,comercial.apellido2,comercial.comision FROM comercial
WHERE 0.05>=comercial.comision AND comercial.comision<=0.11
/*EJ1.6*/
SELECT MAX (comercial.comision) FROM comercial
/*EJ1.7*/
SELECT CLIENTE.id,cliente.nombre, cliente.apellido1 FROM cliente
WHERE cliente.apellido2 IS NOT NULL ORDER BY cliente.apellido1,cliente.apellido2,cliente.nombre
/*EJ1.8*/
SELECT cliente.* FROM cliente
WHERE cliente.nombre LIKE ('A%n') or cliente.nombre LIKE ('p%')
/*EJ1.9*/
SELECT cliente.* FROM cliente
WHERE cliente.nombre NOT LIKE ('A%') ORDER BY cliente.nombre
/*EJ1.10*/
SELECT DISTINCT comercial.* FROM comercial
WHERE comercial.nombre LIKE ('%EL') OR comercial.nombre LIKE ('%O')
/*EJ2.1*/
SELECT cliente.* FROM cliente,pedido
WHERE pedido.id_cliente=cliente.id
/*EJ2.2*/
SELECT cliente.*,pedido.* FROM cliente,pedido
WHERE cliente.id=pedido.id_cliente
ORDER BY cliente.nombre,cliente.apellido1,cliente.apellido2
/*EJ2.3*/
SELECT DISTINCT pedido.*,comercial.nombre FROM pedido,comercial
WHERE comercial.id IS NOT NULL
/*EJ2.4*/
SELECT DISTINCT cliente.*,pedido.*,comercial.* FROM cliente,pedido,comercial
WHERE cliente.id=pedido.id_cliente
/*EJ2.5*/
SELECT cliente.*,pedido.fecha,pedido.total FROM cliente,pedido
WHERE pedido.fecha LIKE ('2017%') AND pedido.total>=300 AND pedido.total<=1000
/*EJ2.6*/
SELECT distinct cliente.nombre,cliente.apellido1,cliente.apellido2,comercial.nombre,comercial.apellido1,comercial.apellido2  FROM cliente,comercial
WHERE CLIENTE.nombre=('María') and cliente.apellido1=('Santana') and cliente.apellido2=('Moreno')
/*EJ2.7*/
SELECT DISTINCT cliente.nombre FROM cliente,comercial
WHERE comercial.nombre=('Daniel') and comercial.apellido1=('Sáez') and comercial.apellido2=('Vega')
/*EJ3.1*/
SELECT cliente.nombre,cliente.apellido1,cliente.apellido2,pedido.* FROM cliente
left join pedido on pedido.id_cliente=cliente.id
ORDER BY cliente.apellido1,cliente.apellido2,cliente.nombre
/*EJ3.2*/
SELECT comercial.nombre,comercial.apellido1,comercial.apellido2,pedido.* FROM comercial
left join pedido on pedido.id_comercial=comercial.id
ORDER BY comercial.apellido1,comercial.apellido2,comercial.nombre
/*EJ3.3*/
select cliente.nombre,cliente.apellido1,cliente.apellido2,pedido.id_cliente from cliente
left join pedido on pedido.id_cliente=cliente.id where pedido.id_cliente is null
/*EJ3.4*/
select comercial.nombre,comercial.apellido1,comercial.apellido2,pedido.id_comercial from comercial
left join pedido on pedido.id_comercial=comercial.id where pedido.id_comercial is null
/*EJ3.5*/
select cliente.nombre,cliente.apellido1,cliente.apellido2,pedido.id_cliente,comercial.nombre,comercial.apellido1,comercial.apellido2,pedido.id_comercial from cliente
left join pedido on pedido.id_cliente=cliente.id
full outer join comercial on comercial.id=pedido.id_comercial
where pedido.id_cliente is null
order by cliente.nombre, comercial.nombre
/*EJ3.6*/
/*no, no se podria hacer con natural left join ni con natural right join, gracias a
que este no hace lo mismo que un join normal y no nos sirve para estos ejercicios en concreto*/
/*EJ4.1*/
SELECT SUM(pedido.total) from pedido
/*EJ4.2*/
SELECT AVG(pedido.total) from pedido
/*EJ4.3*/
SELECT COUNT(pedido.id_comercial) FROM pedido
/*EJ4.4*/
SELECT COUNT(cliente.id) FROM CLIENTE
/*EJ4.5*/
SELECT MAX(PEDIDO.total) FROM pedido
/*EJ4.6*/
SELECT MIN(PEDIDO.total) FROM pedido
/*EJ4.7*/
SELECT MAX(cliente.categoría),cliente.ciudad FROM cliente
GROUP BY cliente.ciudad
/*EJ4.8*/
SELECT max(pedido.total),pedido.fecha,cliente.nombre from pedido
left join cliente on cliente.id=pedido.id_cliente
group by pedido.fecha,cliente.nombre
/*EJ4.9*/
SELECT max(pedido.total),pedido.fecha,cliente.nombre from pedido
left join cliente on cliente.id=pedido.id_cliente
WHERE pedido.total>2000
group by pedido.fecha,cliente.nombre
/*EJ4.10*/
SELECT pedido.total