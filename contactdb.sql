USE [master]
GO
/****** Object:  Database [ContactDB]    Script Date: 2/15/2022 8:14:58 PM ******/
CREATE DATABASE [ContactDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContactDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ContactDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ContactDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ContactDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ContactDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContactDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContactDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContactDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContactDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContactDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContactDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContactDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContactDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContactDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContactDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContactDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContactDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContactDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContactDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContactDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContactDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContactDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContactDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContactDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContactDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContactDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContactDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContactDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContactDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ContactDB] SET  MULTI_USER 
GO
ALTER DATABASE [ContactDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContactDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContactDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContactDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ContactDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ContactDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ContactDB', N'ON'
GO
ALTER DATABASE [ContactDB] SET QUERY_STORE = OFF
GO
USE [ContactDB]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 2/15/2022 8:14:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[contactID] [bigint] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](20) NOT NULL,
	[lastName] [nvarchar](20) NOT NULL,
	[streetAddress] [nvarchar](80) NOT NULL,
	[city] [nvarchar](40) NOT NULL,
	[stateCode] [nchar](2) NOT NULL,
	[zipCode] [nvarchar](5) NOT NULL,
	[phoneNumber] [nvarchar](10) NOT NULL,
	[note] [text] NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 2/15/2022 8:14:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[stateCode] [nchar](2) NOT NULL,
	[stateName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[stateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[contact] OFF

INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'James', N'Doe', N'123 test', N'Terrell', N'TX', N'75126', N'1234567890', N'da')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Zoey', N'Brown', N'456 Somewhere Ave', N'Forney', N'TX', N'75126', N'0987654321', N'ad')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'John', N'Deer', N'4123 Kemp Drive', N'Terrell', N'TX', N'75126', N'1234567890', N'da')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Harry', N'Tapley', N'2456 Somewhere Ave', N'Forney', N'TX', N'75126', N'0987654321', N'ad')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Emma', N'Costlow', N'13 Test Ln', N'Terrell', N'TX', N'75126', N'1234567890', N'da')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Morgan', N'Smith', N'43456 Nowhere Ave', N'Forney', N'TX', N'75126', N'0987654321', N'ad')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Juan', N'Garcis', N'123 Live Oak Drive', N'Terrell', N'TX', N'75126', N'1234567890', N'da')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Zac', N'Gray', N'456 Apple Orchard Ave', N'Forney', N'TX', N'75126', N'0987654321', N'ad')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Ted', N'Doey', N'123 test', N'Terrell', N'TX', N'75126', N'1234567890', N'da')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Linda', N'Brown', N'456 Somewhere Ave', N'Forney', N'TX', N'75126', N'0987654321', N'ad')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Jim', N'Reddy', N'123 test', N'Terrell', N'TX', N'75126', N'1234567890', N'da')
INSERT [dbo].[contact] ([firstName], [lastName], [streetAddress], [city], [stateCode], [zipCode], [phoneNumber], [note]) VALUES (N'Vera', N'Black', N'456 Somewhere Ave', N'Forney', N'TX', N'75126', N'0987654321', N'ad')


SET IDENTITY_INSERT [dbo].[contact] OFF
GO
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AK', N'Alaska')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AL', N'Alabama')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AR', N'Arkansas')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'AZ', N'Arizona')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'CA', N'California')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'CO', N'Colorado')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'CT', N'Connecticut')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'DC', N'District of Columbia')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'DE', N'Delaware')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'FL', N'Florida')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'GA', N'Georgia')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'HI', N'Hawaii')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'IA', N'Iowa')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'ID', N'Idaho')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'IL', N'Illinois')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'IN', N'Indiana')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'KS', N'Kansas')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'KY', N'Kentucky')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'LA', N'Louisiana')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MA', N'Massachusetts')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MD', N'Maryland')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'ME', N'Maine')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MI', N'Michigan')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MN', N'Minnesota')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MO', N'Missouri')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MS', N'Mississippi')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'MT', N'Montana')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NC', N'North Carolina')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'ND', N'North Dakota')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NE', N'Nebraska')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NH', N'New Hampshire')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NJ', N'New Jersey')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NM', N'New Mexico')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NV', N'Nevada')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'NY', N'New York')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'OH', N'Ohio')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'OK', N'Oklahoma')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'OR', N'Oregon')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'PA', N'Pennsylvania')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'PR', N'Puerto Rico')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'RI', N'Rhode Island')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'SC', N'South Carolina')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'SD', N'South Dakota')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'TN', N'Tennessee')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'TX', N'Texas')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'UT', N'Utah')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'VA', N'Virginia')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'VT', N'Vermont')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WA', N'Washington')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WI', N'Wisconsin')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WV', N'West Virginia')
INSERT [dbo].[state] ([stateCode], [stateName]) VALUES (N'WY', N'Wyoming')
GO
USE [master]
GO
ALTER DATABASE [ContactDB] SET  READ_WRITE 
GO
