USE [master]
GO
/****** Base de datos  creada por: ******/

/****** Cristopher Ramon ******/ 
/****** Matricula: 16-siin-1-127 ******/
/****** univerdidad Dominicana O&M ******/
/****** Profesor: Srtarling Germosen ******/

CREATE DATABASE [FARMACIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FARMACIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL\MSSQL\DATA\FARMACIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FARMACIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL\MSSQL\DATA\FARMACIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FARMACIA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FARMACIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FARMACIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FARMACIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FARMACIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FARMACIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FARMACIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [FARMACIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FARMACIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FARMACIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FARMACIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FARMACIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FARMACIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FARMACIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FARMACIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FARMACIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FARMACIA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FARMACIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FARMACIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FARMACIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FARMACIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FARMACIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FARMACIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FARMACIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FARMACIA] SET RECOVERY FULL 
GO
ALTER DATABASE [FARMACIA] SET  MULTI_USER 
GO
ALTER DATABASE [FARMACIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FARMACIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FARMACIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FARMACIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FARMACIA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FARMACIA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FARMACIA', N'ON'
GO
ALTER DATABASE [FARMACIA] SET QUERY_STORE = OFF
GO
USE [FARMACIA]
GO
/****** Object:  Table [dbo].[Boleta]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleta](
	[num_boleta] [varchar](8) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cod_empl] [varchar](8) NOT NULL,
	[cod_cli] [varchar](8) NOT NULL,
	[num_ordenpedido] [varchar](8) NOT NULL,
	[subtotal] [int] NOT NULL,
	[descuento] [int] NULL,
	[total] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[num_boleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[cod_cate] [varchar](8) NOT NULL,
	[nom_des] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[cod_cli] [varchar](8) NOT NULL,
	[nom_cli] [varchar](40) NOT NULL,
	[dir_cli] [varchar](40) NULL,
	[cod_dis] [varchar](8) NULL,
	[sexo] [varchar](1) NOT NULL,
	[DNI] [int] NULL,
	[RUC] [int] NULL,
	[Telefono] [int] NULL,
	[Celular] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleOrdenPedido]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrdenPedido](
	[num_ordenp] [varchar](8) NOT NULL,
	[cod_pro] [varchar](8) NOT NULL,
	[nom_pro] [varchar](40) NOT NULL,
	[cantidad] [decimal](10, 2) NULL,
	[precio_venta] [decimal](10, 2) NULL,
	[importe] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[num_ordenp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[cod_dis] [varchar](8) NOT NULL,
	[nom_dis] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[cod_emp] [varchar](8) NOT NULL,
	[nom_emp] [varchar](40) NOT NULL,
	[dir_emp] [varchar](40) NULL,
	[cod_dis] [varchar](8) NOT NULL,
	[cargo] [varchar](40) NOT NULL,
	[edad] [varchar](2) NULL,
	[cel] [int] NULL,
	[ingreso] [datetime] NOT NULL,
	[clave] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenPedido]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenPedido](
	[num_ordenPedido] [varchar](8) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cod_cli] [varchar](8) NULL,
	[nom_cli] [varchar](40) NULL,
	[cod_emp] [varchar](8) NULL,
	[cod_tipoPago] [varchar](8) NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[num_ordenPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[cod_pre] [varchar](8) NOT NULL,
	[nom_pre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_pre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[cod_pro] [varchar](8) NOT NULL,
	[nom_pro] [varchar](40) NOT NULL,
	[pre_venta] [decimal](10, 2) NOT NULL,
	[pre_compra] [decimal](10, 2) NOT NULL,
	[fecha_venc] [datetime] NOT NULL,
	[stock] [int] NOT NULL,
	[cod_cate] [varchar](8) NOT NULL,
	[cod_prov] [varchar](8) NULL,
	[cod_pres] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_pro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[cod_prov] [varchar](8) NOT NULL,
	[nom_prov] [varchar](40) NOT NULL,
	[dir_prov] [varchar](50) NULL,
	[telefono] [char](7) NULL,
	[celular] [char](10) NULL,
	[id_distrito] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/12/2022 14:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[cod_usu] [varchar](8) NOT NULL,
	[cod_emp] [varchar](8) NOT NULL,
	[nivel_usu] [varchar](2) NOT NULL,
	[nom_usu] [varchar](30) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[activo] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_usu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Boleta] ([num_boleta], [fecha], [cod_empl], [cod_cli], [num_ordenpedido], [subtotal], [descuento], [total]) VALUES (N'12344632', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'00123', N'00534', N'88883429', 746, 240, 30)
INSERT [dbo].[Boleta] ([num_boleta], [fecha], [cod_empl], [cod_cli], [num_ordenpedido], [subtotal], [descuento], [total]) VALUES (N'12345676', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'00123', N'00267', N'88883428', 644, 340, 10)
INSERT [dbo].[Boleta] ([num_boleta], [fecha], [cod_empl], [cod_cli], [num_ordenpedido], [subtotal], [descuento], [total]) VALUES (N'12345678', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'00123', N'00819', N'88883425', 342, 340, 10)
INSERT [dbo].[Boleta] ([num_boleta], [fecha], [cod_empl], [cod_cli], [num_ordenpedido], [subtotal], [descuento], [total]) VALUES (N'23437844', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'00123', N'00814', N'88883427', 345, 300, 10)
INSERT [dbo].[Boleta] ([num_boleta], [fecha], [cod_empl], [cod_cli], [num_ordenpedido], [subtotal], [descuento], [total]) VALUES (N'98237844', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'00123', N'00829', N'88883426', 744, 340, 10)
GO
INSERT [dbo].[Categoria] ([cod_cate], [nom_des]) VALUES (N'23423', N'FIEBRE')
INSERT [dbo].[Categoria] ([cod_cate], [nom_des]) VALUES (N'24567', N'DESINFLAMANTE DE ROSTRO')
INSERT [dbo].[Categoria] ([cod_cate], [nom_des]) VALUES (N'34345', N'PARA LOS DOLORES MUSCULARES')
INSERT [dbo].[Categoria] ([cod_cate], [nom_des]) VALUES (N'56445', N'PARA LOS DOLORES MUELAS')
INSERT [dbo].[Categoria] ([cod_cate], [nom_des]) VALUES (N'87653', N'PARA LOS DOLORES CABEZA')
INSERT [dbo].[Categoria] ([cod_cate], [nom_des]) VALUES (N'99767', N'RESFRIO')
GO
INSERT [dbo].[Clientes] ([cod_cli], [nom_cli], [dir_cli], [cod_dis], [sexo], [DNI], [RUC], [Telefono], [Celular]) VALUES (N'34984835', N'CLEMENTE', N'LIMA S/N', N'062', N'M', 72884742, 1072884742, 3288428, 997547215)
INSERT [dbo].[Clientes] ([cod_cli], [nom_cli], [dir_cli], [cod_dis], [sexo], [DNI], [RUC], [Telefono], [Celular]) VALUES (N'45346523', N'RUFUEL', N'LIMA S/N', N'034', N'M', 84884042, 1084884042, 3266428, 997547699)
INSERT [dbo].[Clientes] ([cod_cli], [nom_cli], [dir_cli], [cod_dis], [sexo], [DNI], [RUC], [Telefono], [Celular]) VALUES (N'45346524', N'DANTE', N'LIMA S/N', N'054', N'M', 84884942, 1084884942, 3266428, 997547688)
INSERT [dbo].[Clientes] ([cod_cli], [nom_cli], [dir_cli], [cod_dis], [sexo], [DNI], [RUC], [Telefono], [Celular]) VALUES (N'45346525', N'LUIS', N'LIMA S/N', N'056', N'M', 84884765, 1084884652, 3266428, 997547677)
INSERT [dbo].[Clientes] ([cod_cli], [nom_cli], [dir_cli], [cod_dis], [sexo], [DNI], [RUC], [Telefono], [Celular]) VALUES (N'45346576', N'HARRY', N'LIMA S/N', N'065', N'M', 84884342, 1084884342, 3266428, 997547655)
GO
INSERT [dbo].[DetalleOrdenPedido] ([num_ordenp], [cod_pro], [nom_pro], [cantidad], [precio_venta], [importe]) VALUES (N'32', N'090398', N'ASPIRINAS', CAST(19.30 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.12 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenPedido] ([num_ordenp], [cod_pro], [nom_pro], [cantidad], [precio_venta], [importe]) VALUES (N'43', N'003903', N'CELESTAL', CAST(15.30 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.12 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenPedido] ([num_ordenp], [cod_pro], [nom_pro], [cantidad], [precio_venta], [importe]) VALUES (N'44', N'090358', N'DOLOCONTO', CAST(19.30 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.18 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenPedido] ([num_ordenp], [cod_pro], [nom_pro], [cantidad], [precio_venta], [importe]) VALUES (N'53', N'000938', N'PANADOL', CAST(19.30 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.14 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenPedido] ([num_ordenp], [cod_pro], [nom_pro], [cantidad], [precio_venta], [importe]) VALUES (N'55', N'003983', N'FORTE AS', CAST(15.30 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.12 AS Decimal(10, 2)))
GO
INSERT [dbo].[Distrito] ([cod_dis], [nom_dis]) VALUES (N'054', N'ATE')
INSERT [dbo].[Distrito] ([cod_dis], [nom_dis]) VALUES (N'065', N'CHOSICA')
INSERT [dbo].[Distrito] ([cod_dis], [nom_dis]) VALUES (N'056', N'LIMA')
INSERT [dbo].[Distrito] ([cod_dis], [nom_dis]) VALUES (N'062', N'LURIGANCHO')
INSERT [dbo].[Distrito] ([cod_dis], [nom_dis]) VALUES (N'034', N'VICTORIA')
GO
INSERT [dbo].[Empleado] ([cod_emp], [nom_emp], [dir_emp], [cod_dis], [cargo], [edad], [cel], [ingreso], [clave]) VALUES (N'20140152', N'HARRY VARGAS', N'LIMA S/N', N'062', N'SUPERVISOR', N'24', 137287431, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[Empleado] ([cod_emp], [nom_emp], [dir_emp], [cod_dis], [cargo], [edad], [cel], [ingreso], [clave]) VALUES (N'20566162', N'MANOLO MANILIN', N'LIMA S/N', N'065', N'FARMACEUTICO', N'24', 137287253, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[Empleado] ([cod_emp], [nom_emp], [dir_emp], [cod_dis], [cargo], [edad], [cel], [ingreso], [clave]) VALUES (N'24360992', N'APONTE VENGAS', N'LIMA S/N', N'065', N'ADMIN', N'24', 997287215, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[Empleado] ([cod_emp], [nom_emp], [dir_emp], [cod_dis], [cargo], [edad], [cel], [ingreso], [clave]) VALUES (N'28748376', N'JOSE CONDOR', N'LIMA S/N', N'034', N'FARMACEUTICO', N'24', 997287215, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[Empleado] ([cod_emp], [nom_emp], [dir_emp], [cod_dis], [cargo], [edad], [cel], [ingreso], [clave]) VALUES (N'65646454', N'LUIS CASTILLO', N'LIMA S/N', N'034', N'SERVI', N'24', 137287223, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[Empleado] ([cod_emp], [nom_emp], [dir_emp], [cod_dis], [cargo], [edad], [cel], [ingreso], [clave]) VALUES (N'94360139', N'FREDY QUISPE', N'LIMA S/N', N'056', N'SUPERVISOR', N'94', 137987223, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'1234')
INSERT [dbo].[Empleado] ([cod_emp], [nom_emp], [dir_emp], [cod_dis], [cargo], [edad], [cel], [ingreso], [clave]) VALUES (N'94364339', N'ERIK LOCAL', N'LIMA S/N', N'054', N'SERVI', N'94', 137987923, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'1934')
GO
INSERT [dbo].[OrdenPedido] ([num_ordenPedido], [fecha], [cod_cli], [nom_cli], [cod_emp], [cod_tipoPago], [total]) VALUES (N'88883425', CAST(N'2016-08-08T00:00:00.000' AS DateTime), N'34984835', N'HARRY VARGAS', N'24360992', N'44333475', 245)
INSERT [dbo].[OrdenPedido] ([num_ordenPedido], [fecha], [cod_cli], [nom_cli], [cod_emp], [cod_tipoPago], [total]) VALUES (N'88883426', CAST(N'2016-08-08T00:00:00.000' AS DateTime), N'45346576', N'LUIS BARIOS', N'65646454', N'43334634', 80)
INSERT [dbo].[OrdenPedido] ([num_ordenPedido], [fecha], [cod_cli], [nom_cli], [cod_emp], [cod_tipoPago], [total]) VALUES (N'88883427', CAST(N'2016-08-08T00:00:00.000' AS DateTime), N'45346523', N'GLADYS SOTO', N'94364339', N'44335457', 600)
INSERT [dbo].[OrdenPedido] ([num_ordenPedido], [fecha], [cod_cli], [nom_cli], [cod_emp], [cod_tipoPago], [total]) VALUES (N'88883428', CAST(N'2016-08-08T00:00:00.000' AS DateTime), N'45346524', N'LOLA APAZA', N'94360139', N'44895645', 6754)
INSERT [dbo].[OrdenPedido] ([num_ordenPedido], [fecha], [cod_cli], [nom_cli], [cod_emp], [cod_tipoPago], [total]) VALUES (N'88883429', CAST(N'2016-08-08T00:00:00.000' AS DateTime), N'45346525', N'PILAR QUISPE', N'20140152', N'44304674', 345)
GO
INSERT [dbo].[Presentacion] ([cod_pre], [nom_pre]) VALUES (N'0026', N'HARRY VARGAS')
INSERT [dbo].[Presentacion] ([cod_pre], [nom_pre]) VALUES (N'0027', N'RUFUEL SOTO')
INSERT [dbo].[Presentacion] ([cod_pre], [nom_pre]) VALUES (N'0028', N'ANGEL ANGUILA')
INSERT [dbo].[Presentacion] ([cod_pre], [nom_pre]) VALUES (N'0029', N'ROBERT LAS CASAS')
INSERT [dbo].[Presentacion] ([cod_pre], [nom_pre]) VALUES (N'0030', N'LUIS ISU')
GO
INSERT [dbo].[Producto] ([cod_pro], [nom_pro], [pre_venta], [pre_compra], [fecha_venc], [stock], [cod_cate], [cod_prov], [cod_pres]) VALUES (N'000938', N'PANADOL', CAST(1.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 20, N'56445', N'00823', N'0027')
INSERT [dbo].[Producto] ([cod_pro], [nom_pro], [pre_venta], [pre_compra], [fecha_venc], [stock], [cod_cate], [cod_prov], [cod_pres]) VALUES (N'003903', N'CELESTAL', CAST(2.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 20, N'24567', N'00824', N'0029')
INSERT [dbo].[Producto] ([cod_pro], [nom_pro], [pre_venta], [pre_compra], [fecha_venc], [stock], [cod_cate], [cod_prov], [cod_pres]) VALUES (N'003983', N'FORTE AS', CAST(4.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 20, N'99767', N'00127', N'0030')
INSERT [dbo].[Producto] ([cod_pro], [nom_pro], [pre_venta], [pre_compra], [fecha_venc], [stock], [cod_cate], [cod_prov], [cod_pres]) VALUES (N'090358', N'DOLOCONTO', CAST(1.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 20, N'87653', N'00123', N'0028')
INSERT [dbo].[Producto] ([cod_pro], [nom_pro], [pre_venta], [pre_compra], [fecha_venc], [stock], [cod_cate], [cod_prov], [cod_pres]) VALUES (N'090398', N'ASPIRINAS', CAST(0.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 20, N'34345', N'00128', N'0026')
GO
INSERT [dbo].[Proveedor] ([cod_prov], [nom_prov], [dir_prov], [telefono], [celular], [id_distrito]) VALUES (N'00123', N'okas', N'lima VICTORIA s/n', N'3244334', N'9972872344', N'034')
INSERT [dbo].[Proveedor] ([cod_prov], [nom_prov], [dir_prov], [telefono], [celular], [id_distrito]) VALUES (N'00127', N'faresca', N'lima VICTORIA s/n', N'3246450', N'997654566 ', N'056')
INSERT [dbo].[Proveedor] ([cod_prov], [nom_prov], [dir_prov], [telefono], [celular], [id_distrito]) VALUES (N'00128', N'luis las casa', N'lima VICTORIA s/n', N'3244550', N'997287262 ', N'062')
INSERT [dbo].[Proveedor] ([cod_prov], [nom_prov], [dir_prov], [telefono], [celular], [id_distrito]) VALUES (N'00823', N'las vegas', N'lima VICTORIA s/n', N'3246343', N'997284534 ', N'065')
INSERT [dbo].[Proveedor] ([cod_prov], [nom_prov], [dir_prov], [telefono], [celular], [id_distrito]) VALUES (N'00824', N'farmedi', N'lima VICTORIA s/n', N'3246343', N'997287564 ', N'054')
GO
INSERT [dbo].[Usuario] ([cod_usu], [cod_emp], [nivel_usu], [nom_usu], [password], [activo]) VALUES (N'12345678', N'24360992', N'1', N'HARRY', N'1234', N'si')
INSERT [dbo].[Usuario] ([cod_usu], [cod_emp], [nivel_usu], [nom_usu], [password], [activo]) VALUES (N'23445348', N'94360139', N'4', N'JESUS', N'2365', N'si')
INSERT [dbo].[Usuario] ([cod_usu], [cod_emp], [nivel_usu], [nom_usu], [password], [activo]) VALUES (N'23456789', N'65646454', N'2', N'BLADI', N'4343', N'si')
INSERT [dbo].[Usuario] ([cod_usu], [cod_emp], [nivel_usu], [nom_usu], [password], [activo]) VALUES (N'23457878', N'20140152', N'5', N'ROBERT', N'6572', N'si')
INSERT [dbo].[Usuario] ([cod_usu], [cod_emp], [nivel_usu], [nom_usu], [password], [activo]) VALUES (N'98765654', N'94364339', N'3', N'RUBI', N'6656', N'si')
GO
/****** Object:  Index [uni_dni]    Script Date: 12/12/2022 14:10:25 ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [uni_dni] UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uni_distrito]    Script Date: 12/12/2022 14:10:25 ******/
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [uni_distrito] UNIQUE NONCLUSTERED 
(
	[nom_dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [pk_or_pedi] FOREIGN KEY([num_ordenpedido])
REFERENCES [dbo].[OrdenPedido] ([num_ordenPedido])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [pk_or_pedi]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [pk_cod_dis_cli] FOREIGN KEY([cod_dis])
REFERENCES [dbo].[Distrito] ([cod_dis])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [pk_cod_dis_cli]
GO
ALTER TABLE [dbo].[DetalleOrdenPedido]  WITH CHECK ADD  CONSTRAINT [pk_cod_pro] FOREIGN KEY([cod_pro])
REFERENCES [dbo].[Producto] ([cod_pro])
GO
ALTER TABLE [dbo].[DetalleOrdenPedido] CHECK CONSTRAINT [pk_cod_pro]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [pk_cod_dis] FOREIGN KEY([cod_dis])
REFERENCES [dbo].[Distrito] ([cod_dis])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [pk_cod_dis]
GO
ALTER TABLE [dbo].[OrdenPedido]  WITH CHECK ADD  CONSTRAINT [pk_cod_cli] FOREIGN KEY([cod_cli])
REFERENCES [dbo].[Clientes] ([cod_cli])
GO
ALTER TABLE [dbo].[OrdenPedido] CHECK CONSTRAINT [pk_cod_cli]
GO
ALTER TABLE [dbo].[OrdenPedido]  WITH CHECK ADD  CONSTRAINT [pk_cod_clis] FOREIGN KEY([cod_cli])
REFERENCES [dbo].[Clientes] ([cod_cli])
GO
ALTER TABLE [dbo].[OrdenPedido] CHECK CONSTRAINT [pk_cod_clis]
GO
ALTER TABLE [dbo].[OrdenPedido]  WITH CHECK ADD  CONSTRAINT [pk_cod_empl] FOREIGN KEY([cod_emp])
REFERENCES [dbo].[Empleado] ([cod_emp])
GO
ALTER TABLE [dbo].[OrdenPedido] CHECK CONSTRAINT [pk_cod_empl]
GO
ALTER TABLE [dbo].[OrdenPedido]  WITH CHECK ADD  CONSTRAINT [pk_cod_enpL] FOREIGN KEY([cod_emp])
REFERENCES [dbo].[Empleado] ([cod_emp])
GO
ALTER TABLE [dbo].[OrdenPedido] CHECK CONSTRAINT [pk_cod_enpL]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [pk_cod_cate] FOREIGN KEY([cod_cate])
REFERENCES [dbo].[Categoria] ([cod_cate])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [pk_cod_cate]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [pk_cod_presentacion] FOREIGN KEY([cod_pres])
REFERENCES [dbo].[Presentacion] ([cod_pre])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [pk_cod_presentacion]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [pk_cod_prove] FOREIGN KEY([cod_prov])
REFERENCES [dbo].[Proveedor] ([cod_prov])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [pk_cod_prove]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [pk_cod_dis_pro] FOREIGN KEY([id_distrito])
REFERENCES [dbo].[Distrito] ([cod_dis])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [pk_cod_dis_pro]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [pk_cod_emple] FOREIGN KEY([cod_emp])
REFERENCES [dbo].[Empleado] ([cod_emp])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [pk_cod_emple]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_DNI] CHECK  ((len([dni])=(8)))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_DNI]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_SEXO] CHECK  (([SEXO]='F' OR [SEXO]='M'))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_SEXO]
GO
USE [master]
GO
ALTER DATABASE [FARMACIA] SET  READ_WRITE 
GO
