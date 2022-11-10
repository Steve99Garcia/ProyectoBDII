USE GestionBecas
GO
EXEC dbo.sp_changedbowner @loginame = N'sa', @map = false
GO

create login AdmManteni with password ='123456 '

go
--Agregando Rol de Servidor (Administrador)
sp_addsrvrolemember AdmManteni, sysadmin
go
-- Agregando usuario
sp_adduser AdmManteni, AdmManteni
go
-- Para saber el nombre del servidor
Select @@SERVERNAME

----------------------------------------------------
Create Login Moria1 with password ='2022'

Use GestionBecas

go 

create User Consultor from Login Moria1

Grant select, insert, update on Database :: GestionBecas to Consultor


-------------------------------------------------------------