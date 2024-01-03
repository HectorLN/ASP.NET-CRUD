create database CRUDG3I

go 
use CRUDG3I
go

/*Creacion de tablas*/

/*Tabla Administrador*/
create table tbl_admin(
	id_admin int identity(1,1) primary key,
	nombre varchar(40),
	email varchar(40),
	pass varbinary(500),
	foto varchar(max)

);

select * from tbl_admin

/*Tabla puesto*/

create table tbl_puesto(
	id_puesto int identity(1,1) primary key ,
	puesto varchar(50),
)

select * from tbl_puesto

/*Table Empleado*/
create table tbl_empleado(
id_empleado int identity not null primary key,
nombre varchar(max) not null,
foto varchar(max) not null,
id_puesto int not null,
	FOREIGN KEY (id_puesto) REFERENCES tbl_puesto(id_puesto),
fecha_ingreso date not null,
)
select * from tbl_empleado


/*Tabla de nomina*/
create table tbl_nomina(
	id_nomina int identity(1,1),
	id_empleado int,
	PRIMARY KEY (id_nomina),FOREIGN KEY (id_empleado) REFERENCES tbl_empleado(id_empleado),
	salario decimal(5,2)
)

select * from tbl_nomina



/*Procedimientos*/


/*Agregar admin*/
create procedure sp_add_user
@Nombre varchar(40),
@Email varchar(40),
@Pass varchar(20),
@Patron varchar(50),
@Foto varchar(50)
as begin
insert into tbl_admin (nombre,email,pass,foto) values (@Nombre,@Email, ENCRYPTBYPASSPHRASE(@Patron, @Pass),@Foto)
End

exec sp_add_user 'John Doe', 'john.doe@gmail.com', 'ILovePuppies83#', 'InfoToolsSV', 'fototest'

 /*Validar admin*/
create procedure sp_validate_user
@Email varchar(40),
@Pass varchar(20),
@Patron varchar(50)
as
begin
select*from tbl_admin where email = @Email and CONVERT(varchar(50), DECRYPTBYPASSPHRASE(@Patron, pass)) = @Pass
End

/*Cardar datos de la tabla empleado*/

create procedure sp_mostrar_tbl_empleados
as begin
select * from tbl_empleado
end

exec sp_mostrar_tbl_empleados

--CRUD
/*Crear Puesto*/
create procedure sp_create_puesto
@Puesto varchar(50)
as begin
insert into tbl_puesto values (@Puesto)
end

--exec sp_create_puesto 'Soporte Tecnico' ejemplo agregar puesto

/*Crear Empleado*/
create procedure sp_create_empleado
@Nombre varchar(max),
@Foto varchar(max),
@Id_puesto int,
@Fecha date
as begin
insert into tbl_empleado values (@Nombre,@Foto,@Id_puesto,@Fecha)
end

--exec sp_create_empleado 'favio','asfasfasfasfasfas',1,'2023-05-05' ejemplo agregar usuario

/*Borrar empleado*/
create procedure sp_delete_empleado
@Id_empleado int
as begin
delete from tbl_empleado where id_empleado =@Id_empleado
end

--exec sp_delete_empleado 2 ejemplo borrar empleado


/*Actualizar empleado*/
create procedure sp_update
@Id_empleado int,
@Nombre varchar(max),
@Foto varchar(max),
@Id_puesto int,
@Fecha date
as begin
update tbl_empleado set  nombre=@Nombre, foto=@Foto, id_puesto=@Id_puesto, fecha_ingreso=@Fecha
where id_empleado=@Id_empleado
end

--exec sp_update 3, 'favio rodriguez','hola',1,'2023-09-05'  ejemplo para actualizar

select * from tbl_empleado



/*Cardar datos de la tabla Nomina*/
create procedure sp_mostrar_tbl_nomina
as begin
select * from tbl_nomina
end

exec sp_mostrar_tbl_nomina

/*Crear Nomina*/
create procedure sp_create_nomina
@Id_empleado int,
@Salario decimal
as begin
insert into tbl_nomina values (@Id_empleado, @Salario)
end

--exec sp_create_nomina 3,302.43 ejemplo para

/*Borrar Nomina*/
create procedure sp_delete_nomina
@Id_nomina int
as begin
delete from tbl_nomina where id_nomina=@Id_nomina
end

--exec sp_delete_nomina 1 ejemplo para borrar nomina


/*Modificar Nomina*/
create procedure sp_update_nomina
@Id_empleado int,
@Salario decimal
as begin
update tbl_nomina set  id_empleado=@Id_empleado, salario=@Salario
where id_empleado=@Id_empleado
end

--exec sp_create_nomina 3,452.43 ejemplo para modificar nomina

select * from tbl_nomina