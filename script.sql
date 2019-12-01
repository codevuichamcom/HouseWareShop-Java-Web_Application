--DB for Project
USE [master]
GO
/****** Object:  Database [HouseWareShop]    Script Date: 12/1/2019 4:51:30 PM ******/
CREATE DATABASE [HouseWareShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HouseWareShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HouseWareShop.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HouseWareShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HouseWareShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HouseWareShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HouseWareShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HouseWareShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HouseWareShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HouseWareShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HouseWareShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HouseWareShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HouseWareShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HouseWareShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HouseWareShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HouseWareShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HouseWareShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HouseWareShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HouseWareShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HouseWareShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HouseWareShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HouseWareShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HouseWareShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HouseWareShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HouseWareShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HouseWareShop] SET RECOVERY FULL 
GO
ALTER DATABASE [HouseWareShop] SET  MULTI_USER 
GO
ALTER DATABASE [HouseWareShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HouseWareShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HouseWareShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HouseWareShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HouseWareShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HouseWareShop', N'ON'
GO
USE [HouseWareShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userName] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NULL,
	[displayName] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[status] [int] NULL,
	[create_date] [date] NULL CONSTRAINT [DF_Account_create_date]  DEFAULT (getdate()),
	[active_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountFB]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountFB](
	[id] [nvarchar](50) NOT NULL,
	[displayName] [nvarchar](100) NULL,
	[creat_date] [date] NULL CONSTRAINT [DF_AccountFB_creat_date]  DEFAULT (getdate()),
	[role_id] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__AccountF__3213E83FF2A27A50] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](200) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[image]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[image_name] [nvarchar](200) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](100) NULL,
	[shipping_id] [int] NULL,
	[create_date] [date] NULL CONSTRAINT [DF_order_create_date]  DEFAULT (getdate()),
	[total_price] [float] NULL,
	[note] [nvarchar](2000) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](200) NULL,
	[product_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[product_image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](2000) NULL,
	[image] [nvarchar](100) NULL,
	[create_date] [date] NULL CONSTRAINT [DF__product__create___145C0A3F]  DEFAULT (getdate()),
	[status] [int] NULL,
	[sub_category_id] [nchar](10) NULL,
	[sale] [float] NULL,
 CONSTRAINT [PK__product__3213E83FE0F71A36] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role_Account]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_Account](
	[code] [int] NOT NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_role_Account] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[id] [int] NOT NULL,
	[room_id] [int] NULL,
	[from] [date] NULL,
	[to] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](200) NULL,
 CONSTRAINT [PK__Shipping__3213E83F52ED128F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status_Account]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_Account](
	[code] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_Account] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status_category]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status_Order]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_Order](
	[code] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_Order] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status_product]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status_sub_category]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_sub_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_sub_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sub_category]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catetory_id] [int] NULL,
	[sub_category_name] [nvarchar](200) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_sub_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[view]    Script Date: 12/1/2019 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view](
	[view] [int] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'792159237907614', NULL, N'Hồng Quân', NULL, NULL, NULL, 4, 1, CAST(N'2019-11-10' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'minh', N'12345', N'Le Nhat Minh', N'Vinh Hung- Vinh Loc- Thanh Hoa', N'minhln@gmail.com', N'01234567890', 4, 1, CAST(N'2019-10-30' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'nghia', N'12345', N'Hoang Minh Nghia', N'Thanh Hoa', N'nghiahm@gmail.com', N'1234567890', 4, 1, CAST(N'2019-10-31' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'quan', N'12345', N'Le Hong Quan', N'Thanh Hoa', N'quanlhhe130736@fpt.edu.vn', N'0866823499', 1, 1, CAST(N'2019-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'sang', N'12345', N'Nguyen Van Sang', N'', N'sangnvhe130388@fpt.edu.vn', N'0393463756', 4, 3, CAST(N'2019-11-04' AS Date), NULL)
INSERT [dbo].[AccountFB] ([id], [displayName], [creat_date], [role_id], [status]) VALUES (N'738449750001771', N'Donald Knuthvh', CAST(N'2019-11-10' AS Date), 1, 1)
INSERT [dbo].[AccountFB] ([id], [displayName], [creat_date], [role_id], [status]) VALUES (N'792159237907614', N'Hồng Quân', CAST(N'2019-11-10' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [category], [status]) VALUES (1, N'Tools', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (2, N'Measurements', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (3, N'Improvement', 3)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (4, N'Lights&Lighting', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (5, N'Home&Garden', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (6, N'Others', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1, 1, N'tools/1_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (2, 1, N'tools/1_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (3, 1, N'tools/1_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (4, 1, N'tools/1_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (5, 1, N'tools/1_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (6, 2, N'tools/2_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (7, 2, N'tools/2_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (8, 2, N'tools/2_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (9, 2, N'tools/2_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (10, 2, N'tools/2_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (11, 3, N'tools/3_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (12, 3, N'tools/3_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (13, 3, N'tools/3_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (14, 3, N'tools/3_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (15, 3, N'tools/3_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (16, 4, N'tools/4_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (17, 4, N'tools/4_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (18, 4, N'tools/4_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (19, 4, N'tools/4_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (20, 4, N'tools/4_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (21, 5, N'tools/5_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (22, 5, N'tools/5_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (23, 5, N'tools/5_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (24, 5, N'tools/5_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (25, 5, N'tools/5_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (26, 6, N'tools/6_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (27, 6, N'tools/6_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (28, 6, N'tools/6_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (29, 6, N'tools/6_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (30, 6, N'tools/6_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (31, 7, N'tools/7_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (32, 7, N'tools/7_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (33, 7, N'tools/7_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (34, 7, N'tools/7_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (35, 7, N'tools/7_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (36, 8, N'tools/8_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (37, 8, N'tools/8_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (38, 8, N'tools/8_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (39, 8, N'tools/8_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (40, 8, N'tools/8_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (41, 9, N'tools/9_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (42, 9, N'tools/9_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (43, 9, N'tools/9_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (44, 9, N'tools/9_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (45, 9, N'tools/9_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (46, 10, N'tools/10_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (47, 10, N'tools/10_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (48, 10, N'tools/10_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (49, 10, N'tools/10_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (50, 10, N'tools/10_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (51, 11, N'tools/11_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (52, 11, N'tools/11_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (53, 11, N'tools/11_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (54, 11, N'tools/11_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (55, 11, N'tools/11_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (56, 12, N'tools/12_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (57, 12, N'tools/12_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (58, 12, N'tools/12_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (59, 12, N'tools/12_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (60, 12, N'tools/12_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (61, 13, N'tools/13_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (62, 13, N'tools/13_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (63, 13, N'tools/13_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (64, 13, N'tools/13_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (65, 13, N'tools/13_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (66, 14, N'tools/14_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (67, 14, N'tools/14_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (68, 14, N'tools/14_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (69, 14, N'tools/14_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (70, 14, N'tools/14_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (71, 15, N'tools/15_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (72, 15, N'tools/15_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (73, 15, N'tools/15_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (74, 15, N'tools/15_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (75, 15, N'tools/15_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (76, 16, N'tools/16_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (77, 16, N'tools/16_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (78, 16, N'tools/16_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (79, 16, N'tools/16_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (80, 16, N'tools/16_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (81, 17, N'tools/17_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (82, 17, N'tools/17_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (83, 17, N'tools/17_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (84, 17, N'tools/17_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (85, 17, N'tools/17_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (86, 18, N'tools/18_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (87, 18, N'tools/18_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (88, 18, N'tools/18_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (89, 18, N'tools/18_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (90, 18, N'tools/18_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (91, 19, N'tools/19_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (92, 19, N'tools/19_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (93, 19, N'tools/19_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (94, 19, N'tools/19_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (95, 19, N'tools/19_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (96, 20, N'tools/20_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (97, 20, N'tools/20_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (98, 20, N'tools/20_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (99, 20, N'tools/20_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (100, 20, N'tools/20_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (101, 21, N'tools/21_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (102, 21, N'tools/21_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (103, 21, N'tools/21_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (104, 21, N'tools/21_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (105, 21, N'tools/21_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (106, 22, N'tools/22_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (107, 22, N'tools/22_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (108, 22, N'tools/22_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (109, 22, N'tools/22_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (110, 22, N'tools/22_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (111, 23, N'tools/23_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (112, 23, N'tools/23_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (113, 23, N'tools/23_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (114, 23, N'tools/23_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (115, 23, N'tools/23_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (116, 24, N'tools/24_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (117, 24, N'tools/24_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (118, 24, N'tools/24_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (119, 24, N'tools/24_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (120, 24, N'tools/24_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (121, 25, N'tools/25_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (122, 25, N'tools/25_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (123, 25, N'tools/25_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (124, 25, N'tools/25_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (125, 25, N'tools/25_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (126, 26, N'tools/26_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (127, 26, N'tools/26_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (128, 26, N'tools/26_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (129, 26, N'tools/26_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (130, 26, N'tools/26_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (131, 27, N'tools/27_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (132, 27, N'tools/27_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (133, 27, N'tools/27_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (134, 27, N'tools/27_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (135, 27, N'tools/27_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (136, 28, N'tools/28_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (137, 28, N'tools/28_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (138, 28, N'tools/28_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (139, 28, N'tools/28_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (140, 28, N'tools/28_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (141, 29, N'tools/29_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (142, 29, N'tools/29_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (143, 29, N'tools/29_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (144, 29, N'tools/29_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (145, 29, N'tools/29_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (146, 30, N'tools/30_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (147, 30, N'tools/30_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (148, 30, N'tools/30_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (149, 30, N'tools/30_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (150, 30, N'tools/30_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (151, 31, N'tools/31_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (152, 31, N'tools/31_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (153, 31, N'tools/31_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (154, 31, N'tools/31_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (155, 31, N'tools/31_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (156, 32, N'tools/32_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (157, 32, N'tools/32_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (158, 32, N'tools/32_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (159, 32, N'tools/32_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (160, 32, N'tools/32_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (161, 33, N'tools/33_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (162, 33, N'tools/33_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (163, 33, N'tools/33_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (164, 33, N'tools/33_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (165, 33, N'tools/33_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (166, 34, N'tools/34_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (167, 34, N'tools/34_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (168, 34, N'tools/34_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (169, 34, N'tools/34_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (170, 34, N'tools/34_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (171, 35, N'tools/35_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (172, 35, N'tools/35_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (173, 35, N'tools/35_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (174, 35, N'tools/35_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (175, 35, N'tools/35_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (176, 36, N'tools/36_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (177, 36, N'tools/36_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (178, 36, N'tools/36_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (179, 36, N'tools/36_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (180, 36, N'tools/36_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (181, 37, N'tools/37_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (182, 37, N'tools/37_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (183, 37, N'tools/37_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (184, 37, N'tools/37_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (185, 37, N'tools/37_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (186, 38, N'tools/38_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (187, 38, N'tools/38_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (188, 38, N'tools/38_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (189, 38, N'tools/38_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (190, 38, N'tools/38_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (191, 39, N'tools/39_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (192, 39, N'tools/39_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (193, 39, N'tools/39_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (194, 39, N'tools/39_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (195, 39, N'tools/39_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (196, 40, N'tools/40_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (197, 40, N'tools/40_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (198, 40, N'tools/40_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (199, 40, N'tools/40_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (200, 40, N'tools/40_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (201, 41, N'tools/41_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (202, 41, N'tools/41_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (203, 41, N'tools/41_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (204, 41, N'tools/41_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (205, 41, N'tools/41_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (206, 42, N'tools/42_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (207, 42, N'tools/42_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (208, 42, N'tools/42_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (209, 42, N'tools/42_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (210, 42, N'tools/42_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (211, 43, N'tools/43_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (212, 43, N'tools/43_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (213, 43, N'tools/43_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (214, 43, N'tools/43_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (215, 43, N'tools/43_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (216, 44, N'tools/44_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (217, 44, N'tools/44_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (218, 44, N'tools/44_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (219, 44, N'tools/44_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (220, 44, N'tools/44_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (221, 45, N'tools/45_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (222, 45, N'tools/45_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (223, 45, N'tools/45_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (224, 45, N'tools/45_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (225, 45, N'tools/45_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (226, 46, N'tools/46_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (227, 46, N'tools/46_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (228, 46, N'tools/46_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (229, 46, N'tools/46_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (230, 46, N'tools/46_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (231, 47, N'tools/47_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (232, 47, N'tools/47_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (233, 47, N'tools/47_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (234, 47, N'tools/47_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (235, 47, N'tools/47_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (236, 48, N'tools/48_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (237, 48, N'tools/48_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (238, 48, N'tools/48_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (239, 48, N'tools/48_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (240, 48, N'tools/48_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (241, 49, N'tools/49_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (242, 49, N'tools/49_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (243, 49, N'tools/49_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (244, 49, N'tools/49_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (245, 49, N'tools/49_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (246, 50, N'tools/50_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (247, 50, N'tools/50_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (248, 50, N'tools/50_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (249, 50, N'tools/50_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (250, 50, N'tools/50_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (251, 51, N'tools/51_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (252, 51, N'tools/51_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (253, 51, N'tools/51_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (254, 51, N'tools/51_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (255, 51, N'tools/51_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (256, 52, N'tools/52_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (257, 52, N'tools/52_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (258, 52, N'tools/52_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (259, 52, N'tools/52_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (260, 52, N'tools/52_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (261, 53, N'tools/53_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (262, 53, N'tools/53_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (263, 53, N'tools/53_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (264, 53, N'tools/53_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (265, 53, N'tools/53_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (266, 54, N'tools/54_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (267, 54, N'tools/54_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (268, 54, N'tools/54_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (269, 54, N'tools/54_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (270, 54, N'tools/54_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (271, 55, N'tools/55_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (272, 55, N'tools/55_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (273, 55, N'tools/55_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (274, 55, N'tools/55_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (275, 55, N'tools/55_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (276, 56, N'tools/56_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (277, 56, N'tools/56_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (278, 56, N'tools/56_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (279, 56, N'tools/56_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (280, 56, N'tools/56_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (281, 57, N'tools/57_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (282, 57, N'tools/57_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (283, 57, N'tools/57_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (284, 57, N'tools/57_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (285, 57, N'tools/57_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (286, 58, N'tools/58_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (287, 58, N'tools/58_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (288, 58, N'tools/58_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (289, 58, N'tools/58_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (290, 58, N'tools/58_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (291, 59, N'tools/59_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (292, 59, N'tools/59_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (293, 59, N'tools/59_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (294, 59, N'tools/59_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (295, 59, N'tools/59_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (296, 60, N'tools/60_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (297, 60, N'tools/60_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (298, 60, N'tools/60_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (299, 60, N'tools/60_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (300, 60, N'tools/60_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (301, 61, N'Measurements/61_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (302, 61, N'Measurements/61_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (303, 61, N'Measurements/61_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (304, 61, N'Measurements/61_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (305, 61, N'Measurements/61_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (306, 62, N'Measurements/62_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (307, 62, N'Measurements/62_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (308, 62, N'Measurements/62_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (309, 62, N'Measurements/62_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (310, 62, N'Measurements/62_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (311, 63, N'Measurements/63_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (312, 63, N'Measurements/63_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (313, 63, N'Measurements/63_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (314, 63, N'Measurements/63_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (315, 63, N'Measurements/63_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (316, 64, N'Measurements/64_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (317, 64, N'Measurements/64_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (318, 64, N'Measurements/64_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (319, 64, N'Measurements/64_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (320, 64, N'Measurements/64_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (321, 65, N'Measurements/65_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (322, 65, N'Measurements/65_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (323, 65, N'Measurements/65_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (324, 65, N'Measurements/65_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (325, 65, N'Measurements/65_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (326, 66, N'Measurements/66_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (327, 66, N'Measurements/66_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (328, 66, N'Measurements/66_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (329, 66, N'Measurements/66_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (330, 66, N'Measurements/66_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (331, 67, N'Measurements/67_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (332, 67, N'Measurements/67_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (333, 67, N'Measurements/67_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (334, 67, N'Measurements/67_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (335, 67, N'Measurements/67_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (336, 68, N'Measurements/68_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (337, 68, N'Measurements/68_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (338, 68, N'Measurements/68_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (339, 68, N'Measurements/68_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (340, 68, N'Measurements/68_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (341, 69, N'Measurements/69_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (342, 69, N'Measurements/69_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (343, 69, N'Measurements/69_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (344, 69, N'Measurements/69_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (345, 69, N'Measurements/69_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (346, 70, N'Measurements/70_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (347, 70, N'Measurements/70_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (348, 70, N'Measurements/70_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (349, 70, N'Measurements/70_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (350, 70, N'Measurements/70_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (351, 71, N'Measurements/71_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (352, 71, N'Measurements/71_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (353, 71, N'Measurements/71_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (354, 71, N'Measurements/71_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (355, 71, N'Measurements/71_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (356, 72, N'Measurements/72_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (357, 72, N'Measurements/72_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (358, 72, N'Measurements/72_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (359, 72, N'Measurements/72_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (360, 72, N'Measurements/72_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (361, 73, N'Measurements/73_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (362, 73, N'Measurements/73_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (363, 73, N'Measurements/73_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (364, 73, N'Measurements/73_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (365, 73, N'Measurements/73_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (366, 74, N'Measurements/74_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (367, 74, N'Measurements/74_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (368, 74, N'Measurements/74_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (369, 74, N'Measurements/74_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (370, 74, N'Measurements/74_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (371, 75, N'Measurements/75_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (372, 75, N'Measurements/75_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (373, 75, N'Measurements/75_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (374, 75, N'Measurements/75_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (375, 75, N'Measurements/75_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (376, 76, N'Measurements/76_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (377, 76, N'Measurements/76_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (378, 76, N'Measurements/76_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (379, 76, N'Measurements/76_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (380, 76, N'Measurements/76_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (381, 77, N'Measurements/77_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (382, 77, N'Measurements/77_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (383, 77, N'Measurements/77_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (384, 77, N'Measurements/77_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (385, 77, N'Measurements/77_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (386, 78, N'Measurements/78_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (387, 78, N'Measurements/78_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (388, 78, N'Measurements/78_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (389, 78, N'Measurements/78_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (390, 78, N'Measurements/78_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (391, 79, N'Measurements/79_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (392, 79, N'Measurements/79_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (393, 79, N'Measurements/79_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (394, 79, N'Measurements/79_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (395, 79, N'Measurements/79_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (396, 80, N'Measurements/80_1.jpg', 0)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (397, 80, N'Measurements/80_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (398, 80, N'Measurements/80_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (399, 80, N'Measurements/80_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (400, 80, N'Measurements/80_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (401, 81, N'Measurements/81_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (402, 81, N'Measurements/81_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (403, 81, N'Measurements/81_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (404, 81, N'Measurements/81_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (405, 81, N'Measurements/81_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (406, 82, N'Measurements/82_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (407, 82, N'Measurements/82_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (408, 82, N'Measurements/82_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (409, 82, N'Measurements/82_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (410, 82, N'Measurements/82_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (411, 83, N'Measurements/83_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (412, 83, N'Measurements/83_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (413, 83, N'Measurements/83_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (414, 83, N'Measurements/83_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (415, 83, N'Measurements/83_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (416, 84, N'Measurements/84_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (417, 84, N'Measurements/84_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (418, 84, N'Measurements/84_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (419, 84, N'Measurements/84_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (420, 84, N'Measurements/84_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (421, 85, N'Measurements/85_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (422, 85, N'Measurements/85_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (423, 85, N'Measurements/85_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (424, 85, N'Measurements/85_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (425, 85, N'Measurements/85_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (426, 86, N'Measurements/86_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (427, 86, N'Measurements/86_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (428, 86, N'Measurements/86_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (429, 86, N'Measurements/86_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (430, 86, N'Measurements/86_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (431, 87, N'Measurements/87_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (432, 87, N'Measurements/87_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (433, 87, N'Measurements/87_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (434, 87, N'Measurements/87_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (435, 87, N'Measurements/87_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (436, 88, N'Measurements/88_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (437, 88, N'Measurements/88_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (438, 88, N'Measurements/88_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (439, 88, N'Measurements/88_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (440, 88, N'Measurements/88_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (441, 89, N'Measurements/89_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (442, 89, N'Measurements/89_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (443, 89, N'Measurements/89_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (444, 89, N'Measurements/89_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (445, 89, N'Measurements/89_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (446, 90, N'Measurements/90_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (447, 90, N'Measurements/90_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (448, 90, N'Measurements/90_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (449, 90, N'Measurements/90_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (450, 90, N'Measurements/90_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (451, 91, N'Measurements/91_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (452, 91, N'Measurements/91_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (453, 91, N'Measurements/91_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (454, 91, N'Measurements/91_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (455, 91, N'Measurements/91_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (456, 92, N'Measurements/92_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (457, 92, N'Measurements/92_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (458, 92, N'Measurements/92_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (459, 92, N'Measurements/92_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (460, 92, N'Measurements/92_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (461, 93, N'Measurements/93_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (462, 93, N'Measurements/93_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (463, 93, N'Measurements/93_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (464, 93, N'Measurements/93_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (465, 93, N'Measurements/93_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (466, 94, N'Measurements/94_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (467, 94, N'Measurements/94_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (468, 94, N'Measurements/94_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (469, 94, N'Measurements/94_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (470, 94, N'Measurements/94_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (471, 95, N'Measurements/95_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (472, 95, N'Measurements/95_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (473, 95, N'Measurements/95_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (474, 95, N'Measurements/95_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (475, 95, N'Measurements/95_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (476, 96, N'Measurements/96_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (477, 96, N'Measurements/96_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (478, 96, N'Measurements/96_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (479, 96, N'Measurements/96_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (480, 96, N'Measurements/96_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (481, 97, N'Measurements/97_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (482, 97, N'Measurements/97_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (483, 97, N'Measurements/97_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (484, 97, N'Measurements/97_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (485, 97, N'Measurements/97_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (486, 98, N'Measurements/98_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (487, 98, N'Measurements/98_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (488, 98, N'Measurements/98_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (489, 98, N'Measurements/98_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (490, 98, N'Measurements/98_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (491, 99, N'Measurements/99_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (492, 99, N'Measurements/99_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (493, 99, N'Measurements/99_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (494, 99, N'Measurements/99_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (495, 99, N'Measurements/99_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (496, 100, N'Measurements/100_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (497, 100, N'Measurements/100_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (498, 100, N'Measurements/100_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (499, 100, N'Measurements/100_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (500, 100, N'Measurements/100_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (501, 58, N'Measurements/58_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (502, 58, N'Measurements/58_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (503, 58, N'Measurements/58_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (504, 58, N'Measurements/58_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (505, 58, N'Measurements/58_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (506, 59, N'Measurements/59_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (507, 59, N'Measurements/59_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (508, 59, N'Measurements/59_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (509, 59, N'Measurements/59_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (510, 59, N'Measurements/59_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (511, 60, N'Measurements/60_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (512, 60, N'Measurements/60_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (513, 60, N'Measurements/60_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (514, 60, N'Measurements/60_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (515, 60, N'Measurements/60_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (516, 61, N'Measurements/61_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (517, 61, N'Measurements/61_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (518, 61, N'Measurements/61_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (519, 61, N'Measurements/61_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (520, 61, N'Measurements/61_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (521, 62, N'Measurements/62_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (522, 62, N'Measurements/62_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (523, 62, N'Measurements/62_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (524, 62, N'Measurements/62_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (525, 62, N'Measurements/62_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (526, 63, N'Measurements/63_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (527, 63, N'Measurements/63_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (528, 63, N'Measurements/63_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (529, 63, N'Measurements/63_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (530, 63, N'Measurements/63_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (531, 64, N'Measurements/64_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (532, 64, N'Measurements/64_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (533, 64, N'Measurements/64_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (534, 64, N'Measurements/64_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (535, 64, N'Measurements/64_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (536, 65, N'Measurements/65_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (537, 65, N'Measurements/65_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (538, 65, N'Measurements/65_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (539, 65, N'Measurements/65_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (540, 65, N'Measurements/65_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (541, 66, N'Measurements/66_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (542, 66, N'Measurements/66_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (543, 66, N'Measurements/66_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (544, 66, N'Measurements/66_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (545, 66, N'Measurements/66_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (546, 67, N'Measurements/67_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (547, 67, N'Measurements/67_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (548, 67, N'Measurements/67_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (549, 67, N'Measurements/67_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (550, 67, N'Measurements/67_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (551, 68, N'Measurements/68_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (552, 68, N'Measurements/68_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (553, 68, N'Measurements/68_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (554, 68, N'Measurements/68_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (555, 68, N'Measurements/68_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (556, 69, N'Measurements/69_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (557, 69, N'Measurements/69_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (558, 69, N'Measurements/69_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (559, 69, N'Measurements/69_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (560, 69, N'Measurements/69_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (561, 70, N'Measurements/70_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (562, 70, N'Measurements/70_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (563, 70, N'Measurements/70_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (564, 70, N'Measurements/70_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (565, 70, N'Measurements/70_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (566, 71, N'Measurements/71_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (567, 71, N'Measurements/71_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (568, 71, N'Measurements/71_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (569, 71, N'Measurements/71_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (570, 71, N'Measurements/71_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (571, 72, N'Measurements/72_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (572, 72, N'Measurements/72_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (573, 72, N'Measurements/72_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (574, 72, N'Measurements/72_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (575, 72, N'Measurements/72_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (576, 73, N'Measurements/73_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (577, 73, N'Measurements/73_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (578, 73, N'Measurements/73_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (579, 73, N'Measurements/73_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (580, 73, N'Measurements/73_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (581, 74, N'Measurements/74_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (582, 74, N'Measurements/74_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (583, 74, N'Measurements/74_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (584, 74, N'Measurements/74_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (585, 74, N'Measurements/74_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (586, 75, N'Measurements/75_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (587, 75, N'Measurements/75_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (588, 75, N'Measurements/75_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (589, 75, N'Measurements/75_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (590, 75, N'Measurements/75_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (591, 76, N'Measurements/76_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (592, 76, N'Measurements/76_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (593, 76, N'Measurements/76_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (594, 76, N'Measurements/76_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (595, 76, N'Measurements/76_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (596, 77, N'Measurements/77_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (597, 77, N'Measurements/77_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (598, 77, N'Measurements/77_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (599, 77, N'Measurements/77_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (600, 77, N'Measurements/77_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (601, 78, N'Measurements/78_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (602, 78, N'Measurements/78_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (603, 78, N'Measurements/78_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (604, 78, N'Measurements/78_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (605, 78, N'Measurements/78_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (606, 79, N'Measurements/79_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (607, 79, N'Measurements/79_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (608, 79, N'Measurements/79_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (609, 79, N'Measurements/79_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (610, 79, N'Measurements/79_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (611, 80, N'Measurements/80_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (612, 80, N'Measurements/80_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (613, 80, N'Measurements/80_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (614, 80, N'Measurements/80_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (615, 80, N'Measurements/80_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (616, 81, N'Measurements/81_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (617, 81, N'Measurements/81_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (618, 81, N'Measurements/81_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (619, 81, N'Measurements/81_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (620, 81, N'Measurements/81_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (621, 82, N'Measurements/82_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (622, 82, N'Measurements/82_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (623, 82, N'Measurements/82_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (624, 82, N'Measurements/82_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (625, 82, N'Measurements/82_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (626, 83, N'Measurements/83_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (627, 83, N'Measurements/83_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (628, 83, N'Measurements/83_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (629, 83, N'Measurements/83_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (630, 83, N'Measurements/83_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (631, 84, N'Measurements/84_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (632, 84, N'Measurements/84_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (633, 84, N'Measurements/84_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (634, 84, N'Measurements/84_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (635, 84, N'Measurements/84_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (636, 85, N'Measurements/85_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (637, 85, N'Measurements/85_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (638, 85, N'Measurements/85_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (639, 85, N'Measurements/85_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (640, 85, N'Measurements/85_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (641, 86, N'Measurements/86_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (642, 86, N'Measurements/86_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (643, 86, N'Measurements/86_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (644, 86, N'Measurements/86_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (645, 86, N'Measurements/86_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (646, 87, N'Measurements/87_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (647, 87, N'Measurements/87_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (648, 87, N'Measurements/87_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (649, 87, N'Measurements/87_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (650, 87, N'Measurements/87_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (651, 88, N'Measurements/88_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (652, 88, N'Measurements/88_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (653, 88, N'Measurements/88_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (654, 88, N'Measurements/88_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (655, 88, N'Measurements/88_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (656, 89, N'Measurements/89_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (657, 89, N'Measurements/89_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (658, 89, N'Measurements/89_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (659, 89, N'Measurements/89_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (660, 89, N'Measurements/89_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (661, 90, N'Measurements/90_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (662, 90, N'Measurements/90_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (663, 90, N'Measurements/90_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (664, 90, N'Measurements/90_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (665, 90, N'Measurements/90_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (666, 91, N'Measurements/91_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (667, 91, N'Measurements/91_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (668, 91, N'Measurements/91_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (669, 91, N'Measurements/91_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (670, 91, N'Measurements/91_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (671, 92, N'Measurements/92_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (672, 92, N'Measurements/92_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (673, 92, N'Measurements/92_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (674, 92, N'Measurements/92_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (675, 92, N'Measurements/92_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (676, 93, N'Measurements/93_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (677, 93, N'Measurements/93_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (678, 93, N'Measurements/93_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (679, 93, N'Measurements/93_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (680, 93, N'Measurements/93_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (681, 94, N'Measurements/94_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (682, 94, N'Measurements/94_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (683, 94, N'Measurements/94_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (684, 94, N'Measurements/94_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (685, 94, N'Measurements/94_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (686, 95, N'Measurements/95_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (687, 95, N'Measurements/95_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (688, 95, N'Measurements/95_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (689, 95, N'Measurements/95_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (690, 95, N'Measurements/95_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (691, 96, N'Measurements/96_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (692, 96, N'Measurements/96_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (693, 96, N'Measurements/96_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (694, 96, N'Measurements/96_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (695, 96, N'Measurements/96_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (696, 97, N'Measurements/97_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (697, 97, N'Measurements/97_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (698, 97, N'Measurements/97_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (699, 97, N'Measurements/97_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (700, 97, N'Measurements/97_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (701, 98, N'Measurements/98_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (702, 98, N'Measurements/98_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (703, 98, N'Measurements/98_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (704, 98, N'Measurements/98_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (705, 98, N'Measurements/98_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (706, 99, N'Measurements/99_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (707, 99, N'Measurements/99_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (708, 99, N'Measurements/99_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (709, 99, N'Measurements/99_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (710, 99, N'Measurements/99_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (711, 100, N'Measurements/100_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (712, 100, N'Measurements/100_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (713, 100, N'Measurements/100_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (714, 100, N'Measurements/100_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (715, 100, N'Measurements/100_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (716, 101, N'improvement/101_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (717, 101, N'improvement/101_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (718, 101, N'improvement/101_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (719, 101, N'improvement/101_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (720, 101, N'improvement/101_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (721, 102, N'improvement/102_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (722, 102, N'improvement/102_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (723, 102, N'improvement/102_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (724, 102, N'improvement/102_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (725, 102, N'improvement/102_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (726, 103, N'improvement/103_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (727, 103, N'improvement/103_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (728, 103, N'improvement/103_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (729, 103, N'improvement/103_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (730, 103, N'improvement/103_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (731, 104, N'improvement/104_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (732, 104, N'improvement/104_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (733, 104, N'improvement/104_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (734, 104, N'improvement/104_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (735, 104, N'improvement/104_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (736, 105, N'improvement/105_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (737, 105, N'improvement/105_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (738, 105, N'improvement/105_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (739, 105, N'improvement/105_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (740, 105, N'improvement/105_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (741, 106, N'improvement/106_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (742, 106, N'improvement/106_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (743, 106, N'improvement/106_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (744, 106, N'improvement/106_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (745, 106, N'improvement/106_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (746, 107, N'improvement/107_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (747, 107, N'improvement/107_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (748, 107, N'improvement/107_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (749, 107, N'improvement/107_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (750, 107, N'improvement/107_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (751, 108, N'improvement/108_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (752, 108, N'improvement/108_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (753, 108, N'improvement/108_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (754, 108, N'improvement/108_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (755, 108, N'improvement/108_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (756, 109, N'improvement/109_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (757, 109, N'improvement/109_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (758, 109, N'improvement/109_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (759, 109, N'improvement/109_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (760, 109, N'improvement/109_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (761, 110, N'improvement/110_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (762, 110, N'improvement/110_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (763, 110, N'improvement/110_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (764, 110, N'improvement/110_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (765, 110, N'improvement/110_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (766, 111, N'improvement/111_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (767, 111, N'improvement/111_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (768, 111, N'improvement/111_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (769, 111, N'improvement/111_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (770, 111, N'improvement/111_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (771, 112, N'improvement/112_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (772, 112, N'improvement/112_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (773, 112, N'improvement/112_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (774, 112, N'improvement/112_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (775, 112, N'improvement/112_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (776, 113, N'improvement/113_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (777, 113, N'improvement/113_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (778, 113, N'improvement/113_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (779, 113, N'improvement/113_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (780, 113, N'improvement/113_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (781, 114, N'improvement/114_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (782, 114, N'improvement/114_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (783, 114, N'improvement/114_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (784, 114, N'improvement/114_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (785, 114, N'improvement/114_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (786, 115, N'improvement/115_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (787, 115, N'improvement/115_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (788, 115, N'improvement/115_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (789, 115, N'improvement/115_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (790, 115, N'improvement/115_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (791, 116, N'improvement/116_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (792, 116, N'improvement/116_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (793, 116, N'improvement/116_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (794, 116, N'improvement/116_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (795, 116, N'improvement/116_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (796, 117, N'improvement/117_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (797, 117, N'improvement/117_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (798, 117, N'improvement/117_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (799, 117, N'improvement/117_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (800, 117, N'improvement/117_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (801, 118, N'improvement/118_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (802, 118, N'improvement/118_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (803, 118, N'improvement/118_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (804, 118, N'improvement/118_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (805, 118, N'improvement/118_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (806, 119, N'improvement/119_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (807, 119, N'improvement/119_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (808, 119, N'improvement/119_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (809, 119, N'improvement/119_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (810, 119, N'improvement/119_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (811, 120, N'improvement/120_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (812, 120, N'improvement/120_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (813, 120, N'improvement/120_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (814, 120, N'improvement/120_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (815, 120, N'improvement/120_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (816, 121, N'improvement/121_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (817, 121, N'improvement/121_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (818, 121, N'improvement/121_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (819, 121, N'improvement/121_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (820, 121, N'improvement/121_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (821, 122, N'improvement/122_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (822, 122, N'improvement/122_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (823, 122, N'improvement/122_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (824, 122, N'improvement/122_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (825, 122, N'improvement/122_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (826, 123, N'improvement/123_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (827, 123, N'improvement/123_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (828, 123, N'improvement/123_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (829, 123, N'improvement/123_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (830, 123, N'improvement/123_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (831, 124, N'improvement/124_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (832, 124, N'improvement/124_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (833, 124, N'improvement/124_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (834, 124, N'improvement/124_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (835, 124, N'improvement/124_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (836, 125, N'improvement/125_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (837, 125, N'improvement/125_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (838, 125, N'improvement/125_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (839, 125, N'improvement/125_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (840, 125, N'improvement/125_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (841, 126, N'improvement/126_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (842, 126, N'improvement/126_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (843, 126, N'improvement/126_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (844, 126, N'improvement/126_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (845, 126, N'improvement/126_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (846, 127, N'improvement/127_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (847, 127, N'improvement/127_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (848, 127, N'improvement/127_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (849, 127, N'improvement/127_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (850, 127, N'improvement/127_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (851, 128, N'improvement/128_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (852, 128, N'improvement/128_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (853, 128, N'improvement/128_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (854, 128, N'improvement/128_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (855, 128, N'improvement/128_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (856, 129, N'improvement/129_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (857, 129, N'improvement/129_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (858, 129, N'improvement/129_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (859, 129, N'improvement/129_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (860, 129, N'improvement/129_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (861, 130, N'improvement/130_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (862, 130, N'improvement/130_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (863, 130, N'improvement/130_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (864, 130, N'improvement/130_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (865, 130, N'improvement/130_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (866, 131, N'improvement/131_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (867, 131, N'improvement/131_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (868, 131, N'improvement/131_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (869, 131, N'improvement/131_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (870, 131, N'improvement/131_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (871, 132, N'improvement/132_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (872, 132, N'improvement/132_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (873, 132, N'improvement/132_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (874, 132, N'improvement/132_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (875, 132, N'improvement/132_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (876, 133, N'improvement/133_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (877, 133, N'improvement/133_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (878, 133, N'improvement/133_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (879, 133, N'improvement/133_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (880, 133, N'improvement/133_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (881, 134, N'improvement/134_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (882, 134, N'improvement/134_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (883, 134, N'improvement/134_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (884, 134, N'improvement/134_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (885, 134, N'improvement/134_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (886, 135, N'improvement/135_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (887, 135, N'improvement/135_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (888, 135, N'improvement/135_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (889, 135, N'improvement/135_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (890, 135, N'improvement/135_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (891, 136, N'improvement/136_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (892, 136, N'improvement/136_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (893, 136, N'improvement/136_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (894, 136, N'improvement/136_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (895, 136, N'improvement/136_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (896, 137, N'improvement/137_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (897, 137, N'improvement/137_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (898, 137, N'improvement/137_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (899, 137, N'improvement/137_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (900, 137, N'improvement/137_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (901, 138, N'improvement/138_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (902, 138, N'improvement/138_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (903, 138, N'improvement/138_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (904, 138, N'improvement/138_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (905, 138, N'improvement/138_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (906, 139, N'improvement/139_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (907, 139, N'improvement/139_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (908, 139, N'improvement/139_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (909, 139, N'improvement/139_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (910, 139, N'improvement/139_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (911, 140, N'improvement/140_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (912, 140, N'improvement/140_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (913, 140, N'improvement/140_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (914, 140, N'improvement/140_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (915, 140, N'improvement/140_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (916, 141, N'improvement/141_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (917, 141, N'improvement/141_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (918, 141, N'improvement/141_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (919, 141, N'improvement/141_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (920, 141, N'improvement/141_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (921, 142, N'improvement/142_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (922, 142, N'improvement/142_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (923, 142, N'improvement/142_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (924, 142, N'improvement/142_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (925, 142, N'improvement/142_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (926, 143, N'improvement/143_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (927, 143, N'improvement/143_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (928, 143, N'improvement/143_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (929, 143, N'improvement/143_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (930, 143, N'improvement/143_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (931, 144, N'improvement/144_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (932, 144, N'improvement/144_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (933, 144, N'improvement/144_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (934, 144, N'improvement/144_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (935, 144, N'improvement/144_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (936, 145, N'improvement/145_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (937, 145, N'improvement/145_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (938, 145, N'improvement/145_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (939, 145, N'improvement/145_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (940, 145, N'improvement/145_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (941, 146, N'improvement/146_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (942, 146, N'improvement/146_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (943, 146, N'improvement/146_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (944, 146, N'improvement/146_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (945, 146, N'improvement/146_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (946, 147, N'improvement/147_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (947, 147, N'improvement/147_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (948, 147, N'improvement/147_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (949, 147, N'improvement/147_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (950, 147, N'improvement/147_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (951, 148, N'improvement/148_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (952, 148, N'improvement/148_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (953, 148, N'improvement/148_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (954, 148, N'improvement/148_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (955, 148, N'improvement/148_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (956, 149, N'improvement/149_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (957, 149, N'improvement/149_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (958, 149, N'improvement/149_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (959, 149, N'improvement/149_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (960, 149, N'improvement/149_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (961, 150, N'improvement/150_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (962, 150, N'improvement/150_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (963, 150, N'improvement/150_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (964, 150, N'improvement/150_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (965, 150, N'improvement/150_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (966, 151, N'Home&Garden/201_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (967, 151, N'Home&Garden/201_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (968, 151, N'Home&Garden/201_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (969, 151, N'Home&Garden/201_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (970, 151, N'Home&Garden/201_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (971, 152, N'Home&Garden/202_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (972, 152, N'Home&Garden/202_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (973, 152, N'Home&Garden/202_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (974, 152, N'Home&Garden/202_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (975, 152, N'Home&Garden/202_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (976, 153, N'Home&Garden/203_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (977, 153, N'Home&Garden/203_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (978, 153, N'Home&Garden/203_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (979, 153, N'Home&Garden/203_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (980, 153, N'Home&Garden/203_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (981, 154, N'Home&Garden/204_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (982, 154, N'Home&Garden/204_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (983, 154, N'Home&Garden/204_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (984, 154, N'Home&Garden/204_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (985, 154, N'Home&Garden/204_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (986, 155, N'Home&Garden/205_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (987, 155, N'Home&Garden/205_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (988, 155, N'Home&Garden/205_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (989, 155, N'Home&Garden/205_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (990, 155, N'Home&Garden/205_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (991, 156, N'Home&Garden/206_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (992, 156, N'Home&Garden/206_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (993, 156, N'Home&Garden/206_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (994, 156, N'Home&Garden/206_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (995, 156, N'Home&Garden/206_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (996, 157, N'Home&Garden/207_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (997, 157, N'Home&Garden/207_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (998, 157, N'Home&Garden/207_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (999, 157, N'Home&Garden/207_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1000, 157, N'Home&Garden/207_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1001, 158, N'Home&Garden/208_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1002, 158, N'Home&Garden/208_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1003, 158, N'Home&Garden/208_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1004, 158, N'Home&Garden/208_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1005, 158, N'Home&Garden/208_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1006, 159, N'Home&Garden/209_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1007, 159, N'Home&Garden/209_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1008, 159, N'Home&Garden/209_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1009, 159, N'Home&Garden/209_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1010, 159, N'Home&Garden/209_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1011, 160, N'Home&Garden/210_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1012, 160, N'Home&Garden/210_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1013, 160, N'Home&Garden/210_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1014, 160, N'Home&Garden/210_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1015, 160, N'Home&Garden/210_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1016, 161, N'Home&Garden/211_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1017, 161, N'Home&Garden/211_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1018, 161, N'Home&Garden/211_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1019, 161, N'Home&Garden/211_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1020, 161, N'Home&Garden/211_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1021, 162, N'Home&Garden/212_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1022, 162, N'Home&Garden/212_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1023, 162, N'Home&Garden/212_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1024, 162, N'Home&Garden/212_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1025, 162, N'Home&Garden/212_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1026, 163, N'Home&Garden/213_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1027, 163, N'Home&Garden/213_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1028, 163, N'Home&Garden/213_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1029, 163, N'Home&Garden/213_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1030, 163, N'Home&Garden/213_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1031, 164, N'Home&Garden/214_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1032, 164, N'Home&Garden/214_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1033, 164, N'Home&Garden/214_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1034, 164, N'Home&Garden/214_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1035, 164, N'Home&Garden/214_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1036, 165, N'Home&Garden/215_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1037, 165, N'Home&Garden/215_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1038, 165, N'Home&Garden/215_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1039, 165, N'Home&Garden/215_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1040, 165, N'Home&Garden/215_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1041, 166, N'Home&Garden/216_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1042, 166, N'Home&Garden/216_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1043, 166, N'Home&Garden/216_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1044, 166, N'Home&Garden/216_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1045, 166, N'Home&Garden/216_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1046, 167, N'Home&Garden/217_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1047, 167, N'Home&Garden/217_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1048, 167, N'Home&Garden/217_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1049, 167, N'Home&Garden/217_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1050, 167, N'Home&Garden/217_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1051, 168, N'Home&Garden/218_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1052, 168, N'Home&Garden/218_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1053, 168, N'Home&Garden/218_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1054, 168, N'Home&Garden/218_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1055, 168, N'Home&Garden/218_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1056, 169, N'Home&Garden/219_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1057, 169, N'Home&Garden/219_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1058, 169, N'Home&Garden/219_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1059, 169, N'Home&Garden/219_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1060, 169, N'Home&Garden/219_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1061, 170, N'Home&Garden/220_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1062, 170, N'Home&Garden/220_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1063, 170, N'Home&Garden/220_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1064, 170, N'Home&Garden/220_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1065, 170, N'Home&Garden/220_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1066, 171, N'Home&Garden/221_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1067, 171, N'Home&Garden/221_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1068, 171, N'Home&Garden/221_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1069, 171, N'Home&Garden/221_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1070, 171, N'Home&Garden/221_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1071, 172, N'Home&Garden/222_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1072, 172, N'Home&Garden/222_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1073, 172, N'Home&Garden/222_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1074, 172, N'Home&Garden/222_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1075, 172, N'Home&Garden/222_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1076, 173, N'Home&Garden/223_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1077, 173, N'Home&Garden/223_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1078, 173, N'Home&Garden/223_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1079, 173, N'Home&Garden/223_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1080, 173, N'Home&Garden/223_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1081, 174, N'Home&Garden/224_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1082, 174, N'Home&Garden/224_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1083, 174, N'Home&Garden/224_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1084, 174, N'Home&Garden/224_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1085, 174, N'Home&Garden/224_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1086, 175, N'Home&Garden/225_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1087, 175, N'Home&Garden/225_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1088, 175, N'Home&Garden/225_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1089, 175, N'Home&Garden/225_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1090, 175, N'Home&Garden/225_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1091, 176, N'Home&Garden/226_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1092, 176, N'Home&Garden/226_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1093, 176, N'Home&Garden/226_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1094, 176, N'Home&Garden/226_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1095, 176, N'Home&Garden/226_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1096, 177, N'Home&Garden/227_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1097, 177, N'Home&Garden/227_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1098, 177, N'Home&Garden/227_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1099, 177, N'Home&Garden/227_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1100, 177, N'Home&Garden/227_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1101, 178, N'Home&Garden/228_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1102, 178, N'Home&Garden/228_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1103, 178, N'Home&Garden/228_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1104, 178, N'Home&Garden/228_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1105, 178, N'Home&Garden/228_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1106, 179, N'Home&Garden/229_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1107, 179, N'Home&Garden/229_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1108, 179, N'Home&Garden/229_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1109, 179, N'Home&Garden/229_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1110, 179, N'Home&Garden/229_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1111, 180, N'Home&Garden/230_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1112, 180, N'Home&Garden/230_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1113, 180, N'Home&Garden/230_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1114, 180, N'Home&Garden/230_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1115, 180, N'Home&Garden/230_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1116, 181, N'Home&Garden/231_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1117, 181, N'Home&Garden/231_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1118, 181, N'Home&Garden/231_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1119, 181, N'Home&Garden/231_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1120, 181, N'Home&Garden/231_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1121, 182, N'Home&Garden/232_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1122, 182, N'Home&Garden/232_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1123, 182, N'Home&Garden/232_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1124, 182, N'Home&Garden/232_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1125, 182, N'Home&Garden/232_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1126, 183, N'Home&Garden/233_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1127, 183, N'Home&Garden/233_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1128, 183, N'Home&Garden/233_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1129, 183, N'Home&Garden/233_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1130, 183, N'Home&Garden/233_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1131, 184, N'Home&Garden/234_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1132, 184, N'Home&Garden/234_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1133, 184, N'Home&Garden/234_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1134, 184, N'Home&Garden/234_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1135, 184, N'Home&Garden/234_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1136, 185, N'Home&Garden/235_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1137, 185, N'Home&Garden/235_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1138, 185, N'Home&Garden/235_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1139, 185, N'Home&Garden/235_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1140, 185, N'Home&Garden/235_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1141, 186, N'Home&Garden/236_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1142, 186, N'Home&Garden/236_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1143, 186, N'Home&Garden/236_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1144, 186, N'Home&Garden/236_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1145, 186, N'Home&Garden/236_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1146, 187, N'Home&Garden/237_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1147, 187, N'Home&Garden/237_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1148, 187, N'Home&Garden/237_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1149, 187, N'Home&Garden/237_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1150, 187, N'Home&Garden/237_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1151, 188, N'Home&Garden/238_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1152, 188, N'Home&Garden/238_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1153, 188, N'Home&Garden/238_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1154, 188, N'Home&Garden/238_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1155, 188, N'Home&Garden/238_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1156, 189, N'Home&Garden/239_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1157, 189, N'Home&Garden/239_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1158, 189, N'Home&Garden/239_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1159, 189, N'Home&Garden/239_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1160, 189, N'Home&Garden/239_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1161, 190, N'Home&Garden/240_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1162, 190, N'Home&Garden/240_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1163, 190, N'Home&Garden/240_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1164, 190, N'Home&Garden/240_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1165, 190, N'Home&Garden/240_5.jpg', 1)
SET IDENTITY_INSERT [dbo].[image] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (6, N'minh', 11, CAST(N'2019-11-05' AS Date), 34.48, N'qwer', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (7, N'minh', 12, CAST(N'2019-11-06' AS Date), 38.67, N'freeeeeeeeeeeeeeeee', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (8, N'minh', 13, CAST(N'2019-11-07' AS Date), 40.41, N'aaaaaaaaaaaaa', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (9, N'minh', 14, CAST(N'2019-11-07' AS Date), 23.79, N'aaaaaaaaaaaaaaa', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (10, N'minh', 15, CAST(N'2019-11-08' AS Date), 16.61, N'aaaaaaaaaaaaaaaa', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (11, N'minh', 16, CAST(N'2019-11-08' AS Date), 26.89, N'Ship thần tốc', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (12, N'minh', 17, CAST(N'2019-11-09' AS Date), 41.680000000000007, N'Không có gì', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (13, N'minh', 18, CAST(N'2019-11-09' AS Date), 18.32, N'okiiiiiiiii', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (14, N'nghia', 19, CAST(N'2019-11-10' AS Date), 98.03, N'Ship cẩn thận ạ', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (15, N'sang', 20, CAST(N'2019-11-10' AS Date), 69.399999999999991, N'ship nhanh vào', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (16, N'sang', 21, CAST(N'2019-11-11' AS Date), 74.94, N'shipp', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (17, N'sang', 22, CAST(N'2019-11-11' AS Date), 74.94, N'shipp', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (18, N'nghia', 22, CAST(N'2019-11-11' AS Date), 69.179999999999993, N'SHip cẩn thận', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (19, N'nghia', 23, CAST(N'2019-11-11' AS Date), 52.239999999999995, N'ship oke nhé', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (20, N'sang', 24, CAST(N'2019-11-11' AS Date), 46.3, N'aaaaaaaaaaa', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (21, N'sang', 25, CAST(N'2019-11-05' AS Date), 27.25, N'bbbbbbbbbbbbbbb', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (22, N'minh', 26, CAST(N'2019-11-05' AS Date), 32.5, N'', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (23, N'minh', 27, CAST(N'2019-11-06' AS Date), 83.54, N'', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (24, N'minh', 28, CAST(N'2019-11-07' AS Date), 25.17, N'', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (25, N'792159237907614', 29, CAST(N'2019-11-11' AS Date), 57.789999999999992, N'', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (26, N'792159237907614', 30, CAST(N'2019-11-11' AS Date), 21.560000000000002, N'', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (27, N'792159237907614', 31, CAST(N'2019-11-07' AS Date), 28.55, N'', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (28, N'792159237907614', 32, CAST(N'2019-11-07' AS Date), 21.67, N'', 3)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (29, N'792159237907614', 33, CAST(N'2019-11-11' AS Date), 14.15, N'', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (30, N'792159237907614', 34, CAST(N'2019-11-11' AS Date), 5.01, N'', 1)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (31, N'792159237907614', 35, CAST(N'2019-11-11' AS Date), 14.33, N'', 1)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (29, 6, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (30, 6, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (31, 6, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (32, 7, 21, N'Wood Router', CAST(15 AS Decimal(18, 0)), 1, N'tools/21_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (33, 7, 22, N'Frame Pipe', CAST(7 AS Decimal(18, 0)), 1, N'tools/22_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (34, 7, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (35, 8, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (36, 8, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (37, 8, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 2, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (38, 8, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 1, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (39, 9, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (40, 9, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 2, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (41, 9, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 1, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (42, 10, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 2, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (43, 11, 41, N'Drill Hole', CAST(10 AS Decimal(18, 0)), 1, N'tools/41_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (44, 11, 42, N'Soldering Iron', CAST(17 AS Decimal(18, 0)), 1, N'tools/42_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (45, 12, 21, N'Wood Router', CAST(15 AS Decimal(18, 0)), 1, N'tools/21_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (46, 12, 22, N'Frame Pipe', CAST(7 AS Decimal(18, 0)), 1, N'tools/22_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (47, 12, 29, N'Chuck Mini Drill', CAST(20 AS Decimal(18, 0)), 1, N'tools/29_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (48, 13, 46, N'Washer Water', CAST(11 AS Decimal(18, 0)), 1, N'tools/46_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (49, 13, 47, N'Anti-Slip Hex S2', CAST(8 AS Decimal(18, 0)), 1, N'tools/47_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (50, 14, 151, N'Electric Knife', CAST(28 AS Decimal(18, 0)), 1, N'Home&Garden/201_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (51, 14, 152, N'Calories Microwave', CAST(15 AS Decimal(18, 0)), 1, N'Home&Garden/202_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (52, 14, 153, N'Kitchen Accessories', CAST(19 AS Decimal(18, 0)), 1, N'Home&Garden/203_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (53, 14, 154, N'Ex-large Silicone', CAST(10 AS Decimal(18, 0)), 1, N'Home&Garden/204_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (54, 14, 156, N'Sponge Magic', CAST(25 AS Decimal(18, 0)), 1, N'Home&Garden/206_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (55, 15, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (56, 15, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (57, 15, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 1, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (58, 15, 105, N'SPA shower', CAST(17 AS Decimal(18, 0)), 1, N'improvement/105_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (59, 15, 102, N'Toothbrush Holder', CAST(29 AS Decimal(18, 0)), 1, N'improvement/102_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (60, 16, 8, N'Game Cube', CAST(9 AS Decimal(18, 0)), 1, N'tools/8_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (61, 16, 15, N'Separating Pliers      ', CAST(9 AS Decimal(18, 0)), 1, N'tools/15_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (62, 16, 5, N'Hiro Crimping Pliers', CAST(15 AS Decimal(18, 0)), 2, N'tools/5_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (63, 16, 14, N'Mini Spade Shovel', CAST(12 AS Decimal(18, 0)), 1, N'tools/14_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (64, 16, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (65, 16, 6, N'Stripping Pliers', CAST(12 AS Decimal(18, 0)), 1, N'tools/6_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (66, 18, 121, N'Brass Faucets', CAST(20 AS Decimal(18, 0)), 1, N'improvement/121_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (67, 18, 122, N'Water Bubble', CAST(18 AS Decimal(18, 0)), 1, N'improvement/122_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (68, 18, 123, N'Sealing Strip', CAST(15 AS Decimal(18, 0)), 1, N'improvement/123_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (69, 18, 124, N'Faucet Nozzle', CAST(17 AS Decimal(18, 0)), 1, N'improvement/124_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (70, 19, 122, N'Water Bubble', CAST(18 AS Decimal(18, 0)), 1, N'improvement/122_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (71, 19, 129, N'Multifunction Slicer', CAST(18 AS Decimal(18, 0)), 1, N'improvement/129_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (72, 19, 130, N'Slicer Vegetable ', CAST(16 AS Decimal(18, 0)), 1, N'improvement/130_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (73, 20, 26, N'Wood Router', CAST(9 AS Decimal(18, 0)), 1, N'tools/26_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (74, 20, 145, N'Rubber Telescopic', CAST(20 AS Decimal(18, 0)), 1, N'improvement/145_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (75, 20, 60, N'Chain Brushcutter', CAST(17 AS Decimal(18, 0)), 1, N'tools/60_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (76, 21, 55, N'Spray Gun', CAST(27 AS Decimal(18, 0)), 1, N'tools/55_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (77, 22, 6, N'Stripping Pliers', CAST(12 AS Decimal(18, 0)), 1, N'tools/6_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (78, 22, 11, N'Nozzle Water', CAST(14 AS Decimal(18, 0)), 2, N'tools/11_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (79, 22, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 1, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (80, 23, 141, N'curtains Shading', CAST(17 AS Decimal(18, 0)), 1, N'improvement/141_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (81, 23, 142, N'Door Lock', CAST(22 AS Decimal(18, 0)), 1, N'improvement/142_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (82, 23, 143, N'Car Interior', CAST(19 AS Decimal(18, 0)), 1, N'improvement/143_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (83, 23, 144, N'Shank Glass', CAST(25 AS Decimal(18, 0)), 1, N'improvement/144_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (84, 24, 157, N'Kitchen Tools', CAST(25 AS Decimal(18, 0)), 1, N'Home&Garden/207_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (85, 25, 61, N'Mirror Alarm Clock', CAST(28 AS Decimal(18, 0)), 1, N'Measurements/61_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (86, 25, 62, N'LCD Thermometer', CAST(17 AS Decimal(18, 0)), 1, N'Measurements/62_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (87, 25, 63, N'Digital Temperature', CAST(13 AS Decimal(18, 0)), 1, N'Measurements/63_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (88, 26, 7, N'Steel Triangular', CAST(9 AS Decimal(18, 0)), 1, N'tools/7_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (89, 26, 6, N'Stripping Pliers', CAST(12 AS Decimal(18, 0)), 1, N'tools/6_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (90, 27, 102, N'Toothbrush Holder', CAST(29 AS Decimal(18, 0)), 1, N'improvement/102_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (91, 28, 6, N'Stripping Pliers', CAST(12 AS Decimal(18, 0)), 1, N'tools/6_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (92, 28, 8, N'Game Cube', CAST(9 AS Decimal(18, 0)), 1, N'tools/8_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (93, 29, 11, N'Nozzle Water', CAST(14 AS Decimal(18, 0)), 1, N'tools/11_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (94, 30, 113, N'Toilet Lamp ', CAST(5 AS Decimal(18, 0)), 1, N'improvement/113_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (95, 31, 17, N'Cocktail Muddler', CAST(14 AS Decimal(18, 0)), 1, N'tools/17_0.jpg')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (1, 1, N'HW-01', N'Repair Tool', 10, 16.61, N'86pcs M3-M8 Hand Riveter Nut Rivet Gun Kit Threaded Nut Rive Tool with Rivnut Nutsert Riveting Kit for Household Repair Tools', N'tools/1_0.jpg', CAST(N'2019-10-09' AS Date), 3, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (2, 1, N'HW-02', N'Measure Tools', 10, 9.27, N'Outside Micrometer 0-25mm/0.01mm Gauge Vernier Caliper Gauge Meter Micrometer Carbon Steel Measure Tools', N'tools/2_0.jpg', CAST(N'2019-10-09' AS Date), 2, N'1         ', 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (3, 1, N'HW-03', N'Manual Screw', 10, 8.6, N'5/6mm Multi-use Screwdriver Security Insulated Screwdrivers Repair Hand Tools Screwdriver Set Electrician Manual Screw Driver', N'tools/3_0.jpg', CAST(N'2019-10-09' AS Date), 1, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (4, 1, N'HW-04', N'Painting Brush', 10, 5.93, N'9pcs/Set Multifunction Paint Roller Tray Sponge Pads Handles Tubes Kits Home DIY Wall Painting Brush Decorative Tools Dropship
4.7', N'tools/4_0.jpg', CAST(N'2019-10-09' AS Date), 1, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (5, 1, N'HW-05', N'Hiro Crimping Pliers', 10, 15.36, N'Automatic Stripping Pliers Rotary Coaxial Wire Cable Stripper Knife Wire Stripping Crimping Pliers RG59 RG6 RG7 RG11 Repair Tool', N'tools/5_0.jpg', CAST(N'2019-10-09' AS Date), 3, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (6, 1, N'HW-06', N'Stripping Pliers', 10, 12.42, N'8" Electrical Cable Stripper Wire Stripper Cable Cutter Multi Tool Wire Cutting Scissor Stripping Pliers 9-14mm Hand Tools Kit', N'tools/6_0.jpg', CAST(N'2019-10-09' AS Date), 2, N'1         ', 0.15)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (7, 1, N'HW-07', N'Steel Triangular', 10, 9.14, N'5pcs 50mm Electric Screwdrivers Bits Magnetic U-shaped Screwdriver Bits S2 Alloy Steel Triangular Screw Driver Bit Hand Tool Set', N'tools/7_0.jpg', CAST(N'2019-10-09' AS Date), 3, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (8, 1, N'HW-08', N'Game Cube', 10, 9.25, N'1pc Precision Screwdriver Set Y Tip Tri-wing Screwdriver Attachments Repair Tool for Game Cube Game Toy Nintendo Wii DS Lite', N'tools/8_0.jpg', CAST(N'2019-10-09' AS Date), 2, N'1         ', 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (9, 1, N'HW-09', N'Cutting Saw', 12, 3.46, N'1pc 65mm Saw Blades HCS Metal Oscillating Multi Tools for Metal Wood Cutting Saw DIY Renovator Tool', N'tools/9_0.jpg', CAST(N'2019-10-09' AS Date), 1, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (10, 1, N'HW-010', N'Brush Point Paint', 12, 18.06, N'2pcs/Set Decorative Paint Sponges Replacement Paint Roller Tray Set Paint Pad Painting Brush Point Paint Sponges Household DIY', N'tools/10_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.2)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (11, 1, N'HW-011', N'Nozzle Water', 13, 14.15, N'High Pressure Power Washer Car Wash Spray Nozzle Water Hose Auto Water Gun Car Lawn Floor Cleaning Irrigation Tool Dropshipping', N'tools/11_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.13)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (12, 1, N'HW-012', N'Plastic Car', 13, 12.81, N'4Pcs Plastic Car Disassembly Interior Kit Audio Removal Trim Panel Dashboard Car DVD Player Auto Trim Removal Tool', N'tools/12_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (13, 1, N'HW-013', N'Screen Opening', 14, 12.07, N'Disassembly Heavy Duty Suction Cup Car Dent Remover Puller Phone Repair Tool for iPhone LCD Screen Opening Tools Glass Lifter', N'tools/13_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (14, 1, N'HW-014', N'Mini Spade Shovel', 14, 12.34, N'3pcs Practical Mini Spade Shovel Gardening Tools Children Harrow Shovel Rake Plant Maintenance Wooden Handle Garden Tool Set', N'tools/14_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (15, 1, N'HW-015', N'Separating Pliers      ', 14, 8.96, N'Suction Cup Screen Separating Pliers LCD Separator Opening Tools Mobile Phone Repair Tools Pliers', N'tools/15_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (16, 1, N'HW-016', N'Plasterboard Gypsum', 14, 6.9, N'15mm Plasterboard Gypsum Board Wood Planer Edge Jig Plane Woodworking Tool', N'tools/16_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (17, 1, N'HW-017', N'Cocktail Muddler', 14, 14.33, N'Useful Cocktail Muddler Barware Mojito Cocktail Stainless Steel Bar Mixer DIY Drink Fruit Muddler Crushed Ice Barware Bar Tool', N'tools/17_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.09)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (18, 1, N'HW-018', N'Toolbox+Digital ', 14, 6.59, N'9/12/13/16pcs Household Repair Hand Tool Kit Screwdriver+Knife+Wire Pliers+Toolbox+Digital Pen with Plastic Toolbox Storage Case', N'tools/18_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (19, 1, N'HW-019', N'Stainless Steel', 14, 10.36, N'28*33*18mm Deburring External Chamfer Tool Stainless Steel Metal Remove Burr Repairs Tools for Chuck Drills Bit', N'tools/19_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'1         ', 0.15)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (20, 1, N'HW-020', N'Screwdriver Bit', 14, 9.59, N'2pcs 1/4"Extension Drill Guide Rod Hex Bit Drill Holder Telescoping Bit Mini Handy Magnetic Screwdriver Bit', N'tools/20_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'1         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (21, 1, N'HW-021', N'Wood Router', 14, 15.38, N'35pcs 1/4in Handle Wood Router Bit Mill Engraving Trim Woodworking Milling Cutter Trimmer Adapter Machine Tools Set Router Bits', N'tools/21_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (22, 1, N'HW-022', N'Frame Pipe', 14, 6.68, N'10pcs Clamp Greenhouse Frame Pipe Tube and Film Clip Clamp Connector Kits 19 22 25mm Smooth Tenacious Pipe Clamp Garden Access', N'tools/22_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (23, 1, N'HW-023', N'Gold Molybdenum', 14, 19, N'100M LCD Cutting Wire 0.10mm Gold Molybdenum Cutting Wire Line Splitter LCD Glass Cutting Line for Cell Phones Screen Separator', N'tools/23_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (24, 1, N'HW-024', N'Tool Bag', 14, 14.92, N'Multi-function Canvas Waterproof Storage Hand Tool Bag Portable Tool kit Wrenches Screwdrivers Pliers Metal Parts Storage Bag', N'tools/24_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (25, 1, N'HW-025', N'Glass Foil ', 14, 10.37, N'20m 10mm Copper Foil Stained Glass Foil Tape for EMI Shielding Slug Repellent Electrical Repair Waterproof Single Conductive', N'tools/25_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (26, 1, N'HW-026', N'Wood Router', 14, 8.84, N'1/4in T-type Wood Router Bit Mill Engraving Trimmer Adapter Milling Cutter Woodworking Tool', N'tools/26_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (27, 1, N'HW-027', N'Pick Up Tool', 14, 6.36, N'2 in 1 Plus Minus Magnetizer Degaussing Demagnetizer Magnetic Pick Up Tool for Screwdriver Tips Screw Bit', N'tools/27_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (28, 1, N'HW-028', N'Saw Blade', 14, 9.6, N'100mm HCS Segment Saw Blade Multi Tools For Multimaster Fein Dremel Renovator Power Tool for Woodworking Metal Cutting', N'tools/28_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (29, 1, N'HW-029', N'Chuck Mini Drill', 14, 19.62, N'Universal Multi Keyless Chuck Mini Drill Chuck Keyless Per Drill Rotary Tool Grinder 0.3-3.2mm', N'tools/29_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (30, 1, N'HW-030', N'Tinned Copper Wire', 14, 19.06, N'0.02mm/120m Tinned Copper Wire PCB Maintenance Link Wire Jump Line for Mobile Phone Repair Tools Insulated/Non-insulated', N'tools/30_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (31, 1, N'HW-031', N'Dowel Tenon', 14, 10.21, N'8pcs Dowel Centre Point Pin Set 6/8/10/12mm Dowel Tenon Center Set Solid/Hollow Woodworking Transfer Tools', N'tools/31_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (32, 1, N'HW-032', N'Stitching Punch', 14, 12.04, N'mm Spacing Leather Hole Punches DIY Handmade Round Stitching Punch Tools Hole Cutter Leather Punching Tool 2/4/6/Hole', N'tools/32_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.03)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (33, 1, N'HW-033', N'Steel Socket', 14, 7.51, N'Stainless Steel Socket Extending Rod Golden Keychain Extension Bar for Screwdriver Bits', N'tools/33_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (34, 1, N'HW-034', N'Keyless Chuck ', 14, 3.34, N'Universal Multi Keyless Chuck Mini Drill Chuck Keyless Per Drill Rotary Tool Grinder 0.3-3.2mm', N'tools/34_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (35, 1, N'HW-035', N'Diamond Coated Glass ', 14, 10.74, N'100mm Diamond Coated Glass Grinding Cutter Saw Blade Wheel Disc Rotary Tool for Marble Granite Glass', N'tools/35_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (36, 1, N'HW-036', N'Pair Universal', 14, 8.93, N'80cm 1 Pair Universal Multi Meters Tester Lead Probe Wire Pen 1000V 10A for Multimeter Meter Needle Tip Probe Test Leads Pin', N'tools/36_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (37, 1, N'HW-037', N'Drill Bits', 14, 10.23, N'295mm 1/4 Flexible Shaft Electronic Drill Bits Extension Screwdriver Bit Holder Connect Link Hex Shank Extension Snake Bit Tool', N'tools/37_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (38, 1, N'HW-038', N'Twist Drill Bits ', 14, 17.95, N'13pcs HSS Metric System Durable Titanium Quick Change Twist Drill Bits Set Tools Mini Electric Twist Drill Bit Tools With Case', N'tools/38_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.2)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (39, 1, N'HW-039', N'Saw Blade', 14, 14.36, N'100mm HCS Segment Saw Blade Multi Tools For Multimaster Fein Dremel Renovator Power Tool for Woodworking Metal Cutting', N'tools/39_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'2         ', 0.13)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (40, 1, N'HW-040', N'Scotch Double Sided', 14, 11.98, N'2/3/4/5/6mm 3M Scotch Double Sided Tape Sticky for Mobile Phone Repaired Acrylic Glue White Tape Repair Tools', N'tools/40_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'2         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (41, 1, N'HW-041', N'Drill Hole', 14, 9.94, N'Hole Cutter 4-12mm Cone Step Drill Hole Tools Countersink Drill Bit Power Tools Step Drill Bit for Metal Tools Set', N'tools/41_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (42, 1, N'HW-042', N'Soldering Iron', 14, 16.95, N'900M Soldering Tips Pure Copper Lead-free Screwdriver Soldering Iron Tips Electric Iron Head Soldering Station Welding Equipment', N'tools/42_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (43, 1, N'HW-043', N'Keyless Drill ', 14, 20.11, N'1pc 0.3-6.5mm/0.3-8mm Clamping Range Keyless Drill Chuck Adapter Impact Hex Shank Driver Tool Accessories for Rotary Power Tool', N'tools/43_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'3         ', 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (44, 1, N'HW-044', N'Hot Air Gun', 14, 3.39, N'8pcs Soldering Iron 850 Hot Air Gun Nozzle Welding Nozzles Heat Resistant Aluminum Alloy 3/4/5/6/7/8/10/12 mm', N'tools/44_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (45, 1, N'HW-045', N'Concrete Drilling', 14, 17.49, N'5pcs Masonry Drill Bits Tungsten Carbide Tipped Concrete Drilling Set Size 5/6/8/10/12mm Power Tool Accessories', N'tools/45_0.jpg', CAST(N'2019-10-18' AS Date), 3, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (46, 1, N'HW-046', N'Washer Water', 14, 10.54, N'Car High Pressure Power Water Gun Airbrush Washer Water Jet Garden Water Hose Wand Nozzle Spray Sprinkler Cleaning Tool Dropship', N'tools/46_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'3         ', 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (47, 1, N'HW-047', N'Anti-Slip Hex S2', 14, 7.78, N'5Pcs PH2 Single Head Magnetic Screwdriver Bit Anti-Slip Hex S2 PH2 Electric Screw Driver Set For Power Tools', N'tools/47_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'3         ', 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (48, 1, N'HW-048', N'Head Metal Plate ', 14, 11.41, N'Nibble Metal Cutting Double Head Metal Plate Cutting Nibbler Sheet Saw Cutter Tools Drill Attachment Free Cutting Tool Cutter', N'tools/48_0.jpg', CAST(N'2019-10-18' AS Date), 2, N'3         ', 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (49, 1, N'HW-049', N'Scrubber Brush Drill', 14, 6.06, N'3pcs/set Power Scrubber Brush Drill Brush Clean for Bathroom Surfaces Tub Shower Tile Grout Cordless Power Scrub Cleaning Tools', N'tools/49_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (50, 1, N'HW-050', N'Gun Airbrush', 14, 12.58, N'Professional 0.8MM/1.0MM Nozzle H-2000 Mini Air Paint Spray Gun Airbrush HVLP Spray Gun for Painting Car Aerograph Airbrush', N'tools/50_0.jpg', CAST(N'2019-10-18' AS Date), 1, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (51, 1, N'HW-051', N'Electric USB Soldering', 14, 19.6, N'10W Electric USB Soldering Iron Pen DC5V Soldering Tip LED Indicator Touch Switch Metal Stand Welding Equipment', N'tools/51_0.jpg', CAST(N'2019-10-27' AS Date), 3, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (52, 1, N'HW-052', N'Car Washer DC', 14, 18.01, N'Car Washer DC 12V Electric Pump Portable Car Shower Washer Set Camping Shower Outdoor Camping Travel Pet Dog Man Woman', N'tools/52_0.jpg', CAST(N'2019-10-27' AS Date), 2, N'3         ', 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (53, 1, N'HW-053', N'Lithium Batteries', 14, 23.63, N'NI-CD18V2.0Ah Power Tools Battery Pack 18V Power Tools Lithium Batteries', N'tools/53_0.jpg', CAST(N'2019-10-27' AS Date), 2, N'3         ', 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (54, 1, N'HW-054', N'Paint Airbrush Pro', 14, 13.9, N'Mini Air Paint HVLP Spray Gun Gravity Feed Vehicle Car Paint Airbrush Pro Cake Spraying Gun Professional Air Paint Spray Gun', N'tools/54_0.jpg', CAST(N'2019-10-27' AS Date), 2, N'3         ', 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (55, 1, N'HW-055', N'Spray Gun', 14, 27.25, N'200ml Electric Painting Spray Gun Handheld Sprayer Painter Cake Chocolate Painting Sprayer Gun Adjustable Latex Paint Spray Gun', N'tools/55_0.jpg', CAST(N'2019-10-27' AS Date), 1, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (56, 1, N'HW-056', N'Tool Electric', 14, 11.04, N'Household Portable Reciprocating Saw Metal Cutting Wood Cutting Tool Electric Drill Attachment Power Tool Accessories
5.0', N'tools/56_0.jpg', CAST(N'2019-10-27' AS Date), 3, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (57, 1, N'HW-057', N'Bench Vise', 14, 20.95, N'Bench Vise Table Screw Vise Bench Clamp Screw Vise for Metalworking Electric Drill Clamp Grinder Holder Bracket Repair Tools', N'tools/57_0.jpg', CAST(N'2019-10-27' AS Date), 2, N'3         ', 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (58, 1, N'HW-058', N'Mini Power Driver', 14, 4.27, N'12V Home Mini Power Driver Cordless Drill Rechargeable Electric Screwdriver Wireless Power Driver DC Lithium-Ion Battery', N'tools/58_0.jpg', CAST(N'2019-10-27' AS Date), 2, N'3         ', 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (59, 1, N'HW-059', N'Cordless Drill', 14, 22.92, N'Mini Wireless Power Driver Cordless Drill Rechargeable Electric Screwdriver Lithium-Ion Battery Operated Rechargeable Power Tool', N'tools/59_0.jpg', CAST(N'2019-10-27' AS Date), 2, N'3         ', 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (60, 1, N'HW-060', N'Chain Brushcutter', 14, 17, N'Lawn Mower Trimmer Head Chain Brushcutter for Garden Grass Brush Cutter Tools Parts Gardening Tools Trimmer Head Chain', N'tools/60_0.jpg', CAST(N'2019-10-27' AS Date), 3, N'3         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (61, 2, N'HW-061', N'Mirror Alarm Clock', 20, 27.63, N'LED Mirror Alarm Clock Digital Snooze Table Clock Wake Up Light Electronic Large Time Temperature Display Home Decoration Clock', N'Measurements/61_0.jpg', CAST(N'2019-11-01' AS Date), 2, N'4         ', 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (62, 2, N'HW-062', N'LCD Thermometer', 20, 17.33, N'Digital LCD Thermometer Hygrometer Electronic Temperature Humidity Meter Tester High Quality Hygrometer Household Thermometer', N'Measurements/62_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (63, 2, N'HW-063', N'Digital Temperature', 20, 12.83, N'DC12V Digital Temperature Controller LED Display Thermostat NTC Thermometer', N'Measurements/63_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (64, 2, N'HW-064', N'Fridge Thermometer', 20, 21.6, N'Mini Digital Refrigerator LCD Probe Fridge Freezer Thermometer Temperature Sensor Thermograph Meter Fridge Thermometer', N'Measurements/64_0.jpg', CAST(N'2019-11-01' AS Date), 2, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (65, 2, N'HW-065', N'Submersible Thermometer', 20, 29.81, N'Glasstube Aquariums Submersible Thermometer Temperature Decor Suction Cup', N'Measurements/65_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (66, 2, N'HW-066', N'Multifunction', 20, 28.57, N'Multifunction Thermometer Hygrometer Automatic Electronic Temperature Sensor Humidity Monitor Clock 3.2inch Large LCD Screen', N'Measurements/66_0.jpg', CAST(N'2019-11-01' AS Date), 1, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (67, 2, N'HW-067', N'DC 12V 24V 220V', 20, 14.17, N'DC 12V 24V 220V Digital Temperature Controller 10A Thermostat Control Switch with Probe Sensor Thermometer Thermo Controller', N'Measurements/67_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (68, 2, N'HW-068', N'125C LED Temperature', 20, 25.6, N'-50~125C LED Temperature Meter Detector Sensor Probe DC4-28V High-precision Dual-display Digital Car Thermometer Monitor Tester', N'Measurements/68_0.jpg', CAST(N'2019-11-01' AS Date), 2, N'4         ', 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (69, 2, N'HW-069', N'Pools Thermometer', 20, 4.71, N'Swimming Pools Thermometer Water Portable Water Sauna Digital Floating Thermometers Floating Temperature Measure Instruments', N'Measurements/69_0.jpg', CAST(N'2019-11-01' AS Date), 2, N'4         ', 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (70, 2, N'HW-070', N'Temperature Humidity', 20, 21.26, N'Digital Temperature Humidity Sensor Module Tester High Precision sensor AM2320B IIC Double Output with Shell Sensor', N'Measurements/70_0.jpg', CAST(N'2019-11-01' AS Date), 2, N'4         ', 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (71, 2, N'HW-071', N'Water Special Thermometer ', 20, 26, N'Floating Pool Outdoor Swimming Pool Water Special Thermometer Pond Water Temperature Tester Analysis Instruments', N'Measurements/71_0.jpg', CAST(N'2019-11-01' AS Date), 2, N'4         ', 0.09)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (72, 2, N'HW-072', N'Humidity Meter', 20, 17.4, N'Digital LCD Thermometer Hygrometer Electronic Temperature Humidity Meter Tester High Quality Hygrometer Household Thermometer', N'Measurements/72_0.jpg', CAST(N'2019-11-01' AS Date), 1, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (73, 2, N'HW-073', N'Digital LCD Display', 20, 29.39, N'Electronic Digital LCD Display Temperature Humidity Meter ABS Button Battery Weather Graphic Display Sensor Thermometer', N'Measurements/73_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (74, 2, N'HW-074', N'Gas Monitor', 20, 22.99, N'8 in 1 Gas Monitor PM2.5/HCHO/TVOC/AQI Temperature Humidity Meter Thermometer Hygrometer Gas Detector Analyzer', N'Measurements/74_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (75, 2, N'HW-075', N'Car Auto Voltmeter', 20, 30.88, N'2 in 1 Car Auto Voltmeter Dual Display LED Digital Thermometer Voltmeter Electrical Voltage Temperature Meter Tester 3 Colors', N'Measurements/75_0.jpg', CAST(N'2019-11-01' AS Date), 2, N'4         ', 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (76, 2, N'HW-076', N'Indoor Outdoor Thermometer', 20, 24.38, N'LCD Digital Temperature Humidity Meter Digital Data Hold Humidity Temperature Meter Indoor Outdoor Thermometer Thermo-Hygrometer', N'Measurements/76_0.jpg', CAST(N'2019-11-01' AS Date), 1, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (77, 2, N'HW-077', N'ANENG LCD', 20, 20.2, N'ANENG LCD Backlight Digital Multimeter AC/DC Ammeter Voltmeter Temperature Meter Automatic Multimeter Voltage/Current/Resistance', N'Measurements/77_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (78, 2, N'HW-078', N'W3230 DC12V 20A ', 20, 13.45, N'W3230 DC12V 20A Digital Thermostat Digital Temperature Regulator Controller Data Save Red and Blue Display -55-120 Degree', N'Measurements/78_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (79, 2, N'HW-079', N'Indoor Room Floor', 20, 28.13, N'Electric Indoor Room Floor Heating Thermostat Temperature Controller Cool Warm Regulator 220V 1A Dial Temperature Controller', N'Measurements/79_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (80, 2, N'HW-080', N'Pen Temperature Testers', 20, 31.18, N'DT8230 Mini Digital Pen Temperature Testers Digital LCD Mini Infrared Thermometer Temperature Meter Testers', N'Measurements/80_0.jpg', CAST(N'2019-11-01' AS Date), 3, N'4         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (81, 2, N'HW-081', N'Monocular Telescope', 10, 20.87, N'600M/900M Monocular Telescope Laser Rangefinder Hunting Outdoor Sports Golf Range Finder Distance Meter Laser Measurement Tools', N'Measurements/81_0.jpg', CAST(N'2019-11-03' AS Date), 1, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (82, 2, N'HW-082', N'Fresnel Lens', 10, 14.26, N'10pcs/Set 3X Transparent Magnifier Credit Card Shape Magnifiers Plastic Magnifying Fresnel Lens for Reading Newspaper Book', N'Measurements/82_0.jpg', CAST(N'2019-11-03' AS Date), 2, N'5         ', 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (83, 2, N'HW-083', N'Measure Sewing', 10, 17.54, N'4pcs 60inch 150cm Tape Measure Sewing Tools Portable Body Measuring Tape Tailor Ruler Soft Ruler', N'Measurements/83_0.jpg', CAST(N'2019-11-03' AS Date), 2, N'5         ', 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (84, 2, N'HW-084', N'Ruler Inclinometer', 10, 12.58, N'200mm Digital Protractor Ruler Inclinometer Goniometer Level Measuring Tool Electronic Angle Gauge Stainless Steel Angle Ruler', N'Measurements/84_0.jpg', CAST(N'2019-11-03' AS Date), 1, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (85, 2, N'HW-085', N'Protractor Ruler', 10, 19.53, N'7inch Aluminum Speed Square Triangle Angle Protractor Ruler Measuring Tool Multi-functional Engineering Supplies Dropshipping', N'Measurements/85_0.jpg', CAST(N'2019-11-03' AS Date), 2, N'5         ', 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (86, 2, N'HW-086', N'Magnifier Loupe', 10, 26.59, N'Portable 20 x 21mm Jewelry Magnifying Glass 20X Folding Magnifier Loupe for Jewelry Coins Stamps Antiques', N'Measurements/86_0.jpg', CAST(N'2019-11-03' AS Date), 3, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (87, 2, N'HW-087', N'Ruler Locator', 10, 24.02, N'2pcs Woodworking Right Angle Ruler Locator Positioning Block Fixed Carpentry Clamp Tool Right Angle Assist Angle Measuring Tools', N'Measurements/87_0.jpg', CAST(N'2019-11-03' AS Date), 2, N'5         ', 0.15)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (88, 2, N'HW-088', N'Portable Keychain', 10, 16.12, N'10X Magnifying Glass Folding Magnifier Handheld Glass Lens Plastic Portable Keychain Loupe Optical Instruments', N'Measurements/88_0.jpg', CAST(N'2019-11-03' AS Date), 1, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (89, 2, N'HW-089', N'Tape Measure', 10, 14.39, N'150cm Sewing Tape Measure Retractable Ruler Portable Body Measuring Tape for Shopping Sewing Tool Tape Children Height Ruler', N'Measurements/89_0.jpg', CAST(N'2019-11-03' AS Date), 3, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (90, 2, N'HW-090', N'Straight Ruler ', 10, 25.18, N'Stainless Steel Metal Straight Ruler Precision Double Sided Measuring Tool', N'Measurements/90_0.jpg', CAST(N'2019-11-03' AS Date), 2, N'5         ', 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (91, 2, N'HW-091', N'Multi-Ruler 360', 10, 9.91, N'Multi-Ruler 360 Degree Goniometer Angle Medical Spinal Ruler Protractor Grinded PVC Ruler Measuring Accessories', N'Measurements/91_0.jpg', CAST(N'2019-11-03' AS Date), 3, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (92, 2, N'HW-092', N'180 Degree', 10, 23.01, N'Stainless Steel 180 Degree Protractor Angle Ruler Round Head Digital Angle Finder Rotary Measuring Tools', N'Measurements/92_0.jpg', CAST(N'2019-11-04' AS Date), 1, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (93, 2, N'HW-093', N'Slope Inclinometer', 10, 7.25, N'Slope Inclinometer Angle Finder Measuring Slope Protractor with Magnetic Base Measuring Gauging Tools', N'Measurements/93_0.jpg', CAST(N'2019-11-04' AS Date), 1, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (94, 2, N'HW-094', N'Chuck Drills', 10, 29.65, N'Drill Bit Deburring External Chamfer Tool Stainless Steel Metal Remove Burr Tools for all kinds of Chuck Drills Dropshiping', N'Measurements/94_0.jpg', CAST(N'2019-11-04' AS Date), 2, N'5         ', 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (95, 2, N'HW-095', N'Money Marker', 10, 11.24, N'5pcs Money Marker Portable Useful Banknotes Money Tester Detector Pen Counterfeit Marker Fake Notes', N'Measurements/95_0.jpg', CAST(N'2019-11-04' AS Date), 2, N'5         ', 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (96, 2, N'HW-096', N'LED Solar Light', 10, 19.47, N'1-4 pcs 20/30 LED Solar Light Solar PIR Motion Sensor Lamp Waterproof Outdoor Garden Pathway Yard Emergency Security Wall Light', N'Measurements/96_0.jpg', CAST(N'2019-11-04' AS Date), 1, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (97, 2, N'HW-097', N'Alloy Angle', 10, 6.7, N'Aluminum Alloy Angle Gauge Ruler Protractor Inclinometer Woodwork Measuring Tool Durable Auxiliary Scribing Tool 92x49x4mm', N'Measurements/97_0.jpg', CAST(N'2019-11-04' AS Date), 3, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (98, 2, N'HW-098', N'90 Degree Right', 10, 25.24, N'200mm 90 Degree Right Angle Ruler Gauge Holder Woodworking Protractor Engineers Wood Measuring Tool Try Square Measuring Tool', N'Measurements/98_0.jpg', CAST(N'2019-11-04' AS Date), 1, N'5         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (99, 2, N'HW-099', N'Wire Pen Cable', 10, 19.05, N'PT1005 10A Universal Probe Test Leads for Multimeter with Alligator Pliers Multi Meter Tester Lead Probe Wire Pen Cable Tools', N'Measurements/99_0.jpg', CAST(N'2019-11-04' AS Date), 2, N'5         ', 0.04)
GO
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (100, 2, N'HW-100', N'Counter LCD', 10, 12.71, N'1Pcs Mini Stitch Marker And Row Finger Counter LCD Electronic Digital Tally Counter For Sewing Knitting weave Tool', N'Measurements/100_0.jpg', CAST(N'2019-11-04' AS Date), 2, N'5         ', 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (101, 3, N'HW-101', N'Water Stopper', 10, 11.73, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/101_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.18)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (102, 3, N'HW-102', N'Toothbrush Holder', 10, 28.55, N'Cartoon Toothbrush Holder with Holes Toothbrush Bracket Container Tooth Shape Bathroom Shelf Bathroom Products', N'improvement/102_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (103, 3, N'HW-103', N'Bathroom Shower', 10, 25.55, N'High Pressure Bathroom Shower Head Handheld Water Saving Hand Shower Head Filter Sprayer Head Bathroom Shower Holder', N'improvement/103_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (104, 3, N'HW-104', N'Plastic Shower ', 10, 13.59, N'4/6in ABS Plastic Shower Head Hand Held Adjustable 2 Mode Handheld Bathroom High Pressure Water Saving Jetting Showerhead', N'improvement/104_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (105, 3, N'HW-105', N'SPA shower', 10, 17.05, N'SPA shower Pressure Rainfall Shower Head 300 Holes Shower Head Water Saving Filter Spray Nozzle High Pressure Pressurized showe', N'improvement/105_0.jpg', CAST(N'2019-11-08' AS Date), 3, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (106, 3, N'HW-106', N'Curtain Bathroom', 10, 13.55, N'1.8*1.8m Moldproof Waterproof 3D Thickened Bathroom Bath Shower Simple Curtain Bathroom Products Home Decor', N'improvement/106_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (107, 3, N'HW-107', N'Bathroom Adhesive', 10, 18.41, N'6pcs Waterproof Tiles Mosaic Wall Stickers Kitchen Bathroom Adhesive Decor Home Decoration 20x20cm', N'improvement/107_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (108, 3, N'HW-108', N'Handheld Shower', 10, 31.83, N'Bathroom Pressurize Handheld Shower Head Water Saving Filter Spray Nozzle Bathroom Watersaving Big Panel Spray', N'improvement/108_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (109, 3, N'HW-109', N'Rainfall Shower', 10, 13.88, N'SPA shower Pressure Rainfall Shower Head 300 Holes Shower Head Water Saving Filter Spray Nozzle High Pressure Pressurized showe', N'improvement/109_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (110, 3, N'HW-110', N'Lights Colorful', 10, 27.98, N'7 Colors LED Water Faucet Lights Colorful Changing Glow Shower Head Kitchen Tap Aerators for Kitchen Bathroom Faucets Products', N'improvement/110_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (111, 3, N'HW-111', N'Shower Head', 10, 20.77, N'Shower Head Top Spray ABS Full Electroplating Thread Water Saving Rainfall Pressuized Shower Head Water Saving Bathroom', N'improvement/111_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.03)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (112, 3, N'HW-112', N'Wall Lamp', 10, 23.24, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/112_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (113, 3, N'HW-113', N'Toilet Lamp ', 10, 5.01, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/113_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (114, 3, N'HW-114', N'Adjustable Showe', 10, 15.99, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/114_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (115, 3, N'HW-115', N'Hanging Rack', 10, 17.4, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/115_0.jpg', CAST(N'2019-11-08' AS Date), 2, N'7         ', 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (116, 3, N'HW-116', N'Shower Spray', 10, 12.63, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/116_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (117, 3, N'HW-117', N'Non-Slip Silicone ', 10, 15.99, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/117_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (118, 3, N'HW-118', N'Toothbrush Holder', 10, 21.76, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/118_0.jpg', CAST(N'2019-11-08' AS Date), 3, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (119, 3, N'HW-119', N'LED Aluminum', 10, 7.76, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/119_0.jpg', CAST(N'2019-11-08' AS Date), 1, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (120, 3, N'HW-120', N'Hair Dryer', 10, 17.39, N'Bathroom Water Stopper Flood Barrier Rubber Dam Silicon Water Blocker Dry and Wet Separation Home Improve Supplies', N'improvement/120_0.jpg', CAST(N'2019-11-08' AS Date), 3, N'7         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (121, 3, N'HW-121', N'Brass Faucets', 10, 19.9, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/121_0.jpg', CAST(N'2019-11-10' AS Date), 3, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (122, 3, N'HW-122', N'Water Bubble', 10, 17.7, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/122_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (123, 3, N'HW-123', N'Sealing Strip', 10, 14.85, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/123_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (124, 3, N'HW-124', N'Faucet Nozzle', 10, 16.73, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/124_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (125, 3, N'HW-125', N'Faucet Accessories', 10, 19.5, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/125_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (126, 3, N'HW-126', N'Butter Cutting', 10, 18.27, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/126_0.jpg', CAST(N'2019-11-10' AS Date), 2, N'8         ', 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (127, 3, N'HW-127', N'ED Bar Light', 10, 20.1, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/127_0.jpg', CAST(N'2019-11-10' AS Date), 2, N'8         ', 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (128, 3, N'HW-128', N'Wall-Mount', 10, 6.91, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/128_0.jpg', CAST(N'2019-11-10' AS Date), 3, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (129, 3, N'HW-129', N'Multifunction Slicer', 10, 18.4, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/129_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (130, 3, N'HW-130', N'Slicer Vegetable ', 10, 16.14, N'2019 New Slicer Vegetable Slicer Potato Peeler Carrot Onion Grater with Strainer Vegetable Cutter Kitchen Accessories', N'improvement/130_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'8         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (131, 3, N'HW-131', N'Hole Drilling', 10, 21.14, N'35mm 40mm Hinge Hole Drilling Guide Locator Hole Opener Template Door Cabinets DIY Tools Woodworking Punch Hinge Drill Hole Tool', N'improvement/131_0.jpg', CAST(N'2019-11-10' AS Date), 3, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (132, 3, N'HW-132', N'Wardrobe Locks', 10, 19.8, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/132_0.jpg', CAST(N'2019-11-10' AS Date), 2, N'9         ', 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (133, 3, N'HW-133', N'Drawer Cabinet ', 10, 27.31, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/133_0.jpg', CAST(N'2019-11-10' AS Date), 3, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (134, 3, N'HW-134', N'Lock Limit', 10, 17.58, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/134_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (135, 3, N'HW-135', N'Hinged Hole', 10, 27.12, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/135_0.jpg', CAST(N'2019-11-10' AS Date), 2, N'9         ', 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (136, 3, N'HW-136', N'Door Lever Lock', 10, 20.54, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/136_0.jpg', CAST(N'2019-11-10' AS Date), 1, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (137, 3, N'HW-137', N'Lace Curtains', 10, 17.29, N'Lace Curtains Voile Tulle Curtains Insect Bed Canopy Netting Drape Panel Leaf Door Window Sheer Curtain for Living Room', N'improvement/137_0.jpg', CAST(N'2019-11-10' AS Date), 3, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (138, 3, N'HW-138', N'Blackout Curtains', 10, 27.98, N'Lace Curtains Voile Tulle Curtains Insect Bed Canopy Netting Drape Panel Leaf Door Window Sheer Curtain for Living Room', N'improvement/138_0.jpg', CAST(N'2019-11-10' AS Date), 2, N'9         ', 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (139, 3, N'HW-139', N'Window Glass', 10, 12.93, N'Window Glass Film Reduce Glare Sunscreen New and High Quality One Way Mirror Heat Insulation Sticker Bedroom Home Decoration', N'improvement/139_0.jpg', CAST(N'2019-11-10' AS Date), 3, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (140, 3, N'HW-140', N'Glass Cutter', 10, 16.19, N'40cm Circular Glass Cutter Glass Cutter Wheel Compasses Circular Cutting With Suction Cup Tools Window Warranty', N'improvement/140_0.jpg', CAST(N'2019-11-10' AS Date), 2, N'9         ', 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (141, 3, N'HW-141', N'curtains Shading', 10, 17.37, N'Modern blackout curtains Shading Sliding Curtains for window treatment blinds finished drapes window blackout curtains', N'improvement/141_0.jpg', CAST(N'2019-11-10' AS Date), 3, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (142, 3, N'HW-142', N'Door Lock', 10, 22.26, N'Door Latch Bolt Brushed Furniture Bolt Security Sliding Door Thickened Cabinet Latch Door Lock Pin Zinc Alloy', N'improvement/142_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (143, 3, N'HW-143', N'Car Interior', 10, 18.79, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/143_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'9         ', 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (144, 3, N'HW-144', N'Shank Glass', 10, 25.12, N'1/2" Shank Glass Door Rail Stile Reversible Router Bit Wood Cutting Tool Woodworking Router Bits Home Wood Cutting Accessories', N'improvement/144_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (145, 3, N'HW-145', N'Rubber Telescopic', 10, 20.46, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/145_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (146, 3, N'HW-146', N'Mosquito Net', 10, 15.8, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/146_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (147, 3, N'HW-147', N'AC100-240V', 10, 17.81, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/147_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (148, 3, N'HW-148', N'Automatic Greenhouse', 10, 25.74, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/148_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'9         ', 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (149, 3, N'HW-149', N'Door Bell', 10, 13.05, N'Brass Faucets Standard Connector Washing Machine Gun Quick Connect Fitting Pipe Connections Threaded Tap Connectors Tools', N'improvement/149_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'9         ', 0.13)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (150, 3, N'HW-150', N'Brass Faucets', 10, 15.46, N'Smart WiFi DoorBell Door Viewers HD 720P Visual Intercom Recording Video Remote Home Monitoring Night Vision Video Door Phone', N'improvement/150_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'9         ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (151, 5, N'HW-151', N'Electric Knife', 10, 28.32, N'Electric Knife Sharpener Professional Motorized Knife Sharpener Rotating Sharpening Stone Kitchen High-Speed Sharpening Tool', N'Home&Garden/201_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (152, 5, N'HW-152', N'Calories Microwave', 10, 14.84, N'DIY Low Calories Microwave Oven Fat Free Potato Chips Maker Kitchen Bakeware Tools Baking Dishes & Pans Chips Rack', N'Home&Garden/202_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'14        ', 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (153, 5, N'HW-153', N'Kitchen Accessories', 10, 19.47, N'Kitchen Accessories Cooking Gadgets Silicone Anti Overflow Lid Holder Soup Funny Man Phone Holder Stand Universial Kitchen Tool', N'Home&Garden/203_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (154, 5, N'HW-154', N'Ex-large Silicone', 10, 10.03, N'Ex-large Silicone Baking Mat for Oven Scale Rolling Dough Mat Baking Rolling Fondant Pastry Mat Non-stick Bakeware Cooking Tool', N'Home&Garden/204_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (155, 5, N'HW-155', N'3D Skull', 10, 17, N'3D Skull Ice Silicone Mold Maker Ice Cube Tray Pudding Mold Cake Candy Mould Bar Party Cool Wine Ice Cream Kitchen DIY Accessory', N'Home&Garden/205_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'14        ', 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (156, 5, N'HW-156', N'Sponge Magic', 10, 25.37, N'3/20/50/100pcs High Density Melamine Sponge Magic Sponge Eraser Cleaner Nano Sponge for Kitchen Office Bathroom Cleaning', N'Home&Garden/206_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (157, 5, N'HW-157', N'Kitchen Tools', 10, 25.17, N'Kitchen Tools Dumpling Maker Tool Device Easy DIY Hand Pinch Dumpling Mold Dumplings Folder Dessert Mold Maker Tools White', N'Home&Garden/207_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (158, 5, N'HW-158', N' Cover Liner', 10, 23.1, N'Gas Stove Protector Cover Liner Reusable Non Stick Dishwasher Protective Pad Gas Burner Stovetop Protector Kitchen Supplies', N'Home&Garden/208_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'14        ', 0.09)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (159, 5, N'HW-159', N'Cake Molds', 10, 17.21, N'New 1PCS Chess Shape Silicone Cake Molds Fondant Cake Jelly Candy Chocolate Mold DIY Bakware Decorate 20.5*8.5cm', N'Home&Garden/209_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (160, 5, N'HW-160', N'Beer Bottle Opener', 10, 13.63, N'FIsh Shape Beer Bottle Opener Fishbone Aluminum Alloy Bottle Opener Keychain Ring kitchen Tool Trinket Gifts Color Random', N'Home&Garden/210_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'14        ', 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (161, 5, N'HW-161', N'Water Shovel', 10, 20.29, N'Water Shovel Kitchen Accessories Nylon Strainer Scoop Colander Drain Water Leaking Shovel Stainer Gadgets Cooking Tools Droship', N'Home&Garden/211_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (162, 5, N'HW-162', N'Stainless Steel', 10, 25.91, N'Stainless Steel Wine Olive Oil Pourer Dispenser Spout Glass Bottle Wine Bottle Pour Spout Stopper Barware For Bar Dropshipping', N'Home&Garden/212_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (163, 5, N'HW-163', N'Potato Cutter', 10, 32.91, N'ABS+Stainless Steel Potato Cutter Vegetable Slicer Chopper Chips Making Device for Fries Kitchen Cooking Tools', N'Home&Garden/213_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (164, 5, N'HW-164', N'Straws Reusable', 10, 16.56, N'4/6/8pcs Reusable Metal Straws Reusable Drinking Stainless Steel Straws with Cleaner Brush Kits for Mugs Party Bar Accessories', N'Home&Garden/214_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (165, 5, N'HW-165', N'Carved Pens', 10, 27.14, N'4PCS/Set Useful Bakeware Carved Pens Gadgets Simple DIY Flower Modelling Tool Fondant Biscuits Cake Molds Cake Decorating Tools', N'Home&Garden/215_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (166, 5, N'HW-166', N'Kitchen Scales', 10, 22.94, N'Adjustable Kitchen Scales Measure Cups Double-head Cookware Measuring Spoon for Soup Coffee Tea Powder with Scal Kitchen Gadget
', N'Home&Garden/216_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'14        ', 0.03)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (167, 5, N'HW-167', N'Cookie Mould', 10, 17.18, N'5pcs Stainless Steel Biscuit Mould Cake Tool Cookie Mould Cutters Specialized Multi-function DIY Baking Tools Dropshipping', N'Home&Garden/217_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'14        ', 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (168, 5, N'HW-168', N'Disposable Plastic', 10, 27.63, N'50pcs Disposable Plastic Colorful Stick Love Heart Arrow Shape Fruit Fork Picks Set for Party kitchen accessorie', N'Home&Garden/218_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (169, 5, N'HW-169', N'Drinking Straws', 10, 16.97, N'2pcs Reusable Silicone Drinking Straws Home Party Straw with Cleaning Brush for Home Party Wedding Decor Bar Accessories Straws', N'Home&Garden/219_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'14        ', 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (170, 5, N'HW-170', N'Defrost Tray', 10, 15.24, N'Defrost Tray Food Meat Pork Thaw Frozen in Minutes Kitchen Defrosting Tools', N'Home&Garden/220_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'14        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (171, 5, N'HW-171', N'Microfiber Duster', 10, 20.36, N'Adjustable Stretch Extend Microfiber Duster Static Suction Dusting Brush Clean Up Table Car Dust Anti-Static House Cleaning Tool', N'Home&Garden/221_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (172, 5, N'HW-172', N'Brush Dust', 10, 12.11, N'Soft Microfiber Cleaning Duster Brush Dust Cleaner can not lose hair Static Anti Dusting Brush Household Cleaning Tools', N'Home&Garden/222_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (173, 5, N'HW-173', N'Feather Duster', 10, 29.78, N'Duster Dust Cleaner Adjustable Stretch Extend Microfiber Feather Duster Furniture Dust Brush Household Cleaning Tools', N'Home&Garden/223_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (174, 5, N'HW-174', N'Disposable Gloves', 10, 28.32, N'100pcs Plastic Disposable Gloves Restaurant Home Service Catering Hygiene Home Dining Kitchen Accessories', N'Home&Garden/224_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (175, 5, N'HW-175', N'Compressed Towel', 10, 13.77, N'10Pcs Non Disposable Compressed Towel Non-woven Eco Towel for Outdoor Travel Bath Towel Shower Cleaning Towel', N'Home&Garden/225_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'15        ', 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (176, 5, N'HW-176', N'Bent Straws', 10, 32.35, N'3/5pcs Stainless Steel Straight Bent Straws+Cleaning Brush Drinking Tool With Cleaning Brush Dinking Straws Bar Accessories', N'Home&Garden/226_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (177, 5, N'HW-177', N'Buffing Cloth', 10, 18.69, N'10pcs/set T-type Round Polishing Buffing Cloth Electric Grinder Cleaning Wheel Brush Rotary Tool for Power', N'Home&Garden/227_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (178, 5, N'HW-178', N'Brush Toilet', 10, 20.72, N'Household Long Handle Cleaning Brush Toilet Decontamination Brush Set Toilet Brush Wall-Mounted Floor-Standing Cleaning Tools', N'Home&Garden/228_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (179, 5, N'HW-179', N'Plastic Gloves', 10, 16.63, N'100pcs Eco-friendly Disposable Plastic Gloves for Restaurant Hotel Handling Raw Chicken Plastic Multifuctional Gloves Food', N'Home&Garden/229_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (180, 5, N'HW-180', N'Straws Heart', 10, 14.34, N'1/2/3/5Pcs Reusable Drinking Straw Heart Shaped Stainless Steel Metal Straws Reusable Straw w/Cleaning Brush Bar Accessories', N'Home&Garden/230_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'15        ', 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (181, 5, N'HW-181', N'Stainless Steel Straws', 10, 29.58, N'1/5Pcs Reusable Drinking Straws Bar Drinking Stainless Steel Straws With Cleaning Brush Party Eco-friendly Drinking Accessories', N'Home&Garden/231_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (182, 5, N'HW-182', N'Floor Mop', 10, 21.44, N'Replacement 360 Rotating Head Easy Microfiber Spinning Floor Mop Head for Housekeeper Home Floor Cleaning Mop', N'Home&Garden/232_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'15        ', 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (183, 5, N'HW-183', N'Toilet Brush', 10, 12.01, N'Long Handle Toilet Brush Holder Set Bathroom Lavatory Cleaning Tool Floor-Standing WC Toilet Cleaning Brush Bathroom Accessories', N'Home&Garden/233_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (184, 5, N'HW-184', N'Solder Iron', 10, 9.26, N'High Temperature Resistant Solder Iron Tip Cleaning Sponge PCB Repair Pads Tin Wire Melt Rosin Core Solder Soldering Wire Roll', N'Home&Garden/234_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (185, 5, N'HW-185', N'Floor Mop Pad', 10, 16.2, N'Double Sided Flat Mops Floor Mop Pad with Replacement Cleaning Cloth Head for Household Cleaning Tools Accessories', N'Home&Garden/235_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (186, 5, N'HW-186', N'Gun Spray', 10, 17.86, N'Pneumatic Air Blow Gun Spray Pistol Compressor Dust Blower Cleaner Compressor Dust Blower 8inch Nozzle Cleaning Tool', N'Home&Garden/236_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'15        ', 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (187, 5, N'HW-187', N'Straw Stainless', 10, 26.45, N'5pcs/Set Reusable Drinking Straw Stainless Steel Straight Bent Straws+Cleaning Brush Set Bar Coffee Milk Drinking Accessories', N'Home&Garden/237_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (188, 5, N'HW-188', N'Floor Cleaning', 10, 25.04, N'Floor Cleaning Tool Spray Mop 350ML Microfiber Cloth Hand Wash Plate Mop Home Windows Kitchen Mop Sweeper Broom Floor Clean Mops', N'Home&Garden/238_0.jpg', CAST(N'2019-11-11' AS Date), 1, N'15        ', 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (189, 5, N'HW-189', N'Sticky Brush', 10, 19.57, N'Reusable Lint Rollers Double Side Clothes Sticky Brush Dust Remover Pet Hair Cleaner Home Clothes Cleaning Tools Random Color', N'Home&Garden/239_0.jpg', CAST(N'2019-11-11' AS Date), 2, N'15        ', 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (190, 5, N'HW-190', N'Groove Cleaning', 10, 28.07, N'Window Groove Cleaning Brush Cleaning Tool Sweeping the Small Brush Mini Sill Crevice Sweeping Brush Household Cleaning Tools', N'Home&Garden/240_0.jpg', CAST(N'2019-11-11' AS Date), 3, N'15        ', 0)
SET IDENTITY_INSERT [dbo].[product] OFF
INSERT [dbo].[role_Account] ([code], [role]) VALUES (1, N'Admin')
INSERT [dbo].[role_Account] ([code], [role]) VALUES (2, N'Employee')
INSERT [dbo].[role_Account] ([code], [role]) VALUES (3, N'Vip')
INSERT [dbo].[role_Account] ([code], [role]) VALUES (4, N'Normal')
INSERT [dbo].[Room] ([id], [name]) VALUES (1, N'Room 1')
INSERT [dbo].[Room] ([id], [name]) VALUES (2, N'Room 2')
INSERT [dbo].[Room] ([id], [name]) VALUES (3, N'Room 3')
INSERT [dbo].[Room] ([id], [name]) VALUES (4, N'Room 4')
INSERT [dbo].[Schedule] ([id], [room_id], [from], [to]) VALUES (1, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date))
INSERT [dbo].[Schedule] ([id], [room_id], [from], [to]) VALUES (2, 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-07' AS Date))
INSERT [dbo].[Schedule] ([id], [room_id], [from], [to]) VALUES (3, 4, CAST(N'2020-01-03' AS Date), CAST(N'2020-01-07' AS Date))
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (11, N'Lê Nhật Minh', N'0866823499', N'Vĩnh Lộc')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (12, N'Gun Airbrush', N'0866823499', N'Thạch Thất')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (13, N'Gun Airbrush', N'0866823499', N'Aaaa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (14, N'Nguyễn Thùy Linh', N'0866823499', N'Vĩnh Thịnh, Vĩnh Lộc, Thanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (15, N'Gun Airbrush', N'0866823499', N'aaaaaaaaaaa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (16, N'Quan dz', N'0866823499', N'Vĩnh Hùng, Vĩnh Lộc, Thanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (17, N'Campo Duong', N'00112233445', N'Vĩnh Thịnh, Thanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (18, N'Hoàng Minh Nghĩa', N'0385739160', N'Xóm Trung Thanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (19, N'Hoàng Minh Nghĩa', N'0866823499', N'Xóm Binh- Vĩnh Hung- Vĩnh Lộc- Thanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (20, N'Nguyễn Văn Sang', N'0866823499', N'Hải Phòng')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (21, N'Nguyễn Văn Sang', N'0866823499', N'Hải Phòng')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (22, N'Hoàng Minh Nghĩa', N'0866823499', N'Thanh HÓa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (23, N'Hoàng Minh Nghĩa', N'0866823499', N'Thanh HÓa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (24, N'Nguyễn Văn Sang', N'0866823499', N'Hải Phòng')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (25, N'Sang', N'0866823499', N'HẢi Phòng')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (26, N'Le Nhat  Minh', N'0866823499', N'THanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (27, N'Nguyễn Thùy Linh', N'0866823499', N'')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (28, N'Minh Tàng', N'0866823499', N'Thanh HÓA')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (29, N'QUan dz', N'0866823499', N'Thạch Thất')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (30, N'Quan', N'0866823499', N'HÀ Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (31, N'Gun Airbrush', N'0866823499', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (32, N'Hồng Quân', N'0866823499', N'Vĩnh Lộc')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (33, N'Gun Airbrush', N'0866823499', N'Thanh HÓA')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (34, N'A', N'0866823499', N'Thanh hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (35, N'D', N'0866823499', N'Hải Dương')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
INSERT [dbo].[status_Account] ([code], [status]) VALUES (1, N'Active')
INSERT [dbo].[status_Account] ([code], [status]) VALUES (2, N'Pending')
INSERT [dbo].[status_Account] ([code], [status]) VALUES (3, N'Baned')
SET IDENTITY_INSERT [dbo].[status_category] ON 

INSERT [dbo].[status_category] ([id], [code], [status]) VALUES (1, 1, N'Selling')
INSERT [dbo].[status_category] ([id], [code], [status]) VALUES (2, 2, N'Salling')
INSERT [dbo].[status_category] ([id], [code], [status]) VALUES (3, 3, N'FreeShip')
INSERT [dbo].[status_category] ([id], [code], [status]) VALUES (4, 4, N'Out of Stocks')
INSERT [dbo].[status_category] ([id], [code], [status]) VALUES (5, 5, N'
Stop business')
SET IDENTITY_INSERT [dbo].[status_category] OFF
INSERT [dbo].[status_Order] ([code], [status]) VALUES (1, N'Waiting')
INSERT [dbo].[status_Order] ([code], [status]) VALUES (2, N'Accepted')
INSERT [dbo].[status_Order] ([code], [status]) VALUES (3, N'Shipping')
INSERT [dbo].[status_Order] ([code], [status]) VALUES (4, N'Success')
SET IDENTITY_INSERT [dbo].[status_product] ON 

INSERT [dbo].[status_product] ([id], [code], [status]) VALUES (1, 1, N'Selling')
INSERT [dbo].[status_product] ([id], [code], [status]) VALUES (2, 2, N'Salling')
INSERT [dbo].[status_product] ([id], [code], [status]) VALUES (3, 3, N'Free Ship')
INSERT [dbo].[status_product] ([id], [code], [status]) VALUES (4, 4, N'
Out of stock')
INSERT [dbo].[status_product] ([id], [code], [status]) VALUES (5, 5, N'
Stop business')
SET IDENTITY_INSERT [dbo].[status_product] OFF
SET IDENTITY_INSERT [dbo].[status_sub_category] ON 

INSERT [dbo].[status_sub_category] ([id], [code], [status]) VALUES (1, 1, N'Selling')
INSERT [dbo].[status_sub_category] ([id], [code], [status]) VALUES (2, 2, N'Salling')
INSERT [dbo].[status_sub_category] ([id], [code], [status]) VALUES (3, 3, N'Free Ship')
INSERT [dbo].[status_sub_category] ([id], [code], [status]) VALUES (4, 4, N'Out of Stocks')
INSERT [dbo].[status_sub_category] ([id], [code], [status]) VALUES (5, 5, N'
Stop business')
SET IDENTITY_INSERT [dbo].[status_sub_category] OFF
SET IDENTITY_INSERT [dbo].[sub_category] ON 

INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (1, 1, N'Hand Tools', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (2, 1, N'Tool Parts', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (3, 1, N'Power Tools', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (4, 2, N'Temperature Instruments', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (5, 2, N'Measurement & Analysis Instruments', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (6, 2, N'Gauging Tool', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (7, 3, N' Bathroom Fixtures', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (8, 3, N'Kitchen Fixtures ', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (9, 3, N'Door& Window Part ', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (10, 3, N'Bag,Box,Bottle', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (11, 4, N'Stage Lighting ', 4)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (12, 4, N'Lighting Bulbs & Tubes', 4)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (13, 4, N' Indoor Light', 4)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (14, 5, N'Kitchen, Dining & Bar', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (15, 5, N'Household Cleaning Tools & Accessories', 1)
INSERT [dbo].[sub_category] ([id], [catetory_id], [sub_category_name], [status]) VALUES (16, 5, N'Garden Supplies', 1)
SET IDENTITY_INSERT [dbo].[sub_category] OFF
INSERT [dbo].[view] ([view]) VALUES (193)
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([id])
GO
USE [master]
GO
ALTER DATABASE [HouseWareShop] SET  READ_WRITE 
GO
