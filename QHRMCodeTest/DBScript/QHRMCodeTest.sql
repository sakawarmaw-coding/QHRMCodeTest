USE [master]
GO
/****** Object:  Database [QHRMCodeTest]    Script Date: 03/30/2025 12:42:43 PM ******/
CREATE DATABASE [QHRMCodeTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QHRMCodeTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\QHRMCodeTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QHRMCodeTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\QHRMCodeTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QHRMCodeTest] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QHRMCodeTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QHRMCodeTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QHRMCodeTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QHRMCodeTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QHRMCodeTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QHRMCodeTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QHRMCodeTest] SET  MULTI_USER 
GO
ALTER DATABASE [QHRMCodeTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QHRMCodeTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QHRMCodeTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QHRMCodeTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QHRMCodeTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QHRMCodeTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QHRMCodeTest] SET QUERY_STORE = ON
GO
ALTER DATABASE [QHRMCodeTest] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QHRMCodeTest]
GO
/****** Object:  Table [dbo].[TblProduct]    Script Date: 03/30/2025 12:42:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_TblProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblProduct] ON 

INSERT [dbo].[TblProduct] ([Id], [Name], [Description], [Price], [CreatedDate], [ModifiedDate]) VALUES (1, N'Galaxy A55 (8/256 GB) (5G)', N'The most popular device', CAST(2259000.00 AS Decimal(18, 2)), CAST(N'2025-03-30T12:33:08.087' AS DateTime), NULL)
INSERT [dbo].[TblProduct] ([Id], [Name], [Description], [Price], [CreatedDate], [ModifiedDate]) VALUES (2, N'Galaxy Z Fold6 (12/256GB)', N'The most popular device', CAST(8415000.00 AS Decimal(18, 2)), CAST(N'2025-03-30T12:35:21.320' AS DateTime), NULL)
INSERT [dbo].[TblProduct] ([Id], [Name], [Description], [Price], [CreatedDate], [ModifiedDate]) VALUES (3, N'Galaxy Z Flip6 (12/256GB)', N'The most popular device', CAST(5500000.00 AS Decimal(18, 2)), CAST(N'2025-03-30T12:36:57.733' AS DateTime), NULL)
INSERT [dbo].[TblProduct] ([Id], [Name], [Description], [Price], [CreatedDate], [ModifiedDate]) VALUES (4, N'Galaxy Z Flip6 (12/512GB)', N'The most popular device', CAST(6099000.00 AS Decimal(18, 2)), CAST(N'2025-03-30T12:37:31.220' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TblProduct] OFF
GO
USE [master]
GO
ALTER DATABASE [QHRMCodeTest] SET  READ_WRITE 
GO
