USE [master]
GO
/****** Object:  Database [SQLInjectors_ArmyDB]    Script Date: 11/10/2016 18:53:32 ******/
CREATE DATABASE [SQLInjectors_ArmyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLInjectors_ArmyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SQLInjectors_ArmyDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SQLInjectors_ArmyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SQLInjectors_ArmyDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLInjectors_ArmyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET  MULTI_USER 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SQLInjectors_ArmyDB]
GO
/****** Object:  Table [dbo].[Ammunition]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ammunition](
	[Ammo_Id] [int] IDENTITY(5,5) NOT NULL,
	[Ammo_Name] [varchar](30) NULL,
	[Ammo_Quantity] [int] NULL,
	[APurchase_Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Ammo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Army_Block]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Army_Block](
	[Block_Id] [char](3) NOT NULL,
	[Facility_Name] [varchar](60) NULL,
	[Quadrant] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Block_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Housing_Facilities]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Housing_Facilities](
	[Room_No] [char](3) NOT NULL,
	[Block_Id] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Room_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medical_Facility]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medical_Facility](
	[Visit_Id] [int] IDENTITY(1,1) NOT NULL,
	[Med_Record_Id] [char](5) NOT NULL,
	[Details] [varchar](100) NULL,
	[Personnel_Id] [char](6) NULL,
	[Date] [date] NULL,
 CONSTRAINT [pk_medical] PRIMARY KEY CLUSTERED 
(
	[Visit_Id] ASC,
	[Med_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Offence_Facility]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Offence_Facility](
	[Chamber_No] [int] NOT NULL,
	[Basement_Level] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Chamber_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Offenders]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Offenders](
	[Offender_Id] [char](6) NOT NULL,
	[Id_Number] [varchar](13) NULL,
	[First_Names] [varchar](40) NULL,
	[Surname] [varchar](15) NULL,
	[Gender] [char](1) NULL,
	[DOB] [date] NULL,
	[Country] [varchar](20) NULL,
	[Offence_Type] [varchar](90) NULL,
	[Capture_Date] [date] NULL,
	[Chamber_No] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Offender_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personnel](
	[Personnel_Id] [char](6) NOT NULL,
	[Id_Number] [char](13) NOT NULL,
	[First_Names] [varchar](40) NULL,
	[Surname] [varchar](25) NULL,
	[Gender] [char](1) NULL,
	[DOB] [date] NULL,
	[Rank] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[Family_Home_Number] [char](10) NULL,
	[Room_No] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Personnel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personnel_Participation]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personnel_Participation](
	[Personnel_Id] [char](6) NOT NULL,
	[Department_Id] [char](3) NOT NULL,
 CONSTRAINT [pk_Participation] PRIMARY KEY CLUSTERED 
(
	[Personnel_Id] ASC,
	[Department_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Storage_Facilities]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Storage_Facilities](
	[Section_Id] [char](2) NOT NULL,
	[Storage_Level] [varchar](20) NULL,
	[Block_Id] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Section_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplies](
	[Supply_Id] [int] IDENTITY(1,1) NOT NULL,
	[Supply_Name] [varchar](30) NULL,
	[Category] [varchar](25) NULL,
	[Quantity] [int] NULL,
	[SUnit_Purchase_Price] [decimal](18, 0) NULL,
	[Section_Id] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Supply_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Training_And_Research_Facilities]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Training_And_Research_Facilities](
	[Department_Id] [char](3) NOT NULL,
	[Department_Name] [varchar](60) NULL,
	[Location_Level] [varchar](20) NULL,
	[Block_Id] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Department_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Vehicle_Id] [int] IDENTITY(1,1) NOT NULL,
	[Vehicle_Name] [varchar](50) NULL,
	[Manufacturer] [varchar](40) NULL,
	[Category] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Dimensions_LxWxH] [varchar](30) NULL,
	[Weight_In_Tons] [decimal](3, 1) NULL,
	[VPurchase_Price] [decimal](18, 0) NULL,
	[Section_Id] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vehicle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Weapons]    Script Date: 11/10/2016 18:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Weapons](
	[Weapon_Id] [int] IDENTITY(1,1) NOT NULL,
	[Weapon_Name] [varchar](40) NULL,
	[Category] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Dimensions_LxWxH] [varchar](30) NULL,
	[Weight_In_Kgs] [decimal](4, 1) NULL,
	[Ammo_Id] [int] NULL,
	[WPurchase_Price] [decimal](18, 0) NULL,
	[Section_Id] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Weapon_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Housing_Facilities]  WITH CHECK ADD FOREIGN KEY([Block_Id])
REFERENCES [dbo].[Army_Block] ([Block_Id])
GO
ALTER TABLE [dbo].[Medical_Facility]  WITH CHECK ADD FOREIGN KEY([Personnel_Id])
REFERENCES [dbo].[Personnel] ([Personnel_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Offenders]  WITH CHECK ADD FOREIGN KEY([Chamber_No])
REFERENCES [dbo].[Offence_Facility] ([Chamber_No])
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD FOREIGN KEY([Room_No])
REFERENCES [dbo].[Housing_Facilities] ([Room_No])
GO
ALTER TABLE [dbo].[Personnel_Participation]  WITH CHECK ADD FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Training_And_Research_Facilities] ([Department_Id])
GO
ALTER TABLE [dbo].[Personnel_Participation]  WITH CHECK ADD FOREIGN KEY([Personnel_Id])
REFERENCES [dbo].[Personnel] ([Personnel_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Storage_Facilities]  WITH CHECK ADD FOREIGN KEY([Block_Id])
REFERENCES [dbo].[Army_Block] ([Block_Id])
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD FOREIGN KEY([Section_Id])
REFERENCES [dbo].[Storage_Facilities] ([Section_Id])
GO
ALTER TABLE [dbo].[Training_And_Research_Facilities]  WITH CHECK ADD FOREIGN KEY([Block_Id])
REFERENCES [dbo].[Army_Block] ([Block_Id])
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD FOREIGN KEY([Section_Id])
REFERENCES [dbo].[Storage_Facilities] ([Section_Id])
GO
ALTER TABLE [dbo].[Weapons]  WITH CHECK ADD FOREIGN KEY([Ammo_Id])
REFERENCES [dbo].[Ammunition] ([Ammo_Id])
GO
ALTER TABLE [dbo].[Weapons]  WITH CHECK ADD FOREIGN KEY([Section_Id])
REFERENCES [dbo].[Storage_Facilities] ([Section_Id])
GO
USE [master]
GO
ALTER DATABASE [SQLInjectors_ArmyDB] SET  READ_WRITE 
GO
