USE [QLDT]
GO
/****** Object:  UserDefinedFunction [dbo].[GV_TuTangMaDT]    Script Date: 10/17/2023 9:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GV_TuTangMaDT]()
RETURNs nvarchar(20)
AS 
BEGIN 
DECLARE @madt CHAR(10)
	
SELECT @madt = MADT FROM dbo.DeTai
IF @madt IS NULL
SET @madt = 0
ELSE 
SELECT @madt = MAX(CONVERT(INT, substring(MADT,3,len(MADT)-2))) FROM dbo.DeTai
SELECT @madt = CASE
	WHEN @madt >=0 AND @madt <9 THEN  'DT00'+CONVERT(CHAR,@madt +1)
	WHEN @madt >=9 AND @madt <99 THEN  'DT0'+CONVERT(CHAR,@madt +1)
	WHEN @madt >=99  THEN 'DT'+CONVERT(CHAR,@madt +1)
	END 
RETURN @madt

END
GO
/****** Object:  UserDefinedFunction [dbo].[KHOA_TuTangIDUSER]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[KHOA_TuTangIDUSER]()
RETURNs char(10)
AS 
BEGIN 
DECLARE @ID CHAR(10)
SELECT @ID = ID FROM dbo.USERS
IF @ID IS NULL
SET @ID = 0
ELSE 
SELECT @ID = MAX(CONVERT(INT,ID)) FROM dbo.USERS
SELECT @ID = CASE
	WHEN @ID >=0 THEN CONVERT(CHAR,@ID +1)
	END 
RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[KHOA_TuTangMaHD]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[KHOA_TuTangMaHD]()
RETURNs char(10)
AS 
BEGIN 
DECLARE @maHD CHAR(10)
SELECT @maHD = MAHD FROM dbo.HoiDongNT
IF @maHD IS NULL
SET @maHD = 0
ELSE 
SELECT @maHD = MAX(CONVERT(INT, substring(MAHD,3,len(MAHD)-2))) FROM dbo.HoiDongNT
SELECT @maHD = CASE
	WHEN @maHD >=0 AND @maHD <9 THEN  'HD00'+CONVERT(CHAR,@maHD +1)
	WHEN @maHD >=9 AND @maHD <99 THEN  'HD0'+CONVERT(CHAR,@maHD +1)
	WHEN @maHD >=99  THEN 'HD'+CONVERT(CHAR,@maHD +1)
	END 
RETURN @maHD
END
GO
/****** Object:  UserDefinedFunction [dbo].[PKHQS_TuTangMaKhenThuong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[PKHQS_TuTangMaKhenThuong]()
RETURNs char(10)
AS 
BEGIN 
DECLARE @maKT CHAR(10)
SELECT @maKT = maKT FROM dbo.KhenThuong
IF @maKT IS NULL
SET @maKT = 0
ELSE 
SELECT @maKT = MAX(CONVERT(INT, substring(maKT,3,len(maKT)-2))) FROM dbo.KhenThuong
SELECT @maKT = CASE
	WHEN @maKT >=0 AND @maKT <9 THEN  'KT00'+CONVERT(CHAR,@maKT +1)
	WHEN @maKT >=9 AND @maKT <99 THEN  'KT0'+CONVERT(CHAR,@maKT +1)
	WHEN @maKT >=99  THEN 'KT'+CONVERT(CHAR,@maKT +1)
	END 
RETURN @maKT
END
GO
/****** Object:  UserDefinedFunction [dbo].[PKHQS_TuTangMaXP]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[PKHQS_TuTangMaXP]()
RETURNs char(10)
AS 
BEGIN 
DECLARE @maKT CHAR(10)
SELECT @maKT = MaVP FROM dbo.XuLyViPham
IF @maKT IS NULL
SET @maKT = 0
ELSE 
SELECT @maKT = MAX(CONVERT(INT, substring(maVP,3,len(maVP)-2))) FROM dbo.XuLyViPham
SELECT @maKT = CASE
	WHEN @maKT >=0 AND @maKT <9 THEN  'VP00'+CONVERT(CHAR,@maKT +1)
	WHEN @maKT >=9 AND @maKT <99 THEN  'VP0'+CONVERT(CHAR,@maKT +1)
	WHEN @maKT >=99  THEN 'VP'+CONVERT(CHAR,@maKT +1)
	END 
RETURN @maKT
END
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaDT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TuTangMaDT]()
RETURNs char(10)
AS 
BEGIN 
DECLARE @madt CHAR(10)
	
SELECT @madt = MADT FROM dbo.DeTai
IF @madt IS NULL
SET @madt = 0
ELSE 
SELECT @madt = MAX(CONVERT(INT, substring(MADT,3,len(MADT)-2))) FROM dbo.DeTai
SELECT @madt = CASE
	WHEN @madt >=0 AND @madt <9 THEN  'DT00'+CONVERT(CHAR,@madt +1)
	WHEN @madt >=9 AND @madt <99 THEN  'DT0'+CONVERT(CHAR,@madt +1)
	WHEN @madt >=99  THEN 'DT'+CONVERT(CHAR,@madt +1)
	
	END 
RETURN @madt

END
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaGV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[TuTangMaGV]()
RETURNs char(10)
AS 
BEGIN 
DECLARE @magv CHAR(10)
	
SELECT @magv = MaGV FROM dbo.GiangVien
IF @magv IS NULL
SET @magv = 0
ELSE 
SELECT @magv = MAX(CONVERT(INT, substring(MaGV,3,len(MaGV)-2))) FROM dbo.GiangVien
SELECT @magv = CASE
	WHEN @magv >=0 AND @magv <9 THEN  'GV00'+CONVERT(CHAR,@magv +1)
	WHEN @magv >=9 AND @magv <99 THEN  'GV0'+CONVERT(CHAR,@magv +1)
	WHEN @magv >=99  THEN 'GV'+CONVERT(CHAR,@magv +1)
	
	END 
RETURN @magv

END
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaHV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[TuTangMaHV]()
RETURNs char(10)
AS 
BEGIN 
DECLARE @mahv CHAR(10)
	
SELECT @mahv = MaHV FROM dbo.HocVien
IF @mahv IS NULL
SET @mahv = 0
ELSE 
SELECT @mahv = MAX(CONVERT(INT, substring(MaHV,3,len(MaHV)-2))) FROM dbo.HocVien
SELECT @mahv = CASE
	WHEN @mahv >=0 AND @mahv <9 THEN  'HV00'+CONVERT(CHAR,@mahv +1)
	WHEN @mahv >=9 AND @mahv <99 THEN  'HV0'+CONVERT(CHAR,@mahv +1)
	WHEN @mahv >=99  THEN 'HV'+CONVERT(CHAR,@mahv +1)
	
	END 
RETURN @mahv

END
GO
/****** Object:  Table [dbo].[BoMon]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoMon](
	[MaBM] [char](10) NOT NULL,
	[TenBM] [nvarchar](50) NULL,
	[SDT] [char](15) NULL,
	[MaK] [char](10) NOT NULL,
 CONSTRAINT [PK_BoMon] PRIMARY KEY CLUSTERED 
(
	[MaBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CB_P]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CB_P](
	[MaCBP] [char](10) NOT NULL,
	[TenCB] [nvarchar](50) NULL,
	[CapBac] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[MaP] [char](10) NOT NULL,
 CONSTRAINT [PK_CB_P] PRIMARY KEY CLUSTERED 
(
	[MaCBP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaiDoi]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaiDoi](
	[MaDD] [char](10) NOT NULL,
	[TenDD] [nvarchar](50) NOT NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[QuanSo] [int] NULL,
	[MaTD] [char](10) NOT NULL,
 CONSTRAINT [PK_DaiDoi] PRIMARY KEY CLUSTERED 
(
	[MaDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeTai]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeTai](
	[MaDT] [char](10) NOT NULL,
	[TenDT] [nvarchar](500) NULL,
	[NgayBD] [date] NULL,
	[NgayNT] [date] NULL,
	[KinhPhi] [int] NULL,
	[TienDo] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[NamHoc] [varchar](15) NULL,
 CONSTRAINT [PK_DeTai] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [char](10) NOT NULL,
	[TenGV] [nvarchar](50) NULL,
	[CapBac] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[MaBM] [char](10) NOT NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiayDKDT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiayDKDT](
	[MaGDK] [char](10) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[NgayDK] [date] NULL,
	[MaDT] [char](10) NOT NULL,
	[MaP] [char](10) NOT NULL,
 CONSTRAINT [PK_GiayDKDT] PRIMARY KEY CLUSTERED 
(
	[MaGDK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVien](
	[MaHV] [char](10) NOT NULL,
	[TenHV] [nvarchar](50) NOT NULL,
	[CapBac] [nvarchar](50) NULL,
	[NamSinh] [date] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[MaDD] [char](10) NOT NULL,
 CONSTRAINT [PK_HocVien] PRIMARY KEY CLUSTERED 
(
	[MaHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDongNT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDongNT](
	[MaHD] [char](10) NOT NULL,
	[NamHoc] [char](10) NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaK] [char](10) NULL,
 CONSTRAINT [PK_HoiDongNT_1] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaNT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaNT](
	[MaHD] [char](10) NOT NULL,
	[MaDT] [char](10) NOT NULL,
	[KetQua] [nvarchar](50) NULL,
 CONSTRAINT [PK_KetQuaNT] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhenThuong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhenThuong](
	[MaKT] [char](10) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[CapDo] [nvarchar](50) NULL,
	[MaDT] [char](10) NOT NULL,
	[MaP] [char](10) NOT NULL,
 CONSTRAINT [PK_KhenThuong] PRIMARY KEY CLUSTERED 
(
	[MaKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaK] [char](10) NOT NULL,
	[TenK] [nvarchar](50) NULL,
	[SDT] [char](15) NULL,
	[MaCBP] [char](10) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phongKHQS]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phongKHQS](
	[MaP] [char](10) NOT NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[SDT] [char](15) NULL,
 CONSTRAINT [PK_phongKHQS] PRIMARY KEY CLUSTERED 
(
	[MaP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QDTLHD]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QDTLHD](
	[MaQDTL] [char](10) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[MaHD] [char](10) NULL,
	[MaP] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MAQ] [char](10) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MAQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyetDinhNT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyetDinhNT](
	[MaQD] [char](10) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[NgayRaQD] [date] NULL,
	[MaDT] [char](10) NOT NULL,
	[MaP] [char](10) NOT NULL,
 CONSTRAINT [PK_QuyetDinhNT] PRIMARY KEY CLUSTERED 
(
	[MaQD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhTich]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhTich](
	[MaHV] [char](10) NOT NULL,
	[Namhoc] [varchar](15) NOT NULL,
	[DiemTB] [char](5) NULL,
	[SoMonNo] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TieuDoan]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TieuDoan](
	[MaTD] [char](10) NOT NULL,
	[TenTD] [nvarchar](20) NOT NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[QuanSo] [int] NULL,
 CONSTRAINT [PK_TieuDoan] PRIMARY KEY CLUSTERED 
(
	[MaTD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TroLy]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TroLy](
	[MaTL] [char](10) NOT NULL,
	[TenTL] [nvarchar](50) NULL,
	[CapBac] [nvarchar](50) NULL,
	[MaTD] [char](10) NOT NULL,
 CONSTRAINT [PK_TroLy] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[ID] [char](10) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Passwords] [nvarchar](50) NULL,
	[MaQ] [char](10) NOT NULL,
	[MaUSER] [char](10) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTroGV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTroGV](
	[MaGV] [char](10) NOT NULL,
	[MaHD] [char](10) NOT NULL,
	[VaiTro] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaitroGV] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC,
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTroHD]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTroHD](
	[MaGV] [char](10) NOT NULL,
	[MaDT] [char](10) NOT NULL,
	[VaiTro] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaiTroHD] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC,
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTroHV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTroHV](
	[MaDT] [char](10) NOT NULL,
	[MaHV] [char](10) NOT NULL,
	[VaiTro] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VaiTroHV] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC,
	[MaHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XuLyViPham]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuLyViPham](
	[MaVP] [char](10) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[MucDo] [nvarchar](50) NULL,
	[HinhThucXL] [nvarchar](50) NULL,
	[MaDT] [char](10) NOT NULL,
	[MaP] [char](10) NOT NULL,
 CONSTRAINT [PK_XuLyViPham] PRIMARY KEY CLUSTERED 
(
	[MaVP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM01      ', N'An toàn thông tin', N'0349446048     ', N'K01       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM02      ', N'Hệ thống thông tin', N'0349446048     ', N'K01       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM03      ', N'Khoa học máy tính', N'0349446048     ', N'K01       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM04      ', N'Công nghệ phần mềm', N'0349446048     ', N'K01       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM05      ', N'Công nghệ mạng', N'0349446048     ', N'K01       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM06      ', N'Toán tin', N'0349446048     ', N'K01       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM07      ', N'Công trình quốc phòng', N'0349446048     ', N'K02       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM08      ', N'Cầu đường sân bay', N'0349446048     ', N'K02       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM09      ', N'Xây dựng nhà và công trình công nghiệp', N'0349446048     ', N'K02       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM10      ', N'Trắc địa bản đồ', N'0349446048     ', N'K03       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM11      ', N'Phòng hoá', N'0349446048     ', N'K04       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM12      ', N'Công nghệ vật liệu', N'0349446048     ', N'K05       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM13      ', N'Cơ sở kỹ thuật công trình', N'0349446048     ', N'K02       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM14      ', N'Đạn', N'0349446048     ', N'K06       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM15      ', N'Tác chiến điện tử', N'0349446048     ', N'K07       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM16      ', N'Thông tin', N'0349446048     ', N'K07       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM17      ', N'Tâm lý học Quân sự', N'0349446048     ', N'K08       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM18      ', N'Chiến thuật', N'0349446048     ', N'K08       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM19      ', N'Tư tưởng Hồ Chí Minh', N'0349446048     ', N'K09       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM20      ', N'Tiếng Anh', N'0349446048     ', N'K10       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM21      ', N'Tiếng Nga', N'0349446048     ', N'K10       ')
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [SDT], [MaK]) VALUES (N'BM22      ', N'Triết học', N'0349446048     ', N'K09       ')
GO
INSERT [dbo].[CB_P] ([MaCBP], [TenCB], [CapBac], [ChucVu], [MaP]) VALUES (N'CBP001    ', N'Đinh Thị Lan', N'Thiếu tá', N'Trưởng phòng', N'P01       ')
INSERT [dbo].[CB_P] ([MaCBP], [TenCB], [CapBac], [ChucVu], [MaP]) VALUES (N'CBP002    ', N'Nguyễn Mai Hương', N'Đại úy', N'Phó phòng', N'P01       ')
INSERT [dbo].[CB_P] ([MaCBP], [TenCB], [CapBac], [ChucVu], [MaP]) VALUES (N'CBP003    ', N'Chu Thị Hoa', N'Đại úy', N'Nhân viên', N'P01       ')
INSERT [dbo].[CB_P] ([MaCBP], [TenCB], [CapBac], [ChucVu], [MaP]) VALUES (N'CBP004    ', N'Hoàng Bích Hạnh', N'Thượng úy', N'Nhân viên', N'P01       ')
INSERT [dbo].[CB_P] ([MaCBP], [TenCB], [CapBac], [ChucVu], [MaP]) VALUES (N'CBP005    ', N'Lê Thị Linh', N'Thượng úy', N'Nhân viên', N'P01       ')
INSERT [dbo].[CB_P] ([MaCBP], [TenCB], [CapBac], [ChucVu], [MaP]) VALUES (N'CBP006    ', N'Hoàng Linh Phương', N'Thượng úy', N'Nhân viên', N'P01       ')
INSERT [dbo].[CB_P] ([MaCBP], [TenCB], [CapBac], [ChucVu], [MaP]) VALUES (N'CBP007    ', N'Nguyễn Khánh Tùng', N'Trung úy', N'Nhân viên', N'P01       ')
GO
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C001      ', N'Đại đội 154', N'T6, S9', 100, N'TD01      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C002      ', N'Đại đội 155', N'T5,S9', 100, N'TD01      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C003      ', N'Đại đội 156', N'T4,S9', 100, N'TD01      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C004      ', N'Đại đội 157', N'T3,S9', 100, N'TD01      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C005      ', N'Đại Đội 254', N'S11', 100, N'TD02      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C006      ', N'Đại Đội 255', N'S11', 100, N'TD02      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C007      ', N'Đại Đội 256', N'S11', 100, N'TD02      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C008      ', N'Đại Đội 257', N'S11', 100, N'TD02      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C009      ', N'Đại Đội 354', N'S11', 100, N'TD03      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C010      ', N'Đại Đội 355', N'S11', 100, N'TD03      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C011      ', N'Đại Đội 356', N'S11', 100, N'TD03      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C012      ', N'Đại Đội 357', N'S11', 100, N'TD03      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C013      ', N'Đại Đội 454', N'S11', 100, N'TD04      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C014      ', N'Đại Đội 455', N'S11', 100, N'TD04      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C015      ', N'Đại Đội 456', N'S11', 100, N'TD04      ')
INSERT [dbo].[DaiDoi] ([MaDD], [TenDD], [DiaDiem], [QuanSo], [MaTD]) VALUES (N'C016      ', N'Đại Đội 457', N'S11', 100, N'TD04      ')
GO
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT001     ', N'Nghiên cứu và phát triển hệ thống phát hiện mã độc', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT008     ', N'Nghiên cứu, xây dựng hệ thống thu thập dữ liệu phục vụ phòng chống xâm nhập', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT009     ', N'Nghiên cứu, xây dựng hệ thống thu thập dữ liệu phục vụ phòng chống xâm nhập', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT010     ', N'Nghiên cứu giải pháp định danh đối tượng IoT', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), 0, 0, N'Đang thực hiện', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT012     ', N'Xây dựng chương trình tính toán điều khiển hỏa lực pháo 105mm lắp trên phương tiện cơ động', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT014     ', N'Nghiên cứu ảnh hưởng của một số yếu tố đến rung động của cầu xe', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT015     ', N'Thiết kế, chế tạo mô hình xe tự hành vận chuyển', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT016     ', N'Phần mềm quản lý nhân viên', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT018     ', N'Nghiên cứu các thuật toán tìm kiếm ảnh theo nội dung, xây dựng hệ thống hỗ trợ tra cứu bằng hình ảnh', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT022     ', N'Nghiên cứu xây dựng một số mô hình  mạng học sâu hỗ trợ chẩn đoán ung thư tuyến tiền liệt', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT024     ', N'Nghiên cứu ứng dụng trí tuệ nhân tạo trong phát hiện tấn công chiếm quyền điều khiển mạng IOT', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT025     ', N'Nghiên cứu phương pháp tự động nhận dạng lệnh Tiếng Việt, ứng dụng trong điều khiển một số thiết bị bằng giọng nói', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT027     ', N'Bài toán cơ bản thuật phóng trong cho súng bộ binh', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT028     ', N'Thiết kế Hệ chuyên gia y tế hỗ trợ phát hiện sớm bệnh COVID-19 giúp ngăn ngừa nguy cơ lây nhiễm cho các cơ sở trường học ở Việt Nam', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT029     ', N'Nghiên cứu, thiết kế thiết bị gây nhiễu đường thông tin số liệu dải sóng cực ngắn', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT030     ', N'Thiết kế, chế tạo kim hỏa pháo 85d44', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT031     ', N'Thiết kế, chế tạo cần hất vỏ đạn cho pháo 85d44', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT033     ', N'Nghiên cứu lắp đặt pháo 105mm lên xe M548', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 400, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT034     ', N'Tính toán thiết kế đạn bắn hai môi trường 7,62x39m', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), 0, 30, N'Đang thực hiện', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT035     ', N'Nhận diện dáng đi', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), 0, 30, N'Đang thực hiện', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT036     ', N'Mô phỏng quá trình nhiệt luyện chi tiết sử dụng vật liệu', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), 0, 30, N'Đang thực hiện', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT037     ', N'Nghiên cứu tối ưu hóa công nghệ ủ hợp kim nhôm B95 vật liệu', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT038     ', N'Ảnh hưởng của nhiệt luyện đến tổ chức và tính chất vật liệu', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT039     ', N'Nghiên cứu ảnh hưởng của nhiệt luyện đến tổ chức v', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT040     ', N'Nghiên cứu mô phỏng số các cơ cấu tự động hóa', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT041     ', N'Nghiên cứu, thiết kế, chế tạo máy sản xuất nhanh', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT042     ', N'Mô hình hóa toán học và tối ưu hóa quy trình công', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT043     ', N'Nghiên cứu các mô hình công nghệ trong công nghệ', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT044     ', N'Nghiên cứu tối ưu hóa hình học khi thiết kế các', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT045     ', N'Ứng dụng phần tử tiếp xúc trong tính toán bền mối', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT046     ', N'Hiệu ứng Coriolis trong các cơ hệ dao động 2 bậc', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT047     ', N'Phát triển phần tử dầm mới cho phân tích dầm FGM', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT048     ', N'Phân tích uốn tĩnh dầm FGM có chiều dày thay đổi', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT049     ', N'Tính toán động lực học của máy đào thủy lực trên', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT050     ', N'Nghiên cứu ứng xử Nhiệt – Cơ của cặp dầm dạng chữ', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT051     ', N'Nghiên cứu, thiết kế phương tiện cá nhân “xanh” cho người già tại các khu đô thị', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT052     ', N'Nghiên cứu giao thức truyền tin tốc độ cao giữa máy tính và FPGA phục vụ bài toán ngăn chặn tấn công mạng', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT053     ', N'Nghiên cứu xây dựng máy ảo cho hệ thống sản xuất thông minh dựa trên công nghệ digital-twins', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT054     ', N'Xây dựng hệ thống đo lường đánh giá loại bỏ tín hiệu nhiễu đồng pha trong thu nhận tín hiệu y sinh', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT055     ', N'Nghiên cứu thiết kế mô hình laser công suất thấp hỗ trợ điều trị cai nghiện ma túy', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT056     ', N'Nghiên cứu phương pháp kiểm tra cân bằng nhanh sàng lọc cho rối loạn tiền đình', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT057     ', N'Nghiên cứu các phương pháp đánh giá độ cứng của nước dùng trong y tế', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT058     ', N'Nghiên cứu và xây dựng thuật toán tính chỉ số SUV trên hệ thống PET/CT trên cơ sở dữ liệu DICOM', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT059     ', N'Nghiên cứu nâng cao chất lượng lấy mẫu nén trong tạo ảnh cộng hưởng từ song song (pMRI) sử dụng công cụ lập trình matlab', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT060     ', N'Xây dựng hệ thống đo lường đánh giá loại bỏ tín hiệu nhiễu đồng pha trong thu nhận tín hiệu y sinh', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT061     ', N'Nghiên cứu xây dựng hệ thống tự động phân tích đánh giá biến thiên nhịp tim', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT062     ', N'Thiết kế Hệ chuyên gia y tế hỗ trợ phát hiện sớm bệnh COVID-19 giúp ngăn ngừa nguy cơ lây nhiễm cho các cơ sở trường học ở Việt Nam', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT063     ', N'Thiết kế Hệ chuyên gia y tế hỗ trợ chẩn đoán một số bệnh về da phổ biến ở Việt Nam', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT064     ', N'Mô phỏng thuật toán tái tạo ảnh hai chiều trong thiết bị chụp cắt lớp quang kết hợp', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT065     ', N'Thiết kế phần mềm quản lý thư viện hình ảnh phục vụ khám nội soi Tai Mũi Họng', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT066     ', N'Nghiên cứu, thiết kế chế tạo thiết bị phát hiện cảnh báo sớm cơn buồn ngủ thông qua thu nhận và phân tích tín hiệu PPG', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT067     ', N'Nghiên cứu chế tạo thử nghiệm mô đun gắn kit TC04-SESTAMIBI dùng trong xạ hình tưới máu cơ tim', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT068     ', N'Nghiên cứu khả năng ứng dụng phương pháp đo sâu điện để sơ bộ xác định vị trí các công trình ngầm hiện có nhằm phục vụ cho công tác điều tra khảo sát phục vụ quy hoạch, thiết kế và thi công các công trình ở khu vực quần đảo Trường Sa', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT069     ', N'Nghiên cứu ảnh hưởng của một số yếu tố đến rung động của cầu xe', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT070     ', N'Nghiên cứu thiết kế, mô phỏng nguyên lý làm việc của hệ thống trợ lực thủy lực dẫn động điều khiển lắp đặt lên Mô hình xe tăng T-55', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT071     ', N'Nghiên cứu thiết kế, mô phỏng nguyên lý làm việc của hệ thống khí nén lắp đặt lên Mô hình xe tăng T-55', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT072     ', N'Nghiên cứu và ứng dụng thuật toán định vị, dẫn đường cho robot', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT073     ', N'Nghiên cứu mô phỏng quá trình khởi động động cơ tua bin khí DO90 trên tàu Gepard 3.9', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT074     ', N'Mô hình hóa động lực học hệ robot song song 2 tầng', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT075     ', N'Nghiên cứu giải pháp điều khiển robot tự hành theo quỹ đạo định trước', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT076     ', N'Tổng hợp bộ điều khiển robot song song Hexapod', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT077     ', N'Nghiên cứu, phát triển hệ thống robot giám sát an', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT078     ', N'Nghiên cứu thiết kế, chế tạo mẫu robot di động sử dụng các thuật toán tự động định vị và di chuyển theo kế hoạch', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT079     ', N'Nghiên cứu phát triển thuật toán điều khiển robot tự hành dựa trên phản hồi âm thanh', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT080     ', N'Phát triển hệ thống điều khiển cho xe tự hành 3 bánh cấu trúc (1,1)', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT081     ', N'Nghiên cứu, thiết kế chế tạo mẫu Robot chiến đấu sử dụng mô hình súng tiểu liên AK-47', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT083     ', N'Nghiên cứu quỹ đạo chuyển động của ngư lôi với các góc phóng ban đầu khác nhau', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT084     ', N'Nghiên cứu và mô phỏng hoạt động của hệ thống giải tính trên xe bệ phóng tổ hợp tên lửa РУБЭЖ', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT085     ', N'Nghiên cứu xây dựng thiết bị đồng bộ cự ly đài điều khiển tên lửa C125-2TM trên cơ sở công nghệ vi xử lý', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 100, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT086     ', N'Thiết kế thiết bị kiểm tra đánh giá chất lượng và hỗ trợ sửa chữa máy phát điện trên tàu Hải quân', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT087     ', N'Nghiên cứu thiết kế hệ thống điều khiển và giám sát đèn hàng hải trên tàu Hải quân', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT088     ', N'Nghiên cứu sức chịu tải của nền đất có xét tới hệ số áp lực ngang', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT089     ', N'Nghiên cứu tổng hợp axit Cyanuric và dẫn xuất từ ure', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT091     ', N'Nghiên cứu tổng hợp và ứng dụng một số chất ức chế bay hơi hiệu năng cao trên cơ sở các muối của dẫn xuất cyclohexyl amine và các axit hữu cơ trong bảo vệ, ức chế ăn mòn kim loại', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT092     ', N'Nghiên cứu tổng hợp một số dẫn xuất của Indole, ứng dụng trong công nghệ dược phẩm', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT093     ', N'Nghiên cứu ảnh hưởng của copolymer nhiệt dẻo lên tính chất cơ lý của nhựa epoxy DER331', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT094     ', N'Nghiên cứu tổng hợp vật liệu Mxene/ferrite (Ni, Co) composite ứng dụng trong hấp thụ sóng radar', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT095     ', N'Tổng hợp vật liệu hỗn hợp oxit trên cơ sở Cu, Co và Fe ứng dụng làm xúc tác hoạt hóa phân hủy chất ô nhiễm hữu cơ trong nước', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT096     ', N'Tổng hợp vật liệu compozit oxit Fe,Cu/N/C trên nền cacbon felt (CF) ứng dụng làm catot cho Fenton điện hóa để phân hủy chất ô nhiễm hữu cơ trong nước', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT097     ', N'Tổng hợp vật liệu lai Bi2MoO6/Bi-BTC ứng dụng làm xúc tác quang phân hủy chất ô nhiễm hữu cơ trong nước', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT098     ', N'Nghiên cứu biến tính Hydrotalcite sử dụng làm vật liệu xúc tác cho phản ứng oxi hóa các hợp chất hữu cơ', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT099     ', N'Nghiên cứu tổng hợp Thiobenzamide sử dụng lưu huỳnh nguyên tố', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT100     ', N'Nghiên cứu ảnh hưởng của chiếu sáng đến đặc trưng nhạy khí của các vật liệu ZnO và NiO có cấu trúc nano', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT101     ', N'Nghiên cứu xây dựng hệ thống tấn công tự động ứng dụng trí tuệ nhân tạo', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT102     ', N'Nghiên cứu xây dựng hệ thống hỗ trợ đọc sách cho người khiếm thị sử dụng trí tuệ nhân tạo', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT103     ', N'Xây dựng chương trình phát hiện bất thường cho bộ dữ liệu chuỗi thời gian ứng dụng trong an ninh mạng máy tính', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT104     ', N'Nghiên cứu và xây dựng hệ thống cảnh báo truy cập các nguồn tài nguyên độc hại', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT105     ', N'Nghiên cứu phát triển thiết bị mã hoá đường truyền cho camera IP trên nền tảng máy tính nhúng hiệu năng cao', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT106     ', N'Nghiên cứu, xây dựng hệ thống kiểm thử và khai thác lỗ hổng bảo mật IoT', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT107     ', N'Nghiên cứu xây dựng hệ thống phát hiện mã độc trong luồng dữ liệu mã hoá', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT108     ', N'Quản lý chữ ký số phi tập trung sử dụng công nghệ blockchain', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT109     ', N'Nghiên cứu, phát triển hệ thống giám sát và cảnh báo tấn công mạng thời gian thực dựa trên công nghệ AI', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT120     ', N'Nghiên cứu và ứng dụng các giao thức trao đổi khoá ứng dụng trong chat an toàn', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT121     ', N'Xây dựng hệ thống số hóa tài liệu', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT122     ', N'Phát hiện mục tiêu trên ảnh vệ tính', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT123     ', N'B?o v? mô hình h?c máy và tính riêng tu ngu?i dùng s? d?ng mã hoá d?ng c?u', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT124     ', N'Nghiên cứu, xây dựng hệ thống tự động sinh dữ liệu tấn công phục vụ kiểm thử thiết bị mạng', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT125     ', N'Nghiên cứu xây dựng hệ thống phát hiện các hình thức tấn công nâng cao', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT126     ', N'Nghiên cứu, xây dựng công cụ trích xuất văn bản từ ảnh camera điện thoại', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT127     ', N'Nghiên cứu, xây dựng hệ thống hỗ trợ tư vấn luật trực tuyến', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
GO
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT128     ', N'Xây dựng công cụ hỗ trợ giám sát hành vi độc hại trên máy tính', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT129     ', N'Nhận dạng các hành vi bất thường trong camera giám sát', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT130     ', N'Nghiên cứu kỹ thuật phát hiện gian lận giấy tờ', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT131     ', N'Nghiên cứu kỹ thuật học phân tán ứng dụng cho phát hiện bất thường mạng IoT', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT132     ', N'Phát hiện đối tượng vi phạm từ hệ thống camera giám sát dựa trên công nghệ nhận diện khuôn mặt', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT133     ', N'Xây dựng hệ thống nhận diện khách hàng từ camera giám sát', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT134     ', N'Nghiên cứu thuật toán phát hiện đối tượng và ứng dụng hàng rào ảo', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT135     ', N'Nghiên cứu phương pháp nhận dạng người nói và tách câu sử dụng phương pháp phân tích đặc trưng giọng nói miền tần số', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT136     ', N'Nghiên cứu và xây dựng hệ thống giám sát mạng và phát hiện mã độc phân tán', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT137     ', N'Nghiên cứu và ứng dụng công nghệ AI trong xây dựng hệ thống phát hiện mã độc IoT phân tán', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT138     ', N'Nghiên cứu và xây dựng hệ thống tự động pha loãng thông tin trên mạng xã hội', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT139     ', N'Nghiên cứu mô phỏng diễn biến quá trình hỏa lực cấp trên bắn phá chuẩn bị, phục vụ giảng dạy nội dung “Trung đội bộ binh mở cửa đánh chiếm đầu cầu”', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT140     ', N'Nghiên cứu và triển khai một số thuật toán học máy trên SQL Server', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT141     ', N'Nghiên cứu và xây dựng hệ thống giám sát người ra, vào đơn vị sử dụng nhận dạng dáng đi', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT142     ', N'Nghiên cứu giải pháp nhận dạng kết hợp khuôn mặt và hình dáng trong quản lý hành vi của lái xe', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT143     ', N'Tối ưu hóa mô hình trung tâm điều phối hàng hóa và ứng dụng trong Logistics', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT144     ', N'Nghiên cứu và xây dựng hệ thống hỏi đáp tự động', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT145     ', N'Xây dựng hệ thống tự động phát hiện đối tượng quan tâm xuất hiện trong video dựa trên phát hiện khuôn mặt', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT146     ', N'Xây dựng USB an toàn thu thập dữ liệu chứng cứ phục vụ điều tra số', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT147     ', N'Nghiên cứu các mô hình chuyển văn bản thành giọng nói (Text to Speed) cho tiếng Việt', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT148     ', N'Nghiên cứu và xây dựng hệ thống mô phỏng mạng - hỗ trợ thực hành các bài thí nghiệm bảo mật mạng', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT149     ', N'Nghiên cứu nhiệt luyện T616 nhằm cải thiện tổ chức và cơ tính của hợp kim nhôm Al-ZN-Mg-Cu', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT150     ', N'Nghiên cứu thử nghiệm một số đặc tính công nghệ của hệ vật liệu cát - nhựa trong sản xuất khuôn đúc', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT151     ', N'Nghiên cứu tổ chức và tính chất của phôi tấm hợp kim permendur 49K2ΦA làm roto và lõi cuộn dây của máy phát tuabin', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT152     ', N'Nghiên cứu ảnh hưởng của nhiệt luyện đến tổ chức và cơ tính của thép ШX15', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT153     ', N'Phân tích tĩnh hệ giàn phẳng và không gian bằng phương pháp phần tử hữu hạn', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT154     ', N'Nghiên cứu tổng hợp vật liệu nanocomposite chứa MoS2 ứng dụng trong hấp thụ sóng radar', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT155     ', N'Ứng dụng phần mềm Procast mô phỏng quá trình đúc mẫu chảy', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT156     ', N'Nghiên cứu ứng dụng thị giác máy (Machine Vission) đo kích thước đồng tử trong điều kiện ánh sáng nhân tạo', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT157     ', N'Thiết kế thiết bị bắn đạn tập cho pháo DKZ', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT158     ', N'Nghiên cứu, thiết kế súng bộ binh sử dụng nhiều loại nòng (súng bộ binh đa năng)', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT159     ', N'Nghiên cứu tính toán một số kích thước của nòng pháo 2 lớp', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT160     ', N'Nghiên cứu ảnh hưởng của dòng chảy rối tới hoạt động máy hãm lùi', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT161     ', N'Nghiên cứu thiết kế vũ khí không luồng phụt', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT162     ', N'Thiết kế mo đun vũ khí tự động bảo vệ mục tiêu', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT163     ', N'Nghiên cứu thiết kế súng – dao kết hợp', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT164     ', N'Nghiên cứu phương án tích hợp một số phụ kiện lên súng tiểu liên 7,62mm AK', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT165     ', N'Nghiên cứu phương án thiết kế súng ngắn hoạt động theo nguyên lý khóa nòng tự do giữ chậm bằng năng lượng khí thuốc', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT166     ', N'Ứng dụng trí tuệ nhân tạo để nhận dạng mục tiêu và tính toán phần tử bắn đón cho pháo phòng không', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT167     ', N'Nghiên cứu thiết kế thiết bị điều khiển hỏa lực cho súng cối 100 mm đặt trên mặt đất bắn mục tiêu cố định', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), 0, 100, N'Đã hoàn thành', N'2021-2022')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT168     ', N'Ứng dụng bộ camera nội soi để dò tìm khuyết tật cho nòng súng pháo', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT169     ', N'Nghiên cứu, thiết kế chế thử mô hình pháo điện tử Railgun', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT170     ', N'Nghiên cứu hoàn thiện thiết kế TBHL dùng cho cối 120mm, nạp đạn tự động khi lắp trên xe', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT171     ', N'Đánh giá sai số hệ thống điều khiển hỏa lực của súng12,7 mm', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT172     ', N'Nghiên cứu thiết kế súng 12.7 bắn đạn bông, bắn liên thanh', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT173     ', N'Nghiên cứu thiết kế súng - đạn chống Flycam', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT174     ', N'Nâng cao chất lượng ảnh của hệ thống quang học mã hóa mặt sóng bằng kỹ thuật học sâu', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT175     ', N'Nghiên cứu thiết kế mạch nguyên lý cho ngòi lựu đạn chạm nổ', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT176     ', N'Nghiên cứu ảnh hưởng của các loại bao gói tới chất lượng đạn dược trong điều kiện sương mù muối', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT177     ', N'Nghiên cứu mô phỏng nổ trong môi trường nước', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT178     ', N'Nghiên cứu xác định quá tải va chạm của lựu đạn vào các mục tiêu khác nhau', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT179     ', N'Quản lý Mạng', CAST(N'2022-07-07' AS Date), CAST(N'2023-07-07' AS Date), NULL, NULL, N'Chờ thực hiện', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT180     ', N'Quản lý Học viên', CAST(N'2022-07-07' AS Date), CAST(N'2023-07-07' AS Date), NULL, NULL, N'Đã phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT181     ', N'QUản lý lớp', CAST(N'2022-06-06' AS Date), CAST(N'2023-06-06' AS Date), NULL, NULL, N'Chờ phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT182     ', N'Thiết kế mạng', CAST(N'2022-05-05' AS Date), CAST(N'2023-05-05' AS Date), NULL, NULL, N'Chờ thực hiện', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT183     ', N'quản lý giấy', CAST(N'2022-02-02' AS Date), CAST(N'2023-02-02' AS Date), NULL, NULL, N'Đã phê duyệt', N'2022-2023')
INSERT [dbo].[DeTai] ([MaDT], [TenDT], [NgayBD], [NgayNT], [KinhPhi], [TienDo], [TrangThai], [NamHoc]) VALUES (N'DT184     ', N'aa', CAST(N'2022-01-01' AS Date), CAST(N'2023-01-01' AS Date), NULL, NULL, N'Đã phê duyệt', N'2022-2023')
GO
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV001     ', N'Hoàng Hải Anh', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV002     ', N'Trương Thị Quỳnh', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV003     ', N'Hoàng Lan Anh', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV004     ', N'Phạm Hải Anh', N'Thượng tá', N'Chủ nhiệm bộ môn', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV005     ', N'Phạm Văn Anh', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV006     ', N'Lê Thị Khánh Thuần', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM06      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV007     ', N'Lê Văn Đạt', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM07      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV008     ', N'Đoàn Dự', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV009     ', N'Lý Thường Kiệt', N'Thượng tá', N'Chủ nhiệm bộ môn', N'BM09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV010     ', N'Mai Thủy Ngân', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM10      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV011     ', N'Lý Bích Thủy', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM11      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV012     ', N'Phạm Ngũ Lão', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM12      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV013     ', N'Lý Chiêu Hoàng', N'Thượng tá', N'Chủ nhiệm bộ môn', N'BM13      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV014     ', N'Ngô Quyền', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM14      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV015     ', N'Lê Đại Hành', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM15      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV016     ', N'Triệu Thị Trinh', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM16      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV017     ', N'Phùng Ly Ly', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM17      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV018     ', N'Hoàng Đình Khánh', N'Trung tá', N'Chủ nhiệm bộ môn', N'BM18      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV019     ', N'Hồ Sỹ Thơm', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM19      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV020     ', N'Nguyễn Công Mạnh', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM20      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV021     ', N'Nguyễn Văn Chung', N'Thiếu tá', N'Chủ nhiệm bộ môn', N'BM21      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV022     ', N'Lệnh Hồ Xung', N'Thượng tá', N'Chủ nhiệm bộ môn', N'BM22      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV023     ', N'Trần Văn Thần', N'Thiếu tá', N'Giáo viên', N'BM01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV025     ', N'Ðoàn Ðình Toàn', N'Thiếu tá', N'Chủ nhiệm khoa', N'BM08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV026     ', N'Ðoàn Ðình Tú', N'Trung tá', N'Giáo viên', N'BM10      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV027     ', N'Khổng Phương Thảo', N'Trung tá', N'Chủ nhiệm khoa', N'BM01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV028     ', N'Phạm Thị Xuân', N'Trung tá', N'Chủ nhiệm khoa', N'BM11      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV029     ', N'Nghiêm Quang Huy', N'Thượng tá', N'Chủ nhiệm khoa', N'BM12      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV030     ', N'Trần Bảo Trung', N'Thiếu tá', N'Chủ nhiệm khoa', N'BM17      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV031     ', N'Ðõ Quang Hùng1', N'Thựơng tá', N'Chủ nhiệm khoa', N'BM19      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV032     ', N'Nguyễn Quang Sang', N'Trung tá', N'Chủ nhiệm khoa', N'BM21      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV033     ', N'Vu Hoài Anh', N'Trung tá', N'Giáo viên', N'BM01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV034     ', N'Hoàng Linh Phương', N'Trung tá', N'Giáo viên', N'BM02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV035     ', N'Duong Thị Anh', N'Thiếu tá', N'Giáo viên', N'BM02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV036     ', N'Nguyễn Hồng Sơn', N'Trung tá', N'Giáo viên', N'BM02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV037     ', N'Nguyễn Khánh Vân', N'Thượng tá', N'Giáo viên', N'BM02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV038     ', N'Huấn Hoa Hồng', N'Ðại tá', N'Giáo viên', N'BM01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV039     ', N'Lê Văn Phú', N'Thiếu tá', N'Giáo viên', N'BM02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV040     ', N'Trần Văn Tùng 23', N'thiếu tá', N'Giáo viên', N'BM01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV041     ', N'Đàm Đình Chiến', N'Trung tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV042     ', N'Đào Tùng Linh', N'Thượng tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV043     ', N'Dương Quá', N'Thiếu tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV044     ', N'Hoắc Đô', N'Đại úy', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV045     ', N'Tào Tháo', N'Trung tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV046     ', N'Vạn Phương Nam', N'Trung tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV047     ', N'Nhiếp Phong', N'Trung úy', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV048     ', N'Vô Danh', N'Thiếu tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV049     ', N'Chu Chỉ Nhược', N'Thiếu tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV050     ', N'Triệu Mẫn', N'Thượng úy', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV051     ', N'Tiểu Long Nữ', N'Trung úy', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV052     ', N'Triệu Chí Kính', N'Trung tá', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV053     ', N'Mai Sư Phong', N'Thượng tá', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV054     ', N'Ngô Thị Minh Thư', N'Thiếu tá', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV055     ', N'Hư Trúc', N'Đại úy', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV056     ', N'Tiêu Phong', N'Trung tá', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV057     ', N'Hoàng Lão Tà', N'Trung tá', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV058     ', N'Lee Min Ho', N'Trung úy', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV061     ', N'Triệu Lệ Dĩnh', N'Thượng úy', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV062     ', N'Địch Lệ Nhiệt Ba', N'Trung úy', N'Giáo viên', N'BM04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV063     ', N'Trần Tuấn Tú', N'Trung úy', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV064     ', N'Trần Mạnh Dũng', N'Trung úy', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV065     ', N'Lê Văn Lợi', N'Thượng Tá', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV066     ', N'Nguyễn Xuân Quỳnh', N'Thượng úy', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV067     ', N'Trần Thị Minh', N'Thượng úy', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV068     ', N'Trần Thị Tú', N'Thượng úy', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV069     ', N'nguyễn Lương Bằng', N'Thiếu tá', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV070     ', N'Lê Văn Luyện', N'Thượng úy', N'Giáo viên', N'BM05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV071     ', N'Nông Văn Nghiệp', N'Thượng úy', N'Giáo viên', N'BM06      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV072     ', N'Trần Thị Mẫn', N'Trung tá', N'Giáo viên', N'BM06      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV073     ', N'Trần C', N'Trung tá', N'Giáo viên', N'BM01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV074     ', N'Đào Mạnh Dương', N'Trung tá', N'Giáo viên', N'BM03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV075     ', N'Hoàng Như Nghĩa', N'Trung tá', N'Giáo viên', N'BM09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV076     ', N'Nguyễn Hải Nam', N'Đại úy', N'Giáo viên', N'BM08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV077     ', N'Trịnh Hoài Nam', N'Thiếu tá', N'Giáo viên', N'BM09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV078     ', N'Trương Minh Tú', N'Trung úy', N'Giáo viên', N'BM09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV079     ', N'Nguyễn Linh Chi', N'Thượng úy', N'Giáo viên', N'BM09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV080     ', N'Nguyễn Nhật Linh', N'Đại úy', N'Giáo viên', N'BM08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV081     ', N'Khổng Nhật Nam', N'Thiếu tá', N'Giáo viên', N'BM09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV082     ', N'Hà Minh Anh', N'Đại úy', N'Giáo viên', N'BM08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV083     ', N'Nguyễn Mạnh Hà', N'Trung tá', N'Giáo viên', N'BM07      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV084     ', N'Huỳnh Thúc Kháng', N'Đại úy', N'Giáo viên', N'BM07      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV085     ', N'Mạnh Thanh Nhàn', N'Đại úy', N'Giáo viên', N'BM08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV086     ', N'Nguyễn Lâm Thương', N'Thượng úy', N'Giáo viên', N'BM07      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV087     ', N'Nguyễn Minh Tâm', N'Trung úy', N'Giáo viên', N'BM13      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV088     ', N'Nguyễn Bảo An', N'Thiếu tá', N'Giáo viên', N'BM07      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV089     ', N'Huỳnh Minh Mạng', N'Thiếu tá', N'Giáo viên', N'BM13      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV090     ', N'Nguyễn Như Quỳnh', N'Trung tá', N'Giáo viên', N'BM07      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [CapBac], [ChucVu], [MaBM]) VALUES (N'GV091     ', N'Hoàng Hùng', N'Đại úy', N'Giáo viên', N'BM01      ')
GO
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK001     ', N'Đăng Ký Thực Hiện Đề tài', CAST(N'2021-04-05' AS Date), N'DT001     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK002     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT008     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK003     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT009     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK004     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT014     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK005     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT015     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK006     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT016     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK007     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT022     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK008     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT024     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK009     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT028     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK010     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT033     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK011     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT076     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK012     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT077     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK013     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT078     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK014     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT079     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK015     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT080     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK016     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT081     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK017     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT083     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK018     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT084     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK019     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT085     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK020     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT086     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK021     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT087     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK022     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT088     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK023     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT089     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK024     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT091     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK025     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT092     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK026     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT093     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK027     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT094     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK028     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT125     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK029     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT126     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK030     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT127     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK031     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT128     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK032     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT129     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK033     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT130     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK034     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT131     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK035     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT132     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK036     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT161     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK037     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT162     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK038     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT163     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK039     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT164     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK040     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT165     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK041     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT166     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK042     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2021-04-05' AS Date), N'DT167     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK043     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT034     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK044     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT035     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK045     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT036     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK046     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT010     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK047     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT012     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK048     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT018     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK049     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT025     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK050     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT027     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK051     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT029     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK052     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT030     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK053     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT031     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK054     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT037     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK055     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT038     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK056     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT039     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK057     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT040     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK058     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT041     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK059     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT042     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK060     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT043     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK061     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT044     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK062     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT045     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK063     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT046     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK064     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT047     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK065     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT048     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK066     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT049     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK067     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT050     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK068     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT051     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK069     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT052     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK070     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT053     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK071     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT054     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK072     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT055     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK073     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT056     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK074     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT057     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK075     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT058     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK076     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT059     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK077     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT060     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK078     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT061     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK079     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT062     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK080     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT063     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK081     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT064     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK082     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT065     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK083     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT066     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK084     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT067     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK085     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT068     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK086     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT069     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK087     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT070     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK088     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT071     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK089     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT072     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK090     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT073     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK091     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT074     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK092     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT075     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK093     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT095     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK094     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT096     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK095     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT097     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK096     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT098     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK097     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT099     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK098     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT100     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK099     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT101     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK100     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT102     ', N'P01       ')
GO
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK101     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT103     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK102     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT104     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK103     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT105     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK104     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT106     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK105     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT107     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK106     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT108     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK107     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT109     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK108     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT120     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK109     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT121     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK110     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT122     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK111     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT123     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK112     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT124     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK113     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT133     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK114     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT134     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK115     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT135     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK116     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT136     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK117     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT137     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK118     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT138     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK119     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT139     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK120     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT140     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK121     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT141     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK122     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT142     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK123     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT143     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK124     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT144     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK125     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT145     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK126     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT146     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK127     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT147     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK128     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT148     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK129     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT149     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK130     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT150     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK131     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT151     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK132     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT152     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK133     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT153     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK134     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT154     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK135     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT155     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK136     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT156     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK137     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT157     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK138     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT158     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK139     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT159     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK140     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT160     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK141     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT168     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK142     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT169     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK143     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT170     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK144     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT171     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK145     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT172     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK146     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT173     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK147     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT174     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK148     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT175     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK149     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT176     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK150     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT177     ', N'P01       ')
INSERT [dbo].[GiayDKDT] ([MaGDK], [NoiDung], [NgayDK], [MaDT], [MaP]) VALUES (N'DK151     ', N'Đăng Ký Thực Hiện Đề Tài', CAST(N'2022-04-05' AS Date), N'DT178     ', N'P01       ')
GO
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00001   ', N'Nguyễn Thị Lan', N'Trung sĩ', CAST(N'2001-05-27' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00002   ', N'Đặng Tuấn Anh', N'Trung sĩ', CAST(N'2001-10-24' AS Date), N'Nam', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00003   ', N'Hoàng Đức Anh', N'Trung sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00004   ', N'Lưu Trang Anh', N'Trung sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00005   ', N'Nguyễn Thị Lan', N'Trung sĩ', CAST(N'2001-10-24' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00006   ', N'Phạm Hoàng Anh', N'Trung sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00007   ', N'Phạm Thị Hiền Anh', N'Trung sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00008   ', N'Phạm Khắc Việt Anh', N'Trung sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00009   ', N'Đỗ Hoàng Gia Bảo', N'Trung sĩ', CAST(N'2001-10-21' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00010   ', N'Trần Thị Minh Châu', N'Trung sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00011   ', N'Tăng Phương Chi', N'Trung sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00012   ', N'Phạm Tiến Dũng', N'Trung sĩ', CAST(N'2001-10-21' AS Date), N'Nam', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00013   ', N'Nguyễn Thái Dương', N'Trung sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00014   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2001-10-19' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00015   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2001-12-27' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00016   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2001-10-02' AS Date), N'Nữ', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00017   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2001-04-27' AS Date), N'Nam', N'C002      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00018   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00019   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2000-10-24' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00020   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00021   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00022   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2000-10-24' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00023   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00024   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2000-03-27' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00025   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00026   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2000-01-21' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00027   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00028   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2000-10-13' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00029   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2000-10-21' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00030   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00031   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2000-10-19' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00032   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2000-12-27' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00033   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2000-10-02' AS Date), N'Nữ', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00034   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2000-04-27' AS Date), N'Nam', N'C001      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00035   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00036   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nam', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00037   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00038   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00039   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00040   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00041   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2002-03-27' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00042   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00043   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2002-01-21' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00044   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00045   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2002-10-13' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00046   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2002-10-21' AS Date), N'Nam', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00047   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00048   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2002-10-19' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00049   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2002-12-27' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00050   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2002-10-02' AS Date), N'Nữ', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00051   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2002-04-27' AS Date), N'Nam', N'C003      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00052   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00053   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nam', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00054   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00055   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00056   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00057   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00058   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2003-03-27' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00059   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00060   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2003-01-21' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00061   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00062   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2003-10-13' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00063   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2003-10-21' AS Date), N'Nam', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00064   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00065   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2003-10-19' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00066   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2003-12-27' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00067   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2003-10-02' AS Date), N'Nữ', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00068   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2003-04-27' AS Date), N'Nam', N'C004      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00069   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00070   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2000-10-24' AS Date), N'Nam', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00071   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00072   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00073   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2000-10-24' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00074   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00075   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2000-03-27' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00076   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00077   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2000-01-21' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00078   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00079   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2000-10-13' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00080   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2000-10-21' AS Date), N'Nam', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00081   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00082   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2000-10-19' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00083   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2000-12-27' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00084   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2000-10-02' AS Date), N'Nữ', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00085   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2000-04-27' AS Date), N'Nam', N'C005      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00086   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00087   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2001-10-24' AS Date), N'Nam', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00088   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00089   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00090   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2001-10-24' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00091   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00092   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2001-03-27' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00093   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00094   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2001-01-21' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00095   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00096   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2001-10-13' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00097   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2001-10-21' AS Date), N'Nam', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00098   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00099   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2001-10-19' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00100   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2001-12-27' AS Date), N'Nữ', N'C006      ')
GO
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00101   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2001-10-02' AS Date), N'Nữ', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00102   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2001-04-27' AS Date), N'Nam', N'C006      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00103   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00104   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nam', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00105   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00106   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00107   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00108   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00109   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2002-03-27' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00110   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00111   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2002-01-21' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00112   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00113   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2002-10-13' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00114   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2002-10-21' AS Date), N'Nam', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00115   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00116   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2002-10-19' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00117   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2002-12-27' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00118   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2002-10-02' AS Date), N'Nữ', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00119   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2002-04-27' AS Date), N'Nam', N'C007      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00120   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00121   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nam', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00122   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00123   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00124   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00125   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00126   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2003-03-27' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00127   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00128   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2003-01-21' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00129   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00130   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2003-10-13' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00131   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2003-10-21' AS Date), N'Nam', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00132   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00133   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2003-10-19' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00134   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2003-12-27' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00135   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2003-10-02' AS Date), N'Nữ', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00136   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2003-04-27' AS Date), N'Nam', N'C008      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00137   ', N'Nguyễn Thị Lan', N'Trung sĩ', CAST(N'2000-05-27' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00138   ', N'Đặng Tuấn Anh', N'Trung sĩ', CAST(N'2000-10-24' AS Date), N'Nam', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00139   ', N'Hoàng Đức Anh', N'Trung sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00140   ', N'Lưu Trang Anh', N'Trung sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00141   ', N'Nguyễn Thị Lan', N'Trung sĩ', CAST(N'2000-10-24' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00142   ', N'Phạm Hoàng Anh', N'Trung sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00143   ', N'Phạm Thị Hiền Anh', N'Trung sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00144   ', N'Phạm Khắc Việt Anh', N'Trung sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00145   ', N'Đỗ Hoàng Gia Bảo', N'Trung sĩ', CAST(N'2000-10-21' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00146   ', N'Trần Thị Minh Châu', N'Trung sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00147   ', N'Tăng Phương Chi', N'Trung sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00148   ', N'Phạm Tiến Dũng', N'Trung sĩ', CAST(N'2000-10-21' AS Date), N'Nam', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00149   ', N'Nguyễn Thái Dương', N'Trung sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00150   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2000-10-19' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00151   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2000-12-27' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00152   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2000-10-02' AS Date), N'Nữ', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00153   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2000-04-27' AS Date), N'Nam', N'C009      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00154   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00155   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2001-10-24' AS Date), N'Nam', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00156   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00157   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00158   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2001-10-24' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00159   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00160   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2001-03-27' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00161   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00162   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2001-01-21' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00163   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00164   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2001-10-13' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00165   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2001-10-21' AS Date), N'Nam', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00166   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00167   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2001-10-19' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00168   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2001-12-27' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00169   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2001-10-02' AS Date), N'Nữ', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00170   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2001-04-27' AS Date), N'Nam', N'C010      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00171   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00172   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nam', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00173   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00174   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00175   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00176   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00177   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2002-03-27' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00178   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00179   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2002-01-21' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00180   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00181   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2002-10-13' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00182   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2002-10-21' AS Date), N'Nam', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00183   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00184   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2002-10-19' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00185   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2002-12-27' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00186   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2002-10-02' AS Date), N'Nữ', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00187   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2002-04-27' AS Date), N'Nam', N'C011      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00188   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00189   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nam', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00190   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00191   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00192   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00193   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00194   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2003-03-27' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00195   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00196   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2003-01-21' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00197   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00198   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2003-10-13' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00199   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2003-10-21' AS Date), N'Nam', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00200   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C012      ')
GO
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00201   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2003-10-19' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00202   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2003-12-27' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00203   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2003-10-02' AS Date), N'Nữ', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00204   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2003-04-27' AS Date), N'Nam', N'C012      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00205   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00206   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2000-10-24' AS Date), N'Nam', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00207   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00208   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2000-05-27' AS Date), N'Nam', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00209   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2000-10-24' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00210   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00211   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2000-03-27' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00212   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00213   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2000-01-21' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00214   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00215   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2000-10-13' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00216   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2000-10-21' AS Date), N'Nam', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00217   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2000-10-27' AS Date), N'Nam', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00218   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2000-10-19' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00219   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2000-12-27' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00220   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2000-10-02' AS Date), N'Nữ', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00221   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2000-04-27' AS Date), N'Nam', N'C013      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00222   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00223   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2001-10-24' AS Date), N'Nam', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00224   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00225   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2001-05-27' AS Date), N'Nam', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00226   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2001-10-24' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00227   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00228   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2001-03-27' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00229   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00230   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2001-01-21' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00231   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00232   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2001-10-13' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00233   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2001-10-21' AS Date), N'Nam', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00234   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2001-10-27' AS Date), N'Nam', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00235   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2001-10-19' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00236   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2001-12-27' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00237   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2001-10-02' AS Date), N'Nữ', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00238   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2001-04-27' AS Date), N'Nam', N'C014      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00239   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00240   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nam', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00241   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00242   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2002-05-27' AS Date), N'Nam', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00243   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2002-10-24' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00244   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00245   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2002-03-27' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00246   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00247   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2002-01-21' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00248   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00249   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2002-10-13' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00250   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2002-10-21' AS Date), N'Nam', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00251   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2002-10-27' AS Date), N'Nam', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00252   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2002-10-19' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00253   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2002-12-27' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00254   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2002-10-02' AS Date), N'Nữ', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00255   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2002-04-27' AS Date), N'Nam', N'C015      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00256   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00257   ', N'Đặng Tuấn Anh', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nam', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00258   ', N'Hoàng Đức Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00259   ', N'Lưu Trang Anh', N'Thượng sĩ', CAST(N'2003-05-27' AS Date), N'Nam', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00260   ', N'Nguyễn Thị Lan', N'Thượng sĩ', CAST(N'2003-10-24' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00261   ', N'Phạm Hoàng Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00262   ', N'Phạm Thị Hiền Anh', N'Thượng sĩ', CAST(N'2003-03-27' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00263   ', N'Phạm Khắc Việt Anh', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00264   ', N'Đỗ Hoàng Gia Bảo', N'Thượng sĩ', CAST(N'2003-01-21' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00265   ', N'Trần Thị Minh Châu', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00266   ', N'Tăng Phương Chi', N'Thượng sĩ', CAST(N'2003-10-13' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00267   ', N'Phạm Tiến Dũng', N'Thượng sĩ', CAST(N'2003-10-21' AS Date), N'Nam', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00268   ', N'Nguyễn Thái Dương', N'Thượng sĩ', CAST(N'2003-10-27' AS Date), N'Nam', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00269   ', N'Mạc Trung Đức', N'Trung sĩ', CAST(N'2003-10-19' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00270   ', N'Vũ Hương Giang', N'Trung sĩ', CAST(N'2003-12-27' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00271   ', N'Nguyễn Thị Ngân', N'Trung sĩ', CAST(N'2003-10-02' AS Date), N'Nữ', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV00272   ', N'Nguyễn Lê Hiếu', N'Trung sĩ', CAST(N'2003-04-27' AS Date), N'Nam', N'C016      ')
INSERT [dbo].[HocVien] ([MaHV], [TenHV], [CapBac], [NamSinh], [GioiTinh], [MaDD]) VALUES (N'HV273     ', N'hùng', N'hạ sỹ', CAST(N'2000-02-02' AS Date), N'nam', N'C001      ')
GO
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD001     ', N'2019-2020 ', N'Đã phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD002     ', N'2019-2020 ', N'Phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD003     ', N'2019-2020 ', N'Đã phê duyệt', N'K03       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD004     ', N'2019-2020 ', N'Đã phê duyệt', N'K04       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD005     ', N'2019-2020 ', N'Đã phê duyệt', N'K05       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD006     ', N'2019-2020 ', N'Đã phê duyệt', N'K06       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD007     ', N'2020-2021 ', N'Đã phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD008     ', N'2020-2021 ', N'Phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD009     ', N'2021-2022 ', N'Phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD010     ', N'2020-2021 ', N'Phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD011     ', N'2020-2021 ', N'Chờ phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD012     ', N'2020-2021 ', N'Chờ phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD013     ', N'2020-2021 ', N'Chờ phê duyệt', N'K02       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD014     ', N'2021-2022 ', N'Chờ phê duyệt', N'K02       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD015     ', N'2021-2022 ', N'Chờ phê duyệt', N'K02       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD016     ', N'2019-2020 ', N'Đã phê duyệt', N'K02       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD017     ', N'2021-2022 ', N'Đã phê duyệt', N'K03       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD018     ', N'2021-2022 ', N'Đã phê duyệt', N'K03       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD019     ', N'2021-2022 ', N'Đã phê duyệt', N'K03       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD020     ', N'2021-2022 ', N'Đã phê duyệt', N'K04       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD021     ', N'2021-2022 ', N'Đã phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD022     ', N'2022-2023 ', N'Chờ phê duyệt', N'K01       ')
INSERT [dbo].[HoiDongNT] ([MaHD], [NamHoc], [TrangThai], [MaK]) VALUES (N'HD023     ', N'2022-2023 ', N'Chờ phê duyệt', N'K01       ')
GO
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT001     ', N'9.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT008     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT009     ', N'8.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT014     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT015     ', N'7.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT016     ', N'8.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT076     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD001     ', N'DT078     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT024     ', N'7.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT033     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT077     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT079     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT081     ', N'7.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT083     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT126     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT128     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT161     ', N'8.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT163     ', N'8.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD002     ', N'DT166     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD003     ', N'DT091     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD004     ', N'DT008     ', N'8.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD004     ', N'DT015     ', N'7.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD004     ', N'DT080     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD004     ', N'DT087     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD004     ', N'DT089     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT001     ', N'9.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT076     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT094     ', N'8.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT125     ', N'9.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT126     ', N'8.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT127     ', N'7.5')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT128     ', N'7.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT129     ', N'6.0')
INSERT [dbo].[KetQuaNT] ([MaHD], [MaDT], [KetQua]) VALUES (N'HD016     ', N'DT131     ', N'8.5')
GO
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT001     ', N'Giấy Khen Đề Tài Mức 1', N'HV', N'DT001     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT002     ', N'Bằng Khen Đề Tài Mức 2', N'HV', N'DT008     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT003     ', N'Giấy Khen Đề Tài Mức 1', N'HV', N'DT009     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT004     ', N'Bằng Khen Đề Tài Mức 2', N'HV', N'DT014     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT005     ', N'Bằng Khen Đề Tài Mức 3', N'BQP', N'DT022     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT006     ', N'Bằng Khen Đề Tài Mức 4', N'NN', N'DT024     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT007     ', N'Bằng Khen Đề Tài Mức 3', N'BQP', N'DT028     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT008     ', N'Giấy Khen Đề Tài Mức 1', N'HV', N'DT033     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT009     ', N'Giấy Khen Đề Tài Mức 1', N'HV', N'DT076     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT010     ', N'Bằng Khen Đề Tài Mức 2', N'HV', N'DT077     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT011     ', N'Bằng Khen Đề Tài Cấp 3', N'BQP', N'DT078     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT012     ', N'Bằng Khen Đề Tài Mức 3', N'BQP', N'DT079     ', N'P01       ')
INSERT [dbo].[KhenThuong] ([MaKT], [NoiDung], [CapDo], [MaDT], [MaP]) VALUES (N'KT013     ', N'Giấy Khen Đề Tài Mức 1', N'HV        ', N'DT077     ', N'P01       ')
GO
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K01       ', N'Công nghệ thông tin', N'0961655573     ', N'CBP001    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K02       ', N'Kỹ thuật công trình đặc biệt', N'0961655573     ', N'CBP001    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K03       ', N'Tích hợp hệ thống', N'0961655573     ', N'CBP002    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K04       ', N'Hoá lỹ kỹ thuật', N'0961655573     ', N'CBP002    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K05       ', N'Cơ khí', N'0961655573     ', N'CBP003    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K06       ', N'Vũ khí', N'0961655573     ', N'CBP003    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K07       ', N'Vô tuyến điện tử', N'0961655573     ', N'CBP004    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K08       ', N'Quân sự chung', N'0961655573     ', N'CBP004    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K09       ', N'Mác-Lenin, tư tưởng Hồ Chí Minh', N'0961655573     ', N'CBP005    ')
INSERT [dbo].[Khoa] ([MaK], [TenK], [SDT], [MaCBP]) VALUES (N'K10       ', N'Ngoại ngữ', N'0961655573     ', N'CBP005    ')
GO
INSERT [dbo].[phongKHQS] ([MaP], [DiaDiem], [SDT]) VALUES (N'P01       ', N'T6,S4', N'0345634256     ')
GO
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL001   ', N'Thành lập', N'HD001     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL002   ', N'Thành lập', N'HD002     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL003   ', N'Thành lập', N'HD003     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL004   ', N'Thành lập', N'HD004     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL005   ', N'Thành lập', N'HD005     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL006   ', N'Thành lập', N'HD006     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL007   ', N'Thành lập', N'HD007     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL008   ', N'Thành lập', N'HD008     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL009   ', N'Thành lập', N'HD009     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL010   ', N'Thành lập', N'HD010     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL011   ', N'Thành lập', N'HD011     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL012   ', N'Thành lập', N'HD012     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL013   ', N'Thành lập', N'HD013     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL014   ', N'Thành lập', N'HD014     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL015   ', N'Thành lập', N'HD015     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL016   ', N'Thành lập', N'HD016     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL017   ', N'Thành lập', N'HD017     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL018   ', N'Thành lập', N'HD018     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL019   ', N'Thành lập', N'HD019     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL020   ', N'Thành lập', N'HD020     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL021   ', N'Thành lập', N'HD021     ', N'P01       ')
INSERT [dbo].[QDTLHD] ([MaQDTL], [NoiDung], [MaHD], [MaP]) VALUES (N'QDTL010   ', N'Thành lập', N'HD023     ', N'P01       ')
GO
INSERT [dbo].[Quyen] ([MAQ], [TenQuyen]) VALUES (N'Q01       ', N'Phòng Khoa học Công nghệ')
INSERT [dbo].[Quyen] ([MAQ], [TenQuyen]) VALUES (N'Q02       ', N'Khoa')
INSERT [dbo].[Quyen] ([MAQ], [TenQuyen]) VALUES (N'Q03       ', N'Bộ môn')
INSERT [dbo].[Quyen] ([MAQ], [TenQuyen]) VALUES (N'Q04       ', N'Giảng viên')
INSERT [dbo].[Quyen] ([MAQ], [TenQuyen]) VALUES (N'Q05       ', N'Tiểu đoàn')
INSERT [dbo].[Quyen] ([MAQ], [TenQuyen]) VALUES (N'Q06       ', N'Đại đội')
GO
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT001   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT001     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT002   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT008     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT003   ', N'Nghiệm Thu Đề Tài ', CAST(N'2022-04-05' AS Date), N'DT009     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT004   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT014     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT005   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT015     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT006   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT016     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT007   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT022     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT008   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT024     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT009   ', N'Nghiệm Thu Đề tài', CAST(N'2022-04-05' AS Date), N'DT028     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT010   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT033     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT011   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT076     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT012   ', N'Nghiệm Thu Đề tài', CAST(N'2022-04-05' AS Date), N'DT077     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT013   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT078     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT014   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT079     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT015   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT080     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT016   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT081     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT017   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT081     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT018   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT083     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT019   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT084     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT020   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT085     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT021   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT086     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT022   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT087     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT023   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT088     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT024   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT089     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT025   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT091     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT026   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT092     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT027   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT093     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT028   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT094     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT029   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT125     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT030   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT126     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT031   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT127     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT032   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT128     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT033   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT129     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT034   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT130     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT035   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT131     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT036   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT132     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT037   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT161     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT038   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT162     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT039   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT163     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT040   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT164     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT041   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT165     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT042   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT166     ', N'P01       ')
INSERT [dbo].[QuyetDinhNT] ([MaQD], [NoiDung], [NgayRaQD], [MaDT], [MaP]) VALUES (N'QDNT043   ', N'Nghiệm Thu Đề Tài', CAST(N'2022-04-05' AS Date), N'DT167     ', N'P01       ')
GO
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00001   ', N'2020-2021', N'7.2  ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00001   ', N'2021-2022', N'5.6  ', N'1')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00002   ', N'2020-2021', N'7.8  ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00021   ', N'2020-2021', N'7    ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00022   ', N'2021-2022', N'7    ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00023   ', N'2021-2022', N'7    ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00019   ', N'2021-2022', N'4    ', N'1')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00019   ', N'2020-2021', N'7.8  ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00020   ', N'2021-2022', N'8    ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00020   ', N'2020-2021', N'7    ', N'1')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00024   ', N'2021-2022', N'7.5  ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00025   ', N'2021-2022', N'7    ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00026   ', N'2021-2022', N'6    ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00027   ', N'2021-2022', N'6.5  ', N'1')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00028   ', N'2021-2022', N'7    ', N'0')
INSERT [dbo].[ThanhTich] ([MaHV], [Namhoc], [DiemTB], [SoMonNo]) VALUES (N'HV00029   ', N'2020-2021', N'7.6  ', N'0')
GO
INSERT [dbo].[TieuDoan] ([MaTD], [TenTD], [DiaDiem], [QuanSo]) VALUES (N'TD01      ', N'Tiểu đoàn 1', N'S9', 600)
INSERT [dbo].[TieuDoan] ([MaTD], [TenTD], [DiaDiem], [QuanSo]) VALUES (N'TD02      ', N'Tiểu đoàn 2', N'S11', 500)
INSERT [dbo].[TieuDoan] ([MaTD], [TenTD], [DiaDiem], [QuanSo]) VALUES (N'TD03      ', N'Tiểu đoàn 3', N'S11', 400)
INSERT [dbo].[TieuDoan] ([MaTD], [TenTD], [DiaDiem], [QuanSo]) VALUES (N'TD04      ', N'Tiểu đoàn 4', N'S11                                               ', 450)
GO
INSERT [dbo].[TroLy] ([MaTL], [TenTL], [CapBac], [MaTD]) VALUES (N'TL001     ', N'Nguyễn Khánh Nam', N'Trung úy', N'TD01      ')
INSERT [dbo].[TroLy] ([MaTL], [TenTL], [CapBac], [MaTD]) VALUES (N'TL002     ', N'Phạm Văn Bình', N'Trung úy', N'TD02      ')
INSERT [dbo].[TroLy] ([MaTL], [TenTL], [CapBac], [MaTD]) VALUES (N'TL003     ', N'Phạm Hoàng Lan', N'Trung úy', N'TD03      ')
INSERT [dbo].[TroLy] ([MaTL], [TenTL], [CapBac], [MaTD]) VALUES (N'TL004     ', N'Nguyễn Thái Hòa', N'Trung úy', N'TD04      ')
GO
INSERT [dbo].[USERS] ([ID], [Username], [Passwords], [MaQ], [MaUSER]) VALUES (N'1         ', N'pkhcn', N'1', N'Q01       ', N'P01       ')
INSERT [dbo].[USERS] ([ID], [Username], [Passwords], [MaQ], [MaUSER]) VALUES (N'2         ', N'k1', N'1', N'Q02       ', N'K01       ')
INSERT [dbo].[USERS] ([ID], [Username], [Passwords], [MaQ], [MaUSER]) VALUES (N'3         ', N'bm1', N'1', N'Q03       ', N'BM01      ')
INSERT [dbo].[USERS] ([ID], [Username], [Passwords], [MaQ], [MaUSER]) VALUES (N'4         ', N'gv1', N'1', N'Q04       ', N'GV001     ')
INSERT [dbo].[USERS] ([ID], [Username], [Passwords], [MaQ], [MaUSER]) VALUES (N'5         ', N'td1', N'1', N'Q05       ', N'TD01      ')
INSERT [dbo].[USERS] ([ID], [Username], [Passwords], [MaQ], [MaUSER]) VALUES (N'6         ', N'dd1', N'1', N'Q06       ', N'C001      ')
GO
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV001     ', N'HD001     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV002     ', N'HD002     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV003     ', N'HD007     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV004     ', N'HD008     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV005     ', N'HD009     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV005     ', N'HD010     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV006     ', N'HD011     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV023     ', N'HD012     ', N'Chủ tịch')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV034     ', N'HD001     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV035     ', N'HD001     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV036     ', N'HD001     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV037     ', N'HD001     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV038     ', N'HD002     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV039     ', N'HD002     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV040     ', N'HD002     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV041     ', N'HD002     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV042     ', N'HD007     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV043     ', N'HD007     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV044     ', N'HD007     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV045     ', N'HD007     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV046     ', N'HD008     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV047     ', N'HD008     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV048     ', N'HD008     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV049     ', N'HD008     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV050     ', N'HD009     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV051     ', N'HD009     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV052     ', N'HD009     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV053     ', N'HD009     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV054     ', N'HD010     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV055     ', N'HD010     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV056     ', N'HD010     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV057     ', N'HD010     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV058     ', N'HD011     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV061     ', N'HD011     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV062     ', N'HD011     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV063     ', N'HD011     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV064     ', N'HD012     ', N'Thư kí')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV065     ', N'HD012     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV066     ', N'HD012     ', N'Ủy viên')
INSERT [dbo].[VaiTroGV] ([MaGV], [MaHD], [VaiTro]) VALUES (N'GV067     ', N'HD012     ', N'Ủy viên')
GO
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV001     ', N'DT001     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV001     ', N'DT016     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV001     ', N'DT179     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV001     ', N'DT180     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV001     ', N'DT182     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV001     ', N'DT183     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV001     ', N'DT184     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV002     ', N'DT009     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV002     ', N'DT015     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV002     ', N'DT035     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV002     ', N'DT179     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV003     ', N'DT184     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV004     ', N'DT028     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV021     ', N'DT022     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV023     ', N'DT001     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV023     ', N'DT008     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV024     ', N'DT165     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV026     ', N'DT091     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV028     ', N'DT008     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV028     ', N'DT015     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV028     ', N'DT080     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV028     ', N'DT089     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV031     ', N'DT092     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV033     ', N'DT014     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV033     ', N'DT076     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV034     ', N'DT014     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV034     ', N'DT078     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV034     ', N'DT182     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV035     ', N'DT009     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV036     ', N'DT079     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV036     ', N'DT130     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV037     ', N'DT035     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV037     ', N'DT163     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV038     ', N'DT022     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV038     ', N'DT024     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV038     ', N'DT079     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV038     ', N'DT087     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV038     ', N'DT164     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV040     ', N'DT028     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV040     ', N'DT077     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV041     ', N'DT080     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV042     ', N'DT084     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV043     ', N'DT024     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV045     ', N'DT162     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV046     ', N'DT034     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV048     ', N'DT016     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV048     ', N'DT034     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV048     ', N'DT085     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV049     ', N'DT184     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV050     ', N'DT183     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV051     ', N'DT083     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV052     ', N'DT036     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV052     ', N'DT183     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV053     ', N'DT167     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV053     ', N'DT183     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV055     ', N'DT086     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV055     ', N'DT180     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV056     ', N'DT086     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV057     ', N'DT087     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV058     ', N'DT126     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV058     ', N'DT161     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV060     ', N'DT081     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV061     ', N'DT081     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV062     ', N'DT083     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV063     ', N'DT088     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV063     ', N'DT167     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV065     ', N'DT089     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV068     ', N'DT091     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV068     ', N'DT128     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV068     ', N'DT180     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV069     ', N'DT092     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV069     ', N'DT164     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV070     ', N'DT093     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV072     ', N'DT033     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV072     ', N'DT125     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV072     ', N'DT166     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV073     ', N'DT033     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV073     ', N'DT094     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV076     ', N'DT125     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV077     ', N'DT094     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV079     ', N'DT126     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV080     ', N'DT127     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV082     ', N'DT128     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV082     ', N'DT130     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV083     ', N'DT129     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV084     ', N'DT129     ', N'Giảng viên phụ')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV088     ', N'DT131     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV089     ', N'DT132     ', N'Giảng viên chính')
INSERT [dbo].[VaiTroHD] ([MaGV], [MaDT], [VaiTro]) VALUES (N'GV090     ', N'DT161     ', N'Giảng viên chính')
GO
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT001     ', N'HV00001   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT001     ', N'HV00004   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT001     ', N'HV00006   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT001     ', N'HV00007   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT008     ', N'HV00020   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT008     ', N'HV00021   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT008     ', N'HV00025   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT009     ', N'HV00009   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT009     ', N'HV00012   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT009     ', N'HV00016   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT014     ', N'HV00013   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT014     ', N'HV00018   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT015     ', N'HV00014   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT015     ', N'HV00015   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT016     ', N'HV00003   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT016     ', N'HV00018   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT016     ', N'HV00019   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT022     ', N'HV00008   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT022     ', N'HV00020   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT022     ', N'HV00022   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT024     ', N'HV00022   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT024     ', N'HV00026   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT024     ', N'HV00028   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT028     ', N'HV00020   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT028     ', N'HV00023   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT033     ', N'HV00035   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT033     ', N'HV00037   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT034     ', N'HV00069   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT034     ', N'HV00071   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT035     ', N'HV00005   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT035     ', N'HV00007   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT035     ', N'HV00008   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT035     ', N'HV00013   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT036     ', N'HV00024   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT036     ', N'HV00027   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT036     ', N'HV00029   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT076     ', N'HV00052   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT076     ', N'HV00055   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT077     ', N'HV00053   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT077     ', N'HV00054   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT077     ', N'HV00059   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT078     ', N'HV00042   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT078     ', N'HV00057   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT079     ', N'HV00059   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT079     ', N'HV00067   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT080     ', N'HV00061   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT080     ', N'HV00062   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT080     ', N'HV00068   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT080     ', N'HV00069   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT081     ', N'HV00060   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT081     ', N'HV00062   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT083     ', N'HV00065   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT083     ', N'HV00078   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT085     ', N'HV00070   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT085     ', N'HV00071   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT085     ', N'HV00076   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT085     ', N'HV00079   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT086     ', N'HV00073   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT086     ', N'HV00074   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT087     ', N'HV00105   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT087     ', N'HV00110   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT088     ', N'HV00108   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT088     ', N'HV00119   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT089     ', N'HV00116   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT089     ', N'HV00152   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT091     ', N'HV00126   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT091     ', N'HV00141   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT092     ', N'HV00142   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT092     ', N'HV00143   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT093     ', N'HV00145   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT093     ', N'HV00150   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT094     ', N'HV00138   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT094     ', N'HV00148   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT125     ', N'HV00115   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT125     ', N'HV00150   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT126     ', N'HV00155   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT126     ', N'HV00169   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT127     ', N'HV00156   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT127     ', N'HV00168   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT128     ', N'HV00159   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT128     ', N'HV00184   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT129     ', N'HV00162   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT129     ', N'HV00220   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT130     ', N'HV00164   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT131     ', N'HV00172   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT131     ', N'HV00223   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT132     ', N'HV00177   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT132     ', N'HV00203   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT161     ', N'HV00179   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT161     ', N'HV00246   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT162     ', N'HV00181   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT162     ', N'HV00200   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT163     ', N'HV00186   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT163     ', N'HV00239   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT164     ', N'HV00188   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT164     ', N'HV00257   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT165     ', N'HV00192   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT165     ', N'HV00249   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT166     ', N'HV00195   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT166     ', N'HV00268   ', N'Thành viên tham gia')
GO
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT167     ', N'HV00200   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT167     ', N'HV00233   ', N'Thành viên tham gia')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT179     ', N'HV00020   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT179     ', N'HV00021   ', N'Thành viên')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT179     ', N'HV00024   ', N'Thành viên')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT182     ', N'HV00023   ', N'Chủ nhiệm đề tài')
INSERT [dbo].[VaiTroHV] ([MaDT], [MaHV], [VaiTro]) VALUES (N'DT182     ', N'HV00028   ', N'Thành viên')
GO
INSERT [dbo].[XuLyViPham] ([MaVP], [NoiDung], [MucDo], [HinhThucXL], [MaDT], [MaP]) VALUES (N'VP001     ', N'Báo cáo tiến độ chậm lần 1', N'Khiển trách', N'Hoàn thiện bổ sung', N'DT034     ', N'P01       ')
INSERT [dbo].[XuLyViPham] ([MaVP], [NoiDung], [MucDo], [HinhThucXL], [MaDT], [MaP]) VALUES (N'VP002     ', N'Báo cáo tiến độ chậm lần 1', N'Khiển trách', N'Hoàn thiện bổ sung', N'DT035     ', N'P01       ')
INSERT [dbo].[XuLyViPham] ([MaVP], [NoiDung], [MucDo], [HinhThucXL], [MaDT], [MaP]) VALUES (N'VP003     ', N'Báo cáo tiến độ chậm lần 2', N'Cảnh cáo', N'Hoàn thiện bổ sung', N'DT015     ', N'P01       ')
INSERT [dbo].[XuLyViPham] ([MaVP], [NoiDung], [MucDo], [HinhThucXL], [MaDT], [MaP]) VALUES (N'VP004     ', N'Báo cáo tiến độ chậm lần 2', N'Cảnh cáo', N'Hoàn thiện bổ sung', N'DT022     ', N'P01       ')
INSERT [dbo].[XuLyViPham] ([MaVP], [NoiDung], [MucDo], [HinhThucXL], [MaDT], [MaP]) VALUES (N'VP005     ', N'Báo cáo tiến độ chậm lần 2', N'Cảnh cáo', N'Hoàn thiện bổ sung', N'DT089     ', N'P01       ')
INSERT [dbo].[XuLyViPham] ([MaVP], [NoiDung], [MucDo], [HinhThucXL], [MaDT], [MaP]) VALUES (N'VP006     ', N'Không hoàn thành báo cáo', N'Kỉ luật', N'Dừng đề tài', N'DT167     ', N'P01       ')
INSERT [dbo].[XuLyViPham] ([MaVP], [NoiDung], [MucDo], [HinhThucXL], [MaDT], [MaP]) VALUES (N'VP007     ', N'Báo cáo tiến độ chậm lần 2', N'Cảnh cáo', N'Hoàn thiện bổ sung', N'DT035     ', N'P01       ')
GO
ALTER TABLE [dbo].[BoMon]  WITH CHECK ADD  CONSTRAINT [FK_BoMon_BoMon] FOREIGN KEY([MaBM])
REFERENCES [dbo].[BoMon] ([MaBM])
GO
ALTER TABLE [dbo].[BoMon] CHECK CONSTRAINT [FK_BoMon_BoMon]
GO
ALTER TABLE [dbo].[BoMon]  WITH CHECK ADD  CONSTRAINT [fk_MaK] FOREIGN KEY([MaK])
REFERENCES [dbo].[Khoa] ([MaK])
GO
ALTER TABLE [dbo].[BoMon] CHECK CONSTRAINT [fk_MaK]
GO
ALTER TABLE [dbo].[CB_P]  WITH CHECK ADD  CONSTRAINT [fk_MaP4] FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[CB_P] CHECK CONSTRAINT [fk_MaP4]
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [fk_MaBM] FOREIGN KEY([MaBM])
REFERENCES [dbo].[BoMon] ([MaBM])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [fk_MaBM]
GO
ALTER TABLE [dbo].[GiayDKDT]  WITH NOCHECK ADD  CONSTRAINT [FK_GiayDKDT_phongKHQS] FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[GiayDKDT] NOCHECK CONSTRAINT [FK_GiayDKDT_phongKHQS]
GO
ALTER TABLE [dbo].[GiayDKDT]  WITH NOCHECK ADD  CONSTRAINT [fk_MaDT3] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[GiayDKDT] NOCHECK CONSTRAINT [fk_MaDT3]
GO
ALTER TABLE [dbo].[HocVien]  WITH NOCHECK ADD  CONSTRAINT [fk_MaDD] FOREIGN KEY([MaDD])
REFERENCES [dbo].[DaiDoi] ([MaDD])
GO
ALTER TABLE [dbo].[HocVien] NOCHECK CONSTRAINT [fk_MaDD]
GO
ALTER TABLE [dbo].[HoiDongNT]  WITH NOCHECK ADD  CONSTRAINT [FK_HoiDongNT_Khoa] FOREIGN KEY([MaK])
REFERENCES [dbo].[Khoa] ([MaK])
GO
ALTER TABLE [dbo].[HoiDongNT] NOCHECK CONSTRAINT [FK_HoiDongNT_Khoa]
GO
ALTER TABLE [dbo].[KetQuaNT]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuong_phongKHQS] FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[KhenThuong] CHECK CONSTRAINT [FK_KhenThuong_phongKHQS]
GO
ALTER TABLE [dbo].[Khoa]  WITH CHECK ADD  CONSTRAINT [fk_MaCBP] FOREIGN KEY([MaCBP])
REFERENCES [dbo].[CB_P] ([MaCBP])
GO
ALTER TABLE [dbo].[Khoa] CHECK CONSTRAINT [fk_MaCBP]
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[QDTLHD]  WITH NOCHECK ADD FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[QuyetDinhNT]  WITH NOCHECK ADD  CONSTRAINT [fk_MaP] FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[QuyetDinhNT] NOCHECK CONSTRAINT [fk_MaP]
GO
ALTER TABLE [dbo].[QuyetDinhNT]  WITH NOCHECK ADD  CONSTRAINT [fk_MaTD1] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[QuyetDinhNT] NOCHECK CONSTRAINT [fk_MaTD1]
GO
ALTER TABLE [dbo].[TroLy]  WITH CHECK ADD  CONSTRAINT [fk_MaTD] FOREIGN KEY([MaTD])
REFERENCES [dbo].[TieuDoan] ([MaTD])
GO
ALTER TABLE [dbo].[TroLy] CHECK CONSTRAINT [fk_MaTD]
GO
ALTER TABLE [dbo].[USERS]  WITH NOCHECK ADD FOREIGN KEY([MaQ])
REFERENCES [dbo].[Quyen] ([MAQ])
GO
ALTER TABLE [dbo].[USERS]  WITH NOCHECK ADD FOREIGN KEY([MaQ])
REFERENCES [dbo].[Quyen] ([MAQ])
GO
ALTER TABLE [dbo].[USERS]  WITH NOCHECK ADD FOREIGN KEY([MaQ])
REFERENCES [dbo].[Quyen] ([MAQ])
GO
ALTER TABLE [dbo].[VaiTroGV]  WITH NOCHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[VaiTroGV]  WITH NOCHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[VaiTroGV]  WITH NOCHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[VaiTroGV]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[VaiTroGV]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[VaiTroGV]  WITH NOCHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoiDongNT] ([MaHD])
GO
ALTER TABLE [dbo].[VaiTroHD]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[VaiTroHD]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[VaiTroHD]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[VaiTroHD]  WITH NOCHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[VaiTroHD]  WITH NOCHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[VaiTroHD]  WITH NOCHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[VaiTroHV]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[VaiTroHV]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[VaiTroHV]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[VaiTroHV]  WITH NOCHECK ADD FOREIGN KEY([MaHV])
REFERENCES [dbo].[HocVien] ([MaHV])
GO
ALTER TABLE [dbo].[VaiTroHV]  WITH NOCHECK ADD FOREIGN KEY([MaHV])
REFERENCES [dbo].[HocVien] ([MaHV])
GO
ALTER TABLE [dbo].[VaiTroHV]  WITH NOCHECK ADD FOREIGN KEY([MaHV])
REFERENCES [dbo].[HocVien] ([MaHV])
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH NOCHECK ADD FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH NOCHECK ADD  CONSTRAINT [fk_MaDT1] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DeTai] ([MaDT])
GO
ALTER TABLE [dbo].[XuLyViPham] NOCHECK CONSTRAINT [fk_MaDT1]
GO
ALTER TABLE [dbo].[XuLyViPham]  WITH NOCHECK ADD  CONSTRAINT [fk_MaP2] FOREIGN KEY([MaP])
REFERENCES [dbo].[phongKHQS] ([MaP])
GO
ALTER TABLE [dbo].[XuLyViPham] NOCHECK CONSTRAINT [fk_MaP2]
GO
/****** Object:  StoredProcedure [dbo].[BM_TIMDETAI_MA_TEN]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BM_TIMDETAI_MA_TEN]
@MABM CHAR(10),
@key NVARCHAR(500)
AS
BEGIN
SELECT DT.[MaDT] AS N'Mã đề tài',[TenDT] as N'Tên đề tài',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, BOMON BM, KHOA K
  WHERE DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND GV.MABM=BM.MABM AND BM.MABM=@MABM 
		AND (TenDT LIKE '%'+@key+'%' OR DT.MADT LIKE '%'+@key+'%')
END
GO
/****** Object:  StoredProcedure [dbo].[bommon_layGV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bommon_layGV] @mabm char(10)
as
begin
	select gv.MaGV as N'Mã giảng viên', gv.TenGV AS N'Tên giảng viên', gv.CapBac as N'Cấp Bậc', gv.ChucVu AS N'Chức vụ', gv.MaBM As N'Mã bộ môn' 
	from GiangVien gv where MaBM = @mabm
end
GO
/****** Object:  StoredProcedure [dbo].[bommon_xoaGV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[bommon_xoaGV] @mgv char(10)
as
begin
	delete from GiangVien where MaGV = @mgv
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dsdt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bomon_lay_dsdt]  @mabm char(10)
as
begin
	select DISTINCT(dt.MaDT) as N'Mã đề tài' ,dt.TenDT as N'Tên đề tài',dt.NgayBD as N'Ngày bắt đầu',dt.NgayNT as N'Ngày nghiệm thu',DT.KinhPhi as N'Kinh phí', dt.TienDo as N'Tiến độ',dt.TrangThai as N'Trạng thái',dt.NamHoc AS N'Năm học'
	from DeTai dt
inner join VaiTroHD on dt.MaDT = VaiTroHD.MaDT 
inner join GiangVien on GiangVien.MaGV = VaiTroHD.MaGV
where GiangVien.MaBM = @mabm

end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_cap_tt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bomon_lay_dtdt_cap_tt] @mabm char(10), @trangthai nvarchar(50),@namhoc varchar(15)
as
begin
	select dt.MaDT as N'Mã đề tài' ,dt.TenDT as N'Tên đề tài',dt.NgayBD as N'Ngày bắt đầu',dt.NgayNT as N'Ngày nghiệm thu',DT.KinhPhi as N'Kinh phí', dt.TienDo as N'Tiến độ',dt.TrangThai as N'Trạng thái',dt.NamHoc AS N'Năm học'
	from DeTai dt
	inner join VaiTroHD on dt.MaDT = VaiTroHD.MaDT 
	inner join GiangVien on GiangVien.MaGV = VaiTroHD.MaGV
	where GiangVien.MaBM = @mabm and dt.NamHoc = @namhoc and dt.TrangThai = @trangthai
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_cap_ttDaHT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bomon_lay_dtdt_cap_ttDaHT] @mabm char(10), @trangthai nvarchar(50),@namhoc varchar(15)
as
begin
	select dt.MaDT as N'Mã đề tài' ,dt.TenDT as N'Tên đề tài',dt.NgayBD as N'Ngày bắt đầu',dt.NgayNT as N'Ngày nghiệm thu',DT.KinhPhi as N'Kinh phí', dt.TienDo as N'Tiến độ',dt.TrangThai as N'Trạng thái', KetQuaNT.KetQua as N'Kết quả'
	from DeTai dt
	inner join VaiTroHD on dt.MaDT = VaiTroHD.MaDT 
	inner join GiangVien on GiangVien.MaGV = VaiTroHD.MaGV
	inner join KetQuaNT on dt.MaDT = KetQuaNT.MaDT
	where GiangVien.MaBM = @mabm and dt.NamHoc = @namhoc and dt.TrangThai = @trangthai
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_theonamhoc]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bomon_lay_dtdt_theonamhoc] @mabm char(10), @namhoc varchar(15)
as
begin
	select dt.MaDT as N'Mã đề tài' ,dt.TenDT as N'Tên đề tài',dt.NgayBD as N'Ngày bắt đầu',dt.NgayNT as N'Ngày nghiệm thu',DT.KinhPhi as N'Kinh phí', dt.TienDo as N'Tiến độ',dt.TrangThai as N'Trạng thái',dt.NamHoc AS N'Năm học'
	from DeTai dt
	inner join VaiTroHD on dt.MaDT = VaiTroHD.MaDT 
	inner join GiangVien on GiangVien.MaGV = VaiTroHD.MaGV
	where GiangVien.MaBM = @mabm and dt.NamHoc = @namhoc
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_theott]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bomon_lay_dtdt_theott] @mabm char(10), @trangthai nvarchar(50)
as
begin
	select dt.MaDT as N'Mã đề tài' ,dt.TenDT as N'Tên đề tài',dt.NgayBD as N'Ngày bắt đầu',dt.NgayNT as N'Ngày nghiệm thu',DT.KinhPhi as N'Kinh phí', dt.TienDo as N'Tiến độ',dt.TrangThai as N'Trạng thái',dt.NamHoc AS N'Năm học'
	from DeTai dt
	inner join VaiTroHD on dt.MaDT = VaiTroHD.MaDT 
	inner join GiangVien on GiangVien.MaGV = VaiTroHD.MaGV
	where GiangVien.MaBM = @mabm and dt.TrangThai = @trangthai
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_ttDaHT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[bomon_lay_dtdt_ttDaHT] @mabm char(10), @trangthai nvarchar(50)
as
begin
	select dt.MaDT as N'Mã đề tài' ,dt.TenDT as N'Tên đề tài',dt.NgayBD as N'Ngày bắt đầu',dt.NgayNT as N'Ngày nghiệm thu',DT.KinhPhi as N'Kinh phí', dt.TienDo as N'Tiến độ',dt.TrangThai as N'Trạng thái', KetQuaNT.KetQua as N'Kết quả'
	from DeTai dt
	inner join VaiTroHD on dt.MaDT = VaiTroHD.MaDT 
	inner join GiangVien on GiangVien.MaGV = VaiTroHD.MaGV
	inner join KetQuaNT on dt.MaDT = KetQuaNT.MaDT
	where GiangVien.MaBM = @mabm  and dt.TrangThai = @trangthai
end
GO
/****** Object:  StoredProcedure [dbo].[daidoi_dangki]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[daidoi_dangki]
as
begin
select MaDT from DeTai
where MaDT not in (Select MaDT from VaiTroHV) and TienDo Is NULL and TrangThai = N'Đã phê duyệt'

end
GO
/****** Object:  StoredProcedure [dbo].[Daidoi_lay_dsdt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Daidoi_lay_dsdt]  @madd char(10)
as
begin
	select DISTINCT(dt.MaDT) as N'Mã đề tài' ,dt.TenDT as N'Tên đề tài',dt.NgayBD as N'Ngày bắt đầu',dt.NgayNT as N'Ngày nghiệm thu',DT.KinhPhi as N'Kinh phí', dt.TienDo as N'Tiến độ',dt.TrangThai as N'Trạng thái',dt.NamHoc AS N'Năm học'
from DeTai dt
inner join VaiTroHV on dt.MaDT = VaiTroHV.MaDT 
inner join HocVien on HocVien.MaHV = VaiTroHV.MaHV
where HocVien.MaDD = @madd

end
GO
/****** Object:  StoredProcedure [dbo].[Daidoi_layHV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Daidoi_layHV] @madd char(10)
as
begin
	select hv.MaHV as N'Mã Học viên', hv.TenHV AS N'Tên Học viên', hv.CapBac as N'Cấp Bậc', hv.NamSinh AS N'Năm sinh',hv.GioiTinh as N'Giới tính', hv.MaDD As N'Mã Đại đội' 
	from HocVien hv where MaDD = @madd
end
GO
/****** Object:  StoredProcedure [dbo].[Daidoi_them_HVCTdt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Daidoi_them_HVCTdt]
@madt char(10),
@mahv char(10)
as
begin
	insert into VaiTroHV(MADT,MaHV,VaiTro) values (@madt,@mahv,N'Chủ nhiệm đề tài')
	update DeTai set TrangThai = N'Chờ thực hiện' where MaDT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[Daidoi_them_HVTGdt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Daidoi_them_HVTGdt]
@madt char(10),
@sltv char,
@hv1 char(10),
@hv2 char(10),
@hv3 char(10),
@hv4 char(10)

as
begin
	if @sltv = '1'
		insert into VaiTroHV(MaDT,MaHV,VaiTro)
		values(@madt,@hv1,N'Thành viên')
	if @sltv='2'
		insert into VaiTroHV(MaDT,MaHV,VaiTro)
		values(@madt,@hv1,N'Thành viên'),
			   (@madt,@hv2,N'Thành viên')
	if @sltv='3'
		insert into VaiTroHV(MaDT,MaHV,VaiTro)
		values(@madt,@hv1,N'Thành viên'),
			   (@madt,@hv2,N'Thành viên'),
			   (@madt,@hv3,N'Thành viên')
	if @sltv = '4'
		insert into VaiTroHV(MaDT,MaHV,VaiTro)
		values(@madt,@hv1,N'Thành viên'),
			  (@madt,@hv2,N'Thành viên'),
			  (@madt,@hv3,N'Thành viên'),
			  (@madt,@hv4,N'Thành viên')
end
GO
/****** Object:  StoredProcedure [dbo].[Daidoi_xoaGV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Daidoi_xoaGV] @mhv char(10)
as
begin
	delete from HocVien where MaHV = @mhv
end
GO
/****** Object:  StoredProcedure [dbo].[DD_Lay_HvCTdt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DD_Lay_HvCTdt] @madd char(10),@namhoc varchar(15)
as
begin
	select HocVien.MaHV,TenHV from 
	HocVien, ThanhTich
	where HocVien.MaHV = ThanhTich.MaHV 
	and ThanhTich.Namhoc in (select top(1)Namhoc from ThanhTich where Namhoc < @namhoc order by Namhoc desc )
	and DiemTB >= '7' and SoMonNo ='0' and MaDD = @madd
end
GO
/****** Object:  StoredProcedure [dbo].[DD_Lay_HvTGdt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DD_Lay_HvTGdt] @madd char(10),@namhoc varchar(15)
as
begin
	select HocVien.MaHV,TenHV from 
	HocVien, ThanhTich
	where HocVien.MaHV = ThanhTich.MaHV 
	and ThanhTich.Namhoc in (select top(1)Namhoc from ThanhTich where Namhoc < @namhoc order by Namhoc desc )
	and DiemTB >= '5' and SoMonNo ='0' and MaDD = @madd
end
GO
/****** Object:  StoredProcedure [dbo].[DD_sua_tt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DD_sua_tt] @madd char(10),@dd nvarchar(50),@matd char(10)
as
begin
	update DaiDoi set DiaDiem = @dd, MaTD = @matd where MaDD=@madd
end
GO
/****** Object:  StoredProcedure [dbo].[detaivavaitrohocvien]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[detaivavaitrohocvien]
@MaHV char(10)
AS
BEGIN
select distinct dt.madt as 'Mã ĐT',tendt as 'Tên ĐT',namhoc as 'Năm Học', vaitro as 'Vai trò của học viên'
from DeTai as dt,VaiTroHV
where dt.MaDT=VaiTroHV.MaDT and MaHV=@MaHV
END
GO
/****** Object:  StoredProcedure [dbo].[GV_DsTVDT_GV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GV_DsTVDT_GV] @MADT CHAR(10)
AS
BEGIN
SELECT 
	  GV.MaGV AS N'Mã GV'
	  ,TenGV as N'Tên GV'
	  ,VTHD.VaiTro as 'Vai trò'
	  
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV 
  WHERE DT.MaDT= @MADT and DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV 
END
GO
/****** Object:  StoredProcedure [dbo].[GV_DsTVDT_HV]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GV_DsTVDT_HV] @MADT CHAR(10)
AS
BEGIN
SELECT 
	  HV.MaHV as N'Mã HV'
	  ,HV.TenHV as N'Tên HV'
	  ,VaiTroHV.VaiTro as 'Vai trò'
	  
  FROM [dbo].[DeTai] DT,  VAITROHV,HOCVIEN HV
  WHERE DT.MaDT= @MADT AND DT.MADT=VaiTroHV.MADT AND HV.MAHV=VaiTroHV.MaHV 
END
GO
/****** Object:  StoredProcedure [dbo].[GV_sua_tt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GV_sua_tt] @magv char(10),@cap nvarchar(50),@chucvu nvarchar(50),@maBM char(10)
as
begin
	update GiangVien set CapBac = @cap, ChucVu=@chucvu, MaBM = @maBM where MaGV=@magv
end
GO
/****** Object:  StoredProcedure [dbo].[GV_them_dt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GV_them_dt] 
@madt char(10),
@tendt nvarchar(500),
@ngaybd date,
@ngaynt date,
@namhoc varchar(15),
@sltv char,
@gv1 char(10),
@gv2 char(10),
@gv3 char(10)
as
begin
	insert into DeTai(MADT,TenDT,NgayBD,NgayNT,KinhPhi,TienDo,TrangThai,NamHoc)
	values(@madt,@tendt,@ngaybd,@ngaynt,NULL,NULL,N'Chờ phê duyệt',@namhoc)
	insert into VaiTroHD(MaDT,MaGV,VaiTro)
	values(@madt,@gv1,N'Giảng viên chính')
	if @sltv = '1'
		insert into VaiTroHD(MaDT,MaGV,VaiTro)
		values(@madt,@gv2,N'Giảng viên phụ')
	if @sltv='2'
		insert into VaiTroHD(MaDT,MaGV,VaiTro)
		values(@madt,@gv2,N'Giảng viên phụ'),
			   (@madt,@gv3,N'Giảng viên phụ')
	
end
GO
/****** Object:  StoredProcedure [dbo].[KHOA_DeTaiCuaHoiDong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KHOA_DeTaiCuaHoiDong]
@MaHD char(10)
AS
BEGIN
select distinct detai.madt,tendt,KetQua from DeTai,KetQuaNT
where DeTai.MaDT=KetQuaNT.MaDT and MaHD=@MaHD
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_DeTaiCuaKhoaChuaNghiemThu]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KHOA_DeTaiCuaKhoaChuaNghiemThu]
@MaK char(10)
AS
BEGIN
select detai.madt,tendt from DeTai,VaiTroHD,GiangVien,BoMon
where DeTai.MaDT=VaiTroHD.MaDT and VaiTroHD.MaGV=GiangVien.MaGV and GiangVien.MaBM=BoMon.MaBM and BoMon.MaK=@MaK 
and DeTai.MaDT not in(select MaDT from KetQuaNT)
END
GO
/****** Object:  StoredProcedure [dbo].[Khoa_detaigiangvienvavaitro]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Khoa_detaigiangvienvavaitro]
@MaGV char(10)
AS
BEGIN
select distinct tendt as 'Tên ĐT',vaitro as 'Vai trò của giảng viên'
from detai,VaiTroHD
where MaGV=@MaGV
END
GO
/****** Object:  StoredProcedure [dbo].[Khoa_getgiangvien]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Khoa_getgiangvien]
@MaK char(10)
AS
BEGIN
select * from GiangVien
where MaBM in(select MaBM from BoMon where MaK=@MaK)
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_GETMABOMON]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KHOA_GETMABOMON] @MAK CHAR(10)
AS
BEGIN
SELECT DISTINCT MABM FROM BoMon WHERE MaK=@MAK
END
GO
/****** Object:  StoredProcedure [dbo].[Khoa_GiangVienChuaHD]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Khoa_GiangVienChuaHD]
@MaK char(10)
AS
BEGIN
select giangvien.magv from GiangVien,BoMon
where GiangVien.MaBM=BoMon.MaBM and BoMon.MaK=@MaK
and GiangVien.MaGV not in(select MaGV from VaiTroGV)
END
GO
/****** Object:  StoredProcedure [dbo].[Khoa_NghiemThuDeTai]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Khoa_NghiemThuDeTai]
@MaHD char(10),
@MaDT char(10),
@KetQua nvarchar(50)
AS
BEGIN
update KetQuaNT
set KetQua=@KetQua where MaHD=@MaHD and MaDT=@MaDT
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_SHOWDETAI_BoMon]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[KHOA_SHOWDETAI_BoMon] @MABM CHAR(10)
AS
BEGIN
SELECT DISTINCT(DT.[MaDT]) AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, BOMON BM, KHOA K
  WHERE DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND GV.MABM=@MABM
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_SHOWDETAI_BOMON_TRANGTHAI]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KHOA_SHOWDETAI_BOMON_TRANGTHAI]
@MABM CHAR(10),
@TRANGTHAI NVARCHAR (50)
AS
BEGIN
SELECT distinct DT.[MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, BOMON BM, KHOA K
  WHERE DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND GV.MABM=@MABM AND TRANGTHAI=@TRANGTHAI
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_SUA_VAITRO_HOIDONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KHOA_SUA_VAITRO_HOIDONG]
@MAHD CHAR(10),
@MAGV CHAR(10),
@VAITRO NVARCHAR(50)
AS
BEGIN
UPDATE VAITROGV SET VAITRO=@VAITRO WHERE MAHD=@MAHD AND MAGV=@MAGV
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_THEM_GIANGVIENHOIDONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KHOA_THEM_GIANGVIENHOIDONG]
@MAHD CHAR(10),
@MAGV CHAR(10),
@VAITRO NVARCHAR(50)
AS
BEGIN
INSERT INTO VAITROGV
VALUES(@MAGV, @MAHD,@VAITRO)
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_ThemDTHoiDong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KHOA_ThemDTHoiDong] @mhd char(10),@madt char(10)
as
begin
	insert KetQuaNT values(@mhd,@madt,N'Chưa Nghiệm Thu')
end
GO
/****** Object:  StoredProcedure [dbo].[KHOA_THEMHOIDONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KHOA_THEMHOIDONG]
@MaHD char(10),
@NamHoc varchar(15),
@TrangThai nvarchar(50),
@MaK char(10)
AS
BEGIN
INSERT INTO [dbo].[HoiDongNT]
           ([MaHD]
           ,[NamHoc]
           ,[TrangThai]
           ,[MaK])
     VALUES
           (@MaHD ,
           @NamHoc ,
           @TrangThai ,
           @MaK)
END
GO
/****** Object:  StoredProcedure [dbo].[KHOA_XOA_THANHVIEN_HOIDONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KHOA_XOA_THANHVIEN_HOIDONG]
@MAHD CHAR(10),
@MAGV CHAR(10)
AS
BEGIN
ALTER TABLE VAITROGV NOCHECK CONSTRAINT ALL 
DELETE FROM VAITROGV WHERE MAHD=@MAHD AND MAGV=@MAGV
END
GO
/****** Object:  StoredProcedure [dbo].[PHONG_SHOW_THANHVIENHD]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PHONG_SHOW_THANHVIENHD]
@MAHD CHAR(10)
AS
BEGIN
SELECT distinct GV.MAGV, TenGV,VaiTro FROM GIANGVIEN GV, VAITROGV VTGV
WHERE GV.MAGV=VTGV.MAGV AND VTGV.MAHD=@MAHD
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_CapKinhphi]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHCN_CapKinhphi]
@MaDT char(10),
@KinhPhi int
AS
BEGIN
update DeTai
set KinhPhi=KinhPhi+@KinhPhi
where MaDT=@MaDT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_GETDTchuaKHENTHUONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHCN_GETDTchuaKHENTHUONG]
AS
BEGIN
SELECT DISTINCT DT.MADT 
FROM DeTai AS DT ,KetQuaNT
where dt.MaDT=KetQuaNT.MaDT and KetQua !=N'Chưa Nghiệm Thu'
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_GETDTKHENTHUONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHCN_GETDTKHENTHUONG]
AS
BEGIN
SELECT DISTINCT DT.MADT AS 'Mã ĐT',TenDT as 'Tên ĐT',CapDo as 'Cấp độ khen thưởng',NoiDung as 'Nội dung khen thưởng' 
FROM DeTai AS DT ,KHENTHUONG
where dt.MaDT=KhenThuong.MaDT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_GETDTKHENTHUONG_capdo]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHCN_GETDTKHENTHUONG_capdo] @capdo nvarchar(15)
AS
BEGIN
SELECT DISTINCT DT.MADT AS 'Mã ĐT',TenDT as 'Tên ĐT',CapDo as 'Cấp độ khen thưởng',NoiDung as 'Nội dung khen thưởng' 
FROM DeTai AS DT ,KHENTHUONG
where dt.MaDT=KhenThuong.MaDT and CapDo=@capdo
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_GETDTViPham]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHCN_GETDTViPham]
AS
BEGIN
SELECT DISTINCT DT.MADT AS 'Mã ĐT',TenDT as 'Tên ĐT',MucDo as 'Mức Độ vi phạm',NoiDung as 'Nội dung ', HinhThucXL as 'Hình thức xử lý'
FROM DeTai AS DT ,XuLyViPham
where dt.MaDT=XuLyViPham.MaDT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_GETDTvipham_mucdo]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHCN_GETDTvipham_mucdo] @mucdo nvarchar(15)
AS
BEGIN
SELECT DISTINCT DT.MADT AS 'Mã ĐT',TenDT as 'Tên ĐT',MucDo as 'Mức độ vi phạm',NoiDung as 'Nội dung', HinhThucXL as 'Hình thức xử lsy' 
FROM DeTai AS DT ,XuLyViPham
where dt.MaDT=XuLyViPham.MaDT and MucDo=@mucdo
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_suaTK]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHCN_suaTK]
@ID char(10),
@Name nvarchar(50),
@pass nvarchar(50)
AS
BEGIN
update USERS
set Username=@Name,Passwords=@pass
where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_them_dt_hoidong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_them_dt_hoidong] @madt char(10),@mhd char(10)
as
begin
	update KetQuaNT set KetQua=N'Chưa Nghiệm Thu'
	where MaHD = @mhd and MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_THEMTK]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHCN_THEMTK]
@ID char(10),
@Name nvarchar(50),
@pass nvarchar(50),
@MaQ char(10),
@MaUser char(10)
AS
BEGIN
INSERT INTO [dbo].[USERS]
           ([ID]
           ,[Username]
           ,[Passwords]
           ,[MaQ]
		   ,[MaUSER])
     VALUES
           (@ID ,
@Name ,
@pass,
@MaQ ,
@MaUser)
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_XoaDTHoiDong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHCN_XoaDTHoiDong]
@MaHD char(10),
@MaDT char(10)
AS
BEGIN
delete from KetQuaNT where MaHD=@MaHD and MaDT=@MaDT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHCN_XoaTK]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHCN_XoaTK]
@ID char(10)
AS
BEGIN
delete from USERS where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_DELETE_DETAI]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_DELETE_DETAI]
@MADT CHAR (10)AS
BEGIN
ALTER TABLE DETAI NOCHECK CONSTRAINT ALL
ALTER TABLE VAITROHD NOCHECK CONSTRAINT ALL
ALTER TABLE VAITROHV NOCHECK CONSTRAINT ALL
ALTER TABLE GiayDKDT NOCHECK CONSTRAINT ALL
ALTER TABLE KetQuaNT NOCHECK CONSTRAINT ALL
ALTER TABLE QUYETDINHNT NOCHECK CONSTRAINT ALL
DELETE FROM DETAI WHERE MADT=@MADT
DELETE FROM VAITROHD WHERE MADT=@MADT
DELETE FROM VAITROHV WHERE MADT=@MADT
DELETE FROM KetQuaNT WHERE MADT=@MADT
DELETE FROM GiayDKDT WHERE MADT=@MADT
DELETE FROM QUYETDINHNT WHERE MADT=@MADT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_DTCTD]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHQS_DTCTD]
@tiendo int
AS
BEGIN
select madt as 'Mã ĐT',tendt as 'Tên ĐT', tiendo as 'Tiến độ' from detai
where TienDo<@tiendo
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_GET_MAK]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHQS_GET_MAK] 
as
begin
	select MAK from KHOA
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_GET_NAMHOC]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PKHQS_GET_NAMHOC] 
as
begin
	select DISTINCT (NAMHOC) from DETAI
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_GET_TRANGTHAI]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PKHQS_GET_TRANGTHAI]
as
begin
	select DISTINCT (TRANGTHAI) from DETAI
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_GetMaDeTaiDaNghiemThu]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHQS_GetMaDeTaiDaNghiemThu]
AS
BEGIN
select madt from DeTai
where DeTai.MaDT  in(select MaDT from KetQuaNT where KetQua != N'Chưa Nghiệm Thu')
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_KhenThuong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHQS_KhenThuong]
@MaKT char(10),
@noidung nvarchar(50),
@Capdo char(10),
@MaDT char(10)
AS
BEGIN
insert KhenThuong values(@MaKT,@noidung,@Capdo,@MaDT,'P01')
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOW_KINHPHI]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PKHQS_SHOW_KINHPHI]
as
begin
	select MaDT as N'Mã đề tài',TenDT as N'Tên đề tài',KinhPhi as N'Kinh phí',TienDo as N'Tiến độ' from DeTai
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWbomon]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHQS_SHOWbomon]
@mak char(10)
as
begin
SELECT [MaBM] AS N'Mã BM'
      ,[TenBM] AS N'Tên BM'
      ,[SDT] as N'SDT'
  FROM [dbo].[BoMon] BM
  where BM.MAK=@MAK
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_ALL]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_ALL] AS
BEGIN
SELECT [MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai]
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_detai]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_detai] @MADT CHAR(10)
AS
BEGIN
SELECT [TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
	  ,GV.MAGV AS N'Mã GV'
	  ,Tengv as N'Tên GV'
	  ,HV.mahv as N'Mã HV'
	  ,tenhv as N'Tên HV'
	  ,VaiTroHV.vaitro as 'Vai trò'
	  ,MAHD AS N'Mã HĐ'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, VAITROHV,HOCVIEN HV,KetQuaNT
  WHERE DT.madt=@madt and DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND DT.MADT=VaiTroHV.MADT AND HV.MAHV=VaiTroHV.MaHV AND DT.MaDT=KetQuaNT.MADT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_KHOA]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_KHOA] @MAK CHAR(10)
AS
BEGIN
SELECT DISTINCT(DT.[MaDT]) AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, BOMON BM, KHOA K
  WHERE DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND GV.MABM=BM.MABM AND K.MAK=BM.MAK AND K.MAK=@MAK
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_KHOA_NAMHOC]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_KHOA_NAMHOC]
@MAK CHAR(10),
@NAMHOC VARCHAR (15)
AS
BEGIN
SELECT DT.[MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, BOMON BM, KHOA K
  WHERE DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND GV.MABM=BM.MABM AND K.MAK=BM.MAK AND NAMHOC=@NAMHOC
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_KHOA_TRANGTHAI]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_KHOA_TRANGTHAI]
@MAK CHAR(10),
@TRANGTHAI NVARCHAR (50)
AS
BEGIN
SELECT distinct DT.[MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, BOMON BM, KHOA K
  WHERE DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND GV.MABM=BM.MABM AND K.MAK=BM.MAK AND TRANGTHAI=@TRANGTHAI
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_KHOA_TRANGTHAI_NH]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_KHOA_TRANGTHAI_NH]
@MAK CHAR(10),
@TRANGTHAI NVARCHAR (50),
@NAMHOC VARCHAR (15)
AS
BEGIN
SELECT distinct DT.[MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] DT, VAITROHD VTHD, GIANGVIEN GV, BOMON BM, KHOA K
  WHERE DT.MADT=VTHD.MADT AND GV.MAGV=VTHD.MAGV AND GV.MABM=BM.MABM AND K.MAK=BM.MAK AND TRANGTHAI=@TRANGTHAI AND NAMHOC=@NAMHOC
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_NAMHOC]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_NAMHOC]
@NAMHOC VARCHAR (15)AS
BEGIN
SELECT [MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] WHERE NAMHOC=@NAMHOC
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_TIMKIEM]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHQS_SHOWDETAI_TIMKIEM]
@KEY NVARCHAR (500)AS
BEGIN
SELECT [MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] WHERE MADT LIKE '%'+@KEY+'%' or TENDT LIKE '%'+@KEY+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_TIMKIEM_Ma]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_TIMKIEM_Ma]
@KEY NVARCHAR (500)AS
BEGIN
SELECT distinct [MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] WHERE MADT =@KEY
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_TRANGTHAI]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_TRANGTHAI]
@TRANGTHAI NVARCHAR (50)AS
BEGIN
SELECT [MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] WHERE TRANGTHAI=@TRANGTHAI
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWDETAI_TRANGTHAI_NAMHOC]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWDETAI_TRANGTHAI_NAMHOC]
@TRANGTHAI NVARCHAR (50),
@NAMHOC VARCHAR (15)
AS
BEGIN
SELECT [MaDT] AS N'Mã DT',[TenDT] as N'Tên DT',[NgayBD] as N'Ngày bắt đầu', [NgayNT] as N'Ngày nghiệm thu'
      ,[KinhPhi] as N'Kinh phí'
      ,[TienDo] as N'Tiến độ'
      ,[TrangThai] as N'Trạng thái'
      ,[NamHoc] as N'Năm học'
  FROM [dbo].[DeTai] WHERE TRANGTHAI=@TRANGTHAI AND NAMHOC=@NAMHOC
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWHOIDONG_DETAIL]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHQS_SHOWHOIDONG_DETAIL]
@MAHD CHAR(10)
as 
begin
SELECT hdnt.MAHD AS N'Mã HĐ'
      ,hdnt.[NamHoc] as N'Năm học'
	  ,gv.magv as N'Mã GV'
	  ,gv.TenGV as N'Tên GV'
      ,[MaK] as N'Mã khoa'
	  ,dt.madt as N'Mã DT'
	  ,TENDT AS N'Tên DT'
  FROM [dbo].[HoiDongNT] hdnt, KetQuaNT KQNT, detai dt, VaiTroGV vtgv,GiangVien gv
  WHERE hdnt.MAHD=KQNT.MAHD ANd hdnt.MAHD=@MAHD and dt.madt=kqnt.madt and vtgv.mahd=hdnt.mahd and vtgv.magv=gv.tengv
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWHOIDONG_Mak]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SHOWHOIDONG_Mak] @mak char(10)
as 
begin
SELECT [MaHD] AS N'Mã HĐ'
      ,[NamHoc] as N'Năm học'
      ,[TrangThai] as N'Trạng thái'
      ,[MaK] as N'Mã khoa'
  FROM [dbo].[HoiDongNT]
  where MaK=@mak
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWHOIDONGALL]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHQS_SHOWHOIDONGALL]
as 
begin
SELECT [MaHD] AS N'Mã HĐ'
      ,[NamHoc] as N'Năm học'
      ,[TrangThai] as N'Trạng thái'
      ,[MaK] as N'Mã khoa'
  FROM [dbo].[HoiDongNT]
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SHOWKHOA]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHQS_SHOWKHOA] 
as
begin
SELECT [MaK] AS N'Mã Khoa'
      ,[TenK] AS N'Tên Khoa'
      ,[SDT] as N'SDT'
      ,khoa.[MaCBP] as N'MaCBP'
	  ,[TenCB] as N'Tên CBP'
  FROM [dbo].[Khoa], CB_P
  where Khoa.MaCBP=CB_P.MaCBP
end
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SUADT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_SUADT]
@MaDT char(10), @TenDT nvarchar(500), @NgayBD date, @NgayNT date,@KinhPhi int,
@TienDo int, @TrangThai nvarchar(50),
@NamHoc varchar(15)
AS
BEGIN
UPDATE DETAI
   SET [TenDT] = @TenDT
      ,[NgayBD] = @NgayBD
      ,[NgayNT] = @NgayNT
      ,[KinhPhi] = @KinhPhi
      ,[TienDo] = @TienDo
      ,[TrangThai] = @TrangThai
      ,[NamHoc] = @NamHoc
 WHERE [MaDT] = @MaDT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_SUAHOIDONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHQS_SUAHOIDONG]
@MaHD char(10),
@NamHoc char(10),
@TrangThai nvarchar(50),
@MaK char(10)
as 
begin
UPDATE [dbo].[HoiDongNT]
   SET [NamHoc] = @NamHoc
      ,[TrangThai] = @TrangThai
      ,[MaK] = MaK
 WHERE MAHD=@MAHD
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_UPDATE_KINHPHI]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PKHQS_UPDATE_KINHPHI]
@KINHPHI INT,
@MADT CHAR(10)
AS
BEGIN
UPDATE DeTai
SET KinhPhi = KinhPhi+@KINHPHI
WHERE MaDT=@MADT
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_XOAHOIDONG]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[PKHQS_XOAHOIDONG]
@mahd CHAR(10)
AS 
BEGIN 
--ALTER TABLE VAITROGV NOCHECK CONSTRAINT ALL
ALTER TABLE HOIDONGNT NOCHECK CONSTRAINT ALL
DELETE FROM HOIDONGNT WHERE MAHD =@mahd
DELETE FROM VAITROGV WHERE MAHD =@mahd
DELETE FROM VAITROGV WHERE MAHD =@mahd
DELETE FROM QDTLHD WHERE MAHD =@mahd
DELETE FROM KetQuaNT WHERE MAHD =@mahd
END
GO
/****** Object:  StoredProcedure [dbo].[PKHQS_XuPhat]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PKHQS_XuPhat]
@MaVP char(10),
@noidung nvarchar(50),
@Mucdo nvarchar(50),
@hinhthuc nvarchar(50),
@MaDT char(10)
AS
BEGIN
insert XuLyViPham values(@MaVP,@noidung,@Mucdo,@hinhthuc,@MaDT,'P01')
END
GO
/****** Object:  StoredProcedure [dbo].[proc_gv_getMKhoa]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_gv_getMKhoa] @magv char(10)
as
begin
	select MaK from BoMon where MaBM in (select MaBM from GiangVien where MaGV=@magv)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getGVKTGDT]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_khoa_getGVKTGDT] @makhoa char(10)
as
begin
	select MaGV,ChucVu,TenGV from GiangVien where GiangVien.MaBM in (select MaBM from BoMon,Khoa where   BoMon.MaK = Khoa.MaK and Khoa.MaK= @makhoa) 

end
GO
/****** Object:  StoredProcedure [dbo].[SHOW_USER]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SHOW_USER]
@MAQ CHAR(10)
AS
BEGIN
if @maQ = 'Q01' (SELECT MaP FROM phongKHQS )
if @maQ ='Q02'   (SELECT MAK FROM KHOA)
if  @maQ = 'Q03'   (SELECT MABM FROM BOMON)
if  @maQ ='Q04'  (SELECT MAGV FROM GiangVien)
if @maQ ='Q05'  (SELECT MATD FROM TieuDoan)
if @maQ = 'Q06' (SELECT MADD FROM DAIDOI)
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_detai]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TieuDoan_detai]
@MaTD char(10)
AS
BEGIN
select distinct * from detai
where madt in(select madt from VaiTroHV where mahv in
(select mahv from HocVien where MaDD in
(select MaDD from DaiDoi where MaTD=@MaTD)))
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_detaikhenthuong]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TieuDoan_detaikhenthuong]
@MaTD char(10)
AS
BEGIN
select distinct * from detai
where madt in(select madt from VaiTroHV where mahv in
(select mahv from HocVien where MaDD in
(select MaDD from DaiDoi where MaTD=@MaTD)))
and madt in(select MaDT from KhenThuong)
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_detaikhenthuong_capdo]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TieuDoan_detaikhenthuong_capdo]
@MaTD char(10),
@capdo nvarchar(50)
AS
BEGIN
select distinct * from detai
where madt in(select madt from VaiTroHV where mahv in
(select mahv from HocVien where MaDD in
(select MaDD from DaiDoi where MaTD=@MaTD)))
and madt in(select MaDT from KhenThuong where CapDo=@capdo)
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_detaiXP]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TieuDoan_detaiXP]
@MaTD char(10)
AS
BEGIN
select distinct * from detai
where madt in(select madt from VaiTroHV where mahv in
(select mahv from HocVien where MaDD in
(select MaDD from DaiDoi where MaTD=@MaTD)))
and madt in(select MaDT from XuLyViPham)
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_GetHocVien]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TieuDoan_GetHocVien]
@MaTD char(10)
AS
BEGIN
select distinct * from HocVien
where MaDD in(select MaDD from DaiDoi where MaTD=@MaTD)
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_GetHocVien_ten]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TieuDoan_GetHocVien_ten]
@MaTD char(10),
@ten nvarchar(50)
AS
BEGIN
select distinct * from HocVien
where MaDD in(select MaDD from DaiDoi where MaTD=@MaTD)
and TenHV like N'%'+@ten+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_lay_dtdt_tt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TieuDoan_lay_dtdt_tt]
@MaTD char(10),
@key nvarchar(50)
AS
BEGIN
select distinct * from detai
where madt in(select madt from VaiTroHV where mahv in
(select mahv from HocVien where MaDD in
(select MaDD from DaiDoi where MaTD=@MaTD)))
and (TrangThai =@key)
END
GO
/****** Object:  StoredProcedure [dbo].[TieuDoan_tk_dt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TieuDoan_tk_dt]
@MaTD char(10),
@key nvarchar(50)
AS
BEGIN
select distinct * from detai
where madt in(select madt from VaiTroHV where mahv in
(select mahv from HocVien where MaDD in
(select MaDD from DaiDoi where MaTD=@MaTD)))
and (TenDT like '%'+@key+'%')
END
GO
/****** Object:  StoredProcedure [dbo].[vaitrohvThamgiadt]    Script Date: 10/17/2023 9:52:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[vaitrohvThamgiadt]
@MaDT char(10)
AS
BEGIN
select distinct dt.mahv as 'Mã HV',tenHV as 'Tên HV', vaitro as 'Vai trò của học viên'
from HocVien as dt,VaiTroHV
where dt.MaHV=VaiTroHV.MaHV and MaDT=@MaDT
END
GO
