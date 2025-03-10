
GO
/****** Object:  Database [DATN_REGAL]    Script Date: 20/01/2025 18:03:15 ******/
CREATE DATABASE [DATN_REGAL]
GO
ALTER DATABASE [DATN_REGAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DATN_REGAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DATN_REGAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DATN_REGAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DATN_REGAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [DATN_REGAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DATN_REGAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DATN_REGAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DATN_REGAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DATN_REGAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DATN_REGAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DATN_REGAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DATN_REGAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DATN_REGAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DATN_REGAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DATN_REGAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DATN_REGAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DATN_REGAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DATN_REGAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DATN_REGAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DATN_REGAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DATN_REGAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DATN_REGAL] SET RECOVERY FULL 
GO
ALTER DATABASE [DATN_REGAL] SET  MULTI_USER 
GO
ALTER DATABASE [DATN_REGAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DATN_REGAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DATN_REGAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DATN_REGAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DATN_REGAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DATN_REGAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DATN_REGAL', N'ON'
GO
ALTER DATABASE [DATN_REGAL] SET QUERY_STORE = ON
GO
ALTER DATABASE [DATN_REGAL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DATN_REGAL]
GO
/****** Object:  Table [dbo].[Anh]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[DeGiay]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[DiaChi]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[DotGiamGia]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[GioHang]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[KhachHangPhieuGiam]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[KichCo]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[LichSuHoaDon]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[MauSac]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[PhieuGiamGia]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[SanPhamChiTiet]    Script Date: 20/01/2025 18:03:15 ******/
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
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 20/01/2025 18:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](100) NOT NULL,
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

INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 2, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 3, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 4, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, 5, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, 6, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, 7, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, 8, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, 9, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, 10, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, 11, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, 12, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, 13, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, 14, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, 15, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, 16, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, 17, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, 18, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, 19, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, 20, N'', CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, 71, N'', CAST(N'2025-01-20T17:45:12.163' AS DateTime), NULL, CAST(N'2025-01-20T17:45:12.163' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (22, 72, N'', CAST(N'2025-01-20T17:45:12.583' AS DateTime), NULL, CAST(N'2025-01-20T17:45:12.583' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (23, 73, N'', CAST(N'2025-01-20T17:45:14.800' AS DateTime), NULL, CAST(N'2025-01-20T17:45:14.800' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (24, 74, N'', CAST(N'2025-01-20T17:45:17.580' AS DateTime), NULL, CAST(N'2025-01-20T17:45:17.580' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (25, 75, N'', CAST(N'2025-01-20T17:45:19.747' AS DateTime), NULL, CAST(N'2025-01-20T17:45:19.747' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (26, 76, N'', CAST(N'2025-01-20T17:46:12.577' AS DateTime), NULL, CAST(N'2025-01-20T17:46:12.577' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (27, 77, N'', CAST(N'2025-01-20T17:46:14.727' AS DateTime), NULL, CAST(N'2025-01-20T17:46:14.727' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (28, 78, N'./370/r4kp4cloxe1ugbldcybh.avif', CAST(N'2025-01-20T17:46:17.780' AS DateTime), NULL, CAST(N'2025-01-20T17:46:17.780' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (29, 79, N'./372/o3mmaxwcumzaavdgfk1g.avif', CAST(N'2025-01-20T17:46:19.643' AS DateTime), NULL, CAST(N'2025-01-20T17:46:19.643' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (30, 21, N'./384/iaandory4xz9oj48ct7d.avif', CAST(N'2025-01-20T17:46:31.573' AS DateTime), NULL, CAST(N'2025-01-20T17:46:31.573' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (31, 22, N'./388/l4dj70wdakwffcspxc88.png', CAST(N'2025-01-20T17:46:35.367' AS DateTime), NULL, CAST(N'2025-01-20T17:46:35.367' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (32, 23, N'./388/mzznl5lrialknky7zuyh.avif', CAST(N'2025-01-20T17:46:36.150' AS DateTime), NULL, CAST(N'2025-01-20T17:46:36.150' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (33, 24, N'./392/tsoi3iloigfpcfql7oun.png', CAST(N'2025-01-20T17:46:39.500' AS DateTime), NULL, CAST(N'2025-01-20T17:46:39.500' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (34, 25, N'./395/r6zn6z6sg2kdqnyqp11v.png', CAST(N'2025-01-20T17:46:42.613' AS DateTime), NULL, CAST(N'2025-01-20T17:46:42.613' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (35, 27, N'./431/se9jifiajygzb0lqtvqj.jpg', CAST(N'2025-01-20T17:47:19.200' AS DateTime), NULL, CAST(N'2025-01-20T17:47:19.200' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (36, 26, N'./433/gdwog6eselyc5brd6o0u.jpg', CAST(N'2025-01-20T17:47:21.513' AS DateTime), NULL, CAST(N'2025-01-20T17:47:21.513' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (37, 28, N'./434/lxb7ntqgua0b77y3ksmf.jpg', CAST(N'2025-01-20T17:47:22.170' AS DateTime), NULL, CAST(N'2025-01-20T17:47:22.170' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (38, 29, N'./436/klulir2sgxgk7ghesh7j.jpg', CAST(N'2025-01-20T17:47:23.240' AS DateTime), NULL, CAST(N'2025-01-20T17:47:23.240' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (39, 30, N'./439/gwgvuoxtixpzhk2pjrjv.jpg', CAST(N'2025-01-20T17:47:26.433' AS DateTime), NULL, CAST(N'2025-01-20T17:47:26.433' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (40, 31, N'./480/polzcrhexhkqikoqraga.webp', CAST(N'2025-01-20T17:48:07.660' AS DateTime), NULL, CAST(N'2025-01-20T17:48:07.660' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (41, 32, N'./481/piwaw40ybb4osntflfpl.jpg', CAST(N'2025-01-20T17:48:09.183' AS DateTime), NULL, CAST(N'2025-01-20T17:48:09.183' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (42, 33, N'./484/dynxlmt4ch3ozflr1dvx.webp', CAST(N'2025-01-20T17:48:11.490' AS DateTime), NULL, CAST(N'2025-01-20T17:48:11.490' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (43, 34, N'./486/vbwxykauaygttxf4laje.jpg', CAST(N'2025-01-20T17:48:13.233' AS DateTime), NULL, CAST(N'2025-01-20T17:48:13.233' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (44, 35, N'./488/ns0hroxjqsapza426sgw.webp', CAST(N'2025-01-20T17:48:16.100' AS DateTime), NULL, CAST(N'2025-01-20T17:48:16.100' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (45, 36, N'./522/h8t5ggr0gjijoauu3zhx.jpg', CAST(N'2025-01-20T17:48:49.640' AS DateTime), NULL, CAST(N'2025-01-20T17:48:49.640' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (46, 37, N'./524/xwqlbmdjoryy4bhcqgjg.webp', CAST(N'2025-01-20T17:48:51.973' AS DateTime), NULL, CAST(N'2025-01-20T17:48:51.973' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (47, 38, N'./527/pdx4e6qjg7irec2xu76r.jpg', CAST(N'2025-01-20T17:48:54.440' AS DateTime), NULL, CAST(N'2025-01-20T17:48:54.440' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (48, 39, N'./529/xojxpd9mgw0l3paela38.webp', CAST(N'2025-01-20T17:48:57.573' AS DateTime), NULL, CAST(N'2025-01-20T17:48:57.573' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (49, 40, N'./531/v8bkohpdja7vs5zisfxf.jpg', CAST(N'2025-01-20T17:48:59.077' AS DateTime), NULL, CAST(N'2025-01-20T17:48:59.077' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (50, 80, N'./543/u2gx9k3quu66k1giildk.jpg', CAST(N'2025-01-20T17:49:10.677' AS DateTime), NULL, CAST(N'2025-01-20T17:49:10.677' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (51, 81, N'./545/udetoz95fdivtnmedejn.webp', CAST(N'2025-01-20T17:49:12.950' AS DateTime), NULL, CAST(N'2025-01-20T17:49:12.950' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (52, 82, N'./549/cd7xswgadjilsjtf9xz2.jpg', CAST(N'2025-01-20T17:49:16.317' AS DateTime), NULL, CAST(N'2025-01-20T17:49:16.317' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (53, 83, N'./571/n6dgpzptqcgnfitetpvg.webp', CAST(N'2025-01-20T17:49:38.837' AS DateTime), NULL, CAST(N'2025-01-20T17:49:38.837' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (54, 84, N'./574/osw9o0kzassccllcwzpa.webp', CAST(N'2025-01-20T17:49:41.117' AS DateTime), NULL, CAST(N'2025-01-20T17:49:41.117' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (55, 85, N'./575/vsnvvagzdbwqsysrpqh6.webp', CAST(N'2025-01-20T17:49:42.973' AS DateTime), NULL, CAST(N'2025-01-20T17:49:42.973' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (56, 86, N'./578/ridg1ljdz29y1lcxu9xd.webp', CAST(N'2025-01-20T17:49:45.590' AS DateTime), NULL, CAST(N'2025-01-20T17:49:45.590' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (57, 41, N'./603/vzcxm9p4c2fqr81jhika.png', CAST(N'2025-01-20T17:50:11.000' AS DateTime), NULL, CAST(N'2025-01-20T17:50:11.000' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (58, 42, N'./605/ctel03i5y2kkiwuxaegi.png', CAST(N'2025-01-20T17:50:12.963' AS DateTime), NULL, CAST(N'2025-01-20T17:50:12.963' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (59, 43, N'./608/px4z1sbe9wfar9mzdoxk.png', CAST(N'2025-01-20T17:50:15.643' AS DateTime), NULL, CAST(N'2025-01-20T17:50:15.643' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (60, 44, N'./610/lr10luobgjxh2qhs6a9e.png', CAST(N'2025-01-20T17:50:17.413' AS DateTime), NULL, CAST(N'2025-01-20T17:50:17.413' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (61, 45, N'./613/p45fd3lbgw6gjgpxr5cn.png', CAST(N'2025-01-20T17:50:20.483' AS DateTime), NULL, CAST(N'2025-01-20T17:50:20.483' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (62, 46, N'./629/genlmgchkhmlegxkd5cl.jpg', CAST(N'2025-01-20T17:50:36.520' AS DateTime), NULL, CAST(N'2025-01-20T17:50:36.520' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (63, 47, N'./631/qc33k0zk0oigi8v2vfjh.avif', CAST(N'2025-01-20T17:50:38.933' AS DateTime), NULL, CAST(N'2025-01-20T17:50:38.933' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (64, 48, N'./634/rcprsmng1eoszjwjiq6h.jpg', CAST(N'2025-01-20T17:50:41.950' AS DateTime), NULL, CAST(N'2025-01-20T17:50:41.950' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (65, 49, N'./635/grinkcnqpl5ylzvp2w4l.avif', CAST(N'2025-01-20T17:50:42.970' AS DateTime), NULL, CAST(N'2025-01-20T17:50:42.970' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (66, 51, N'./653/jsthxummq0inactyoewi.png', CAST(N'2025-01-20T17:51:01.123' AS DateTime), NULL, CAST(N'2025-01-20T17:51:01.123' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (67, 53, N'./658/sclhyooh0npdwywhvard.png', CAST(N'2025-01-20T17:51:06.317' AS DateTime), NULL, CAST(N'2025-01-20T17:51:06.317' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (68, 54, N'./661/f6clnkk4xocy56iwe6qb.png', CAST(N'2025-01-20T17:51:08.230' AS DateTime), NULL, CAST(N'2025-01-20T17:51:08.230' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (69, 56, N'./679/o2itnywlb9dc49zedzdp.webp', CAST(N'2025-01-20T17:51:26.850' AS DateTime), NULL, CAST(N'2025-01-20T17:51:26.850' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (70, 57, N'./680/n5z1zsseua1fmikijnxg.jpg', CAST(N'2025-01-20T17:51:27.787' AS DateTime), NULL, CAST(N'2025-01-20T17:51:27.787' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (71, 58, N'./683/ebq7z0myginne9mqjgtn.webp', CAST(N'2025-01-20T17:51:30.707' AS DateTime), NULL, CAST(N'2025-01-20T17:51:30.707' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (72, 59, N'./686/lsdkodfyasg96af9vf0v.jpg', CAST(N'2025-01-20T17:51:33.997' AS DateTime), NULL, CAST(N'2025-01-20T17:51:33.997' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (73, 61, N'./699/jqbplnc4v1axj4rnrydj.webp', CAST(N'2025-01-20T17:51:46.523' AS DateTime), NULL, CAST(N'2025-01-20T17:51:46.523' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (74, 62, N'./702/tbpcf4zcfizg15tjlwfu.png', CAST(N'2025-01-20T17:51:49.793' AS DateTime), NULL, CAST(N'2025-01-20T17:51:49.793' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (75, 63, N'./703/cwb6blujrowv935vcp3c.webp', CAST(N'2025-01-20T17:51:50.797' AS DateTime), NULL, CAST(N'2025-01-20T17:51:50.797' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (76, 64, N'./705/r5gmxkbjqpozzgpnf14n.webp', CAST(N'2025-01-20T17:51:52.530' AS DateTime), NULL, CAST(N'2025-01-20T17:51:52.530' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (77, 66, N'./719/aa9fgcouvahgrgjxmeod.webp', CAST(N'2025-01-20T17:52:06.410' AS DateTime), NULL, CAST(N'2025-01-20T17:52:06.410' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (78, 67, N'./722/atnu7tgch108z2p1bpgz.webp', CAST(N'2025-01-20T17:52:10.053' AS DateTime), NULL, CAST(N'2025-01-20T17:52:10.050' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (79, 68, N'./723/kvyvleaqashlfpuwtnhc.webp', CAST(N'2025-01-20T17:52:10.550' AS DateTime), NULL, CAST(N'2025-01-20T17:52:10.550' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (80, 69, N'./726/rz6nxiidijum5npot0cc.webp', CAST(N'2025-01-20T17:52:14.217' AS DateTime), NULL, CAST(N'2025-01-20T17:52:14.217' AS DateTime), NULL, 1)
INSERT [dbo].[Anh] ([Id], [IdSanPhamChiTiet], [TenAnh], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (81, 70, N'', CAST(N'2025-01-20T17:52:19.787' AS DateTime), NULL, CAST(N'2025-01-20T17:52:19.787' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Anh] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatLieu] ON 

INSERT [dbo].[ChatLieu] ([Id], [TenChatLieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'Da', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[ChatLieu] ([Id], [TenChatLieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'Lụa', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[ChatLieu] ([Id], [TenChatLieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'Vải', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
SET IDENTITY_INSERT [dbo].[ChatLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[DeGiay] ON 

INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'Da', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'Cao su', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'Nhựa PU', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'Boost', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[DeGiay] ([Id], [TenDeGiay], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'Air', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
SET IDENTITY_INSERT [dbo].[DeGiay] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaChi] ON 

INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, N'Trần Hưng Đạo', N'Tây Sơn', N'Hoa Lư', N'Ninh Bình', N'Nguyễn Văn Nam', N'0909123456', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
INSERT [dbo].[DiaChi] ([Id], [IdKhachHang], [TenDuong], [XaPhuong], [QuanHuyen], [TinhThanhPho], [TenNguoiNhan], [SdtNguoiNhan], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 2, N'Phan Đình Phùng', N'Thạch Trung', N'Hải Châu', N'Đà Nẵng', N'Lê Ánh Ngọc', N'0912345678', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.883' AS DateTime), N'Admin', 1)
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
SET IDENTITY_INSERT [dbo].[DiaChi] OFF
GO

SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, 1, NULL, N'HD20231011', N'Nguyễn Văn Nam', N'namnv1@gmail.com', N'0909123456', N'Tr?n Hung Ð?o, Tây Son, Hoa Lu, Ninh Bình', NULL, 500000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 1', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 1)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 2, 2, NULL, N'HD20231012', N'Lê Ánh Ngọc', N'ngocla2@gmail.com', N'0912345678', N'Phan Ðình Phùng, Th?ch Trung, H?i Châu, Ðà N?ng', NULL, 600000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 2', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 1, 3, NULL, N'HD20231013', N'Trần Quốc Nghĩa', N'nghiatq3@gmail.com', N'0923456789', N'Nguy?n Thái H?c, Phú Thu?ng, Tây H?, Hà N?i', NULL, 700000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 3', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 3)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 2, 4, NULL, N'HD20231014', N'Nguyễn Phúc Long', N'longnp4@gmail.com', N'0934567890', N'Ðu?ng 3/2, Phu?ng 2, Tân Bình, TP.HCM', NULL, 800000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 4', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 4)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, 1, 5, NULL, N'HD20231015', N'Kiều Khánh Huyền', N'huyenkh5@gmail.com', N'0945678901', N'Nguy?n H?u C?nh, Phú H?u, Nhà Bè, TP.HCM', NULL, 900000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 5', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 5)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, 2, 6, NULL, N'HD20231016', N'Nguyễn Thùy Linh', N'linhnt6@gmail.com', N'0956789012', N'Tr?n Não, Bình An, Th? Ð?c, TP.HCM', NULL, 1000000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 6', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 1)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, 1, 7, NULL, N'HD20231017', N'Bùi Huyền Anh', N'anhbh7@gmail.com', N'0967890123', N'Ph?m H?u L?u, Ða Kao, Qu?n 1, TP.HCM', NULL, 1100000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 7', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, 2, 8, NULL, N'HD20231018', N'Đặng Phương Thảo', N'thaodpt8@gmail.com', N'0978901234', N'H?ng Bàng, An H?i B?c, Son Trà, Ðà N?ng', NULL, 1200000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 8', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 3)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, 1, 9, NULL, N'HD20231019', N'Lê Hải Đăng', N'danghd9@gmail.com', N'0989012345', N'Hà Huy T?p, An Khê, Tam K?, Qu?ng Nam', NULL, 1300000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 9', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 4)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, 2, 10, NULL, N'HD20231020', N'Phùng Thanh Hiền', N'hienpt10@gmail.com', N'0990123456', N'Quang Trung, Thu?ng Ð?nh, Thành ph? Thái Bình, Thái Bình', NULL, 1400000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 10', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 5)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, 1, 11, NULL, N'HD20231021', N'Nguyễn Anh Vũ', N'vuna11@gmail.com', N'0910112233', N'Nguy?n Ðình Chi?u, Gia Qu?t, Thu?n Thành, B?c Ninh', NULL, 1500000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 11', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 1)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, 2, 12, NULL, N'HD20231022', N'Vũ Thùy Tiên', N'tienvt12@gmail.com', N'0911223344', N'Lê L?i, Phú Thu?ng, Tây H?, Hà N?i', NULL, 1600000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 12', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, 1, 13, NULL, N'HD20231023', N'Lê Phương Anh', N'anhpa13@gmail.com', N'0912334455', N'Hà B?ng, Gia Huynh, Huong Khê, Hà Tinh', NULL, 1700000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 13', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 3)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, 2, 14, NULL, N'HD20231024', N'Nguyễn Thị Thùy Linh', N'linhnt14@gmail.com', N'0913445566', N'Tôn Ð?c Th?ng, Tân Hung, Tân Bình, TP.HCM', NULL, 1800000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 14', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 4)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, 1, 15, NULL, N'HD20231025', N'Đỗ Ánh Dương', N'duongad15@gmail.com', N'0914556677', N'Hòa H?o, Hòa An, Phú Nhu?n, TP.HCM', NULL, 1900000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 15', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 5)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, 2, 16, NULL, N'HD20231026', N'Nguyễn Thúy Hằng', N'hangnt16@gmail.com', N'0915667788', N'Nguy?n Van C?, M? Ðình, Thành ph? H?i Phòng, H?i Phòng', NULL, 2000000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 16', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 1)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, 1, 17, NULL, N'HD20231027', N'Nguyễn Anh Dũng', N'dungna17@gmail.com', N'0916778899', N'Ph?m Van Ð?ng, Phú Ðô, Nam T? Liêm, Hà N?i', NULL, 2100000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 17', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 2)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, 2, 18, NULL, N'HD20231028', N'Vũ Văn Nguyên', N'nguyenvv18@gmail.com', N'0917889900', N'Tr?n Ð?i Nghia, Ð?i Kim, Hoàng Mai, Hà N?i', NULL, 2200000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 18', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 3)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, 1, 19, NULL, N'HD20231029', N'Hoàng Công Vinh', N'vinhhc19@gmail.com', N'0918990011', N'Lê Van Luong, Tân Hung, Tân Bình, TP.HCM', NULL, 2300000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 19', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 4)
INSERT [dbo].[HoaDon] ([Id], [IdNhanVien], [IdKhachHang], [IdPhieuGiamGia], [Mahoadon], [TenKhachHang], [Email], [SoDienThoai], [DiaChi], [TienGiam], [TongTien], [LoaiHoaDon], [PhiVanChuyen], [NgayXacNhan], [NgayVanChuyen], [NgayNhanHang], [NgayHoanThanh], [GhiChu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, 2, 20, NULL, N'HD20231030', N'Bạch Văn Sơn', N'sonbv20@gmail.com', N'0919001122', N'Nguy?n Trãi, Huong Tích, Can L?c, Hà Tinh', NULL, 2400000.0000, 1, 30000.0000, CAST(N'2025-01-20T17:42:32.923' AS DateTime), NULL, NULL, NULL, N'Ghi chú hóa don 20', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 5)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] ON 

INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (1, 1, 1, 250000.0000, 2, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (2, 1, 2, 300000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (3, 2, 3, 600000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (4, 3, 4, 700000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (5, 4, 5, 800000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (6, 5, 6, 900000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (7, 6, 7, 1000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (8, 7, 8, 1100000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (9, 8, 9, 1200000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (10, 9, 10, 1300000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (11, 10, 11, 1400000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (12, 11, 12, 1500000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (13, 12, 13, 1600000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (14, 13, 14, 1700000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (15, 14, 15, 1800000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (16, 15, 16, 1900000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (17, 16, 17, 2000000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (18, 17, 18, 2100000.0000, 1, NULL, 1)
INSERT [dbo].[HoaDonChiTiet] ([Id], [IdHoaDon], [IdSanPhamChiTiet], [GiaSanPham], [SoLuong], [GhiChu], [TrangThai]) VALUES (19, 18, 19, 2200000.0000, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'KH01', NULL, N'Nguyễn Văn Nam', NULL, 0, N'0909123456', N'namnv1@gmail.com', NULL, N'$2a$10$fbWOZERHCipYgX7GcwRev.kiroeKSL59Q7aKgUUgn58jNrKniNzQ.', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.600' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'KH02', NULL, N'Lê Ánh Ngọc', NULL, 0, N'0912345678', N'ngocla2@gmail.com', NULL, N'$2a$10$TF9..l6Z6AelpcR45742YuX0QXf40HIclz9I/fQybJUp5Wlm6TLb.', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.640' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'KH03', NULL, N'Trần Quốc Nghĩa', NULL, 0, N'0923456789', N'nghiatq3@gmail.com', NULL, N'$2a$10$AJvkYlHU6uWjxwmeL1Gg1ujNLQ4clebP5eJtd7KfwR1yBt3/emJ06', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.640' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'KH04', NULL, N'Nguyễn Phúc Long', NULL, 0, N'0934567890', N'longnp4@gmail.com', NULL, N'$2a$10$/xOi/pny95Q6lFy2VLKwIu50M6evuwXgyax1xdB35/1jpENc54GD2', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.643' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'KH05', NULL, N'Kiều Khánh Huyền', NULL, 0, N'0945678901', N'huyenkh5@gmail.com', NULL, N'$2a$10$NBzODXmGicvJgB1gUVUC.edlHwq1OfR4tAmoH0u0h4hp8ZmWErZd.', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.643' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, N'KH06', NULL, N'Nguyễn Thùy Linh', NULL, 0, N'0956789012', N'linhnt6@gmail.com', NULL, N'$2a$10$K5FRMPTVwgaHKHmK8cKpRu.cAzqBLhBoY34CT02qJEsom485Fe9da', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.647' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, N'KH07', NULL, N'Bùi Huyền Anh', NULL, 0, N'0967890123', N'anhbh7@gmail.com', NULL, N'$2a$10$GQqUnzBnC.7mrDVfATG6beoHWH1qnkhxmWSabJVMYA/7OSNkHnK/O', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.647' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, N'KH08', NULL, N'Đặng Phương Thảo', NULL, 0, N'0978901234', N'thaodpt8@gmail.com', NULL, N'$2a$10$Cb6AzG8uUF9dwLzmrHgKyejgnWa754XJwSXETVFdvXgJbsQww6oy2', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.647' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, N'KH09', NULL, N'Lê Hải Đăng', NULL, 0, N'0989012345', N'danghd9@gmail.com', NULL, N'$2a$10$A98J/3xFIrnv3zDtz/6XmeMlwvs.CgrOVuFZrGEJB9dyBEY0MvpDm', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.650' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, N'KH10', NULL, N'Phùng Thanh Hiền', NULL, 0, N'0990123456', N'hienpt10@gmail.com', NULL, N'$2a$10$ifBIdgXqgxLE2bMng.S2g.H1.b2HY19CM9Gj7rOrSF6tbmc6Uxb/y', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.650' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, N'KH11', NULL, N'Nguyễn Anh Vũ', NULL, 0, N'0910112233', N'vuna11@gmail.com', NULL, N'$2a$10$BSCYe8RYmjSS9lTap4hUnuc8vAtAxmBXAnJi8clPVyQErve8.jfDq', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.653' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, N'KH12', NULL, N'Vũ Thùy Tiên', NULL, 0, N'0911223344', N'tienvt12@gmail.com', NULL, N'$2a$10$DPMcXhgcdEPH0Ks9ZJMhg.PQFPCjAgV6ANJB2iuCI5fkw9Zt1OEfO', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.653' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, N'KH13', NULL, N'Lê Phương Anh', NULL, 0, N'0912334455', N'anhpa13@gmail.com', NULL, N'$2a$10$7JqAHCypJ6vmQndUZKIz/u1UkyNKXEY2g3TbRkj1wR0s.IRwPIYUa', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.653' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, N'KH14', NULL, N'Nguyễn Thị Thùy Linh', NULL, 0, N'0913445566', N'linhnt14@gmail.com', NULL, N'$2a$10$.qMoAIxNP9JJp71PZao0Zu2IISGCYh1OYCWaS0Ajq38piOJeOATOW', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.657' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, N'KH15', NULL, N'Đỗ Ánh Dương', NULL, 0, N'0914556677', N'duongad15@gmail.com', NULL, N'$2a$10$IijS7fOss5LsoQ1k/9xvN.fSVfzE/hwkVgTgfgIy8h9tVrpcbkN82', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.657' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, N'KH16', NULL, N'Nguyễn Thúy Hằng', NULL, 0, N'0915667788', N'hangnt16@gmail.com', NULL, N'$2a$10$DQUXCzqyy2LjjUFUKDGiS.qF2wq7MGbqSQ50inDpxLvLwsUBOv4Pm', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.660' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, N'KH17', NULL, N'Nguyễn Anh Dũng', NULL, 0, N'0916778899', N'dungna17@gmail.com', NULL, N'$2a$10$pjVCdVCLuGF5ezDY5L0PX.TEujkOqt8oOXJ69K2jL79Jd1pYcxY3O', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.660' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, N'KH18', NULL, N'Vũ Văn Nguyên', NULL, 0, N'0917889900', N'nguyenvv18@gmail.com', NULL, N'$2a$10$ErNmF95nMxLVDm/9xyED9OtPX0Ag6QWKDbDmXll1CRlsYyTLzKM/W', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.660' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, N'KH19', NULL, N'Hoàng Công Vinh', NULL, 0, N'0918990011', N'vinhhc19@gmail.com', NULL, N'$2a$10$.d/x8VHZz5UoMC6lcF77l.XFLukp0T0jmllTSXfIcNtE2u197kyj6', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.663' AS DateTime), N'Admin', 1)
INSERT [dbo].[KhachHang] ([Id], [MaKhachHang], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, N'KH20', NULL, N'Bạch Văn Sơn', NULL, 0, N'0919001122', N'sonbv20@gmail.com', NULL, N'$2a$10$AIbAp.8//W9S4W2FDzVQXO/pdJrwmEP9CQKXNRudhGvyYqIVndxMi', CAST(N'2025-01-20T17:42:32.880' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.663' AS DateTime), N'Admin', 1)
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
INSERT [dbo].[KichCo] ([Id], [TenKichCo], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, N'44', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
SET IDENTITY_INSERT [dbo].[KichCo] OFF
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
SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'NV01', NULL, N'Bùi Đức Việt', NULL, NULL, N'Hà Nội', NULL, N'0934567890', N'buiducviet101@gmail.com', NULL, N'$2a$10$v.r1K1VGDiY7GZXLPSmcCuJrpXjCW9PNZdeyDU/3ZewS0DR4njD3G', 1, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.703' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'NV02', NULL, N'Nguyễn Đức Lương', NULL, NULL, N'Hà Nội', NULL, N'0945678901', N'luongthptnqb123@gmail.com', NULL, N'$2a$10$KqtQ04Os.DeIERDWcVUtOOmYMhAKRjQjjWmvsLzM8WwfoWT34x1ty', 1, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.710' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'NV03', NULL, N'Nguyễn Thành Huy', NULL, NULL, N'Hà Nội', NULL, N'0934567890', N'dongnt3@gmail.com', NULL, N'$2a$10$ryK2SpwVatAHvre7JtnRZODwnGDgcvniZkZo2UzwnC9CKnCwE/186', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.710' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'NV04', NULL, N'Nguyễn Thúy Hiền', NULL, NULL, N'Hưng Yên', NULL, N'0945678901', N'duongntt4@gmail.com', NULL, N'$2a$10$MS5ylSgm/o/O59zoKNgBwuC9JFN.Dxtj3nP5FEE8Gef30IsX874Zu', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.713' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'NV05', NULL, N'Đỗ Trung Trường', NULL, NULL, N'Hà Nội', NULL, N'0956789012', N'truongdt5@gmail.com', NULL, N'$2a$10$E5c0NZyJNPadkfdVHnC/au3f1i9DM9IE5iEVZXqlzRKUlPojfjBTy', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.713' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, N'NV06', NULL, N'Nguyễn Văn Thắng', NULL, NULL, N'Hà Nội', NULL, N'0967890123', N'thangnv6@gmail.com', NULL, N'$2a$10$wuyyjyRDWZ7.3qUe6JHHmuABtyZGSY/.PcwxlprSyoIDR36scuEDm', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.717' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, N'NV07', NULL, N'Lê Thị Hương Giang', NULL, NULL, N'Hà Nội', NULL, N'0978901234', N'gianglt7@gmail.com', NULL, N'$2a$10$F8NIyfX06jQx7OJ13olEi.5Rc4YVHxF5N/1OmxhED2jPK1yHN0nxW', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.717' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, N'NV08', NULL, N'Lê Văn Tiến', NULL, NULL, N'Hà Nội', NULL, N'0989012345', N'tienlv8@gmail.com', NULL, N'$2a$10$GeIHvOoj8z5W.Bbvn0x82OoWvXO8Sqj0xaXivNeTtOxfdHU.e5cVm', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.720' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, N'NV09', NULL, N'Nguyễn Văn Huy', NULL, NULL, N'Hà Nội', NULL, N'0990123456', N'huyhv9@gmail.com', NULL, N'$2a$10$GgOjn/r3un7JJNpN7cfnMu5YXT/t5LQGAMsVt44CL/cHdDvWlQMNS', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.720' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, N'NV10', NULL, N'Vũ Tiến Vinh', NULL, NULL, N'Hà Nội', NULL, N'0901234567', N'vinhv10@gmail.com', NULL, N'$2a$10$IG.Z.pcA8OwyN7ZKW3Uc5e0PA11PwbY4MJY1W8Pbp2gXPcG2Muwgy', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.720' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, N'NV11', NULL, N'Nguyễn Thị Ngọc Ánh', NULL, NULL, N'Hà Nội', NULL, N'0912345678', N'anhnt11@gmail.com', NULL, N'$2a$10$7BhRSosJdTSMNem.NrCqiuYAz30sSG93FyMFQitwPLz/IwLZ5SQ6C', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.723' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, N'NV12', NULL, N'Hoàng Văn Phương', NULL, NULL, N'Hà Nội', NULL, N'0923456789', N'phuonghv12@gmail.com', NULL, N'$2a$10$zBZhPgn1lznGfQFPGg8RA.Jez0rt1BURWhKHhoZvB87rHOkoHRcqy', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.723' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, N'NV13', NULL, N'Đặng Thị Thanh Lan', NULL, NULL, N'Hà Nội', NULL, N'0934567890', N'lannt13@gmail.com', NULL, N'$2a$10$deyiVaRrLwBCrqclMZIpe.AH9XuaWa6sRXflpODRrV.B51mLIeE8m', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.727' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, N'NV14', NULL, N'Nguyễn Trung Hiếu', NULL, NULL, N'Hà Nội', NULL, N'0945678901', N'hieun14@gmail.com', NULL, N'$2a$10$cuw5SCDpCtIVbaqvCZ9Jke.jvX5NNEFZ56OnV8bf67CgVF.RNU8H6', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.727' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, N'NV15', NULL, N'Dương Quang Vinh', NULL, NULL, N'Hà Nội', NULL, N'0956789012', N'vinhdq15@gmail.com', NULL, N'$2a$10$o93GhEe9T3XsvGc4eEsaKe3XMs.QlKH35ZzldjpMTjgWqBkzdbZ2S', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.727' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, N'NV16', NULL, N'Vi Văn Thái', NULL, NULL, N'Hà Nội', NULL, N'0967890123', N'thai.vv16@gmail.com', NULL, N'$2a$10$vLJo6SkW9u0k5rp4q18uH.Dgkq4LiNFiU2HoFV.nSP2EmM9PqoQC6', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.730' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, N'NV17', NULL, N'Vũ Trọng Minh', NULL, NULL, N'Hà Nội', NULL, N'0978901234', N'minhvtr17@gmail.com', NULL, N'$2a$10$bjUBOgZ2NVQTaXbamaD1MOoEwS5tVPaWZG6KqdTwOC68oKb97L6pe', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.730' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, N'NV18', NULL, N'Truong Văn Thiện', NULL, NULL, N'Hà Nội', NULL, N'0989012345', N'thientv18@gmail.com', NULL, N'$2a$10$6d/2dK6qIUuuNQp4cdnA.eYs5eqgBLtMFCpKl22Y9vRqM2pUg34Ti', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.730' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, N'NV19', NULL, N'Trần Tuấn Vũ', NULL, NULL, N'Hà Nội', NULL, N'0990123456', N'vutuan19@gmail.com', NULL, N'$2a$10$irz6AEN1fayaoh.OwsbtuecY8Rb4BJdTBK.dWDC/zLizI3l0KXH0G', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.733' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, N'NV20', NULL, N'Trương Hà Vy', NULL, NULL, N'Hà Nội', NULL, N'0901234567', N'vyth21@gmail.com', NULL, N'$2a$10$upvqzVv6YG88eO.Z5yPDz.HbfYC4OoaPuF/KJVlnJIo9Jqqxk2osi', 0, CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.733' AS DateTime), N'Admin', 1)
INSERT [dbo].[NhanVien] ([Id], [MaNhanVien], [Anh], [HoVaTen], [NgaySinh], [GioiTinh], [QueQuan], [Cccd], [SoDienThoai], [Email], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, N'NV21', NULL, N'Bùi Văn Hiệu', NULL, NULL, N'Hà Nội', NULL, N'0934567890', N'nguyenminhtuan25102002@gmail.com', NULL, N'123456789',1,  CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:43:38.703' AS DateTime), N'Admin', 1)

SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuGiamGia] ON 

INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, N'PGG001', N'Giảm 10%', 500000.0000, 10, 100000.0000, 100, 0, 0, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime), CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 1)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 2, N'PGG002', N'Giảm 20%', 1000000.0000, 20, 200000.0000, 50, 0, 0, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime), CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 1)
INSERT [dbo].[PhieuGiamGia] ([Id], [IdHoaDon], [MaCode], [TenPhieu], [GiaTriGiamToiDa], [GiaTriGiam], [DonToiThieu], [SoLuong], [LoaiPhieu], [KieuPhieu], [NgayBatDau], [NgayKetThuc], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 3, N'PGG003', N'Giảm 15%', 700000.0000, 15, 150000.0000, 80, 0, 0, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime), CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.923' AS DateTime), N'Admin', 1)
SET IDENTITY_INSERT [dbo].[PhieuGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, 1, 1, N'NIKE001', N'Nike Air Max', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 1, 2, 2, N'NIKE002', N'Nike Zoom', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 1, 3, 3, N'NIKE003', N'Nike Pegasus', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 2, 1, 4, N'ADIDAS001', N'Adidas Ultraboost', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, 2, 2, 2, N'ADIDAS002', N'Adidas NMD', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, 2, 3, 1, N'ADIDAS003', N'Adidas Gazelle', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, 3, 1, 5, N'GUCCI001', N'Gucci Rhyton', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, 3, 2, 3, N'GUCCI002', N'Gucci Ace', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, 3, 3, 2, N'GUCCI003', N'Gucci Screener', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, 4, 1, 2, N'DOLCE001', N'Dolce Super King', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, 4, 2, 1, N'DOLCE002', N'Dolce NS1', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, 4, 3, 4, N'DOLCE003', N'Dolce Daymaster', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, 5, 1, 3, N'BALENCIAGA001', N'Balenciaga Triple S', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, 5, 2, 5, N'BALENCIAGA002', N'Balenciaga Speed', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, 5, 3, 4, N'BALENCIAGA003', N'Balenciaga Track', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, 6, 1, 4, N'PUMA001', N'Puma RS-X', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, 6, 2, 3, N'PUMA002', N'Puma Suede', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPham] ([Id], [IdThuongHieu], [IdChatLieu], [IdDeGiay], [MaSanPham], [TenSanPham], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, 6, 3, 2, N'PUMA003', N'Puma Cali', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.890' AS DateTime), N'Admin', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPhamChiTiet] ON 

INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, 1, 1, 1, NULL, N'NIKE001-35-1', N'QR_NIKE001_35_1', 10, 3000000.0000, N'Size 35, màu Xanh dương', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, 1, 2, 2, NULL, N'NIKE001-36-2', N'QR_NIKE001_36_2', 15, 3000000.0000, N'Size 36, màu Cam', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, 1, 3, 3, NULL, N'NIKE001-37-3', N'QR_NIKE001_37_3', 20, 3000000.0000, N'Size 37, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, 1, 4, 4, NULL, N'NIKE001-38-4', N'QR_NIKE001_38_4', 12, 3000000.0000, N'Size 38, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, 1, 5, 5, NULL, N'NIKE001-39-5', N'QR_NIKE001_39_5', 8, 3000000.0000, N'Size 39, màu Xanh lá', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, 2, 1, 6, NULL, N'NIKE002-35-6', N'QR_NIKE002_35_6', 10, 3500000.0000, N'Size 35, màu Turquoise', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (7, 2, 2, 7, NULL, N'NIKE002-36-7', N'QR_NIKE002_36_7', 15, 3500000.0000, N'Size 36, màu Xanh nhạt', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (8, 2, 3, 8, NULL, N'NIKE002-37-8', N'QR_NIKE002_37_8', 20, 3500000.0000, N'Size 37, màu Nâu', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (9, 2, 4, 9, NULL, N'NIKE002-38-9', N'QR_NIKE002_38_9', 12, 3500000.0000, N'Size 38, màu Hồng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (10, 2, 5, 10, NULL, N'NIKE002-39-10', N'QR_NIKE002_39_10', 8, 3500000.0000, N'Size 39, màu Xanh navy', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (11, 3, 1, 11, NULL, N'NIKE003-35-11', N'QR_NIKE003_35_11', 10, 3200000.0000, N'Size 35, màu Vàng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (12, 3, 2, 12, NULL, N'NIKE003-36-12', N'QR_NIKE003_36_12', 15, 3200000.0000, N'Size 36, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (13, 3, 3, 13, NULL, N'NIKE003-37-13', N'QR_NIKE003_37_13', 20, 3200000.0000, N'Size 37, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (14, 3, 4, 14, NULL, N'NIKE003-38-14', N'QR_NIKE003_38_14', 12, 3200000.0000, N'Size 38, màu Kem', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (15, 3, 5, 15, NULL, N'NIKE003-39-15', N'QR_NIKE003_39_15', 8, 3200000.0000, N'Size 39, màu Bạc', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (16, 4, 1, 1, NULL, N'ADIDAS001-35-1', N'QR_ADIDAS001_35_1', 10, 4000000.0000, N'Size 35, màu Xanh dương', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (17, 4, 2, 2, NULL, N'ADIDAS001-36-2', N'QR_ADIDAS001_36_2', 15, 4000000.0000, N'Size 36, màu Cam', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (18, 4, 3, 3, NULL, N'ADIDAS001-37-3', N'QR_ADIDAS001_37_3', 20, 4000000.0000, N'Size 37, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (19, 4, 4, 4, NULL, N'ADIDAS001-38-4', N'QR_ADIDAS001_38_4', 12, 4000000.0000, N'Size 38, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (20, 4, 5, 5, NULL, N'ADIDAS001-39-5', N'QR_ADIDAS001_39_5', 8, 4000000.0000, N'Size 39, màu Xanh lá', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (21, 7, 1, 6, NULL, N'GUCCI001-35-6', N'QR_GUCCI001_35_6', 10, 1500000.0000, N'Size 35, màu Turquoise', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (22, 7, 2, 7, NULL, N'GUCCI001-36-7', N'QR_GUCCI001_36_7', 12, 1500000.0000, N'Size 36, màu Xanh nhạt', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (23, 7, 3, 8, NULL, N'GUCCI001-37-8', N'QR_GUCCI001_37_8', 8, 1500000.0000, N'Size 37, màu Nâu', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (24, 7, 4, 9, NULL, N'GUCCI001-38-9', N'QR_GUCCI001_38_9', 15, 1500000.0000, N'Size 38, màu Hồng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (25, 7, 5, 10, NULL, N'GUCCI001-39-10', N'QR_GUCCI001_39_10', 10, 1500000.0000, N'Size 39, màu Xanh navy', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (26, 8, 1, 11, NULL, N'GUCCI002-35-11', N'QR_GUCCI002_35_11', 10, 1300000.0000, N'Size 35, màu Vàng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (27, 8, 2, 12, NULL, N'GUCCI002-36-12', N'QR_GUCCI002_36_12', 12, 1300000.0000, N'Size 36, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (28, 8, 3, 13, NULL, N'GUCCI002-37-13', N'QR_GUCCI002_37_13', 8, 1300000.0000, N'Size 37, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (29, 8, 4, 14, NULL, N'GUCCI002-38-14', N'QR_GUCCI002_38_14', 15, 1300000.0000, N'Size 38, màu Kem', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (30, 8, 5, 15, NULL, N'GUCCI002-39-15', N'QR_GUCCI002_39_15', 10, 1300000.0000, N'Size 39, màu Bạc', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (31, 9, 1, 1, NULL, N'GUCCI003-35-1', N'QR_GUCCI003_35_1', 10, 1400000.0000, N'Size 35, màu Xanh dương', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (32, 9, 2, 2, NULL, N'GUCCI003-36-2', N'QR_GUCCI003_36_2', 12, 1400000.0000, N'Size 36, màu Cam', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (33, 9, 3, 3, NULL, N'GUCCI003-37-3', N'QR_GUCCI003_37_3', 8, 1400000.0000, N'Size 37, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (34, 9, 4, 4, NULL, N'GUCCI003-38-4', N'QR_GUCCI003_38_4', 15, 1400000.0000, N'Size 38, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (35, 9, 5, 5, NULL, N'GUCCI003-39-5', N'QR_GUCCI003_39_5', 10, 1400000.0000, N'Size 39, màu Xanh lá', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (36, 10, 1, 6, NULL, N'DOLCE001-35-6', N'QR_DOLCE001_35_6', 12, 1200000.0000, N'Size 35, màu Turquoise', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (37, 10, 2, 7, NULL, N'DOLCE001-36-7', N'QR_DOLCE001_36_7', 8, 1200000.0000, N'Size 36, màu Xanh nhạt', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (38, 10, 3, 8, NULL, N'DOLCE001-37-8', N'QR_DOLCE001_37_8', 15, 1200000.0000, N'Size 37, màu Nâu', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (39, 10, 4, 9, NULL, N'DOLCE001-38-9', N'QR_DOLCE001_38_9', 10, 1200000.0000, N'Size 38, màu Hồng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (40, 10, 5, 10, NULL, N'DOLCE001-39-10', N'QR_DOLCE001_39_10', 12, 1200000.0000, N'Size 39, màu Xanh navy', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (41, 13, 1, 1, NULL, N'BALENCIAGA001-35-1', N'QR_BALENCIAGA001_35_1', 10, 1800000.0000, N'Size 35, màu Xanh dương', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (42, 13, 2, 2, NULL, N'BALENCIAGA001-36-2', N'QR_BALENCIAGA001_36_2', 8, 1800000.0000, N'Size 36, màu Cam', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (43, 13, 3, 3, NULL, N'BALENCIAGA001-37-3', N'QR_BALENCIAGA001_37_3', 12, 1800000.0000, N'Size 37, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (44, 13, 4, 4, NULL, N'BALENCIAGA001-38-4', N'QR_BALENCIAGA001_38_4', 10, 1800000.0000, N'Size 38, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (45, 13, 5, 5, NULL, N'BALENCIAGA001-39-5', N'QR_BALENCIAGA001_39_5', 15, 1800000.0000, N'Size 39, màu Xanh lá', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (46, 14, 1, 6, NULL, N'BALENCIAGA002-35-6', N'QR_BALENCIAGA002_35_6', 12, 1500000.0000, N'Size 35, màu Turquoise', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (47, 14, 2, 7, NULL, N'BALENCIAGA002-36-7', N'QR_BALENCIAGA002_36_7', 8, 1500000.0000, N'Size 36, màu Xanh nhạt', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (48, 14, 3, 8, NULL, N'BALENCIAGA002-37-8', N'QR_BALENCIAGA002_37_8', 10, 1500000.0000, N'Size 37, màu Nâu', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (49, 14, 4, 9, NULL, N'BALENCIAGA002-38-9', N'QR_BALENCIAGA002_38_9', 15, 1500000.0000, N'Size 38, màu Hồng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (50, 14, 5, 10, NULL, N'BALENCIAGA002-39-10', N'QR_BALENCIAGA002_39_10', 10, 1500000.0000, N'Size 39, màu Xanh navy', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (51, 15, 1, 11, NULL, N'BALENCIAGA003-35-11', N'QR_BALENCIAGA003_35_11', 8, 1700000.0000, N'Size 35, màu Vàng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (52, 15, 2, 12, NULL, N'BALENCIAGA003-36-12', N'QR_BALENCIAGA003_36_12', 12, 1700000.0000, N'Size 36, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (53, 15, 3, 13, NULL, N'BALENCIAGA003-37-13', N'QR_BALENCIAGA003_37_13', 15, 1700000.0000, N'Size 37, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (54, 15, 4, 14, NULL, N'BALENCIAGA003-38-14', N'QR_BALENCIAGA003_38_14', 10, 1700000.0000, N'Size 38, màu Kem', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (55, 15, 5, 15, NULL, N'BALENCIAGA003-39-15', N'QR_BALENCIAGA003_39_15', 10, 1700000.0000, N'Size 39, màu Bạc', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (56, 16, 1, 1, NULL, N'PUMA001-35-1', N'QR_PUMA001_35_1', 10, 350000.0000, N'Size 35, màu Xanh dương', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (57, 16, 2, 2, NULL, N'PUMA001-36-2', N'QR_PUMA001_36_2', 12, 350000.0000, N'Size 36, màu Cam', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (58, 16, 3, 3, NULL, N'PUMA001-37-3', N'QR_PUMA001_37_3', 8, 350000.0000, N'Size 37, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (59, 16, 4, 4, NULL, N'PUMA001-38-4', N'QR_PUMA001_38_4', 15, 350000.0000, N'Size 38, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (60, 16, 5, 5, NULL, N'PUMA001-39-5', N'QR_PUMA001_39_5', 10, 350000.0000, N'Size 39, màu Xanh lá', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (61, 17, 1, 6, NULL, N'PUMA002-35-6', N'QR_PUMA002_35_6', 12, 330000.0000, N'Size 35, màu Turquoise', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (62, 17, 2, 7, NULL, N'PUMA002-36-7', N'QR_PUMA002_36_7', 8, 330000.0000, N'Size 36, màu Xanh nhạt', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (63, 17, 3, 8, NULL, N'PUMA002-37-8', N'QR_PUMA002_37_8', 10, 330000.0000, N'Size 37, màu Nâu', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (64, 17, 4, 9, NULL, N'PUMA002-38-9', N'QR_PUMA002_38_9', 15, 330000.0000, N'Size 38, màu Hồng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (65, 17, 5, 10, NULL, N'PUMA002-39-10', N'QR_PUMA002_39_10', 10, 330000.0000, N'Size 39, màu Xanh navy', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (66, 18, 1, 11, NULL, N'PUMA003-35-11', N'QR_PUMA003_35_11', 10, 340000.0000, N'Size 35, màu Vàng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (67, 18, 2, 12, NULL, N'PUMA003-36-12', N'QR_PUMA003_36_12', 8, 340000.0000, N'Size 36, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (68, 18, 3, 13, NULL, N'PUMA003-37-13', N'QR_PUMA003_37_13', 12, 340000.0000, N'Size 37, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (69, 18, 4, 14, NULL, N'PUMA003-38-14', N'QR_PUMA003_38_14', 15, 340000.0000, N'Size 38, màu Kem', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (70, 18, 5, 15, NULL, N'PUMA003-39-15', N'QR_PUMA003_39_15', 10, 340000.0000, N'Size 39, màu Bạc', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (71, 5, 1, 1, NULL, N'ADIDAS002-36-1', N'QR_ADIDAS002_36_1', 10, 1800000.0000, N'Size 36, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (72, 5, 2, 2, NULL, N'ADIDAS002-37-2', N'QR_ADIDAS002_37_2', 12, 1800000.0000, N'Size 37, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (73, 5, 3, 3, NULL, N'ADIDAS002-38-3', N'QR_ADIDAS002_38_3', 8, 1800000.0000, N'Size 38, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (74, 5, 4, 4, NULL, N'ADIDAS002-39-4', N'QR_ADIDAS002_39_4', 15, 1800000.0000, N'Size 39, màu Xanh', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (75, 5, 5, 5, NULL, N'ADIDAS002-40-5', N'QR_ADIDAS002_40_5', 10, 1800000.0000, N'Size 40, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (76, 6, 1, 1, NULL, N'ADIDAS003-36-1', N'QR_ADIDAS003_36_1', 10, 1600000.0000, N'Size 36, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (77, 6, 2, 2, NULL, N'ADIDAS003-37-2', N'QR_ADIDAS003_37_2', 12, 1600000.0000, N'Size 37, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (78, 6, 3, 3, NULL, N'ADIDAS003-38-3', N'QR_ADIDAS003_38_3', 8, 1600000.0000, N'Size 38, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (79, 6, 4, 4, NULL, N'ADIDAS003-39-4', N'QR_ADIDAS003_39_4', 10, 1600000.0000, N'Size 39, màu Xanh', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (80, 11, 1, 1, NULL, N'DOLCE002-37-1', N'QR_DOLCE002_37_1', 8, 2200000.0000, N'Size 37, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (81, 11, 2, 2, NULL, N'DOLCE002-38-2', N'QR_DOLCE002_38_2', 10, 2200000.0000, N'Size 38, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (82, 11, 3, 3, NULL, N'DOLCE002-39-3', N'QR_DOLCE002_39_3', 12, 2200000.0000, N'Size 39, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (83, 12, 1, 1, NULL, N'DOLCE003-36-1', N'QR_DOLCE003_36_1', 5, 2500000.0000, N'Size 36, màu Đen', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (84, 12, 2, 2, NULL, N'DOLCE003-37-2', N'QR_DOLCE003_37_2', 10, 2500000.0000, N'Size 37, màu Xám', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (85, 12, 3, 3, NULL, N'DOLCE003-38-3', N'QR_DOLCE003_38_3', 7, 2500000.0000, N'Size 38, màu Trắng', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
INSERT [dbo].[SanPhamChiTiet] ([Id], [IdSanPham], [IdKichCo], [IdMauSac], [IdDotGiamGia], [MaSanPhamChiTiet], [QRCode], [SoLuong], [GiaTien], [MoTa], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (86, 12, 4, 4, NULL, N'DOLCE003-39-4', N'QR_DOLCE003_39_4', 15, 2500000.0000, N'Size 39, màu Đỏ', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.893' AS DateTime), N'Admin', 1)
SET IDENTITY_INSERT [dbo].[SanPhamChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (1, N'Nike', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (2, N'Adidas', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (3, N'Gucci', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (4, N'Dolce', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (5, N'Balenciaga', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
INSERT [dbo].[ThuongHieu] ([Id], [TenThuongHieu], [NgayTao], [NguoiTao], [LanCapNhatCuoi], [NguoiCapNhat], [TrangThai]) VALUES (6, N'Puma', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', CAST(N'2025-01-20T17:42:32.887' AS DateTime), N'Admin', 1)
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
/****** Object:  Index [UQ__GioHang__7CF5D83745B20433]    Script Date: 20/01/2025 18:03:15 ******/
ALTER TABLE [dbo].[GioHang] ADD CONSTRAINT UQ_GioHang_KhachHang_SanPham UNIQUE (IdKhachHang, IdSanPhamChiTiet);
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__HoaDon__3B2ABEFC22001BB9]    Script Date: 20/01/2025 18:03:15 ******/
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
USE [master]
GO
ALTER DATABASE [DATN_REGAL] SET  READ_WRITE 
GO
