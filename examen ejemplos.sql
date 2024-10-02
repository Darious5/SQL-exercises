alter table asignaturas add constraint capitalize check (nombre like upper(nombre))
insert into ASIGNATURAS values (99,'bd')
select * from ASIGNATURAS

create table examen	(
cod int,
nombre varchar,
fecha date
)

alter table examen alter column nombre varchar(99)

alter table examen drop column nombre

alter table examen add nombre varchar(99)

alter table codigo add constraint nn not null (cod)

alter table codigo add constraint pk primary key (cod)