USE [eCommerce_C2C_Subscription]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 3/17/2019 4:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [int] NOT NULL,
	[Ten] [varchar](255) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_ChucVu_Id] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] NOT NULL,
	[Ten] [varchar](255) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_DanhMuc_Id] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiamGia]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiamGia](
	[MaGiamGia] [int] NOT NULL,
	[Ma] [varchar](255) NOT NULL,
	[MoTa] [text] NULL,
	[KichHoat] [bit] NULL,
	[GiaTri] [numeric](18, 0) NULL,
	[NhieuChiNhanh] [bit] NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [pk_coupons] PRIMARY KEY CLUSTERED 
(
	[MaGiamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[MaGiaoDich] [int] NOT NULL,
	[Ma] [varchar](255) NULL,
	[MaHoaDon] [int] NOT NULL,
	[NgayGiaoDich] [datetime] NULL,
	[processor] [varchar](255) NOT NULL,
	[processor_trans_id] [varchar](255) NOT NULL,
	[amount] [numeric](18, 0) NOT NULL,
	[cc_num] [varchar](255) NULL,
	[cc_type] [varchar](255) NULL,
	[response] [text] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_GiaoDich_MaGiaoDich] PRIMARY KEY CLUSTERED 
(
	[MaGiaoDich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] NOT NULL,
	[NgayLap] [date] NOT NULL,
	[Tong] [numeric](18, 0) NOT NULL,
	[MaGiamGia] [int] NULL,
	[MaPhien] [varchar](255) NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_HoaDon_Id] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDonSanPham]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDonSanPham](
	[MaHoaDonSP] [int] NOT NULL,
	[MaHoaDon] [int] NULL,
	[DonVi] [varchar](255) NOT NULL,
	[Ten] [varchar](255) NOT NULL,
	[MoTa] [text] NULL,
	[Gia] [numeric](18, 0) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[TongCon] [numeric](18, 0) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [pk_order_products] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_LoaiSanPham_MaLoai_MaSanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC,
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Ten] [varchar](255) NOT NULL,
	[HoLot] [varchar](255) NOT NULL,
	[KichHoat] [bit] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_NguoiDung_Id] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NguoiDung_ChucVu]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung_ChucVu](
	[MaNguoiDung] [int] NOT NULL,
	[MaChucVu] [int] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_NguoiDung_ChucVu_Id] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC,
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phien]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phien](
	[MaPhien] [varchar](255) NOT NULL,
	[DuLieu] [text] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_Phien_MaPhien] PRIMARY KEY CLUSTERED 
(
	[MaPhien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] NOT NULL,
	[DonVi] [varchar](255) NOT NULL,
	[Ten] [varchar](255) NOT NULL,
	[MoTa] [text] NULL,
	[Id_TrangThai] [int] NOT NULL,
	[Gia] [numeric](18, 0) NULL,
	[GiamGia] [numeric](18, 0) NULL,
	[SoLuong] [int] NULL,
	[Thue] [bit] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_SanPham_Id] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[The]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[The](
	[MaThe] [int] NOT NULL,
	[Ten] [varchar](255) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_The_Id] PRIMARY KEY CLUSTERED 
(
	[MaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheSanPham]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheSanPham](
	[MaSanPham] [int] NOT NULL,
	[MaThe] [int] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [pk_product_tags] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC,
	[MaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrangThai_SanPham]    Script Date: 3/17/2019 4:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrangThai_SanPham](
	[MaTrangThai] [int] NOT NULL,
	[Ten] [varchar](255) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [Pk_TrangThai_SanPham_MaTrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[GiamGia] ADD  DEFAULT ((1)) FOR [KichHoat]
GO
ALTER TABLE [dbo].[GiamGia] ADD  DEFAULT ((0)) FOR [NhieuChiNhanh]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  DEFAULT ((1)) FOR [KichHoat]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [Gia]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [Thue]
GO
