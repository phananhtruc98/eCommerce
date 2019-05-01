USE [ECOMM_C2C_SUB]
GO
/****** Object:  User [truc]    Script Date: 01/05/2019 10:29:25 AM ******/
CREATE USER [truc] FOR LOGIN [truc] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [truc]
GO
ALTER ROLE [db_datareader] ADD MEMBER [truc]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [truc]
GO
/****** Object:  Table [dbo].[Adv]    Script Date: 01/05/2019 10:29:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adv](
	[AdvId] [int] IDENTITY(1,1) NOT NULL,
	[AdvName] [nvarchar](50) NULL,
	[Desc] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Position] [varchar](255) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Adv] PRIMARY KEY CLUSTERED 
(
	[AdvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[CartDet]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Config]    Script Date: 01/05/2019 10:29:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ConfigId] [int] NOT NULL,
	[ConfigName] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[Desc] [nvarchar](255) NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 01/05/2019 10:29:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NULL,
	[Discount] [int] NULL,
	[Type] [varchar](10) NULL,
	[FreeShip] [bit] NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Indefinite] [bit] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Coupon_1] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponDet]    Script Date: 01/05/2019 10:29:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponDet](
	[CouponId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cus]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Mer]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Mstr]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[MstrDet]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[MstrRole]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Pro]    Script Date: 01/05/2019 10:29:26 AM ******/
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
	[Desc] [text] NULL,
	[DescShort] [text] NULL,
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
/****** Object:  Table [dbo].[ProBrand]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[ProCat]    Script Date: 01/05/2019 10:29:26 AM ******/
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
	[Img] [varchar](255) NULL,
 CONSTRAINT [PK_ProductsCategories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProColor]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[ProDet]    Script Date: 01/05/2019 10:29:26 AM ******/
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
 CONSTRAINT [PK_ProDet] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProSize]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[ProSlide]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[ProSlideImg]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Rcpt]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[RcptBuy]    Script Date: 01/05/2019 10:29:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuy](
	[RcptBuyId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[CusId] [int] NOT NULL,
 CONSTRAINT [PK_RcptBuy_1] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RcptBuyDet]    Script Date: 01/05/2019 10:29:26 AM ******/
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
	[Quantity] [int] NULL,
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
/****** Object:  Table [dbo].[RcptBuySta]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[RcptBuyStaDet]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[RcptBuyStaStep]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[RcptSub]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[RcptSubDet]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Shp]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Sub]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[Usr]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[UsrAct]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[WebInfo]    Script Date: 01/05/2019 10:29:26 AM ******/
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
/****** Object:  Table [dbo].[WebSlide]    Script Date: 01/05/2019 10:29:26 AM ******/
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

INSERT [dbo].[Cart] ([CartId], [CusId], [IpAddress]) VALUES (1, 3, N'192.168.1.1')
INSERT [dbo].[Cart] ([CartId], [CusId], [IpAddress]) VALUES (2, 16, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[CartDet] ([CartId], [ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (1, 1, 1, 1, 1, 3)
INSERT [dbo].[CartDet] ([CartId], [ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (1, 1, 1, 1, 2, 3)
INSERT [dbo].[CartDet] ([CartId], [ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (2, 1, 1, 1, 1, 1)
INSERT [dbo].[CartDet] ([CartId], [ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (2, 1, 1, 1, 2, 1)
INSERT [dbo].[Cus] ([CusId]) VALUES (2)
INSERT [dbo].[Cus] ([CusId]) VALUES (3)
INSERT [dbo].[Cus] ([CusId]) VALUES (11)
INSERT [dbo].[Cus] ([CusId]) VALUES (13)
INSERT [dbo].[Cus] ([CusId]) VALUES (15)
INSERT [dbo].[Cus] ([CusId]) VALUES (16)
INSERT [dbo].[Mer] ([MerId]) VALUES (3)
INSERT [dbo].[Mer] ([MerId]) VALUES (12)
INSERT [dbo].[Mstr] ([MstrId]) VALUES (1)
INSERT [dbo].[Mstr] ([MstrId]) VALUES (3)
INSERT [dbo].[Mstr] ([MstrId]) VALUES (4)
INSERT [dbo].[Mstr] ([MstrId]) VALUES (5)
INSERT [dbo].[Mstr] ([MstrId]) VALUES (11)
INSERT [dbo].[MstrDet] ([MstrId], [RoleId], [AddDate], [AddBy]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[MstrDet] ([MstrId], [RoleId], [AddDate], [AddBy]) VALUES (1, 3, NULL, NULL)
INSERT [dbo].[MstrDet] ([MstrId], [RoleId], [AddDate], [AddBy]) VALUES (4, 2, NULL, NULL)
INSERT [dbo].[MstrDet] ([MstrId], [RoleId], [AddDate], [AddBy]) VALUES (5, 3, NULL, NULL)
INSERT [dbo].[MstrDet] ([MstrId], [RoleId], [AddDate], [AddBy]) VALUES (11, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstrRole] ON 

INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (2, N'Thủ quỹ')
INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (3, N'Bảo mật viên')
SET IDENTITY_INSERT [dbo].[MstrRole] OFF
SET IDENTITY_INSERT [dbo].[Pro] ON 

INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (1, 1, 1, 1, N'UltraBoost 19', N'1.jpg', NULL, NULL, N'20', N'0', 1, NULL, NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (1, 7, 2, 2, N'Nike ACG Wildwood', N'2.jpg', NULL, NULL, N'3500000', N'0', 1, NULL, NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (1, 8, 3, 3, N'WOMEN''S WARD LOW TOP SNEAKER', N'3.jpg', NULL, NULL, N'2000000', N'0', 1, CAST(N'2019-03-22T12:56:15.387' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (1, 16, 2, 2, N'Bitis Hunter X', NULL, NULL, NULL, N'40000', N'0', NULL, CAST(N'2019-04-15T21:17:39.100' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (2, 9, 1, 1, N'UltraBoost 20', N'1.jpg', NULL, NULL, N'3900000', N'0', 1, CAST(N'2019-04-14T10:16:29.720' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (2, 12, 2, 2, N'Nike ACG Wild', NULL, NULL, NULL, N'4000000', N'0', 1, CAST(N'2019-04-14T10:18:43.557' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (2, 19, 2, 2, N'Nike ACG Wild 1', NULL, NULL, NULL, N'4000000', N'0', 1, CAST(N'2019-04-14T10:18:43.557' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (2, 20, 2, 2, N'Nike ACG Wild 2', NULL, NULL, NULL, N'4000000', N'0', 1, CAST(N'2019-04-14T10:18:43.557' AS DateTime), NULL)
INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [DateAdd], [DateEdit]) VALUES (2, 23, 1, 1, N'1', NULL, NULL, NULL, N'0', N'0', NULL, CAST(N'2019-04-20T23:50:05.067' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Pro] OFF
SET IDENTITY_INSERT [dbo].[ProBrand] ON 

INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (1, N'Adidas', N'adidas.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (2, N'Nike', N'nike.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (3, N'Vans', N'vans.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (4, N'Reebok', N'reebok.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (16, N'Asics', N'asics.png')
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (17, N'New Balance', N'newbalance.png')
SET IDENTITY_INSERT [dbo].[ProBrand] OFF
SET IDENTITY_INSERT [dbo].[ProCat] ON 

INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (1, N'Male Sneakers', 1, CAST(N'2019-03-20T13:43:05.277' AS DateTime), NULL, N'1.png')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (2, N'Female Sneakers', 1, CAST(N'2019-03-20T13:43:05.277' AS DateTime), NULL, N'2.jpg')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (3, N'Casual', 1, CAST(N'2019-03-20T13:43:05.277' AS DateTime), NULL, N'3.jpg')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (4, N'Sport', 1, CAST(N'2019-03-20T13:43:05.277' AS DateTime), NULL, N'4.jpg')
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (5, N'Trending', 1, CAST(N'2019-03-20T13:43:05.277' AS DateTime), NULL, N'5.jpg')
SET IDENTITY_INSERT [dbo].[ProCat] OFF
SET IDENTITY_INSERT [dbo].[ProColor] ON 

INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (1, N'Đen', N'1.jpg', N'636c70')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (2, N'Trắng', N'2.jpg', N'3d484d')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (3, N'Đỏ', N'3.jpg', N'ffc3a0')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (4, N'Xanh', N'4.jpg', N'98dbc6')
SET IDENTITY_INSERT [dbo].[ProColor] OFF
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (1, 1, 1, 1, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (1, 1, 1, 2, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (1, 7, 2, 2, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (2, 9, 1, 1, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty]) VALUES (2, 23, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProSize] ON 

INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (1, N'38', N'1.jpg')
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (2, N'39', N'1.jpg')
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (3, N'40', N'1.jpg')
SET IDENTITY_INSERT [dbo].[ProSize] OFF
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 1, 1, N'1.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (2, 1, 1, N'2.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (3, 1, 1, N'3.jpg')
SET IDENTITY_INSERT [dbo].[Rcpt] ON 

INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (2, 1, NULL, CAST(N'2019-03-20T17:19:14.993' AS DateTime), CAST(N'2019-03-20T17:19:14.993' AS DateTime), NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (3, 1, NULL, CAST(N'2019-03-20T23:53:57.263' AS DateTime), CAST(N'2019-03-20T17:19:14.993' AS DateTime), NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (4, 1, NULL, CAST(N'2019-03-20T23:54:16.357' AS DateTime), CAST(N'2019-03-20T17:19:14.993' AS DateTime), NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (5, 1, NULL, CAST(N'2019-04-05T16:31:08.363' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (6, 1, NULL, CAST(N'2019-04-11T13:54:56.143' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (7, 1, NULL, CAST(N'2019-04-13T23:59:10.747' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (8, 1, NULL, CAST(N'2019-04-14T00:00:17.027' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (9, 1, NULL, CAST(N'2019-04-14T00:26:12.727' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (10, 1, NULL, CAST(N'2019-04-14T00:38:30.107' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (11, 1, NULL, CAST(N'2019-04-14T08:15:38.330' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (12, 1, NULL, CAST(N'2019-04-14T08:21:09.547' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (13, 1, NULL, CAST(N'2019-04-14T08:27:17.987' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (14, 1, NULL, CAST(N'2019-04-14T08:37:52.123' AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (16, 1, 1, CAST(N'2019-04-14T08:46:27.283' AS DateTime), CAST(N'2019-04-14T08:47:58.647' AS DateTime), NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (17, 3, NULL, CAST(N'2019-04-21T15:15:20.107' AS DateTime), NULL, 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (18, 12, NULL, CAST(N'2019-04-21T15:28:36.563' AS DateTime), NULL, 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (19, 3, NULL, CAST(N'2019-04-22T21:25:21.853' AS DateTime), NULL, 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (20, 3, NULL, CAST(N'2019-04-22T21:26:38.270' AS DateTime), NULL, 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (21, 3, NULL, CAST(N'2019-04-22T22:11:38.433' AS DateTime), NULL, 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (22, 12, NULL, CAST(N'2019-04-22T22:11:51.267' AS DateTime), NULL, 0)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (23, 3, NULL, CAST(N'2019-04-22T22:34:14.997' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Rcpt] OFF
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (2, 1, 2)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (16, 2, 11)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (17, 1, 16)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (18, 2, 16)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (19, 1, 16)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (20, 1, 16)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (21, 1, 16)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (22, 2, 16)
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId]) VALUES (23, 1, 16)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (2, 1, 1, 1, 1, NULL, 4, 3)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (16, 2, 23, 1, 1, N'Tuyet', 5, 3)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (17, 1, 1, 1, 1, NULL, NULL, 6)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (17, 1, 7, 2, 2, NULL, NULL, 3)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (18, 2, 23, 1, 1, NULL, NULL, 1)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (19, 1, 7, 2, 2, NULL, NULL, 4)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (20, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (20, 1, 7, 2, 2, NULL, NULL, 1)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (21, 1, 1, 1, 1, NULL, NULL, 1)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (22, 2, 23, 1, 1, NULL, NULL, 1)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [Quantity]) VALUES (23, 1, 1, 1, 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[RcptBuySta] ON 

INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (1, 2)
INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (2, 21)
INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (3, 22)
INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (4, 23)
SET IDENTITY_INSERT [dbo].[RcptBuySta] OFF
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 1, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 2, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 3, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 4, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 5, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 6, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 7, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (2, 21, 1, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (3, 22, 1, NULL)
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (4, 23, 1, NULL)
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
INSERT [dbo].[RcptSub] ([RcptSubId], [MerId], [Status]) VALUES (5, 12, 1)
INSERT [dbo].[RcptSub] ([RcptSubId], [MerId], [Status]) VALUES (6, 12, 1)
INSERT [dbo].[RcptSub] ([RcptSubId], [MerId], [Status]) VALUES (7, 12, 1)
INSERT [dbo].[RcptSub] ([RcptSubId], [MerId], [Status]) VALUES (8, 12, 1)
INSERT [dbo].[RcptSub] ([RcptSubId], [MerId], [Status]) VALUES (9, 12, 1)
INSERT [dbo].[RcptSubDet] ([RcptSubId], [SubId], [Quantity]) VALUES (5, 1, 2)
INSERT [dbo].[RcptSubDet] ([RcptSubId], [SubId], [Quantity]) VALUES (5, 2, 1)
INSERT [dbo].[RcptSubDet] ([RcptSubId], [SubId], [Quantity]) VALUES (5, 3, 1)
INSERT [dbo].[RcptSubDet] ([RcptSubId], [SubId], [Quantity]) VALUES (6, 1, 5)
SET IDENTITY_INSERT [dbo].[Shp] ON 

INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active]) VALUES (1, 3, N'KICKZ', CAST(N'2019-03-20T16:15:50.350' AS DateTime), 1)
INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active]) VALUES (2, 12, N'RIZZ', CAST(N'2019-04-14T10:15:44.043' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Shp] OFF
SET IDENTITY_INSERT [dbo].[Sub] ON 

INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (1, N'Tuần', 7, N'300000')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (2, N'Tháng', 30, N'1000000')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (3, N'Năm', 300, N'30000000')
SET IDENTITY_INSERT [dbo].[Sub] OFF
SET IDENTITY_INSERT [dbo].[Usr] ON 

INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (1, N'Nguyễn Doãn Hiện', NULL, N'doanhien', N'admin', 1, N'doanhien@gmail.com', N'273 An Dương Vương P7 Q6', N'0704569020', CAST(N'2019-03-20T16:15:50.350' AS DateTime), CAST(N'2019-03-20T16:15:50.350' AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (2, N'Phan Anh Trúc', N'1.jpg', N'anhtruc', N'123', 1, N'anhtruc@gmail.com', N'21 Lưu Xuân Tín P15 Q5', N'0967513425', CAST(N'2019-03-20T16:15:50.350' AS DateTime), CAST(N'2019-03-20T16:15:50.350' AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (3, N'Lê Hiển', NULL, N'2', N'2hE0JwNwzZA=', 1, N'toanhien@gmail.com', N'26 Nguyễn Trãi P1 Q5', N'0967513424', CAST(N'2019-03-20T16:15:50.350' AS DateTime), CAST(N'2019-03-20T16:15:50.350' AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (4, N'Mèo bi sọc', NULL, N'meobisoc', N'admin', 0, NULL, N'Dưới tủ', NULL, CAST(N'2019-03-22T12:45:49.373' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (5, N'Cá Bảy Màu Xào', NULL, N'cabaymau', N'admin', 1, NULL, N'Hồ cá', NULL, CAST(N'2019-03-22T12:47:48.927' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (11, N'1', NULL, N'1', N'f2TbDFld1mw=', 0, NULL, NULL, NULL, CAST(N'2019-03-26T17:30:58.133' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (12, N'DoanHien', NULL, N'123', N'fwwrnlUyVrc=', 0, NULL, NULL, NULL, CAST(N'2019-04-05T19:03:02.670' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (13, N'Anh Truc', NULL, N'anhtruckute', N'8fiyLiLvwu2O8kiA/5VgoQ==', 0, NULL, NULL, NULL, CAST(N'2019-04-05T19:07:42.083' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (14, N'11', NULL, N'11', N'2hE0JwNwzZA=', 0, NULL, NULL, NULL, CAST(N'2019-04-18T19:10:30.307' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (15, N'Ty', NULL, N'ty', N'2hE0JwNwzZA=', 0, NULL, NULL, NULL, CAST(N'2019-04-18T19:12:39.017' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (16, N'Hien', NULL, N'eq', N'2hE0JwNwzZA=', 0, NULL, NULL, NULL, CAST(N'2019-04-18T19:22:16.383' AS DateTime), NULL)
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (17, N'Truc', NULL, N'truc', N'fwwrnlUyVrc=', 1, NULL, NULL, NULL, CAST(N'2019-05-01T10:28:24.650' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Usr] OFF
SET IDENTITY_INSERT [dbo].[UsrAct] ON 

INSERT [dbo].[UsrAct] ([ActId], [UsrId], [ActCode], [IsAct]) VALUES (2, 11, N'2hE0JwNwzZA=', NULL)
INSERT [dbo].[UsrAct] ([ActId], [UsrId], [ActCode], [IsAct]) VALUES (3, 12, N'ExeJZTY+/h49fyNarU6KBw==', NULL)
INSERT [dbo].[UsrAct] ([ActId], [UsrId], [ActCode], [IsAct]) VALUES (4, 13, N'TYyYirnrNSKlcxT/XNzMig==', NULL)
INSERT [dbo].[UsrAct] ([ActId], [UsrId], [ActCode], [IsAct]) VALUES (5, 14, N'ZeL8V/Ri8RM=', NULL)
INSERT [dbo].[UsrAct] ([ActId], [UsrId], [ActCode], [IsAct]) VALUES (6, 15, N'Bv+zg0sVtvA=', NULL)
INSERT [dbo].[UsrAct] ([ActId], [UsrId], [ActCode], [IsAct]) VALUES (7, 16, N'LcsTjpX1E+g=', NULL)
SET IDENTITY_INSERT [dbo].[UsrAct] OFF
INSERT [dbo].[WebInfo] ([WebId], [Name], [Address], [Email], [Phone], [WorkTime]) VALUES (1, N'The Shoes', N'273 An Dương Vương', NULL, NULL, N'Hai-Sáu 10:00pm - 7:00pm')
SET IDENTITY_INSERT [dbo].[WebSlide] ON 

INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (1, 1, N'1.jpg', NULL, NULL, NULL)
INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (2, 1, N'2.jpeg', NULL, NULL, NULL)
INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (3, 1, N'3.jpeg', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[WebSlide] OFF
/****** Object:  Index [IX_UsersCustomersCarts]    Script Date: 01/05/2019 10:29:26 AM ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [IX_UsersCustomersCarts] UNIQUE NONCLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RcptStaStep]    Script Date: 01/05/2019 10:29:26 AM ******/
ALTER TABLE [dbo].[RcptBuyStaStep] ADD  CONSTRAINT [IX_RcptStaStep] UNIQUE NONCLUSTERED 
(
	[StepOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersMerchantsShops]    Script Date: 01/05/2019 10:29:26 AM ******/
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [IX_UsersMerchantsShops] UNIQUE NONCLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Usr_Login]    Script Date: 01/05/2019 10:29:26 AM ******/
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [IX_Usr_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsrAct]    Script Date: 01/05/2019 10:29:26 AM ******/
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [IX_UsrAct] UNIQUE NONCLUSTERED 
(
	[ActCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsrAct_1]    Script Date: 01/05/2019 10:29:26 AM ******/
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [IX_UsrAct_1] UNIQUE NONCLUSTERED 
(
	[UsrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartDet] ADD  CONSTRAINT [DF_CartDet_Qty]  DEFAULT ((1)) FOR [Qty]
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
ALTER TABLE [dbo].[CouponDet]  WITH CHECK ADD  CONSTRAINT [FK_CouponDet_Coupon] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[CouponDet] CHECK CONSTRAINT [FK_CouponDet_Coupon]
GO
ALTER TABLE [dbo].[CouponDet]  WITH CHECK ADD  CONSTRAINT [FK_CouponDet_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[CouponDet] CHECK CONSTRAINT [FK_CouponDet_Pro]
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
ALTER TABLE [dbo].[Mstr]  WITH CHECK ADD  CONSTRAINT [FK_Mstr_Usr] FOREIGN KEY([MstrId])
REFERENCES [dbo].[Usr] ([UsrId])
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rcpt', @level2type=N'COLUMN',@level2name=N'RcptId'
GO
