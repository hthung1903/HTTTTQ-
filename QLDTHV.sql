USE [QLDeTai]
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaBB]    Script Date: 1/11/2023 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TuTangMaBB]()
RETURNs nvarchar(20)
AS 
BEGIN 
DECLARE @mabb NVARCHAR(10)
	
SELECT @mabb = MABB FROM BaiBaoKH
IF @mabb IS NULL
SET @mabb = 0
ELSE 
SELECT @mabb = MAX(CONVERT(INT, substring(MABB,3,len(MABB)-2))) FROM BaiBaoKH
SELECT @mabb = CASE
	WHEN @mabb >=0 AND @mabb <9 THEN  'BB00'+CONVERT(CHAR,@mabb +1)
	WHEN @mabb >=9 AND @mabb <99 THEN  'BB0'+CONVERT(CHAR,@mabb +1)
	WHEN @mabb >=99  THEN 'BB'+CONVERT(CHAR,@mabb +1)
	
	END 
RETURN @mabb

END
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaDT]    Script Date: 1/11/2023 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TuTangMaDT]()
RETURNs nvarchar(20)
AS 
BEGIN 
DECLARE @madt NVARCHAR(10)
	
SELECT @madt = MADT FROM dbo.DeTaiNCKH
IF @madt IS NULL
SET @madt = 0
ELSE 
SELECT @madt = MAX(CONVERT(INT, substring(MADT,3,len(MADT)-2))) FROM dbo.DeTaiNCKH
SELECT @madt = CASE
	WHEN @madt >=0 AND @madt <9 THEN  'DT00'+CONVERT(CHAR,@madt +1)
	WHEN @madt >=9 AND @madt <99 THEN  'DT0'+CONVERT(CHAR,@madt +1)
	WHEN @madt >=99  THEN 'DT'+CONVERT(CHAR,@madt +1)
	
	END 
RETURN @madt

END
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaGV]    Script Date: 1/11/2023 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TuTangMaGV]()
RETURNs nvarchar(10)
AS 
BEGIN 
DECLARE @magv NVARCHAR(10)
	
SELECT @magv = MAGV FROM dbo.GV
IF @magv IS NULL
SET @magv = 0
ELSE 
SELECT @magv = MAX(CONVERT(INT, substring(MAGV,3,len(MAGV)-2))) FROM dbo.GV
SELECT @magv = CASE
	WHEN @magv >=0 AND @magv <9 THEN  'GV00'+CONVERT(CHAR,@magv +1)
	WHEN @magv >=9 AND @magv <99 THEN  'GV0'+CONVERT(CHAR,@magv +1)
	WHEN @magv >=99  THEN 'GV'+CONVERT(CHAR,@magv +1)
	
	END 
RETURN @magv

END
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaHD]    Script Date: 1/11/2023 10:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TuTangMaHD]()
RETURNs nvarchar(20)
AS 
BEGIN 
DECLARE @mahd NVARCHAR(10)
	
SELECT @mahd = MAHD FROM HoiDong
IF @mahd IS NULL
SET @mahd = 0
ELSE 
SELECT @mahd = MAX(CONVERT(INT, substring(MAHD,3,len(MAHD)-2))) FROM HoiDong
SELECT @mahd = CASE
	WHEN @mahd >=0 AND @mahd <9 THEN  'HD00'+CONVERT(CHAR,@mahd +1)
	WHEN @mahd >=9 AND @mahd <99 THEN  'HD0'+CONVERT(CHAR,@mahd +1)
	WHEN @mahd >=99  THEN 'HD'+CONVERT(CHAR,@mahd +1)
	
	END 
RETURN @mahd

END
GO
/****** Object:  Table [dbo].[BaiBaoKH]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiBaoKH](
	[MABB] [char](10) NOT NULL,
	[ChuyenNganh] [nvarchar](50) NULL,
	[NgayDang] [date] NULL,
	[TapChi] [nvarchar](50) NULL,
	[MDT] [char](10) NULL,
	[TenBaiBao] [nvarchar](max) NULL,
	[Link] [char](60) NULL,
	[XacNhan] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MABB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOMON]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOMON](
	[MABM] [char](10) NOT NULL,
	[TenBM] [nvarchar](50) NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[MACN] [char](10) NULL,
	[MAKHOA] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MABM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeTaiNCKH]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeTaiNCKH](
	[MADT] [char](10) NOT NULL,
	[ChuyenNganh] [nvarchar](50) NULL,
	[Cap] [nvarchar](50) NULL,
	[NgayBD] [date] NULL,
	[NgayNT] [date] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[LoaiSP] [nvarchar](50) NULL,
	[MABM] [char](10) NULL,
	[TienDo] [int] NULL,
	[MAHD] [char](10) NULL,
	[KetQua] [nvarchar](20) NULL,
	[TenDT] [nvarchar](max) NULL,
	[KinhPhi] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MADT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GV](
	[MAGV] [char](10) NOT NULL,
	[TenGV] [nvarchar](50) NULL,
	[NS] [date] NULL,
	[GioiTinh] [char](10) NULL,
	[CapBac] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[DTL] [float] NULL,
	[MABM] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GVTGDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GVTGDT](
	[MAGV] [char](10) NULL,
	[MADT] [char](10) NULL,
	[Vaitro] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GVThamGiaHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GVThamGiaHD](
	[MHD] [char](10) NULL,
	[MGV] [char](10) NULL,
	[Vaitro] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GVVietBB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GVVietBB](
	[MBB] [char](10) NULL,
	[MGV] [char](10) NULL,
	[Vaitro] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDong]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDong](
	[MAHD] [char](10) NOT NULL,
	[SQDThanhLap] [nvarchar](50) NULL,
	[Cap] [nvarchar](50) NULL,
	[MaKhoa] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[MAKHOA] [char](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[MACN] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAKHOA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenND]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenND](
	[ID] [int] NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [char](20) NULL,
	[Passwords] [char](20) NULL,
	[MGV] [char](10) NULL,
	[MQ] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BaiBaoKH] ([MABB], [ChuyenNganh], [NgayDang], [TapChi], [MDT], [TenBaiBao], [Link], [XacNhan]) VALUES (N'BB001     ', N'Công nghệ thông tin', CAST(N'2022-05-16' AS Date), N'SCOPUS Journals', N'DT001     ', N'Vulnerabilities 1', N'https://www.google.com/                                     ', N'Đã xác minh')
INSERT [dbo].[BaiBaoKH] ([MABB], [ChuyenNganh], [NgayDang], [TapChi], [MDT], [TenBaiBao], [Link], [XacNhan]) VALUES (N'BB002     ', N'An toàn thông tin', CAST(N'2021-09-20' AS Date), N'SCOPUS Journals', N'DT004     ', N'Top Ten Most Critical Web Application Vulnerabilities', N'https://www.google.com/                                     ', N'Đã xác minh')
INSERT [dbo].[BaiBaoKH] ([MABB], [ChuyenNganh], [NgayDang], [TapChi], [MDT], [TenBaiBao], [Link], [XacNhan]) VALUES (N'BB003     ', N'Khoa học máy tính', CAST(N'2021-07-29' AS Date), N'SCOPUS Journals', N'DT011     ', N'A non-bypassable process wrapping technology. In Proceeding of the 19th IEEE International Conference on Distributed Computing
Systems', N'https://www.google.com/                                     ', N'Đã xác minh')
INSERT [dbo].[BaiBaoKH] ([MABB], [ChuyenNganh], [NgayDang], [TapChi], [MDT], [TenBaiBao], [Link], [XacNhan]) VALUES (N'BB004     ', N'An toàn thông tin', CAST(N'2021-07-12' AS Date), N'LQDT magazine', N'DT004     ', N'Advanced SQL Injection', N'https://www.google.com/                                     ', N'Đã xác minh')
INSERT [dbo].[BaiBaoKH] ([MABB], [ChuyenNganh], [NgayDang], [TapChi], [MDT], [TenBaiBao], [Link], [XacNhan]) VALUES (N'BB005     ', N'An Toàn thông tin', CAST(N'2021-10-10' AS Date), N'LQDT magazine', N'DT005     ', N'Advanced SQL Injection', N'https://www.google.com/                                     ', N'Đã xác minh')
INSERT [dbo].[BaiBaoKH] ([MABB], [ChuyenNganh], [NgayDang], [TapChi], [MDT], [TenBaiBao], [Link], [XacNhan]) VALUES (N'BB006     ', N'Hệ thống thông tin', CAST(N'2022-10-04' AS Date), N'SCOPUS Journals', N'DT013     ', N'Creating and Maintaining Software that Resists Malicious Attack.', N'https://www.facebook.com                                    ', N'Đã xác minh')
INSERT [dbo].[BaiBaoKH] ([MABB], [ChuyenNganh], [NgayDang], [TapChi], [MDT], [TenBaiBao], [Link], [XacNhan]) VALUES (N'BB007     ', N'Công nghệ thôn tin', CAST(N'2021-05-06' AS Date), N'LQDT magazine', N'DT026     ', N'Stored Procedures are Bad, O’kay? TSQLrand: Preventing SQL Injection Attacks', N'https://www.google.com                                      ', N'Đã xác minh')
GO
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM01      ', N'An toàn thông tin', N'Tầng 22, nhà S1, Học viện Kỹ thuật Quân sự', N'GV001     ', N'K01       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM02      ', N'Hệ thống thông tin', N'Tầng 19, nhà S1, Học viện Kỹ thuật Quân sự', N'GV002     ', N'K01       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM03      ', N'Khoa học máy tính', N'Tầng 17, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV003     ', N'K01       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM04      ', N'Công nghệ phần mềm', N'Tầng 21, nhà S1, Học viện Kỹ thuật Quân sự', N'GV004     ', N'K01       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM05      ', N'Công nghệ mạng', N'Tầng 21, nhà S1, Học viện Kỹ thuật Quân sự', N'GV005     ', N'K01       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM06      ', N'Toán tin', N'Tầng 12, nhà S1, Học viện Kỹ thuật Quân sự', N'GV006     ', N'K01       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM07      ', N'Công trình quốc phòng', N'Nhà H7, Học viện Kỹ thuật Quân sự', N'GV007     ', N'K02       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM08      ', N'Cầu đường sân bay', N'Nhà H7, Học viện Kỹ thuật Quân sự', N'GV008     ', N'K02       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM09      ', N'Xây dựng nhà và công trình công nghiệp', N' Tầng 3, nhà S1, Học viện Kỹ thuật Quân sự', N'GV009     ', N'K02       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM10      ', N'Trắc địa bản đồ', N'Tầng 4, nhà S1, Học viện Kỹ thuật Quân sự', N'GV010     ', N'K03       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM11      ', N'Phòng hoá', N'Tầng 8, nhà S1, Học viện Kỹ thuật Quân sự', N'GV011     ', N'K04       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM12      ', N'Công nghệ vật liệu', N' Tầng 5, nhà S1, Học viện Kỹ thuật Quân sự', N'GV012     ', N'K05       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM13      ', N'Cơ sở kỹ thuật công trình', N'Nhà H7, Học viện Kỹ thuật Quân sự', N'GV013     ', N'K02       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM14      ', N'Đạn', N'Tầng 9, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV014     ', N'K06       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM15      ', N'Tác chiến điện tử', N'Tầng 13, Nhà S1, Học viện Kỹ thuật quân sự', N'GV015     ', N'K07       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM16      ', N'Thông tin', N'Tầng 20, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV016     ', N'K07       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM17      ', N'Tâm lý học Quân sự', N'Tầng 10, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV017     ', N'K08       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM18      ', N'Chiến thuật', N'Tầng 22, nhà S1, Học viện Kỹ thuật Quân sự', N'GV018     ', N'K08       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM19      ', N'Tư tưởng Hồ Chí Minh', N'Tầng 9, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV019     ', N'K09       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM20      ', N'Tiếng Anh', N'Tầng 10, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV020     ', N'K10       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM21      ', N'Tiếng Nga', N'Tầng 9, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV021     ', N'K10       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM22      ', N'Triết học', N'Tầng 21, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV022     ', N'K09       ')
INSERT [dbo].[BOMON] ([MABM], [TenBM], [DiaDiem], [MACN], [MAKHOA]) VALUES (N'BM23      ', N'Vũ khí', N'Tầng 19, nhà S1, Học viện Kỹ thuật Quân sự', N'GV033     ', N'K06       ')
GO
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT001     ', N'An toàn thông tin', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM01      ', 100, N'HD001     ', N'Khá', N'Nghiên cứu và phát triển hệ thống phát hiện xâm nhập', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT002     ', N'Công nghệ phần mềm', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM04      ', 100, N'HD001     ', N'Xuất sắc', N'Nghiên cứu các thuật toán tìm kiếm ảnh theo nội dung, xây dựng hệ thống hỗ trợ tra cứu bằng hình ảnh', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT003     ', N'Tác chiến điện tử', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM01      ', 100, N'HD001     ', N'Khá', N'Một số kỹ thuật phát hiện thay đổi trên dữ liệu viễn thám', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT004     ', N'An toàn thông tin', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM01      ', 100, N'HD001     ', N'Giỏi', N'Nghiên cứu và phát triển công cụ kiểm thử an toàn thông tin Website', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT005     ', N'Hệ thống thông tin', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM02      ', 100, N'HD009     ', N'Đạt', N'Nghiên cứu dự báo khoảng và ứng dụng trong bài toán dự báo lượng mưa', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT006     ', N'Trắc địa bản đồ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM10      ', 100, N'HD002     ', N'Khá', N'Phát triển các thuật toán định vị, lập bản đồ, ứng dụng trong điều khiển tự động', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT007     ', N'Khoa học máy tính', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM03      ', 100, N'HD003     ', N'Xuất sắc', N'Xây dựng hệ thống hỗ trợ tìm kiếm và đối sánh các văn bản luật', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT008     ', N'Khoa học máy tính', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM03      ', 100, N'HD003     ', N'Khá', N'Nghiên cứu, xây dựng hệ thống thu thập dữ liệu phục vụ phòng chống xâm nhập', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT009     ', N'Khoa học máy tính', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM03      ', 100, N'HD003     ', N'Đạt', N'Nghiên cứu, xây dựng hệ thống thu thập dữ liệu phục vụ phòng chống xâm nhập', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT010     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Đang làm', N'Phần mềm', N'BM01      ', 0, N'HD003     ', N'Chưa xếp loại', N'Nghiên cứu giải pháp định danh đối tượng IoT dựa t', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT011     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Mô hình', N'BM23      ', 100, N'HD004     ', N'Khá', N'Thiết kế súng phóng lựu sử dụng đạn M79 theo nguyên lý đẩy nòng', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT012     ', N'Vũ khí', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Phần mềm', N'BM23      ', 0, N'HD004     ', N'Chưa xếp loại', N'Xây dựng chương trình tính toán điều khiển hỏa lực pháo 105mm lắp trên phương tiện cơ động', 400000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT013     ', N'Phòng hoá', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Hoá chất', N'BM11      ', 100, N'HD005     ', N'Xuất sắc', N'Điều chế nitroxenlulo có hàm lượng nitro cao từ xe', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT014     ', N'Cầu đường sân bay', N'Nhà nước', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM08      ', 100, N'HD006     ', N'Đạt', N'Nghiên cứu ảnh hưởng của một số yếu tố đến rung động của cầu xe', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT015     ', N'Cơ sở kĩ thuật công trình', N'Nhà nước', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM13      ', 100, N'HD006     ', N'Chưa đạt', N'Thiết kế, chế tạo mô hình xe tự hành vận chuyển tr', 500000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT016     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM01      ', 0, N'HD001     ', N'Xuất sắc', N'Phần mềm quản lý nhân viên', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT018     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, N'HD002     ', N'Chưa xếp loại', N'Nghiên cứu các thuật toán tìm kiếm ảnh theo nội dung, xây dựng hệ thống hỗ trợ tra cứu bằng hình ảnh', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT019     ', N'An toàn thông tin', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM02      ', 100, N'HD001     ', N'Giỏi', N'Nghiên cứu và phát triển công cụ kiểm thử an toàn thông tin Website', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT020     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và phát triển công cụ kiểm thử an toàn thông tin Website', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT021     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2019-04-05' AS Date), CAST(N'2020-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM01      ', 100, N'HD009     ', N'Xuất sắc', N'Nghiên cứu giải pháp định danh đối tượng IoT dựa trên kỹ thuật phân tích lưu lượng mạng', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT022     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2020-04-05' AS Date), CAST(N'2021-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM03      ', 100, N'HD009     ', N'Khá', N'Nghiên cứu xây dựng một số mô hình  mạng học sâu hỗ trợ chẩn đoán ung thư tuyến tiền liệt', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT024     ', N'Công nghệ thông tin', N'BQP', CAST(N'2020-04-05' AS Date), CAST(N'2021-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM05      ', 100, NULL, N'Đạt', N'Nghiên cứu ứng dụng trí tuệ nhân tạo trong phát hiện tấn công chiếm quyền điều khiển mạng IOT', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT025     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu phương pháp tự động nhận dạng lệnh Tiếng Việt, ứng dụng trong điều khiển một số thiết bị bằng giọng nói
', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT026     ', N'An toàn thông tin', N'Học viện', CAST(N'2018-04-05' AS Date), CAST(N'2019-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM02      ', 100, N'HD008     ', N'Khá', N'Nghiên cứu phát triển framework khai thác lỗ hổng', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT027     ', N'Vũ khí', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM23      ', 0, NULL, N'Chưa xếp loại', N'Bài toán cơ bản thuật phóng trong cho súng bộ binh', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT028     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM02      ', 100, N'HD001     ', N'Khá', N'Thiết kế Hệ chuyên gia y tế hỗ trợ phát hiện sớm bệnh COVID-19 giúp ngăn ngừa nguy cơ lây nhiễm cho các cơ sở trường học ở Việt Nam', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT029     ', N'Vô tuyến điện tử', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Phần mềm', N'BM15      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, thiết kế thiết bị gây nhiễu đường thông tin số liệu dải sóng cực ngắn', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT032     ', N'Vũ khí', N'Học viện', CAST(N'2019-04-05' AS Date), CAST(N'2020-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM23      ', 100, N'HD006     ', N'Đạt', N'Nghiên cứu, chế tạo thiết kế giá súng tự động cho súng 12.7mm', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT033     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2017-04-05' AS Date), CAST(N'2018-04-05' AS Date), N'Đã hoàn thành', N'Phần mềm', N'BM23      ', 100, N'HD006     ', N'Chưa đạt', N'Nghiên cứu lắp đặt pháo 105mm lên xe M548', 300000)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT034     ', N'Đạn', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Đang làm', N'Chưa có', N'BM14      ', 0, N'HD006     ', N'Chưa xếp loại', N'Tính toán thiết kế đạn bắn hai môi trường 7,62x39m', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT035     ', N'Công nghệ thông  tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Đang làm', N'Phần mềm', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nhận diện dáng đi', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT036     ', N'Công nghệ vật liệu', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Đang làm', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Mô phỏng quá trình nhiệt luyện chi tiết sử dụng ph', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT037     ', N'Công nghệ vật liệu', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Đang làm', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu tối ưu hóa công nghệ ủ hợp kim nhôm B95', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT038     ', N'Công nghệ vật liệu', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM09      ', 100, NULL, N'Chưa xếp loại', N'Ảnh hưởng của nhiệt luyện đến tổ chức và tính chất', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT039     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ảnh hưởng của nhiệt luyện đến tổ chức v', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT040     ', N'Cơ điện tử', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu mô phỏng số các cơ cấu tự động hóa tron', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT041     ', N'Phòng hoá', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM08      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, thiết kế, chế tạo máy sản xuất nhanh p', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT042     ', N'Cơ điện tử', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Mô hình hóa toán học và tối ưu hóa quy trình công ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT043     ', N'Cơ điện tử', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu các mô hình công nghệ trong công nghệ t', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT044     ', N'Cơ điện tử', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu tối ưu hóa hình học khi thiết kế các ch', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT045     ', N'Cơ điện tử', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Ứng dụng phần tử tiếp xúc trong tính toán bền mối', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT046     ', N'Cơ điện tử', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Hiệu ứng Coriolis trong các cơ hệ dao động 2 bậc t', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT047     ', N'Công nghệ vật liệu', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Phát triển phần tử dầm mới cho phân tích dầm FGM c', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT048     ', N'Công nghệ vật liệu', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Phân tích uốn tĩnh dầm FGM có chiều dày thay đổi b', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT049     ', N'Công trình quốc phòng', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM05      ', 0, NULL, N'Chưa xếp loại', N'Tính toán động lực học của máy đào thủy lực trên n', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT050     ', N'Cầu đường sân bay', N'BQP', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM06      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ứng xử Nhiệt – Cơ của cặp dầm dạng chữ ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT051     ', N'Công trình quốc phòng', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM05      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, thiết kế phương tiện cá nhân “xanh” cho người già tại các khu đô thị', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT052     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu giao thức truyền tin tốc độ cao giữa máy tính và FPGA phục vụ bài toán ngăn chặn tấn công mạng', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT053     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu xây dựng máy ảo cho hệ thống sản xuất thông minh dựa trên công nghệ digital-twins', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT054     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Xây dựng hệ thống đo lường đánh giá loại bỏ tín hiệu nhiễu đồng pha trong thu nhận tín hiệu y sinh', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT055     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thiết kế mô hình laser công suất thấp hỗ trợ điều trị cai nghiện ma túy', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT056     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, N'HD012     ', N'Chưa xếp loại', N'Nghiên cứu phương pháp kiểm tra cân bằng nhanh sàng lọc cho rối loạn tiền đình', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT057     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu các phương pháp đánh giá độ cứng của nước dùng trong y tế', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT058     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và xây dựng thuật toán tính chỉ số SUV trên hệ thống PET/CT trên cơ sở dữ liệu DICOM', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT059     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu nâng cao chất lượng lấy mẫu nén trong tạo ảnh cộng hưởng từ song song (pMRI) sử dụng công cụ lập trình matlab', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT060     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Xây dựng hệ thống đo lường đánh giá loại bỏ tín hiệu nhiễu đồng pha trong thu nhận tín hiệu y sinh', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT061     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu xây dựng hệ thống tự động phân tích đánh giá biến thiên nhịp tim', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT062     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Thiết kế Hệ chuyên gia y tế hỗ trợ phát hiện sớm bệnh COVID-19 giúp ngăn ngừa nguy cơ lây nhiễm cho các cơ sở trường học ở Việt Nam', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT063     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Thiết kế Hệ chuyên gia y tế hỗ trợ chẩn đoán một số bệnh về da phổ biến ở Việt Nam', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT064     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Mô phỏng thuật toán tái tạo ảnh hai chiều trong thiết bị chụp cắt lớp quang kết hợp', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT065     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Thiết kế phần mềm quản lý thư viện hình ảnh phục vụ khám nội soi Tai Mũi Họng', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT066     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, thiết kế chế tạo thiết bị phát hiện cảnh báo sớm cơn buồn ngủ thông qua thu nhận và phân tích tín hiệu PPG', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT067     ', N'Điện tử y sinh', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu chế tạo thử nghiệm mô đun gắn kit TC04-SESTAMIBI dùng trong xạ hình tưới máu cơ tim', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT068     ', N'Công trình quốc phòng', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM05      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu khả năng ứng dụng phương pháp đo sâu điện để sơ bộ xác định vị trí các công trình ngầm hiện có nhằm phục vụ cho công tác điều tra khảo sát phục vụ quy hoạch, thiết kế và thi công các công trình ở khu vực quần đảo Trường Sa', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT069     ', N'Cầu đường sân bay', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM06      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ảnh hưởng của một số yếu tố đến rung động của cầu xe', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT070     ', N'Vũ khí', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM12      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thiết kế, mô phỏng nguyên lý làm việc của hệ thống trợ lực thủy lực dẫn động điều khiển lắp đặt lên Mô hình xe tăng T-55', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT071     ', N'Vũ khí ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM12      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thiết kế, mô phỏng nguyên lý làm việc của hệ thống khí nén lắp đặt lên Mô hình xe tăng T-55', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT072     ', N'Cơ điện tử', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và ứng dụng thuật toán định vị, dẫn đường cho robot', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT073     ', N'Cơ điện tử', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu mô phỏng quá trình khởi động động cơ tua bin khí DO90 trên tàu Gepard 3.9', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT074     ', N'Cơ điện tử', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Mô hình hóa động lực học hệ robot song song 2 tầng', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT075     ', N'Cơ điện tử', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM13      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu giải pháp điều khiển robot tự hành theo quỹ đạo định trước', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT076     ', N'Cơ điện tử', N'BQP', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM13      ', 100, NULL, N'Khá', N'Tổng hợp bộ điều khiển robot song song Hexapod', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT077     ', N'Tác chiến điện tử', N'BQP', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM11      ', 100, NULL, N'Xuất sắc', N'Nghiên cứu, phát triển hệ thống robot giám sát an ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT078     ', N'Cơ điện tử', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM13      ', 100, NULL, N'Đạt', N'Nghiên cứu thiết kế, chế tạo mẫu robot di động sử dụng các thuật toán tự động định vị và di chuyển theo kế hoạch', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT079     ', N'Cơ điện tử', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM13      ', 100, NULL, N'Khá', N'Nghiên cứu phát triển thuật toán điều khiển robot tự hành dựa trên phản hồi âm thanh', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT080     ', N'Cơ điện tử', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM13      ', 100, NULL, N'Khá', N'Phát triển hệ thống điều khiển cho xe tự hành 3 bánh cấu trúc (1,1)', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT081     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM12      ', 100, NULL, N'Đạt', N'Nghiên cứu, thiết kế chế tạo mẫu Robot chiến đấu sử dụng mô hình súng tiểu liên AK-47', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT082     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM12      ', 100, NULL, N'Chưa đạt', N'Nghiên cứu, thiết kế mô hình giám sát, điều khiển phục vụ cho diễn tập đối kháng của bộ binh', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT083     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM12      ', 100, NULL, N'Khá', N'Nghiên cứu quỹ đạo chuyển động của ngư lôi với các góc phóng ban đầu khác nhau', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT084     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM12      ', 100, NULL, N'Xuất sắc', N'Nghiên cứu và mô phỏng hoạt động của hệ thống giải tính trên xe bệ phóng CПУ-Эtổ hợp tên lửa РУБЭЖ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT085     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM12      ', 100, NULL, N'Đạt', N'Nghiên cứu xây dựng thiết bị đồng bộ cự ly đài điều khiển tên lửa C125-2TM trên cơ sở công nghệ vi xử lý', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT086     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM12      ', 100, NULL, N'Giỏi', N'Thiết kế thiết bị kiểm tra đánh giá chất lượng và hỗ trợ sửa chữa máy phát điện trên tàu Hải quân', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT087     ', N'Vũ khí', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM12      ', 100, NULL, N'Giỏi', N'Nghiên cứu thiết kế hệ thống điều khiển và giám sát đèn hàng hải trên tàu Hải quân', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT088     ', N'Cầu đường sân bay', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM06      ', 100, NULL, N'Giỏi', N'Nghiên cứu sức chịu tải của nền đất có xét tới hệ số áp lực ngang', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT089     ', N'Phòng hoá', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM08      ', 100, NULL, N'Xuất sắc', N'Nghiên cứu tổng hợp axit Cyanuric và dẫn xuất từ ure', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT090     ', N'Phòng hoá', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM08      ', 100, NULL, N'Chưa đạt', N'Nghiên cứu chế tạo vật liệu trên cơ sở hệ hợp chất Fe/Ca/CaO và định hướng ứng dụng xử lý các dẫn xuất halogen trong đất', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT091     ', N'Phòng hoá', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM08      ', 100, NULL, N'Khá', N'Nghiên cứu tổng hợp và ứng dụng một số chất ức chế bay hơi hiệu năng cao trên cơ sở các muối của dẫn xuất cyclohexyl amine và các axit hữu cơ trong bảo vệ, ức chế ăn mòn kim loại', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT092     ', N'Phòng hoá', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM08      ', 100, NULL, N'Khá', N'Nghiên cứu tổng hợp một số dẫn xuất của Indole, ứng dụng trong công nghệ dược phẩm', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT093     ', N'Phòng hoá', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM08      ', 100, NULL, N'Giỏi', N'Nghiên cứu ảnh hưởng của copolymer nhiệt dẻo lên tính chất cơ lý của nhựa epoxy DER331', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT094     ', N'Phòng hoá', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM08      ', 100, NULL, N'Giỏi', N'Nghiên cứu tổng hợp vật liệu Mxene/ferrite (Ni, Co) composite ứng dụng trong hấp thụ sóng radar', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT095     ', N'Phòng hoá', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM08      ', 0, NULL, N'Chưa xếp loại', N'Tổng hợp vật liệu hỗn hợp oxit trên cơ sở Cu, Co và Fe ứng dụng làm xúc tác hoạt hóa phân hủy chất ô nhiễm hữu cơ trong nước', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT096     ', N'Phòng hoá', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM08      ', 0, NULL, N'Chưa xếp loại', N'Tổng hợp vật liệu compozit oxit Fe,Cu/N/C trên nền cacbon felt (CF) ứng dụng làm catot cho Fenton điện hóa để phân hủy chất ô nhiễm hữu cơ trong nước', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT097     ', N'Phòng hoá', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM08      ', 0, NULL, N'Chưa xếp loại', N'Tổng hợp vật liệu lai Bi2MoO6/Bi-BTC ứng dụng làm xúc tác quang phân hủy chất ô nhiễm hữu cơ trong nước', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT098     ', N'Phòng hoá', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM08      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu biến tính Hydrotalcite sử dụng làm vật liệu xúc tác cho phản ứng oxi hóa các hợp chất hữu cơ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT099     ', N'Phòng hoá', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM08      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu tổng hợp Thiobenzamide sử dụng lưu huỳnh nguyên tố', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT100     ', N'Phòng hoá', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM08      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ảnh hưởng của chiếu sáng đến đặc trưng nhạy khí của các vật liệu ZnO và NiO có cấu trúc nano', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT101     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu xây dựng hệ thống tấn công tự động ứng dụng trí tuệ nhân tạo', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT102     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu xây dựng hệ thống hỗ trợ đọc sách cho người khiếm thị sử dụng trí tuệ nhân tạo', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT103     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Xây dựng chương trình phát hiện bất thường cho bộ dữ liệu chuỗi thời gian ứng dụng trong an ninh mạng máy tính', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT104     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và xây dựng hệ thống cảnh báo truy cập các nguồn tài nguyên độc hại', 0)
GO
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT105     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu phát triển thiết bị mã hoá đường truyền cho camera IP trên nền tảng máy tính nhúng hiệu năng cao', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT106     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, xây dựng hệ thống kiểm thử và khai thác lỗ hổng bảo mật IoT', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT107     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu xây dựng hệ thống phát hiện mã độc trong luồng dữ liệu mã hoá', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT108     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Quản lý chữ ký số phi tập trung sử dụng công nghệ blockchain', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT109     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, phát triển hệ thống giám sát và cảnh báo tấn công mạng thời gian thực dựa trên công nghệ AI', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT120     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và ứng dụng các giao thức trao đổi khoá ứng dụng trong chat an toàn', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT121     ', N'Công nghệ phần mềm', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM03      ', 0, NULL, N'Chưa xếp loại', N'Xây dựng hệ thống số hóa tài liệu', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT122     ', N'Công nghệ phần mềm', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM03      ', 0, NULL, N'Chưa xếp loại', N'Phát hiện mục tiêu trên ảnh vệ tính', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT123     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Bảo vệ mô hình học máy và tính riêng tư người dùng sử dụng mã hoá đồng cấu', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT124     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, xây dựng hệ thống tự động sinh dữ liệu tấn công phục vụ kiểm thử thiết bị mạng', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT125     ', N'An toàn thông tin', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM01      ', 100, NULL, N'Khá', N'Nghiên cứu xây dựng hệ thống phát hiện các hình thức tấn công nâng cao', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT126     ', N'Công nghệ phần mềm', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM03      ', 100, NULL, N'Khá', N'Nghiên cứu, xây dựng công cụ trích xuất văn bản từ ảnh camera điện thoại', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT127     ', N'Công nghệ phần mềm', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM03      ', 100, NULL, N'Khá', N'Nghiên cứu, xây dựng hệ thống hỗ trợ tư vấn luật trực tuyến', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT128     ', N'An toàn thông tin', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM01      ', 100, NULL, N'Khá', N'Xây dựng công cụ hỗ trợ giám sát hành vi độc hại trên máy tính', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT129     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM02      ', 100, NULL, N'Xuất sắc', N'Nhận dạng các hành vi bất thường trong camera giám sát', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT130     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM02      ', 100, NULL, N'Khá', N'Nghiên cứu kỹ thuật phát hiện gian lận giấy tờ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT131     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM02      ', 100, NULL, N'Xuất sắc', N'Nghiên cứu kỹ thuật học phân tán ứng dụng cho phát hiện bất thường mạng IoT', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT132     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM02      ', 100, NULL, N'Giỏi', N'Phát hiện đối tượng vi phạm từ hệ thống camera giám sát dựa trên công nghệ nhận diện khuôn mặt', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT133     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Xây dựng hệ thống nhận diện khách hàng từ camera giám sát', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT134     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thuật toán phát hiện đối tượng và ứng dụng hàng rào ảo', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT135     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu phương pháp nhận dạng người nói và tách câu sử dụng phương pháp phân tích đặc trưng giọng nói miền tần số', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT136     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và xây dựng hệ thống giám sát mạng và phát hiện mã độc phân tán', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT137     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và ứng dụng công nghệ AI trong xây dựng hệ thống phát hiện mã độc IoT phân tán', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT138     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và xây dựng hệ thống tự động pha loãng thông tin trên mạng xã hội', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT139     ', N'Công nghệ phần mềm', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM03      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu mô phỏng diễn biến quá trình hỏa lực cấp trên bắn phá chuẩn bị, phục vụ giảng dạy nội dung “Trung đội bộ binh mở cửa đánh chiếm đầu cầu”', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT140     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và triển khai một số thuật toán học máy trên SQL Server', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT141     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và xây dựng hệ thống giám sát người ra, vào đơn vị sử dụng nhận dạng dáng đi', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT142     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu giải pháp nhận dạng kết hợp khuôn mặt và hình dáng trong quản lý hành vi của lái xe', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT143     ', N'Công nghệ phần mềm', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM03      ', 0, NULL, N'Chưa xếp loại', N'Tối ưu hóa mô hình trung tâm điều phối hàng hóa và ứng dụng trong Logistics', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT144     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và xây dựng hệ thống hỏi đáp tự động', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT145     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Xây dựng hệ thống tự động phát hiện đối tượng quan tâm xuất hiện trong video dựa trên phát hiện khuôn mặt', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT146     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Xây dựng USB an toàn thu thập dữ liệu chứng cứ phục vụ điều tra số', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT147     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu các mô hình chuyển văn bản thành giọng nói (Text to Speed) cho tiếng Việt', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT148     ', N'An toàn thông tin', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM01      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu và xây dựng hệ thống mô phỏng mạng - hỗ trợ thực hành các bài thí nghiệm bảo mật mạng', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT149     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu nhiệt luyện T616 nhằm cải thiện tổ chức và cơ tính của hợp kim nhôm Al-ZN-Mg-Cu', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT150     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thử nghiệm một số đặc tính công nghệ của hệ vật liệu cát - nhựa trong sản xuất khuôn đúc', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT151     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu tổ chức và tính chất của phôi tấm hợp kim permendur 49K2ΦA làm roto và lõi cuộn dây của máy phát tuabin', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT152     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ảnh hưởng của nhiệt luyện đến tổ chức và cơ tính của thép ШX15', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT153     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Phân tích tĩnh hệ giàn phẳng và không gian bằng phương pháp phần tử hữu hạn', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT154     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu tổng hợp vật liệu nanocomposite chứa MoS2 ứng dụng trong hấp thụ sóng radar', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT155     ', N'Công nghệ vật liệu', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM09      ', 0, NULL, N'Chưa xếp loại', N'Ứng dụng phần mềm Procast mô phỏng quá trình đúc mẫu chảy', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT156     ', N'Trí tuệ nhân tạo', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM02      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ứng dụng thị giác máy (Machine Vission) đo kích thước đồng tử trong điều kiện ánh sáng nhân tạo', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT157     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Thiết kế thiết bị bắn đạn tập cho pháo DKZ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT158     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, thiết kế súng bộ binh sử dụng nhiều loại nòng (súng bộ binh đa năng)', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT159     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu tính toán một số kích thước của nòng pháo 2 lớp', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT160     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ảnh hưởng của dòng chảy rối tới hoạt động máy hãm lùi', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT161     ', N'Đạn ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM10      ', 100, NULL, N'Giỏi', N'Nghiên cứu thiết kế vũ khí không luồng phụt', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT162     ', N'Đạn ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM10      ', 100, NULL, N'Đạt', N'Thiết kế mo đun vũ khí tự động bảo vệ mục tiêu', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT163     ', N'Đạn ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM10      ', 100, NULL, N'Giỏi', N'Nghiên cứu thiết kế súng – dao kết hợp', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT164     ', N'Đạn ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM10      ', 100, NULL, N'Xuất sắc', N'Nghiên cứu phương án tích hợp một số phụ kiện lên súng tiểu liên 7,62mm AK', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT165     ', N'Đạn ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM10      ', 100, NULL, N'Giỏi', N'Nghiên cứu phương án thiết kế súng ngắn hoạt động theo nguyên lý khóa nòng tự do giữ chậm bằng năng lượng khí thuốc', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT166     ', N'Đạn ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM10      ', 100, NULL, N'Giỏi', N'Ứng dụng trí tuệ nhân tạo để nhận dạng mục tiêu và tính toán phần tử bắn đón cho pháo phòng không', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT167     ', N'Đạn ', N'Học viện', CAST(N'2021-04-05' AS Date), CAST(N'2022-04-05' AS Date), N'Đã hoàn thành', N'Chưa có', N'BM10      ', 100, NULL, N'Khá', N'Nghiên cứu thiết kế thiết bị điều khiển hỏa lực cho súng cối 100 mm đặt trên mặt đất bắn mục tiêu cố định', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT168     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Ứng dụng bộ camera nội soi để dò tìm khuyết tật cho nòng súng pháo', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT169     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu, thiết kế chế thử mô hình pháo điện tử Railgun', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT170     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu hoàn thiện thiết kế TBHL dùng cho cối 120mm, nạp đạn tự động khi lắp trên xe', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT171     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Đánh giá sai số hệ thống điều khiển hỏa lực của súng12,7 mm', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT172     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thiết kế súng 12.7 bắn đạn bông, bắn liên thanh', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT173     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thiết kế súng - đạn chống Flycam', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT174     ', N'Vũ khí', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM12      ', 0, NULL, N'Chưa xếp loại', N'Nâng cao chất lượng ảnh của hệ thống quang học mã hóa mặt sóng bằng kỹ thuật học sâu', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT175     ', N'Vũ khí', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM12      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu thiết kế mạch nguyên lý cho ngòi lựu đạn chạm nổ', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT176     ', N'Vũ khí', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM12      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu ảnh hưởng của các loại bao gói tới chất lượng đạn dược trong điều kiện sương mù muối', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT177     ', N'Vũ khí', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM12      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu mô phỏng nổ trong môi trường nước', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT178     ', N'Vũ khí', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM12      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu xác định quá tải va chạm của lựu đạn vào các mục tiêu khác nhau', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT179     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu đánh giá uy lực xuyên của đạn súng xuyên giáp 9x19 mm Snail của Cộng hòa Séc', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT180     ', N'Đạn ', N'Học viện', CAST(N'2022-04-05' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Chưa có', N'BM10      ', 0, NULL, N'Chưa xếp loại', N'Nghiên cứu phương pháp tối ưu hóa một số tham số kết cấu cho đạn xuyên lõm', 0)
INSERT [dbo].[DeTaiNCKH] ([MADT], [ChuyenNganh], [Cap], [NgayBD], [NgayNT], [TrangThai], [LoaiSP], [MABM], [TienDo], [MAHD], [KetQua], [TenDT], [KinhPhi]) VALUES (N'DT181     ', N'Công nghệ thông tin', N'Học viện', CAST(N'2022-06-06' AS Date), CAST(N'2023-04-05' AS Date), N'Chờ phê duyệt', N'Phần mềm', N'BM04      ', 0, NULL, N'Chưa xếp loại', N'Nhận diện văn bản bằng giọng nói', NULL)
GO
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV001     ', N'Hoàng Hải Anh', CAST(N'1980-05-13' AS Date), N'Nu        ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM01      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV002     ', N'Nguyễn Văn Tuấn', CAST(N'1982-05-06' AS Date), N'Nam       ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM02      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV003     ', N'Nguyễn Trung Dũng', CAST(N'1983-07-09' AS Date), N'Nam       ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV004     ', N'Nguyễn Linh Chi', CAST(N'1982-09-16' AS Date), N'Nu        ', N'Thượng tá', N'Chủ nhiệm bộ môn', 0, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV005     ', N'Trương Văn Nam', CAST(N'1985-03-23' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 4, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV006     ', N'Lê Thị Khánh Thuần', CAST(N'1982-09-24' AS Date), N'Nu        ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM06      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV007     ', N'Lê Văn Đạt', CAST(N'1980-01-01' AS Date), N'Nam       ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM07      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV008     ', N'Đoàn Dự', CAST(N'1981-05-06' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM08      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV009     ', N'Lý Thường Kiệt', CAST(N'1985-09-01' AS Date), N'Nam       ', N'Thượng tá', N'Chủ nhiệm bộ môn', 0, N'BM09      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV010     ', N'Mai Thủy Ngân', CAST(N'1987-12-24' AS Date), N'Nu        ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 4, N'BM10      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV011     ', N'Lý Bích Thủy', CAST(N'1982-07-07' AS Date), N'Nu        ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM11      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV012     ', N'Phạm Ngũ Lão', CAST(N'1980-12-01' AS Date), N'Nam       ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM12      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV013     ', N'Lý Chiêu Hoàng', CAST(N'1978-09-12' AS Date), N'Nu        ', N'Thượng tá', N'Chủ nhiệm bộ môn', 0, N'BM13      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV014     ', N'Ngô Quyền', CAST(N'1986-05-15' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM14      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV015     ', N'Lê Đại Hành', CAST(N'1985-09-01' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM15      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV016     ', N'Triệu Thị Trinh', CAST(N'1982-01-06' AS Date), N'Nu        ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM16      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV017     ', N'Phùng Ly Ly', CAST(N'1986-11-01' AS Date), N'Nu        ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM17      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV018     ', N'Hoàng Đình Khánh', CAST(N'1980-02-23' AS Date), N'Nam       ', N'Trung tá', N'Chủ nhiệm bộ môn', 0, N'BM18      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV019     ', N'Hồ Sỹ Thơm', CAST(N'1984-06-01' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM19      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV020     ', N'Nguyễn Công Mạnh', CAST(N'1986-10-01' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM20      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV021     ', N'Nguyễn Văn Chung', CAST(N'1986-05-16' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm bộ môn', 0, N'BM21      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV022     ', N'Lệnh Hồ Xung', CAST(N'1977-03-01' AS Date), N'Nam       ', N'Thượng tá', N'Chủ nhiệm bộ môn', 4, N'BM22      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV023     ', N'Trần Văn Thực', CAST(N'1990-10-10' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 15, N'BM01      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV025     ', N'Ðoàn Ðình Toàn', CAST(N'1986-08-24' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm khoa', 11, N'BM08      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV026     ', N'Ðoàn Ðình Tú', CAST(N'1970-02-20' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 19, N'BM10      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV027     ', N'Khổng Phương Thảo', CAST(N'1988-03-11' AS Date), N'Nu        ', N'Trung tá', N'Chủ nhiệm khoa', 11, N'BM01      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV028     ', N'Phạm Thị Xuân', CAST(N'1983-03-11' AS Date), N'Nu        ', N'Trung tá', N'Chủ nhiệm khoa', 9, N'BM11      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV029     ', N'Nghiêm Quang Huy', CAST(N'1977-03-11' AS Date), N'Nu        ', N'Thượng tá', N'Chủ nhiệm khoa', 9, N'BM12      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV030     ', N'Trần Bảo Trung', CAST(N'1981-03-11' AS Date), N'Nam       ', N'Thiếu tá', N'Chủ nhiệm khoa', 13, N'BM17      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV031     ', N'Ðõ Quang Hùng1', CAST(N'1978-03-11' AS Date), N'Nam       ', N'Thựơng tá', N'Chủ nhiệm khoa', 19, N'BM19      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV032     ', N'Nguyễn Quang Sang', CAST(N'1980-03-11' AS Date), N'Nam       ', N'Trung tá', N'Chủ nhiệm khoa', 9, N'BM21      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV033     ', N'Vu Hoài Anh', CAST(N'1981-03-11' AS Date), N'Nam       ', N'Thượng tá', N'Giáo viên', 56, N'BM01      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV034     ', N'Hoàng Linh Phương', CAST(N'1980-03-11' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 0, N'BM02      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV035     ', N'Duong Thị Anh', CAST(N'1984-03-11' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 13, N'BM02      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV036     ', N'Nguyễn Hồng Sơn', CAST(N'1981-03-11' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 7, N'BM02      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV037     ', N'Nguyễn Khánh Vân', CAST(N'1978-03-11' AS Date), N'Nu        ', N'Thượng tá', N'Giáo viên', 7, N'BM02      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV038     ', N'Huấn Hoa Hồng', CAST(N'1973-03-11' AS Date), N'Nu        ', N'Ðại tá', N'Giáo viên', 11, N'BM02      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV039     ', N'Lê Văn Phú', CAST(N'1985-03-11' AS Date), N'Nu        ', N'Thiếu tá', N'Giáo viên', 6, N'BM02      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV040     ', N'Trần Văn Tùng 23', CAST(N'2001-06-08' AS Date), N'Nam       ', N'thiếu tá', N'Giáo viên', 17, N'BM01      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV041     ', N'Đàm Đình Chiến', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 9, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV042     ', N'Đào Tùng Linh', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Thượng tá', N'Giáo viên', 10, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV043     ', N'Dương Quá', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 22, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV044     ', N'Hoắc Đô', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Đại úy', N'Giáo viên', 20, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV045     ', N'Tào Tháo', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 20, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV046     ', N'Vạn Phương Nam', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 16, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV047     ', N'Nhiếp Phong', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Trung úy', N'Giáo viên', 16, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV048     ', N'Vô Danh', CAST(N'1980-12-03' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 7, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV049     ', N'Chu Chỉ Nhược', CAST(N'1980-12-03' AS Date), N'Nu        ', N'Thiếu tá', N'Giáo viên', 9, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV050     ', N'Triệu Mẫn', CAST(N'1980-12-03' AS Date), N'Nu        ', N'Thượng úy', N'Giáo viên', 3, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV051     ', N'Tiểu Long Nữ', CAST(N'1980-12-03' AS Date), N'Nu        ', N'Trung úy', N'Giáo viên', 7, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV052     ', N'Triệu Chí Kính', CAST(N'1989-08-03' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 12, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV053     ', N'Mai Sư Phong', CAST(N'1985-05-17' AS Date), N'Nu        ', N'Thượng tá', N'Giáo viên', 5, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV054     ', N'Ngô Thị Minh Thư', CAST(N'1966-07-28' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 17, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV055     ', N'Hư Trúc', CAST(N'1995-11-08' AS Date), N'Nam       ', N'Đại úy', N'Giáo viên', 11, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV056     ', N'Tiêu Phong', CAST(N'1982-04-14' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 15, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV057     ', N'Hoàng Lão Tà', CAST(N'1994-07-15' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 6, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV058     ', N'Lee Min Ho', CAST(N'1977-06-05' AS Date), N'Nam       ', N'Trung úy', N'Giáo viên', 0, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV061     ', N'Triệu Lệ Dĩnh', CAST(N'1975-04-30' AS Date), N'Nu        ', N'Thượng úy', N'Giáo viên', 0, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV062     ', N'Địch Lệ Nhiệt Ba', CAST(N'1961-12-01' AS Date), N'Nu        ', N'Trung úy', N'Giáo viên', 11, N'BM04      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV063     ', N'Trần Tuấn Tú', CAST(N'1991-04-05' AS Date), N'Nam       ', N'Trung úy', N'Giáo viên', 0, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV064     ', N'Trần Mạnh Dũng', CAST(N'1996-04-05' AS Date), N'Nam       ', N'Trung úy', N'Giáo viên', 0, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV065     ', N'Lê Văn Lợi', CAST(N'1978-04-05' AS Date), N'Nam       ', N'Thượng Tá', N'Giáo viên', 0, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV066     ', N'Nguyễn Xuân Quỳnh', CAST(N'1990-04-05' AS Date), N'Nu        ', N'Thượng úy', N'Giáo viên', 16, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV067     ', N'Trần Thị Minh', CAST(N'1989-04-05' AS Date), N'Nu        ', N'Thượng úy', N'Giáo viên', 11, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV068     ', N'Trần Thị Tú', CAST(N'1987-04-05' AS Date), N'Nu        ', N'Thượng úy', N'Giáo viên', 11, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV069     ', N'nguyễn Lương Bằng', CAST(N'1985-04-05' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 9, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV070     ', N'Lê Văn Luyện', CAST(N'1986-04-05' AS Date), N'Nam       ', N'Thượng úy', N'Giáo viên', 7, N'BM05      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV071     ', N'Nông Văn Nghiệp', CAST(N'1989-04-07' AS Date), N'Nam       ', N'Thượng úy', N'Giáo viên', 7, N'BM06      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV072     ', N'Trần Thị Mẫn', CAST(N'1978-04-05' AS Date), N'Nu        ', N'Trung tá', N'Giáo viên', 11, N'BM06      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV073     ', N'Trần C', CAST(N'1979-10-10' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 20, N'BM01      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV074     ', N'Đào Mạnh Dương', CAST(N'1974-04-05' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 4, N'BM03      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV075     ', N'Hoàng Như Nghĩa', CAST(N'1973-02-02' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 5, N'BM09      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV076     ', N'Nguyễn Hải Nam', CAST(N'1979-02-06' AS Date), N'Nam       ', N'Đại úy', N'Giáo viên', 6, N'BM08      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV077     ', N'Trịnh Hoài Nam', CAST(N'1976-06-06' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 7, N'BM09      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV078     ', N'Trương Minh Tú', CAST(N'1996-08-08' AS Date), N'Nu        ', N'Trung úy', N'Giáo viên', 3, N'BM09      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV079     ', N'Nguyễn Linh Chi', CAST(N'1990-06-03' AS Date), N'Nu        ', N'Thượng úy', N'Giáo viên', 5, N'BM09      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV080     ', N'Nguyễn Nhật Linh', CAST(N'1982-03-09' AS Date), N'Nu        ', N'Đại úy', N'Giáo viên', 6, N'BM08      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV081     ', N'Khổng Nhật Nam', CAST(N'1987-06-06' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 7, N'BM09      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV082     ', N'Hà Minh Anh', CAST(N'1986-06-09' AS Date), N'Nam       ', N'Đại úy', N'Giáo viên', 4, N'BM08      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV083     ', N'Nguyễn Mạnh Hà', CAST(N'1979-09-02' AS Date), N'Nam       ', N'Trung tá', N'Giáo viên', 8, N'BM07      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV084     ', N'Huỳnh Thúc Kháng', CAST(N'1987-09-05' AS Date), N'Nam       ', N'Đại úy', N'Giáo viên', 6, N'BM07      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV085     ', N'Mạnh Thanh Nhàn', CAST(N'1986-06-01' AS Date), N'Nu        ', N'Đại úy', N'Giáo viên', 2, N'BM08      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV086     ', N'Nguyễn Lâm Thương', CAST(N'1992-06-03' AS Date), N'Nu        ', N'Thượng úy', N'Giáo viên', 0, N'BM07      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV087     ', N'Nguyễn Minh Tâm', CAST(N'1996-05-05' AS Date), N'Nu        ', N'Trung úy', N'Giáo viên', 2, N'BM13      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV088     ', N'Nguyễn Bảo An', CAST(N'1988-06-03' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 5, N'BM07      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV089     ', N'Huỳnh Minh Mạng', CAST(N'1987-08-08' AS Date), N'Nam       ', N'Thiếu tá', N'Giáo viên', 4, N'BM13      ')
INSERT [dbo].[GV] ([MAGV], [TenGV], [NS], [GioiTinh], [CapBac], [ChucVu], [DTL], [MABM]) VALUES (N'GV090     ', N'Nguyễn Như Quỳnh', CAST(N'1979-09-01' AS Date), N'Nu        ', N'Trung tá', N'Giáo viên', 6, N'BM07      ')
GO
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV069     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT016     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV049     ', N'DT016     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV041     ', N'DT020     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV040     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV040     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV023     ', N'DT009     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV073     ', N'DT010     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV073     ', N'DT026     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT026     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT022     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT026     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV052     ', N'DT181     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV048     ', N'DT181     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV069     ', N'DT181     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV074     ', N'DT181     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV040     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT001     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV025     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV026     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV027     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV028     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV029     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV030     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV031     ', N'DT002     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV032     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV035     ', N'DT003     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV036     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV037     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV038     ', N'DT004     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV039     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV041     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV042     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV043     ', N'DT005     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV044     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV045     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV046     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV047     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV048     ', N'DT006     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV049     ', N'DT006     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV050     ', N'DT006     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV051     ', N'DT007     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV052     ', N'DT007     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV053     ', N'DT007     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV054     ', N'DT008     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV055     ', N'DT008     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV056     ', N'DT009     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV057     ', N'DT010     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV058     ', N'DT011     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV061     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV062     ', N'DT008     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV063     ', N'DT012     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV064     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV065     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV066     ', N'DT013     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV067     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV068     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV069     ', N'DT014     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV070     ', N'DT014     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV071     ', N'DT015     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT015     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV026     ', N'DT035     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV071     ', N'DT035     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV070     ', N'DT035     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV009     ', N'DT036     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV075     ', N'DT036     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV076     ', N'DT036     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV078     ', N'DT036     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV079     ', N'DT037     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV080     ', N'DT037     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV081     ', N'DT037     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV077     ', N'DT038     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV008     ', N'DT095     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV025     ', N'DT095     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV076     ', N'DT095     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV080     ', N'DT096     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV082     ', N'DT097     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV013     ', N'DT076     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV083     ', N'DT076     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV087     ', N'DT078     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV084     ', N'DT078     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV089     ', N'DT079     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV088     ', N'DT079     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV086     ', N'DT080     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV085     ', N'DT037     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV090     ', N'DT037     ', N'Thành viên')
GO
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV037     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV038     ', N'DT004     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV039     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV041     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV042     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV043     ', N'DT005     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV044     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV045     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV046     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV047     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV048     ', N'DT006     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV049     ', N'DT006     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV050     ', N'DT006     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV051     ', N'DT007     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV052     ', N'DT007     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV053     ', N'DT007     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV054     ', N'DT008     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV055     ', N'DT008     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV056     ', N'DT009     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV057     ', N'DT010     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV058     ', N'DT011     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV061     ', N'DT012     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV062     ', N'DT008     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV063     ', N'DT012     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV064     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV065     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV066     ', N'DT013     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV067     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV068     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV069     ', N'DT014     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV070     ', N'DT014     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV071     ', N'DT015     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT015     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV026     ', N'DT035     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV071     ', N'DT035     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV070     ', N'DT035     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV069     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT016     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV049     ', N'DT016     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV041     ', N'DT020     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV040     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV040     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV023     ', N'DT009     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV073     ', N'DT010     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV073     ', N'DT026     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT026     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT022     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT026     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV052     ', N'DT181     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV048     ', N'DT181     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV069     ', N'DT181     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV074     ', N'DT181     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV040     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT001     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV025     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV026     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV027     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV028     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV029     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV030     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV031     ', N'DT002     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV032     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV035     ', N'DT003     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV036     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV061     ', N'DT012     ', N'Thành viên')
GO
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV070     ', N'DT035     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV009     ', N'DT036     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV075     ', N'DT036     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV076     ', N'DT036     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV078     ', N'DT036     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV079     ', N'DT037     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV080     ', N'DT037     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV081     ', N'DT037     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV077     ', N'DT038     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV008     ', N'DT095     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV025     ', N'DT095     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV076     ', N'DT095     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV080     ', N'DT096     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV082     ', N'DT097     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV013     ', N'DT076     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV083     ', N'DT076     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV087     ', N'DT078     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV084     ', N'DT078     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV089     ', N'DT079     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV088     ', N'DT079     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV086     ', N'DT080     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV085     ', N'DT037     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV090     ', N'DT037     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV040     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV033     ', N'DT001     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV025     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV026     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV027     ', N'DT001     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV028     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV029     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV030     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV031     ', N'DT002     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV032     ', N'DT002     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV035     ', N'DT003     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV036     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV037     ', N'DT003     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV038     ', N'DT004     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV039     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV041     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV042     ', N'DT004     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV043     ', N'DT005     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV044     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV045     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV046     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV047     ', N'DT005     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV048     ', N'DT006     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV049     ', N'DT006     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV050     ', N'DT006     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV051     ', N'DT007     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV052     ', N'DT007     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV053     ', N'DT007     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV054     ', N'DT008     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV055     ', N'DT008     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV056     ', N'DT009     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV057     ', N'DT010     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV058     ', N'DT011     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV061     ', N'DT012     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV062     ', N'DT008     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV063     ', N'DT012     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV064     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV065     ', N'DT012     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV066     ', N'DT013     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV067     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV068     ', N'DT013     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV069     ', N'DT014     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV070     ', N'DT014     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV071     ', N'DT015     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV072     ', N'DT015     ', N'Thành viên')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV026     ', N'DT035     ', N'Chủ nhiệm')
INSERT [dbo].[GVTGDT] ([MAGV], [MADT], [Vaitro]) VALUES (N'GV071     ', N'DT035     ', N'Thành viên')
GO
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD001     ', N'GV062     ', N'Chủ tịch')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD001     ', N'GV061     ', N'Thư ký')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD002     ', N'GV058     ', N'Thư ký')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD002     ', N'GV057     ', N'Phản biện 1')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD003     ', N'GV056     ', N'Chủ tịch')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD003     ', N'GV055     ', N'Thư ký')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD003     ', N'GV054     ', N'Phản biện 1')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD004     ', N'GV039     ', N'Chủ tịch')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD004     ', N'GV038     ', N'Thư ký')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD004     ', N'GV037     ', N'Phản biện 1')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD005     ', N'GV007     ', N'Chủ tịch')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD005     ', N'GV012     ', N'Thư ký')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD005     ', N'GV034     ', N'Phản biện 1')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD006     ', N'GV025     ', N'Chủ tịch')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD001     ', N'GV044     ', N'Thư ký')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD006     ', N'GV027     ', N'Phản biện 1')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD006     ', N'GV019     ', N'Phản biện 2')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD006     ', N'GV018     ', N'Phản biện 3')
INSERT [dbo].[GVThamGiaHD] ([MHD], [MGV], [Vaitro]) VALUES (N'HD001     ', N'GV043     ', N'Phản biện 1')
GO
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB004     ', N'GV030     ', N'Tác giả 1')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB004     ', N'GV031     ', N'Tác giả 2')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB003     ', N'GV040     ', N'Tác giả 1')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB003     ', N'GV042     ', N'Tác giả 2')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB003     ', N'GV042     ', N'Tác giả 3')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB002     ', N'GV045     ', N'Tác giả 1')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB002     ', N'GV033     ', N'Tác giả 2')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB006     ', N'GV040     ', N'Tác giả')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB002     ', N'GV052     ', N'Tác giả 4')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB001     ', N'GV005     ', N'Tác giả 2')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB001     ', N'GV010     ', N'Tác giả 3')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB001     ', N'GV022     ', N'Tác giả 4')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB001     ', N'GV044     ', N'Tác giả 5')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB004     ', N'GV033     ', N'Tác giả 1')
INSERT [dbo].[GVVietBB] ([MBB], [MGV], [Vaitro]) VALUES (N'BB007     ', N'GV033     ', N'Tác giả 1')
GO
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD001     ', N'QDTL001', N'Học viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD002     ', N'QDTL002', N'Hoc viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD003     ', N'QDTL003', N'Học viện', N'K03       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD004     ', N'QDTL004', N'Học viện', N'K04       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD005     ', N'QDTL005', N'Học viện', N'K05       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD006     ', N'QDTL006', N'Học viện', N'K06       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD007     ', N'QDTL007', N'Học viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD008     ', N'SQDTL008', N'Học viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD009     ', N'SQDTL009', N'Học viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD010     ', N'SQDTL010', N'Học viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD011     ', N'SQDTL011', N'Học viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD012     ', N'SQDTL012', N'Học viện', N'K01       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD013     ', N'SQDTL013', N'Học viện', N'K02       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD014     ', N'SQDTL014', N'Học viện', N'K02       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD015     ', N'SQDTL015', N'Học viện', N'K02       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD016     ', N'SQDTL016', N'Học viện', N'K02       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD017     ', N'SQDTL017', N'Học viện', N'K03       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD018     ', N'SQDTL018', N'Học viện', N'K03       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD019     ', N'SQDTL019', N'Học viện', N'K03       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD020     ', N'SQDTL020', N'Học viện', N'K04       ')
INSERT [dbo].[HoiDong] ([MAHD], [SQDThanhLap], [Cap], [MaKhoa]) VALUES (N'HD021     ', N'SQDTL021', N'Học viện', N'K01       ')
GO
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K01       ', N'Công nghệ thông tin', N'Tầng 19, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV023     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K02       ', N'Kỹ thuật công trình đặc biệt', N'Tầng 17, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV024     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K03       ', N'Tích hợp hệ thống', N'Tầng 18, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV025     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K04       ', N'Hoá lỹ kỹ thuật', N'Tầng 11, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV026     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K05       ', N'Cơ khí', N'Tầng 12, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV027     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K06       ', N'Vũ khí', N'Tầng 13, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV028     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K07       ', N'Vô tuyến điện tử', N'Tầng 15, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV029     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K08       ', N'Quân sự chung', N'Tầng 16, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV030     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K09       ', N'Mác-Lenin, tư tưởng Hồ Chí Minh', N'Tầng 17, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV031     ')
INSERT [dbo].[KHOA] ([MAKHOA], [TenKhoa], [DiaDiem], [MACN]) VALUES (N'K10       ', N'Ngoại ngữ', N'Tầng 10, Nhà S1, Học viện Kỹ thuật Quân sự', N'GV032     ')
GO
INSERT [dbo].[QuyenND] ([ID], [TenQuyen]) VALUES (1, N'Giáo viên')
INSERT [dbo].[QuyenND] ([ID], [TenQuyen]) VALUES (2, N'Bộ môn')
INSERT [dbo].[QuyenND] ([ID], [TenQuyen]) VALUES (3, N'Khoa')
INSERT [dbo].[QuyenND] ([ID], [TenQuyen]) VALUES (4, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserName], [Passwords], [MGV], [MQ], [ID]) VALUES (N'trantung            ', N'123                 ', NULL, 4, 1)
INSERT [dbo].[Users] ([UserName], [Passwords], [MGV], [MQ], [ID]) VALUES (N'huy                 ', N'1                   ', N'GV040     ', 1, 4)
INSERT [dbo].[Users] ([UserName], [Passwords], [MGV], [MQ], [ID]) VALUES (N'nqhuy               ', N'12                  ', N'GV023     ', 3, 8)
INSERT [dbo].[Users] ([UserName], [Passwords], [MGV], [MQ], [ID]) VALUES (N'hth                 ', N'1                   ', N'GV001     ', 2, 9)
INSERT [dbo].[Users] ([UserName], [Passwords], [MGV], [MQ], [ID]) VALUES (N'dtu                 ', N'123                 ', N'GV033     ', 1, 14)
INSERT [dbo].[Users] ([UserName], [Passwords], [MGV], [MQ], [ID]) VALUES (N'attt                ', N'123                 ', N'GV001     ', 2, 15)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[BaiBaoKH]  WITH NOCHECK ADD FOREIGN KEY([MDT])
REFERENCES [dbo].[DeTaiNCKH] ([MADT])
GO
ALTER TABLE [dbo].[BaiBaoKH]  WITH NOCHECK ADD FOREIGN KEY([MDT])
REFERENCES [dbo].[DeTaiNCKH] ([MADT])
GO
ALTER TABLE [dbo].[BOMON]  WITH NOCHECK ADD FOREIGN KEY([MAKHOA])
REFERENCES [dbo].[KHOA] ([MAKHOA])
GO
ALTER TABLE [dbo].[BOMON]  WITH NOCHECK ADD FOREIGN KEY([MAKHOA])
REFERENCES [dbo].[KHOA] ([MAKHOA])
GO
ALTER TABLE [dbo].[DeTaiNCKH]  WITH NOCHECK ADD FOREIGN KEY([MABM])
REFERENCES [dbo].[BOMON] ([MABM])
GO
ALTER TABLE [dbo].[DeTaiNCKH]  WITH NOCHECK ADD FOREIGN KEY([MABM])
REFERENCES [dbo].[BOMON] ([MABM])
GO
ALTER TABLE [dbo].[DeTaiNCKH]  WITH NOCHECK ADD FOREIGN KEY([MAHD])
REFERENCES [dbo].[HoiDong] ([MAHD])
GO
ALTER TABLE [dbo].[DeTaiNCKH]  WITH NOCHECK ADD FOREIGN KEY([MAHD])
REFERENCES [dbo].[HoiDong] ([MAHD])
GO
ALTER TABLE [dbo].[GV]  WITH NOCHECK ADD FOREIGN KEY([MABM])
REFERENCES [dbo].[BOMON] ([MABM])
GO
ALTER TABLE [dbo].[GV]  WITH NOCHECK ADD FOREIGN KEY([MABM])
REFERENCES [dbo].[BOMON] ([MABM])
GO
ALTER TABLE [dbo].[GVTGDT]  WITH NOCHECK ADD FOREIGN KEY([MADT])
REFERENCES [dbo].[DeTaiNCKH] ([MADT])
GO
ALTER TABLE [dbo].[GVTGDT]  WITH NOCHECK ADD FOREIGN KEY([MADT])
REFERENCES [dbo].[DeTaiNCKH] ([MADT])
GO
ALTER TABLE [dbo].[GVTGDT]  WITH NOCHECK ADD FOREIGN KEY([MAGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[GVTGDT]  WITH NOCHECK ADD FOREIGN KEY([MAGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[GVThamGiaHD]  WITH CHECK ADD FOREIGN KEY([MGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[GVThamGiaHD]  WITH CHECK ADD FOREIGN KEY([MGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[GVThamGiaHD]  WITH CHECK ADD FOREIGN KEY([MHD])
REFERENCES [dbo].[HoiDong] ([MAHD])
GO
ALTER TABLE [dbo].[GVThamGiaHD]  WITH CHECK ADD FOREIGN KEY([MHD])
REFERENCES [dbo].[HoiDong] ([MAHD])
GO
ALTER TABLE [dbo].[GVVietBB]  WITH NOCHECK ADD FOREIGN KEY([MBB])
REFERENCES [dbo].[BaiBaoKH] ([MABB])
GO
ALTER TABLE [dbo].[GVVietBB]  WITH NOCHECK ADD FOREIGN KEY([MBB])
REFERENCES [dbo].[BaiBaoKH] ([MABB])
GO
ALTER TABLE [dbo].[GVVietBB]  WITH NOCHECK ADD FOREIGN KEY([MGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[GVVietBB]  WITH NOCHECK ADD FOREIGN KEY([MGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[HoiDong]  WITH NOCHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KHOA] ([MAKHOA])
GO
ALTER TABLE [dbo].[HoiDong]  WITH NOCHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KHOA] ([MAKHOA])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([MGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([MGV])
REFERENCES [dbo].[GV] ([MAGV])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([MQ])
REFERENCES [dbo].[QuyenND] ([ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([MQ])
REFERENCES [dbo].[QuyenND] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[addTV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addTV] @mgv char(10) ,@madt char(10)
as
begin
	insert into GVTGDT(MADT,MAGV,Vaitro) Values(@madt,@mgv,N'Thành viên')
end
GO
/****** Object:  StoredProcedure [dbo].[baoccao]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[baoccao]
as
begin

select ROW_NUMBER() over(order by dt.TenDT) as STT, dt.TenDT, gv.TenGV, khoa.TenKhoa, dt.Cap ,300000 as Tien from  DeTaiNCKH dt, GVTGDT gvtg, GV gv, KHOA khoa, BOMON bm where dt.MADT = gvtg.MADT and gvtg.MAGV = gv.MAGV and gv.MABM = bm.MABM and bm.MAKHOA = khoa.MAKHOA and gvtg.Vaitro = N'Chủ nhiệm'
end
GO
/****** Object:  StoredProcedure [dbo].[bommon_layGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bommon_layGV] @mabm char(10)
as
begin
	select * from GV where MABM = @mabm
end
GO
/****** Object:  StoredProcedure [dbo].[bommon_xoaGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bommon_xoaGV] @mgv char(10)
as
begin
	delete from GV where MAGV = @mgv
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_cnDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bomon_lay_cnDT] @mabm char(10), @vaitro nvarchar(MAX)
as
begin
	select distinct(GV.MAGV), GV.TenGV,GVTGDT.MADT, DeTaiNCKH.TenDT from GV, GVTGDT, DeTaiNCKH where GV.MABM = @mabm and GV.MAGV = GVTGDT.MAGV and GVTGDT.MADT = DeTaiNCKH.MADT and GVTGDT.Vaitro = @vaitro
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dsdt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bomon_lay_dsdt]  @mabm char(10)
as
begin
	select* from DeTaiNCKH where DeTaiNCKH.MABM = @mabm
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_cap_tt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bomon_lay_dtdt_cap_tt] @mabm char(10), @cap nvarchar(50),@tt nvarchar(50)
as
begin
	select * from DeTaiNCKH where (DeTaiNCKH.MABM  = @mabm and  DeTaiNCKH.Cap = @cap and TrangThai = @tt)
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_theocap]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bomon_lay_dtdt_theocap] @mabm char(10), @cap nvarchar(50)
as
begin
	select * from DeTaiNCKH where (DeTaiNCKH.MABM  = @mabm and  DeTaiNCKH.Cap = @cap)
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_lay_dtdt_tt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bomon_lay_dtdt_tt] @mabm char(10), @cap nvarchar(50),@tt nvarchar(50)
as
begin
	select * from DeTaiNCKH where (DeTaiNCKH.MABM  = @mabm and  TrangThai = @tt)
end
GO
/****** Object:  StoredProcedure [dbo].[bomon_tk_dt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bomon_tk_dt] @mabm char(10),@tenDT nvarchar(MAX)
as
begin
	select * from DeTaiNCKH where DeTaiNCKH.TenDT = @tenDT and DeTaiNCKH.MABM   = @mabm  
end
GO
/****** Object:  StoredProcedure [dbo].[checkGVTGDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkGVTGDT] @magv char(10)
as
begin
	select * from DeTaiNCKH where  FORMAT (getdate(), 'dd-MM-yyyy') < NgayNT and MADT in (select MADT from GVTGDT where MAGV= @magv)
end
GO
/****** Object:  StoredProcedure [dbo].[DanhNhap]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DanhNhap] @userName char(20),@passwords char(20)
as
begin
	select MGV,TenQuyen from Users join QuyenND on Users.MQ = QuyenND.ID where Passwords = @passwords and UserName = @userName 
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteGV1]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteGV1] @magv nvarchar(10)
as
begin
DELETE FROM dbo.DANGNHAP 
WHERE MGV = @magv
UPDATE dbo.BOMON SET MACN = NULL WHERE MACN =@magv
UPDATE dbo.KHOA SET MACN = NULL  WHERE MACN= @magv
DELETE FROM dbo.GVTGDT WHERE dbo.GVTGDT.MAGV = @magv
DELETE FROM dbo.GVThamGiaHD WHERE dbo.GVThamGiaHD.MGV = @magv
DELETE FROM dbo.GVVietBB WHERE dbo.GVVietBB.MGV = @magv
DELETE FROM dbo.GV WHERE gv.MAGV =@maGV
end
GO
/****** Object:  StoredProcedure [dbo].[deleteResearch]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[deleteResearch] @mdt char(10)
	as
	begin
		delete from DeTaiNCKH where MADT = @mdt
		delete from GVTGDT where MADT = @mdt
	end
GO
/****** Object:  StoredProcedure [dbo].[filterResearchTT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[filterResearchTT] @tt nvarchar(50)
as
begin
	select * from DeTaiNCKH where TrangThai= @tt
end
GO
/****** Object:  StoredProcedure [dbo].[getAllBB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllBB] 
as
begin
	select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
	NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where XacNhan = N'Đã xác minh'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllBBByMGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllBBByMGV] @mgv char(10)
as
begin
	select MABB as N'Mã bài báo', TenBaiBao as N'Tên bài báo',ChuyenNganh as N'Chuyên ngành',NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',MDT as N'Mã đề tài',Link,XacNhan as N'Xác nhận' from BaiBaoKH where MABB in (select MBB from GVVietBB where MGV = @mgv)
end
GO
/****** Object:  StoredProcedure [dbo].[getAllDTByMagv]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllDTByMagv] @ma char(10)
as
begin
	select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where MADT in (select MADT from GVTGDT where MAGV = @ma)
end
GO
/****** Object:  StoredProcedure [dbo].[getAllDTbyNam]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllDTbyNam] @year char(10)
as
begin
	select * from DeTaiNCKH where year(NgayBD) = @year
end
GO
/****** Object:  StoredProcedure [dbo].[getALLDTKTG]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getALLDTKTG]
as
begin
	select MADT from DeTaiNCKH where MADT not in (select MADT from GVTGDT)
end
GO
/****** Object:  StoredProcedure [dbo].[getAllGVByMDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllGVByMDT] @mdt char(10)
as
begin
	select GV.MAGV,TenGV,NS,GioiTinh,CapBac,ChucVu,Vaitro from GV join (select Vaitro,TenDT,MAGV,GVTGDT.MADT from GVTGDT join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT) as TG on GV.MAGV=TG.MAGV where MADT = @mdt
end
GO
/****** Object:  StoredProcedure [dbo].[getAllResearch]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllResearch]
as
begin
	select MADT as N'Mã đề tài',TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH order by year(NgayNT) desc 
end
GO
/****** Object:  StoredProcedure [dbo].[getCNByMADT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCNByMADT] @madt char(10)
as
begin
	select ChuyenNganh from DeTaiNCKH where MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[getDTKHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getDTKHD] @mk char(10)
as
begin
	select MADT from DeTaiNCKH where MAHD  is NULL and Cap = N'Học viện' and MABM in (select MABM from  BOMON where MAKHOA = @mk) and TrangThai=N'Đang làm'
end
GO
/****** Object:  StoredProcedure [dbo].[getGVKTGDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getGVKTGDT]
as
begin
	select MAGV,ChucVu from (select MAGV,ChucVu from GV where MAGV  in (select MAGV from GVTGDT  join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  where convert(date,DeTaiNCKH.NgayNT,102) < convert(date,getdate(),102) and MAGV not in(select MAGV from GVTGDT  join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  where convert(date,DeTaiNCKH.NgayNT,102) > convert(date,getdate(),102))) or MAGV not in (select MAGV from GVTGDT)) as ts where MAGV not in(select MGV from GVThamGiaHD)
end
GO
/****** Object:  StoredProcedure [dbo].[getGVKTGDTBYMK]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getGVKTGDTBYMK] @makhoa char(10)
as
begin
	select MAGV,ChucVu from (select GV.MAGV,GV.MABM, GV.ChucVu from GV where MAGV  in (select MAGV from GVTGDT  join 
DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  where convert(date,DeTaiNCKH.NgayNT,102) < convert(date,getdate(),102) 
and MAGV not in(select MAGV from GVTGDT  join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  
where convert(date,DeTaiNCKH.NgayNT,102) > convert(date,getdate(),102))) or MAGV not in (select MAGV from GVTGDT))  as ts 
where MAGV not in (select MGV from GVThamGiaHD) and ts.MABM in (select MABM from BOMON,KHOA where BOMON.MAKHOA = KHOA.MAKHOA and KHOA.MAKHOA= @makhoa)
end
GO
/****** Object:  StoredProcedure [dbo].[getMABM]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMABM] @mgv char(10)
as
begin
	select MABM from BOMON where MACN=@mgv
end
GO
/****** Object:  StoredProcedure [dbo].[getMAHDKHOA]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMAHDKHOA]
as
begin
select distinct(MHD) from GVThamGiaHD where MGV in(select MAGV from GV where MABM in(select MABM from BOMON ,KHOA where BOMON.MAKHOA=KHOA.MAKHOA ))
end
exec getMAHDKHOA
GO
/****** Object:  StoredProcedure [dbo].[getMAKHOA]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMAKHOA] @mgv char(10)
as
begin
	select MaKhoa from KHOA where MACN = @mgv
end
GO
/****** Object:  StoredProcedure [dbo].[getMDTByMAGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMDTByMAGV] @magv char(10)
as
begin
select MADT from GVTGDT where MAGV = @magv
end
GO
/****** Object:  StoredProcedure [dbo].[getMGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMGV]
as
begin
select distinct(MAGV) from GVTGDT
end
GO
/****** Object:  StoredProcedure [dbo].[getTenDTbyMADT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTenDTbyMADT] @mdt char(10)
as
begin
	select TenDT  from DeTaiNCKH where MADT = @mdt
end
GO
/****** Object:  StoredProcedure [dbo].[getTenGVbyBM]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getTenGVbyBM] @ten nvarchar(50)
as
begin
	select MAGV,TenGV from GV where MABM in (select MABM from BOMON where TenBM = @ten) and MAGV not in (select MGV from Users where MQ = 1)
end
GO
/****** Object:  StoredProcedure [dbo].[getTKBM]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTKBM]
as
begin
	select ID,DANGNHAP.MABM,UserName,Passwords,TenBM from DANGNHAP  join BOMON on DANGNHAP.MABM = BOMON.MABM
end
GO
/****** Object:  StoredProcedure [dbo].[getTKGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getTKGV]
as
begin
	select ID,MGV,UserName,Passwords,TenGV from DANGNHAP  join GV on DANGNHAP.MGV = GV.MAGV
end
GO
/****** Object:  StoredProcedure [dbo].[getTKK]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTKK]
as
begin
	select ID,DANGNHAP.MAKHOA,UserName,Passwords,TenKhoa from DANGNHAP  join KHOA on DANGNHAP.MAKHOA = KHOA.MAKHOA
end
GO
/****** Object:  StoredProcedure [dbo].[getYearBB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getYearBB]
as
begin
 select distinct(Year(NgayDang)) as Nam from BaiBaoKH order by Nam desc
end
GO
/****** Object:  StoredProcedure [dbo].[getYearDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getYearDT]
as
begin
	select distinct(Year(NgayBD)) as Nam from DeTaiNCKH order by Nam desc
end
GO
/****** Object:  StoredProcedure [dbo].[gv_addDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[gv_addDT] @ma char(10),@ten nvarchar(MAX),@cap nvarchar(20),@cn nvarchar(50),@NBG date,@NKT date,@mbm char(10), @sp nvarchar(10),@mgv char(10)
as
begin
	insert into DeTaiNCKH(MADT,TenDT,ChuyenNganh,Cap,NgayBD,NgayNT,TienDo,TrangThai,LoaiSP,MAHD,KetQua,MABM)
	values(@ma,@ten,@cn,@cap,@NBG,@NKT,0,N'Chờ duyệt','',NULL,'',@mbm)
	insert into GVTGDT(MAGV,MADT,Vaitro) 
	values(@ma,@mgv,N'Chủ nhiệm')
end
GO
/****** Object:  StoredProcedure [dbo].[gv_getTV_TG]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[gv_getTV_TG] @mdt char(10),@magv char(10)
as
begin
	select GV.MAGV,TenGV from GV,GVTGDT where GV.MAGV = GVTGDT.MAGV and MADT = @mdt and GVTGDT.MAGV <> @magv 
end
GO
/****** Object:  StoredProcedure [dbo].[GV_sua_tt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GV_sua_tt] @magv char(10),@cap nvarchar(50),@chucvu nvarchar(50),@maBM char(10)
as
begin
	update GV set Capbac = @cap, Chucvu=@chucvu, MABM = @maBM where MaGv=@magv
end
GO
/****** Object:  StoredProcedure [dbo].[GV_them_dt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GV_them_dt] 
@madt char(10),
@tendt nvarchar(MAX),
@cn nvarchar(50),
@cap nvarchar(50),
@ngaybd date,
@sp nvarchar(40),
@maBM char(10),
@sltv char,
@gv1 char(10),
@gv2 char(10),
@gv3 char(10),
@gv4 char(10),
@gv5 char(10)
as
begin
	insert into DeTaiNCKH(MADT,TenDT,ChuyenNganh,Cap,NgayBD,NgayNT,MABM,MAHD,LoaiSP,KetQua,TienDo,TrangThai)
	values(@madt,@tendt,@cn,@cap,GETDATE(),'4/5/2023',@maBM,NULL,@sp,N'Chưa xếp loại',0,N'Chờ phê duyệt')
	insert into GVTGDT(MADT,MAGV,Vaitro)
	values(@madt,@gv1,N'Chủ nhiệm')
	if @sltv = '1'
		insert into GVTGDT(MADT,MAGV,Vaitro)
		values(@madt,@gv2,N'Thành viên')
	if @sltv='2'
		insert into GVTGDT(MADT,MAGV,Vaitro)
		values(@madt,@gv2,N'Thành viên'),
			   (@madt,@gv3,N'Thành viên')
	if @sltv='3'
		insert into GVTGDT(MADT,MAGV,Vaitro)
		values(@madt,@gv2,N'Thành viên'),
			   (@madt,@gv3,N'Thành viên'),
			   (@madt,@gv4,N'Thành viên')
	if @sltv = '4'
		insert into GVTGDT(MADT,MAGV,Vaitro)
		values(@madt,@gv2,N'Thành viên'),
			  (@madt,@gv3,N'Thành viên'),
			  (@madt,@gv4,N'Thành viên'),
			  (@madt,@gv5,N'Thành viên')
end
GO
/****** Object:  StoredProcedure [dbo].[GV_viet_BB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GV_viet_BB] 
@mbb char(10),
@magv char(10),
@cn nvarchar(50),
@tc nvarchar(50),
@tenbb nvarchar(MAX),
@ngaydang date,
@vaitro nvarchar(50),
@link char(50),
@madt char(10),
@sl int,
@gv1 char(10),
@gv2 char(10),
@gv3 char(10),
@gv4 char(10)
as
begin
	insert into BaiBaoKH(MABB,TenBaiBao,TapChi,MDT,ChuyenNganh,XacNhan,NgayDang,Link)
	values(@mbb,@tenbb,@tc,@madt,@cn,N'Chờ xác minh',@ngaydang,@link)
	insert into GVVietBB(MBB,MGV,Vaitro)
	values(@mbb,@magv,@vaitro)
	if @sl = 1
		insert into GVVietBB(MBB,MGV,Vaitro)
		values(@mbb,@gv1,N'Tác giả 2')
	if @sl = 2
		insert into GVVietBB(MBB,MGV,Vaitro)
		values(@mbb,@gv1,N'Tác giả 2'),
			  (@mbb,@gv1,N'Tác giả 3')
	if @sl = 3 
		insert into GVVietBB(MBB,MGV,Vaitro)
		values(@mbb,@gv1,N'Tác giả 2'),
			  (@mbb,@gv1,N'Tác giả 3'),
			  (@mbb,@gv1,N'Tác giả 4')
	if @sl = 4 
		insert into GVVietBB(MBB,MGV,Vaitro)
		values(@mbb,@gv1,N'Tác giả 2'),
			  (@mbb,@gv1,N'Tác giả 3'),
			  (@mbb,@gv1,N'Tác giả 4'),
			  (@mbb,@gv1,N'Tác giả 5')
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT] @makhoa char(10)
as
begin
select MADT, TenDT, Cap, NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT_theo_BM]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT_theo_BM] @makhoa char(10), @bm nvarchar(50)
as
begin
select MADT, TenDT, Cap, NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where (DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa) and  BOMON.TenBM = @bm
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT_theo_BMTT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT_theo_BMTT] @makhoa char(10), @tt nvarchar(50), @bm nvarchar(50)
as
begin
select MADT, TenDT, Cap, NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where (DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa) and (DeTaiNCKH.TrangThai = @tt and BOMON.TenBM = @bm)
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT_theo_Cap]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT_theo_Cap] @makhoa char(10), @cap nvarchar(50)
as
begin
select MADT, TenDT, Cap, NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where (DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa and  DeTaiNCKH.Cap = @cap)
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT_theo_CapBM]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT_theo_CapBM] @makhoa char(10), @cap nvarchar(50), @bm nvarchar(50)
as
begin
select MADT, TenDT, Cap, NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where (DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa) and (DeTaiNCKH.Cap = cap and BOMON.TenBM = @bm)
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT_theo_CapBMTT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT_theo_CapBMTT] @makhoa char(10), @bm nvarchar(50), @cap nvarchar(50), @tt nvarchar(50)
as
begin
select MADT, TenDT,  Cap,NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where (DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa) and DeTaiNCKH.TrangThai = @tt and (BOMON.TenBM = @bm and DeTaiNCKH.Cap = @cap)
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT_theo_CapTT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT_theo_CapTT] @makhoa char(10), @cap nvarchar(50), @tt nvarchar(50)
as
begin
select MADT, TenDT, Cap, NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where (DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa) and (DeTaiNCKH.Cap = @cap and DeTaiNCKH.TrangThai = @tt)
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_AllDT_theo_TT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_AllDT_theo_TT] @makhoa char(10), @tt nvarchar(50)
as
begin
select MADT, TenDT,Cap, NgayBD, NgayNT, TrangThai, BOMON.TenBM, TienDo, KetQua from DeTaiNCKH, BOMON where (DeTaiNCKH.MABM  = BOMON.MABM and BOMON.MAKHOA = @makhoa) and  DeTaiNCKH.TrangThai = @tt
end
GO
/****** Object:  StoredProcedure [dbo].[khoa_getDTbyMGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa_getDTbyMGV] @magv char(10)
as
begin
	select MADT as N'Mã đề tài',TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',MAHD as N'Mã hội đồng' From DeTaiNCKH where MADT in (select MADT from GVTGDT where MAGV = @magv)
end
GO
/****** Object:  StoredProcedure [dbo].[NDDangNhap]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NDDangNhap] @userName char(20),@passwords char(20)
as
begin
	select MGV,TenQuyen from Users join QuyenND on Users.MQ = QuyenND.ID where Passwords = @passwords and UserName = @userName 
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_add_cn]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_add_cn] @mdt char(10),@mgv char(10)
as
begin
	insert into GVTGDT(MADT,MAGV,Vaitro) values(@mdt,@mgv,N'Chủ nhiệm')
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_add_tk]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_add_tk] @user char(20),@pass char(20),@mgv char(10),@mq char(10)
as 
begin
 insert into Users(UserName,Passwords,MGV,MQ)
 values(@user,@pass,@mgv,@mq)
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_cap_kp]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_cap_kp] 
as
begin
	update DeTaiNCKH set KinhPhi = 300000 where  TienDo=50
	

end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_delete_cn]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_delete_cn] @mdt char(10)
as
begin
	delete from GVTGDT where  MADT = @mdt
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_fillter_research]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_fillter_research] @ma char(10),@nam int,@tt nvarchar(50)
as
begin
	if @ma = '' and @nam = '' and @tt <> ''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TrangThai= @tt order by YEAR(NgayNT) desc
	if @ma = '' and @nam <> '' and @tt=''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ'
		from DeTaiNCKH where year(NgayBD) = @nam
	if @ma <> '' and @nam = '' and @tt=''
		SELECT  MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ'
		FROM dbo.DeTaiNCKH, dbo.BOMON
		WHERE  dbo.DeTaiNCKH.MABM = dbo.BOMON.MABM  AND dbo.BOMON.MAKHOA= @ma
	if @ma = '' and @nam <> '' and @tt <>''
		select  MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where year(NgayBD) = @nam and TrangThai = @tt order by YEAR(NgayNT) desc
	if @ma <> '' and @nam <> '' and @tt=''
		select  MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where MABM in (select MABM from BOMON where MAKHOA = @ma) and year(NgayBD) = @nam order by YEAR(NgayNT) desc
	if @ma <> '' and @nam = '' and @tt <> ''
		select  MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where MABM in (select MABM from BOMON where MAKHOA = @ma) and TrangThai = @tt order by YEAR(NgayNT) desc
	if @ma <> '' and @nam <> '' and @tt <>''
		select  MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where MABM in (select MABM from BOMON where MAKHOA = @ma) and TrangThai = @tt and year(NgayBD) = @nam order by YEAR(NgayNT) desc
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_fillterBB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_fillterBB] @tenKhoa nvarchar(50) , @tc nvarchar(50),@cn nvarchar(50),@nam int
as
begin
	if @tenKhoa = '' and @tc = '' and @cn = '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT)
	if @tenKhoa = '' and @tc = '' and @cn = '' and @nam <> ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where YEAR(NgayDang) = @nam
	if @tenKhoa = '' and @tc = '' and @cn <> '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where BaiBaoKH.ChuyenNganh = @cn
	if @tenKhoa = '' and @tc <> '' and @cn = '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where TapChi = @tc
	if @tenKhoa <> '' and @tc = '' and @cn = '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT)
		where MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenKhoa))
	if @tenKhoa = '' and @tc = '' and @cn <> '' and @nam <> ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where YEAR(NgayDang) = @nam and BaiBaoKH.ChuyenNganh = @cn
	if @tenKhoa = '' and @tc <> '' and @cn = '' and @nam <> ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where YEAR(NgayDang) = @nam and TapChi = @tc
 	if @tenKhoa <> '' and @tc = '' and @cn = '' and @nam <> ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where YEAR(NgayDang) = @nam and
		MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenKhoa))
	if @tenKhoa = '' and @tc <> '' and @cn <> '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where BaiBaoKH.ChuyenNganh = @cn and TapChi = @tc
	if @tenKhoa <> '' and @tc = '' and @cn <> '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where BaiBaoKH.ChuyenNganh = @cn and
		MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenKhoa))
	if @tenKhoa <> '' and @tc <> '' and @cn = '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where TapChi = @tc and
		MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenKhoa))
	if @tenKhoa = '' and @tc <> '' and @cn <> '' and @nam <> ''
	select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where YEAR(NgayDang) = @nam and BaiBaoKH.ChuyenNganh = @cn
		and TapChi = @tc
	if @tenKhoa <> '' and @tc = '' and @cn <> '' and @nam <> ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where YEAR(NgayDang) = @nam and BaiBaoKH.ChuyenNganh = @cn
		and MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenKhoa))
	if @tenKhoa <> '' and @tc <> '' and @cn <> '' and @nam = ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT) where TapChi = @tc and BaiBaoKH.ChuyenNganh = @cn and
		MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenKhoa))
	if @tenKhoa <> '' and @tc <> '' and @cn <> '' and @nam <> ''
		select MABB as N'Mã bài báo',TenBaiBao as N'Tên bài báo',MADT as N'Mã dề tài',BaiBaoKH.ChuyenNganh as N'Chuyên ngành',
		NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',Link from (BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT=DeTaiNCKH.MADT)where YEAR(NgayDang) = @nam and BaiBaoKH.ChuyenNganh = @cn and TapChi = @tc
		and MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenKhoa))
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_get_cap_dt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_get_cap_dt] @madt char(10)
as
begin
	select Cap from DeTaiNCKH where MADT= @madt
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_get_chuyennganh]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_get_chuyennganh]
as
begin
 select distinct(ChuyenNganh) from BaiBaoKH
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_get_tacgia]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_get_tacgia] @mabb char(10)
as
begin
select MAGV as N'Mã giáo viên',TenGV as N'Tên giáo viên',GioiTinh as N'Giới tính',CapBac as N'Cấp bậc',ChucVu as N'Chức vụ',Vaitro as N'Vai trò' from GV,GVVietBB where MAGV = MGV and MBB = @mabb
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_get_tc]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_get_tc]
as
begin
	select distinct(TapChi) from BaiBaoKH
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_get_year_bb]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_get_year_bb] 
as
begin
	select distinct(YEAR(NgayDang)) from BaiBaoKH order by YEAR(NgayDang) desc
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getAllDepartment]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getAllDepartment]
as
begin
	select MABM from BOMON
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getAllMaKhoa]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_getAllMaKhoa]
as
begin
 select MAKHOA,TenKhoa from KHOA
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getAllMGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getAllMGV]
as
begin
	select MAGV from GV
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getAllTK]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_getAllTK] 
as
begin
	select UserName,Passwords,MGV as N'Mã giáo viên',TenQuyen as N'Quyền' from Users join QuyenND on Users.MQ = QuyenND.ID
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getAllUser]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getAllUser]
as
begin
	select UserName from Users
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getDtbyMDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getDtbyMDT] @madt char(10)
as
begin
	select * from DeTaiNCKH where MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getNNTbyMDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getNNTbyMDT] @madt char(10)
as
begin
	select NgayNT from DeTaiNCKH where MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getTenBm]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getTenBm] @ten nvarchar(40)
as
begin
	select TenBM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa=@ten)
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getTenKhoa]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getTenKhoa] 
as
begin
	select TenKhoa from KHOA
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_getTVBYMHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_getTVBYMHD] @mahd char(10)
as
begin
	select MAGV as N'Mã giáo viên' ,TenGV as N'Tên giáo viên' ,NS as N'Năm sinh',GioiTinh as N'Giới tính',CapBac as N'Cấp bâc',ChucVu as N'Chức vụ',Vaitro as N'Vai trò' from GV join GVThamGiaHD on GV.MAGV = GVThamGiaHD.MGV where GVThamGiaHD.MHD = @mahd
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_kinh_phi]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_kinh_phi]
as
begin
	select MaDT as N'Mã đề tài',TenDT as N'Tên đề tài',KinhPhi as N'Kinh phí',TienDo as N'Tiến độ' from DeTaiNCKH
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_bb_mdt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_bb_mdt] @madt char(10)
as

begin
	select MABB as N'Mã bài báo', ChuyenNganh as N'Chuyên nghành', NgayDang as N'Ngày đăng',TapChi as N'Tạp chí',TenBaiBao as N'Tên bài báo',Link from BaiBaoKH where MDT = @madt and XacNhan = N'Đã xác minh'
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_dthd_ht]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_dthd_ht] @hd char(10)
as
begin
	select * from DeTaiNCKH where MAHD = @hd and NgayNT > getdate() 
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_dv]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_dv] @madt char(10)
as
begin
	select TenBM,TenKhoa from BOMON ,DeTaiNCKH,KHOA where DeTaiNCKH.MABM = BOMON.MABM and KHOA.MAKHOA = BOMON.MAKHOA and MADT = @madt 
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_gvTGDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_gvTGDT]
as
begin
	select GV.MAGV as N'Mã giáo viên',TenGV as N'Tên giáo viên',GioiTinh as N'Giới tính',CapBac as N'Cấp bậc',ChucVu as N'Chức vụ' from GV where MAGV in (select MAGV from GVTGDT)
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_kp_mk]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_lay_kp_mk] @tenkhoa nvarchar(50) 
as
begin
	select MaDT as N'Mã đề tài',TenDT N'Tên đề tài',KinhPhi as N'Kinh phí',TienDo as N'Tiến độ'
	from DeTaiNCKH where MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa  = @tenkhoa)) and KinhPhi is NULL
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_mk_tenK]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_mk_tenK]
as
begin
	select MAKHOA,TenKhoa from KHOA
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_ten_gv]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_ten_gv] @magv char(10)
as
begin
	select TenGV from GV where MAGV = @magv
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_ten_khoa]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_ten_khoa] @makhoa char(10)
as
begin
	select TenKhoa from KHOA where MAKHOA = @makhoa
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_lay_tt_dt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_lay_tt_dt] @madt char(10)
as
begin
	select * from DeTaiNCKH where MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_nt_dt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_nt_dt] @xeploai nvarchar(50),@madt char(10)
as
begin
	update DeTaiNCKH set KetQua = @xeploai,TrangThai = N'Đã hoàn thành' where MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_sua_tk]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_sua_tk] @user char(20) , @pass char(20)
as
begin
	update Users set Passwords=@pass where UserName = @user
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_suaHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_suaHD] @mahd char(10), @cap nvarchar(50),@makhoa char(10),@sqd nvarchar(50)
as
begin
	update HoiDong set Cap = @cap,MaKhoa = @makhoa,SQDThanhLap = @sqd where MAHD = @mahd
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_them_dt_hoidong]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pkhcn_them_dt_hoidong] @madt char(10),@mhd char(10)
as
begin
	update DeTaiNCKH set MaHD = @mhd where MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_view_listTV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_view_listTV] @madt char(10)
as
begin
	select  * from (select MAGV ,TenGV as N'Tên giáo viên',NS as N'Năm sinh',GioiTinh as N'Giới tính',CapBac as N'Cấp bậc',ChucVu as N'Chức vụ',TenBM as N'Tên bộ môn',TenKhoa as N'Tên khoa' from (select MAGV,TenGV,NS,GioiTinh,CapBac,ChucVu,TenBM,BOMON.MAKHOA from GV join BOMON on GV.MABM=BOMON.MABM) as TV join KHOA on TV.MAKHOA = KHOA.MAKHOA ) as tv where  tv.MAGV in(select MAGV from GVTGDT where MADT = @madt)
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_xoa_TK]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_xoa_TK] @username nvarchar(50)
as
begin
	delete from Users where UserName = @username
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_xoa_tv_TGDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_xoa_tv_TGDT] @magv char(10),@mdt char(10)
as
begin
	delete from GVTGDT where MADT = @mdt and MAGV = @magv
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_xuat_phieu_kq]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_xuat_phieu_kq] @year int ,@makhoa char(10)
as
begin
	select MADT as N'Tên đề tài', TenDT as N'Tên đề tài',KetQua as N'Kết quả' from DeTaiNCKH where YEAR(NgayNT) = @year and MABM in( select MABM from BOMON where MAKHOA = @makhoa)
end
GO
/****** Object:  StoredProcedure [dbo].[pkhcn_XuatKQDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pkhcn_XuatKQDT] @nam int,@ten nvarchar(50)
as
begin
	select DeTaiNCKH.MADT,TenDT,Cap,TenGV,KetQua from GV,GVTGDT, DeTaiNCKH join BOMON on DeTaiNCKH.MABM=BOMON.MABM where TrangThai =N'Đã hoàn thành' and YEAR(NgayNT) = @nam and MAKHOA in (select MAKHOA from KHOA Where TenKhoa =@ten) and GVTGDT.Vaitro =N'Chủ nhiệm' and GVTGDT.MADT=DeTaiNCKH.MADT and GVTGDT.MAGV = GV.MAGV
end
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_deleteGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_khoa_deleteGV]
@magv VARCHAR(10)
AS 
BEGIN
DELETE FROM dbo.Users 
WHERE MGV = @magv

UPDATE dbo.BOMON
SET MACN = NULL
WHERE MACN =@magv

UPDATE dbo.KHOA
SET MACN = NULL 
WHERE MACN= @magv

DELETE FROM dbo.GVTGDT
WHERE dbo.GVTGDT.MAGV = @magv

DELETE FROM dbo.GVThamGiaHD
WHERE dbo.GVThamGiaHD.MGV = @magv

DELETE FROM dbo.GVVietBB
WHERE dbo.GVVietBB.MGV = @magv

DELETE FROM dbo.GV
WHERE gv.MAGV =@maGV

END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_DSchunhiemDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_khoa_DSchunhiemDT]
@makhoa CHAR(10)
AS
BEGIN
SELECT dbo.GV.MAGV, dbo.GV.TenGV , dbo.GV.NS , dbo.GV.GioiTinh , dbo.GV.CapBac, dbo.GV.ChucVu, dbo.GV.DTL, BOMON.TenBM 
FROM dbo.GV, dbo.GVTGDT, dbo.DeTaiNCKH, dbo.BOMON
WHERE dbo.GVTGDT.MAGV = dbo.GV.MAGV AND dbo.GVTGDT.MADT= dbo.DeTaiNCKH.MADT AND dbo.GV.MABM = dbo.BOMON.MABM 
AND dbo.BOMON.MAKHOA = @makhoa AND dbo.GVTGDT.Vaitro = N'Chủ nhiệm'
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_getAllResearch]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_khoa_getAllResearch]
@makhoa NVARCHAR(10)
AS
BEGIN 
SELECT MADT, TenDT, cap, NgayBD, NgayNT, TrangThai,BOMON.TenBM, TienDo, KetQua
FROM dbo.DeTaiNCKH, dbo.BOMON
WHERE  dbo.DeTaiNCKH.MABM = dbo.BOMON.MABM  AND dbo.BOMON.MAKHOA= @makhoa
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_getAllStaff]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_khoa_getAllStaff]
@makhoa CHAR(10)
AS
BEGIN 
SELECT dbo.GV.MAGV AS N'Mã GV', dbo.GV.TenGV AS N'Họ tên', dbo.GV.NS AS N'Ngày sinh', dbo.GV.GioiTinh AS N'Giới tính',
gv.CapBac AS N'Cấp bậc', dbo.GV.ChucVu AS N'Chức vụ', gv.DTL AS N'ĐTL', dbo.BOMON.TenBM AS N'Tên bộ môn'
FROM dbo.GV, dbo.BOMON
Where gv.MABM=dbo.BOMON.MABM AND dbo.BOMON.MAKHOA = @makhoa
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_getTenkhoa]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_khoa_getTenkhoa]
@makhoa CHAR(10)
AS
BEGIN
select KHOA.TenKhoa from KHOA where KHOA.MAKHOA = @makhoa
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_insertGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_khoa_insertGV]
@magv CHAR(10),
@tengv NVARCHAR(50),
@ns DATE,
@gt NCHAR(10),
@capbac NVARCHAR(50),
@chucvu NVARCHAR(50),
@DTL FLOAT,
@tenbm nvarCHAR(50)
AS
BEGIN 
INSERT INTO dbo.GV
(
    MAGV,
    TenGV,
    NS,
    GioiTinh,
    CapBac,
    ChucVu,
    DTL,
    MABM
)
VALUES
(   @magv,        -- MAGV - char(10)
    @tengv,       -- TenGV - nvarchar(50)
    @ns, -- NS - date
    @gt,       -- GioiTinh - nchar(10)
    @capbac,       -- CapBac - nvarchar(50)
    @chucvu,       -- ChucVu - nvarchar(50)
    @DTL,       -- DTL - float
    (SELECT dbo.BOMON.MABM FROM dbo.BOMON WHERE dbo.BOMON.TenBM = @tenbm)         -- MABM - char(10)
   )
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_requestCancelResearch]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_khoa_requestCancelResearch]
@ma NVARCHAR(10)
AS 
BEGIN
UPDATE dbo.DeTaiNCKH
SET TrangThai = N'Yêu cầu hủy'  WHERE MADT = @ma 
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_thongkeBBtheoBoMon_nam]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_khoa_thongkeBBtheoBoMon_nam]
@makhoa CHAR(10),
@year INT
AS
BEGIN
SELECT TenBM AS N'Bộ môn' , COUNT(TenBaiBao) AS N'Số lượng bài báo'
FROM dbo.BaiBaoKH, dbo.BOMON, dbo.DeTaiNCKH
WHERE dbo.BaiBaoKH.MDT = dbo.DeTaiNCKH.MADT AND DeTaiNCKH.MABM = BOMON.MABM AND dbo.BOMON.MAKHOA = @makhoa AND YEAR(dbo.BaiBaoKH.NgayDang) = @year
GROUP BY TenBM
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_thongkeBBtheoCN]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_khoa_thongkeBBtheoCN]
@makhoa CHAR(10), @year nvarchar(10)
AS
BEGIN
SELECT dbo.BaiBaoKH.ChuyenNganh AS N'Chuyên ngành' , COUNT(TenBaiBao) AS N'Số Lượng'
FROM dbo.BaiBaoKH, dbo.DeTaiNCKH, dbo.BOMON
WHERE dbo.BaiBaoKH.MDT = dbo.DeTaiNCKH.MADT AND dbo.DeTaiNCKH.MABM = dbo.BOMON.MABM AND dbo.BOMON. MAKHOA = @makhoa and year(dbo.BaiBaoKH.NgayDang) = @year
GROUP BY dbo.BaiBaoKH.ChuyenNganh
ORDER BY dbo.BaiBaoKH.ChuyenNganh ASC
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_thongkeBBtheoTapChi]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_khoa_thongkeBBtheoTapChi]
@makhoa CHAR(10), @year nvarchar(10)
AS
BEGIN
SELECT dbo.BaiBaoKH.TapChi AS N'Tạp chí' , COUNT(TenBaiBao) AS N'Số Lượng'
FROM dbo.BaiBaoKH, dbo.DeTaiNCKH, dbo.BOMON
WHERE dbo.BaiBaoKH.MDT = dbo.DeTaiNCKH.MADT AND dbo.DeTaiNCKH.MABM = dbo.BOMON.MABM AND dbo.BOMON. MAKHOA = @makhoa and year(dbo.BaiBaoKH.NgayDang) = @year
GROUP BY dbo.BaiBaoKH.TapChi
ORDER BY dbo.BaiBaoKH.TapChi ASC
END
GO
/****** Object:  StoredProcedure [dbo].[prd_khoa_thongkeKQDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_khoa_thongkeKQDT]
@ma CHAR(10),
@year INT
AS
BEGIN
SELECT dbo.DeTaiNCKH.KetQua AS N'Kết quả', COUNT(dbo.DeTaiNCKH.KetQua) AS N'Số lượng'
FROM dbo.DeTaiNCKH, dbo.BOMON
WHERE dbo.DeTaiNCKH.MABM = dbo.BOMON.MABM AND dbo.BOMON.MAKHOA = @ma AND YEAR(dbo.DeTaiNCKH.NgayNT)=@year
GROUP BY dbo.DeTaiNCKH.Ketqua
END

GO
/****** Object:  StoredProcedure [dbo].[prd_Khoa_XemDSTV_Theo_MaDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_Khoa_XemDSTV_Theo_MaDT]
@ma NVARCHAR(10)
AS
BEGIN
SELECT GV.MAGV as 'Mã GV', GV.TenGV as 'Họ Tên', GVTGDT.Vaitro as 'Vai trò' FROM dbo.GVTGDT, GV WHERE MADT = @ma and GV.MAGV = GVTGDT.MAGV
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_chuyenDT_HDmoi]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_chuyenDT_HDmoi]
@mahd_cu CHAR(10),
@mahd_moi CHAR(10),
@madt CHAR(10)
AS
BEGIN
UPDATE dbo.DeTaiNCKH
SET dbo.DeTaiNCKH.MAHD = @mahd_moi
WHERE dbo.DeTaiNCKH.MADT = @madt AND dbo.DeTaiNCKH.MAHD = @mahd_cu
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_chuyenGV_HDmoi]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_chuyenGV_HDmoi]
@mahd_cu CHAR(10),
@mahd_moi CHAR(10),
@magv CHAR(10)
AS
BEGIN
UPDATE dbo.GVThamGiaHD
SET dbo.GVThamGiaHD.MHD = @mahd_moi
WHERE dbo.GVThamGiaHD.MHD = @mahd_cu AND dbo.GVThamGiaHD.MGV = @magv
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_danhsachDT_cuaHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_danhsachDT_cuaHD]
@maHD CHAR(10)
AS
BEGIN
SELECT MADT as N'Mã đề tài',TenDT as N'Tên đề tài',Cap as N'Cấp',NgayNT as N'Ngày nghiệm thu',LoaiSP as N'Loại sản phẩm' FROM dbo.DeTaiNCKH 
WHERE dbo.DeTaiNCKH.MAHD = @maHD order by NgayNT desc 
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_danhsachHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_danhsachHD]
AS
BEGIN
SELECT * from HoiDong
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_deleteResearch]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[prd_pkhcn_deleteResearch]
@ma NVARCHAR(10)
AS 
BEGIN
UPDATE dbo.BaiBaoKH
SET MDT =NULL WHERE MDT = @ma 
DELETE FROM dbo.GVTGDT 
WHERE MADT = @ma 
DELETE FROM dbo.DeTaiNCKH WHERE MADT =@ma
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_getAllStaff]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_pkhcn_getAllStaff]
@makhoa CHAR(10)
AS
BEGIN 
SELECT dbo.GV.MAGV AS N'Mã GV', dbo.GV.TenGV AS N'Họ tên', dbo.GV.NS AS N'Ngày sinh', dbo.GV.GioiTinh AS N'Giới tính',
gv.CapBac AS N'Cấp bậc', dbo.GV.ChucVu AS N'Chức vụ', gv.DTL AS N'ĐTL', dbo.BOMON.TenBM AS N'Tên bộ môn'
FROM dbo.GV, dbo.BOMON
Where gv.MABM=dbo.BOMON.MABM AND dbo.BOMON.MAKHOA = @makhoa and MAGV in(select MAGV from GVTGDT)
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_suaBB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_suaBB]
@mabb CHAR(10),
@tenBB NVARCHAR(50),
@chuyennganh NVARCHAR(50),
@ngaydang DATE,
@tapchi NVARCHAR(50),
@madt CHAR(10),
@magv char(10)
AS
BEGIN
UPDATE dbo.BaiBaoKH
SET 
TenBaiBao = @tenBB,
ChuyenNganh =@chuyennganh,
NgayDang =@ngaydang,
TapChi =@tapchi,
MDT = @madt
WHERE MABB = @mabb
update GVVietBB 
set
MGV = @magv
where MBB=@mabb
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_suaHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_suaHD]
@mahd CHAR(10),
@sqdtlap NVARCHAR(50),
@cap NVARCHAR(50)
AS
BEGIN
UPDATE dbo.HoiDong
SET SQDThanhLap = @sqdtlap,
 Cap = @cap
 WHERE MAHD = @mahd

END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_suavaitroGV_HD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_suavaitroGV_HD]
@mahd CHAR(10),
@magv CHAR(10),
@vaitro NVARCHAR(50)
AS
BEGIN
UPDATE dbo.GVThamGiaHD
SET dbo.GVThamGiaHD.Vaitro = @vaitro
WHERE dbo.GVThamGiaHD.MHD = @mahd AND
dbo.GVThamGiaHD.MGV = @magv 
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_themBB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_themBB]
@mabb CHAR(10),
@tenBB NVARCHAR(50),
@chuyennganh NVARCHAR(50),
@ngaydang DATE,
@tapchi NVARCHAR(50),
@madt CHAR(10),
@magv char(10),
@Vaitro nvarchar(10)
AS
BEGIN
INSERT INTO dbo.BaiBaoKH
(
    MABB,
    TenBaiBao,
    ChuyenNganh,
    NgayDang,
    TapChi,
    MDT
)
VALUES
(   @mabb,        -- MABB - char(10)
    @tenBB,       -- TenBaiBao - nvarchar(50)
    @chuyennganh,       -- ChuyenNganh - nvarchar(50)
    @ngaydang, -- NgayDang - date
    @tapchi,       -- TapChi - nvarchar(50)
	@madt         -- MDT - char(10)
    )
insert into GVVietBB (MBB,MGV,Vaitro)
values(@mabb,@magv,@Vaitro)

END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_themDT_vaoHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_pkhcn_themDT_vaoHD]
@mahd CHAR(10),
@madt CHAR(10)
AS
BEGIN
UPDATE dbo.DeTaiNCKH
SET dbo.DeTaiNCKH.MAHD = @mahd 
WHERE dbo.DeTaiNCKH.MADT = @madt
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_themGV_vaoHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_themGV_vaoHD]
@mahd CHAR(10),
@magv CHAR(10),
@vaitro NVARCHAR(50)
AS
BEGIN
INSERT INTO dbo.GVThamGiaHD
(
    MHD,
    MGV,
    Vaitro
)
VALUES
(   @mahd,  -- MHD - char(10)
    @magv,  -- MGV - char(10)
    @vaitro -- Vaitro - nvarchar(50)
    )
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_themHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_themHD]
@mahd CHAR(10),
@sqdtlap NVARCHAR(50),
@cap NVARCHAR(50),
@maKhoa char(10)
AS
BEGIN
INSERT INTO dbo.HoiDong
(
    MAHD,
    SQDThanhLap,
    Cap,
	MaKhoa
)
VALUES
(   @mahd,  -- MAHD - char(10)
    @sqdtlap, -- SQDThanhLap - nvarchar(50)
    @cap,
	@makhoa-- Cap - nvarchar(50)
    )
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongkeBBtheoKhoa]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_pkhcn_thongkeBBtheoKhoa]
AS
BEGIN
SELECT dbo.KHOA.TenKhoa, COUNT(DISTINCT dbo.BaiBaoKH.TenBaiBao) AS SLBB
FROM dbo.BaiBaoKH, dbo.KHOA, dbo.DeTaiNCKH, dbo.BOMON
WHERE dbo.BaiBaoKH.MDT = dbo.DeTaiNCKH.MADT AND dbo.DeTaiNCKH.MABM=dbo.BOMON.MABM AND dbo.BOMON.MAKHOA=dbo.KHOA.MAKHOA
GROUP BY dbo.KHOA.TenKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongkeBBtheoKhoa_nam]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_thongkeBBtheoKhoa_nam]
@year INT 
AS
BEGIN
SELECT dbo.KHOA.TenKhoa, COUNT(DISTINCT dbo.BaiBaoKH.TenBaiBao) AS SLBB
FROM dbo.BaiBaoKH, dbo.KHOA, dbo.DeTaiNCKH, dbo.BOMON
WHERE dbo.BaiBaoKH.MDT = dbo.DeTaiNCKH.MADT AND dbo.DeTaiNCKH.MABM=dbo.BOMON.MABM AND dbo.BOMON.MAKHOA=dbo.KHOA.MAKHOA AND year(NgayDang)=@year
GROUP BY dbo.KHOA.TenKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongkeKQDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_thongkeKQDT]
@year INT
AS
BEGIN
SELECT dbo.DeTaiNCKH.KetQua AS N'Kết quả', COUNT(dbo.DeTaiNCKH.KetQua) AS N'Số lượng'
FROM dbo.DeTaiNCKH
WHERE YEAR(dbo.DeTaiNCKH.NgayNT)=@year
GROUP BY dbo.DeTaiNCKH.Ketqua
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongkeKQDTALL]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_thongkeKQDTALL]
AS
BEGIN
SELECT dbo.DeTaiNCKH.KetQua AS N'Kết quả', COUNT(dbo.DeTaiNCKH.KetQua) AS N'Số lượng'
FROM dbo.DeTaiNCKH
WHERE YEAR(dbo.DeTaiNCKH.NgayNT) <=YEAR(getdate())
GROUP BY dbo.DeTaiNCKH.Ketqua
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongkeKQDTK]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_thongkeKQDTK]
@tenKhoa nvarchar(50)
AS
BEGIN
SELECT dbo.DeTaiNCKH.KetQua AS N'Kết quả', COUNT(dbo.DeTaiNCKH.KetQua) AS N'Số lượng'
FROM dbo.DeTaiNCKH
WHERE MABM in (select MABM from BOMON where MAKHOA in(select MAKHOA from KHOA where TenKhoa = @tenKhoa))
GROUP BY dbo.DeTaiNCKH.Ketqua
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongkeKQDTKhoa]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_thongkeKQDTKhoa]
@year INT,
@tenkhoa nvarchar(50)
AS
BEGIN
SELECT dbo.DeTaiNCKH.KetQua AS N'Kết quả', COUNT(dbo.DeTaiNCKH.KetQua) AS N'Số lượng'
FROM dbo.DeTaiNCKH
WHERE YEAR(dbo.DeTaiNCKH.NgayNT)=@year and MABM in (select MABM from BOMON where MAKHOA in (select MAKHOA from KHOA where TenKhoa = @tenkhoa))
GROUP BY dbo.DeTaiNCKH.Ketqua
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongkeSLBB_tungnam]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_thongkeSLBB_tungnam]
AS
BEGIN
SELECT YEAR(dbo.BaiBaoKH.NgayDang) AS N'Năm' , COUNT(*) AS N'Số lượng bài báo'
FROM dbo.BaiBaoKH
GROUP BY YEAR(dbo.BaiBaoKH.NgayDang)
ORDER BY YEAR(dbo.BaiBaoKH.NgayDang) ASC
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongketheoChuyenNganh]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_pkhcn_thongketheoChuyenNganh]
AS
BEGIN
SELECT ChuyenNganh AS N'Chuyên ngành' , COUNT(TenBaiBao) AS N'Số Lượng'
FROM dbo.BaiBaoKH
GROUP BY ChuyenNganh 
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_thongketheoTapChi]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[prd_pkhcn_thongketheoTapChi]
AS
BEGIN
SELECT TapChi AS N'Tạp chí' , COUNT(TenBaiBao) AS N'Số Lượng'
FROM dbo.BaiBaoKH
GROUP BY TapChi
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_xoaBB]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_xoaBB]
@mabb CHAR(10)
AS
BEGIN
DELETE FROM dbo.GVVietBB 
WHERE MBB=@mabb
DELETE FROM dbo.BaiBaoKH
WHERE MABB = @mabb
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_xoaDT_khoiHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_xoaDT_khoiHD]
@mahd CHAR(10),
@madt CHAR(10)
AS
BEGIN
UPDATE dbo.DeTaiNCKH
SET dbo.DeTaiNCKH.MAHD = NULL
WHERE dbo.DeTaiNCKH.MADT = @madt
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_xoaGV_khoiHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_xoaGV_khoiHD]
@mahd CHAR(10),
@magv CHAR(10)
AS
BEGIN
DELETE FROM dbo.GVThamGiaHD
WHERE dbo.GVThamGiaHD.MHD = @mahd AND
dbo.GVThamGiaHD.MGV = @magv 
END
GO
/****** Object:  StoredProcedure [dbo].[prd_pkhcn_xoaHD]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_pkhcn_xoaHD]
@mahd CHAR(10)
AS 
BEGIN 
UPDATE dbo.DeTaiNCKH SET dbo.DeTaiNCKH.MAHD = NULL WHERE MAHD = @mahd
DELETE FROM dbo.GVThamGiaHD WHERE MHD =@mahd
DELETE FROM dbo.HoiDong WHERE MAHD =@mahd
END
GO
/****** Object:  StoredProcedure [dbo].[prd_XemDSTV_Theo_MaDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prd_XemDSTV_Theo_MaDT]
@ma NVARCHAR(10)
AS
BEGIN
SELECT * FROM dbo.GVTGDT WHERE MADT = @ma
END
GO
/****** Object:  StoredProcedure [dbo].[pro_Khoa_getAllScientificArtical]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pro_Khoa_getAllScientificArtical] @makhoa nvarchar(10)
as
begin
select MABB as 'Mã bài báo', TenBaiBao as 'Tên bài báo', BaiBaoKH.ChuyenNganh as 'Chuyên ngành', BaiBaoKH.NgayDang as 'Ngày đăng', BaiBaoKH.TapChi as 'Tạp chí', BaiBaoKH.MDT as 'Mã đề tài' from BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT = DeTaiNCKH.MADT where DeTaiNCKH.MABM in (select BOMON.MABM from BOMON left join KHOA on BOMON.MAKHOA = KHOA.MAKHOA where KHOA.MAKHOA= @makhoa) and BaiBaoKH.XacNhan = N'Đã xác minh'
end
GO
/****** Object:  StoredProcedure [dbo].[pro_Khoa_TKPTDTBM_theo_nam]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pro_Khoa_TKPTDTBM_theo_nam] @year nvarchar(10), @makhoa nvarchar(20)
as
begin
select TenBM, count(DeTaiNCKH.MABM) as 'number of topic', cast(round(count(DeTaiNCKH.MABM)*100.0 / SUM(count(DeTaiNCKH.MABM)) over(),1) as decimal(9,1)) as 'percentage', SUM(count(DeTaiNCKH.MABM)) over() as 'Total' from DeTaiNCKH left join BOMON on DeTaiNCKH.MABM = BOMON.MABM where year(DeTaiNCKH.NgayBD) = @year and BOMON.MAKHOA = @makhoa group by DeTaiNCKH.MABM,BOMON.TenBM
end
GO
/****** Object:  StoredProcedure [dbo].[pro_pnckh_thongke_slgdt_khoa]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pro_pnckh_thongke_slgdt_khoa]
as begin
	select KHOA.TenKhoa as 'Tên khoa',count(KHOA.TenKhoa) as 'Số lượng đề tài' from (BOMON join DeTaiNCKH on BOMON.MABM = DeTaiNCKH.MABM) join KHOA on BOMON.MAKHOA = KHOA.MAKHOA group by KHOA.TenKhoa
end
GO
/****** Object:  StoredProcedure [dbo].[pro_pnckh_thongke_slgdt_khoa_theo_nam]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pro_pnckh_thongke_slgdt_khoa_theo_nam] @year nvarchar(10)
as begin
	select KHOA.TenKhoa as 'Tên khoa',count(KHOA.TenKhoa) as 'Số lượng đề tài' from (BOMON join DeTaiNCKH on BOMON.MABM = DeTaiNCKH.MABM) join KHOA on BOMON.MAKHOA = KHOA.MAKHOA where Year(DeTaiNCKH.NgayBD) = @year group by KHOA.TenKhoa
end
GO
/****** Object:  StoredProcedure [dbo].[proc_Bomon_getBB_Loc]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_Bomon_getBB_Loc] @loc nvarchar(50), @mabm char(10)
as
begin
if @loc = N'Đã xác minh'
select BaiBaoKH.MABB, BaiBaoKH.TenBaiBao, BaiBaoKH.ChuyenNganh, BaiBaoKH.TapChi, BaiBaoKH.NgayDang, BaiBaoKH.MDT, BaiBaoKH.Link, BaiBaoKH.XacNhan from BaiBaoKH, DeTaiNCKH where DeTaiNCKH.MADT = BaiBaoKH.MDT and BaiBaoKH.XacNhan = N'Đã xác minh' and DeTaiNCKH.MABM = @mabm
if @loc = N'Chưa xác minh'
select BaiBaoKH.MABB, BaiBaoKH.TenBaiBao, BaiBaoKH.ChuyenNganh, BaiBaoKH.TapChi, BaiBaoKH.NgayDang, BaiBaoKH.MDT, BaiBaoKH.Link, BaiBaoKH.XacNhan from BaiBaoKH, DeTaiNCKH where DeTaiNCKH.MADT = BaiBaoKH.MDT and BaiBaoKH.XacNhan = N'Chưa xác minh' and DeTaiNCKH.MABM = @mabm
end
GO
/****** Object:  StoredProcedure [dbo].[proc_bomon_getBBKH]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_bomon_getBBKH] @maBM char(10)
as
begin
	select * from BaiBaoKH where MDT in (select MDT from DeTaiNCKH where MABM = @maBM)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_Bomon_xmbb]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_Bomon_xmbb] @mabb char(10)
as
begin
	update BaiBaoKH set XacNhan = N'Đã xác minh' where MABB = @mabb
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_deleteTV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_deleteTV]  @magv char(10), @madt char(10)
as
begin
	delete from GVTGDT where MAGV = @magv and MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_DoiCN]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_DoiCN] @madt char(10), @magv char(10), @macn char(10)
as
begin
	UPDATE GVTGDT SET Vaitro = N'Chủ nhiệm' WHERE MAGV = @magv and MADT = @madt
	UPDATE GVTGDT SET Vaitro = N'Thành viên' WHERE MAGV = @macn and MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getBBtheoCN]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_getBBtheoCN] @chuyennganh nvarchar(50), @makhoa nvarchar(10)
as
begin
	select MABB as 'Mã bài báo', TenBaiBao as 'Tên bài báo', BaiBaoKH.ChuyenNganh as 'Chuyên ngành', BaiBaoKH.NgayDang as 'Ngày đăng', BaiBaoKH.TapChi as 'Tạp chí', BaiBaoKH.MDT as 'Mã đề tài' from BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT = DeTaiNCKH.MADT where DeTaiNCKH.MABM in (select BOMON.MABM from BOMON left join KHOA on BOMON.MAKHOA = KHOA.MAKHOA where KHOA.MAKHOA= @makhoa) and BaiBaoKH.ChuyenNganh = @chuyennganh
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getBBtheoTC]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_getBBtheoTC] @tapchi nvarchar(50), @makhoa nvarchar(10)
as
begin
	select MABB as 'Mã bài báo', TenBaiBao as 'Tên bài báo', BaiBaoKH.ChuyenNganh as 'Chuyên ngành', BaiBaoKH.NgayDang as 'Ngày đăng', BaiBaoKH.TapChi as 'Tạp chí', BaiBaoKH.MDT as 'Mã đề tài' from BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT = DeTaiNCKH.MADT where DeTaiNCKH.MABM in (select BOMON.MABM from BOMON left join KHOA on BOMON.MAKHOA = KHOA.MAKHOA where KHOA.MAKHOA= @makhoa) and BaiBaoKH.TapChi = @tapchi
end
GO
/****** Object:  StoredProcedure [dbo].[proc_Khoa_getChuyenNganhBBKH]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_Khoa_getChuyenNganhBBKH] @makhoa nvarchar(20)
as
begin
select distinct(BaiBaoKH.ChuyenNganh) as 'Chuyên ngành' from BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT = DeTaiNCKH.MADT where DeTaiNCKH.MABM in (select BOMON.MABM from BOMON left join KHOA on BOMON.MAKHOA = KHOA.MAKHOA where KHOA.MAKHOA=@makhoa)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getGVKTGDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_khoa_getGVKTGDT] @makhoa char(10)
as
begin
	select MAGV,ChucVu,TenGV from (select MAGV,ChucVu,TenGV from GV where MAGV  in (select MAGV from GVTGDT  join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  where convert(date,DeTaiNCKH.NgayNT,102) < convert(date,getdate(),102) and MAGV not in(select MAGV from GVTGDT  join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  where convert(date,DeTaiNCKH.NgayNT,102) > convert(date,getdate(),102))) or MAGV not in (select MAGV from GVTGDT) and GV.MABM in (select MABM from BOMON,KHOA where   BOMON.MAKHOA = KHOA.MAKHOA and KHOA.MAKHOA=  @makhoa)) as ts where MAGV not in (select MGV from GVThamGiaHD)

end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getMCN]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_getMCN] @madt char(10)
as
begin
select MAGV from GVTGDT where GVTGDT.Vaitro =  N'Chủ nhiệm' and MADT = @madt
end

GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getMGVTV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_getMGVTV] @madt char(10)
as
begin
select MAGV from GVTGDT where GVTGDT.Vaitro != N'Chủ nhiệm' and MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getSoLuongGVKTGDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_khoa_getSoLuongGVKTGDT] @makhoa char(10)
as
begin
	select count(MAGV) from (select MAGV from GV where MAGV  in (select MAGV from GVTGDT  join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  where convert(date,DeTaiNCKH.NgayNT,102) < convert(date,getdate(),102) and MAGV not in(select MAGV from GVTGDT  join DeTaiNCKH on GVTGDT.MADT = DeTaiNCKH.MADT  where convert(date,DeTaiNCKH.NgayNT,102) > convert(date,getdate(),102))) or MAGV not in (select MAGV from GVTGDT) and GV.MABM in (select MABM from BOMON,KHOA where BOMON.MAKHOA = KHOA.MAKHOA and KHOA.MAKHOA= @makhoa)) as ts where MAGV not in (select MGV from GVThamGiaHD)

end
GO
/****** Object:  StoredProcedure [dbo].[proc_Khoa_getTapChiBBKH]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_Khoa_getTapChiBBKH] @makhoa nvarchar(20)
as
begin
select distinct(BaiBaoKH.TapChi) from BaiBaoKH join DeTaiNCKH on BaiBaoKH.MDT = DeTaiNCKH.MADT where DeTaiNCKH.MABM in (select BOMON.MABM from BOMON left join KHOA on BOMON.MAKHOA = KHOA.MAKHOA where KHOA.MAKHOA=@makhoa)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_getTenGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_getTenGV] @magv char(10)
as
begin
	select TenGV from GV where MAGV = @magv
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_insertCNDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_insertCNDT]  @magv char(10),@madt char(10)
as
begin
	insert into GVTGDT(MAGV, MADT, Vaitro) values (@magv,@madt, N'Chủ nhiệm')
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_insertDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_insertDT] @madt char(10), @tendt nvarchar(50), @cn nvarchar(50), @cap nvarchar(50), @nnt date, @tt nvarchar(50), @lsp nvarchar(50), @tenbm nvarchar(50), @td int, @kq nvarchar(50)
as
begin 
insert into DeTaiNCKH(MADT, TenDT, ChuyenNganh, Cap, NgayBD, NgayNT,TrangThai,LoaiSP ,MABM, TienDo, KetQua ) values (@madt, @tendt,@cn, @cap, null, @nnt,@tt, @lsp, (select BOMON.MABM from BOMON where BOMON.TenBM = @tenbm ),@td,@kq)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_insertTV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_insertTV]  @magv char(10),@madt char(10)
as
begin
	insert into GVTGDT(MAGV, MADT, Vaitro) values (@magv,@madt, N'Thành viên')
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_updateDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_updateDT] @ten nvarchar(40),@sp nvarchar(40),@mdt char(10)
as
begin
update DeTaiNCKH set TenDT = @ten,                                          
                     LoaiSP = @sp  where MADT = @mdt
end
GO
/****** Object:  StoredProcedure [dbo].[proc_khoa_updateGV]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_khoa_updateGV] @ns date, @gt nvarchar(50), @cb nvarchar(50), @cv nvarchar(50), @dtl nvarchar(10), @tenbm nvarchar(50), @magv char(10)
as 
begin
update GV set NS = @ns, GioiTinh = @gt,CapBac = @cb, ChucVu = @cv, DTL = @dtl, MABM = (select BOMON.MABM from BOMON where BOMON.TenBM = @tenbm) where MAGV = @magv
end
GO
/****** Object:  StoredProcedure [dbo].[proc_Khoa_yeucauhuydt]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_Khoa_yeucauhuydt] @madt char(10)
as
begin
update DeTaiNCKH set TrangThai = N'Yêu cầu hủy' where MADT = @madt
end
GO
/****** Object:  StoredProcedure [dbo].[proc_pkhcn_getCNNN]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_pkhcn_getCNNN] @makhoa char(10)
as
begin
if @makhoa <> ''
	select distinct(GV.MAGV) as 'Mã giáo viên', GV.TenGV as 'Tên giáo viên', GV.CapBac as 'Cấp bậc', GV.ChucVu as 'Chức vụ', GV.GioiTinh as 'Giới tính' from GVTGDT, GV, DeTaiNCKH where GVTGDT.MAGV = GV.MAGV and GVTGDT.MADT = DeTaiNCKH.MADT and GVTGDT.Vaitro = N'Chủ nhiệm'  and GV.MABM in(select MABM from BOMON where MAKHOA = @makhoa)
else
	select distinct(GV.MAGV) as 'Mã giáo viên', GV.TenGV as 'Tên giáo viên', GV.CapBac as 'Cấp bậc', GV.ChucVu as 'Chức vụ', GV.GioiTinh as 'Giới tính' from GVTGDT, GV, DeTaiNCKH where GVTGDT.MAGV = GV.MAGV and GVTGDT.MADT = DeTaiNCKH.MADT and GVTGDT.Vaitro = N'Chủ nhiệm' 
end
GO
/****** Object:  StoredProcedure [dbo].[proc_pkhcn_getdtctd]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_pkhcn_getdtctd] @tiendo int,@makhoa char(10)
as
begin
if @makhoa <> ''
	select MADT as N'Mã đề tài',TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TienDo < @tiendo and MABM in(select MABM from BOMON where MAKHOA = @makhoa)
else
	select MADT as N'Mã đề tài',TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TienDo < @tiendo

end
GO
/****** Object:  StoredProcedure [dbo].[searchResearchByName]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[searchResearchByName] @tendt nvarchar(50) , @ma char(10),@tt nvarchar(50),@nam int
as
begin

		if @ma = '' and @nam = '' and @tt <> ''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TenDT Like @tendt and TrangThai= @tt order by YEAR(NgayNT) desc
	if @ma = '' and @nam <> '' and @tt=''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TenDT Like @tendt and year(NgayBD) = @nam
	if @ma <> '' and @nam = '' and @tt=''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ'
		FROM dbo.DeTaiNCKH, dbo.BOMON
		WHERE TenDT Like @tendt and  dbo.DeTaiNCKH.MABM = dbo.BOMON.MABM  AND dbo.BOMON.MAKHOA= @ma
	if @ma = '' and @nam <> '' and @tt <>''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TenDT Like @tendt and year(NgayBD) = @nam and TrangThai = @tt order by YEAR(NgayNT) desc
	if @ma <> '' and @nam <> '' and @tt=''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TenDT Like @tendt and MABM in (select MABM from BOMON where MAKHOA = @ma) and year(NgayBD) = @nam order by YEAR(NgayNT) desc
	if @ma <> '' and @nam = '' and @tt <> ''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TenDT Like @tendt and MABM in (select MABM from BOMON where MAKHOA = @ma) and TrangThai = @tt order by YEAR(NgayNT) desc
	if @ma <> '' and @nam <> '' and @tt <>''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TenDT Like @tendt and MABM in (select MABM from BOMON where MAKHOA = @ma) and TrangThai = @tt and year(NgayBD) = @nam order by YEAR(NgayNT) desc
	if @ma ='' and @nam ='' and @tt = ''
		select MADT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ' from DeTaiNCKH where TenDT Like @tendt
end
GO
/****** Object:  StoredProcedure [dbo].[updateCN]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateCN] @MGV1 char (10),@MGV2 char(10)
as
begin
	update GVTGDT set Vaitro = N'Thành viên' where MAGV = @MGV1
	update GVTGDT set Vaitro = N'Chủ nhiệm' where MAGV = @MGV2
end
GO
/****** Object:  StoredProcedure [dbo].[updateProcess]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateProcess]  @mdt char(10), @td float
as
begin
	update DeTaiNCKH set TienDo = @td where MADT = @mdt
end
GO
/****** Object:  StoredProcedure [dbo].[updateResearch]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateResearch] @tendt nvarchar(50), @CN nvarchar(50),@cap nvarchar(50),@Kq nvarchar(20),@NBD date,@NNT date,@lsp nvarchar(50),@td nvarchar(50),@tt nvarchar(50),@mdt char(10)
as
begin
	update DeTaiNCKH
	set TenDT = @tendt,ChuyenNganh=@CN,Cap = @cap,KetQua = @Kq,NgayBD = @NBD,NgayNT = @NNT,LoaiSP = @lsp,TienDo = @td,TrangThai=@tt where MADT = @mdt
end
GO
/****** Object:  StoredProcedure [dbo].[XuatDKDT]    Script Date: 1/11/2023 10:08:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[XuatDKDT] @madt char(10)
as 
begin
	select TenGV,GioiTinh,CapBac,ChucVu,Vaitro from GV ,GVTGDT where GV.MAGV = GVTGDT.MAGV and MADT = 'DT035' and Vaitro = N'Thành viên'
end
GO
