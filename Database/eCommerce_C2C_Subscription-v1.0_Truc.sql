USE [eCommerce_C2C_Subscription_Truc]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pro]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pro](
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NULL,
	[BrandId] [int] NULL,
	[Unit] [varchar](255) NOT NULL,
	[ProName] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[Active] [bit] NOT NULL,
	[Price] [varchar](255) NULL,
	[PriceAfter] [varchar](255) NULL,
	[Stock] [int] NULL,
	[DateAdd] [datetime] NOT NULL,
	[DateEdit] [datetime] NOT NULL,
 CONSTRAINT [Pk_SanPham_Id] PRIMARY KEY CLUSTERED 
(
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProCat]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCat](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](255) NULL,
	[Active] [bit] NULL,
	[DateAdd] [datetime] NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_ProductsCategories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rcpt]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rcpt](
	[RcptId] [int] IDENTITY(1,1) NOT NULL,
	[DateAdd] [datetime] NOT NULL,
	[DateEdit] [datetime] NOT NULL,
 CONSTRAINT [Pk_HoaDon_Id] PRIMARY KEY CLUSTERED 
(
	[RcptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuy]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuy](
	[RcptBuyId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ReceiptBuys] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyDet]    Script Date: 3/20/2019 2:21:00 PM ******/
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
/****** Object:  Table [dbo].[RcptBuySta]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuySta](
	[StateId] [int] NOT NULL,
	[RcptBuyId] [int] NULL,
 CONSTRAINT [PK_ReceiptsBuysStates] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyStaDet]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyStaDet](
	[StaId] [int] NOT NULL,
	[StepId] [int] NOT NULL,
	[IsDone] [bit] NULL,
 CONSTRAINT [PK_ReceiptsBuysStatesDetails] PRIMARY KEY CLUSTERED 
(
	[StaId] ASC,
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyStaStep]    Script Date: 3/20/2019 2:21:00 PM ******/
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
/****** Object:  Table [dbo].[RcptSub]    Script Date: 3/20/2019 2:21:00 PM ******/
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
/****** Object:  Table [dbo].[RcptSubDet]    Script Date: 3/20/2019 2:21:00 PM ******/
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
/****** Object:  Table [dbo].[Sub]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub](
	[SubId] [int] NOT NULL,
	[SubContent] [nvarchar](255) NULL,
	[DurDay] [int] NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubDet]    Script Date: 3/20/2019 2:21:00 PM ******/
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
/****** Object:  Table [dbo].[Usr]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usr](
	[UsrId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Active] [bit] NULL,
	[Email] [varchar](255) NULL,
	[UserName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[DateAdd] [datetime] NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsrCus]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsrCus](
	[CusId] [int] NOT NULL,
 CONSTRAINT [PK_UsersCustomers] PRIMARY KEY CLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsrCusCart]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsrCusCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CusId] [int] NULL,
	[IpAddress] [varchar](255) NULL,
 CONSTRAINT [PK_UsersCustomersCarts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsrCusCartDet]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsrCusCartDet](
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
/****** Object:  Table [dbo].[UsrMer]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsrMer](
	[MerId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsrMerShp]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsrMerShp](
	[ShpId] [int] IDENTITY(1,1) NOT NULL,
	[MerId] [int] NULL,
	[ShpName] [nvarchar](255) NULL,
	[DateStart] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_UsersMerchantsShops] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsrMerShpPro]    Script Date: 3/20/2019 2:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsrMerShpPro](
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ProQuantity] [int] NULL,
	[IsOutOfStock] [bit] NULL,
 CONSTRAINT [PK_ProductQuantity] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (1, N'Adidas')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (2, N'Nike')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (3, N'Vans')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (4, N'Reebook')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[ProCat] ON 

INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (1, N'Male Sneakers', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (2, N'Female Sneakers', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (3, N'Casual', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (4, N'Sport', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit]) VALUES (5, N'Trending', 1, CAST(0x0000AA1600E2115F AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ProCat] OFF
/****** Object:  Index [IX_ReceiptsBuysStates]    Script Date: 3/20/2019 2:21:00 PM ******/
ALTER TABLE [dbo].[RcptBuySta] ADD  CONSTRAINT [IX_ReceiptsBuysStates] UNIQUE NONCLUSTERED 
(
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersCustomersCarts]    Script Date: 3/20/2019 2:21:00 PM ******/
ALTER TABLE [dbo].[UsrCusCart] ADD  CONSTRAINT [IX_UsersCustomersCarts] UNIQUE NONCLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersMerchantsShops]    Script Date: 3/20/2019 2:21:00 PM ******/
ALTER TABLE [dbo].[UsrMerShp] ADD  CONSTRAINT [IX_UsersMerchantsShops] UNIQUE NONCLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Products_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Products_PriceAfter]  DEFAULT ((0)) FOR [PriceAfter]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Products_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductsCategories] FOREIGN KEY([CatId])
REFERENCES [dbo].[ProCat] ([CatId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_Products_ProductsCategories]
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
REFERENCES [dbo].[UsrMerShpPro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[RcptBuyDet] CHECK CONSTRAINT [FK_ReceiptsBuysDetails_UsersMerchantsShopsProducts]
GO
ALTER TABLE [dbo].[RcptBuySta]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysStates_ReceiptsBuys] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[RcptBuy] ([RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuySta] CHECK CONSTRAINT [FK_ReceiptsBuysStates_ReceiptsBuys]
GO
ALTER TABLE [dbo].[RcptBuyStaDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStates] FOREIGN KEY([StaId])
REFERENCES [dbo].[RcptBuySta] ([StateId])
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
ALTER TABLE [dbo].[SubDet]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionsDetails_Subscriptions] FOREIGN KEY([SubId])
REFERENCES [dbo].[Sub] ([SubId])
GO
ALTER TABLE [dbo].[SubDet] CHECK CONSTRAINT [FK_SubscriptionsDetails_Subscriptions]
GO
ALTER TABLE [dbo].[SubDet]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionsDetails_UsersMerchants] FOREIGN KEY([MerId])
REFERENCES [dbo].[UsrMer] ([MerId])
GO
ALTER TABLE [dbo].[SubDet] CHECK CONSTRAINT [FK_SubscriptionsDetails_UsersMerchants]
GO
ALTER TABLE [dbo].[UsrCus]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomers_Users] FOREIGN KEY([CusId])
REFERENCES [dbo].[Usr] ([UsrId])
GO
ALTER TABLE [dbo].[UsrCus] CHECK CONSTRAINT [FK_UsersCustomers_Users]
GO
ALTER TABLE [dbo].[UsrCusCart]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers] FOREIGN KEY([CusId])
REFERENCES [dbo].[UsrCus] ([CusId])
GO
ALTER TABLE [dbo].[UsrCusCart] CHECK CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers]
GO
ALTER TABLE [dbo].[UsrCusCartDet]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts] FOREIGN KEY([CartId])
REFERENCES [dbo].[UsrCusCart] ([CartId])
GO
ALTER TABLE [dbo].[UsrCusCartDet] CHECK CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts]
GO
ALTER TABLE [dbo].[UsrCusCartDet]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCartsDetails_UsersMerchantsShopsProducts] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[UsrMerShpPro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[UsrCusCartDet] CHECK CONSTRAINT [FK_UsersCustomersCartsDetails_UsersMerchantsShopsProducts]
GO
ALTER TABLE [dbo].[UsrMer]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchants_Users] FOREIGN KEY([MerId])
REFERENCES [dbo].[Usr] ([UsrId])
GO
ALTER TABLE [dbo].[UsrMer] CHECK CONSTRAINT [FK_UsersMerchants_Users]
GO
ALTER TABLE [dbo].[UsrMer]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchants_UsersMerchantsShops] FOREIGN KEY([MerId])
REFERENCES [dbo].[UsrMerShp] ([MerId])
GO
ALTER TABLE [dbo].[UsrMer] CHECK CONSTRAINT [FK_UsersMerchants_UsersMerchantsShops]
GO
ALTER TABLE [dbo].[UsrMerShpPro]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchantsShopsProducts_Products] FOREIGN KEY([ProId])
REFERENCES [dbo].[Pro] ([ProId])
GO
ALTER TABLE [dbo].[UsrMerShpPro] CHECK CONSTRAINT [FK_UsersMerchantsShopsProducts_Products]
GO
ALTER TABLE [dbo].[UsrMerShpPro]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchantsShopsProducts_UsersMerchantsShops] FOREIGN KEY([ShpId])
REFERENCES [dbo].[UsrMerShp] ([ShpId])
GO
ALTER TABLE [dbo].[UsrMerShpPro] CHECK CONSTRAINT [FK_UsersMerchantsShopsProducts_UsersMerchantsShops]
GO
