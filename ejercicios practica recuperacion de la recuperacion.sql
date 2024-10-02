/*1.- (3,5 ptos) Realiza un procedimiento que le pases 
un rango de notas, un IDE y un porcentaje de subida, 
te actualice su nota para ese examen en el 
rango indicada subiéndole el porcentaje indicado. 
Ej SubeNota 7, 8, 4, 10  subiría un 10% la nota para 
el examen con ide 4 si su calificación está entre 7 y 8.
Borra el procedimiento*/
create proc subida_nota (@nota1 decimal(7,2),@nota2 decimal(7,2),@ide int,@porcentaje int)
as
begin
	update NOTAS
	set calificacion=calificacion+calificacion*(@porcentaje*0.01)
	where IDE=@ide and calificacion>@nota1 and calificacion<@nota2
end

select * from notas
subida_nota 9,10,3,20

/*2.- (1 ptos) Añádele control 
de errores para que deshaga los 
cambios si encuentra cualquier error.*/

create proc subida_nota (@nota1 decimal(7,2),@nota2 decimal(7,2),@ide int,@porcentaje int)
as
begin
	begin transaction
	begin try
		update NOTAS
		set calificacion=calificacion+calificacion*(@porcentaje*0.01)
		where IDE=@ide and calificacion>@nota1 and calificacion<@nota2
		commit transaction
	end try
	begin catch
		rollback transaction
		print 'no se ha podido completar la ejecucion del procedimientololo'
	end catch
end

/*3.- (3 ptos) Realiza una función que 
dadas una calificación y un ide te 
devuelva el nombre de pila del 
alumno que haya sacado esa nota. 
Si ha varios, el de mayor dni. Borra la función*/

create function retrasado (@calificacion decimal(7,2),@ide int) returns varchar(50)
as
begin
	return (select top 1 alumnos.nombre from notas join alumnos on alumnos.dnia=notas.dnia
			where calificacion=@calificacion and ide=@ide order by notas.dnia desc)
end

print dbo.retrasado (0.7,27)
select * from NOTAS join alumnos on alumnos.dnia=NOTAS.dnia

/*4.- (2,5 ptos) Desactiva los disparadores activos. 
Crea un disparador que controle las notas de los 
exámenes están en los rangos normales (0-10). 
Borra el disparador*/

/*comprobar triggers*/
select * from sys.triggers

/*deactivate trigger*/
disable trigger control_tx on notas

/*borrar trigger*/
drop trigger control_tx 

create trigger control_tx
on notas
after insert, update
as
	begin
		declare @dnia int, @ide int, @calificacion decimal(7,2)
		declare cursor1 cursor for
			select dnia,ide,calificacion
			from notas
		open cursor1
		fetch next from cursor1 into @dnia, @ide, @calificacion
		while (@@fetch_status=0)
			begin
				if @calificacion>10
					begin
						update notas
						set calificacion=10
						where dnia=@dnia and ide=@ide
					end
				else if @calificacion<0
					begin
						update notas
						set calificacion=0
						where dnia=@dnia and ide=@ide
					end
				fetch next from cursor1 into @dnia, @ide, @calificacion
			end
		close cursor1
		deallocate cursor1
	end
		rollback transaction
		update notas
		set calificacion=11
		
		select * from producto
		
/*Se deberá comprobar que en la tabla Trabajo no se metan en la 
misma fecha conductores o máquinas que ya estén en otro trabajo.*/
select * from trabajos

alter trigger mondongo
on trabajos
after insert,update
as
	begin
	declare curs cursor for select idc,idm,idp,fecha,tiempo from trabajos
	declare @idc char(3),@idm char(3),@idp char(3),@fecha date,@tiempo smallint
	open curs
	fetch next from curs into @idc,@idm,@idp,@fecha,@tiempo
	while (@@fetch_status=0)
		begin
			begin
				if ((@idc=(select idc from inserted)) or (@idm=(select idm from inserted)) and (@fecha=(select fecha from inserted)))
					begin
						delete from trabajos where @idc=(select idc from inserted) and @idm=(select idm from inserted) and 
						@idp=(select idp from inserted) and @fecha=(select fecha from inserted) and @tiempo=(select tiempo from inserted)
					end
			end
			fetch next from curs into @idc,@idm,@idp,@fecha,@tiempo
		end
	close curs
	deallocate curs
	end
	
	insert into trabajos values ('c05','m02','p04','2002-09-15',120)
	
	
	
/*1.- Crea un procedimiento que dado un nombre de máquina, recorra mediante un cursor la tabla trabajo y vaya calculando 
el tiempo acumulado total de esa máquina. Ten en cuenta que te puedes encontrar valores null que no se deberán sumar. 
Al final deberá mostrarse el tiempo acumulado por pantalla*/

/*alex*/
create proc lms (@n_maq varchar(15))
as
	begin
		declare @tiempo smallint=0, @tiempototal smallint=0
		declare cursor2 cursor for
		(select tiempo
		 from trabajos
		 join maquinas on maquinas.idm=trabajos.idm
		 where Nombre=@n_maq)
		 open cursor2
		 fetch next from cursor2 into @tiempo
		 while (@@fetch_status=0)
			begin
				if @tiempo is NULL
					begin
						set @tiempo=0
					end
				set @tiempototal=@tiempototal+@tiempo
				fetch next from cursor2 into @tiempo
			end	
		close cursor2
		deallocate cursor2
		print @tiempototal
	end
	
	lms Volquete
	select * from maquinas
	select * from trabajos
	
/*dario*/
create proc lms (@n_maq varchar(15))
as
	begin
		declare @tiempo smallint=0,@tiempototal smallint=0
		declare cursor2 cursor for
		(select tiempo
		 from trabajos
		 join maquinas on maquinas.idm=trabajos.idm
		 where Nombre=@n_maq)
		 open cursor2
		 fetch next from cursor2 into @tiempo
		 while (@@fetch_status=0)
			begin
				if @tiempo is not NULL
					begin
						set @tiempototal=@tiempototal+@tiempo
					end
				fetch next from cursor2 into @tiempo
			end	
		close cursor2
		deallocate cursor2
		print @tiempototal
	end
		 
		lms Volquete
	select * from maquinas
	select * from trabajos
	
/*2.- Convierte el procedimiento anterior en una función para que 
en vez de mostrar por pantalla, devuelva el tiempo acumulado.*/


create function lmsfunct (@n_maq varchar(15)) returns smallint
as
	begin
		declare @tiempo smallint=0,@tiempototal smallint=0
		declare cursor2 cursor for
		(select tiempo
		 from trabajos
		 join maquinas on maquinas.idm=trabajos.idm
		 where Nombre=@n_maq)
		 open cursor2
		 fetch next from cursor2 into @tiempo
		 while (@@fetch_status=0)
			begin
				if @tiempo is not NULL
					begin
						set @tiempototal=@tiempototal+@tiempo
					end
				fetch next from cursor2 into @tiempo
			end	
		close cursor2
		deallocate cursor2
		return @tiempototal
	end
	
print dbo.lmsfunct ('volquete')

/*1.- Crea un procedimiento que cree un histórico sobre la media de las notas de una asignatura dada su IDA. 
La información sobre la IDA, media y fecha será almacenada en otra tabla que deberás crear si no existe.*/
create table Peru(
IDA int,
media decimal(7,2),
fecha date
)

CREATE proc historico (@ida int)
as
	begin
		insert into peru select asignaturas.ida, avg(notas.calificacion) as 'media',examenes.fecha from asignaturas
		join examenes on examenes.ida=asignaturas.ida
		join notas on notas.ide=examenes.ide
		where asignaturas.ida=@ida
		group by asignaturas.ida,examenes.fecha
	end
	historico 3
	SELECT * FROM PERU
