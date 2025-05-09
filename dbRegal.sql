USE [DATN_REGAL]
GO
/****** Object:  Table [dbo].[Anh]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSanPhamChiTiet] [int] NULL,
	[TenAnh] [varchar](300) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatLieu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenChatLieu] [nvarchar](100) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeGiay]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeGiay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDeGiay] [nvarchar](100) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKhachHang] [int] NULL,
	[TenDuong] [nvarchar](100) NOT NULL,
	[XaPhuong] [nvarchar](100) NOT NULL,
	[QuanHuyen] [nvarchar](100) NOT NULL,
	[TinhThanhPho] [nvarchar](100) NOT NULL,
	[TenNguoiNhan] [nvarchar](100) NULL,
	[SdtNguoiNhan] [varchar](30) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DotGiamGia]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DotGiamGia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GiaTriGiam] [int] NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKhachHang] [int] NULL,
	[IdSanPhamChiTiet] [int] NULL,
	[SoLuong] [smallint] NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdNhanVien] [int] NULL,
	[IdKhachHang] [int] NULL,
	[IdPhieuGiamGia] [int] NULL,
	[Mahoadon] [nvarchar](100) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TienGiam] [money] NULL,
	[TongTien] [money] NULL,
	[LoaiHoaDon] [bit] NULL,
	[PhiVanChuyen] [money] NULL,
	[NgayXacNhan] [datetime] NULL,
	[NgayVanChuyen] [datetime] NULL,
	[NgayNhanHang] [datetime] NULL,
	[NgayHoanThanh] [datetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdHoaDon] [int] NULL,
	[IdSanPhamChiTiet] [int] NOT NULL,
	[GiaSanPham] [money] NULL,
	[SoLuong] [smallint] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [varchar](50) NULL,
	[Anh] [varchar](300) NULL,
	[HoVaTen] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[SoDienThoai] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](300) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHangPhieuGiam]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHangPhieuGiam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKhachHang] [int] NULL,
	[IdPhieuGiamGia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KichCo]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KichCo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenKichCo] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuHoaDon]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuHoaDon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdHoaDon] [int] NULL,
	[IdNhanVien] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaMauSac] [varchar](50) NULL,
	[TenMauSac] [nvarchar](100) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [varchar](50) NULL,
	[Anh] [varchar](300) NULL,
	[HoVaTen] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[QueQuan] [nvarchar](200) NOT NULL,
	[Cccd] [varchar](20) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](300) NULL,
	[VaiTro] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuGiamGia]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuGiamGia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdHoaDon] [int] NULL,
	[MaCode] [nvarchar](100) NULL,
	[TenPhieu] [nvarchar](300) NOT NULL,
	[GiaTriGiamToiDa] [money] NULL,
	[GiaTriGiam] [int] NOT NULL,
	[DonToiThieu] [money] NULL,
	[SoLuong] [smallint] NULL,
	[LoaiPhieu] [bit] NULL,
	[KieuPhieu] [bit] NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdHoaDon] [int] NULL,
	[TenPhuongThuc] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TongTien] [money] NOT NULL,
	[MaGiaoDichVnPay] [varchar](200) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdThuongHieu] [int] NULL,
	[IdChatLieu] [int] NULL,
	[IdDeGiay] [int] NULL,
	[MaSanPham] [nvarchar](max) NULL,
	[TenSanPham] [nvarchar](300) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamChiTiet]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamChiTiet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSanPham] [int] NULL,
	[IdKichCo] [int] NULL,
	[IdMauSac] [int] NULL,
	[IdDotGiamGia] [int] NULL,
	[MaSanPhamChiTiet] [nvarchar](max) NULL,
	[QRCode] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [money] NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 5/5/2025 5:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](255) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[LanCapNhatCuoi] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Anh] ON 

INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742207850/j5dbjby9j13jp6bodp0k.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 3, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742207850/znvvscq9ivk2hyvj6xrk.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 4, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742208554/oaoisc2fkj3datamnkqz.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, 6, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742210689/hyzod1zksf7ijkrjimnc.webp', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, 7, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742208627/hr6b80jpd8qzsuq5wvlr.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, 8, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742209027/axz03ziajbue8d4rpbvl.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, 9, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742209214/czfxbob7ns72fjygdnah.webp', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, 10, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742207850/j5dbjby9j13jp6bodp0k.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, 11, N'https://res.cloudinary.com/daowhglcl/image/upload/v1741089703/akzjxurx1obwn7s2z9dz.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, 12, N'https://res.cloudinary.com/daowhglcl/image/upload/v1741089198/vrxkoudj7v9rudyo7x4g.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, 13, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742209430/vw7ezfnwdhfwkmqdsetp.webp', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, 14, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742209572/vjhltlkjhhcutbfbzpja.webp', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, 16, N'https://res.cloudinary.com/daowhglcl/image/upload/v1741089166/a9kuwjzvhkxgx1jy3gqb.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, 17, N'https://res.cloudinary.com/daowhglcl/image/upload/v1741089166/zj9agvnohvjr80pbuggy.jpg', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, 18, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742209816/iztbqwke9lclhdifnhsa.webp', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, 19, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742209878/crlvfvhglnbuilfxdydg.webp', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1083, 87, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742209214/czfxbob7ns72fjygdnah.webp', CAST(N'2025-02-24T18:20:39.293' AS DateTime), NULL, CAST(N'2025-02-24T18:20:39.293' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2087, 1092, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742207850/j5dbjby9j13jp6bodp0k.jpg', CAST(N'2025-02-27T19:07:29.827' AS DateTime), NULL, CAST(N'2025-02-27T19:07:29.827' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2093, 1096, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742208351/vjztjvlmg8nwywsko0v7.jpg', CAST(N'2025-02-27T21:32:17.620' AS DateTime), NULL, CAST(N'2025-02-27T21:32:17.620' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3093, 2096, N'http://res.cloudinary.com/daowhglcl/image/upload/v1741081434/pvhgjh4cofyyaxmsangs.jpg', CAST(N'2025-03-04T16:43:55.280' AS DateTime), NULL, CAST(N'2025-03-04T16:43:55.280' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3094, 2097, N'http://res.cloudinary.com/daowhglcl/image/upload/v1741081479/tbkz14nofvdsbva4qhvw.jpg', CAST(N'2025-03-04T16:44:39.687' AS DateTime), NULL, CAST(N'2025-03-04T16:44:39.687' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3095, 2098, N'http://res.cloudinary.com/daowhglcl/image/upload/v1741089366/n1pp106kqakihqavtfws.jpg', CAST(N'2025-03-04T18:56:06.770' AS DateTime), NULL, CAST(N'2025-03-04T18:56:06.770' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3098, 2101, N'https://res.cloudinary.com/daowhglcl/image/upload/v1741089528/jnvnmjwadm5ixmkze18g.jpg', CAST(N'2025-03-04T18:58:48.813' AS DateTime), NULL, CAST(N'2025-03-04T18:58:48.813' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3099, 2102, N'http://res.cloudinary.com/daowhglcl/image/upload/v1741089652/gvqzhqmy31muoftnqor6.jpg', CAST(N'2025-03-04T19:00:52.860' AS DateTime), NULL, CAST(N'2025-03-04T19:00:52.860' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3100, 2103, N'http://res.cloudinary.com/daowhglcl/image/upload/v1741089703/akzjxurx1obwn7s2z9dz.jpg', CAST(N'2025-03-04T19:01:43.420' AS DateTime), NULL, CAST(N'2025-03-04T19:01:43.420' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3101, 2104, N'https://res.cloudinary.com/daowhglcl/image/upload/v1741089166/ceilexl3dz0dv9u2vvkn.jpg', CAST(N'2025-03-04T19:03:19.300' AS DateTime), NULL, CAST(N'2025-03-04T19:03:19.300' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3102, 2105, N'http://res.cloudinary.com/daowhglcl/image/upload/v1741089887/mxukodyivdjk0gxw6w8o.jpg', CAST(N'2025-03-04T19:04:48.107' AS DateTime), NULL, CAST(N'2025-03-04T19:04:48.107' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3103, 2106, N'https://res.cloudinary.com/daowhglcl/image/upload/v1742215167/bjukw2ltyftrn4pa8hzh.webp', CAST(N'2025-03-04T19:06:14.647' AS DateTime), NULL, CAST(N'2025-03-04T19:06:14.647' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3104, 2107, N'http://res.cloudinary.com/dkc0ky8md/image/upload/v1741703461/dzfydf4ribu9fvdsueet.jpg', CAST(N'2025-03-11T21:31:04.320' AS DateTime), NULL, CAST(N'2025-03-11T21:31:04.320' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3108, 2111, N'http://res.cloudinary.com/daowhglcl/image/upload/v1741765869/qkpcw0jyhwhfvoixqaxg.jpg', CAST(N'2025-03-12T14:51:09.130' AS DateTime), NULL, CAST(N'2025-03-12T14:51:09.130' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4104, 3, N'http://res.cloudinary.com/daowhglcl/image/upload/v1742208351/vjztjvlmg8nwywsko0v7.jpg', CAST(N'2025-03-17T17:45:51.143' AS DateTime), NULL, CAST(N'2025-03-17T17:45:51.143' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4105, 3108, N'http://res.cloudinary.com/daowhglcl/image/upload/v1742212564/ln08p8uqrvlmoxdogcno.jpg', CAST(N'2025-03-17T18:56:04.823' AS DateTime), NULL, CAST(N'2025-03-17T18:56:04.823' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4107, 3113, N'http://res.cloudinary.com/daowhglcl/image/upload/v1742372120/w1uwlj89qbokuc7tbdnb.webp', CAST(N'2025-03-19T15:15:21.343' AS DateTime), NULL, CAST(N'2025-03-19T15:15:21.343' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4108, 3114, N'http://res.cloudinary.com/daowhglcl/image/upload/v1742372124/smmimetdswboy6dibvpm.jpg', CAST(N'2025-03-19T15:15:24.620' AS DateTime), NULL, CAST(N'2025-03-19T15:15:24.620' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4109, 3120, N'http://res.cloudinary.com/daowhglcl/image/upload/v1742378695/doyekgpnqchk83vs4kyy.jpg', CAST(N'2025-03-19T17:04:55.830' AS DateTime), NULL, CAST(N'2025-03-19T17:04:55.830' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4110, 3121, N'http://res.cloudinary.com/daowhglcl/image/upload/v1742378724/qqmaldsorgd6bme4xfxr.jpg', CAST(N'2025-03-19T17:05:24.957' AS DateTime), NULL, CAST(N'2025-03-19T17:05:24.957' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4113, 3126, N'http://res.cloudinary.com/daowhglcl/image/upload/v1742380431/lud4upa0b7syoxzmtrc0.jpg', CAST(N'2025-03-19T17:33:51.887' AS DateTime), NULL, CAST(N'2025-03-19T17:33:51.887' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6104, 6107, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743428543/caj5jrlv5lhhpkjxib7d.webp', CAST(N'2025-03-31T20:42:22.197' AS DateTime), NULL, CAST(N'2025-03-31T20:42:22.197' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6105, 6108, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584175/amzobvad8kyjc9jfiwnz.jpg', CAST(N'2025-04-02T15:56:15.453' AS DateTime), NULL, CAST(N'2025-04-02T15:56:15.453' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6106, 6109, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584213/tu0hqh6wzgxky5og18kr.jpg', CAST(N'2025-04-02T15:56:53.263' AS DateTime), NULL, CAST(N'2025-04-02T15:56:53.263' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6107, 6110, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584229/tdoleivxvvtojgyl8so4.jpg', CAST(N'2025-04-02T15:57:09.593' AS DateTime), NULL, CAST(N'2025-04-02T15:57:09.593' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6108, 6111, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584398/uhmhllq1u8itxbx1nwez.jpg', CAST(N'2025-04-02T15:59:57.997' AS DateTime), NULL, CAST(N'2025-04-02T15:59:57.997' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6109, 6112, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584402/n7ujwnp6je182zpm9zhm.jpg', CAST(N'2025-04-02T16:00:02.363' AS DateTime), NULL, CAST(N'2025-04-02T16:00:02.363' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6110, 6113, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584636/fewpu7tsxapbuwthy7j1.jpg', CAST(N'2025-04-02T16:03:56.573' AS DateTime), NULL, CAST(N'2025-04-02T16:03:56.573' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6111, 6114, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584853/vcvo098o905wsxoeqvyj.jpg', CAST(N'2025-04-02T16:07:33.367' AS DateTime), NULL, CAST(N'2025-04-02T16:07:33.367' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6112, 6115, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584856/ckn0l0l6q4yewvvxnayp.jpg', CAST(N'2025-04-02T16:07:36.103' AS DateTime), NULL, CAST(N'2025-04-02T16:07:36.103' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6113, 6116, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743584947/mmteg4qnxpyrrbt2fbuf.jpg', CAST(N'2025-04-02T16:09:07.270' AS DateTime), NULL, CAST(N'2025-04-02T16:09:07.270' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6114, 6117, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585064/cr3digtrhd1iaixjlxgl.jpg', CAST(N'2025-04-02T16:11:04.070' AS DateTime), NULL, CAST(N'2025-04-02T16:11:04.070' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6115, 6118, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585136/avxpabvv8liohy6vapca.jpg', CAST(N'2025-04-02T16:12:16.710' AS DateTime), NULL, CAST(N'2025-04-02T16:12:16.710' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6116, 6119, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585295/ibhfpiqds75nybq4fe3z.jpg', CAST(N'2025-04-02T16:14:55.717' AS DateTime), NULL, CAST(N'2025-04-02T16:14:55.717' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6117, 6120, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585298/a1f1thgbgmvfzghcilay.jpg', CAST(N'2025-04-02T16:14:58.620' AS DateTime), NULL, CAST(N'2025-04-02T16:14:58.620' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6118, 6121, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585474/bjnrnmfgch8iizwnvjex.jpg', CAST(N'2025-04-02T16:17:54.713' AS DateTime), NULL, CAST(N'2025-04-02T16:17:54.713' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6119, 6122, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585513/povfwhnyyaxmsmt8nso6.jpg', CAST(N'2025-04-02T16:18:33.037' AS DateTime), NULL, CAST(N'2025-04-02T16:18:33.037' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6120, 6123, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585553/zm40c6uh4cifzbghpewq.jpg', CAST(N'2025-04-02T16:19:13.910' AS DateTime), NULL, CAST(N'2025-04-02T16:19:13.910' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6121, 6124, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585977/txuv5mu5lktlhf14rvwd.jpg', CAST(N'2025-04-02T16:26:17.627' AS DateTime), NULL, CAST(N'2025-04-02T16:26:17.627' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6122, 6125, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743585980/zt7mgwcfaykapvtwysdu.jpg', CAST(N'2025-04-02T16:26:20.570' AS DateTime), NULL, CAST(N'2025-04-02T16:26:20.570' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6128, 6126, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743587299/aelaxk53pl04ecywk8dz.jpg', CAST(N'2025-04-02T16:48:19.640' AS DateTime), NULL, CAST(N'2025-04-02T16:48:19.640' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6129, 6128, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743587368/c5j6u7e88xc6idkpklkr.jpg', CAST(N'2025-04-02T16:49:28.257' AS DateTime), NULL, CAST(N'2025-04-02T16:49:28.257' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7106, 6127, N'http://res.cloudinary.com/daowhglcl/image/upload/v1743689531/lcni4txilyuxp8pexhn8.jpg', CAST(N'2025-04-03T21:12:12.407' AS DateTime), NULL, CAST(N'2025-04-03T21:12:12.407' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7115, 6145, N'http://res.cloudinary.com/djw90k3et/image/upload/v1745732808/uwbmfieo5ppdctvzi0np.jpg', CAST(N'2025-04-27T12:46:48.370' AS DateTime), NULL, CAST(N'2025-04-27T12:46:48.370' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7116, 6146, N'http://res.cloudinary.com/djw90k3et/image/upload/v1745762245/jpd2bb303terd4yhjzzk.jpg', CAST(N'2025-04-27T20:57:24.930' AS DateTime), NULL, CAST(N'2025-04-27T20:57:24.930' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7117, 6147, N'http://res.cloudinary.com/djw90k3et/image/upload/v1745762251/hweauqyf7z7fqp6w8kmk.jpg', CAST(N'2025-04-27T20:57:31.203' AS DateTime), NULL, CAST(N'2025-04-27T20:57:31.203' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7118, 6148, N'http://res.cloudinary.com/djw90k3et/image/upload/v1745852872/yj5tgbdwlbiuykwahqtc.jpg', CAST(N'2025-04-28T22:07:53.160' AS DateTime), NULL, CAST(N'2025-04-28T22:07:53.160' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7119, 6149, N'http://res.cloudinary.com/djw90k3et/image/upload/v1745852880/s3ean3rnzzow7kwtpj42.jpg', CAST(N'2025-04-28T22:08:00.707' AS DateTime), NULL, CAST(N'2025-04-28T22:08:00.707' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7120, 6150, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746282621/rddintnw2hsqkbjp3xcl.jpg', CAST(N'2025-05-03T21:30:26.733' AS DateTime), NULL, CAST(N'2025-05-03T21:30:26.733' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7121, 6151, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746282630/r3ufa7lmdfzkvyefmqk6.jpg', CAST(N'2025-05-03T21:30:32.483' AS DateTime), NULL, CAST(N'2025-05-03T21:30:32.483' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7123, 6152, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286074/z1qzcrm3bigjp2pelloa.jpg', CAST(N'2025-05-03T22:27:56.553' AS DateTime), NULL, CAST(N'2025-05-03T22:27:56.553' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7124, 6154, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286082/hpff5yvanx51xy1dxa0u.jpg', CAST(N'2025-05-03T22:28:03.953' AS DateTime), NULL, CAST(N'2025-05-03T22:28:03.953' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7125, 6153, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286096/g2fgb9t55nnhhcrltpzu.jpg', CAST(N'2025-05-03T22:28:17.833' AS DateTime), NULL, CAST(N'2025-05-03T22:28:17.833' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7126, 6155, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286103/pch7lovuznhbl989bomk.jpg', CAST(N'2025-05-03T22:28:25.137' AS DateTime), NULL, CAST(N'2025-05-03T22:28:25.137' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7127, 6156, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286108/fryo475wo2byz8xtjhiv.jpg', CAST(N'2025-05-03T22:28:30.500' AS DateTime), NULL, CAST(N'2025-05-03T22:28:30.500' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7128, 6157, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286112/rbulayjmo0v9si932lmw.jpg', CAST(N'2025-05-03T22:28:33.967' AS DateTime), NULL, CAST(N'2025-05-03T22:28:33.967' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7130, 6159, N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286953/pydm9f7npbemi1fpcnaz.jpg', CAST(N'2025-05-03T22:42:34.717' AS DateTime), NULL, CAST(N'2025-05-03T22:42:34.717' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Anh] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatLieu] ON 

INSERT [dbo].[ChatLieu] ([Id], [TenChatLieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'Da', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[ChatLieu] ([Id], [TenChatLieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'Lụa', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-02-27T19:24:09.577' AS DateTime), N'NV02', 0)
INSERT [dbo].[ChatLieu] ([Id], [TenChatLieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'Vải', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[ChatLieu] ([Id], [TenChatLieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'Carbon Fiber', CAST(N'2025-02-27T19:25:56.100' AS DateTime), N'NV02', CAST(N'2025-04-03T20:32:10.500' AS DateTime), N'NV02', 1)
SET IDENTITY_INSERT [dbo].[ChatLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[DeGiay] ON 

INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'Da', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'Cao su', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'Nhựa PU', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'Boost', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'Air', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1006, N'Balenciaga', CAST(N'2025-03-19T22:45:46.847' AS DateTime), N'NV02', CAST(N'2025-03-19T22:45:46.847' AS DateTime), NULL, 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1007, N'Sắt', CAST(N'2025-04-27T20:55:59.387' AS DateTime), N'NV02', CAST(N'2025-04-27T20:56:16.337' AS DateTime), N'NV02', 0)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1008, N'Kamito', CAST(N'2025-04-28T22:08:56.920' AS DateTime), N'NV02', CAST(N'2025-05-03T22:40:37.880' AS DateTime), N'NV009', 0)
SET IDENTITY_INSERT [dbo].[DeGiay] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaChi] ON 

INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 3, N'Nguyễn Thái Học', N'Phú Thượng', N'Tây Hồ', N'Hà Nội', N'Trần Quốc Nghĩa', N'0923456789', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 4, N'Đường 3/2', N'Phường 2', N'Tân Bình', N'Tp. Hồ Chí Minh', N'Nguyễn Phúc Long', N'0934567890', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, 5, N'Nguyễn Hữu Cảnh', N'Phú Hữu', N'Nhà Bè', N'Tp. Hồ Chí Minh', N'Kiều Khánh Huyền', N'0945678901', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, 6, N'Trần Não', N'Bình An', N'Thủ Đức', N'Tp. Hồ Chí Minh', N'Nguyễn Thùy Linh', N'0956789012', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, 7, N'Phạm Hữu Lầu', N'Đa Kao', N'Quận 1', N'Tp. Hồ Chí Minh', N'Bùi Huyền Anh', N'0967890123', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, 8, N'Hồng Bàng', N'An Hải Bắc', N'Sơn Trà', N'Đà Nẵng', N'Đặng Phương Thảo', N'0978901234', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, 9, N'Hà Huy Tập', N'An Khê', N'Tam Kỳ', N'Quảng Nam', N'Lê Hải Đăng', N'0989012345', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, 10, N'Quang Trung', N'Thường Định', N'Thành phố Thái Bình', N'Thái Bình', N'Phùng Thanh Hiền', N'0990123456', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, 11, N'Nguyễn Đình Chiểu', N'Gia Quất', N'Thuận Thành', N'Bắc Ninh', N'Nguyễn Anh Vũ', N'0910112233', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, 12, N'Lê Lợi', N'Phú Thượng', N'Tây Hồ', N'Hà Nội', N'Vũ Thùy Tiên', N'0911223344', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, 13, N'Hà Bổng', N'Gia Huynh', N'Hương Khê', N'Hà Tĩnh', N'Lê Phương Anh', N'0912334455', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, 14, N'Tôn Đức Thắng', N'Tân Hưng', N'Tân Bình', N'Tp. Hồ Chí Minh', N'Nguyễn Thị Thùy Linh', N'0913445566', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, 15, N'Hòa Hảo', N'Hòa An', N'Phú Nhuận', N'Tp. Hồ Chí Minh', N'Đỗ Ánh Dương', N'0914556677', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, 16, N'Nguyễn Văn Cừ', N'Mỹ Đình', N'Thành phố Hải Phòng', N'Hải Phòng', N'Nguyễn Thúy Hằng', N'0915667788', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, 17, N'Phạm Văn Đồng', N'Phú Đô', N'Nam Từ Liêm', N'Hà Nội', N'Nguyễn Anh Dũng', N'0916778899', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, 18, N'Trần Đại Nghĩa', N'Đại Kim', N'Hoàng Mai', N'Hà Nội', N'Vũ Văn Nguyên', N'0917889900', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, 19, N'Lê Văn Lương', N'Tân Hưng', N'Tân Bình', N'Tp. Hồ Chí Minh', N'Hoàng Công Vinh', N'0918990011', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, 20, N'Nguyễn Trãi', N'Hương Tích', N'Can Lộc', N'Hà Tĩnh', N'Bạch Văn Sơn', N'0919001122', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, 1, N'Số nhà 24', N'800046?Thị Trấn Ba Hàng Đồi', N'2157?Huyện Lạc Thủy', N'267?Hòa Bình', N'Minh', N'03658923752', CAST(N'2025-02-24T18:38:21.490' AS DateTime), NULL, CAST(N'2025-02-24T18:38:21.490' AS DateTime), NULL, NULL)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1021, 2, N'Số nhà 24', N'80518?Xã Trung Chải', N'2005?Thị xã Sa Pa', N'269?Lào Cai', N'Anh Ngoc', N'03658923752', CAST(N'2025-03-04T19:08:41.690' AS DateTime), NULL, CAST(N'2025-03-04T19:08:41.690' AS DateTime), NULL, NULL)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1022, 1, N'Số nhà 29', N'220911?Xã Việt Hưng', N'2046?Huyện Văn Lâm', N'268?Hưng Yên', N'Anh Ngoc', N'03658923888', CAST(N'2025-04-28T12:38:02.777' AS DateTime), NULL, CAST(N'2025-04-28T12:38:02.777' AS DateTime), NULL, NULL)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1023, 1024, N'Số nhà 29', N'90816?Thị Trấn Si Ma Cai', N'2264?Huyện Si Ma Cai', N'269?Lào Cai', N'Cường', N'03658923752', CAST(N'2025-04-28T22:26:56.267' AS DateTime), NULL, CAST(N'2025-04-28T22:26:56.267' AS DateTime), NULL, NULL)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1024, 1024, N'Số nhà 24', N'230527?Xã Xuất Hóa', N'2156?Huyện Lạc Sơn', N'267?Hòa Bình', N'Minh', N'03658923754', CAST(N'2025-04-28T22:27:30.377' AS DateTime), NULL, CAST(N'2025-04-28T22:27:30.377' AS DateTime), NULL, NULL)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1025, 1, N'Số nhà 24', N'90816?Thị Trấn Si Ma Cai', N'2264?Huyện Si Ma Cai', N'269?Lào Cai', N'Anh Ngoc', N'03658923753', CAST(N'2025-05-03T21:37:16.967' AS DateTime), NULL, CAST(N'2025-05-03T21:37:16.967' AS DateTime), NULL, NULL)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1026, 1025, N'Số nhà 29', N'230915?Xã Yên Bồng', N'2157?Huyện Lạc Thủy', N'267?Hòa Bình', N'Minh', N'03658923888', CAST(N'2025-05-03T21:54:43.567' AS DateTime), NULL, CAST(N'2025-05-03T21:54:43.567' AS DateTime), NULL, NULL)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1027, 1025, N'Số nhà 29', N'90816?Thị Trấn Si Ma Cai', N'2264?Huyện Si Ma Cai', N'269?Lào Cai', N'Anh Ngoc', N'03658923888', CAST(N'2025-05-03T21:55:02.590' AS DateTime), NULL, CAST(N'2025-05-03T21:55:02.590' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[DiaChi] OFF
GO
SET IDENTITY_INSERT [dbo].[DotGiamGia] ON 

INSERT [dbo].[DotGiamGia] ([Id], [GiaTriGiam], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6005, 50000, CAST(N'2025-04-02T23:14:00.000' AS DateTime), CAST(N'2025-04-22T23:15:00.000' AS DateTime), CAST(N'2025-04-03T23:15:03.930' AS DateTime), NULL, CAST(N'2025-04-25T16:06:40.480' AS DateTime), NULL, 0)
INSERT [dbo].[DotGiamGia] ([Id], [GiaTriGiam], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6006, 100000, CAST(N'2025-04-17T17:16:00.000' AS DateTime), CAST(N'2025-04-18T18:16:00.000' AS DateTime), CAST(N'2025-04-18T17:16:25.840' AS DateTime), NULL, CAST(N'2025-04-18T17:17:02.360' AS DateTime), NULL, 0)
INSERT [dbo].[DotGiamGia] ([Id], [GiaTriGiam], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6007, 100000, CAST(N'2025-04-27T20:59:00.000' AS DateTime), CAST(N'2025-04-30T20:59:00.000' AS DateTime), CAST(N'2025-04-27T20:59:51.300' AS DateTime), NULL, CAST(N'2025-04-28T23:13:25.670' AS DateTime), NULL, 0)
INSERT [dbo].[DotGiamGia] ([Id], [GiaTriGiam], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6008, 100000, CAST(N'2025-04-28T23:10:00.000' AS DateTime), CAST(N'2025-04-29T23:10:00.000' AS DateTime), CAST(N'2025-04-28T23:11:21.607' AS DateTime), NULL, CAST(N'2025-04-28T23:13:27.400' AS DateTime), NULL, 0)
INSERT [dbo].[DotGiamGia] ([Id], [GiaTriGiam], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6009, 100000, CAST(N'2025-05-02T22:08:00.000' AS DateTime), CAST(N'2025-05-04T22:08:00.000' AS DateTime), CAST(N'2025-05-03T22:08:31.113' AS DateTime), NULL, CAST(N'2025-05-03T23:04:42.527' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[DotGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, 1, NULL, NULL, N'1740396482998', NULL, NULL, NULL, NULL, NULL, 2500000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-24T18:28:03.003' AS DateTime), N'Bùi Đức Việt', CAST(N'2025-02-24T18:28:48.793' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (23, 2, NULL, NULL, N'1740407700934', NULL, NULL, NULL, NULL, NULL, 1500000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-02-24T21:35:00.940' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-02-24T21:35:44.983' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1021, 2, NULL, NULL, N'1740988963752', NULL, NULL, NULL, NULL, NULL, 6000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-03T15:02:43.757' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-03T15:03:09.360' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1023, 2, NULL, NULL, N'1741078373967', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-04T15:52:53.970' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-04T15:53:18.547' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1028, 2, NULL, NULL, N'1741098052117', NULL, NULL, NULL, NULL, NULL, 550000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-04T21:20:52.123' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-04T21:21:19.253' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1029, 2, NULL, NULL, N'1741098109775', NULL, NULL, NULL, NULL, NULL, 700000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-04T21:21:49.777' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-04T21:22:24.913' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1031, 2, NULL, NULL, N'1741156440971', NULL, NULL, NULL, NULL, NULL, 1000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-05T13:34:00.980' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-05T13:35:04.753' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1044, 2, NULL, NULL, N'1741765396357', NULL, NULL, NULL, NULL, NULL, 3300000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-12T14:43:16.370' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-12T14:44:10.903' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2032, 2, NULL, NULL, N'1742123773951', NULL, NULL, NULL, NULL, NULL, 300000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-16T18:16:13.953' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-16T18:18:07.763' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2033, 2, NULL, NULL, N'1742124392723', NULL, NULL, NULL, NULL, NULL, 4000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-16T18:26:32.723' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-16T18:27:21.557' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2048, 2, NULL, NULL, N'1742221745250', NULL, NULL, NULL, NULL, NULL, 700000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-17T21:29:05.253' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-17T21:29:41.647' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2057, 2, 1, NULL, N'1742278615002', NULL, NULL, NULL, NULL, NULL, 6000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-18T13:16:55.017' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-18T13:17:23.093' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2058, 2, 21, NULL, N'1742278689111', NULL, NULL, NULL, NULL, NULL, 6500000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-18T13:18:09.113' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-18T13:18:42.703' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2059, 2, 3, NULL, N'1742375812857', NULL, NULL, NULL, NULL, NULL, 6000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-19T16:16:52.860' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-19T16:20:38.830' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3039, 2, NULL, NULL, N'1742393395998', NULL, NULL, NULL, NULL, NULL, 6000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-19T21:09:56.003' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-19T21:10:09.890' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3040, 2, 1, NULL, N'1742393440059', NULL, NULL, NULL, NULL, NULL, 6000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-19T21:10:40.060' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-19T21:10:59.547' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3041, 2, NULL, NULL, N'1742399244346', NULL, NULL, NULL, NULL, NULL, 8000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-19T22:47:24.347' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-19T22:48:51.553' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4032, NULL, 1, NULL, N'1742890437448', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 339001.0000, 1, 39001.0000, CAST(N'2025-03-25T16:22:21.913' AS DateTime), CAST(N'2025-03-25T16:22:31.337' AS DateTime), CAST(N'2025-03-25T16:22:35.643' AS DateTime), CAST(N'2025-03-25T16:22:38.717' AS DateTime), N'', CAST(N'2025-03-25T15:13:57.453' AS DateTime), NULL, CAST(N'2025-03-25T16:22:38.717' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5032, 2, NULL, NULL, N'1742979856712', NULL, NULL, NULL, NULL, NULL, 7200000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:04:16.717' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:04:40.610' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5033, 2, 1, NULL, N'1742979964075', NULL, NULL, NULL, NULL, NULL, 7000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:06:04.077' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:06:23.543' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5034, 2, 1, NULL, N'1742980337038', NULL, NULL, NULL, NULL, NULL, 7000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:12:17.040' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:12:32.397' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5035, 2, 1, NULL, N'1742980760273', NULL, NULL, NULL, NULL, NULL, 6700000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:19:20.273' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:19:41.707' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5036, 2, 1, NULL, N'1742981090878', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:24:50.877' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:25:04.483' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5037, 2, 1, NULL, N'1742981284064', NULL, NULL, NULL, NULL, NULL, 12500000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:28:04.067' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:28:22.153' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5038, 2, 1, NULL, N'1742981569633', NULL, NULL, NULL, NULL, NULL, 8000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:32:49.633' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:33:11.353' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5039, 2, 1, NULL, N'1742981682613', NULL, NULL, NULL, NULL, NULL, 6500000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:34:42.613' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:34:59.510' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5040, 2, 1, NULL, N'1742981839607', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:37:19.607' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:37:32.073' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5041, 2, NULL, NULL, N'1742982082404', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:41:22.407' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:41:33.450' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5042, 2, NULL, NULL, N'1742982194119', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:43:14.120' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:43:25.217' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5043, 2, NULL, NULL, N'1742982279820', NULL, NULL, NULL, NULL, NULL, 3200000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:44:39.820' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:44:49.530' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5044, 2, NULL, NULL, N'1742982339277', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:45:39.277' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:45:47.303' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5045, 2, NULL, NULL, N'1742982388227', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:46:28.230' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:46:35.943' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5046, 2, NULL, NULL, N'1742982452498', NULL, NULL, NULL, NULL, NULL, 3200000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:47:32.500' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:47:40.667' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5047, 2, 1, NULL, N'1742982582894', NULL, NULL, NULL, NULL, NULL, 3500000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T16:49:42.897' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T16:49:53.167' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5048, 2, 1, NULL, N'1742983302243', NULL, NULL, NULL, NULL, NULL, 10700000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T17:01:42.243' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T17:01:57.623' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5049, 2, 1, NULL, N'1742983349478', NULL, NULL, NULL, NULL, NULL, 9200000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T17:02:29.480' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T17:02:46.970' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5050, 2, 1, NULL, N'1742983497351', NULL, NULL, NULL, NULL, NULL, 16600000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T17:04:57.353' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T17:05:14.410' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5051, 2, 1, NULL, N'1742983552766', NULL, NULL, NULL, NULL, NULL, 16600000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T17:05:52.767' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T17:06:24.643' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5052, 2, NULL, NULL, N'1742983641878', NULL, NULL, NULL, NULL, NULL, 3200000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T17:07:21.880' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T17:07:38.590' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6032, 2, NULL, NULL, N'1742996560389', NULL, NULL, NULL, NULL, NULL, 7500000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T20:42:40.393' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T20:42:54.960' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6033, 2, 1, NULL, N'1742996580103', NULL, NULL, NULL, NULL, NULL, 7000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-03-26T20:43:00.107' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-03-26T20:43:14.563' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6034, NULL, 1, NULL, N'1743415645464', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 889001.0000, 1, 39001.0000, CAST(N'2025-03-31T17:51:06.143' AS DateTime), CAST(N'2025-03-31T17:51:12.860' AS DateTime), CAST(N'2025-03-31T17:53:50.770' AS DateTime), CAST(N'2025-03-31T17:54:01.117' AS DateTime), N'', CAST(N'2025-03-31T17:07:25.467' AS DateTime), NULL, CAST(N'2025-03-31T17:54:01.120' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6036, NULL, 1, NULL, N'1743418332402', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 539001.0000, 1, 39001.0000, CAST(N'2025-03-31T17:52:24.763' AS DateTime), CAST(N'2025-03-31T17:52:50.867' AS DateTime), NULL, NULL, N'', CAST(N'2025-03-31T17:52:12.403' AS DateTime), NULL, CAST(N'2025-03-31T17:56:29.740' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6037, NULL, 1, 3004, N'1743418533655', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 25000.0000, 514001.0000, 1, 39001.0000, CAST(N'2025-03-31T17:55:45.107' AS DateTime), CAST(N'2025-03-31T17:55:49.307' AS DateTime), NULL, NULL, N'', CAST(N'2025-03-31T17:55:33.657' AS DateTime), NULL, CAST(N'2025-03-31T17:55:54.990' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6038, NULL, 1, 2008, N'1743431855053', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 30000.0000, 309001.0000, 1, 39001.0000, CAST(N'2025-03-31T21:37:56.107' AS DateTime), CAST(N'2025-03-31T21:38:02.437' AS DateTime), CAST(N'2025-03-31T21:38:05.673' AS DateTime), CAST(N'2025-03-31T21:38:08.093' AS DateTime), N'', CAST(N'2025-03-31T21:37:35.060' AS DateTime), NULL, CAST(N'2025-03-31T21:38:08.093' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6039, NULL, 1, 3004, N'1743431948314', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 25000.0000, 214001.0000, 1, 39001.0000, CAST(N'2025-03-31T21:39:32.877' AS DateTime), CAST(N'2025-03-31T21:39:44.713' AS DateTime), CAST(N'2025-03-31T21:39:52.187' AS DateTime), CAST(N'2025-03-31T21:39:57.383' AS DateTime), N'', CAST(N'2025-03-31T21:39:08.317' AS DateTime), NULL, CAST(N'2025-03-31T21:39:57.387' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6040, NULL, 1, 2008, N'1743432068462', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 30000.0000, 209001.0000, 1, 39001.0000, CAST(N'2025-03-31T21:41:27.100' AS DateTime), CAST(N'2025-03-31T21:42:43.450' AS DateTime), NULL, NULL, N'', CAST(N'2025-03-31T21:41:08.463' AS DateTime), NULL, CAST(N'2025-03-31T21:42:49.690' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6041, 2, NULL, NULL, N'1743670745142', NULL, NULL, NULL, NULL, NULL, 550000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-03T15:59:05.147' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-03T15:59:20.883' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6042, 2, NULL, NULL, N'1743670879196', NULL, NULL, NULL, NULL, NULL, 3200000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-03T16:01:19.197' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-03T16:01:42.073' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7042, 2, NULL, NULL, N'1743949755924', NULL, NULL, NULL, NULL, NULL, 1650000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-06T21:29:15.930' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-06T21:33:55.773' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7043, 2, NULL, NULL, N'1743954495400', NULL, NULL, NULL, NULL, NULL, 800000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-06T22:48:15.403' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-06T22:48:46.023' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8041, NULL, 1, NULL, N'1744269142355', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1789001.0000, 1, 39001.0000, CAST(N'2025-04-10T14:12:33.690' AS DateTime), CAST(N'2025-04-10T14:12:41.460' AS DateTime), CAST(N'2025-04-10T14:12:44.147' AS DateTime), CAST(N'2025-04-10T14:52:51.263' AS DateTime), N'', CAST(N'2025-04-10T14:12:22.357' AS DateTime), NULL, CAST(N'2025-04-10T14:52:51.267' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8042, NULL, 1, NULL, N'1744269686754', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 839001.0000, 1, 39001.0000, CAST(N'2025-04-10T14:21:34.537' AS DateTime), CAST(N'2025-04-10T14:21:43.503' AS DateTime), NULL, NULL, N'', CAST(N'2025-04-10T14:21:26.757' AS DateTime), NULL, CAST(N'2025-04-10T14:26:02.893' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8043, NULL, 1, NULL, N'1744270255701', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1039001.0000, 1, 39001.0000, CAST(N'2025-04-10T14:31:03.277' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-10T14:30:55.703' AS DateTime), NULL, CAST(N'2025-04-10T14:31:13.360' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8044, NULL, 1, NULL, N'1744270304298', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 839001.0000, 1, 39001.0000, CAST(N'2025-04-10T14:31:48.800' AS DateTime), CAST(N'2025-04-10T14:32:03.017' AS DateTime), NULL, NULL, N'', CAST(N'2025-04-10T14:31:44.300' AS DateTime), NULL, CAST(N'2025-04-10T14:32:05.253' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8045, NULL, 1, NULL, N'1744270432539', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1539001.0000, 1, 39001.0000, CAST(N'2025-04-10T14:34:01.697' AS DateTime), CAST(N'2025-04-10T14:34:17.657' AS DateTime), NULL, NULL, N'', CAST(N'2025-04-10T14:33:52.540' AS DateTime), NULL, CAST(N'2025-04-10T14:45:21.137' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8046, NULL, 1, NULL, N'1744271358936', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 839001.0000, 1, 39001.0000, CAST(N'2025-04-10T14:49:23.310' AS DateTime), CAST(N'2025-04-10T14:49:30.603' AS DateTime), NULL, NULL, N'', CAST(N'2025-04-10T14:49:18.937' AS DateTime), NULL, CAST(N'2025-04-10T15:01:08.373' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8047, NULL, 1, NULL, N'1744272267849', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1539001.0000, 1, 39001.0000, CAST(N'2025-04-10T15:04:35.233' AS DateTime), CAST(N'2025-04-10T15:04:39.307' AS DateTime), NULL, NULL, N'', CAST(N'2025-04-10T15:04:27.850' AS DateTime), NULL, CAST(N'2025-04-10T15:05:28.617' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8048, NULL, 1, NULL, N'1744272352914', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1589001.0000, 1, 39001.0000, CAST(N'2025-04-10T15:06:09.583' AS DateTime), CAST(N'2025-04-10T15:06:14.350' AS DateTime), CAST(N'2025-04-10T15:06:17.040' AS DateTime), CAST(N'2025-04-10T15:06:25.587' AS DateTime), N'', CAST(N'2025-04-10T15:05:52.917' AS DateTime), NULL, CAST(N'2025-04-10T15:06:25.590' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8049, 18, NULL, NULL, N'1744982956433', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-18T20:29:16.440' AS DateTime), N'Truong Văn Thiện', CAST(N'2025-04-18T20:29:57.873' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8053, NULL, 1, 3006, N'1745682371709', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 30000.0000, 959001.0000, 1, 39001.0000, CAST(N'2025-04-26T22:46:30.837' AS DateTime), CAST(N'2025-04-26T22:46:40.560' AS DateTime), CAST(N'2025-04-26T22:46:44.917' AS DateTime), CAST(N'2025-04-26T22:46:55.220' AS DateTime), N'', CAST(N'2025-04-26T22:46:11.710' AS DateTime), NULL, CAST(N'2025-04-26T22:46:55.220' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8056, NULL, 1, NULL, N'1745735796290', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 989001.0000, 1, 39001.0000, CAST(N'2025-04-27T13:36:56.183' AS DateTime), CAST(N'2025-04-27T13:36:59.350' AS DateTime), CAST(N'2025-04-27T13:37:01.253' AS DateTime), CAST(N'2025-04-27T13:37:03.457' AS DateTime), N'', CAST(N'2025-04-27T13:36:36.290' AS DateTime), NULL, CAST(N'2025-04-27T13:37:03.457' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8057, NULL, 1, NULL, N'1745737035818', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1539001.0000, 1, 39001.0000, CAST(N'2025-04-28T17:23:59.777' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-27T13:57:15.820' AS DateTime), NULL, CAST(N'2025-04-28T17:23:59.777' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8058, NULL, 1, NULL, N'1745737245799', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1539001.0000, 1, 39001.0000, CAST(N'2025-04-28T13:53:37.440' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-27T14:00:45.800' AS DateTime), NULL, CAST(N'2025-04-28T13:53:37.443' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8060, NULL, 1, NULL, N'1745763895445', NULL, N'namnv1@gmail.com', NULL, N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 239001.0000, 1, 39001.0000, CAST(N'2025-04-27T21:25:04.763' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-27T21:24:55.447' AS DateTime), NULL, CAST(N'2025-04-27T21:25:25.737' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8061, NULL, 1, NULL, N'1745818620751', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 589001.0000, 1, 39001.0000, CAST(N'2025-04-28T13:46:07.447' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T12:37:00.757' AS DateTime), NULL, CAST(N'2025-04-28T13:46:07.450' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8062, NULL, 1, NULL, N'1745818702083', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 1589001.0000, 1, 39001.0000, CAST(N'2025-04-28T13:41:23.183' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T12:38:22.083' AS DateTime), NULL, CAST(N'2025-04-28T13:41:23.183' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8063, NULL, 1, NULL, N'1745819163330', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 1589001.0000, 1, 39001.0000, CAST(N'2025-04-28T13:38:33.127' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T12:46:03.333' AS DateTime), NULL, CAST(N'2025-04-28T13:38:33.130' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8064, NULL, 1, NULL, N'1745819758329', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 1589001.0000, 1, 39001.0000, CAST(N'2025-04-28T12:57:30.820' AS DateTime), CAST(N'2025-04-28T12:57:34.270' AS DateTime), CAST(N'2025-04-28T12:57:35.997' AS DateTime), CAST(N'2025-04-28T12:57:40.057' AS DateTime), N'', CAST(N'2025-04-28T12:55:58.330' AS DateTime), NULL, CAST(N'2025-04-28T12:57:40.060' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8065, 2, 1, NULL, N'1745820044521', NULL, NULL, NULL, NULL, NULL, 3000000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-28T13:00:44.523' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-28T13:00:59.750' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8066, 2, NULL, NULL, N'1745820507047', NULL, NULL, NULL, NULL, NULL, 3450000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-28T13:08:27.050' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-28T13:08:37.827' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8067, NULL, 1, NULL, N'1745823530836', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 239001.0000, 1, 39001.0000, CAST(N'2025-04-28T13:58:58.530' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T13:58:50.837' AS DateTime), NULL, CAST(N'2025-04-28T13:58:58.533' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8068, NULL, 1, NULL, N'1745823989395', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 589001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:06:36.757' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T14:06:29.397' AS DateTime), NULL, CAST(N'2025-04-28T14:06:36.757' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8069, NULL, 1, NULL, N'1745824215940', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 439001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:10:22.813' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T14:10:15.943' AS DateTime), NULL, CAST(N'2025-04-28T14:10:22.813' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8070, NULL, 1, NULL, N'1745824563896', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 589001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:16:11.340' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T14:16:03.897' AS DateTime), NULL, CAST(N'2025-04-28T14:16:11.343' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8071, NULL, 1, NULL, N'1745825413103', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 739001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:30:20.353' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T14:30:13.103' AS DateTime), NULL, CAST(N'2025-04-28T14:30:20.357' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8072, NULL, 1, NULL, N'1745825980940', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 239001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:39:48.873' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T14:39:40.943' AS DateTime), NULL, CAST(N'2025-04-28T14:39:48.873' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8073, NULL, 1, NULL, N'1745826388426', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 889001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:46:39.153' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T14:46:28.427' AS DateTime), NULL, CAST(N'2025-04-28T14:46:39.153' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8074, NULL, 1, NULL, N'1745826586355', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 889001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:49:52.913' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T14:49:46.357' AS DateTime), NULL, CAST(N'2025-04-28T14:49:52.917' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8075, NULL, 1, NULL, N'1745827051300', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 839001.0000, 1, 39001.0000, CAST(N'2025-04-28T14:57:38.160' AS DateTime), CAST(N'2025-04-28T17:23:49.317' AS DateTime), CAST(N'2025-04-28T17:23:51.047' AS DateTime), CAST(N'2025-04-28T17:23:52.917' AS DateTime), N'', CAST(N'2025-04-28T14:57:31.303' AS DateTime), NULL, CAST(N'2025-04-28T17:23:52.917' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8076, 2, 1, NULL, N'1745834699156', NULL, NULL, NULL, NULL, NULL, 3450000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-28T17:04:59.163' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-28T17:05:13.650' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8077, NULL, 1, NULL, N'1745836590530', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 589001.0000, 1, 39001.0000, CAST(N'2025-04-28T17:36:37.213' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T17:36:30.530' AS DateTime), NULL, CAST(N'2025-04-28T17:36:37.213' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8078, NULL, 1, NULL, N'1745836968508', N'Minh', N'namnv1@gmail.com', N'03658923752', N'Số nhà 24, Thị Trấn Ba Hàng Đồi, Huyện Lạc Thủy, Hòa Bình', 0.0000, 859001.0000, 1, 39001.0000, CAST(N'2025-04-28T17:42:57.563' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T17:42:48.510' AS DateTime), NULL, CAST(N'2025-04-28T17:42:57.567' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8079, NULL, 1, NULL, N'1745837313394', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 1589001.0000, 1, 39001.0000, CAST(N'2025-04-28T17:48:40.263' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T17:48:33.397' AS DateTime), NULL, CAST(N'2025-04-28T17:48:40.263' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8080, NULL, 1, NULL, N'1745837498715', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 589001.0000, 1, 39001.0000, CAST(N'2025-04-28T17:51:46.887' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T17:51:38.717' AS DateTime), NULL, CAST(N'2025-04-28T17:51:46.887' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8081, NULL, 1, NULL, N'1745837695517', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 589001.0000, 1, 39001.0000, CAST(N'2025-04-28T17:55:00.577' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T17:54:55.517' AS DateTime), NULL, CAST(N'2025-04-28T17:55:00.577' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8082, NULL, 1, NULL, N'1745837798472', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 889001.0000, 1, 39001.0000, CAST(N'2025-04-28T17:56:44.877' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T17:56:38.473' AS DateTime), NULL, CAST(N'2025-04-28T17:56:44.877' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8083, NULL, 1, NULL, N'1745838240109', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 889001.0000, 1, 39001.0000, CAST(N'2025-04-28T18:04:06.550' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T18:04:00.110' AS DateTime), NULL, CAST(N'2025-04-28T22:34:53.543' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8084, NULL, 1, NULL, N'1745850266880', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 889001.0000, 1, 39001.0000, CAST(N'2025-04-28T22:01:57.333' AS DateTime), CAST(N'2025-04-28T22:34:17.650' AS DateTime), NULL, NULL, N'', CAST(N'2025-04-28T21:24:26.880' AS DateTime), NULL, CAST(N'2025-04-28T22:34:17.653' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8085, NULL, 1, NULL, N'1745852583901', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 1589001.0000, 1, 39001.0000, NULL, NULL, NULL, NULL, N'', CAST(N'2025-04-28T22:03:03.903' AS DateTime), NULL, CAST(N'2025-04-28T22:03:03.903' AS DateTime), NULL, 1)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8086, 2, 1, NULL, N'1745852964349', NULL, NULL, NULL, NULL, NULL, 17250000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-04-28T22:09:24.350' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-04-28T22:11:54.687' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8092, NULL, 1024, 4007, N'1745854299412', N'Minh', N'cuong123@gmail.com', N'03658923754', N'Số nhà 24, Xã Xuất Hóa, Huyện Lạc Sơn, Hòa Bình', 400000.0000, 3289001.0000, 1, 39001.0000, CAST(N'2025-04-28T22:36:56.243' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T22:31:39.413' AS DateTime), NULL, CAST(N'2025-04-28T22:37:09.673' AS DateTime), N'cuong123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8093, NULL, 1024, NULL, N'1745854693926', N'Cường', N'cuong123@gmail.com', N'03658923752', N'Số nhà 29, Thị Trấn Si Ma Cai, Huyện Si Ma Cai, Lào Cai', 0.0000, 1589001.0000, 1, 39001.0000, CAST(N'2025-04-28T22:38:28.200' AS DateTime), NULL, NULL, NULL, N'', CAST(N'2025-04-28T22:38:13.927' AS DateTime), NULL, CAST(N'2025-04-28T22:39:14.887' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8094, NULL, 1024, NULL, N'1745854797782', N'Cường', N'cuong123@gmail.com', N'03658923752', N'Số nhà 29, Thị Trấn Si Ma Cai, Huyện Si Ma Cai, Lào Cai', 0.0000, 3819001.0000, 1, 39001.0000, NULL, NULL, NULL, NULL, N'', CAST(N'2025-04-28T22:39:57.783' AS DateTime), NULL, CAST(N'2025-04-28T22:39:57.783' AS DateTime), NULL, 1)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8095, NULL, 1024, NULL, N'1745855078462', N'Cường', N'cuong123@gmail.com', N'03658923752', N'Số nhà 29, Thị Trấn Si Ma Cai, Huyện Si Ma Cai, Lào Cai', 0.0000, 239001.0000, 1, 39001.0000, CAST(N'2025-04-28T22:46:11.703' AS DateTime), CAST(N'2025-04-28T22:48:38.963' AS DateTime), CAST(N'2025-04-28T22:49:36.147' AS DateTime), CAST(N'2025-04-28T22:49:38.987' AS DateTime), N'', CAST(N'2025-04-28T22:44:38.463' AS DateTime), NULL, CAST(N'2025-04-28T22:49:38.987' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8097, 2, NULL, NULL, N'1746282695702', NULL, NULL, NULL, NULL, NULL, 11850000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-05-03T21:31:35.703' AS DateTime), N'Nguyễn Đức Lương', CAST(N'2025-05-03T21:33:32.020' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8102, NULL, 1, 3006, N'1746283111927', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923753', N'Số nhà 24, Thị Trấn Si Ma Cai, Huyện Si Ma Cai, Lào Cai', 30000.0000, 1509001.0000, 1, 39001.0000, NULL, NULL, NULL, NULL, N'', CAST(N'2025-05-03T21:38:31.930' AS DateTime), NULL, CAST(N'2025-05-03T21:38:31.930' AS DateTime), NULL, 1)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8103, NULL, 1, NULL, N'1746283287763', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923753', N'Số nhà 24, Thị Trấn Si Ma Cai, Huyện Si Ma Cai, Lào Cai', 0.0000, 1839001.0000, 1, 39001.0000, CAST(N'2025-05-03T21:46:13.647' AS DateTime), CAST(N'2025-05-03T21:47:02.027' AS DateTime), CAST(N'2025-05-03T21:47:16.377' AS DateTime), CAST(N'2025-05-03T21:47:18.927' AS DateTime), N'', CAST(N'2025-05-03T21:41:27.767' AS DateTime), NULL, CAST(N'2025-05-03T21:47:18.930' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8104, NULL, 1025, 3006, N'1746284191154', N'Anh Ngoc', N'kim123@gmail.com', N'03658923888', N'Số nhà 29, Thị Trấn Si Ma Cai, Huyện Si Ma Cai, Lào Cai', 30000.0000, 1509001.0000, 1, 39001.0000, NULL, NULL, NULL, NULL, N'', CAST(N'2025-05-03T21:56:31.157' AS DateTime), NULL, CAST(N'2025-05-03T22:00:28.573' AS DateTime), N'luongthptnqb123@gmail.com', 6)
GO
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8105, NULL, 1025, 3006, N'1746284290676', N'Anh Ngoc', N'kim123@gmail.com', N'03658923888', N'Số nhà 29, Thị Trấn Si Ma Cai, Huyện Si Ma Cai, Lào Cai', 30000.0000, 309001.0000, 1, 39001.0000, CAST(N'2025-05-03T21:59:21.347' AS DateTime), CAST(N'2025-05-03T22:00:01.537' AS DateTime), CAST(N'2025-05-03T22:00:38.613' AS DateTime), CAST(N'2025-05-03T22:00:42.623' AS DateTime), N'', CAST(N'2025-05-03T21:58:10.677' AS DateTime), NULL, CAST(N'2025-05-03T22:00:42.627' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8106, 24, 1, NULL, N'1746287148383', NULL, NULL, NULL, NULL, NULL, 19800000.0000, 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2025-05-03T22:45:48.383' AS DateTime), N'nguyễn đức lương', CAST(N'2025-05-03T22:47:45.647' AS DateTime), NULL, 8)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8111, NULL, 1, 3006, N'1746287743774', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 30000.0000, 909001.0000, 1, 39001.0000, NULL, NULL, NULL, NULL, N'', CAST(N'2025-05-03T22:55:43.773' AS DateTime), NULL, CAST(N'2025-05-03T22:59:43.683' AS DateTime), N'luongndl284@gmail.com', 6)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8112, NULL, 1, NULL, N'1746287854797', N'Anh Ngoc', N'namnv1@gmail.com', N'03658923888', N'Số nhà 29, Xã Việt Hưng, Huyện Văn Lâm, Hưng Yên', 0.0000, 439001.0000, 1, 39001.0000, CAST(N'2025-05-03T22:58:48.893' AS DateTime), CAST(N'2025-05-03T22:59:25.137' AS DateTime), CAST(N'2025-05-03T22:59:54.700' AS DateTime), CAST(N'2025-05-03T23:00:00.137' AS DateTime), N'', CAST(N'2025-05-03T22:57:34.800' AS DateTime), NULL, CAST(N'2025-05-03T23:00:00.140' AS DateTime), N'luongndl284@gmail.com', 8)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] ON 

INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1020, 1021, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1021, 1021, 3, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1024, 1023, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1027, 1028, 2105, 300000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1028, 1028, 2106, 250000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1029, 1029, 2103, 200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1030, 1029, 2102, 500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1031, 1031, 87, 500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1033, 1031, 2104, 500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1043, 1044, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1045, 1044, 1096, 300000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2036, 2032, 2111, 300000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2038, 2033, 16, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2041, 2048, 2103, 200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2042, 2048, 2104, 500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2044, 2057, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2045, 2057, 4, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2046, 2058, 4, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2047, 2058, 9, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2048, 2059, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2049, 2059, 4, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3034, 3039, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3035, 3039, 4, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3036, 3040, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3037, 3040, 4, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3038, 3041, 7, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3039, 3041, 17, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3040, 3041, 2102, 500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (4034, 4032, 3120, 300000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5034, 5032, 14, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5035, 5032, 18, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5036, 5033, 7, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5037, 5033, 10, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5038, 5034, 7, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5039, 5034, 8, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5040, 5035, 11, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5041, 5035, 10, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5042, 5036, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5043, 5037, 16, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5044, 5037, 17, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5045, 5037, 19, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5046, 5037, 87, 500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5047, 5038, 13, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5048, 5038, 19, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5049, 5038, 2097, 800000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5050, 5039, 3, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5051, 5039, 11, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5052, 5039, 1096, 300000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5053, 5040, 4, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5054, 5041, 3, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5055, 5042, 4, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5056, 5043, 11, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5057, 5044, 1, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5058, 5045, 3, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5059, 5046, 12, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5060, 5047, 10, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5061, 5048, 7, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5062, 5048, 11, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5063, 5048, 17, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5064, 5049, 3, 3000000.0000, 2, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5065, 5049, 11, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5066, 5050, 10, 3500000.0000, 2, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5067, 5050, 11, 3200000.0000, 3, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5068, 5051, 9, 3500000.0000, 2, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5070, 5051, 14, 3200000.0000, 3, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5071, 5052, 14, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6034, 6032, 10, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6035, 6032, 16, 4000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6036, 6033, 6, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6037, 6033, 7, 3500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6038, 6034, 2098, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6039, 6034, 2105, 300000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6040, 6036, 3121, 500000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6041, 6037, 2104, 500000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6042, 6038, 3120, 300000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6043, 6039, 2103, 200000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6044, 6040, 2103, 200000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6045, 6041, 2098, 550000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6046, 6042, 12, 3200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (7045, 7042, 6118, 550000.0000, 3, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (7046, 7043, 6120, 800000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8045, 8041, 6116, 800000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8046, 8041, 6126, 950000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8047, 8042, 6119, 800000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8048, 8043, 6114, 1000000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8049, 8044, 6120, 800000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8050, 8045, 6125, 1500000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8051, 8046, 6116, 800000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8052, 8047, 6124, 1500000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8053, 8048, 6110, 1550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8054, 8049, 3, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8055, 8053, 6126, 950000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8056, 8056, 6126, 950000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8057, 8057, 6124, 1500000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8058, 8058, 6124, 1500000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8061, 8060, 6146, 200000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8062, 8061, 6118, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8063, 8062, 6127, 1550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8064, 8063, 6127, 1550000.0000, 1, NULL, NULL)
GO
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8065, 8064, 6127, 1550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8066, 8065, 3, 3000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8067, 8066, 6, 3450000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8068, 8067, 6146, 200000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8069, 8068, 6118, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8070, 8069, 6145, 400000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8071, 8070, 6118, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8072, 8071, 6128, 700000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8073, 8072, 6146, 200000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8074, 8073, 6126, 850000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8075, 8074, 6126, 850000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8076, 8075, 6116, 800000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8077, 8076, 6, 3450000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8078, 8077, 6118, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8079, 8078, 6117, 820000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8080, 8079, 6108, 1550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8081, 8080, 6118, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8082, 8081, 6121, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8083, 8082, 6126, 850000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8084, 8083, 6126, 850000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8085, 8084, 6126, 850000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8086, 8085, 6127, 1550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8088, 8086, 7, 3450000.0000, 4, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8089, 8086, 6, 3450000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8091, 8092, 6127, 1550000.0000, 2, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8092, 8092, 6118, 550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8093, 8093, 6127, 1550000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8094, 8094, 6113, 1890000.0000, 2, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8095, 8095, 6146, 200000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8096, 8097, 17, 3950000.0000, 3, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8098, 8102, 6150, 500000.0000, 3, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8099, 8103, 6146, 300000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8100, 8103, 6124, 1500000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8101, 8104, 6150, 500000.0000, 3, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8102, 8105, 6146, 300000.0000, 1, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8103, 8106, 3, 3000000.0000, 2, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8104, 8106, 7, 3450000.0000, 4, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8105, 8111, 6152, 300000.0000, 3, NULL, NULL)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8106, 8112, 6150, 400000.0000, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'KH01', NULL, N'Nguyễn Văn Nam', CAST(N'2008-06-25' AS Date), 1, N'0909123456', N'namnv1@gmail.com', NULL, N'$2a$10$gqjg3vT3KXCyJQUxg/W92./wZ8E6j2ct9IJxcB7Z/cbCm6YegmHu6', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.003' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'KH02', NULL, N'Lê Ánh Ngọc', NULL, 0, N'0912345678', N'ngocla2@gmail.com', NULL, N'$2a$10$KjGGJ1hrKn9HFCJ9rijSnuQ0ggTTzcMRxDbGBsGvYUIs4BtIwAdVq', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.023' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'KH03', NULL, N'Trần Quốc Nghĩa', NULL, 0, N'0923456789', N'nghiatq3@gmail.com', NULL, N'$2a$10$xl9NVDU4E9tKLImhSJot6OsWzlpD900Sc96jYcGJwO4gYqHY/0v3S', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.027' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'KH04', NULL, N'Nguyễn Phúc Long', NULL, 0, N'0934567890', N'longnp4@gmail.com', NULL, N'$2a$10$xmgbhZeqavOrI/UmII1kZuuJmnQnsAE2yPgFYk8MsdbotYwwR6n.y', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.027' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'KH05', NULL, N'Kiều Khánh Huyền', NULL, 0, N'0945678901', N'huyenkh5@gmail.com', NULL, N'$2a$10$c94MoOkhdJtK85QKjSdU.uGVlZ3iyskYTpcab68mRvbfvtcuLiykC', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.030' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, N'KH06', NULL, N'Nguyễn Thùy Linh', NULL, 0, N'0956789012', N'linhnt6@gmail.com', NULL, N'$2a$10$RzRVYq6IFZF6biHbCZ3C8Ohqb1v1m86WQTgs8cuZa5FRKwJvJJwsy', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.030' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, N'KH07', NULL, N'Bùi Huyền Anh', NULL, 0, N'0967890123', N'anhbh7@gmail.com', NULL, N'$2a$10$uTite45U/CuvTVgBTdDQoezxdSgPyM1ym28.jdUJUwy4HTHHlTB4q', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.030' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, N'KH08', NULL, N'Đặng Phương Thảo', NULL, 0, N'0978901234', N'thaodpt8@gmail.com', NULL, N'$2a$10$hmKvYUW70Ijdyi5KhBXuYOjjEe1CH6HKShXAz1ndsVt0bRXD4N0BW', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.033' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, N'KH09', NULL, N'Lê Hải Đăng', NULL, 0, N'0989012345', N'danghd9@gmail.com', NULL, N'$2a$10$12OtKbvgdTEDbl9kBuyfWe2Nlm7Sw5q35qLkGY2Rpm3ZvtES2Xqq6', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.033' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, N'KH10', NULL, N'Phùng Thanh Hiền', NULL, 0, N'0990123456', N'hienpt10@gmail.com', NULL, N'$2a$10$NyoVOxCVNCp5TzD4Hnk66OYXWgBDvf.UbdWpmpX/GwFF6q73RT3ry', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.037' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, N'KH11', NULL, N'Nguyễn Anh Vũ', NULL, 0, N'0910112233', N'vuna11@gmail.com', NULL, N'$2a$10$yfIA32I9.7WxU2orrZWsc.Tfvi4dfZbqhDuFxYZmQnf2UGUvEsn1i', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.037' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, N'KH12', NULL, N'Vũ Thùy Tiên', NULL, 0, N'0911223344', N'tienvt12@gmail.com', NULL, N'$2a$10$AhyUJoE2ehtjKjiMN1kqXelEAaqyz8q/EY.P0YeYEhfhiXX8bST/6', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.040' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, N'KH13', NULL, N'Lê Phương Anh', NULL, 0, N'0912334455', N'anhpa13@gmail.com', NULL, N'$2a$10$GRT4V/2ebc90tLLVmS8ozO.uLkoZoeuH6Oq4J73SlxCNcgMd9hbOm', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.040' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, N'KH14', NULL, N'Nguyễn Thị Thùy Linh', NULL, 0, N'0913445566', N'linhnt14@gmail.com', NULL, N'$2a$10$qzsPZRRnpVI0i57A8ZJ/wuihPme/qZT0lxcKl3uf01MmUGoh5aGQu', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.040' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, N'KH15', NULL, N'Đỗ Ánh Dương', NULL, 0, N'0914556677', N'duongad15@gmail.com', NULL, N'$2a$10$kkqHvImU4dCZs3MV4gC0QOXeZtkZPJuAHWAvN/uuolL1X5SAqmvg.', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.040' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, N'KH16', NULL, N'Nguyễn Thị Lan', NULL, 0, N'0915667788', N'lannt16@gmail.com', NULL, N'$2a$10$5/7ztF4hf3dYlBnoPS355eMxtKTYYfJJXfAxSp0Mfv.efCpk9HeU.', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.043' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, N'KH17', NULL, N'Nguyễn Anh Dũng', NULL, 0, N'0916778899', N'dungna17@gmail.com', NULL, N'$2a$10$9ua7AEvVf9PhAjMESl6eWOtDkzxP8e27jbIl/u0NJK.U0FjpmW0RO', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.043' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, N'KH18', NULL, N'Vũ Văn Nguyên', NULL, 0, N'0917889900', N'nguyenvv18@gmail.com', NULL, N'$2a$10$VyT4fzO1uzy.KpHjSJwhY.u6BK6089jIPcLRx5GpZyCu8KNOPy4uC', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.047' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, N'KH19', NULL, N'Hoàng Công Vinh', NULL, 0, N'0918990011', N'vinhhc19@gmail.com', NULL, N'$2a$10$OPL7ZfxwibbdpOt.nlpDcuyJWdTusy7.Y4augBDkAmnnJuy..Tss2', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.047' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, N'KH20', NULL, N'Bạch Văn Sơn', CAST(N'2025-02-05' AS Date), 1, N'0919001122', N'sonbv20@gmail.com', NULL, N'$2a$10$5NV5zLgxWxNd1eln6SuBxetbqGsgZ0orqXLEauRW/4ULValx.mjE2', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.050' AS DateTime), N'NV02', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, N'KH21', N'http://res.cloudinary.com/daowhglcl/image/upload/v1740664029/ejtv1w8viunjnvhw4m6o.png', N'nguyễn đức mạnh', CAST(N'2020-01-14' AS Date), 1, N'0974856857', N'manh123@gmail.com', NULL, N'$2a$10$FMeDVhPj028TI9pX8RZPkuJ0u8TXPwstV2D5K5XxFi2grj0WdXAry', CAST(N'2025-02-27T20:47:09.587' AS DateTime), N'NV02', CAST(N'2025-05-05T17:48:57.050' AS DateTime), N'NV02', 0)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1022, N'KH22', N'', N'Nguyễn Tùng Lâm', CAST(N'2013-06-05' AS Date), 1, N'03748568947', N'lam123@gmail.com', NULL, N'$2a$10$patyGEJKaTK.XlPcun1DeeBX0hybqkGMdyNCxff8ENFPNurhiI2sm', CAST(N'2025-04-03T22:46:41.497' AS DateTime), N'NV02', CAST(N'2025-05-05T17:48:57.050' AS DateTime), NULL, 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1023, N'KH23', N'', N'Nguyễn Thị Linh', CAST(N'2019-01-01' AS Date), 0, N'03748568944', N'linh123@gmail.com', NULL, N'$2a$10$XN9DQ36w5HfXRmAt.99iweKRTCv3fSy2HFAw145ub2/AP/IKpe.Ca', CAST(N'2025-04-27T20:55:10.070' AS DateTime), N'NV02', CAST(N'2025-05-05T17:48:57.053' AS DateTime), NULL, 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1024, N'kh164', NULL, N'Cường 7', CAST(N'2022-06-07' AS Date), 1, N'03748859697', N'cuong123@gmail.com', NULL, N'$2a$10$jiqVzColQJuU1s356amhiuGD8thxD199dOnH6c9jr4McL5zy1U.bO', CAST(N'2025-04-28T22:23:52.653' AS DateTime), NULL, CAST(N'2025-05-05T17:48:57.053' AS DateTime), NULL, 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1025, N'kh1359', NULL, N'Nguyễn Thị Kim', CAST(N'2017-06-14' AS Date), 0, N'024624635', N'kim123@gmail.com', NULL, N'$2a$10$0gkRQ3.kT0.MeQWadrEM7e2NH39gik3yE34dz1gZAeZR3Fl6QQ8NS', CAST(N'2025-05-03T21:53:11.180' AS DateTime), NULL, CAST(N'2025-05-05T17:48:57.057' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KichCo] ON 

INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'35', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'36', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'37', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'38', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'39', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, N'40', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, N'41', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, N'42', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, N'43', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, N'44', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-04-03T20:03:27.327' AS DateTime), N'NV02', 1)
SET IDENTITY_INSERT [dbo].[KichCo] OFF
GO
SET IDENTITY_INSERT [dbo].[LichSuHoaDon] ON 

INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1004, 4032, 2, NULL, CAST(N'2025-03-25T16:22:21.940' AS DateTime), NULL, CAST(N'2025-03-25T16:22:21.940' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1005, 4032, 2, NULL, CAST(N'2025-03-25T16:22:26.430' AS DateTime), NULL, CAST(N'2025-03-25T16:22:26.430' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1006, 4032, 2, NULL, CAST(N'2025-03-25T16:22:31.340' AS DateTime), NULL, CAST(N'2025-03-25T16:22:31.340' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1007, 4032, 2, NULL, CAST(N'2025-03-25T16:22:35.660' AS DateTime), NULL, CAST(N'2025-03-25T16:22:35.660' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1008, 4032, 2, NULL, CAST(N'2025-03-25T16:22:38.733' AS DateTime), NULL, CAST(N'2025-03-25T16:22:38.733' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2004, 6034, 2, NULL, CAST(N'2025-03-31T17:51:06.157' AS DateTime), NULL, CAST(N'2025-03-31T17:51:06.157' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2005, 6034, 2, NULL, CAST(N'2025-03-31T17:51:08.793' AS DateTime), NULL, CAST(N'2025-03-31T17:51:08.793' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2006, 6034, 2, NULL, CAST(N'2025-03-31T17:51:12.863' AS DateTime), NULL, CAST(N'2025-03-31T17:51:12.863' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2007, 6036, 2, NULL, CAST(N'2025-03-31T17:52:24.770' AS DateTime), NULL, CAST(N'2025-03-31T17:52:24.770' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2008, 6036, 2, NULL, CAST(N'2025-03-31T17:52:26.697' AS DateTime), NULL, CAST(N'2025-03-31T17:52:26.697' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2009, 6036, 2, NULL, CAST(N'2025-03-31T17:52:50.873' AS DateTime), NULL, CAST(N'2025-03-31T17:52:50.873' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2010, 6034, 2, NULL, CAST(N'2025-03-31T17:53:50.780' AS DateTime), NULL, CAST(N'2025-03-31T17:53:50.780' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2011, 6034, 2, NULL, CAST(N'2025-03-31T17:54:01.127' AS DateTime), NULL, CAST(N'2025-03-31T17:54:01.127' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2012, 6037, 2, NULL, CAST(N'2025-03-31T17:55:45.113' AS DateTime), NULL, CAST(N'2025-03-31T17:55:45.113' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2013, 6037, 2, NULL, CAST(N'2025-03-31T17:55:46.810' AS DateTime), NULL, CAST(N'2025-03-31T17:55:46.810' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2014, 6037, 2, NULL, CAST(N'2025-03-31T17:55:49.310' AS DateTime), NULL, CAST(N'2025-03-31T17:55:49.310' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2015, 6037, 2, NULL, CAST(N'2025-03-31T17:55:54.997' AS DateTime), NULL, CAST(N'2025-03-31T17:55:54.997' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2016, 6036, 2, NULL, CAST(N'2025-03-31T17:56:29.747' AS DateTime), NULL, CAST(N'2025-03-31T17:56:29.747' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2017, 6038, 2, NULL, CAST(N'2025-03-31T21:37:56.117' AS DateTime), NULL, CAST(N'2025-03-31T21:37:56.117' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2018, 6038, 2, NULL, CAST(N'2025-03-31T21:37:59.910' AS DateTime), NULL, CAST(N'2025-03-31T21:37:59.910' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2019, 6038, 2, NULL, CAST(N'2025-03-31T21:38:02.450' AS DateTime), NULL, CAST(N'2025-03-31T21:38:02.450' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2020, 6038, 2, NULL, CAST(N'2025-03-31T21:38:05.687' AS DateTime), NULL, CAST(N'2025-03-31T21:38:05.687' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2021, 6038, 2, NULL, CAST(N'2025-03-31T21:38:08.100' AS DateTime), NULL, CAST(N'2025-03-31T21:38:08.100' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2022, 6039, 2, NULL, CAST(N'2025-03-31T21:39:32.887' AS DateTime), NULL, CAST(N'2025-03-31T21:39:32.887' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2023, 6039, 2, NULL, CAST(N'2025-03-31T21:39:37.293' AS DateTime), NULL, CAST(N'2025-03-31T21:39:37.293' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2024, 6039, 2, NULL, CAST(N'2025-03-31T21:39:44.727' AS DateTime), NULL, CAST(N'2025-03-31T21:39:44.727' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2025, 6039, 2, NULL, CAST(N'2025-03-31T21:39:52.193' AS DateTime), NULL, CAST(N'2025-03-31T21:39:52.193' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2026, 6039, 2, NULL, CAST(N'2025-03-31T21:39:57.397' AS DateTime), NULL, CAST(N'2025-03-31T21:39:57.397' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2027, 6040, 2, NULL, CAST(N'2025-03-31T21:41:27.107' AS DateTime), NULL, CAST(N'2025-03-31T21:41:27.107' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2028, 6040, 2, NULL, CAST(N'2025-03-31T21:41:44.503' AS DateTime), NULL, CAST(N'2025-03-31T21:41:44.503' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2029, 6040, 2, NULL, CAST(N'2025-03-31T21:42:43.463' AS DateTime), NULL, CAST(N'2025-03-31T21:42:43.463' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2030, 6040, 2, NULL, CAST(N'2025-03-31T21:42:49.690' AS DateTime), NULL, CAST(N'2025-03-31T21:42:49.690' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2031, 8041, 2, NULL, CAST(N'2025-04-10T14:12:33.700' AS DateTime), NULL, CAST(N'2025-04-10T14:12:33.700' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2032, 8041, 2, NULL, CAST(N'2025-04-10T14:12:36.380' AS DateTime), NULL, CAST(N'2025-04-10T14:12:36.380' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2033, 8041, 2, NULL, CAST(N'2025-04-10T14:12:41.473' AS DateTime), NULL, CAST(N'2025-04-10T14:12:41.473' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2034, 8041, 2, NULL, CAST(N'2025-04-10T14:12:44.153' AS DateTime), NULL, CAST(N'2025-04-10T14:12:44.153' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2035, 8042, 2, NULL, CAST(N'2025-04-10T14:21:34.550' AS DateTime), NULL, CAST(N'2025-04-10T14:21:34.550' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2036, 8042, 2, NULL, CAST(N'2025-04-10T14:21:37.137' AS DateTime), NULL, CAST(N'2025-04-10T14:21:37.137' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2037, 8042, 2, NULL, CAST(N'2025-04-10T14:21:43.517' AS DateTime), NULL, CAST(N'2025-04-10T14:21:43.517' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2038, 8042, 2, NULL, CAST(N'2025-04-10T14:26:02.907' AS DateTime), NULL, CAST(N'2025-04-10T14:26:02.907' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2039, 8043, 2, NULL, CAST(N'2025-04-10T14:31:03.290' AS DateTime), NULL, CAST(N'2025-04-10T14:31:03.290' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2040, 8043, 2, NULL, CAST(N'2025-04-10T14:31:13.363' AS DateTime), NULL, CAST(N'2025-04-10T14:31:13.363' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2041, 8044, 2, NULL, CAST(N'2025-04-10T14:31:48.810' AS DateTime), NULL, CAST(N'2025-04-10T14:31:48.810' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2042, 8044, 2, NULL, CAST(N'2025-04-10T14:31:50.673' AS DateTime), NULL, CAST(N'2025-04-10T14:31:50.673' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2043, 8044, 2, NULL, CAST(N'2025-04-10T14:32:03.037' AS DateTime), NULL, CAST(N'2025-04-10T14:32:03.037' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2044, 8044, 2, NULL, CAST(N'2025-04-10T14:32:05.263' AS DateTime), NULL, CAST(N'2025-04-10T14:32:05.263' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2045, 8045, 2, NULL, CAST(N'2025-04-10T14:34:01.717' AS DateTime), NULL, CAST(N'2025-04-10T14:34:01.717' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2046, 8045, 2, NULL, CAST(N'2025-04-10T14:34:11.500' AS DateTime), NULL, CAST(N'2025-04-10T14:34:11.500' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2047, 8045, 2, NULL, CAST(N'2025-04-10T14:34:17.667' AS DateTime), NULL, CAST(N'2025-04-10T14:34:17.667' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2048, 8045, 2, NULL, CAST(N'2025-04-10T14:45:21.147' AS DateTime), NULL, CAST(N'2025-04-10T14:45:21.147' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2049, 8046, 2, NULL, CAST(N'2025-04-10T14:49:23.327' AS DateTime), NULL, CAST(N'2025-04-10T14:49:23.327' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2050, 8046, 2, NULL, CAST(N'2025-04-10T14:49:26.647' AS DateTime), NULL, CAST(N'2025-04-10T14:49:26.647' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2051, 8046, 2, NULL, CAST(N'2025-04-10T14:49:30.620' AS DateTime), NULL, CAST(N'2025-04-10T14:49:30.620' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2052, 8041, 2, NULL, CAST(N'2025-04-10T14:52:51.283' AS DateTime), NULL, CAST(N'2025-04-10T14:52:51.283' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2053, 8046, 2, NULL, CAST(N'2025-04-10T15:01:08.390' AS DateTime), NULL, CAST(N'2025-04-10T15:01:08.390' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2054, 8047, 2, NULL, CAST(N'2025-04-10T15:04:35.243' AS DateTime), NULL, CAST(N'2025-04-10T15:04:35.243' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2055, 8047, 2, NULL, CAST(N'2025-04-10T15:04:36.940' AS DateTime), NULL, CAST(N'2025-04-10T15:04:36.940' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2056, 8047, 2, NULL, CAST(N'2025-04-10T15:04:39.317' AS DateTime), NULL, CAST(N'2025-04-10T15:04:39.317' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2057, 8047, 2, NULL, CAST(N'2025-04-10T15:05:28.637' AS DateTime), NULL, CAST(N'2025-04-10T15:05:28.637' AS DateTime), N'luongthptnqb123@gmail.com', 7)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2058, 8048, 2, NULL, CAST(N'2025-04-10T15:06:09.600' AS DateTime), NULL, CAST(N'2025-04-10T15:06:09.600' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2059, 8048, 2, NULL, CAST(N'2025-04-10T15:06:11.183' AS DateTime), NULL, CAST(N'2025-04-10T15:06:11.183' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2060, 8048, 2, NULL, CAST(N'2025-04-10T15:06:14.357' AS DateTime), NULL, CAST(N'2025-04-10T15:06:14.357' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2061, 8048, 2, NULL, CAST(N'2025-04-10T15:06:17.043' AS DateTime), NULL, CAST(N'2025-04-10T15:06:17.043' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2062, 8048, 2, NULL, CAST(N'2025-04-10T15:06:25.610' AS DateTime), NULL, CAST(N'2025-04-10T15:06:25.610' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2063, 8053, 2, NULL, CAST(N'2025-04-26T22:46:30.847' AS DateTime), NULL, CAST(N'2025-04-26T22:46:30.847' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2064, 8053, 2, NULL, CAST(N'2025-04-26T22:46:33.757' AS DateTime), NULL, CAST(N'2025-04-26T22:46:33.757' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2065, 8053, 2, NULL, CAST(N'2025-04-26T22:46:40.573' AS DateTime), NULL, CAST(N'2025-04-26T22:46:40.573' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2066, 8053, 2, NULL, CAST(N'2025-04-26T22:46:44.920' AS DateTime), NULL, CAST(N'2025-04-26T22:46:44.920' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2067, 8053, 2, NULL, CAST(N'2025-04-26T22:46:55.220' AS DateTime), NULL, CAST(N'2025-04-26T22:46:55.220' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2068, 8056, 2, NULL, CAST(N'2025-04-27T13:36:56.203' AS DateTime), NULL, CAST(N'2025-04-27T13:36:56.203' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2069, 8056, 2, NULL, CAST(N'2025-04-27T13:36:57.770' AS DateTime), NULL, CAST(N'2025-04-27T13:36:57.770' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2070, 8056, 2, NULL, CAST(N'2025-04-27T13:36:59.353' AS DateTime), NULL, CAST(N'2025-04-27T13:36:59.353' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2071, 8056, 2, NULL, CAST(N'2025-04-27T13:37:01.267' AS DateTime), NULL, CAST(N'2025-04-27T13:37:01.267' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2072, 8056, 2, NULL, CAST(N'2025-04-27T13:37:03.467' AS DateTime), NULL, CAST(N'2025-04-27T13:37:03.467' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2073, 8060, 2, NULL, CAST(N'2025-04-27T21:25:04.770' AS DateTime), NULL, CAST(N'2025-04-27T21:25:04.770' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2074, 8060, 2, NULL, CAST(N'2025-04-27T21:25:25.737' AS DateTime), NULL, CAST(N'2025-04-27T21:25:25.737' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2075, 8064, 2, NULL, CAST(N'2025-04-28T12:57:30.833' AS DateTime), NULL, CAST(N'2025-04-28T12:57:30.833' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2076, 8064, 2, NULL, CAST(N'2025-04-28T12:57:32.760' AS DateTime), NULL, CAST(N'2025-04-28T12:57:32.760' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2077, 8064, 2, NULL, CAST(N'2025-04-28T12:57:34.283' AS DateTime), NULL, CAST(N'2025-04-28T12:57:34.283' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2078, 8064, 2, NULL, CAST(N'2025-04-28T12:57:35.997' AS DateTime), NULL, CAST(N'2025-04-28T12:57:35.997' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2079, 8064, 2, NULL, CAST(N'2025-04-28T12:57:40.060' AS DateTime), NULL, CAST(N'2025-04-28T12:57:40.060' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2080, 8063, 2, NULL, CAST(N'2025-04-28T13:38:33.140' AS DateTime), NULL, CAST(N'2025-04-28T13:38:33.140' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2081, 8062, 2, NULL, CAST(N'2025-04-28T13:41:23.200' AS DateTime), NULL, CAST(N'2025-04-28T13:41:23.200' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2082, 8061, 2, NULL, CAST(N'2025-04-28T13:46:07.463' AS DateTime), NULL, CAST(N'2025-04-28T13:46:07.463' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2083, 8058, 2, NULL, CAST(N'2025-04-28T13:53:37.457' AS DateTime), NULL, CAST(N'2025-04-28T13:53:37.457' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2084, 8067, 2, NULL, CAST(N'2025-04-28T13:58:58.547' AS DateTime), NULL, CAST(N'2025-04-28T13:58:58.547' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2085, 8068, 2, NULL, CAST(N'2025-04-28T14:06:36.770' AS DateTime), NULL, CAST(N'2025-04-28T14:06:36.770' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2086, 8069, 2, NULL, CAST(N'2025-04-28T14:10:22.830' AS DateTime), NULL, CAST(N'2025-04-28T14:10:22.830' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2087, 8070, 2, NULL, CAST(N'2025-04-28T14:16:11.357' AS DateTime), NULL, CAST(N'2025-04-28T14:16:11.357' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2088, 8071, 2, NULL, CAST(N'2025-04-28T14:30:20.360' AS DateTime), NULL, CAST(N'2025-04-28T14:30:20.360' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2089, 8072, 2, NULL, CAST(N'2025-04-28T14:39:48.880' AS DateTime), NULL, CAST(N'2025-04-28T14:39:48.880' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2090, 8073, 2, NULL, CAST(N'2025-04-28T14:46:39.163' AS DateTime), NULL, CAST(N'2025-04-28T14:46:39.163' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2091, 8074, 2, NULL, CAST(N'2025-04-28T14:49:52.920' AS DateTime), NULL, CAST(N'2025-04-28T14:49:52.920' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2092, 8075, 2, NULL, CAST(N'2025-04-28T14:57:38.177' AS DateTime), NULL, CAST(N'2025-04-28T14:57:38.177' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2093, 8075, 2, NULL, CAST(N'2025-04-28T17:23:47.467' AS DateTime), NULL, CAST(N'2025-04-28T17:23:47.467' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2094, 8075, 2, NULL, CAST(N'2025-04-28T17:23:49.320' AS DateTime), NULL, CAST(N'2025-04-28T17:23:49.320' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2095, 8075, 2, NULL, CAST(N'2025-04-28T17:23:51.050' AS DateTime), NULL, CAST(N'2025-04-28T17:23:51.050' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2096, 8075, 2, NULL, CAST(N'2025-04-28T17:23:52.927' AS DateTime), NULL, CAST(N'2025-04-28T17:23:52.927' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2097, 8057, 2, NULL, CAST(N'2025-04-28T17:23:59.780' AS DateTime), NULL, CAST(N'2025-04-28T17:23:59.780' AS DateTime), N'luongthptnqb123@gmail.com', 2)
GO
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2098, 8077, 2, NULL, CAST(N'2025-04-28T17:36:37.220' AS DateTime), NULL, CAST(N'2025-04-28T17:36:37.220' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2099, 8078, 2, NULL, CAST(N'2025-04-28T17:42:57.573' AS DateTime), NULL, CAST(N'2025-04-28T17:42:57.573' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2100, 8079, 2, NULL, CAST(N'2025-04-28T17:48:40.277' AS DateTime), NULL, CAST(N'2025-04-28T17:48:40.277' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2101, 8080, 2, NULL, CAST(N'2025-04-28T17:51:46.900' AS DateTime), NULL, CAST(N'2025-04-28T17:51:46.900' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2102, 8081, 2, NULL, CAST(N'2025-04-28T17:55:00.583' AS DateTime), NULL, CAST(N'2025-04-28T17:55:00.583' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2103, 8082, 2, NULL, CAST(N'2025-04-28T17:56:44.883' AS DateTime), NULL, CAST(N'2025-04-28T17:56:44.883' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2104, 8083, 2, NULL, CAST(N'2025-04-28T18:04:06.563' AS DateTime), NULL, CAST(N'2025-04-28T18:04:06.563' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2105, 8084, 2, NULL, CAST(N'2025-04-28T22:01:57.343' AS DateTime), NULL, CAST(N'2025-04-28T22:01:57.343' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2106, 8084, 2, NULL, CAST(N'2025-04-28T22:33:52.847' AS DateTime), NULL, CAST(N'2025-04-28T22:33:52.847' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2107, 8084, 2, NULL, CAST(N'2025-04-28T22:34:17.660' AS DateTime), NULL, CAST(N'2025-04-28T22:34:17.660' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2108, 8083, 2, NULL, CAST(N'2025-04-28T22:34:53.550' AS DateTime), NULL, CAST(N'2025-04-28T22:34:53.550' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2109, 8092, 2, NULL, CAST(N'2025-04-28T22:36:56.253' AS DateTime), NULL, CAST(N'2025-04-28T22:36:56.253' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2110, 8092, NULL, NULL, CAST(N'2025-04-28T22:37:09.680' AS DateTime), NULL, CAST(N'2025-04-28T22:37:09.680' AS DateTime), N'cuong123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2111, 8093, 2, NULL, CAST(N'2025-04-28T22:38:28.207' AS DateTime), NULL, CAST(N'2025-04-28T22:38:28.207' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2112, 8093, 2, NULL, CAST(N'2025-04-28T22:38:51.443' AS DateTime), NULL, CAST(N'2025-04-28T22:38:51.443' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2113, 8093, 2, NULL, CAST(N'2025-04-28T22:39:14.897' AS DateTime), NULL, CAST(N'2025-04-28T22:39:14.897' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2114, 8095, 2, NULL, CAST(N'2025-04-28T22:46:11.720' AS DateTime), NULL, CAST(N'2025-04-28T22:46:11.720' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2115, 8095, 2, NULL, CAST(N'2025-04-28T22:48:32.770' AS DateTime), NULL, CAST(N'2025-04-28T22:48:32.770' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2116, 8095, 2, NULL, CAST(N'2025-04-28T22:48:38.973' AS DateTime), NULL, CAST(N'2025-04-28T22:48:38.973' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2117, 8095, 2, NULL, CAST(N'2025-04-28T22:49:36.163' AS DateTime), NULL, CAST(N'2025-04-28T22:49:36.163' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2118, 8095, 2, NULL, CAST(N'2025-04-28T22:49:38.987' AS DateTime), NULL, CAST(N'2025-04-28T22:49:38.987' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2119, 8103, 2, NULL, CAST(N'2025-05-03T21:46:13.660' AS DateTime), NULL, CAST(N'2025-05-03T21:46:13.660' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2120, 8103, 2, NULL, CAST(N'2025-05-03T21:46:55.593' AS DateTime), NULL, CAST(N'2025-05-03T21:46:55.593' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2121, 8103, 2, NULL, CAST(N'2025-05-03T21:47:02.030' AS DateTime), NULL, CAST(N'2025-05-03T21:47:02.030' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2122, 8103, 2, NULL, CAST(N'2025-05-03T21:47:16.380' AS DateTime), NULL, CAST(N'2025-05-03T21:47:16.380' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2123, 8103, 2, NULL, CAST(N'2025-05-03T21:47:18.937' AS DateTime), NULL, CAST(N'2025-05-03T21:47:18.937' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2124, 8105, 2, NULL, CAST(N'2025-05-03T21:59:21.357' AS DateTime), NULL, CAST(N'2025-05-03T21:59:21.357' AS DateTime), N'luongthptnqb123@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2125, 8105, 2, NULL, CAST(N'2025-05-03T21:59:54.797' AS DateTime), NULL, CAST(N'2025-05-03T21:59:54.797' AS DateTime), N'luongthptnqb123@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2126, 8105, 2, NULL, CAST(N'2025-05-03T22:00:01.540' AS DateTime), NULL, CAST(N'2025-05-03T22:00:01.540' AS DateTime), N'luongthptnqb123@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2127, 8104, 2, NULL, CAST(N'2025-05-03T22:00:28.583' AS DateTime), NULL, CAST(N'2025-05-03T22:00:28.583' AS DateTime), N'luongthptnqb123@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2128, 8105, 2, NULL, CAST(N'2025-05-03T22:00:38.623' AS DateTime), NULL, CAST(N'2025-05-03T22:00:38.623' AS DateTime), N'luongthptnqb123@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2129, 8105, 2, NULL, CAST(N'2025-05-03T22:00:42.637' AS DateTime), NULL, CAST(N'2025-05-03T22:00:42.637' AS DateTime), N'luongthptnqb123@gmail.com', 8)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2130, 8112, 24, NULL, CAST(N'2025-05-03T22:58:48.903' AS DateTime), NULL, CAST(N'2025-05-03T22:58:48.903' AS DateTime), N'luongndl284@gmail.com', 2)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2131, 8112, 24, NULL, CAST(N'2025-05-03T22:59:20.353' AS DateTime), NULL, CAST(N'2025-05-03T22:59:20.353' AS DateTime), N'luongndl284@gmail.com', 3)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2132, 8112, 24, NULL, CAST(N'2025-05-03T22:59:25.147' AS DateTime), NULL, CAST(N'2025-05-03T22:59:25.147' AS DateTime), N'luongndl284@gmail.com', 4)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2133, 8111, 24, NULL, CAST(N'2025-05-03T22:59:43.693' AS DateTime), NULL, CAST(N'2025-05-03T22:59:43.693' AS DateTime), N'luongndl284@gmail.com', 6)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2134, 8112, 24, NULL, CAST(N'2025-05-03T22:59:54.700' AS DateTime), NULL, CAST(N'2025-05-03T22:59:54.700' AS DateTime), N'luongndl284@gmail.com', 5)
INSERT [dbo].[LichSuHoaDon] ([Id], [IdHoaDon], [IdNhanVien], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2135, 8112, 24, NULL, CAST(N'2025-05-03T23:00:00.140' AS DateTime), NULL, CAST(N'2025-05-03T23:00:00.140' AS DateTime), N'luongndl284@gmail.com', 8)
SET IDENTITY_INSERT [dbo].[LichSuHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[MauSac] ON 

INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'#2e53c2', N'Xanh dương', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'#f76808', N'Cam', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'#f50505', N'Đỏ', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'#030303', N'Đen', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'#77e92b', N'Xanh lá', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, N'#288a6a', N'Turquoise', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, N'#0eccfb', N'Xanh nhạt', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, N'#654206', N'Nâu', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, N'#d1236f', N'Hồng', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, N'#003b99', N'Xanh navy', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, N'#ffcc00', N'Vàng', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, N'#e6e6e6', N'Xám', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, N'#ffffff', N'Trắng', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, N'#f9f9f9', N'Kem', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, N'#c0c0c0', N'Bạc', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, N'#ffd700', N'Vàng kim', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, N'#e5e500', N'Vàng chanh', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, N'#000080', N'Xanh dương đậm', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, N'#4b0082', N'Tím', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, N'#ff6347', N'Tomato', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[MauSac] ([Id], [MaMauSac], [TenMauSac], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, N'#7e3e3e', N'Đỏ đen', CAST(N'2025-03-18T20:20:04.837' AS DateTime), N'NV02', CAST(N'2025-03-18T20:20:04.837' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'NV01', N'http://res.cloudinary.com/daowhglcl/image/upload/v1741081320/sxv673ch0wk0votpnlnw.png', N'Bùi Đức Việt', CAST(N'2002-10-15' AS Date), 1, N'Hà Nội', N'037658767847', N'0934567890', N'buiducviet101@gmail.com', NULL, N'$2a$10$04xBDpa69FW4hs/SduKX0O7mx8Csx0JzxRUjhkGIL3rYPWlfwz1q.', 1, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.073' AS DateTime), N'NV02', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'NV02', N'http://res.cloudinary.com/djw90k3et/image/upload/v1745730738/d5n830ma41oxbukpovom.png', N'Nguyễn Đức Lương', CAST(N'2004-06-15' AS Date), 1, N'Hà Nội', N'057658767847', N'0945678901', N'luongthptnqb123@gmail.com', NULL, N'$2a$10$QmJasSBmz8VmmBDXWNxh4eK55nLzNz6TMj4oujlptz8.F7.RbEyem', 1, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.077' AS DateTime), N'NV02', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, N'NV18', N'http://res.cloudinary.com/dkc0ky8md/image/upload/v1740406978/r7irjfg7lrlhbzbt0vpi.png', N'Truong Văn Thiện', CAST(N'2022-02-08' AS Date), 1, N'Hà Nội', N'057658767847', N'0989012345', N'thientv18@gmail.com', NULL, N'$2a$10$FE48ULFJ21xlRCDH65VMo.XCGjeRegg0NWkI6TIkSqB5lVKrwyuBq', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.077' AS DateTime), N'NV02', 0)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, N'NV19', N'http://res.cloudinary.com/dkc0ky8md/image/upload/v1740406941/i3ctsrolz49lvmqimpux.png', N'Trần Tuấn Vũ', CAST(N'2025-01-28' AS Date), 1, N'Hà Nội', N'057658767847', N'0990123456', N'vutuan19@gmail.com', NULL, N'$2a$10$VTOf9FRirEoRfZXGU0TwR.8VCVbnqtCP6s/rtUz3W6sqonYjKtpHS', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.080' AS DateTime), N'NV02', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, N'NV20', N'http://res.cloudinary.com/dkc0ky8md/image/upload/v1740404011/geyldgamiv0uu2ee9u0m.jpg', N'Trương Hà Vy', CAST(N'2025-02-20' AS Date), 0, N'Hà Nội', N'057658767847', N'0901234567', N'vyth21@gmail.com', NULL, N'$2a$10$7BdgEc6nyOhVHWcFG5YjSOXOMUMPRsmFW.xtqbqmq8vnpHgdZ.GlO', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.080' AS DateTime), N'NV02', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, N'NV21', N'http://res.cloudinary.com/dkc0ky8md/image/upload/v1740403953/q7tooncvutnlcsbokkry.png', N'Bùi Văn Hiệu', CAST(N'2025-02-05' AS Date), 1, N'Hà Nội', N'036765876784', N'0934567890', N'tuan2@gmail.com', NULL, N'$2a$10$b7/bh6yWwaN1JzbWyaB7auMSKblDkj7Ke3ENRqWPvtHki.J2aJKUW', 1, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-05-05T17:48:57.080' AS DateTime), N'NV02', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (22, N'NV007', N'http://res.cloudinary.com/djw90k3et/image/upload/v1745762067/mxrxcnfppwcvhkdzmire.png', N'Nguyễn Văn Bình', CAST(N'2025-04-09' AS Date), 1, N'ninh binh', N'057658767846', N'03748568943', N'binh123@gmail.com', NULL, N'$2a$10$U1Mx0.2PWRv4d1bcCG4zueyyugoFURoJMWQMtMd1qxPrIAEevIubK', 1, CAST(N'2025-04-27T20:54:26.750' AS DateTime), N'NV02', CAST(N'2025-05-05T17:48:57.083' AS DateTime), NULL, 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (23, N'NV008', N'http://res.cloudinary.com/djw90k3et/image/upload/v1746282356/jiyhbt2rtrmufxt5utcr.jpg', N'Nguyễn Mai Linh', CAST(N'2020-05-04' AS Date), 0, N'Hà Nội', N'057658767847', N'03748568949', N'linh123@gmail.com', NULL, N'$2a$10$uo.cRF3Z1pmQ2ZjGozk6deZgNiMQn/5FCbCty5LoQLYR/TI25cbXu', 1, CAST(N'2025-05-03T21:25:58.543' AS DateTime), N'NV02', CAST(N'2025-05-05T17:48:57.083' AS DateTime), NULL, 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (24, N'NV009', N'http://res.cloudinary.com/djw90k3et/image/upload/v1746286679/dsd75wcdqyxep2m6jzr6.png', N'nguyễn đức lương', CAST(N'2019-06-03' AS Date), 1, N'Hà Nội', N'037658767847', N'03748568942', N'luongndl284@gmail.com', NULL, N'$2a$10$D5UuEyvYkhlAK6MYTiQ7bOQsdU99BPnTr7C2g8Ii6zWkucRJENi7y', 1, CAST(N'2025-05-03T22:38:00.987' AS DateTime), N'NV02', CAST(N'2025-05-05T17:48:57.087' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuGiamGia] ON 

INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1006, NULL, N'PGG10', N'GG5k', 30000.0000, 20, 10000.0000, 40, 0, NULL, CAST(N'2025-02-13T21:33:00.000' AS DateTime), CAST(N'2025-02-28T21:33:00.000' AS DateTime), CAST(N'2025-02-27T21:33:33.377' AS DateTime), N'NV02', CAST(N'2025-03-19T20:32:12.807' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2004, NULL, N'GG25', N'GG25k', NULL, 25000, 50000.0000, 4, 1, NULL, CAST(N'2025-03-19T19:28:00.000' AS DateTime), CAST(N'2025-03-19T19:31:00.000' AS DateTime), CAST(N'2025-03-19T19:32:25.257' AS DateTime), N'NV02', CAST(N'2025-03-19T19:32:25.257' AS DateTime), NULL, 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2005, NULL, N'GG2', N'GG2', 30000.0000, 10, 50000.0000, 40, 0, NULL, CAST(N'2025-03-19T19:32:00.000' AS DateTime), CAST(N'2025-03-29T19:32:00.000' AS DateTime), CAST(N'2025-03-19T19:32:49.363' AS DateTime), N'NV02', CAST(N'2025-03-31T17:12:29.583' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2006, NULL, N'GG257', N'GG10', 30000.0000, 100000, 50000.0000, 40, 1, NULL, CAST(N'2025-03-19T19:39:00.000' AS DateTime), CAST(N'2025-03-21T19:39:00.000' AS DateTime), CAST(N'2025-03-19T19:39:09.593' AS DateTime), N'NV02', CAST(N'2025-03-21T20:15:51.110' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2007, NULL, N'GG253', N'GG52k', NULL, 25000, 50000.0000, 40, 1, NULL, CAST(N'2025-03-19T22:46:00.000' AS DateTime), CAST(N'2025-03-20T22:46:00.000' AS DateTime), CAST(N'2025-03-19T22:46:34.027' AS DateTime), N'NV02', CAST(N'2025-03-21T20:15:51.107' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2008, NULL, N'GG252', N'GG5k', 30000.0000, 10, 200000.0000, 38, 0, NULL, CAST(N'2025-03-19T22:47:00.000' AS DateTime), CAST(N'2025-04-01T22:47:00.000' AS DateTime), CAST(N'2025-03-19T22:47:08.140' AS DateTime), N'NV02', CAST(N'2025-04-03T20:23:08.857' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3004, NULL, N'GG2025', N'GG2025', NULL, 25000, 100000.0000, 1, 1, NULL, CAST(N'2025-03-25T22:33:00.000' AS DateTime), CAST(N'2025-04-01T22:33:00.000' AS DateTime), CAST(N'2025-03-26T22:33:17.540' AS DateTime), N'NV02', CAST(N'2025-04-03T20:23:08.857' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3005, NULL, N'GG2025', N'drhh', NULL, 10000, 500000.0000, 36, 1, NULL, CAST(N'2025-04-10T22:09:00.000' AS DateTime), CAST(N'2025-04-22T22:09:00.000' AS DateTime), CAST(N'2025-04-03T22:09:28.357' AS DateTime), N'NV02', CAST(N'2025-04-25T16:06:27.360' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3006, NULL, N'GG26', N'GG5k66', 30000.0000, 19, 50000.0000, 25, 0, NULL, CAST(N'2025-04-02T23:04:00.000' AS DateTime), CAST(N'2025-05-30T23:04:00.000' AS DateTime), CAST(N'2025-04-03T23:04:42.180' AS DateTime), N'NV02', CAST(N'2025-05-03T22:55:43.777' AS DateTime), NULL, 1)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4005, NULL, N'GG252', N'GG52k56', NULL, 1000000, 500000.0000, 40, 1, NULL, CAST(N'2025-04-05T21:15:00.000' AS DateTime), CAST(N'2025-04-07T21:15:00.000' AS DateTime), CAST(N'2025-04-06T21:15:18.190' AS DateTime), N'NV02', CAST(N'2025-04-18T17:17:29.890' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4006, NULL, N'sale-30', N'GG500k', NULL, 25000, 500000.0000, 3, 1, NULL, CAST(N'2025-04-27T13:05:00.000' AS DateTime), CAST(N'2025-04-29T13:05:00.000' AS DateTime), CAST(N'2025-04-27T13:05:27.577' AS DateTime), N'NV02', CAST(N'2025-05-03T22:02:06.283' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4007, NULL, N'Sale-40', N'Giảm giá hè', NULL, 400000, 1000000.0000, 39, 1, NULL, CAST(N'2025-04-27T20:58:00.000' AS DateTime), CAST(N'2025-04-30T20:58:00.000' AS DateTime), CAST(N'2025-04-27T20:58:45.350' AS DateTime), N'NV02', CAST(N'2025-05-03T22:02:06.283' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4008, NULL, N'SALA45', N'Giảm giá 40-5', NULL, 250000, 500000.0000, 3, 1, NULL, CAST(N'2025-04-21T22:55:00.000' AS DateTime), CAST(N'2025-04-29T22:55:00.000' AS DateTime), CAST(N'2025-04-28T22:55:51.507' AS DateTime), N'NV02', CAST(N'2025-05-03T22:02:06.283' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4009, NULL, N'GG252', N'drhh', 40000.0000, 10, 500000.0000, 50, 0, NULL, CAST(N'2025-04-28T08:57:00.000' AS DateTime), CAST(N'2025-04-30T09:09:00.000' AS DateTime), CAST(N'2025-04-28T22:57:18.077' AS DateTime), N'NV02', CAST(N'2025-05-03T22:02:06.283' AS DateTime), N'NV02', 0)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4010, NULL, N'GG2025', N'Giảm giá hè', NULL, 250000, 500000.0000, 100, 1, NULL, CAST(N'2025-05-02T01:03:00.000' AS DateTime), CAST(N'2025-05-05T01:03:00.000' AS DateTime), CAST(N'2025-05-03T22:03:29.940' AS DateTime), N'NV02', CAST(N'2025-05-03T22:07:00.523' AS DateTime), N'NV02', 1)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4011, NULL, N'GG2025', N'Giảm giá hè 2', 30000.0000, 10, 500000.0000, 40, 0, NULL, CAST(N'2025-05-02T15:07:00.000' AS DateTime), CAST(N'2025-05-04T15:07:00.000' AS DateTime), CAST(N'2025-05-03T22:07:35.743' AS DateTime), N'NV02', CAST(N'2025-05-03T23:02:29.850' AS DateTime), N'NV009', 0)
SET IDENTITY_INSERT [dbo].[PhieuGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] ON 

INSERT [dbo].[PhuongThucThanhToan] ([Id], [IdHoaDon], [TenPhuongThuc], [MoTa], [TongTien], [MaGiaoDichVnPay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 8095, N'Vnpay', NULL, 239001.0000, N'1745854895565', CAST(N'2025-04-28T22:44:38.493' AS DateTime), NULL, CAST(N'2025-04-28T22:44:38.493' AS DateTime), NULL, 0)
INSERT [dbo].[PhuongThucThanhToan] ([Id], [IdHoaDon], [TenPhuongThuc], [MoTa], [TongTien], [MaGiaoDichVnPay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 8103, N'Vnpay', NULL, 1839001.0000, N'1746283233423', CAST(N'2025-05-03T21:41:27.783' AS DateTime), NULL, CAST(N'2025-05-03T21:41:27.783' AS DateTime), NULL, 0)
INSERT [dbo].[PhuongThucThanhToan] ([Id], [IdHoaDon], [TenPhuongThuc], [MoTa], [TongTien], [MaGiaoDichVnPay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 8105, N'Vnpay', NULL, 309001.0000, N'1746284245918', CAST(N'2025-05-03T21:58:10.697' AS DateTime), NULL, CAST(N'2025-05-03T21:58:10.697' AS DateTime), NULL, 0)
INSERT [dbo].[PhuongThucThanhToan] ([Id], [IdHoaDon], [TenPhuongThuc], [MoTa], [TongTien], [MaGiaoDichVnPay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 8112, N'Vnpay', NULL, 439001.0000, N'1746287805032', CAST(N'2025-05-03T22:57:34.817' AS DateTime), NULL, CAST(N'2025-05-03T22:57:34.817' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, 1, 1, N'SP01', N'Nike Air Max', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-04-25T13:34:55.007' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 1, 2, 2, N'SP02', N'Nike Zoom', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-04-25T13:33:40.293' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 1, 3, 3, N'SP03', N'Nike Pegasus', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 2, 1, 4, N'SP04', N'Adidas Ultraboost', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, 1, 3, 2, N'SP05', N'Nike Zoom Mercurial Superfly 9 Academy MDS TF', CAST(N'2025-02-24T18:19:29.763' AS DateTime), N'NV01', CAST(N'2025-02-24T18:19:29.763' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1021, 2, 2, 2, N'SP06', N'Adidas X Crazyfast 3', CAST(N'2025-02-27T18:35:51.400' AS DateTime), N'NV02', CAST(N'2025-02-27T18:35:51.400' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1022, 2, 2, 2, N'SP07', N'Nike Tiempo 10 Academy TF', CAST(N'2025-02-27T19:06:54.180' AS DateTime), N'NV02', CAST(N'2025-02-27T19:06:54.180' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1024, 2, 3, 2, N'SP08', N'Nike Mercurial Vapor 16 Academy TF', CAST(N'2025-02-27T21:31:52.737' AS DateTime), N'NV02', CAST(N'2025-02-27T21:31:52.737' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2024, 7, 3, 2, N'SP09', N'Giày đá bóng Mizuno Monacirda Neo II Select Tf', CAST(N'2025-03-04T16:43:32.337' AS DateTime), N'NV02', CAST(N'2025-03-04T16:43:32.337' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2025, 11, 3, 2, N'SP010', N'Giày bóng đá AKKA Speed 2 Xanh dương', CAST(N'2025-03-04T18:55:13.893' AS DateTime), N'NV02', CAST(N'2025-03-04T18:55:13.893' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2026, 11, 3, 2, N'SP011', N'Giày bóng đá AKKA Speed 2 Cam', CAST(N'2025-03-04T18:58:26.050' AS DateTime), N'NV02', CAST(N'2025-03-04T18:58:26.050' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2027, 1, 1, 2, N'SP012', N'Nike Zoom Superfly 9 Academy CR7 TF', CAST(N'2025-03-04T18:59:48.660' AS DateTime), N'NV02', CAST(N'2025-03-04T18:59:48.660' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2028, 1, 3, 2, N'SP013', N'Nike Zoom Mercurial Vapor 15 Academy TF', CAST(N'2025-03-04T19:01:14.990' AS DateTime), N'NV02', CAST(N'2025-03-04T19:01:14.990' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2029, 1, 3, 2, N'SP014', N'Nike Mercurial Vapor 15 TF', CAST(N'2025-03-04T19:02:40.257' AS DateTime), N'NV02', CAST(N'2025-03-04T19:02:40.257' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2030, 2, 3, 2, N'SP015', N'Adidas Predator Accuracy', CAST(N'2025-03-04T19:03:54.680' AS DateTime), N'NV02', CAST(N'2025-03-04T19:03:54.680' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2031, 2, 3, 2, N'SP016', N'Adidas Predator Elite TF', CAST(N'2025-03-04T19:05:27.907' AS DateTime), N'NV02', CAST(N'2025-03-04T19:05:27.907' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2036, 2, 3, 2, N'SP017', N'Nike Air Zoom Merrcurial Superfly 9 Academy tf Peak Ready', CAST(N'2025-03-19T14:40:35.797' AS DateTime), N'NV02', CAST(N'2025-03-19T14:40:35.797' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2037, 2, 1, 2, N'SP018', N'Giày đá bóng AKKA Speed2', CAST(N'2025-03-19T17:03:45.470' AS DateTime), N'NV02', CAST(N'2025-03-19T17:03:45.470' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6032, 2, 3, 2, N'SP019', N'Adidas F50 Pro TF', CAST(N'2025-03-31T20:41:48.060' AS DateTime), N'NV02', CAST(N'2025-03-31T20:41:48.060' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6033, 1, 1, 2, N'SP020', N'Nike Tiempo 10 Academy TF 2', CAST(N'2025-04-02T15:55:01.350' AS DateTime), N'NV02', CAST(N'2025-04-02T16:02:01.597' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6034, 1, 1, 2, N'SP021', N'Nike Tiempo 10 Academy TF', CAST(N'2025-04-02T15:59:20.930' AS DateTime), N'NV02', CAST(N'2025-04-02T15:59:20.930' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6035, 1, 3, 2, N'SP022', N'Nike Phantom GX Academy DF TF', CAST(N'2025-04-02T16:03:12.590' AS DateTime), N'NV02', CAST(N'2025-04-02T16:03:12.590' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6036, 6, 1, 2, N'SP023', N'Puma Ultra Ultimate Cage Voltage Pack', CAST(N'2025-04-02T16:06:58.603' AS DateTime), N'NV02', CAST(N'2025-04-02T16:06:58.603' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6037, 6, 3, 2, N'SP024', N'Puma Ultra Match TT Xanh', CAST(N'2025-04-02T16:08:37.130' AS DateTime), N'NV02', CAST(N'2025-04-02T16:08:37.130' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6038, 6, 3, 2, N'SP025', N'Puma Ultra Ultimate Cage TT Trắng', CAST(N'2025-04-02T16:11:27.813' AS DateTime), N'NV02', CAST(N'2025-04-02T16:11:27.813' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6039, 11, 1, 2, N'SP026', N'Giày đá bóng AKKA Touch 1', CAST(N'2025-04-02T16:14:23.393' AS DateTime), N'NV02', CAST(N'2025-04-02T16:14:23.393' AS DateTime), NULL, 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6040, 7, 1, 2, N'SP027', N'Mizuno Monar Neo Sala Pro TF', CAST(N'2025-04-02T16:25:42.200' AS DateTime), N'NV02', CAST(N'2025-04-27T14:19:41.253' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6041, 7, 1, 2, N'SP028', N'Giày đá bóng Mizuno Monacirda Neo II Select Tf', CAST(N'2025-04-02T16:27:56.437' AS DateTime), N'NV02', CAST(N'2025-04-27T13:56:44.083' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6042, 7, 1, 2, N'SP029', N'Mizuno Morelia TF', CAST(N'2025-04-02T16:28:46.377' AS DateTime), N'NV02', CAST(N'2025-04-27T13:31:34.323' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6043, 7, 1, 3, N'SP030', N'Mizuno Monar Neo Sala Pro TF 99', CAST(N'2025-04-27T20:56:47.567' AS DateTime), N'NV02', CAST(N'2025-04-27T21:23:33.507' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6044, 7, 3, 2, N'SP031', N'Mizuno Monar Neo Sala Pro TF 6', CAST(N'2025-04-28T22:06:38.647' AS DateTime), N'NV02', CAST(N'2025-04-28T22:07:05.347' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6045, 2, 1, 3, N'SP032', N'Mizuno Morelia TF 99', CAST(N'2025-05-03T21:29:27.343' AS DateTime), N'NV02', CAST(N'2025-05-05T17:51:09.343' AS DateTime), N'NV02', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPhamChiTiet] ON 

INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, 1, 1, NULL, N'NIKE001-35-1', N'QR_NIKE001_35_1', 0, 3000000.0000, N'Size 35, màu Xanh dương', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-03-26T16:45:47.293' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 1, 3, 3, NULL, N'NIKE001-37-3', N'QR_NIKE001_37_3', 10, 3000000.0000, N'Size 37, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-05-03T22:47:45.633' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 1, 4, 4, NULL, N'NIKE001-38-4', N'QR_NIKE001_38_4', 5, 3000000.0000, N'Size 38, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-03-26T16:43:25.210' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, 2, 1, 6, NULL, N'NIKE002-35-6', N'QR_NIKE002_35_6', 6, 3450000.0000, N'Size 35, màu Turquoise', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T22:11:54.683' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, 2, 2, 7, NULL, N'NIKE002-36-7', N'QR_NIKE002_36_7', 2, 3450000.0000, N'Size 36, màu Xanh nhạt', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-05-03T22:47:45.643' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, 2, 3, 8, NULL, N'NIKE002-37-8', N'QR_NIKE002_37_8', 19, 3450000.0000, N'Size 37, màu Nâu', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-25T16:06:40.507' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, 2, 4, 9, NULL, N'NIKE002-38-9', N'QR_NIKE002_38_9', 9, 3450000.0000, N'Size 38, màu Hồng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-25T16:06:40.510' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, 2, 5, 10, NULL, N'NIKE002-39-10', N'QR_NIKE002_39_10', 2, 3450000.0000, N'Size 39, màu Xanh navy', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-25T16:06:40.510' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, 3, 1, 11, NULL, N'NIKE003-35-11', N'QR_NIKE003_35_11', 2, 3150000.0000, N'Size 35, màu Vàng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T23:13:27.420' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, 3, 2, 12, NULL, N'NIKE003-36-12', N'QR_NIKE003_36_12', 13, 3150000.0000, N'Size 36, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T23:13:27.423' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, 3, 3, 13, NULL, N'NIKE003-37-13', N'QR_NIKE003_37_13', 19, 3150000.0000, N'Size 37, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T23:13:27.427' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, 3, 4, 14, NULL, N'NIKE003-38-14', N'QR_NIKE003_38_14', 7, 3150000.0000, N'Size 38, màu Kem', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T23:13:27.430' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, 4, 1, 1, NULL, N'ADIDAS001-35-1', N'QR_ADIDAS001_35_1', 7, 3950000.0000, N'Size 35, màu Xanh dương', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T23:12:26.657' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, 4, 2, 2, NULL, N'ADIDAS001-36-2', N'QR_ADIDAS001_36_2', 9, 3950000.0000, N'Size 36, màu Cam', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-05-03T21:33:32.010' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, 4, 3, 3, NULL, N'ADIDAS001-37-3', N'QR_ADIDAS001_37_3', 19, 3950000.0000, N'Size 37, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T23:12:26.663' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, 4, 4, 4, NULL, N'ADIDAS001-38-4', N'QR_ADIDAS001_38_4', 10, 3950000.0000, N'Size 38, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-04-28T23:12:26.667' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (87, 19, 6, 3, NULL, N'SP019-001', NULL, 33, 450000.0000, NULL, CAST(N'2025-02-24T18:19:55.410' AS DateTime), N'NV01', CAST(N'2025-04-28T23:13:27.433' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1092, 1022, 7, 2, NULL, N'q', NULL, 50, 250000.0000, NULL, CAST(N'2025-02-27T19:07:21.577' AS DateTime), N'NV02', CAST(N'2025-04-18T17:16:27.027' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1096, 1024, 7, 2, NULL, N'SP014-001', NULL, 38, 300000.0000, NULL, CAST(N'2025-02-27T21:32:06.597' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.463' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2096, 2024, 8, 1, NULL, N'SP014-001', NULL, 30, 300000.0000, NULL, CAST(N'2025-03-04T16:43:44.400' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.467' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2097, 2024, 8, 11, NULL, N'SP014-002', NULL, 39, 800000.0000, NULL, CAST(N'2025-03-04T16:44:30.557' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.470' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2098, 2025, 7, 1, NULL, N'SP015-001', NULL, 39, 550000.0000, NULL, CAST(N'2025-03-04T18:55:55.517' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.470' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2101, 2026, 8, 2, NULL, N'SP016-001', NULL, 40, 800000.0000, NULL, CAST(N'2025-03-04T18:58:42.523' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.473' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2102, 2027, 8, 1, NULL, N'SP017-001', NULL, 28, 450000.0000, NULL, CAST(N'2025-03-04T19:00:35.353' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.477' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2103, 2028, 7, 11, NULL, N'SP018-001', NULL, 36, 200000.0000, NULL, CAST(N'2025-03-04T19:01:28.627' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.480' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2104, 2029, 2, 9, NULL, N'SP019-002', NULL, 33, 500000.0000, NULL, CAST(N'2025-03-04T19:02:58.893' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.483' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2105, 2030, 7, 4, NULL, N'SP020-001', NULL, 38, 300000.0000, NULL, CAST(N'2025-03-04T19:04:38.697' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.483' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2106, 2031, 6, 10, NULL, N'SP021-001', NULL, 28, 300000.0000, NULL, CAST(N'2025-03-04T19:06:07.230' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.487' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2107, 2031, 7, 5, NULL, N'SP021-002', NULL, 10, 150000.0000, NULL, CAST(N'2025-03-11T21:30:40.653' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.490' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2111, 2031, 5, 2, NULL, N'SP021-003', NULL, 9, 300000.0000, NULL, CAST(N'2025-03-12T14:50:59.950' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.493' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3108, 1021, 7, 10, NULL, N'SP011-001', NULL, 30, 400000.0000, NULL, CAST(N'2025-03-17T18:55:52.377' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.497' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3113, 2036, 3, 3, NULL, N'SP017-001', NULL, 30, 500000.0000, NULL, CAST(N'2025-03-19T15:13:39.903' AS DateTime), N'NV02', CAST(N'2025-04-03T23:02:44.987' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3114, 2036, 5, 2, NULL, N'SP017-002', NULL, 40, 300000.0000, NULL, CAST(N'2025-03-19T15:14:26.867' AS DateTime), N'NV02', CAST(N'2025-04-03T23:02:44.990' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3120, 2037, 8, 11, NULL, N'SP018-001', NULL, 10, 300000.0000, NULL, CAST(N'2025-03-19T17:04:42.680' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.497' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3121, 2037, 8, 5, NULL, N'SP018-002', NULL, 40, 500000.0000, NULL, CAST(N'2025-03-19T17:05:18.210' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.500' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3126, 2037, 7, 1, NULL, N'SP018-003', NULL, 40, 500000.0000, NULL, CAST(N'2025-03-19T17:33:40.297' AS DateTime), N'NV02', CAST(N'2025-04-03T23:21:55.503' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6107, 6032, 8, 3, NULL, N'SP019-001', NULL, 40, 800000.0000, NULL, CAST(N'2025-03-31T20:42:11.210' AS DateTime), N'NV02', CAST(N'2025-04-03T23:02:45.000' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6108, 6033, 6, 14, NULL, N'SP020-001', NULL, 29, 1550000.0000, NULL, CAST(N'2025-04-02T15:55:52.263' AS DateTime), N'NV02', CAST(N'2025-04-28T17:48:33.407' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6109, 6033, 7, 14, NULL, N'SP020-001', NULL, 30, 1550000.0000, NULL, CAST(N'2025-04-02T15:55:52.277' AS DateTime), N'NV02', CAST(N'2025-04-02T15:55:52.277' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6110, 6033, 8, 14, NULL, N'SP020-001', NULL, 30, 1550000.0000, NULL, CAST(N'2025-04-02T15:55:52.280' AS DateTime), N'NV02', CAST(N'2025-04-10T15:06:25.640' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6111, 6034, 7, 9, NULL, N'SP021-001', NULL, 30, 1600000.0000, NULL, CAST(N'2025-04-02T15:59:47.823' AS DateTime), N'NV02', CAST(N'2025-04-02T16:01:41.267' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6112, 6034, 8, 9, NULL, N'SP021-001', NULL, 30, 1600000.0000, NULL, CAST(N'2025-04-02T15:59:47.837' AS DateTime), N'NV02', CAST(N'2025-04-02T16:01:46.643' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6113, 6035, 7, 21, NULL, N'SP022-001', NULL, 32, 1890000.0000, NULL, CAST(N'2025-04-02T16:03:46.490' AS DateTime), N'NV02', CAST(N'2025-04-28T22:39:57.793' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6114, 6036, 7, 11, NULL, N'SP023-001', NULL, 35, 1000000.0000, NULL, CAST(N'2025-04-02T16:07:23.393' AS DateTime), N'NV02', CAST(N'2025-04-10T14:31:13.373' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6115, 6036, 8, 11, NULL, N'SP023-001', NULL, 35, 1000000.0000, NULL, CAST(N'2025-04-02T16:07:23.400' AS DateTime), N'NV02', CAST(N'2025-04-02T16:07:23.400' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6116, 6037, 6, 1, NULL, N'SP024-001', NULL, 60, 800000.0000, NULL, CAST(N'2025-04-02T16:09:00.120' AS DateTime), N'NV02', CAST(N'2025-04-28T17:23:52.933' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6117, 6037, 7, 13, NULL, N'SP024-002', NULL, 39, 820000.0000, NULL, CAST(N'2025-04-02T16:10:48.287' AS DateTime), N'NV02', CAST(N'2025-04-28T17:42:48.520' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6118, 6038, 7, 13, NULL, N'SP025-001', NULL, 75, 550000.0000, NULL, CAST(N'2025-04-02T16:11:40.630' AS DateTime), N'NV02', CAST(N'2025-04-28T22:37:09.680' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6119, 6039, 1, 10, NULL, N'SP026-001', NULL, 29, 800000.0000, NULL, CAST(N'2025-04-02T16:14:44.193' AS DateTime), N'NV02', CAST(N'2025-05-03T22:30:51.810' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6120, 6039, 2, 10, NULL, N'SP026-001', NULL, 50, 800000.0000, NULL, CAST(N'2025-04-02T16:14:44.203' AS DateTime), N'NV02', CAST(N'2025-05-03T22:31:00.937' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6121, 6039, 6, 15, NULL, N'SP026-003', NULL, 33, 550000.0000, NULL, CAST(N'2025-04-02T16:17:44.580' AS DateTime), N'NV02', CAST(N'2025-04-28T17:54:55.530' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6122, 6039, 6, 2, NULL, N'SP026-004', NULL, 40, 550000.0000, NULL, CAST(N'2025-04-02T16:18:25.117' AS DateTime), N'NV02', CAST(N'2025-04-02T16:18:25.117' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6123, 6039, 8, 7, NULL, N'SP026-005', NULL, 30, 550000.0000, NULL, CAST(N'2025-04-02T16:19:01.407' AS DateTime), N'NV02', CAST(N'2025-04-02T16:19:01.407' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6124, 6040, 6, 3, NULL, N'SP027-001', NULL, 37, 1500000.0000, NULL, CAST(N'2025-04-02T16:26:04.257' AS DateTime), N'NV02', CAST(N'2025-05-03T21:47:18.947' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6125, 6040, 8, 3, NULL, N'SP027-001', NULL, 40, 1500000.0000, NULL, CAST(N'2025-04-02T16:26:04.267' AS DateTime), N'NV02', CAST(N'2025-04-10T14:45:21.173' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6126, 6041, 8, 13, NULL, N'SP028-001', NULL, 36, 950000.0000, NULL, CAST(N'2025-04-02T16:28:18.023' AS DateTime), N'NV02', CAST(N'2025-04-28T23:13:25.697' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6127, 6042, 7, 15, NULL, N'SP029-001', NULL, 31, 1650000.0000, NULL, CAST(N'2025-04-02T16:29:07.467' AS DateTime), N'NV02', CAST(N'2025-04-28T23:13:25.703' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6128, 6042, 6, 4, NULL, N'SP029-002', NULL, 29, 800000.0000, NULL, CAST(N'2025-04-02T16:49:22.460' AS DateTime), N'NV02', CAST(N'2025-04-28T23:13:25.703' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6145, 6041, 2, 3, NULL, N'SP028-002', NULL, 29, 500000.0000, NULL, CAST(N'2025-04-27T12:44:55.450' AS DateTime), N'NV02', CAST(N'2025-04-28T23:13:25.707' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6146, 6043, 3, 2, NULL, N'SP030-001', NULL, 38, 300000.0000, NULL, CAST(N'2025-04-27T20:57:10.890' AS DateTime), N'NV02', CAST(N'2025-05-03T22:00:42.640' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6147, 6043, 4, 2, NULL, N'SP030-001', NULL, 40, 300000.0000, NULL, CAST(N'2025-04-27T20:57:10.910' AS DateTime), N'NV02', CAST(N'2025-04-28T23:13:25.713' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6148, 6044, 5, 4, NULL, N'SP031-001', NULL, 40, 800000.0000, NULL, CAST(N'2025-04-28T22:07:38.897' AS DateTime), N'NV02', CAST(N'2025-05-03T23:04:27.820' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6149, 6044, 4, 4, NULL, N'SP031-001', NULL, 40, 800000.0000, NULL, CAST(N'2025-04-28T22:07:38.910' AS DateTime), N'NV02', CAST(N'2025-05-03T23:04:27.823' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6150, 6045, 3, 11, 6009, N'SP032-001', NULL, 27, 400000.0000, NULL, CAST(N'2025-05-03T21:30:07.853' AS DateTime), N'NV02', CAST(N'2025-05-03T23:04:42.527' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6151, 6045, 6, 4, 6009, N'SP032-001', NULL, 30, 400000.0000, NULL, CAST(N'2025-05-03T21:30:07.867' AS DateTime), N'NV02', CAST(N'2025-05-03T23:04:42.530' AS DateTime), NULL, 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6152, 6039, 3, 10, NULL, N'SP026-006', NULL, 30, 300000.0000, NULL, CAST(N'2025-05-03T22:27:27.567' AS DateTime), N'NV02', CAST(N'2025-05-03T22:59:43.700' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6153, 6039, 4, 10, NULL, N'SP026-006', NULL, 30, 300000.0000, NULL, CAST(N'2025-05-03T22:27:27.577' AS DateTime), N'NV02', CAST(N'2025-05-03T22:31:36.187' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6154, 6039, 5, 10, NULL, N'SP026-006', NULL, 30, 300000.0000, NULL, CAST(N'2025-05-03T22:27:27.580' AS DateTime), N'NV02', CAST(N'2025-05-03T22:31:44.090' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6155, 6039, 6, 10, NULL, N'SP026-006', NULL, 30, 300000.0000, NULL, CAST(N'2025-05-03T22:27:27.587' AS DateTime), N'NV02', CAST(N'2025-05-03T22:31:52.660' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6156, 6039, 7, 10, NULL, N'SP026-006', NULL, 30, 300000.0000, NULL, CAST(N'2025-05-03T22:27:27.593' AS DateTime), N'NV02', CAST(N'2025-05-03T22:31:59.843' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6157, 6039, 8, 10, NULL, N'SP026-006', NULL, 30, 300000.0000, NULL, CAST(N'2025-05-03T22:27:27.597' AS DateTime), N'NV02', CAST(N'2025-05-03T22:32:07.943' AS DateTime), N'NV02', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6159, 6045, 5, 4, 6009, N'SP032-003', NULL, 30, 400000.0000, NULL, CAST(N'2025-05-03T22:42:19.550' AS DateTime), N'NV009', CAST(N'2025-05-03T23:04:42.530' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[SanPhamChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'Nike', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'Adidas', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, N'Puma', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-04-02T16:06:22.973' AS DateTime), N'NV02', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, N'Mizuno', CAST(N'2025-02-27T19:21:58.160' AS DateTime), N'NV02', CAST(N'2025-02-27T19:21:58.160' AS DateTime), NULL, 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, N'Akka', CAST(N'2025-03-04T18:51:02.173' AS DateTime), N'NV02', CAST(N'2025-03-04T18:51:02.173' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
/****** Object:  Index [UQ_GioHang_KhachHang_SanPham]    Script Date: 5/5/2025 5:53:35 PM ******/
ALTER TABLE [dbo].[GioHang] ADD  CONSTRAINT [UQ_GioHang_KhachHang_SanPham] UNIQUE NONCLUSTERED 
(
	[IdKhachHang] ASC,
	[IdSanPhamChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__HoaDon__3B2ABEFC4BB352CD]    Script Date: 5/5/2025 5:53:35 PM ******/
ALTER TABLE [dbo].[HoaDon] ADD UNIQUE NONCLUSTERED 
(
	[Mahoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anh] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[Anh] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[Anh] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[ChatLieu] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[ChatLieu] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[ChatLieu] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DeGiay] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DeGiay] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[DeGiay] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DiaChi] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DiaChi] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[DiaChi] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DotGiamGia] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DotGiamGia] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[GioHang] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[GioHang] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ((0)) FOR [LoaiHoaDon]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[KichCo] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[KichCo] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[KichCo] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[LichSuHoaDon] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[LichSuHoaDon] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[MauSac] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[MauSac] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[MauSac] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[PhieuGiamGia] ADD  DEFAULT ((0)) FOR [LoaiPhieu]
GO
ALTER TABLE [dbo].[PhieuGiamGia] ADD  DEFAULT ((0)) FOR [KieuPhieu]
GO
ALTER TABLE [dbo].[PhieuGiamGia] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[PhieuGiamGia] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[PhuongThucThanhToan] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[PhuongThucThanhToan] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[PhuongThucThanhToan] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SanPhamChiTiet] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[SanPhamChiTiet] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[SanPhamChiTiet] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[ThuongHieu] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[ThuongHieu] ADD  DEFAULT (getdate()) FOR [LanCapNhatCuoi]
GO
ALTER TABLE [dbo].[ThuongHieu] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD  CONSTRAINT [FK_Anh_SanPhamChiTiet] FOREIGN KEY([IdSanPhamChiTiet])
REFERENCES [dbo].[SanPhamChiTiet] ([Id])
GO
ALTER TABLE [dbo].[Anh] CHECK CONSTRAINT [FK_Anh_SanPhamChiTiet]
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD  CONSTRAINT [FK_DiaChi_KhachHang] FOREIGN KEY([IdKhachHang])
REFERENCES [dbo].[KhachHang] ([Id])
GO
ALTER TABLE [dbo].[DiaChi] CHECK CONSTRAINT [FK_DiaChi_KhachHang]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_KhachHang] FOREIGN KEY([IdKhachHang])
REFERENCES [dbo].[KhachHang] ([Id])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_KhachHang]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPhamChiTiet] FOREIGN KEY([IdSanPhamChiTiet])
REFERENCES [dbo].[SanPhamChiTiet] ([Id])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPhamChiTiet]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([IdKhachHang])
REFERENCES [dbo].[KhachHang] ([Id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([IdNhanVien])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_PhieuGiamGia] FOREIGN KEY([IdPhieuGiamGia])
REFERENCES [dbo].[PhieuGiamGia] ([Id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_PhieuGiamGia]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HoaDon] FOREIGN KEY([IdHoaDon])
REFERENCES [dbo].[HoaDon] ([Id])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HoaDon]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_SanPhamChiTiet] FOREIGN KEY([IdSanPhamChiTiet])
REFERENCES [dbo].[SanPhamChiTiet] ([Id])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_SanPhamChiTiet]
GO
ALTER TABLE [dbo].[KhachHangPhieuGiam]  WITH CHECK ADD  CONSTRAINT [FK_KhachHangPhieuGiam_KhachHang] FOREIGN KEY([IdKhachHang])
REFERENCES [dbo].[KhachHang] ([Id])
GO
ALTER TABLE [dbo].[KhachHangPhieuGiam] CHECK CONSTRAINT [FK_KhachHangPhieuGiam_KhachHang]
GO
ALTER TABLE [dbo].[KhachHangPhieuGiam]  WITH CHECK ADD  CONSTRAINT [FK_KhachHangPhieuGiam_PhieuGiamGia] FOREIGN KEY([IdPhieuGiamGia])
REFERENCES [dbo].[PhieuGiamGia] ([Id])
GO
ALTER TABLE [dbo].[KhachHangPhieuGiam] CHECK CONSTRAINT [FK_KhachHangPhieuGiam_PhieuGiamGia]
GO
ALTER TABLE [dbo].[LichSuHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_LichSuHoaDon_HoaDon] FOREIGN KEY([IdHoaDon])
REFERENCES [dbo].[HoaDon] ([Id])
GO
ALTER TABLE [dbo].[LichSuHoaDon] CHECK CONSTRAINT [FK_LichSuHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[LichSuHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_LichSuHoaDon_NhanVien] FOREIGN KEY([IdNhanVien])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[LichSuHoaDon] CHECK CONSTRAINT [FK_LichSuHoaDon_NhanVien]
GO
ALTER TABLE [dbo].[PhieuGiamGia]  WITH CHECK ADD  CONSTRAINT [FK_PhieuGiamGia_HoaDon] FOREIGN KEY([IdHoaDon])
REFERENCES [dbo].[HoaDon] ([Id])
GO
ALTER TABLE [dbo].[PhieuGiamGia] CHECK CONSTRAINT [FK_PhieuGiamGia_HoaDon]
GO
ALTER TABLE [dbo].[PhuongThucThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_PhuongThucThanhToan_HoaDon] FOREIGN KEY([IdHoaDon])
REFERENCES [dbo].[HoaDon] ([Id])
GO
ALTER TABLE [dbo].[PhuongThucThanhToan] CHECK CONSTRAINT [FK_PhuongThucThanhToan_HoaDon]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ChatLieu] FOREIGN KEY([IdChatLieu])
REFERENCES [dbo].[ChatLieu] ([Id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ChatLieu]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DeGiay] FOREIGN KEY([IdDeGiay])
REFERENCES [dbo].[DeGiay] ([Id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DeGiay]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([IdThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([Id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
ALTER TABLE [dbo].[SanPhamChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamChiTiet_DotGiamGia] FOREIGN KEY([IdDotGiamGia])
REFERENCES [dbo].[DotGiamGia] ([Id])
GO
ALTER TABLE [dbo].[SanPhamChiTiet] CHECK CONSTRAINT [FK_SanPhamChiTiet_DotGiamGia]
GO
ALTER TABLE [dbo].[SanPhamChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamChiTiet_KichCo] FOREIGN KEY([IdKichCo])
REFERENCES [dbo].[KichCo] ([Id])
GO
ALTER TABLE [dbo].[SanPhamChiTiet] CHECK CONSTRAINT [FK_SanPhamChiTiet_KichCo]
GO
ALTER TABLE [dbo].[SanPhamChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamChiTiet_MauSac] FOREIGN KEY([IdMauSac])
REFERENCES [dbo].[MauSac] ([Id])
GO
ALTER TABLE [dbo].[SanPhamChiTiet] CHECK CONSTRAINT [FK_SanPhamChiTiet_MauSac]
GO
ALTER TABLE [dbo].[SanPhamChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamChiTiet_SanPham] FOREIGN KEY([IdSanPham])
REFERENCES [dbo].[SanPham] ([Id])
GO
ALTER TABLE [dbo].[SanPhamChiTiet] CHECK CONSTRAINT [FK_SanPhamChiTiet_SanPham]
GO
