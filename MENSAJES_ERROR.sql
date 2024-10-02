 



declare @num int=12, @multiplicando int=1, @resultado int
while @multiplicando<=10 
begin
set @resultado=(@num*@multiplicando)
print cast(@num as varchar(3))+ 'x' +cast(@multiplicando as varchar(3))+'=' +cast (@resultado as varchar (3))
set @multiplicando+=1
end

declare @numtotal int=2000, @resta int=50, @resul int
set @resul=@numtotal-@resta
print cast(@numtotal as varchar (4))+' - '+cast(@resta as varchar(2))+' = ' +cast (@resul as varchar (4))


declare @numtotal int=2000, @resta int=50, @resul int, @multiplicando int=2, @incrementresta int 
while @resul >100
begin
set @resul=(@numtotal-@resta)
print cast(@numtotal as varchar (4))+' - '+cast(@resta as varchar(2))+' = ' +cast (@resul as varchar (4))
set @incrementresta=(@resul*@multiplicando)
end


declare @incrementresta int, @resta int=50, @multiplicando int=2
set @incrementresta=(@resta*@multiplicando)
print cast (@resta as varchar (4))+'x'+cast(@multiplicando as varchar (4))+'='+cast(@incrementresta as varchar(4))
 
 declare @numero int=1000
 while @numero >=100
 begin 
 print @numero 
 set @numero=@numero-50 
 end
 
 
 
--------- 
 
 --EJ1--

DECLARE @nombre varchar(30) ='JESUS MARTINEZ VALERO'
DECLARE @NUMEROPUESTO INT = 11
PRINT '** INFO ALUMNO **'
PRINT '_____________________________'
PRINT 'NOMBRE: '+@nombre 
PRINT 'PUESTO: ' + cast(@NUMEROPUESTO AS CHAR(2))

IF (@NUMEROPUESTO%2=0)
BEGIN
	PRINT 'EL PUESTO ES PAR'
END 
ELSE
BEGIN 
	PRINT 'EL PUESTO ES IMPAR'
END

USE OBRAS

ALTER TABLE MAQUINAS 
ADD PRECIO VARCHAR(20)

SELECT * FROM MAQUINAS

UPDATE MAQUINAS
SET Precio=
CASE 
	WHEN PrecioHora<70 THEN 'BARATO'
	WHEN PrecioHora>=70 AND PrecioHora<=100 THEN 'MEDIO'
	WHEN PrecioHora>100 THEN 'CARO'
	END
	
--EJ1 LAS TABLAS DE MULTIPLICAR--

DECLARE @num int=2, @counter int=1, @resultado int 
while (@counter<=10)
begin 
set @resultado= (@num*@counter)
print cast(@num as varchar(2))+'x'+cast(@counter as varchar(2))+'='+cast(@resultado as varchar(3))
set @counter+=1
end

--EJ2 LIMITAMOS ENTRE 4 Y 7--

DECLARE @num int=3, @counter int=4, @resultado int, @variable int=7 
while (@counter<=@variable)
begin 
set @resultado= (@num*@counter)
print cast(@num as varchar(2))+'x'+cast(@counter as varchar(2))+'='+cast(@resultado as varchar(3))
set @counter+=1
end

--EJ3  DEL 1 AL 10, DEL 1 AL 10--

declare @num int=1, @counter int=1, @resultado int 
while (@num<=10)
begin
	print '____________'
	print 'Tabla del ' +cast (@num as char (4))
	print '____________'
	while (@counter<=10)
	begin 
	set @resultado= (@num*@counter)
	print cast(@num as varchar(2))+'x'+cast(@counter as varchar(2))+'='+cast(@resultado as varchar(3))
	set @counter+=1
	end
set @num+=1
set @counter=1
--(para comprobar)print cast(@num as char(4))
end

--EJ4 tabla de 1 al 10 con valores del 8 al 20

declare @num int=1, @counter int=8, @resultado int, @variable int=20
while (@num<=10)
begin
	print '____________'
	print 'Tabla del ' +cast (@num as char (4))
	print '------------'
	while (@counter<=@variable)
	begin 
	set @resultado= (@num*@counter)
	print cast(@num as varchar(2))+'x'+cast(@counter as varchar(2))+'='+cast(@resultado as varchar(3))
	set @counter+=1
	end
set @num+=1
set @counter=1
--(para comprobar)print cast(@num as char(4))
end

--ej5

declare @num1 int=5, @num2 int=16, @mayor int
if @num1>@num2
set @mayor=@num1 
else
set @mayor=@num2
print cast (@mayor as varchar (2))


--ej6--

declare @num1 int=8, @num2 int=16, @num3 int=2, @mayor int
if (@num1>=@num2) and (@num1>=@num3)
set @mayor=@num1
else if (@num2>=@num1) and (@num2>=@num3)
set @mayor=@num2
else if (@num3>=@num1) and (@num3>=@num2)
set @mayor=@num3
print @mayor


--ej7--


declare @num1 int=16, @num2 int=9, @num3 int=25
if (@num1>=@num2 and @num1>=@num3)
print '@num1 es el mayor = '+cast (@num1 as varchar(2)) 
else if (@num2>=@num1 and @num2>=@num3)
print '@num2 es el mayor = '+cast (@num2 as varchar (2))
else if (@num3>=@num1 and @num3>=@num2)
print '@num3 es el mayor = '+cast (@num3 as varchar (2))


-ej8--


declare @num1 int=16, @num2 int=5, @num3 int=15
if (@num1>=@num2 and @num1<=@num3)or (@num1<=@num2 and @num1>@num3)
print '@num1 es el mayor = '+cast (@num1 as varchar(2)) 
else if (@num2>=@num1 and @num2<=@num3)or (@num2<=@num1 and @num2>=@num3)
print '@num2 es el mayor = '+cast (@num2 as varchar (2))
else if (@num3>=@num1 and @num3<=@num2) or (@num3<=@num1 and @num3>=@num2)
print '@num3 es el mayor = '+cast (@num3 as varchar (2))


use OBRAS

select * from MAQUINAS


begin try
	declare @idmnuevo char(3)='M05', @nombremaquina varchar(12)='Oruga', @PrecioHora int=63, @precio varchar(6)='BARATO'
	insert into maquinas values (@idmnuevo,@nombremaquina,@PrecioHora, @precio)
end try
begin catch 
	print 'error en la tabla maquinas'
	print 'numero de error     :'+cast (ERROR_NUMBER () AS VARCHAR)  
	print 'numero de severidad :'+cast (ERROR_SEVERITY () AS VARCHAR) 
	print 'numero de estado    :'+cast (ERROR_STATE () AS VARCHAR) 
	print 'linea de error nº   :'+cast (ERROR_LINE () AS VARCHAR) 
	print 'mensaje de error    :'+ ERROR_MESSAGE ()
end catch

delete from MAQUINAS where Nombre='Tuneladora'

alter table maquinas
add constraint p_key primary key (IDM)

alter table maquinas 
alter column IDM varchar(3) not null


begin try
	declare @idmnuevo varchar(3)='M05', @nombremaquina varchar(12)='Tuneladora', @PrecioHora int=100, @precio varchar(6)='CARO'
	declare @idmfinal varchar (3)
	declare @idmnuevoint int 
	insert into maquinas values (@idmnuevo,@nombremaquina,@PrecioHora, @precio)
end try
begin catch 
	if ERROR_NUMBER ()=2627
	begin
	set @idmnuevo = (select MAX (IDM) FROM MAQUINAS)
	set @idmnuevoint = cast (SUBSTRING (@idmnuevo ,2,2) as int)
	set @idmnuevoint = @idmnuevoint + 1
	if @idmnuevoint <10
	set @idmfinal = 'M0' + cast (@idmnuevoint as varchar (10))
	else 
	set @idmfinal = 'M' + cast (@idmnuevoint as varchar (10)) 
	insert into MAQUINAS values (@idmfinal, @nombremaquina, @PrecioHora, @precio)
	end
end catch
--_________________________________________________

select * from MAQUINAS


create procedure sp_insertmaquina2
                              (@idmnuevo varchar(3), @nombrem varchar (15))
as
	begin transaction   
begin try
	insert into maquinas values (@idmnuevo, @nombrem, null, null)
	commit tran 
	print'se ha registrado con éxito'
end try
begin catch 
	if ERROR_NUMBER ()=2627
	rollback tran
	print 'ocurrió un error al introducir los datos'
	
end catch

exec sp_insertmaquina2 'M45', 'camion'


rollback tran
select * from maquinas

drop procedure sp_insertmaquina2

create procedure sp_insertidmnombre (@idmn varchar (3), @nomb varchar (15))
as
begin transaction
if @@ERROR=0
	begin
	insert into maquinas values (@idmn, @nomb, null, null)
	commit tran 
	print'se ha registrado con éxito'
	end
	else 
	begin
	rollback tran
	print 'ocurrió un error al introducir los datos'
	
	end
	
exec sp_insertidmnombre 'M08', 'VOLQUETE'


	
