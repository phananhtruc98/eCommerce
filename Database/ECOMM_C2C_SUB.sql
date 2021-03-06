USE [ECOMM_C2C_SUB]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CusId] [int] NULL,
	[IpAddress] [varchar](255) NULL,
 CONSTRAINT [PK_UsersCustomersCarts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDet]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDet](
	[CartId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_CartDet] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cus]    Script Date: 12/3/2019 11:17:13 PM ******/
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
/****** Object:  Table [dbo].[Mer]    Script Date: 12/3/2019 11:17:13 PM ******/
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
/****** Object:  Table [dbo].[Mstr]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mstr](
	[MstrId] [int] NOT NULL,
 CONSTRAINT [PK_Mstr] PRIMARY KEY CLUSTERED 
(
	[MstrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstrDet]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstrDet](
	[MstrId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[AddDate] [datetime] NULL,
	[AddBy] [int] NULL,
 CONSTRAINT [PK_MstrDet] PRIMARY KEY CLUSTERED 
(
	[MstrId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstrRole]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstrRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
 CONSTRAINT [PK_MstrRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pro]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pro](
	[ShpId] [int] NOT NULL,
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProName] [nvarchar](255) NOT NULL,
	[Img] [varchar](255) NULL,
	[Desc] [nvarchar](max) NULL,
	[DescShort] [nvarchar](max) NULL,
	[Price] [varchar](255) NOT NULL,
	[PriceAfter] [varchar](255) NULL,
	[Active] [bit] NULL,
	[IsOutOfStock] [bit] NULL,
	[DateAdd] [datetime] NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_ProductQuantity] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProBrand]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProBrand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NULL,
	[Img] [varchar](255) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProCat]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCat](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime] NULL,
	[Img] [varchar](255) NULL,
 CONSTRAINT [PK_ProductsCategories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProColor]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProColor](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](255) NULL,
	[ColorImg] [nvarchar](255) NULL,
	[HexCode] [char](6) NULL,
 CONSTRAINT [PK_ProColor] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProDet]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProDet](
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Qty] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_ProDet] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProSize]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProSize](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](255) NULL,
	[SizeImg] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProSize] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProSlide]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProSlide](
	[SlideId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[Img] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProSlide] PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProSlideImg]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProSlideImg](
	[SlideId] [int] IDENTITY(1,1) NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[Img] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProSlideImg] PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rcpt]    Script Date: 12/3/2019 11:17:13 PM ******/
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
	[IsCompleted] [bit] NULL,
 CONSTRAINT [Pk_HoaDon_Id] PRIMARY KEY CLUSTERED 
(
	[RcptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RcptBuy]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuy](
	[RcptBuyId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[CusId] [int] NOT NULL,
	[CusMessage] [nvarchar](255) NULL,
	[MerMessage] [nvarchar](255) NULL,
	[CusPoint] [int] NULL,
	[MerPoint] [int] NULL,
 CONSTRAINT [PK_RcptBuy_1] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RcptBuyDet]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyDet](
	[RcptBuyId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Cmt] [nvarchar](255) NULL,
	[Point] [int] NULL,
	[MerCmt] [nvarchar](255) NULL,
	[MerPoint] [int] NULL,
	[Quantity] [int] NULL,
	[PriceWhenBuy] [varchar](255) NULL,
 CONSTRAINT [PK_ReceiptsBuysDetails] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC,
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RcptBuySta]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuySta](
	[StaId] [int] IDENTITY(1,1) NOT NULL,
	[RcptBuyId] [int] NOT NULL,
 CONSTRAINT [PK_RcptBuySta] PRIMARY KEY CLUSTERED 
(
	[StaId] ASC,
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RcptBuyStaDet]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyStaDet](
	[StaId] [int] NOT NULL,
	[RcptBuyId] [int] NOT NULL,
	[StepId] [int] NOT NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_RcptBuyStaDet] PRIMARY KEY CLUSTERED 
(
	[StaId] ASC,
	[RcptBuyId] ASC,
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RcptBuyStaStep]    Script Date: 12/3/2019 11:17:13 PM ******/
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
/****** Object:  Table [dbo].[RcptSub]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptSub](
	[RcptSubId] [int] NOT NULL,
	[MerId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ReceiptsSubscriptions] PRIMARY KEY CLUSTERED 
(
	[RcptSubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RcptSubDet]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptSubDet](
	[RcptSubId] [int] NOT NULL,
	[SubId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_RcptSubDet] PRIMARY KEY CLUSTERED 
(
	[RcptSubId] ASC,
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shp]    Script Date: 12/3/2019 11:17:13 PM ******/
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
	[Desc] [nvarchar](max) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
 CONSTRAINT [PK_UsersMerchantsShops] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sub]    Script Date: 12/3/2019 11:17:13 PM ******/
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
/****** Object:  Table [dbo].[Usr]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usr](
	[UsrId] [int] IDENTITY(1,1) NOT NULL,
	[UsrName] [nvarchar](255) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Login] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[PasswordForget] [varchar](255) NULL,
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
/****** Object:  Table [dbo].[UsrAct]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsrAct](
	[ActId] [int] IDENTITY(1,1) NOT NULL,
	[UsrId] [int] NULL,
	[ActCode] [varchar](255) NULL,
	[IsAct] [bit] NULL,
 CONSTRAINT [PK_UsrAct] PRIMARY KEY CLUSTERED 
(
	[ActId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebInfo]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebInfo](
	[WebId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[WorkTime] [nvarchar](255) NULL,
 CONSTRAINT [PK_WebInfo] PRIMARY KEY CLUSTERED 
(
	[WebId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebSlide]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSlide](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WebId] [int] NULL,
	[Img] [nvarchar](255) NULL,
	[Order] [int] NULL,
	[DateAdd] [datetime] NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_WebSlide] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [CusId], [IpAddress]) VALUES (1, 3, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[Cus] ([CusId]) VALUES (3)
INSERT [dbo].[Cus] ([CusId]) VALUES (22)
INSERT [dbo].[Cus] ([CusId]) VALUES (23)
INSERT [dbo].[Cus] ([CusId]) VALUES (26)
INSERT [dbo].[Cus] ([CusId]) VALUES (27)
INSERT [dbo].[Cus] ([CusId]) VALUES (28)
INSERT [dbo].[Cus] ([CusId]) VALUES (29)
INSERT [dbo].[Cus] ([CusId]) VALUES (30)
INSERT [dbo].[Cus] ([CusId]) VALUES (31)
INSERT [dbo].[Cus] ([CusId]) VALUES (32)
INSERT [dbo].[Cus] ([CusId]) VALUES (33)
INSERT [dbo].[Mer] ([MerId]) VALUES (1)
INSERT [dbo].[Mer] ([MerId]) VALUES (11)
INSERT [dbo].[Mer] ([MerId]) VALUES (12)
INSERT [dbo].[Mer] ([MerId]) VALUES (14)
INSERT [dbo].[Mer] ([MerId]) VALUES (15)
INSERT [dbo].[Mer] ([MerId]) VALUES (16)
INSERT [dbo].[Mer] ([MerId]) VALUES (17)
INSERT [dbo].[Mer] ([MerId]) VALUES (18)
INSERT [dbo].[Mer] ([MerId]) VALUES (19)
INSERT [dbo].[Mer] ([MerId]) VALUES (20)
INSERT [dbo].[Mer] ([MerId]) VALUES (21)
INSERT [dbo].[Mstr] ([MstrId]) VALUES (2)
INSERT [dbo].[MstrDet] ([MstrId], [RoleId], [AddDate], [AddBy]) VALUES (2, 1, CAST(N'2019-05-07T12:56:07.947' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MstrRole] ON 

INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (1, N'Giám đốc')
SET IDENTITY_INSERT [dbo].[MstrRole] OFF
SET IDENTITY_INSERT [dbo].[Pro] ON 

INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (1, 7, 1, 1, N'ULTRABOOST 19 SHOES', N'ULTRABOOST 19 SHOES.PNG', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH', N'180', N'90', 1, 0, CAST(N'2019-05-07T16:38:24.307' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (1, 8, 1, 2, N'NIKE FLEX 2018 RN', N'1.PNG', N'&lt;h2&gt;&lt;strong&gt;&lt;span style="font-size:26px"&gt;Gi&amp;agrave;y Nike Flex 2018 RN&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;span style="font-size:18px"&gt;Gi&amp;agrave;y Flex RN 2018 l&amp;agrave; mẫu gi&amp;agrave;y được d&amp;ugrave;ng để tập luyện thể thao trong nh&amp;agrave;, đi bộ đường d&amp;agrave;i hay kể cả trong mục đ&amp;iacute;ch chạy bộ qu&amp;atilde;ng ngắn th&amp;igrave; Flex RN 2018 ho&amp;agrave;n to&amp;agrave;n c&amp;oacute; thể đ&amp;aacute;p ứng c&amp;aacute;c nhu cầu của bạn. Với thiết kế phần Upper ph&amp;iacute;a tr&amp;ecirc;n l&amp;agrave; vải dệt gi&amp;uacute;p cho người sử dụng c&amp;oacute; thể dễ d&amp;agrave;ng cử động b&amp;agrave;n ch&amp;acirc;n trong tất cả mọi hoạt động. Kết hợp với đ&amp;oacute; l&amp;agrave; c&amp;ocirc;ng nghệ Flywire gi&amp;uacute;p định h&amp;igrave;nh cho Form của đ&amp;ocirc;i gi&amp;agrave;y cũng như gi&amp;uacute;p cho b&amp;agrave;n ch&amp;acirc;n của bạn được cố định chắc chắn hơn trong qu&amp;aacute; tr&amp;igrave;nh sử dụng. Một lần nữa c&amp;ocirc;ng nghệ đế Free RN lại được c&amp;aacute;c nh&amp;agrave; thiết kế tin tưởng, ở phi&amp;ecirc;n bản n&amp;agrave;y được kết hợp th&amp;ecirc;m c&amp;aacute;c lỗ tr&amp;ograve;n nhằm tăng độ b&amp;aacute;m, tăng độ chống trơn trượt hơn hẳn so với c&amp;aacute;c phi&amp;ecirc;n bản cũ trước đ&amp;acirc;y. V&amp;agrave; chưa hết với phối m&amp;agrave;u trẻ trung, thời thượng, khoẻ khoắn gi&amp;uacute;p bạn tự tin tr&amp;ecirc;n mọi sải bước.&lt;/span&gt;&lt;/p&gt;
', N'Giày Flex RN 2018 là mẫu giày được dùng để tập luyện thể thao trong nhà, đi bộ đường dài hay kể cả trong mục đích chạy bộ quãng ngắn thì Flex RN 2018 hoàn toàn có thể đáp ứng các nhu cầu của bạn. ', N'120', NULL, 1, 0, CAST(N'2019-05-09T13:33:03.687' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (1, 9, 1, 7, N'Puma Tsugi Blaze', N'1.PNG', N'&lt;h2&gt;&lt;span style="font-size:26px"&gt;&lt;strong&gt;Gi&amp;agrave;y Puma Tsugi Blaze Nam - Đen V&amp;agrave;ng&lt;/strong&gt;&lt;/span&gt;&lt;/h2&gt;

&lt;p&gt;&lt;span style="font-size:18px"&gt;&lt;em&gt;Gi&amp;agrave;y Puma Tsugi Blaze - Bước tiến mới của Puma về d&amp;ograve;ng gi&amp;agrave;y chạy bộ.&lt;/em&gt;&lt;br /&gt;
Từ 2015 Puma đ&amp;atilde; ch&amp;iacute;nh thức ra mắt d&amp;ograve;ng gi&amp;agrave;y chạy bộ IGNITE. Với c&amp;ocirc;ng nghệ ti&amp;ecirc;n tiến, điểm nổi bật của gi&amp;agrave;y Puma Tsugi Blaze n&amp;agrave;y l&amp;agrave; được chế tạo từ chất foam (Ignite foam) tận dụng được độ đ&amp;agrave;n hồi, t&amp;aacute;i tạo năng lượng lớn khiến cho mọi vận động trở n&amp;ecirc;n thoải m&amp;aacute;i v&amp;agrave; nhẹ nh&amp;agrave;ng hơn. Miếng đệm dẻo dai phần outsole được thiết kế đặc biệt d&amp;agrave;i hơn 1 ch&amp;uacute;t tăng độ b&amp;aacute;m đường, cho từng bước ch&amp;acirc;n chắc chắn bền bỉ. Hơn nữa đ&amp;ocirc;i gi&amp;agrave;y Puma Tsugi Blaze kh&amp;aacute; bắt mắt trong việc kết hợp m&amp;agrave;u mang lại h&amp;igrave;nh tượng trẻ trung năng động, th&amp;iacute;ch hợp cho c&amp;aacute;c anh ch&amp;agrave;ng c&amp;aacute; t&amp;iacute;n&lt;/span&gt;h mang hơi hướng đường phố.&lt;/p&gt;
', N'Giày Puma Tsugi Blaze - Bước tiến mới của Puma về dòng giày chạy bộ.', N'190', NULL, 1, 0, CAST(N'2019-05-09T13:50:33.713' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (1, 10, 1, 1, N'Alphabounce Instinct', N'1.PNG', N'&lt;h2&gt;&lt;strong&gt;&lt;span style="font-size:26px"&gt;Gi&amp;agrave;y adidas Alphabounce Instinct&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/h2&gt;

&lt;p&gt;&lt;span style="font-size:18px"&gt;&lt;em&gt;Gi&amp;agrave;y adidas Alphabounce Instinct - năng động hơn, trẻ trung hơn, linh hoạt hơn.&lt;/em&gt;&lt;br /&gt;
Gi&amp;agrave;y adidas Alphabounce Instinct ch&amp;iacute;nh l&amp;agrave; một phi&amp;ecirc;n bản n&amp;acirc;ng cấp của gi&amp;agrave;y adias AlphaBounce trước đ&amp;oacute;. Được trang bị đầy đủ cho một đ&amp;ocirc;i gi&amp;agrave;y running: đế cao cố định, chống lật cổ ch&amp;acirc;n, thu&amp;ocirc;n dần về mũi tạo n&amp;ecirc;n t&amp;iacute;nh thẩm mĩ cao c&amp;ugrave;ng với dế Bounce đ&amp;agrave;n hồi cực tốt. Kh&amp;ocirc;ng chỉ c&amp;oacute; vậy, chất liệu Engineered Mesh tạo độ tho&amp;aacute;ng kh&amp;iacute; tối đa.&lt;br /&gt;
Gi&amp;agrave;y adidas Alphabounce Instinct&amp;nbsp;mang đến hiệu năng cao, đa dụng lại c&amp;oacute; gi&amp;aacute; cực mềm. Đ&amp;acirc;y ch&amp;iacute;nh l&amp;agrave; lựa chọn kh&amp;aacute; tuyệt vời nếu bạn chưa c&amp;oacute; khả năng t&amp;agrave;i ch&amp;iacute;nh để thử sức với UltraBoost thần th&amp;aacute;nh của adidas.&lt;/span&gt;&lt;/p&gt;
', N'Giày adidas Alphabounce Instinct - năng động hơn, trẻ trung hơn, linh hoạt hơn.', N'175', NULL, 1, 1, CAST(N'2019-05-09T13:56:36.027' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (4, 11, 1, 3, N'Reebok Pump Fury 2019', N'images.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Giày được Reebok cho ra mắt vào bộ sưu tập hè 2019', N'800', NULL, 1, 0, CAST(N'2019-05-11T16:10:08.270' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (4, 12, 1, 2, N'Nike Red October', N'Yeezy_II_Profile_main.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Bản Collab đầu tiên của Kanye và Nike', N'300', NULL, 1, 0, CAST(N'2019-05-11T16:26:55.937' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (4, 13, 1, 2, N'Yeezy 350 Tan', N'ADIDAS-FACTORY-YEEZY-350-BOOST-OXFORD-TAN_5-600x500.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Một trong những đầu giày thay đổi cục diện sneaker game', N'800', NULL, 1, 0, CAST(N'2019-05-11T16:28:45.227' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (4, 14, 2, 2, N'Yeezy 550', N'Adidas-Yeezy-500-Utility-Black-Product.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Kanye cho ra mắt đôi Yeezy thứ 5 vào 2018', N'700', NULL, 1, 0, CAST(N'2019-05-11T16:30:54.363' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (5, 15, 1, 2, N'Bitis Hunter X Retro', N'2ffd7d0ce38750ecb759168fa86eb589.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Bitis Hunter X được phối màu retro được áp dụng trên bản triple black', N'900', NULL, 1, 0, CAST(N'2019-05-11T16:55:12.620' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (5, 16, 1, 3, N'Reebok Pump Fury 2018', N'InstaPump_Fury_OG_Ultraknit_Blue_CN5735_01_standard.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Giày được Reebok cho ra mắt vào bộ sưu tập hè 2017', N'1200', N'', 1, 0, CAST(N'2019-05-11T16:56:00.630' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (5, 17, 2, 7, N'Puma Disc X', N'images.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Puma Disc X cho bạn cảm giác của Techwear', N'800', NULL, 1, 0, CAST(N'2019-05-11T16:59:20.407' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (5, 18, 2, 4, N'Vans Slip on Checkerboard', N'153283962509464_314c92da-bc90-4a3d-bc99-be5ca30506d1.jpg', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'Một đôi giày cho mọi hoạt động trong ngày', N'800', NULL, 1, 0, CAST(N'2019-05-11T16:59:55.647' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Pro] OFF
SET IDENTITY_INSERT [dbo].[ProBrand] ON 

INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (1, N'ADIAS', N'adidas.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (2, N'NIKE', N'nike.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (3, N'REEBOK', N'reebok.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (4, N'VANS', N'vans.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (5, N'CONVERSE', N'converse.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (6, N'NEW BALANCE', N'newbalance.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (7, N'PUMA', N'puma.png')
SET IDENTITY_INSERT [dbo].[ProBrand] OFF
SET IDENTITY_INSERT [dbo].[ProCat] ON 

INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (1, N'NAM', 1, CAST(N'2019-05-07T13:00:51.8700000' AS DateTime2), NULL, N'men.jpg')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (2, N'NỮ', 1, CAST(N'2019-05-07T13:00:55.6530000' AS DateTime2), NULL, N'women.jpg')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (3, N'THỂ THAO', 1, CAST(N'2019-05-07T13:01:18.3030000' AS DateTime2), NULL, N'sport.jpg')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (4, N'THỜI TRANG', 1, CAST(N'2019-05-07T13:22:56.7470000' AS DateTime2), NULL, N'fashion.jpg')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (5, N'DU LỊCH', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'traveling.jpg')
SET IDENTITY_INSERT [dbo].[ProCat] OFF
SET IDENTITY_INSERT [dbo].[ProColor] ON 

INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (1, N'Đỏ', NULL, N'FF0000')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (2, N'Đen', NULL, N'000000')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (3, N'Trắng', NULL, N'FFFFFF')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (4, N'Xanh lá', NULL, N'008000')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (5, N'Xanh dương', NULL, N'0000FF')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (6, N'Vàng', NULL, N'FFFF00')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (7, N'Bạc', NULL, N'C0C0C0')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (8, N'Xám', NULL, N'808080')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (9, N'Tím', NULL, N'A020F0')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (10, N'Hồng', NULL, N'FF1493')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (11, N'Cam', NULL, N'FFA500')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (12, N'Nâu', NULL, N'8B4513')
SET IDENTITY_INSERT [dbo].[ProColor] OFF
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 1, 0, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 4, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 6, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 10, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 3, 1, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 5, 1, 1, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 5, 4, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 5, 5, 2, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 8, 5, 4, 2, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 8, 5, 5, 2, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 8, 5, 6, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 9, 2, 8, 4, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 9, 6, 8, 4, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 10, 8, 5, 0, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 10, 8, 6, 0, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 10, 8, 7, 0, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 10, 8, 8, 0, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 11, 2, 4, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 11, 2, 10, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 11, 3, 1, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 12, 5, 3, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 12, 5, 4, 4, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 12, 6, 1, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 12, 8, 9, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 13, 1, 3, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 13, 2, 3, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 13, 5, 6, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 14, 1, 1, 2, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (4, 14, 2, 3, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 15, 4, 4, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 15, 7, 7, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 15, 8, 8, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 16, 4, 4, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 16, 5, 3, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 16, 7, 9, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 17, 5, 10, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 17, 8, 10, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 18, 1, 10, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (5, 18, 6, 7, 5, NULL)
SET IDENTITY_INSERT [dbo].[ProSize] ON 

INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (1, N'35', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (2, N'36', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (3, N'37', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (4, N'38', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (5, N'39', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (6, N'40', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (7, N'41', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (8, N'42', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (9, N'43', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (10, N'44', NULL)
SET IDENTITY_INSERT [dbo].[ProSize] OFF
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 1, 7, N'ULTRABOOST 19 SHOES 4.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 1, 8, N'5.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 1, 9, N'5.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 1, 10, N'5.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 4, 11, N'pumps.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 4, 12, N'Free-shipping.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 4, 13, N'2de51623af8e8df1c168f2b70aa900ba.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 4, 14, N'hang-chinh-hang-adidas-yeezy-500-blush-2018.jpeg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 5, 15, N'dsc_4725_01661187fbf04659b2c111c07c27f5e9_1024x1024.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 5, 16, N'reebok-instapump-fury-og-u-_black-team-dark-royal-cn0135-1.jpg.pagespeed.ce.QpdXtnPnpo.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 5, 17, N'puma-disc-blaze-frosted.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 5, 18, N'EYEBWW-HERO.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (2, 1, 7, N'ULTRABOOST 19 SHOES 3.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (2, 1, 8, N'4.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (2, 1, 9, N'4.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (2, 1, 10, N'4.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (3, 1, 7, N'ULTRABOOST 19 SHOES 2.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (3, 1, 8, N'3.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (3, 1, 9, N'3.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (3, 1, 10, N'3.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (4, 1, 7, N'ULTRABOOST 19 SHOES 1.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (4, 1, 8, N'2.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (4, 1, 9, N'2.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (4, 1, 10, N'2.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (5, 1, 8, N'1.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (5, 1, 9, N'1.PNG')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (5, 1, 10, N'1.PNG')
SET IDENTITY_INSERT [dbo].[Rcpt] ON 

INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (15, 1, NULL, CAST(N'2019-11-27T16:49:22.263' AS DateTime), CAST(N'2019-11-27T16:49:51.843' AS DateTime), 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (16, 1, NULL, CAST(N'2019-11-28T10:05:22.927' AS DateTime), CAST(N'2019-11-28T10:05:50.383' AS DateTime), 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (17, 1, NULL, CAST(N'2019-11-28T10:06:33.583' AS DateTime), CAST(N'2019-11-28T10:06:51.867' AS DateTime), 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (18, 1, NULL, CAST(N'2019-11-28T14:24:27.217' AS DateTime), CAST(N'2019-11-28T14:25:00.823' AS DateTime), 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (19, 1, NULL, CAST(N'2019-12-03T23:09:43.613' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Rcpt] OFF
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId], [CusMessage], [MerMessage], [CusPoint], [MerPoint]) VALUES (15, 1, 3, N'Cảm ơn', N'Tốt', 5, 5)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId], [CusMessage], [MerMessage], [CusPoint], [MerPoint]) VALUES (16, 1, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId], [CusMessage], [MerMessage], [CusPoint], [MerPoint]) VALUES (17, 1, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId], [CusMessage], [MerMessage], [CusPoint], [MerPoint]) VALUES (18, 1, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (15, 1, 7, 2, 1, N'Mới mua, dùng ngon', 5, NULL, NULL, 1, N'90')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (16, 1, 10, 8, 5, NULL, NULL, NULL, NULL, 1, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (16, 1, 10, 8, 6, NULL, NULL, NULL, NULL, 1, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (16, 1, 10, 8, 7, NULL, NULL, NULL, NULL, 1, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (16, 1, 10, 8, 8, NULL, NULL, NULL, NULL, 1, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (17, 1, 10, 8, 5, NULL, NULL, NULL, NULL, 2, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (17, 1, 10, 8, 6, NULL, NULL, NULL, NULL, 1, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (17, 1, 10, 8, 7, NULL, NULL, NULL, NULL, 1, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (17, 1, 10, 8, 8, NULL, NULL, NULL, NULL, 2, N'175')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (18, 1, 7, 2, 1, NULL, NULL, NULL, NULL, 2, N'90')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (18, 1, 7, 2, 4, NULL, NULL, NULL, NULL, 2, N'90')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (18, 1, 7, 5, 1, NULL, NULL, NULL, NULL, 2, N'90')
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (18, 1, 7, 5, 5, NULL, NULL, NULL, NULL, 2, N'90')
SET IDENTITY_INSERT [dbo].[RcptBuySta] ON 

INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (1, 15)
INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (2, 16)
INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (3, 17)
INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (4, 18)
SET IDENTITY_INSERT [dbo].[RcptBuySta] OFF
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 15, 1, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 15, 2, CAST(N'2019-11-27T16:49:44.377' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 15, 4, CAST(N'2019-11-27T16:49:46.920' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 15, 6, CAST(N'2019-11-27T16:49:49.073' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 15, 7, CAST(N'2019-11-27T16:49:51.850' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (2, 16, 1, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (2, 16, 2, CAST(N'2019-11-28T10:05:43.843' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (2, 16, 4, CAST(N'2019-11-28T10:05:46.047' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (2, 16, 6, CAST(N'2019-11-28T10:05:48.163' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (2, 16, 7, CAST(N'2019-11-28T10:05:50.387' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (3, 17, 1, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (3, 17, 2, CAST(N'2019-11-28T10:06:44.840' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (3, 17, 4, CAST(N'2019-11-28T10:06:47.023' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (3, 17, 6, CAST(N'2019-11-28T10:06:49.183' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (3, 17, 7, CAST(N'2019-11-28T10:06:51.867' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (4, 18, 1, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (4, 18, 2, CAST(N'2019-11-28T14:24:53.750' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (4, 18, 4, CAST(N'2019-11-28T14:24:56.093' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (4, 18, 6, CAST(N'2019-11-28T14:24:58.150' AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (4, 18, 7, CAST(N'2019-11-28T14:25:00.823' AS DateTime))
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (1, N'Đang xác nhận', 1)
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
INSERT [dbo].[RcptSub] ([RcptSubId], [MerId], [Status]) VALUES (19, 1, 1)
INSERT [dbo].[RcptSubDet] ([RcptSubId], [SubId], [Quantity]) VALUES (19, 1, 1)
SET IDENTITY_INSERT [dbo].[Shp] ON 

INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active], [Desc], [Address], [Phone]) VALUES (1, 1, N'KICKS', CAST(N'2019-05-07T16:30:50.723' AS DateTime), 1, N'Shop bán đồ auth chất lượng không phải bàn', N'276 An Dương Vương Phường 9 Quận 5 TPHCM', N'01204569020')
INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active], [Desc], [Address], [Phone]) VALUES (4, 11, N'Shop Của A', CAST(N'2019-05-11T15:51:58.360' AS DateTime), 1, N'Shop này bán đồ của A', N'66 Trần Quang Khải phường 11 quận Phú Nhuận', N'0192645316')
INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active], [Desc], [Address], [Phone]) VALUES (5, 12, N'Shop Của B', CAST(N'2019-05-11T16:45:09.723' AS DateTime), 1, N'Shop này bán đồ của B', N'100 Trần Đại Nghĩa Phường 3 Quận 3', N'015616212546')
INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active], [Desc], [Address], [Phone]) VALUES (6, 15, N'Shop của 2', CAST(N'2019-05-11T18:55:32.960' AS DateTime), 1, N'Bla bla bla', N'66 Trần hưng Đạo', N'0132494959')
SET IDENTITY_INSERT [dbo].[Shp] OFF
SET IDENTITY_INSERT [dbo].[Sub] ON 

INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (1, N'Tuần', 7, N'20')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (2, N'Tháng', 30, N'75')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (3, N'Năm', 360, N'800')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (4, N'Combo 3 tháng', 90, N'200')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (5, N'Combo 3 năm', 1080, N'2800')
SET IDENTITY_INSERT [dbo].[Sub] OFF
SET IDENTITY_INSERT [dbo].[Usr] ON 

INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (1, N'Nguyễn Doãn Hiện', NULL, N'doanhien', N'fwwrnlUyVrc=', N's7S9fvxRiciMGo5XCv7QlA==', 1, N'toilati123vn@gmail.com', N'273 An Dương Vương P7 Q6', N'0704569020', CAST(N'2019-03-20T16:15:50.350' AS DateTime), CAST(N'2019-05-07T13:26:23.040' AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (2, N'Phan Anh Trúc', N'1.jpg', N'truc', N'fwwrnlUyVrc=', NULL, 1, N'anhtruc@gmail.com', N'21 Lưu Xuân Tín P15 Q5', N'0967513425', CAST(N'2019-03-20T16:15:50.350' AS DateTime), CAST(N'2019-03-20T16:15:50.350' AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (3, N'Trần Quang Danh', NULL, N'quangdanh', N'fwwrnlUyVrc=', NULL, 1, N'handoiditu1508@gmail.com', N'26 Nguyễn Trãi P1 Q5', N'0967513424', CAST(N'2019-03-20T16:15:50.350' AS DateTime), CAST(N'2019-11-22T16:09:04.813' AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (11, N'merchantA', NULL, N'merchantA', N'fwwrnlUyVrc=', NULL, 1, N'duchau@gmail.com', N'192 Hàm Tử', N'0154621230', CAST(N'2019-05-11T15:45:43.460' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (12, N'merchantB', NULL, N'merchantB', N'fwwrnlUyVrc=', NULL, 1, N'duchuy@gmail.com', N'193 Hàm Tử', N'0165451622', CAST(N'2019-05-11T15:46:36.793' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (14, N'merchant1', NULL, N'merchant1', N'fwwrnlUyVrc=', NULL, 0, N'thanhchuong@gmail.com', N'194 Hàm Tử', N'0135465213', CAST(N'2019-05-11T15:55:45.157' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (15, N'merchant2', NULL, N'merchant2', N'fwwrnlUyVrc=', NULL, 1, N'thanhhoa@gmail.com', N'195 Hàm Tử', N'0165016542', CAST(N'2019-05-11T15:56:16.160' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (16, N'merchant3', NULL, N'merchant3', N'fwwrnlUyVrc=', NULL, 1, N'thanhda@gmail.com', N'27 Trần Hưng Đạo phường 11 quận 1', N'0995465162', CAST(N'2019-05-11T15:56:55.990' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (17, N'merchant4', NULL, N'merchant4', N'fwwrnlUyVrc=', NULL, 1, N'vuthao@gmail.com', N'08 Trần Bình Trọng phường 7 quận 5', N'0903655524', CAST(N'2019-05-11T15:57:36.263' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (18, N'merchant5', NULL, N'merchant5', N'fwwrnlUyVrc=', NULL, 1, N'tanloc@gmail.com', N'17 Bình Trị Đông phường 3 quận 6', N'0902465421', CAST(N'2019-05-11T15:58:14.523' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (19, N'merchant6', NULL, N'merchant6', N'fwwrnlUyVrc=', NULL, 1, N'vannhi@gmail.com', N'45 Nguyễn Duy Dương', N'0169485162', CAST(N'2019-05-11T15:58:56.827' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (20, N'merchant7', NULL, N'merchant7', N'fwwrnlUyVrc=', NULL, 1, N'anhtuyet@gmail.com', N'148 An Bình quận 5', N'0421465462', CAST(N'2019-05-11T15:59:33.837' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (21, N'merchant8', NULL, N'merchant8', N'fwwrnlUyVrc=', NULL, 1, N'changtraiubuon@gmail.com', N'150 An Nhiên quận 5', N'0498451616', CAST(N'2019-05-11T16:00:04.017' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (22, N'customerX', NULL, N'customerX', N'fwwrnlUyVrc=', NULL, 1, N'cogaidethuong@gmail.com', N'120 Điện Biên Phủ', N'0546484261', CAST(N'2019-05-11T17:04:08.003' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (23, N'customerY', NULL, N'customerY', N'fwwrnlUyVrc=', NULL, 1, N'hihihaha@gmail.com', N'34 An Dương Vương ', N'0135465121', CAST(N'2019-05-11T17:04:34.917' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (26, N'customer1', NULL, N'customer1', N'fwwrnlUyVrc=', NULL, 1, N'allahu@gmail.com', N'16 Bình Định phường 1 quận 1', N'0465195195', CAST(N'2019-05-11T17:09:43.020' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (27, N'customer2', NULL, N'customer2', N'fwwrnlUyVrc=', NULL, 1, N'akbar@gmail.com', N'27 Tân Hóa phường 3 quận 7', N'0651651622', CAST(N'2019-05-11T17:11:21.777' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (28, N'customer3', NULL, N'customer3', N'fwwrnlUyVrc=', NULL, 1, N'alan@gmail.com', N'99 Trương Công Định', N'0165165121', CAST(N'2019-05-11T17:11:49.920' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (29, N'customer4', NULL, N'customer4', N'fwwrnlUyVrc=', NULL, 1, N'bboy@gmail.com', N'68 Trần Quang Khải', N'0165498451', CAST(N'2019-05-11T17:12:28.613' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (30, N'customer5', NULL, N'customer5', N'fwwrnlUyVrc=', NULL, 1, N'krax@gmail.com', N'88 Yersin', N'0161652132', CAST(N'2019-05-11T17:12:54.270' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (31, N'customer6', NULL, N'customer6', N'fwwrnlUyVrc=', NULL, 1, N'hien@gmail.com', N'120 Nguyễn Văn Cừ', N'0565461626', CAST(N'2019-05-11T17:13:23.440' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (32, N'customer7', NULL, N'customer7', N'fwwrnlUyVrc=', NULL, 1, N'hungan@gmail.com', N'29 Bùi Lộc ', N'0995462165', CAST(N'2019-05-11T17:13:51.973' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [PasswordForget], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (33, N'customer8', NULL, N'customer8', N'fwwrnlUyVrc=', NULL, 1, N'lololol@gmail.com', N'10 Kí Con', N'0169459875', CAST(N'2019-05-11T17:14:17.370' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Usr] OFF
INSERT [dbo].[WebInfo] ([WebId], [Name], [Address], [Email], [Phone], [WorkTime]) VALUES (1, N'The Shoes', N'273 An Dương Vương', NULL, NULL, N'Hai-Sáu 10:00pm - 7:00pm')
SET IDENTITY_INSERT [dbo].[WebSlide] ON 

INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (1, 1, N'5.jpg', NULL, NULL, NULL)
INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (2, 1, N'4.jpg', NULL, NULL, NULL)
INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (3, 1, N'6.jpg', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[WebSlide] OFF
/****** Object:  Index [IX_UsersCustomersCarts]    Script Date: 12/3/2019 11:17:13 PM ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [IX_UsersCustomersCarts] UNIQUE NONCLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RcptStaStep]    Script Date: 12/3/2019 11:17:13 PM ******/
ALTER TABLE [dbo].[RcptBuyStaStep] ADD  CONSTRAINT [IX_RcptStaStep] UNIQUE NONCLUSTERED 
(
	[StepOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersMerchantsShops]    Script Date: 12/3/2019 11:17:13 PM ******/
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [IX_UsersMerchantsShops] UNIQUE NONCLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usr_Email]    Script Date: 12/3/2019 11:17:13 PM ******/
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [IX_Usr_Email] UNIQUE NONCLUSTERED 
(
	[UsrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Usr_Login]    Script Date: 12/3/2019 11:17:13 PM ******/
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [IX_Usr_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsrAct]    Script Date: 12/3/2019 11:17:13 PM ******/
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [IX_UsrAct] UNIQUE NONCLUSTERED 
(
	[ActCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsrAct_1]    Script Date: 12/3/2019 11:17:13 PM ******/
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [IX_UsrAct_1] UNIQUE NONCLUSTERED 
(
	[UsrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartDet] ADD  CONSTRAINT [DF_CartDet_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [dbo].[MstrDet] ADD  CONSTRAINT [DF_MstrDet_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_CatId]  DEFAULT ((1)) FOR [CatId]
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
ALTER TABLE [dbo].[RcptBuyStaDet] ADD  CONSTRAINT [DF_RcptBuyStaDet_AddDate]  DEFAULT (getdate()) FOR [AddDate]
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
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [DF_UsrAct_IsAct]  DEFAULT ((0)) FOR [IsAct]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers] FOREIGN KEY([CusId])
REFERENCES [dbo].[Cus] ([CusId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers]
GO
ALTER TABLE [dbo].[CartDet]  WITH CHECK ADD  CONSTRAINT [FK_CartDet_ProDet] FOREIGN KEY([ShpId], [ProId], [ColorId], [SizeId])
REFERENCES [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId])
GO
ALTER TABLE [dbo].[CartDet] CHECK CONSTRAINT [FK_CartDet_ProDet]
GO
ALTER TABLE [dbo].[CartDet]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDet] CHECK CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts]
GO
ALTER TABLE [dbo].[Cus]  WITH CHECK ADD  CONSTRAINT [FK_Cus_Usr] FOREIGN KEY([CusId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cus] CHECK CONSTRAINT [FK_Cus_Usr]
GO
ALTER TABLE [dbo].[Mer]  WITH CHECK ADD  CONSTRAINT [FK_Mer_Usr] FOREIGN KEY([MerId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mer] CHECK CONSTRAINT [FK_Mer_Usr]
GO
ALTER TABLE [dbo].[Mstr]  WITH CHECK ADD  CONSTRAINT [FK_Mstr_Usr] FOREIGN KEY([MstrId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mstr] CHECK CONSTRAINT [FK_Mstr_Usr]
GO
ALTER TABLE [dbo].[MstrDet]  WITH CHECK ADD  CONSTRAINT [FK_MstrDet_Mstr] FOREIGN KEY([MstrId])
REFERENCES [dbo].[Mstr] ([MstrId])
GO
ALTER TABLE [dbo].[MstrDet] CHECK CONSTRAINT [FK_MstrDet_Mstr]
GO
ALTER TABLE [dbo].[MstrDet]  WITH CHECK ADD  CONSTRAINT [FK_MstrDet_Mstr1] FOREIGN KEY([AddBy])
REFERENCES [dbo].[Mstr] ([MstrId])
GO
ALTER TABLE [dbo].[MstrDet] CHECK CONSTRAINT [FK_MstrDet_Mstr1]
GO
ALTER TABLE [dbo].[MstrDet]  WITH CHECK ADD  CONSTRAINT [FK_MstrDet_MstrRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[MstrRole] ([RoleId])
GO
ALTER TABLE [dbo].[MstrDet] CHECK CONSTRAINT [FK_MstrDet_MstrRole]
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
ALTER TABLE [dbo].[ProSlide]  WITH CHECK ADD  CONSTRAINT [FK_ProSlide_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[ProSlide] CHECK CONSTRAINT [FK_ProSlide_Pro]
GO
ALTER TABLE [dbo].[ProSlideImg]  WITH CHECK ADD  CONSTRAINT [FK_ProSlideImg_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[ProSlideImg] CHECK CONSTRAINT [FK_ProSlideImg_Pro]
GO
ALTER TABLE [dbo].[Rcpt]  WITH CHECK ADD  CONSTRAINT [FK_Rcpt_Usr] FOREIGN KEY([UsrAdd])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rcpt] CHECK CONSTRAINT [FK_Rcpt_Usr]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuy_Cus] FOREIGN KEY([CusId])
REFERENCES [dbo].[Cus] ([CusId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_RcptBuy_Cus]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuy_Rcpt] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[Rcpt] ([RcptId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_RcptBuy_Rcpt]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuy_Shp] FOREIGN KEY([ShpId])
REFERENCES [dbo].[Shp] ([ShpId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_RcptBuy_Shp]
GO
ALTER TABLE [dbo].[RcptBuyDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuyDet_ProDet] FOREIGN KEY([ShpId], [ProId], [ColorId], [SizeId])
REFERENCES [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId])
GO
ALTER TABLE [dbo].[RcptBuyDet] CHECK CONSTRAINT [FK_RcptBuyDet_ProDet]
GO
ALTER TABLE [dbo].[RcptBuyDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuyDet_RcptBuy] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[RcptBuy] ([RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuyDet] CHECK CONSTRAINT [FK_RcptBuyDet_RcptBuy]
GO
ALTER TABLE [dbo].[RcptBuySta]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuySta_RcptBuy] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[RcptBuy] ([RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuySta] CHECK CONSTRAINT [FK_RcptBuySta_RcptBuy]
GO
ALTER TABLE [dbo].[RcptBuyStaDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuyStaDet_RcptBuySta] FOREIGN KEY([StaId], [RcptBuyId])
REFERENCES [dbo].[RcptBuySta] ([StaId], [RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuyStaDet] CHECK CONSTRAINT [FK_RcptBuyStaDet_RcptBuySta]
GO
ALTER TABLE [dbo].[RcptBuyStaDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStatesSteps] FOREIGN KEY([StepId])
REFERENCES [dbo].[RcptBuyStaStep] ([StepId])
GO
ALTER TABLE [dbo].[RcptBuyStaDet] CHECK CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStatesSteps]
GO
ALTER TABLE [dbo].[RcptSub]  WITH CHECK ADD  CONSTRAINT [FK_RcptSub_Mer] FOREIGN KEY([MerId])
REFERENCES [dbo].[Mer] ([MerId])
GO
ALTER TABLE [dbo].[RcptSub] CHECK CONSTRAINT [FK_RcptSub_Mer]
GO
ALTER TABLE [dbo].[RcptSub]  WITH CHECK ADD  CONSTRAINT [FK_RcptSub_Rcpt] FOREIGN KEY([RcptSubId])
REFERENCES [dbo].[Rcpt] ([RcptId])
GO
ALTER TABLE [dbo].[RcptSub] CHECK CONSTRAINT [FK_RcptSub_Rcpt]
GO
ALTER TABLE [dbo].[RcptSubDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptSubDet_RcptSub] FOREIGN KEY([RcptSubId])
REFERENCES [dbo].[RcptSub] ([RcptSubId])
GO
ALTER TABLE [dbo].[RcptSubDet] CHECK CONSTRAINT [FK_RcptSubDet_RcptSub]
GO
ALTER TABLE [dbo].[RcptSubDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptSubDet_Sub] FOREIGN KEY([SubId])
REFERENCES [dbo].[Sub] ([SubId])
GO
ALTER TABLE [dbo].[RcptSubDet] CHECK CONSTRAINT [FK_RcptSubDet_Sub]
GO
ALTER TABLE [dbo].[Shp]  WITH CHECK ADD  CONSTRAINT [FK_Shp_Mer] FOREIGN KEY([MerId])
REFERENCES [dbo].[Mer] ([MerId])
GO
ALTER TABLE [dbo].[Shp] CHECK CONSTRAINT [FK_Shp_Mer]
GO
ALTER TABLE [dbo].[UsrAct]  WITH CHECK ADD  CONSTRAINT [FK_UsrAct_Usr] FOREIGN KEY([UsrId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsrAct] CHECK CONSTRAINT [FK_UsrAct_Usr]
GO
ALTER TABLE [dbo].[WebSlide]  WITH CHECK ADD  CONSTRAINT [FK_WebSlide_WebInfo] FOREIGN KEY([WebId])
REFERENCES [dbo].[WebInfo] ([WebId])
GO
ALTER TABLE [dbo].[WebSlide] CHECK CONSTRAINT [FK_WebSlide_WebInfo]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [CK_Usr] CHECK  (([Email] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [CK_Usr]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [CK_Usr_1] CHECK  ((NOT [Phone] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [CK_Usr_1]
GO
ALTER TABLE [dbo].[WebInfo]  WITH CHECK ADD  CONSTRAINT [CK_WebInfo] CHECK  (([WebId]=(1)))
GO
ALTER TABLE [dbo].[WebInfo] CHECK CONSTRAINT [CK_WebInfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Info]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Admin_Info]
AS
BEGIN
SELECT [UsrId]
      ,[UsrName]
      ,[Login]
      ,[Password]
      ,[Active]
      ,[Email]
      ,[Address]
      ,[Phone]
      ,[DateAdd]
      ,[DateEdit]
	  ,[RoleName]
	FROM
    Usr u
INNER JOIN MstrDet m ON u.UsrId = m.MstrId
INNER JOIN MstrRole r ON m.RoleId = r.RoleId 
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cart_Delete]
(
@CartID int
)
AS
BEGIN
DELETE FROM [dbo].[Cart] 
WHERE CartID = @CartID
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**** PROCEDURE CART ****/

CREATE PROCEDURE [dbo].[sp_Cart_Insert]
(
@CusID int,
@IpAddress varchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[Cart](CusID,IpAddress)
VALUES(@CusID,@IpAddress)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cart_Select]
(
@CartID int
)
AS
BEGIN
SELECT * FROM [dbo].[Cart] 
WHERE CartID = @CartID
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cart_Update]
(
@CartID int,
@CusID int,
@IpAddress varchar(255)
)
AS 
BEGIN 
UPDATE [dbo].[Cart]
SET
CusID=@CusID,
IpAddress=@IpAddress
WHERE CartID = @CartID 
END 









GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CartDet_Delete]
(
@CartId int,
@ShpId int,
@ProId int
)as
BEGIN 
DELETE FROM [dbo].[CartDet] 
WHERE CartID = @CartID AND ShpId=@ShpId AND ProId=@ProId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/**** PROCEDURE CARTDET ****/

CREATE PROCEDURE [dbo].[sp_CartDet_Insert]
(
@CartId int,
@ShpId int,
@ProId int,
@Qty int
)
AS
BEGIN
INSERT INTO [dbo].[CartDet](CartId,ShpId,ProId,Qty)
VALUES(@CartId,@ShpId,@ProId,@Qty)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CartDet_Select]
(
@CartId int,
@ShpId int,
@ProId int
) as
BEGIN
SELECT * FROM [dbo].[CartDet] 
WHERE CartID = @CartID AND ShpId=@ShpId AND ProId=@ProId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CartDet_Update]
(
@CartId int,
@ShpId int,
@ProId int,
@Qty int
)
AS 
BEGIN 
UPDATE [dbo].[CartDet]
SET
CartId=@CartId,
ShpId=@ShpId,
ProId=@ProId,
Qty=@Qty
WHERE CartID = @CartID AND ShpId=@ShpId AND ProId=@ProId
END 









GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Cus_Delete]
(
@CusId int
)
as
BEGIN
DELETE FROM [dbo].[Cus]
WHERE CusID=@CusId 
END








GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Info]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Cus_Info]
AS
BEGIN
SELECT [UsrId]
      ,[UsrName]
      ,[Login]
      ,[Password]
      ,[Active]
      ,[Email]
      ,[Address]
      ,[Phone]
      ,[DateAdd]
      ,[DateEdit]
	FROM
    Usr u
INNER JOIN Cus c ON u.UsrId = c.CusId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/**** PROCEDURE CUS ****/

CREATE PROCEDURE [dbo].[sp_Cus_Insert]
(
@CusId int
)
AS
BEGIN
INSERT INTO [dbo].[Cus](CusID)
VALUES(@CusId)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cus_Select]
(
@CusID int
)
as
BEGIN
SELECT * FROM [dbo].[Cus] 
WHERE CusID=@CusId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cus_Update]
(
@CusId int
)
AS 
BEGIN 
UPDATE [dbo].[Cus]
SET
CusID=@CusId
WHERE CusID=@CusId 
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mer_Delete]
(
@MerId int
)
as
BEGIN
DELETE FROM [dbo].[Mer]
WHERE MerId=@MerId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Info]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Mer_Info]
AS
BEGIN
	SELECT [UsrId]
      ,[UsrName]
      ,[Login]
      ,[Password]
      ,[Active]
      ,[Email]
      ,[Address]
      ,[Phone]
      ,[DateAdd]
      ,[DateEdit]
	FROM
    Usr u
INNER JOIN Mer m ON u.UsrId = m.MerId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE MER ****/

CREATE PROCEDURE [dbo].[sp_Mer_Insert]
(
@MerId int
)
AS
BEGIN
INSERT INTO [dbo].[Mer](MerId)
VALUES(@MerId)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mer_Select]
(
@MerId int
)
as
BEGIN
SELECT * FROM [dbo].[Mer] 
WHERE MerId=@MerId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mer_Update]
(
@MerId int
)
AS 
BEGIN 
UPDATE [dbo].[Mer]
SET
MerId=@MerId
WHERE MerId=@MerId 
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Mstr_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mstr_Delete]
(
@MstrId int,
@RoleId int
)
AS
BEGIN
DELETE FROM [dbo].[Mstr] 
WHERE MstrId=@MstrId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Mstr_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mstr_Select]
(
@MstrId int,
@RoleId int
)
AS
BEGIN
SELECT * FROM [dbo].[Mstr] 
WHERE MstrId=@MstrId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_MstrRole_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MstrRole_Delete]
(
@RoleId int,
@RoleName nvarchar(255)
)
AS
BEGIN
DELETE FROM [dbo].[MstrRole] 
WHERE RoleId=@RoleId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_MstrRole_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE MSTRROLE ****/

CREATE PROCEDURE [dbo].[sp_MstrRole_Insert]
(
@RoleId int,
@RoleName nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[MstrRole](RoleId,RoleName)
VALUES(@RoleId,@RoleName)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_MstrRole_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MstrRole_Select]
(
@RoleId int,
@RoleName nvarchar(255)
)
AS
BEGIN
SELECT * FROM [dbo].[MstrRole] 
WHERE RoleId=@RoleId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProBrand_Delete]
(
@BrandId int
)
AS
BEGIN
DELETE FROM [dbo].[ProBrand] 
WHERE BrandId=@BrandId
END








GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProBrand_Insert]
(
@BrandId int,
@BrandName nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[ProBrand](BrandId,BrandName)
VALUES(@BrandId,@BrandName)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProBrand_Select]
(
@BrandId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProBrand] 
WHERE BrandId=@BrandId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProBrand_Update]
(
@BrandId int,
@BrandName nvarchar(255)
)
AS 
BEGIN 
UPDATE [dbo].[ProBrand]
SET
BrandName=@BrandName
WHERE BrandId=@BrandId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProCat_Delete]
(
@CatId int
)
AS
BEGIN
DELETE FROM [dbo].[ProCat]
WHERE CatId=@CatId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PROCAT****/

CREATE PROCEDURE [dbo].[sp_ProCat_Insert]
(
@CatId int,
@CatName nvarchar(255),
@Active bit,
@DateAdd datetime,
@DateEdit datetime
)
AS
BEGIN
INSERT INTO [dbo].[ProCat](CatId,CatName,Active,DateAdd,DateEdit)
VALUES(@CatId,@CatName,@Active,@DateAdd,@DateEdit)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProCat_Select]
(
@CatId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProCat]
WHERE CatId=@CatId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProCat_Update]
(
@CatId int,
@CatName nvarchar(255),
@Active bit,
@DateAdd datetime,
@DateEdit datetime
)
AS 
BEGIN 
UPDATE [dbo].[ProCat]
SET
CatName=@CatName,
Active=@Active,
DateAdd=@DateAdd,
DateEdit=@DateEdit
WHERE CatId=@CatId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProColor_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProColor_Delete]
(
@ColorId int
)
AS
BEGIN
DELETE FROM [dbo].[ProColor]
WHERE ColorId=@ColorId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProColor_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PROCOLOR****/

CREATE PROCEDURE [dbo].[sp_ProColor_Insert]
(
@ColorId int,
@ColorName nvarchar(255),
@ColorImg nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[ProColor](ColorId,ColorName,ColorImg)
VALUES(@ColorId,@ColorName,@ColorImg)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProColor_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProColor_Select]
(
@ColorId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProColor]
WHERE ColorId=@ColorId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProDet_Delete]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS
BEGIN
DELETE FROM [dbo].[ProDet]
WHERE ShpId=@ShpId AND ProId=@ProId AND ColorId=@ColorId AND SizeID=@ColorId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PRODET****/

CREATE PROCEDURE [dbo].[sp_ProDet_Insert]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS
BEGIN
INSERT INTO [dbo].[ProDet](ShpId,ProId,ColorId,SizeId)
VALUES(@ShpId,@ProId,@ColorId,@SizeId)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProDet_Select]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProDet]
WHERE ShpId=@ShpId AND ProId=@ProId AND ColorId=@ColorId AND SizeID=@ColorId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProDet_Update]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS 
BEGIN 
UPDATE [dbo].[ProDet]
SET
ShpId=@ShpId,
ProId=@ProId,
ColorId=@ColorId,
SizeID=@ColorId
WHERE ShpId=@ShpId AND ProId=@ProId AND ColorId=@ColorId AND SizeID=@ColorId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProSize_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProSize_Delete]
(
@SizeId int
)
AS
BEGIN
DELETE FROM [dbo].[ProSize]
WHERE SizeId=@SizeId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProSize_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PROSIZE****/

CREATE PROCEDURE [dbo].[sp_ProSize_Insert]
(
@SizeId int,
@SizeName nvarchar(255),
@SizeImg nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[ProSize](SizeId,SizeName,SizeImg)
VALUES(@SizeId,@SizeName,@SizeImg)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_ProSize_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProSize_Select]
(
@SizeId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProSize]
WHERE SizeId=@SizeId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Rcpt_Delete]
(
@RcptId int
)
AS
BEGIN
DELETE FROM [dbo].[Rcpt]
WHERE RcptId=@RcptId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPT****/

CREATE PROCEDURE [dbo].[sp_Rcpt_Insert]
(
@RcptId int,
@UsrAdd int,
@UsrEdit int,
@DateAdd datetime,
@DateEdit datetime
)
AS
BEGIN
INSERT INTO [dbo].[Rcpt](UsrAdd,UsrEdit,DateAdd,DateEdit)
VALUES(@UsrAdd,@UsrEdit,@DateAdd,@DateEdit)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Rcpt_Select]
(
@RcptId int
)
AS
BEGIN
SELECT * FROM [dbo].[Rcpt]
WHERE RcptId=@RcptId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Rcpt_Update]
(
@RcptId int,
@UsrAdd int,
@UsrEdit int,
@DateAdd datetime,
@DateEdit datetime
)
AS 
BEGIN 
UPDATE [dbo].[Rcpt]
SET
UsrAdd=@UsrAdd,
UsrEdit=@UsrEdit,
DateAdd=@DateAdd,
DateEdit=@DateEdit
WHERE RcptId=@RcptId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuy_Delete]
(
@RcptBuyId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuy]
WHERE RcptBuyId=@RcptBuyId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUY****/

CREATE PROCEDURE [dbo].[sp_RcptBuy_Insert]
(
@RcptBuyId int,
@CusId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuy](RcptBuyId,CusId)
VALUES(@RcptBuyId,@CusId)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuy_Select]
(
@RcptBuyId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuy]
WHERE RcptBuyId=@RcptBuyId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuy_Update]
(
@RcptBuyId int,
@CusId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuy]
SET
RcptBuyId=@RcptBuyId,
CusId=@CusId
WHERE RcptBuyId=@RcptBuyId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Delete]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuyDet]
WHERE RcptBuyId=@RcptBuyId AND ShpId=@ShpId AND ProId=@ProId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUYDET****/

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Insert]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuyDet](RcptBuyId,ShpId,ProId)
VALUES(@RcptBuyId,@ShpId,@ProId)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Select]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuyDet]
WHERE RcptBuyId=@RcptBuyId AND ShpId=@ShpId AND ProId=@ProId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Update]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuyDet]
SET
RcptBuyId=@RcptBuyId,
ShpId=@ShpId,
ProId=@ProId
WHERE RcptBuyId=@RcptBuyId AND ShpId=@ShpId AND ProId=@ProId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Delete]
(
@StaId int,
@RcptBuyId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuySta]
WHERE StaId=@StaId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUYSTA****/

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Insert]
(
@StaId int,
@RcptBuyId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuySta](StaId,RcptBuyId)
VALUES(@StaId,@RcptBuyId)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Select]
(
@StaId int,
@RcptBuyId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuySta]
WHERE StaId=@StaId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Update]
(
@StaId int,
@RcptBuyId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuySta]
SET
RcptBuyId=@RcptBuyId
WHERE StaId=@StaId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaDet_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaDet_Delete]
(
@StaId int,
@StepId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuyStaDet]
WHERE StaId=@StaId AND StepId=@StepId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaDet_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaDet_Select]
(
@StaId int,
@StepId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuyStaDet]
WHERE StaId=@StaId AND StepId=@StepId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Delete]
(
@StepId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuyStaStep]
WHERE StepId=@StepId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUYSTASTEP****/

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Insert]
(
@StepId int,
@StepCont nvarchar(255),
@StepOrder int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuyStaStep](StepId,StepCont,StepOrder)
VALUES(@StepId,@StepCont,@StepOrder)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Select]
(
@StepId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuyStaStep]
WHERE StepId=@StepId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Update]
(
@StepId int,
@StepCont nvarchar(255),
@StepOrder int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuyStaStep]
SET
StepId=@StepId,
StepCont=@StepCont,
StepOrder=@StepOrder
WHERE StepId=@StepId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptSub_Delete]
(
@RcptSubId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptSub]
WHERE RcptSubId=@RcptSubId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTSUB****/

CREATE PROCEDURE [dbo].[sp_RcptSub_Insert]
(
@RcptSubId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptSub](RcptSubId)
VALUES(@RcptSubId)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptSub_Select]
(
@RcptSubId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptSub]
WHERE RcptSubId=@RcptSubId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptSub_Update]
(
@RcptSubId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptSub]
SET
RcptSubId=@RcptSubId
WHERE RcptSubId=@RcptSubId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Shp_Delete]
(
@ShpId int
)
AS
BEGIN
DELETE FROM [dbo].[Shp]
WHERE ShpId=@ShpId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE SHP****/

CREATE PROCEDURE [dbo].[sp_Shp_Insert]
(
@ShpId int,
@MerId int,
@ShpName nvarchar(255),
@DateStart datetime,
@Active bit
)
AS
BEGIN
INSERT INTO [dbo].[Shp](ShpId,MerId,ShpName,DateStart,Active)
VALUES(@ShpId,@MerId,@ShpName,@DateStart,@Active)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Shp_Select]
(
@ShpId int
)
AS
BEGIN
SELECT * FROM [dbo].[Shp]
WHERE ShpId=@ShpId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Shp_Update]
(
@ShpId int,
@MerId int,
@ShpName nvarchar(255),
@DateStart datetime,
@Active bit
)
AS 
BEGIN 
UPDATE [dbo].[Shp]
SET
MerId=@MerId,
ShpName=@ShpName,
DateStart=@DateStart,
Active=@Active
WHERE ShpId=@ShpId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sub_Delete]
(
@SubId int
)
AS
BEGIN
DELETE FROM [dbo].[Sub]
WHERE SubId=@SubId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE SUB****/

CREATE PROCEDURE [dbo].[sp_Sub_Insert]
(
@SubId int,
@SubContent nvarchar(255),
@DurDay int,
@Price nvarchar(225)
)
AS
BEGIN
INSERT INTO [dbo].[Sub](SubId,SubContent,DurDay,Price)
VALUES(@SubId,@SubContent,@DurDay,@Price)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sub_Select]
(
@SubId int
)
AS
BEGIN
SELECT * FROM [dbo].[Sub]
WHERE SubId=@SubId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sub_Update]
(
@SubId int,
@SubContent nvarchar(255),
@DurDay int,
@Price nvarchar(225)
)
AS 
BEGIN 
UPDATE [dbo].[Sub]
SET
SubContent=@SubContent,
DurDay=@DurDay,
Price=@Price
WHERE SubId=@SubId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SubDet_Delete]
(
@SubId int,
@MerId int
)
AS
BEGIN
DELETE FROM [dbo].[SubDet]
WHERE SubId=@SubId AND MerId=@MerId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE SUBDET****/

CREATE PROCEDURE [dbo].[sp_SubDet_Insert]
(
@SubId int,
@MerId int,
@DateStart datetime,
@DateEnd datetime
)
AS
BEGIN
INSERT INTO [dbo].[SubDet](SubId,MerId,DateStart,DateEnd)
VALUES(@SubId,@MerId,@DateStart,@DateEnd)
END









GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SubDet_Select]
(
@SubId int,
@MerId int
)
AS
BEGIN
SELECT * FROM [dbo].[SubDet]
WHERE SubId=@SubId AND MerId=@MerId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SubDet_Update]
(
@SubId int,
@MerId int,
@DateStart datetime,
@DateEnd datetime
)
AS 
BEGIN 
UPDATE [dbo].[SubDet]
SET
SubId=@SubId,
MerId=@MerId,
DateStart=@DateStart,
DateEnd=@DateEnd
WHERE SubId=@SubId AND MerId=@MerId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Usr_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usr_Delete]
(
@UsrId int
)
AS
BEGIN
DELETE FROM [dbo].[Usr]
WHERE UsrId=@UsrId
END









GO
/****** Object:  StoredProcedure [dbo].[sp_Usr_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usr_Select]
(
@UsrId int
)
AS
BEGIN
SELECT * FROM [dbo].[Usr]
WHERE UsrId=@UsrId
END









GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Delete] 
    @WebId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[WebInfo]
	WHERE  [WebId] = @WebId

	COMMIT









GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Insert] 
    @WebId int,
    @Name nvarchar(255) = NULL,
    @Address nvarchar(255) = NULL,
    @Email varchar(255) = NULL,
    @Phone varchar(255) = NULL,
    @WorkTime nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[WebInfo] ([WebId], [Name], [Address], [Email], [Phone], [WorkTime])
	SELECT @WebId, @Name, @Address, @Email, @Phone, @WorkTime
	
	-- Begin Return Select <- do not remove
	SELECT [WebId], [Name], [Address], [Email], [Phone], [WorkTime]
	FROM   [dbo].[WebInfo]
	WHERE  [WebId] = @WebId
	-- End Return Select <- do not remove
               
	COMMIT









GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Select] 
    @WebId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [WebId], [Name], [Address], [Email], [Phone], [WorkTime] 
	FROM   [dbo].[WebInfo] 
	WHERE  ([WebId] = @WebId OR @WebId IS NULL) 

	COMMIT









GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Update] 
    @WebId int,
    @Name nvarchar(255) = NULL,
    @Address nvarchar(255) = NULL,
    @Email varchar(255) = NULL,
    @Phone varchar(255) = NULL,
    @WorkTime nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[WebInfo]
	SET    [Name] = @Name, [Address] = @Address, [Email] = @Email, [Phone] = @Phone, [WorkTime] = @WorkTime
	WHERE  [WebId] = @WebId
	
	-- Begin Return Select <- do not remove
	SELECT [WebId], [Name], [Address], [Email], [Phone], [WorkTime]
	FROM   [dbo].[WebInfo]
	WHERE  [WebId] = @WebId	
	-- End Return Select <- do not remove

	COMMIT









GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Delete]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Delete] 
    @id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[WebSlide]
	WHERE  [id] = @id

	COMMIT









GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Insert]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Insert] 
    @id int,
    @WebId int = NULL,
    @Img nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[WebSlide] ([id], [WebId], [Img])
	SELECT @id, @WebId, @Img
	
	-- Begin Return Select <- do not remove
	SELECT [id], [WebId], [Img]
	FROM   [dbo].[WebSlide]
	WHERE  [id] = @id
	-- End Return Select <- do not remove
               
	COMMIT









GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Select]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Select] 
    @id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [id], [WebId], [Img] 
	FROM   [dbo].[WebSlide] 
	WHERE  ([id] = @id OR @id IS NULL) 

	COMMIT









GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Update]    Script Date: 12/3/2019 11:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Update] 
    @id int,
    @WebId int = NULL,
    @Img nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[WebSlide]
	SET    [WebId] = @WebId, [Img] = @Img
	WHERE  [id] = @id
	
	-- Begin Return Select <- do not remove
	SELECT [id], [WebId], [Img]
	FROM   [dbo].[WebSlide]
	WHERE  [id] = @id	
	-- End Return Select <- do not remove

	COMMIT









GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rcpt', @level2type=N'COLUMN',@level2name=N'RcptId'
GO
