/*EJ1*/

/*creamos un procedimiento al que le daremos el codigo del articulo a comprar,
el numero de articulos que compraremos, y la fecha en la que haremos la compra
esta parte sera la que no tenga control de errores*/

create proc pr_hacerUnaVentaDeUnArticulo (@codArti nvarchar(100),@cantidad int,@fecha date)
as
	begin
	--comprobamos si hay suficientes existenias del articulo que queremos comprar
	--primero comprobamos si se excede el numero
		if ((select top 1 existencias from articulos where codarti=@codArti)<@cantidad)
			begin
				raiserror('no hay suficientes unidades del articulo',16,1)
			end
	--ahora comprobamos que hay suficientes y hacemos la venta
		else if ((select top 1 existencias from articulos where codArti=@codArti)>=@cantidad)
			begin
				print ('la venta se ha registrado')
				insert into ventas values (@codArti,(select top 1 dni from ventas where codarti=@codArti),@fecha,@cantidad)
				update articulos
				set existencias=existencias-@cantidad
				where codarti=@codArti
			end
	end
	
	--con este codigo podemos probar hacer una venta de 20 articulos 2 en 2024-07-24
	pr_hacerunaventadeunarticulo 2,2,'2024-07-24'
	
/*EJb1*/
--aplicamos control de errores al procedimiento anterior

create proc pr_hacerUnaVentaDeUnArticulo (@codArti nvarchar(100),@cantidad int,@fecha date)
as
	--Usamos begin transaction para poder volver atras en caso de falla
	begin transaction
	begin
		--En caso de que no haya falla hara esto
		begin try
		--comprobamos si hay suficientes existenias del articulo que queremos comprar
		--primero comprobamos si se excede el numero
			if ((select top 1 existencias from articulos where codarti=@codArti)<@cantidad)
				begin
					raiserror('no hay suficientes unidades del articulo',16,1)
				end
		--ahora comprobamos que hay suficientes y hacemos la venta
			else if ((select top 1 existencias from articulos where codArti=@codArti)>=@cantidad)
				begin
					print ('la venta se ha registrado')
					insert into ventas values (@codArti,(select top 1 dni from ventas where codarti=@codArti),@fecha,@cantidad)
					update articulos
					set existencias=existencias-@cantidad
					where codarti=@codArti
				end
			--commit transaction esta para confirmar que se ha hecho correctamente
			commit transaction
		end try
	--en caso de falla hara esto
	begin catch
		--deshará todos los cambios y pondra un mensaje de error
		rollback transaction
		raiserror ('ha ocurrido un error al usar el procedimiento',16,1)
	end catch
	end
	
/*EJ2*/

/*En este ejercicio vamos a crear una funcion donde daremos la razon social
de un proveedor y obtendremos el numero de pedidos que faltan por entregar,
para conseguir esto,comprobaremos si la fecha de entrega esta a NULL,
en caso de que esto sea cierto,podemos confirmar que el pedido
aun no ha sido entregado y asi contabilizarlo*/

create function fn_pedidosPendienteDeEntrega (@razonSocial nvarchar (255)) RETURNS INT
as
	begin
		/*este select va a contar los datos que sean null para conseguir sacar los pedidos
		que aun no han sido entregados, he convertido los datos NULL a 1111-11-11,
		que es una fecha que nadie va a usar como fecha de entrega, para conseguir que
		puedan ser contabilizados, ya que no es capaz de contar los nulls como nulls
		y he de hacerlo con un tipo de dato date*/
		return (select count(isnull(fechaentrega,'1111-11-11')) as 'pedidospendientes' from pedidoaproveedores
		join proveedores on proveedores.cif=pedidoaproveedores.cif
		where razonSocial=@razonSocial and fechaentrega is null)
	end

--probamos la funcion
print dbo.fn_pedidosPendienteDeEntrega ('Proveedor Tres Inc.')

/*EJ3*/
/*gracias a que la clave cifproveedor es foranea, el caso en el que varios
proveedores tengan un solo producto no es posible, gracias a esto,
la unica manera de asegurarnos de que ningun articulo se quede sin proveedor
es consiguiendo que si el proveedor se da de baja, el articulo que proporcionaba
tambien se borre*/
/*este codigo no funciona ya que la clave hay restricciones de clave 
que impiden que se haga el comando que desencadena el trigger,
en caso de que no existieran estas restricciones, este codigo
eliminaria en orden todas las apariciones donde estaba referida
el codigo del proveedor que queremos quitar y actualizaria el ultimo
email del proveedor de ese articulo por el nuevo email del mas reciente,
la fecha no la he podido cambiar*/
create trigger tr_bajasProveedores
on proveedores
after delete
as
begin
	--para evitar las restricciones de fk necesita borrarse en este orden
	--1º
	delete from ventas where codarti=(select substring(cif,4,1) from inserted)
	--2º
	delete from pedidoaproveedores where cif=(select cif from inserted)
	--3º
	delete from articulos where cifproveedor=(select cif from inserted)
	--4º
	delete from proveedores where cif=(select cif from inserted)
	update historicoproveedores
	set email=(select email from proveedores where cif=(select cif from inserted))
	where cif=(select cif from inserted)
end
