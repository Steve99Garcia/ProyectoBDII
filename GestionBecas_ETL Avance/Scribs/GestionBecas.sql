USE [master]
GO
/****** Object:  Database [GestionBecas]    Script Date: 08/11/2022 20:05:24 ******/
CREATE DATABASE [GestionBecas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestionBecas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GestionBecas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GestionBecas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GestionBecas_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GestionBecas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestionBecas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestionBecas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestionBecas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestionBecas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestionBecas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestionBecas] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestionBecas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GestionBecas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestionBecas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestionBecas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestionBecas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestionBecas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestionBecas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestionBecas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestionBecas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestionBecas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GestionBecas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestionBecas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestionBecas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestionBecas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestionBecas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestionBecas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestionBecas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestionBecas] SET RECOVERY FULL 
GO
ALTER DATABASE [GestionBecas] SET  MULTI_USER 
GO
ALTER DATABASE [GestionBecas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestionBecas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestionBecas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestionBecas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GestionBecas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GestionBecas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GestionBecas', N'ON'
GO
ALTER DATABASE [GestionBecas] SET QUERY_STORE = OFF
GO
USE [GestionBecas]
GO
/****** Object:  User [ManagerDBA]    Script Date: 08/11/2022 20:05:25 ******/
CREATE USER [ManagerDBA] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[ManagerDBA]
GO
/****** Object:  Schema [ManagerDBA]    Script Date: 08/11/2022 20:05:25 ******/
CREATE SCHEMA [ManagerDBA]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[IDCandidato] [int] NOT NULL,
	[PrimerNombre] [nvarchar](30) NOT NULL,
	[PrimerApellido] [nvarchar](30) NOT NULL,
	[IDPais] [int] NOT NULL,
	[Correo] [nvarchar](70) NOT NULL,
	[NoPasaporte] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Cadidato] PRIMARY KEY CLUSTERED 
(
	[IDCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[IDCiudad] [int] NOT NULL,
	[NombreCiudad] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[IDCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialAcademico]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialAcademico](
	[IDHistAcademico] [int] NOT NULL,
	[IDCandidato] [int] NOT NULL,
	[TituloObtenido] [nvarchar](50) NOT NULL,
	[TipoEntidad] [nvarchar](30) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
 CONSTRAINT [PK_HistAcademico] PRIMARY KEY CLUSTERED 
(
	[IDHistAcademico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialLaboral]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialLaboral](
	[IDHistLab] [int] NOT NULL,
	[Puesto] [nvarchar](60) NOT NULL,
	[Entidad] [nvarchar](60) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[IDCandidato] [int] NOT NULL,
 CONSTRAINT [PK_HistLab] PRIMARY KEY CLUSTERED 
(
	[IDHistLab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oferta]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferta](
	[IDOferta] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[Monto] [float] NOT NULL,
	[MontoFinanciamiento] [float] NOT NULL,
	[IDPrograma] [int] NOT NULL,
	[IDUniversidad] [int] NOT NULL,
	[IDPlanificacion] [int] NOT NULL,
 CONSTRAINT [PK_Oferta] PRIMARY KEY CLUSTERED 
(
	[IDOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IDPais] [int] NOT NULL,
	[NombrePais] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IDPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planificacion]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planificacion](
	[IDPlanificacion] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[FechaApertura] [date] NOT NULL,
	[FechaCierre] [date] NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[FechaAprobado] [date] NOT NULL,
	[CantidadUniversidades] [int] NOT NULL,
	[Estado] [nvarchar](10) NOT NULL,
	[IDPais] [int] NOT NULL,
 CONSTRAINT [PK_Planificacion] PRIMARY KEY CLUSTERED 
(
	[IDPlanificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa](
	[IDPrograma] [int] NOT NULL,
	[TituloPrograma] [nvarchar](70) NOT NULL,
	[TipoEspecialidad] [nvarchar](40) NOT NULL,
	[Creditos] [int] NOT NULL,
	[Diplomados] [int] NOT NULL,
	[Duracion] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Programa] PRIMARY KEY CLUSTERED 
(
	[IDPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[NoSolicitud] [int] NOT NULL,
	[Estado] [nvarchar](15) NOT NULL,
	[Resumen] [nvarchar](140) NULL,
	[IDOferta] [int] NOT NULL,
	[IDCandidato] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universidad]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universidad](
	[IDUniversidad] [int] NOT NULL,
	[NombreUniversidad] [nvarchar](80) NOT NULL,
	[IDPais] [int] NOT NULL,
	[IDCiudad] [int] NOT NULL,
	[Calle] [nvarchar](60) NULL,
	[NumeroCalle] [int] NULL,
	[Distrito] [nvarchar](40) NULL,
	[Telefono] [nvarchar](13) NOT NULL,
 CONSTRAINT [PK_Universidad] PRIMARY KEY CLUSTERED 
(
	[IDUniversidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/11/2022 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUsuario] [int] NOT NULL,
	[IDCandidato] [int] NOT NULL,
	[Usuario] [nvarchar](30) NOT NULL,
	[Contraseña] [nvarchar](30) NOT NULL,
	[IDPais] [int] NOT NULL,
	[FechaAcceso] [date] NOT NULL,
	[FechaModificacion] [date] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HistorialAcademico] ADD  DEFAULT (getdate()) FOR [FechaInicio]
GO
ALTER TABLE [dbo].[HistorialAcademico] ADD  DEFAULT (getdate()) FOR [FechaFin]
GO
ALTER TABLE [dbo].[HistorialLaboral] ADD  DEFAULT (getdate()) FOR [FechaInicio]
GO
ALTER TABLE [dbo].[HistorialLaboral] ADD  DEFAULT (getdate()) FOR [FechaFin]
GO
ALTER TABLE [dbo].[Oferta] ADD  DEFAULT (getdate()) FOR [FechaInicio]
GO
ALTER TABLE [dbo].[Oferta] ADD  DEFAULT (getdate()) FOR [FechaFin]
GO
ALTER TABLE [dbo].[Planificacion] ADD  DEFAULT (getdate()) FOR [FechaApertura]
GO
ALTER TABLE [dbo].[Planificacion] ADD  DEFAULT (getdate()) FOR [FechaCierre]
GO
ALTER TABLE [dbo].[Planificacion] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Planificacion] ADD  DEFAULT (getdate()) FOR [FechaAprobado]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [FechaAcceso]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[HistorialAcademico]  WITH CHECK ADD  CONSTRAINT [FK_HistAcademico_Candidato] FOREIGN KEY([IDCandidato])
REFERENCES [dbo].[Candidato] ([IDCandidato])
GO
ALTER TABLE [dbo].[HistorialAcademico] CHECK CONSTRAINT [FK_HistAcademico_Candidato]
GO
ALTER TABLE [dbo].[HistorialLaboral]  WITH CHECK ADD  CONSTRAINT [FK_HistLab_Candidato] FOREIGN KEY([IDCandidato])
REFERENCES [dbo].[Candidato] ([IDCandidato])
GO
ALTER TABLE [dbo].[HistorialLaboral] CHECK CONSTRAINT [FK_HistLab_Candidato]
GO
ALTER TABLE [dbo].[Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Oferta_Planificacion] FOREIGN KEY([IDPlanificacion])
REFERENCES [dbo].[Planificacion] ([IDPlanificacion])
GO
ALTER TABLE [dbo].[Oferta] CHECK CONSTRAINT [FK_Oferta_Planificacion]
GO
ALTER TABLE [dbo].[Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Oferta_Programa] FOREIGN KEY([IDPrograma])
REFERENCES [dbo].[Programa] ([IDPrograma])
GO
ALTER TABLE [dbo].[Oferta] CHECK CONSTRAINT [FK_Oferta_Programa]
GO
ALTER TABLE [dbo].[Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Oferta_Universidad] FOREIGN KEY([IDUniversidad])
REFERENCES [dbo].[Universidad] ([IDUniversidad])
GO
ALTER TABLE [dbo].[Oferta] CHECK CONSTRAINT [FK_Oferta_Universidad]
GO
ALTER TABLE [dbo].[Planificacion]  WITH CHECK ADD  CONSTRAINT [FK_Planificacion_Pais] FOREIGN KEY([IDPais])
REFERENCES [dbo].[Pais] ([IDPais])
GO
ALTER TABLE [dbo].[Planificacion] CHECK CONSTRAINT [FK_Planificacion_Pais]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Candidato] FOREIGN KEY([IDCandidato])
REFERENCES [dbo].[Candidato] ([IDCandidato])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Candidato]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Oferta] FOREIGN KEY([IDOferta])
REFERENCES [dbo].[Oferta] ([IDOferta])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Oferta]
GO
ALTER TABLE [dbo].[Universidad]  WITH CHECK ADD  CONSTRAINT [FK_Universidad_Ciudad] FOREIGN KEY([IDCiudad])
REFERENCES [dbo].[Ciudad] ([IDCiudad])
GO
ALTER TABLE [dbo].[Universidad] CHECK CONSTRAINT [FK_Universidad_Ciudad]
GO
ALTER TABLE [dbo].[Universidad]  WITH CHECK ADD  CONSTRAINT [FK_Universidad_Pais] FOREIGN KEY([IDPais])
REFERENCES [dbo].[Pais] ([IDPais])
GO
ALTER TABLE [dbo].[Universidad] CHECK CONSTRAINT [FK_Universidad_Pais]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Candidato] FOREIGN KEY([IDCandidato])
REFERENCES [dbo].[Candidato] ([IDCandidato])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Candidato]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Pais] FOREIGN KEY([IDPais])
REFERENCES [dbo].[Pais] ([IDPais])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Pais]
GO
USE [master]
GO
ALTER DATABASE [GestionBecas] SET  READ_WRITE 
GO
