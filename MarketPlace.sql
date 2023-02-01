USE [master]
GO
/****** Object:  Database [POC_Marketplace]    Script Date: 1/30/2023 9:27:07 PM ******/
CREATE DATABASE [POC_Marketplace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POC_Marketplace', FILENAME = N'C:\Users\wxc11\POC_Marketplace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'POC_Marketplace_log', FILENAME = N'C:\Users\wxc11\POC_Marketplace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [POC_Marketplace] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POC_Marketplace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POC_Marketplace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POC_Marketplace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POC_Marketplace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POC_Marketplace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POC_Marketplace] SET ARITHABORT OFF 
GO
ALTER DATABASE [POC_Marketplace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POC_Marketplace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POC_Marketplace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POC_Marketplace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POC_Marketplace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POC_Marketplace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POC_Marketplace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POC_Marketplace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POC_Marketplace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POC_Marketplace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POC_Marketplace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POC_Marketplace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POC_Marketplace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POC_Marketplace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POC_Marketplace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POC_Marketplace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POC_Marketplace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POC_Marketplace] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [POC_Marketplace] SET  MULTI_USER 
GO
ALTER DATABASE [POC_Marketplace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POC_Marketplace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POC_Marketplace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POC_Marketplace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [POC_Marketplace] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [POC_Marketplace] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [POC_Marketplace] SET QUERY_STORE = OFF
GO
USE [POC_Marketplace]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Category_ID] [int] NOT NULL,
	[Category_Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](max) NOT NULL,
	[Product_Image] [image] NULL,
	[Series] [varchar](max) NULL,
	[Model] [varchar](max) NULL,
	[Model_Year] [int] NULL,
	[Series_Info] [varchar](max) NULL,
	[Feature] [varchar](max) NULL,
	[SubCategory_ID] [int] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[Project_ID] [int] NOT NULL,
	[Project_Name] [varchar](max) NOT NULL,
	[User_ID] [numeric](18, 0) NOT NULL,
	[Project_Address1] [varchar](max) NOT NULL,
	[Preject_Address2] [varchar](max) NULL,
	[Project_City] [varchar](50) NOT NULL,
	[Project_State] [varchar](50) NOT NULL,
	[Project_Size] [varchar](50) NULL,
	[Client_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED 
(
	[Project_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjToProd]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjToProd](
	[Project_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_tblProjToProd] PRIMARY KEY CLUSTERED 
(
	[Project_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProperty]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProperty](
	[Property_ID] [int] NOT NULL,
	[Property_Name] [varchar](max) NOT NULL,
	[IsType] [binary](50) NOT NULL,
	[IsTechSpec] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblProperty] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPropertyValue]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPropertyValue](
	[Property_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Value] [float] NULL,
 CONSTRAINT [PK_tblPropertyValue] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCategory_ID] [int] NOT NULL,
	[Catagory_ID] [int] NOT NULL,
	[SubCategory_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTechSpecFilter]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTechSpecFilter](
	[Property_ID] [int] NOT NULL,
	[SubCategory_ID] [int] NOT NULL,
	[Min_Value] [float] NOT NULL,
	[Max_Value] [float] NULL,
 CONSTRAINT [PK_tblTechSpecFilter] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypeFilter]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeFilter](
	[Property_ID] [int] NOT NULL,
	[SubCategory_ID] [int] NOT NULL,
	[Type_Name] [varchar](max) NOT NULL,
	[Type_Options] [varchar](max) NULL,
 CONSTRAINT [PK_tblTypeFilter] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 1/30/2023 9:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[User_ID] [numeric](18, 0) NOT NULL,
	[User_Name] [varchar](max) NOT NULL,
	[User_Email] [varchar](max) NOT NULL,
	[User_Image] [image] NULL,
	[User_Password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblSubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[tblSubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblSubCategory]
GO
ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblUser] FOREIGN KEY([User_ID])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_tblProject_tblUser]
GO
ALTER TABLE [dbo].[tblProjToProd]  WITH CHECK ADD  CONSTRAINT [FK_tblProjToProd_tblProduct] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tblProduct] ([Product_ID])
GO
ALTER TABLE [dbo].[tblProjToProd] CHECK CONSTRAINT [FK_tblProjToProd_tblProduct]
GO
ALTER TABLE [dbo].[tblProjToProd]  WITH CHECK ADD  CONSTRAINT [FK_tblProjToProd_tblProject] FOREIGN KEY([Project_ID])
REFERENCES [dbo].[tblProject] ([Project_ID])
GO
ALTER TABLE [dbo].[tblProjToProd] CHECK CONSTRAINT [FK_tblProjToProd_tblProject]
GO
ALTER TABLE [dbo].[tblPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_tblPropertyValue_tblProduct] FOREIGN KEY([Property_ID])
REFERENCES [dbo].[tblProduct] ([Product_ID])
GO
ALTER TABLE [dbo].[tblPropertyValue] CHECK CONSTRAINT [FK_tblPropertyValue_tblProduct]
GO
ALTER TABLE [dbo].[tblPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_tblPropertyValue_tblProperty] FOREIGN KEY([Property_ID])
REFERENCES [dbo].[tblProperty] ([Property_ID])
GO
ALTER TABLE [dbo].[tblPropertyValue] CHECK CONSTRAINT [FK_tblPropertyValue_tblProperty]
GO
ALTER TABLE [dbo].[tblSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY([Catagory_ID])
REFERENCES [dbo].[tblCategory] ([Category_ID])
GO
ALTER TABLE [dbo].[tblSubCategory] CHECK CONSTRAINT [FK_tblSubCategory_tblCategory]
GO
ALTER TABLE [dbo].[tblTechSpecFilter]  WITH CHECK ADD  CONSTRAINT [FK_tblTechSpecFilter_tblProperty] FOREIGN KEY([Property_ID])
REFERENCES [dbo].[tblProperty] ([Property_ID])
GO
ALTER TABLE [dbo].[tblTechSpecFilter] CHECK CONSTRAINT [FK_tblTechSpecFilter_tblProperty]
GO
ALTER TABLE [dbo].[tblTechSpecFilter]  WITH CHECK ADD  CONSTRAINT [FK_tblTechSpecFilter_tblSubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[tblSubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[tblTechSpecFilter] CHECK CONSTRAINT [FK_tblTechSpecFilter_tblSubCategory]
GO
ALTER TABLE [dbo].[tblTypeFilter]  WITH CHECK ADD  CONSTRAINT [FK_tblTypeFilter_tblProperty] FOREIGN KEY([Property_ID])
REFERENCES [dbo].[tblProperty] ([Property_ID])
GO
ALTER TABLE [dbo].[tblTypeFilter] CHECK CONSTRAINT [FK_tblTypeFilter_tblProperty]
GO
ALTER TABLE [dbo].[tblTypeFilter]  WITH CHECK ADD  CONSTRAINT [FK_tblTypeFilter_tblSubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[tblSubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[tblTypeFilter] CHECK CONSTRAINT [FK_tblTypeFilter_tblSubCategory]
GO
USE [master]
GO
ALTER DATABASE [POC_Marketplace] SET  READ_WRITE 
GO
