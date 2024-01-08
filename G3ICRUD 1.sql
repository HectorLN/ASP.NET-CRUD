create database G3ICRUD

go 
use G3ICRUD
go


/*Administrador*/
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
	id_puesto int identity primary key ,
	puesto varchar(50),
)

INSERT INTO tbl_puesto VALUES ('Ventas')
INSERT INTO tbl_puesto VALUES ('Recurso Humano')
INSERT INTO tbl_puesto VALUES ('Desarrollo')
INSERT INTO tbl_puesto VALUES ('Asesor')

drop table tbl_puesto

drop table tbl_nomina

drop table tbl_empleado

select * from tbl_puesto


/*Empleado*/
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
	id_nomina int identity,
	id_empleado int,
	PRIMARY KEY (id_nomina),FOREIGN KEY (id_empleado) REFERENCES tbl_empleado(id_empleado),
	salario decimal(5,2)
)

INSERT INTO tbl_nomina VALUES (1, 200.34)
INSERT INTO tbl_nomina VALUES (1, 900.54)
INSERT INTO tbl_nomina VALUES (1, 949.00)
INSERT INTO tbl_nomina VALUES (2, 600.64)
INSERT INTO tbl_nomina VALUES (2, 700.24)
INSERT INTO tbl_nomina VALUES (3, 120.87)
INSERT INTO tbl_nomina VALUES (4, 532.32)

/*Procedimientos*/


/*Agregar admin*/
create procedure sp_Add_User
@Nombre varchar(40),
@Email varchar(40),
@Pass varchar(20),
@Patron varchar(50),
@Foto varchar(50)
as begin
insert into tbl_admin (nombre,email,pass,foto) values (@Nombre,@Email, ENCRYPTBYPASSPHRASE(@Patron, @Pass),@Foto)
End

exec sp_add_user 'Favio', 'favio@gmail.com', 'sinchoqueno', 'InfoToolsSV', ''

 /*Validar admin*/
create procedure sp_Validate_User
@Email varchar(40),
@Pass varchar(20),
@Patron varchar(50)
as
begin
select*from tbl_admin where email = @Email and CONVERT(varchar(50), DECRYPTBYPASSPHRASE(@Patron, pass)) = @Pass
End

/*Cardar datos de la tabla*/

create procedure sp_mostrar_tlb
as begin
select * from tbl_empleado
end


--CRUD

/*Crear Empleado*/
create procedure sp_create
@Nombre varchar(max),
@Foto varchar(max),
@Id_puesto int,
@Fecha date
as begin
insert into tbl_empleado values (@Nombre,@Foto,@Id_puesto,@Fecha)
end

exec sp_create 'favio','',1,'2023-05-05'
exec sp_create 'frank','',2,'2023-05-05'
exec sp_create 'hector','',3,'2023-05-05'
exec sp_create 'pablo','',4,'2023-05-05'

/*Borrar empleado*/
create procedure sp_delete
@Id_empleado int
as begin
delete from tbl_empleado where id_empleado =@Id_empleado
end

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

--exec sp_update 2, 'favio rodriguez','hola',1,'2023-09-05'  ejemplo para actualizar

select * from tbl_empleado


create procedure sp_delete_empleado
@Id_empleado int
as begin
delete from tbl_empleado where id_empleado =@Id_empleado
end

create procedure sp_comparacion_puesto
@Puesto varchar(max)
as begin
SELECT id_puesto FROM tbl_puesto WHERE puesto = @Puesto
end

exec sp_comparacion_puesto 'Recurso Humano'


create procedure sp_create_empleado
@Nombre varchar(max),
@Foto varchar(max),
@Id_puesto int,
@Fecha date
as begin
insert into tbl_empleado values (@Nombre,@Foto,@Id_puesto,@Fecha)
end

create procedure sp_update
@Id_empleado int,
@Nombre varchar(max),
@Id_puesto int,
@Fecha date
as begin
update tbl_empleado set  nombre=@Nombre, id_puesto=@Id_puesto, fecha_ingreso=@Fecha
where id_empleado=@Id_empleado
end

create procedure sp_get_foto
@Id_empleado int,
@Foto varchar(max) OUTPUT
as begin
SELECT foto FROM tbl_empleado WHERE id_empleado = @Id_empleado
end

exec sp_get_foto 13, ''

drop procedure sp_update
