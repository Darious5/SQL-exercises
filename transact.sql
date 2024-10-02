declare @nombre varchar(30)='dario gonzalez blanco', @puesto int=9,@ip int=0
set @ip=@puesto*5
print @nombre+ ' '+cast(@puesto as varchar(2))+' '+'192.168.207.'+cast(@ip as varchar(5))
declare @n int=0
while (@n<11)
	begin
		print @n
		set @n+=1
	end
update MAQUINAS
set Precio=
case
	when PrecioHora<70 then 'barato'
	when PrecioHora>=70 and preciohora<=100 then 'medio'
	when PrecioHora>100 then 'caro'
	end
select * from MAQUINAS

/*version 1*/

declare @num int=5, @counter int=0
print ('La tabla del '+cast(@num as varchar (4)))
while (@counter<=10)
	begin
	print (cast(@num as varchar (4))+'x'+cast(@counter as varchar (4))+' = '+cast(@num*@counter as varchar (4)))
	set @counter+=1
	end

/*version 2*/

declare @num int=5, @counter int=3,@end int=5
print ('La tabla del '+cast(@num as varchar (4))+' desde el '+cast(@counter as varchar (4))+' hasta el '+cast(@end as varchar (4)))
while (@counter<=@end)
	begin
	print (cast(@num as varchar (4))+'x'+cast(@counter as varchar (4))+' = '+cast(@num*@counter as varchar (4)))
	set @counter+=1
	end
	
/*version 3*/

declare @num int=1, @counter int=0,@counter2 int=0
	print '--------------'
while (@counter2<10)
begin
	print ('La tabla del '+cast(@num as varchar (4)))
	print '--------------'
	while (@counter<=10)
		begin
			print (cast(@num as varchar (4))+'x'+cast(@counter as varchar (4))+' = '+cast(@num*@counter as varchar (4)))
			set @counter+=1
		end
		set @counter2+=1
		set @counter=0
		set @num+=1
		print '--------------'
end

/*version 4*/

declare @num int=1, @counter int=3,@counter2 int=0,@end int=7,@countersave int
set @countersave=@counter
	print '------------------------------------'
while (@counter2<10)
begin
	print ('La tabla del '+cast(@num as varchar (4))+' desde el '+cast(@counter as varchar (4))+' hasta el '+cast(@end as varchar (4)))
	print '------------------------------------'
	while (@counter<=@end)
	begin
	print (cast(@num as varchar (4))+'x'+cast(@counter as varchar (4))+' = '+cast(@num*@counter as varchar (4)))
	set @counter+=1
	end
		set @counter2+=1
		set @counter=@countersave
		set @num+=1
		print '------------------------------------'
end

/*version 5*/

declare @num int=1, @counter int=3,@counter2 int=0,@end int=8,@countersave int
set @countersave=@counter
	print '------------------------------------------------------------------------------------'
while (@counter2<10)
begin
	print ('La tabla del '+cast(@num as varchar (4))+' desde el '+cast(@counter as varchar (4))+' hasta el '+cast(@end as varchar (4))+ ' sin contar los impares ni los que terminan en 2')
	print '------------------------------------------------------------------------------------'
	while (@counter<=@end)
	begin
	if ((@num*@counter)%2=0 and (@num*@counter) not like '%2')
	print (cast(@num as varchar (4))+'x'+cast(@counter as varchar (4))+' = '+cast(@num*@counter as varchar (4)))
	set @counter+=1
	end
		set @counter2+=1
		set @counter=@countersave
		set @num+=1
		print '------------------------------------------------------------------------------------'
end

declare @num int=1000
while (@num>=100) 
begin
	print @num
	set @num=@num-50
end

/*version sin optimizar*/

declare @num1 int=5, @num2 int=4, @num3 int=3

if (@num1>@num2)
begin
	if (@num1>@num3)
		begin
		 print ('el numero mayor es el primer numero: '+cast (@num1 as varchar (5)))
		end
	else
		begin
		 print ('el numero mayor es el tercer numero: '+cast (@num3 as varchar (5)))
		end
end
else
	if (@num2>@num3)
		begin
		 print ('el numero mayor es el segundo numero: '+cast (@num2 as varchar (5)))
		end
	else
		begin
		 print ('el numero mayor es el tercer numero: '+cast (@num3 as varchar (5)))
		end

/*version optimizada del anterior sin ver igual*/
declare @num1 int=5, @num2 int=6, @num3 int=7

if (@num1>@num2 and @num1>@num3) print ('el numero mayor es el primer numero: '+cast (@num1 as varchar (5)))
else if (@num2>@num1 and @num2>@num3) print ('el numero mayor es el segundo numero: '+cast (@num2 as varchar (5)))
else print ('el numero mayor es el tercer numero: '+cast (@num3 as varchar (5)))

/*version optimizada con prueba de errores*/
declare @num1 int=7, @num2 int=2, @num3 int=7

if (@num1>@num2 and @num1>@num3) print ('el numero mayor es el primer numero: '+cast (@num1 as varchar (5)))
else if (@num2>@num1 and @num2>@num3) print ('el numero mayor es el segundo numero: '+cast (@num2 as varchar (5)))
else if (@num3>@num1 and @num3>@num2)print ('el numero mayor es el tercer numero: '+cast (@num3 as varchar (5)))
else if (@num1=@num2 and @num1!=@num3) print ('los numeros mayores son el primero y el segundo: '+cast (@num1 as varchar (5)))
else if (@num1=@num3 and @num1!=@num2) print ('los numeros mayores son el primero y el tercero: '+cast (@num1 as varchar (5)))
else if (@num2=@num3 and @num2!=@num1) print ('los numeros mayores son el segundo y el tercero: '+cast (@num2 as varchar (5)))
else if (@num1=@num2 and @num1=@num3) print ('todos los numeros son iguales: '+cast (@num1 as varchar (5)))
else print 'ha habido un error en el calculo, por favor, vuelva a intentarlo'

/*valor medio*/
declare @num1 int=1,@num2 int=2,@num3 int=3
if (@num1>@num2 and @num1<@num3 or @num1<@num2 and @num1>@num3) print @num1
else if (@num2>@num1 and @num2<@num3 or @num2<@num1 and @num2>@num3) print @num2
else print @num3

/*valor medio sin and ni or*/
declare @num1 int=4,@num2 int=2,@num3 int=5
if (@num1>@num2)
begin
if(@num1<@num3) print @num1
end
if (@num1<@num2)
begin
if (@num1>@num3) print @num1
end
if (@num2>@num1)
begin
if (@num2<@num3) print @num2
end
if (@num2<@num1)
begin
if (@num2>@num3) print @num2
end
if (@num3>@num1)
begin
if (@num3<@num2) print @num3
end
if (@num3>@num2)
begin
if (@num3<@num1) print @num3
end

declare @num1 int
begin try
set @num1=1/0
end try
begin catch
print 'no se puede dividir entre 0'
end catch

/*CONTROL DE CLAVE MAQUINAS*/

declare @IDM varchar(3)='M05',@nombre varchar(20)='bastidor',@preciohora float=30.00,@precio varchar(20)='caro'
begin try
insert into	MAQUINAS values (@IDM,@nombre,@preciohora,@precio)
end try
begin catch
set @IDM=((SELECT CAST(MAX(SUBSTRING(IDM, 2, 4)) AS INT)FROM MAQUINAS)+1)
IF @IDM<10 insert into	MAQUINAS values ('M0'+@IDM,@nombre,@preciohora,@precio)
ELSE insert into MAQUINAS values ('M'+@IDM,@nombre,@preciohora,@precio)
end catch

select * from MAQUINAS
delete from MAQUINAS where nombre='BASTIDOR'

alter table maquinas alter column idm varchar (4) not null

ALTER TABLE MAQUINAS
ADD CONSTRAINT PK_Person PRIMARY KEY (IDM);


SELECT MAX(IDM) FROM MAQUINAS

/*PRACTICA PROCEDIMIENTO*/
CREATE PROC NOM_COND
AS
SELECT NOMBRE FROM CONDUCTORES
GO

EXEC NOM_COND

CREATE PROC GREATERTHAN_CATEG (@NUM INT)
AS
SELECT * FROM CONDUCTORES
WHERE Categ>@NUM
GO

EXEC GREATERTHAN_CATEG 15

/*SACAR LISTADO DE PROCEDIMIENTOS*/
SELECT P.NAME,P.CRDATE,P.TYPE FROM SYS.SYSOBJECTS P
WHERE P.xtype='P'

/*practica commit/rollback*/
declare @IDM varchar(3)='M05',@nombre varchar(20)='bastidor',@preciohora float=30.00,@precio varchar(20)='caro'
begin transaction
begin try
insert into	MAQUINAS values (@IDM,@nombre,@preciohora,@precio)
commit transaction
end try
begin catch
set @IDM=((SELECT CAST(MAX(SUBSTRING(IDM, 2, 4)) AS INT)FROM MAQUINAS)+1)
IF @IDM<10 insert into	MAQUINAS values ('M0'+@IDM,@nombre,@preciohora,@precio)
ELSE insert into MAQUINAS values ('M'+@IDM,@nombre,@preciohora,@precio)
rollback TRANSACTION
end catch

select * from MAQUINAS
delete from MAQUINAS where nombre='BASTIDOR'

/*PRUEBA FUNCIONES*/
CREATE FUNCTION SUMA (@A INT,@B INT)
RETURNS INT
AS
BEGIN
	RETURN @A+@B
END

PRINT DBO.SUMA(2,3)

SELECT * FROM CONDUCTORES
CREATE FUNCTION FN_CATEGALT (@IDC1 VARCHAR,@IDC2 VARCHAR)
RETURNS INT
AS
BEGIN
RETURN (SELECT MAX(CATEG) FROM CONDUCTORES WHERE IDC LIKE @IDC1 OR IDC LIKE @IDC2)
END

PRINT DBO.FN_CATEGALT ('C01','C03')

SELECT MAX(CATEG) FROM CONDUCTORES WHERE IDC LIKE 'C01' OR IDC LIKE 'C03'

/*EJ1*/
DECLARE @DNI INT=3
SELECT NOMBRE FROM ALUMNOS WHERE DNIA=@DNI

/*EJ2*/


/*EJ3*/
/*COMPROBADOR PRIMERA LETRA*/
DECLARE @DNIA INT=18
SELECT TOP 1 SUBSTRING(PADRES.nombre,1,1) FROM PADRES
LEFT JOIN HIJOS ON HIJOS.DNIP=PADRES.DNIP
LEFT JOIN ALUMNOS ON HIJOS.DNIA=ALUMNOS.DNIA
WHERE HIJOS.DNIA=@DNIA


/*CODIGO COMPLETO*/
DECLARE @DNIA INT=18, @LETRA VARCHAR='C'
IF (((SELECT TOP 1 SUBSTRING(PADRES.nombre,1,1) FROM PADRES
LEFT JOIN HIJOS ON HIJOS.DNIP=PADRES.DNIP
WHERE HIJOS.DNIA=@DNIA)=@LETRA) OR ((SELECT TOP 2 SUBSTRING(PADRES.nombre,1,1) FROM PADRES
LEFT JOIN HIJOS ON HIJOS.DNIP=PADRES.DNIP
WHERE HIJOS.DNIA=@DNIA)=@LETRA))
BEGIN
 PRINT 'LA PRIMERA LETRA COINCIDE CON EL PADRE DEL ALUMNO CON ESE DNI'
END
ELSE
BEGIN
PRINT 'LA PRIMERA LETRA NO COINCIDE CON EL PADRE DEL ALUMNO CON ESE DNI'
END

select * from CONDUCTORES
alter trigger tr_mensaje
on conductores
for insert
as
print 'has añadido un nuevo dato a la tabla'

insert into conductores values ('c08','a','a',14)

select * from CONDUCTORES
alter trigger tr_mensaje
on conductores
for insert
as
print 'has añadido un nuevo dato a la tabla'

insert into conductores values ('c08','a','a',14)

create table log_conduct(
codc varchar(3),
operacion varchar(20),
fecha date)

/*insert trigger*/
create trigger conductloginsert
on conductores
after insert
as
declare @cod varchar (3),@operacion varchar(20),@fecha date
select @cod=inserted.IDC from inserted
set @operacion='insercion'
set @fecha=(select getdate())
insert into log_conduct values (@cod,@operacion,@fecha)

/*delete trigger*/
create trigger conductlogdelete
on conductores
for delete
as
declare @cod varchar(3),@operacion varchar(20),@fecha date;
select @cod=deleted.IDC from deleted;
set @operacion='borrado';
set @fecha=(select getdate());
insert into log_conduct values (@cod,@operacion,@fecha);

/*update trigger*/
create trigger conductlogupdate
on conductores
after update
as
declare @cod varchar(3),@operacion varchar(20),@fecha date
select @cod=inserted.IDC from inserted
set @operacion='actualizado'
set @fecha=(select getdate())
insert into log_conduct values (@cod,@operacion,@fecha)

select * from conductores
insert into conductores values ('c11','a','a',23)

select * from log_conduct
---------------
update conductores set nombre='fer' where idc='C08'
insert into conductores values ('c10','a','a',32)

/*notas log creacion de la tabla*/
create table notas_log (
	media decimal (7,2),
	IDA int,
	fecha date
)
/*trigger comprobacion trabajos*/
select * from trabajos
create trigger comprobtrabajos
on trabajos
AFTER insert,update
as
begin transaction
declare @IDC varchar(3),@IDM varchar(3),@fecha date
set @idc=(select idc from inserted)
set @idm=(select idm from inserted)
set @fecha=(select fecha from inserted)
if((SELECT COUNT(*) from trabajos where fecha=@fecha and idc=@idc GROUP BY FECHA,IDC)>1)
	begin
		rollback transaction
		print 'IDC REPETIDO PARA LA MISMA FECHA'
	end
ELSE IF ((SELECT COUNT(*) from trabajos where fecha=@fecha and idm=@idm GROUP BY FECHA,IDM)>1)
	begin
		rollback transaction
		print 'IDM REPETIDO PARA LA MISMA FECHA'
	end
	
	select * from trabajos
	insert into trabajos values('C02','M02','P04','2002-09-12',NULL)