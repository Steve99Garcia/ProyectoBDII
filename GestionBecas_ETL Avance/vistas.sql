Use GestionBecas

select * from Usuario


alter view DimUsuario
as
select
v.IDUsuario,
v.Usuario,
v.IDPais,
v.IDCandidato,
c.[PrimerNombre] + ' ' + c.[PrimerApellido] as [Nombre de Solicitante] 
from Usuario v
inner join Candidato c
on v.IDCandidato = c.IDCandidato

--select * from DimUsuario 
go
select * from Usuario 

go


create view DimPrograma
as
select m.IdPrograma,
s.[PrimerNombre] + ' ' + s.[PrimerApellido] as [Programa inscrito],
m.TituloPrograma,
m.tipoEspecialidad,
m.Duracion
from Programa m
inner join Candidato s
on s.IDCandidato = m.IDPrograma

select * from DimPrograma

create view DimCandidato
as
select o.IDCandidato,
o.[PrimerNombre] + ' ' + o.[PrimerApellido] as [Solicitante de Beca],
s.NombrePais,
o.Correo,
o.NoPasaporte
from Candidato o
inner join Pais s
on s.IDPais = o.IDCandidato

select * from DimCandidato
