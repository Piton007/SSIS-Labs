USE [BDLowes_STAGE]
GO
/****** Object:  Table [dbo].[STG_Fechas]    Script Date: 17/06/2020 23:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_Fechas](
	[Sk_Fecha] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Anio] [smallint] NULL,
	[Dia] [smallint] NULL,
	[Mes] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sk_Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ITEMS]    Script Date: 17/06/2020 23:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ITEMS](
	[Sk_Item] [int] IDENTITY(1,1) NOT NULL,
	[Sk_Voucher] [nvarchar](50) NULL,
	[Sk_Fecha] [int] NULL,
	[Sk_Vendors] [nvarchar](20) NULL,
	[Sk_User] [nvarchar](50) NULL,
	[Unidades] [float] NULL,
	[Monto] [float] NULL,
	[Sk_Product] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sk_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_Products]    Script Date: 17/06/2020 23:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_Products](
	[Cost] [float] NULL,
	[Location] [nvarchar](50) NULL,
	[Sk_Product] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Discount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sk_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_Users]    Script Date: 17/06/2020 23:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_Users](
	[Sk_User] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[FullName] [nvarchar](101) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sk_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_VENDORS]    Script Date: 17/06/2020 23:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_VENDORS](
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Sk_Vendors] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sk_Vendors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[STG_ITEMS]  WITH CHECK ADD FOREIGN KEY([Sk_Fecha])
REFERENCES [dbo].[STG_Fechas] ([Sk_Fecha])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[STG_ITEMS]  WITH CHECK ADD FOREIGN KEY([Sk_Product])
REFERENCES [dbo].[STG_Products] ([Sk_Product])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[STG_ITEMS]  WITH CHECK ADD FOREIGN KEY([Sk_User])
REFERENCES [dbo].[STG_Users] ([Sk_User])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[STG_ITEMS]  WITH CHECK ADD FOREIGN KEY([Sk_Vendors])
REFERENCES [dbo].[STG_VENDORS] ([Sk_Vendors])
ON DELETE CASCADE
GO
