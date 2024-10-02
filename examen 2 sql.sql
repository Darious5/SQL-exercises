/*1.- (3,5 ptos) Realiza un procedimiento que le pases 
un rango de notas, un IDE y un porcentaje de subida, 
te actualice su nota para ese examen en el 
rango indicada subiéndole el porcentaje indicado. 
Ej SubeNota 7, 8,  4, 10  subiría un 10% la nota para 
el examen con ide 4 si su calificación está entre 7 y 8.
Borra el procedimiento*/
create proc subir_notas 
(@notamin decimal(7,2),@notamax decimal (7,2),@IDE int,@porcentaje decimal (7,2))
as
begin
	update NOTAS
	set calificacion=calificacion+calificacion*(@porcentaje*0.01)
	where IDE=@ide and calificacion>@notamin and calificacion<@notamax
end

subir_notas 1,7,1,50
select * from notas
select * from sys.procedures
drop proc subir_notas
/*2.- (1 ptos) Añádele control 
de errores para que deshaga los 
cambios si encuentra cualquier error.*/
create proc subir_notas 
(@notamin decimal(7,2),@notamax decimal (7,2),@IDE int,@porcentaje decimal (7,2))
as
begin
	begin transaction
	begin try
		update NOTAS
		set calificacion=calificacion+calificacion*(@porcentaje*0.01)
		where IDE=@ide and calificacion>@notamin and calificacion<@notamax
		commit transaction
	end try
	begin catch
		rollback transaction
		print 'no se ha podido completar'
	end catch
end

/*3.- (3 ptos) Realiza una función que 
dadas una calificación y un ide te 
devuelva el nombre de pila del 
alumno que haya sacado esa nota. 
Si ha varios, el de mayor dni. Borra la función*/
create function dev_nombre (@calificacion decimal(7,2),@ide int) returns varchar(50)
as
begin
	declare @nombre varchar(50)
	set @nombre=
	(select top 1 alumnos.nombre from notas join alumnos on notas.dnia=alumnos.dnia
	where ide=@ide and calificacion=@calificacion order by alumnos.dnia desc)
	return @nombre
end

print dbo.dev_nombre (3.4,72)

/*4.- (2,5 ptos) Desactiva los disparadores activos. 
Crea un disparador que controle las notas de los 
exámenes están en los rangos normales (0-10). 
Borra el disparador*/

/*comprobar disparadores activos*/
select * from sys.triggers
/*desactivarlos*/
disable trigger /*nombre del trigger*/ on /*tabla en la que actua el trigger*/

create trigger limite_notas
on notas
after insert,update
as
begin
	declare curs cursor for select dnia,ide,calificacion from notas
	declare @dnia int,@ide int ,@calificacion decimal(7,2)
	open curs
	fetch next from curs into @dnia,@ide,@calificacion
	while (@@fetch_status=0)
	begin
		if ((select calificacion from inserted)<0)
		begin
			update notas
			set calificacion=0
			where dnia=(select dnia from inserted)
			and
			ide=(select ide from inserted)
		end
		else if ((select calificacion from inserted)>10)
		begin
			update notas
			set calificacion=10
			where dnia=(select dnia from inserted)
			and
			ide=(select ide from inserted)
		end
		fetch next from curs into @dnia,@ide,@calificacion
	end
	close curs
	deallocate curs
end

drop trigger limite_notas