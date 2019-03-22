USE [ECOMM_C2C_SUB]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CusId] [int] NULL,
	[IpAddress] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UsersCustomersCarts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartDet]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDet](
	[CartId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_UsersCustomersCartsDetails] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cus]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cus](
	[CusId] [int] NOT NULL,
 CONSTRAINT [PK_UsersCustomers] PRIMARY KEY CLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mer]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mer](
	[MerId] [int] NOT NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mstr]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mstr](
	[MstrId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Mstr] PRIMARY KEY CLUSTERED 
(
	[MstrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MstrRole]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstrRole](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](255) NULL,
 CONSTRAINT [PK_MstrRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pro]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pro](
	[ShpId] [int] NOT NULL,
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProQuantity] [int] NOT NULL,
	[IsOutOfStock] [bit] NOT NULL,
	[ProName] [nvarchar](255) NOT NULL,
	[Img] [varchar](255) NULL,
	[Desc] [text] NULL,
	[Price] [varchar](255) NOT NULL,
	[PriceAfter] [varchar](255) NULL,
	[Active] [bit] NULL,
	[DateAdd] [datetime] NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_ProductQuantity] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProBrand]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProBrand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProCat]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCat](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
	[DateAdd] [datetime] NOT NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_ProductsCategories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProColor]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProColor](
	[ColorId] [int] NOT NULL,
	[ColorName] [nvarchar](255) NULL,
	[ColorImg] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProColor] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProDet]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProDet](
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
 CONSTRAINT [PK_ProDet] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProSize]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProSize](
	[SizeId] [int] NOT NULL,
	[SizeName] [nvarchar](255) NULL,
	[SizeImg] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProSize] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rcpt]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rcpt](
	[RcptId] [int] IDENTITY(1,1) NOT NULL,
	[UsrAdd] [int] NOT NULL,
	[UsrEdit] [int] NULL,
	[DateAdd] [datetime] NOT NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [Pk_HoaDon_Id] PRIMARY KEY CLUSTERED 
(
	[RcptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuy]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuy](
	[RcptBuyId] [int] NOT NULL,
	[CusId] [int] NOT NULL,
 CONSTRAINT [PK_ReceiptBuys] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyDet]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyDet](
	[RcptBuyId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
 CONSTRAINT [PK_ReceiptsBuysDetails] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuySta]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuySta](
	[StaId] [int] IDENTITY(1,1) NOT NULL,
	[RcptBuyId] [int] NOT NULL,
 CONSTRAINT [PK_ReceiptsBuysStates] PRIMARY KEY CLUSTERED 
(
	[StaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyStaDet]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyStaDet](
	[StaId] [int] NOT NULL,
	[StepId] [int] NOT NULL,
	[IsDone] [bit] NOT NULL,
 CONSTRAINT [PK_ReceiptsBuysStatesDetails] PRIMARY KEY CLUSTERED 
(
	[StaId] ASC,
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyStaStep]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyStaStep](
	[StepId] [int] NOT NULL,
	[StepCont] [nvarchar](255) NULL,
	[StepOrder] [int] NULL,
 CONSTRAINT [PK_ReceiptsBuysStatesSteps] PRIMARY KEY CLUSTERED 
(
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptSub]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptSub](
	[RcptSubId] [int] NOT NULL,
 CONSTRAINT [PK_ReceiptsSubscriptions] PRIMARY KEY CLUSTERED 
(
	[RcptSubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptSubDet]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptSubDet](
	[RcptSubId] [int] NOT NULL,
	[SubId] [int] NOT NULL,
	[MerId] [int] NOT NULL,
 CONSTRAINT [PK_ReceiptsSubscriptionsDetails] PRIMARY KEY CLUSTERED 
(
	[RcptSubId] ASC,
	[SubId] ASC,
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shp]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shp](
	[ShpId] [int] IDENTITY(1,1) NOT NULL,
	[MerId] [int] NOT NULL,
	[ShpName] [nvarchar](255) NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_UsersMerchantsShops] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sub]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub](
	[SubId] [int] IDENTITY(1,1) NOT NULL,
	[SubContent] [nvarchar](255) NULL,
	[DurDay] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubDet]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDet](
	[SubId] [int] NOT NULL,
	[MerId] [int] NOT NULL,
	[DateStart] [datetime] NULL,
	[DateEnd] [datetime] NULL,
 CONSTRAINT [PK_SubscriptionsDetails] PRIMARY KEY CLUSTERED 
(
	[SubId] ASC,
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usr]    Script Date: 3/22/2019 1:17:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usr](
	[UsrId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Login] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
	[Email] [varchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[DateAdd] [datetime] NOT NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [CusId], [IpAddress]) VALUES (1, 2, N'192.168.1.1')
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[CartDet] ([CartId], [ShpId], [ProId], [Qty]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Cus] ([CusId]) VALUES (2)
INSERT [dbo].[Mer] ([MerId]) VALUES (3)
INSERT [dbo].[Mstr] ([MstrId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[Mstr] ([MstrId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[Mstr] ([MstrId], [RoleId]) VALUES (5, 3)
INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (2, N'Thủ quỹ')
INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (3, N'Bảo mật viên')
SET IDENTITY_INSERT [dbo].[Pro] ON 

INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProQuantity], [IsOutOfStock], [ProName], [Img], [Desc], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (1, 1, 1, 1, 2, 1, N'UltraBoost 19', NULL, NULL, N'4000000', N'0', NULL, NULL, NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProQuantity], [IsOutOfStock], [ProName], [Img], [Desc], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (1, 7, 2, 2, 1, 1, N'Nike ACG Wildwood', NULL, NULL, N'3500000', N'0', NULL, NULL, NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProQuantity], [IsOutOfStock], [ProName], [Img], [Desc], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (1, 8, 3, 3, 1, 1, N'WOMEN''S WARD LOW TOP SNEAKER', NULL, NULL, N'2000000', N'0', NULL, CAST(0x0000AA1800D53488 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Pro] OFF
SET IDENTITY_INSERT [dbo].[ProBrand] ON 

INSERT [dbo].[ProBrand] ([BrandId], [BrandName]) VALUES (1, N'Adidas')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName]) VALUES (2, N'Nike')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName]) VALUES (3, N'Vans')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName]) VALUES (4, N'Reebok')
SET IDENTITY_INSERT [dbo].[ProBrand] OFF
SET IDENTITY_INSERT [dbo].[ProCat] ON 

INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (1, N'Male Sneakers', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (2, N'Female Sneakers', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (3, N'Casual', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (4, N'Sport', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (5, N'Trending', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ProCat] OFF
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg]) VALUES (1, N'Đen', NULL)
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg]) VALUES (2, N'Trắng', NULL)
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg]) VALUES (3, N'Đỏ', NULL)
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg]) VALUES (4, N'Xanh', NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId]) VALUES (1, 1, 1, 2)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (1, N'38', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (2, N'39', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (3, N'40', NULL)
SET IDENTITY_INSERT [dbo].[Rcpt] ON 

INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit]) VALUES (1, 1, NULL, CAST(0x0000AA16011D7042 AS DateTime), CAST(0x0000AA16011D7042 AS DateTime))
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit]) VALUES (2, 1, NULL, CAST(0x0000AA16011D7042 AS DateTime), CAST(0x0000AA16011D7042 AS DateTime))
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit]) VALUES (3, 1, NULL, CAST(0x0000AA160189D8EB AS DateTime), CAST(0x0000AA16011D7042 AS DateTime))
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit]) VALUES (4, 1, NULL, CAST(0x0000AA160189EF4B AS DateTime), CAST(0x0000AA16011D7042 AS DateTime))
SET IDENTITY_INSERT [dbo].[Rcpt] OFF
INSERT [dbo].[RcptBuy] ([RcptBuyId], [CusId]) VALUES (2, 2)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId]) VALUES (2, 1, 7)
SET IDENTITY_INSERT [dbo].[RcptBuySta] ON 

INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[RcptBuySta] OFF
INSERT [dbo].[RcptBuyStaDet] ([StaId], [StepId], [IsDone]) VALUES (1, 1, 1)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [StepId], [IsDone]) VALUES (1, 2, 1)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [StepId], [IsDone]) VALUES (1, 3, 1)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [StepId], [IsDone]) VALUES (1, 4, 1)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [StepId], [IsDone]) VALUES (1, 5, 1)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [StepId], [IsDone]) VALUES (1, 6, 1)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [StepId], [IsDone]) VALUES (1, 7, 1)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (1, N'Đang  xác nhận', 1)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (2, N'Đã xác nhận', 2)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (3, N'Chờ đi nhận', 3)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (4, N'Đang đi nhận', 4)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (5, N'Đã nhận hàng', 5)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (6, N'Đang chuyển', 6)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (7, N'Thành công', 7)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (8, N'Thất bại', 8)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (9, N'Khách hủy', 9)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (10, N'Hệ thống hủy', 10)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (11, N'Hết hàng', 11)
INSERT [dbo].[RcptSub] ([RcptSubId]) VALUES (1)
INSERT [dbo].[RcptSubDet] ([RcptSubId], [SubId], [MerId]) VALUES (1, 1, 3)
SET IDENTITY_INSERT [dbo].[Shp] ON 

INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active]) VALUES (1, 3, N'KICKZ', CAST(0x0000AA16010C05B1 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Shp] OFF
SET IDENTITY_INSERT [dbo].[Sub] ON 

INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (1, N'Tuần', 7, N'300000')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (2, N'Tháng', 30, N'1000000')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (3, N'Năm', 365, N'11000000')
SET IDENTITY_INSERT [dbo].[Sub] OFF
INSERT [dbo].[SubDet] ([SubId], [MerId], [DateStart], [DateEnd]) VALUES (1, 3, CAST(0x0000AA16011D7042 AS DateTime), CAST(0x0000AA1D011D7042 AS DateTime))
SET IDENTITY_INSERT [dbo].[Usr] ON 

INSERT [dbo].[Usr] ([UsrId], [UserName], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (1, N'Nguyễn Doãn Hiện', N'doanhien', N'admin', 1, N'doanhien@gmail.com', N'273 An Dương Vương P7 Q6', N'0704569020', CAST(0x0000AA16010C05B1 AS DateTime), CAST(0x0000AA16010C05B1 AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UserName], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (2, N'Phan Anh Trúc', N'anhtruc', N'123', 1, N'anhtruc@gmail.com', N'21 Lưu Xuân Tín P15 Q5', N'0967513425', CAST(0x0000AA16010C05B1 AS DateTime), CAST(0x0000AA16010C05B1 AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UserName], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (3, N'Lê Hiển', N'toanhien', N'123', 1, N'toanhien@gmail.com', N'26 Nguyễn Trãi P1 Q5', N'0967513424', CAST(0x0000AA16010C05B1 AS DateTime), CAST(0x0000AA16010C05B1 AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UserName], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (4, N'Mèo bi sọc', N'meobisoc', N'admin', 1, NULL, N'Dưới tủ', NULL, CAST(0x0000AA1800D256EC AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UserName], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (5, N'Cá Bảy Màu Xào', N'cabaymau', N'admin', 1, NULL, N'Hồ cá', NULL, CAST(0x0000AA1800D2E306 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Usr] OFF
/****** Object:  Index [IX_UsersCustomersCarts]    Script Date: 3/22/2019 1:17:02 PM ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [IX_UsersCustomersCarts] UNIQUE NONCLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReceiptsBuysStates]    Script Date: 3/22/2019 1:17:02 PM ******/
ALTER TABLE [dbo].[RcptBuySta] ADD  CONSTRAINT [IX_ReceiptsBuysStates] UNIQUE NONCLUSTERED 
(
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RcptStaStep]    Script Date: 3/22/2019 1:17:02 PM ******/
ALTER TABLE [dbo].[RcptBuyStaStep] ADD  CONSTRAINT [IX_RcptStaStep] UNIQUE NONCLUSTERED 
(
	[StepOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersMerchantsShops]    Script Date: 3/22/2019 1:17:02 PM ******/
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [IX_UsersMerchantsShops] UNIQUE NONCLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usr_Login]    Script Date: 3/22/2019 1:17:02 PM ******/
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [IX_Usr_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartDet] ADD  CONSTRAINT [DF_CartDet_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_CatId]  DEFAULT ((1)) FOR [CatId]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_ProQuantity]  DEFAULT ((1)) FOR [ProQuantity]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_IsOutOfStock]  DEFAULT ((1)) FOR [IsOutOfStock]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_PriceAfter]  DEFAULT ((0)) FOR [PriceAfter]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[ProCat] ADD  CONSTRAINT [DF_ProCat_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ProCat] ADD  CONSTRAINT [DF_ProCat_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[Rcpt] ADD  CONSTRAINT [DF_Rcpt_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[RcptBuyStaDet] ADD  CONSTRAINT [DF_RcptBuyStaDet_IsDone]  DEFAULT ((0)) FOR [IsDone]
GO
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [DF_Shp_DateStart]  DEFAULT (getdate()) FOR [DateStart]
GO
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [DF_Shp_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Sub] ADD  CONSTRAINT [DF_Sub_DurDay]  DEFAULT ((1)) FOR [DurDay]
GO
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [DF_Usr_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [DF_Usr_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers] FOREIGN KEY([CusId])
REFERENCES [dbo].[Cus] ([CusId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers]
GO
ALTER TABLE [dbo].[CartDet]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDet] CHECK CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts]
GO
ALTER TABLE [dbo].[CartDet]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCartsDetails_UsersMerchantsShopsProducts] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[CartDet] CHECK CONSTRAINT [FK_UsersCustomersCartsDetails_UsersMerchantsShopsProducts]
GO
ALTER TABLE [dbo].[Cus]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomers_Users] FOREIGN KEY([CusId])
REFERENCES [dbo].[Usr] ([UsrId])
GO
ALTER TABLE [dbo].[Cus] CHECK CONSTRAINT [FK_UsersCustomers_Users]
GO
ALTER TABLE [dbo].[Mer]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchants_Users] FOREIGN KEY([MerId])
REFERENCES [dbo].[Usr] ([UsrId])
GO
ALTER TABLE [dbo].[Mer] CHECK CONSTRAINT [FK_UsersMerchants_Users]
GO
ALTER TABLE [dbo].[Mstr]  WITH CHECK ADD  CONSTRAINT [FK_Mstr_MstrRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[MstrRole] ([RoleId])
GO
ALTER TABLE [dbo].[Mstr] CHECK CONSTRAINT [FK_Mstr_MstrRole]
GO
ALTER TABLE [dbo].[Mstr]  WITH CHECK ADD  CONSTRAINT [FK_Mstr_Usr] FOREIGN KEY([MstrId])
REFERENCES [dbo].[Usr] ([UsrId])
GO
ALTER TABLE [dbo].[Mstr] CHECK CONSTRAINT [FK_Mstr_Usr]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_Pro_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[ProBrand] ([BrandId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_Pro_Brand]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_Pro_ProCat] FOREIGN KEY([CatId])
REFERENCES [dbo].[ProCat] ([CatId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_Pro_ProCat]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchantsShopsProducts_UsersMerchantsShops] FOREIGN KEY([ShpId])
REFERENCES [dbo].[Shp] ([ShpId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_UsersMerchantsShopsProducts_UsersMerchantsShops]
GO
ALTER TABLE [dbo].[ProDet]  WITH CHECK ADD  CONSTRAINT [FK_ProDet_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[ProDet] CHECK CONSTRAINT [FK_ProDet_Pro]
GO
ALTER TABLE [dbo].[ProDet]  WITH CHECK ADD  CONSTRAINT [FK_ProDet_ProColor] FOREIGN KEY([ColorId])
REFERENCES [dbo].[ProColor] ([ColorId])
GO
ALTER TABLE [dbo].[ProDet] CHECK CONSTRAINT [FK_ProDet_ProColor]
GO
ALTER TABLE [dbo].[ProDet]  WITH CHECK ADD  CONSTRAINT [FK_ProDet_ProSize] FOREIGN KEY([SizeId])
REFERENCES [dbo].[ProSize] ([SizeId])
GO
ALTER TABLE [dbo].[ProDet] CHECK CONSTRAINT [FK_ProDet_ProSize]
GO
ALTER TABLE [dbo].[Rcpt]  WITH CHECK ADD  CONSTRAINT [FK_Rcpt_Usr] FOREIGN KEY([UsrAdd])
REFERENCES [dbo].[Usr] ([UsrId])
GO
ALTER TABLE [dbo].[Rcpt] CHECK CONSTRAINT [FK_Rcpt_Usr]
GO
ALTER TABLE [dbo].[Rcpt]  WITH CHECK ADD  CONSTRAINT [FK_Rcpt_Usr1] FOREIGN KEY([UsrEdit])
REFERENCES [dbo].[Usr] ([UsrId])
GO
ALTER TABLE [dbo].[Rcpt] CHECK CONSTRAINT [FK_Rcpt_Usr1]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuy_Cus] FOREIGN KEY([CusId])
REFERENCES [dbo].[Cus] ([CusId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_RcptBuy_Cus]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptBuys_Receipts] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[Rcpt] ([RcptId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_ReceiptBuys_Receipts]
GO
ALTER TABLE [dbo].[RcptBuyDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysDetails_ReceiptsBuys] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[RcptBuy] ([RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuyDet] CHECK CONSTRAINT [FK_ReceiptsBuysDetails_ReceiptsBuys]
GO
ALTER TABLE [dbo].[RcptBuyDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysDetails_UsersMerchantsShopsProducts] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[RcptBuyDet] CHECK CONSTRAINT [FK_ReceiptsBuysDetails_UsersMerchantsShopsProducts]
GO
ALTER TABLE [dbo].[RcptBuySta]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysStates_ReceiptsBuys] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[RcptBuy] ([RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuySta] CHECK CONSTRAINT [FK_ReceiptsBuysStates_ReceiptsBuys]
GO
ALTER TABLE [dbo].[RcptBuyStaDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStates] FOREIGN KEY([StaId])
REFERENCES [dbo].[RcptBuySta] ([StaId])
GO
ALTER TABLE [dbo].[RcptBuyStaDet] CHECK CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStates]
GO
ALTER TABLE [dbo].[RcptBuyStaDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStatesSteps] FOREIGN KEY([StepId])
REFERENCES [dbo].[RcptBuyStaStep] ([StepId])
GO
ALTER TABLE [dbo].[RcptBuyStaDet] CHECK CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStatesSteps]
GO
ALTER TABLE [dbo].[RcptSub]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsSubscriptions_Receipts] FOREIGN KEY([RcptSubId])
REFERENCES [dbo].[Rcpt] ([RcptId])
GO
ALTER TABLE [dbo].[RcptSub] CHECK CONSTRAINT [FK_ReceiptsSubscriptions_Receipts]
GO
ALTER TABLE [dbo].[RcptSubDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsSubscriptionsDetails_ReceiptsSubscriptions] FOREIGN KEY([RcptSubId])
REFERENCES [dbo].[RcptSub] ([RcptSubId])
GO
ALTER TABLE [dbo].[RcptSubDet] CHECK CONSTRAINT [FK_ReceiptsSubscriptionsDetails_ReceiptsSubscriptions]
GO
ALTER TABLE [dbo].[RcptSubDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsSubscriptionsDetails_SubscriptionsDetails] FOREIGN KEY([SubId], [MerId])
REFERENCES [dbo].[SubDet] ([SubId], [MerId])
GO
ALTER TABLE [dbo].[RcptSubDet] CHECK CONSTRAINT [FK_ReceiptsSubscriptionsDetails_SubscriptionsDetails]
GO
ALTER TABLE [dbo].[Shp]  WITH CHECK ADD  CONSTRAINT [FK_Shp_Mer] FOREIGN KEY([MerId])
REFERENCES [dbo].[Mer] ([MerId])
GO
ALTER TABLE [dbo].[Shp] CHECK CONSTRAINT [FK_Shp_Mer]
GO
ALTER TABLE [dbo].[SubDet]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionsDetails_Subscriptions] FOREIGN KEY([SubId])
REFERENCES [dbo].[Sub] ([SubId])
GO
ALTER TABLE [dbo].[SubDet] CHECK CONSTRAINT [FK_SubscriptionsDetails_Subscriptions]
GO
ALTER TABLE [dbo].[SubDet]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionsDetails_UsersMerchants] FOREIGN KEY([MerId])
REFERENCES [dbo].[Mer] ([MerId])
GO
ALTER TABLE [dbo].[SubDet] CHECK CONSTRAINT [FK_SubscriptionsDetails_UsersMerchants]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [CK_Usr] CHECK  (([Email] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [CK_Usr]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [CK_Usr_1] CHECK  ((NOT [Phone] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [CK_Usr_1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rcpt', @level2type=N'COLUMN',@level2name=N'RcptId'
GO
