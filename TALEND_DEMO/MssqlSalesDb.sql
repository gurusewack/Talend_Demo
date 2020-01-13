USE [master]
GO

CREATE DATABASE [Sales]
 
GO
ALTER DATABASE [Sales] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sales] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sales] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Sales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sales] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sales] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sales] SET  MULTI_USER 
GO
ALTER DATABASE [Sales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sales] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Sales]
GO
/****** Object:  Table [dbo].[Boomi_Customers]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
	[Street] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[CreatedDt] [datetime] NULL,
	[UpdatedDt] [datetime] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataControl]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataControl](
	[ControlId] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [varchar](250) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
 CONSTRAINT [PK_DataControl] PRIMARY KEY CLUSTERED 
(
	[ControlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Customers]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Customers](
	[Dim_CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[FullName] [varchar](350) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
	[Street] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[FullAddress] [varchar](50) NULL,
	[CreatedDt] [datetime] NULL,
	[UpdatedDt] [datetime] NULL,
	[DW_CreatedDt] [datetime] NULL,
	[DW_UpdatedDt] [datetime] NULL,
 CONSTRAINT [PK_Dim_Customers] PRIMARY KEY CLUSTERED 
(
	[Dim_CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Products]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Products](
	[Dim_ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [varchar](250) NULL,
	[ProductCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Catagory] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedDT] [datetime] NULL,
	[UpdatedDT] [datetime] NULL,
	[DW_CreatedDT] [datetime] NULL,
	[DW_UpdatedDT] [datetime] NULL,
 CONSTRAINT [PK_Dim_Products] PRIMARY KEY CLUSTERED 
(
	[Dim_ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Stores]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Stores](
	[Dim_StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NULL,
	[StoreCode] [varchar](50) NULL,
	[StoreName] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[CreatedDT] [datetime] NULL,
	[UpdatedDT] [datetime] NULL,
	[DW_CreatedDT] [datetime] NULL,
	[DW_UpdatedDT] [datetime] NULL,
 CONSTRAINT [PK_Dim_Stores] PRIMARY KEY CLUSTERED 
(
	[Dim_StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](250) NULL,
	[ProductCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Catagory] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedDT] [datetime] NULL,
	[UpdatedDT] [datetime] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stg_Customers]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stg_Customers](
	[Stg_CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
	[Street] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[CreatedDt] [datetime] NULL,
	[UpdatedDt] [datetime] NULL,
	[DW_CreatedDt] [datetime] NULL,
	[DW_UpdatedDt] [datetime] NULL,
 CONSTRAINT [PK_Stg_Customers] PRIMARY KEY CLUSTERED 
(
	[Stg_CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stg_Products]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stg_Products](
	[Stg_ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [varchar](250) NULL,
	[ProductCode] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Catagory] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedDT] [datetime] NULL,
	[UpdatedDT] [datetime] NULL,
	[DW_CreatedDT] [datetime] NULL,
	[DW_UpdatedDT] [datetime] NULL,
 CONSTRAINT [PK_Stg_Products] PRIMARY KEY CLUSTERED 
(
	[Stg_ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stg_Stores]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stg_Stores](
	[Stg_StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NULL,
	[StoreCode] [varchar](50) NULL,
	[StoreName] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[CreatedDT] [datetime] NULL,
	[UpdatedDT] [datetime] NULL,
	[DW_CreatedDT] [datetime] NULL,
	[DW_UpdatedDT] [datetime] NULL,
 CONSTRAINT [PK_Stg_Stores] PRIMARY KEY CLUSTERED 
(
	[Stg_StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreCode] [varchar](50) NULL,
	[StoreName] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[CreatedDT] [datetime] NULL,
	[UpdatedDT] [datetime] NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Temp_Customers]    Script Date: 13-Jan-20 7:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp_Customers](
	[CustomerId] [int] NOT NULL,
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
	[Street] [varchar](250) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[CreatedDt] [datetime] NULL,
	[UpdatedDt] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Sales] SET  READ_WRITE 
GO
