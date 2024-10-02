/*EJ 1 FUNCIONAL*/
alter proc dnisum (@dni1 int,@dni2 int)
as
begin
declare @nota1 decimal(7,2),@nota2 decimal(7,2)
	set @nota1=(select max(notas.calificacion)
	from notas join ALUMNOS on ALUMNOS.DNIA=NOTAS.DNIA
	where notas.DNIA=@dni1 group by alumnos.DNIA)

	set @nota2=(select max(notas.calificacion)
	from notas join ALUMNOS on ALUMNOS.DNIA=NOTAS.DNIA
	where notas.DNIA=@dni2 group by alumnos.DNIA)
	print (@nota1+@nota2)
end

exec dnisum 1,2

/*EJ 2 FUNCIONAL*/
create FUNCTION dbo.dnisumfunct (@dni3 int,@dni4 int)returns decimal(7,2)
as
begin
declare @nota3 decimal(7,2),@nota4 decimal(7,2)
	set @nota3=(select max(notas.calificacion)
	from notas join ALUMNOS on ALUMNOS.DNIA=NOTAS.DNIA
	where notas.DNIA=@dni3 group by alumnos.DNIA)

	set @nota4=(select max(notas.calificacion)
	from notas join ALUMNOS on ALUMNOS.DNIA=NOTAS.DNIA
	where notas.DNIA=@dni4 group by alumnos.DNIA)
	return (@nota3+@nota4)
end

select dbo.dnisumfunct (1,2)

/*EJ 1 FUNCIONAL con deteccion de errores*/
alter proc dnisum (@dni1 int,@dni2 int)
as
begin


declare @nota1 decimal(7,2),@nota2 decimal(7,2)
	set @nota1=(select max(notas.calificacion)
	from notas join ALUMNOS on ALUMNOS.DNIA=NOTAS.DNIA
	where notas.DNIA=@dni1 group by alumnos.DNIA)

	set @nota2=(select max(notas.calificacion)
	from notas join ALUMNOS on ALUMNOS.DNIA=NOTAS.DNIA
	where notas.DNIA=@dni2 group by alumnos.DNIA)
	if (@dni1=(select distinct dnia from notas where DNIA=@dni1) and (@dni2=(select distinct dnia from notas where DNIA=@dni2)))
	print (@nota1+@nota2)
	else print 'el dni introducido no corresponde con ninguno de la base de datos'
end

exec dnisum 1,2

/*trigger para avisar de posible suspenso al insertar nota*/
create trigger notachkins
on notas
after insert
as
begin
if ((select calificacion from inserted)<4) print 'Insert Warning:Emergencia, el alumno X posible fracaso escolar'
end

/*trigger para avisar de posible suspenso al actualizar nota*/
create trigger notachkupd
on notas
after update
as
begin
if ((select calificacion from inserted)<4) print 'Update Warning:Emergencia, el alumno X posible fracaso escolar'
end

/*borrar los trigger*/
drop trigger notachkins
drop trigger notachkupd