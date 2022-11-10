Use GestionBecas

go

create Procedure Buscar_Candidato
@dato varchar (50)
as
select 
a.IDCandidato as [ID Canditato],
a.PrimerNombre as [Primer Nombre],
a.PrimerApellido as [Primer Apellido],
a.IDPais as [Pais],
a.correo as [Correo],
a.NoPasaporte as [Pasaporte]
from Candidato a
where a.[PrimerNombre] like @dato + '%'
or a.[PrimerApellido] like @dato + '%'

go

create procedure Mostrar_Candidato
as
select Top 10
IDCandidato as [ID Candidato],
PrimerNombre as [Primer Nombre],
PrimerApellido as [Primer Apellido],
IDPais as [Pais],
correo as [Correo],
NoPasaporte as [Pasaporte]
from Candidato
go
exec Mostrar_Candidato

go
-------------------------------------------------------------

Create procedure Buscar_Programa
@dato varchar
as 
select 
bp.IDPrograma as [ID Programa],
bp.TituloPrograma as [Titulo Programa],
bp.TipoEspecialidad as [Tipo Especialidad],
bp.Creditos as [Creditos],
bp.Diplomados as [Diplomados],
bp.Duracion as [Duracion]
from Programa bp
where bp.[IDPrograma] like @dato +'%'
or bp.[TituloPrograma] like @dato +'%'

go

Create procedure Mostrar_Programa
as 
select Top 15
IDPrograma as [ID Programa],
TituloPrograma as [Titulo Programa],
TipoEspecialidad as [Tipo Especialidad],
Creditos as [Creditos],
Diplomados as [Diplomados],
Duracion as [Duracion]
from Programa

select * from Programa
exec Mostrar_Programa
go
------------------------------------------------------



create procedure Buscar_HistorialAcad
@dato as varchar (50)
as
select 
e.IDHistAcademico as [Historial Academico],
e.IDCandidato as [ID Candidato],
e.TituloObtenido as [Titulo Obtenido],
e.TipoEntidad as [Tipo Entidad],
e.FechaInicio as [Fecha de Inicio],
e.FechaFin as [Fecha de Fin]
from HistorialAcademico e
where e.[IDHistAcademico] like @dato +'%'
or e.[IDCandidato] like @dato +'%'
or e.[TipoEntidad] like @dato +'%'

go

create Procedure Mostrar_HistorialAcad
as
select top 15
IDHistAcademico as [Historial Academico],
IDCandidato as [ID Candidato],
TituloObtenido as [Titulo Obtenido],
TipoEntidad as [Tipo Entidad],
FechaInicio as [Fecha de Inicio],
FechaFin as [Fecha de Fin]
from HistorialAcademico

select * from HistorialAcademico
exec Mostrar_HistorialAcad
go


-----------------------------------------

create TABLE UsuarioLog(
IdUsuario int primary key identity (1,1),
Usuario varchar(50) not null,
Contrasenia varchar(MAX) not null,
Rol varchar(50),
Estado varchar(60)
)

go
create procedure Insertar_UsuarioLog
  @Usuario varchar(50),
  @Contraseña varchar(50),
  @Rol varchar(50),
  @Estado varchar(60)
  as

  insert into UsuarioLog(Usuario, Contrasenia, Rol, Estado)
  values
  (@Usuario, ENCRYPTBYPASSPHRASE(@contraseña, @Contraseña), @Rol,'Habilitado')

  go

  exec Insertar_UsuarioLog 'Steve','1999','Administrador',Estado
  go
  exec Insertar_UsuarioLog 'Steve1','1999','Administrador',Estado
  go
  select * from UsuarioLog 

  CREATE TABLE Colaborador(
IdColaborador int primary key identity(1,1),
IdUsuarioLog int foreign key references UsuarioLog(IdUsuario),
PrimerNombre varchar (30),
SegundoNombre varchar (30),
PrimerApellido varchar(30),
SegundoApellido varchar(30),
Direccion varchar (80),
Telefono varchar (30)
)

go

create procedure [dbo].[Crear_Usuario]
	@FirstName varchar(80),
	@LastName varchar(80),
	@Telefono varchar(80),
	@username varchar(80),
	@contraseña varchar(80),
	@rol varchar(80)

	as 

	insert into UsuarioLog(Usuario,Contrasenia,Rol,Estado) 
	values 
	(@username,ENCRYPTBYPASSPHRASE(@contraseña,@contraseña),@rol,'Habilitado')


	Declare @IdUsuario int
	set @IdUsuario = (select (MAX(IdUsuario)) from Usuario)
	insert into Colaborador(IdUsuarioLog,PrimerNombre,PrimerApellido,Telefono) 
	values (@IdUsuario,@FirstName,@LastName,@Telefono)

	select 'Usuario creado' as Resultado

	go

 create proc[dbo].[Cambiar_Estado_Usuario]
		@IdUsuario int
		AS
		IF exists (
				   SELECT * FROM UsuarioLog
				   WHERE IdUsuario = @IdUsuario and Estado = 'Habilitado'
				   )
		UPDATE UsuarioLog SET
		Estado = 'Deshabilitado'
		WHERE IdUsuario = @IdUsuario
		ELSE
		UPDATE UsuarioLog SET
		Estado = 'Habilitado'
		WHERE IdUsuario = @IdUsuario
  go

    create proc [dbo].[Mostrar_Usuarios]
	as
	Select
	u.IdUsuario as IdUsuario,
	c.IdColaborador as IdColaborador,
	c.PrimerNombre as Nombre, 
	c.PrimerApellido as Apellido, 
	c.Telefono as Telefono,
	u.Rol as Rol,
	u.Estado as Estado
	from UsuarioLog u 
	inner join Colaborador c 
	on c.IdUsuarioLog = u.IdUsuario
	
go

create procedure [dbo].[Buscar_Usuario]
	@dato varchar(100)
	as
	Select
	c.PrimerNombre Nombre,
	c.PrimerApellido as Apellido,
	c.Telefono,
	u.Rol,
	u.Estado 
	from UsuarioLog u
	inner join Colaborador c
	on c.IdUsuarioLog = u.IdUsuario
	where c.PrimerNombre like @dato + '%' 
	or c.PrimerApellido like @dato + '%' 
	or c.Telefono like @dato + '%' 
	or u.Rol like @dato + '%' 
	or u.Estado  like @dato + '%' 

go

  create procedure Insertar_Colaborador
	@Usuario int,
	@PrimerNombre varchar (30),
	@SegundoNombre varchar (30),
	@PrimerApellido varchar(30),
	@SegundoApellido varchar(30),
	@Direccion varchar (80),
	@Telefono varchar (30)
  as

  Insert into Colaborador (IdUsuarioLog,[PrimerNombre],[SegundoNombre],[PrimerApellido],[SegundoApellido],Direccion,Telefono)
  values (@Usuario,@PrimerNombre,@SegundoNombre,@PrimerApellido,@SegundoApellido,@Direccion,@Telefono)

  go

  exec Insertar_Colaborador 1,'Moria','Camila','Aguilar','Guerrero','Managua','84132459'
  go
  exec Insertar_Colaborador 2,'Bismark','Steve','Garcia','Torunio','Masaya','87362515'

  select * from Colaborador
  select * from UsuarioLog

  go


-------------------------------------------------------------------------
-------------------------------------------------------------------------
create procedure [dbo].[Validar_Acceso] @Usuario varchar(50), @Contraseña varchar(50)
AS
if exists (
           SELECT u2.Usuario FROM UsuarioLog u2 WHERE u2.Usuario = @Usuario
		   and CAST(DECRYPTBYPASSPHRASE(@Contraseña,u2.Contrasenia) as varchar(50)) = @Contraseña
		   and u2.Estado = 'Habilitado'
		   )
   SELECT 'Acceso Exitoso' as Permiso,
   c.IdUsuarioLog as IdUsuario,
   c.PrimerNombre + ' ' + c.PrimerApellido as Nombre,
   u.Rol as Rol FROM UsuarioLog u
   inner join Colaborador c on c.IdUsuarioLog = u.IdUsuario
   WHERE CAST(DECRYPTBYPASSPHRASE(@Contraseña, u.Contrasenia) as varchar(100)) = @Contraseña
   and u.Usuario = @Usuario and u.Estado = 'Habilitado'

ELSE

   SELECT
   'Acceso Denegado' as Acceso

   select * from UsuarioLog
   select * from Colaborador
   exec Validar_Acceso 'Steve','1999'
   exec Validar_Acceso 'Steve1','1999'


   ------------------------------------------------------------
go
create PROCEDURE [dbo].[Validar_Creacion_Usuario]
@usuario varchar(50)

as
if exists (Select Usuario from UsuarioLog where Usuario = @usuario)
Select 'Acceso Denegado' as Resultado
else
Select 'Acceso Exitoso' as Resultado

exec dbo.Validar_Creacion_Usuario 'Steve'

--------------------------------------------------------------
go
Create procedure [dbo].[Cambio_Estado_Usuario] @IdUsuario int
as
Declare @Estado varchar(60)
set @Estado = (Select Estado from UsuarioLog where
                IdUsuario = @IdUsuario)

				if(@Estado = 'Habilitado')
				Begin
				update UsuarioLog set Estado = 'Deshabilitado'
				where IdUsuario = @IdUsuario
			    End
				Else
				Begin 
				update UsuarioLog set Estado = 'Habilitado'
				where IdUsuario = @IdUsuario
				End

exec dbo.Cambio_Estado_Usuario 1
select * from UsuarioLog 

--------------------------------------------------------------------




