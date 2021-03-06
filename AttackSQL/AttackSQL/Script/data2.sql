
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fun_Tonghop_dathang](
	@String1 VARCHAR(100)
)
RETURNS decimal(18,0) 
AS
BEGIN
	DECLARE @result decimal(18,0) 
 set @result = convert(decimal,(select sum( isnull(b.SLXN,0)*b.DonGiaNhap*b.Heso + (isnull(b.SLXN,0)*b.DonGiaNhap*b.Heso *isnull(b.VAT,0) * isnull(b.VAT_PT,0)/100) ) as NoTT from CHAOGIA a inner join KETXUATCHAOGIA b on a.CG=b.CG where a.CG=@String1 ))
	RETURN @result
END
GO
/****** Object:  Table [dbo].[TRANGTHAI]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTHAI](
	[ID] [int] NULL,
	[TrangThai] [nvarchar](25) NULL,
	[Loai] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHSACHNHANVIEN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHSACHNHANVIEN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](3000) NULL,
	[SoDienThoai] [nvarchar](30) NULL,
	[Email] [nvarchar](100) NULL,
	[ChucVu] [int] NULL,
	[KichHoat] [nvarchar](50) NULL,
	[MaNV] [int] NULL,
	[PhanQuyen] [int] NULL,
	[TrinhDo] [nvarchar](30) NULL,
	[IDTinhTrang] [int] NULL,
	[NgayVaoCT] [datetime] NULL,
	[Full_name] [nvarchar](100) NULL,
	[Anh] [nvarchar](500) NULL,
	[Ngaysinh] [datetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[Matruycap] [nvarchar](50) NULL,
 CONSTRAINT [PK_DANHSACHNHANVIEN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUCHI]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUCHI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPO] [int] NULL,
	[IDCG] [int] NULL,
	[SoYC] [int] NULL,
	[SoCG] [int] NULL,
	[IDKhachHang] [int] NULL,
	[IDTaiKhoan] [int] NULL,
	[IDNhanVien] [int] NULL,
	[NoiDung] [nvarchar](1000) NULL,
	[Duyet] [int] NULL,
	[SoTien] [money] NULL,
	[Thoigian] [datetime] NULL,
	[Thu] [bit] NULL,
	[Chi] [bit] NULL,
	[IDNguoiDuyet] [int] NULL,
	[HoanThanh] [bit] NULL,
	[SoPhieu] [nvarchar](9) NULL,
	[TenPhieu] [int] NULL,
	[IDNCC] [int] NULL,
	[IDBP] [int] NULL,
	[ThoiGianGD] [datetime] NULL,
	[PhiCK] [decimal](18, 0) NULL,
	[IDTK_Nhan] [decimal](18, 0) NULL,
	[HinhThucTT] [nvarchar](100) NULL,
	[SoHDGTGT] [nvarchar](50) NULL,
 CONSTRAINT [PK_THUCHI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[TenVietTat] [nvarchar](20) NULL,
	[TenCongTy] [nvarchar](1000) NULL,
	[MST] [nvarchar](50) NULL,
	[DoiTuong] [nvarchar](50) NULL,
	[MucDo] [nvarchar](50) NULL,
	[NgayGDNew] [datetime] NULL,
	[SoDonHang] [int] NULL,
	[Sotien] [money] NULL,
	[DanhSachGD] [nvarchar](1000) NULL,
	[ThongTinChinh] [nvarchar](1000) NULL,
	[SoDHXN] [int] NULL,
	[DaThanhToan] [money] NULL,
	[CongNoPhaiThu] [money] NULL,
	[TuNgay] [datetime] NULL,
	[DenNgay] [datetime] NULL,
	[Email] [nvarchar](200) NULL,
	[Phone_tel] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[TaiKhoanGD] [nvarchar](100) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YEUCAUDEN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YEUCAUDEN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YC] [nvarchar](50) NULL,
	[IDKhachHang] [int] NULL,
	[TGYeuCau] [datetime] NULL,
	[TGNhanXuLy] [datetime] NULL,
	[NoiDung] [nvarchar](1000) NULL,
	[IDNhanVien] [int] NULL,
	[IDTrangThai] [int] NULL,
	[IDTakeCare] [int] NULL,
	[IDNGuoiNhan] [int] NULL,
	[FileDK] [nvarchar](500) NULL,
	[IDNguoiLH] [int] NOT NULL,
	[IDBP] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TGLap] [datetime] NULL,
 CONSTRAINT [PK_YEUCAUDEN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](100) NULL,
	[SoDu] [money] NULL,
	[SoTaiKhoan] [nvarchar](25) NULL,
	[NganHang] [nvarchar](200) NULL,
	[IDDonVi] [int] NULL,
	[SoTienDuocChuyen] [money] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ThuChi]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ThuChi]
AS
SELECT        dbo.THUCHI.ID, dbo.THUCHI.SoYC, dbo.THUCHI.SoCG, dbo.DANHSACHNHANVIEN.HoTen, dbo.TAIKHOAN.TenTaiKhoan, dbo.KHACHHANG.TenCongTy, dbo.THUCHI.NoiDung, dbo.THUCHI.Duyet, dbo.THUCHI.SoTien, 
                         dbo.THUCHI.Thoigian, dbo.THUCHI.IDKhachHang, dbo.THUCHI.IDTaiKhoan, dbo.TRANGTHAI.TrangThai, dbo.THUCHI.Thu, dbo.THUCHI.Chi, dbo.THUCHI.HoanThanh, dbo.THUCHI.IDNguoiDuyet, dbo.THUCHI.SoPhieu, 
                         dbo.THUCHI.TenPhieu, dbo.THUCHI.IDNCC, dbo.TAIKHOAN.SoTaiKhoan, dbo.YEUCAUDEN.NoiDung AS NDYC, dbo.YEUCAUDEN.IDBP, dbo.THUCHI.ThoiGianGD
FROM            dbo.THUCHI LEFT OUTER JOIN
                         dbo.YEUCAUDEN ON dbo.THUCHI.SoYC = dbo.YEUCAUDEN.ID LEFT OUTER JOIN
                         dbo.TRANGTHAI ON dbo.THUCHI.Duyet = dbo.TRANGTHAI.ID LEFT OUTER JOIN
                         dbo.DANHSACHNHANVIEN ON dbo.THUCHI.IDNhanVien = dbo.DANHSACHNHANVIEN.ID LEFT OUTER JOIN
                         dbo.TAIKHOAN ON dbo.THUCHI.IDTaiKhoan = dbo.TAIKHOAN.ID LEFT OUTER JOIN
                         dbo.KHACHHANG ON dbo.THUCHI.IDKhachHang = dbo.KHACHHANG.ID
GO
/****** Object:  Table [dbo].[DONVI]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONVI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDonVi] [nvarchar](50) NULL,
	[Loai] [tinyint] NULL,
 CONSTRAINT [PK_DONVI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KETXUATCHAOGIA]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KETXUATCHAOGIA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenVT] [nvarchar](500) NULL,
	[MaVT] [nvarchar](50) NULL,
	[Hang] [nvarchar](50) NULL,
	[IDDVT] [int] NULL,
	[SL] [float] NULL,
	[SLXN] [float] NULL,
	[DonGiaNhap] [money] NULL,
	[Heso] [float] NULL,
	[ThanhTienB] [money] NULL,
	[IDYCD] [int] NULL,
	[CG] [nvarchar](9) NULL,
	[TinhTrang] [nvarchar](500) NULL,
	[IDTrangThai] [int] NULL,
	[ChotPO] [bit] NULL,
	[VAT] [bit] NULL,
	[VAT_PT] [smallint] NULL,
	[DaTT] [bit] NULL,
	[HT] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_KetXuatChaoGia]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_KetXuatChaoGia]
AS
SELECT        dbo.KETXUATCHAOGIA.ID, dbo.KETXUATCHAOGIA.TenVT, dbo.KETXUATCHAOGIA.MaVT, dbo.KETXUATCHAOGIA.Hang, dbo.KETXUATCHAOGIA.IDDVT, dbo.KETXUATCHAOGIA.SL, dbo.KETXUATCHAOGIA.DonGiaNhap, 
                         dbo.KETXUATCHAOGIA.Heso, dbo.KETXUATCHAOGIA.IDYCD, dbo.KETXUATCHAOGIA.CG, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * dbo.KETXUATCHAOGIA.SL AS ThanhTienN, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 
                         0) * dbo.KETXUATCHAOGIA.Heso AS DGBan, ROUND(ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * dbo.KETXUATCHAOGIA.SL * dbo.KETXUATCHAOGIA.Heso, - 1) AS ThanhTienB, dbo.DONVI.TenDonVi, 
                         dbo.KETXUATCHAOGIA.TinhTrang, dbo.KETXUATCHAOGIA.IDTrangThai, ISNULL(dbo.KETXUATCHAOGIA.SLXN, 0) AS SLXN, ISNULL(dbo.KETXUATCHAOGIA.VAT, 0) AS VAT, ISNULL(dbo.KETXUATCHAOGIA.VAT_PT, 0) 
                         AS VAT_PT
FROM            dbo.KETXUATCHAOGIA LEFT OUTER JOIN
                         dbo.DONVI ON dbo.KETXUATCHAOGIA.IDDVT = dbo.DONVI.ID
GO
/****** Object:  Table [dbo].[HANGHOA]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGHOA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdNhom] [int] NULL,
	[MaHH] [nvarchar](50) NULL,
	[TenHH] [nvarchar](200) NULL,
	[Hang] [nvarchar](200) NULL,
	[Ma] [nvarchar](200) NULL,
	[ThongSo] [nvarchar](1000) NULL,
	[XuatSu] [nvarchar](100) NULL,
	[GiaNhap] [money] NULL,
	[VanChuyen] [money] NULL,
	[IDNCC] [int] NULL,
	[ThoiGian] [datetime] NULL,
	[IDNhanVien] [int] NULL,
	[TonKho] [int] NULL,
	[IDDonVi] [int] NULL,
	[TinhTrang] [nvarchar](500) NULL,
	[TaiLieu] [nvarchar](1000) NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[ConSX] [bit] NOT NULL,
	[ThongDung] [bit] NOT NULL,
	[Error] [bit] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[TGBaoHanh] [float] NULL,
	[SoDoMach] [nvarchar](500) NULL,
 CONSTRAINT [PK_HANGHOA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PO_NoiDung]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_NoiDung](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPO] [int] NULL,
	[SoPO] [nvarchar](9) NOT NULL,
	[MaDH] [nvarchar](50) NULL,
	[IDDatHang] [int] NULL,
	[GhiChu] [nvarchar](2000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAT_HANG]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAT_HANG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNCC] [int] NULL,
	[SoPhieuCG] [nvarchar](9) NULL,
	[TenVT] [nvarchar](500) NULL,
	[MaVT] [nvarchar](50) NULL,
	[Hang] [nvarchar](50) NULL,
	[IDDVT] [int] NULL,
	[SL] [float] NULL,
	[DonGiaNhap] [money] NULL,
	[ThanhTienB] [money] NULL,
	[MaDatHang] [nvarchar](50) NULL,
	[NCC] [nvarchar](500) NULL,
	[NgayCan] [datetime] NULL,
	[NgayVe] [datetime] NULL,
	[Duyet] [bit] NULL,
	[IDNguoiDay] [int] NULL,
	[HoanTat] [bit] NULL,
	[CheckPO] [bit] NULL,
	[IDNguoiDuyet] [int] NULL,
 CONSTRAINT [PK_DAT_HANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNCC] [int] NOT NULL,
	[IDNguoiLH] [int] NULL,
	[SoPO] [nvarchar](9) NOT NULL,
	[SoCG] [nvarchar](9) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[IDTrangThai] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayVe] [datetime] NULL,
	[IDNguoiXL] [int] NULL,
	[IDXuLy] [int] NULL,
	[TongTien] [money] NULL,
	[Tien_VAT] [money] NULL,
	[VC_Khac] [money] NULL,
	[ThanhToan] [money] NULL,
	[No] [money] NULL,
	[VAT] [int] NULL,
	[XL_HoaDon] [int] NULL,
	[CK] [money] NULL,
 CONSTRAINT [PK_PO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[INXNDATHANG]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create function [dbo].[INXNDATHANG]()
returns table return
SELECT DISTINCT 
                         dbo.DAT_HANG.TenVT, dbo.DAT_HANG.MaVT, dbo.HANGHOA.ThongSo, dbo.DAT_HANG.Hang, dbo.DONVI.TenDonVi, dbo.DAT_HANG.SL, dbo.DAT_HANG.DonGiaNhap, dbo.DAT_HANG.ThanhTienB, 
                         dbo.DAT_HANG.MaDatHang
FROM            dbo.HANGHOA RIGHT OUTER JOIN
                         dbo.DAT_HANG ON dbo.HANGHOA.MaHH = dbo.DAT_HANG.MaVT RIGHT OUTER JOIN
                         dbo.PO RIGHT OUTER JOIN
                         dbo.PO_NoiDung ON dbo.PO.SoPO = dbo.PO_NoiDung.SoPO ON dbo.DAT_HANG.ID = dbo.PO_NoiDung.IDDatHang LEFT OUTER JOIN
                         dbo.DONVI ON dbo.DAT_HANG.IDDVT = dbo.DONVI.ID 
GO
/****** Object:  View [dbo].[XNDATHANG]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[XNDATHANG]
AS
SELECT DISTINCT 
                         dbo.DAT_HANG.TenVT, dbo.DAT_HANG.MaVT, dbo.HANGHOA.ThongSo, dbo.DAT_HANG.Hang, dbo.DONVI.TenDonVi, dbo.DAT_HANG.SL, dbo.DAT_HANG.DonGiaNhap, dbo.DAT_HANG.ThanhTienB, dbo.DAT_HANG.MaDatHang, 
                         dbo.PO_NoiDung.SoPO, dbo.PO_NoiDung.ID
FROM            dbo.HANGHOA RIGHT OUTER JOIN
                         dbo.DAT_HANG ON dbo.HANGHOA.MaHH = dbo.DAT_HANG.MaVT RIGHT OUTER JOIN
                         dbo.PO RIGHT OUTER JOIN
                         dbo.PO_NoiDung ON dbo.PO.SoPO = dbo.PO_NoiDung.SoPO ON dbo.DAT_HANG.ID = dbo.PO_NoiDung.IDDatHang LEFT OUTER JOIN
                         dbo.DONVI ON dbo.DAT_HANG.IDDVT = dbo.DONVI.ID
GO
/****** Object:  Table [dbo].[DANHSACHNGUOILIENHE]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHSACHNGUOILIENHE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiGD] [nvarchar](50) NULL,
	[IDKhachHang] [int] NULL,
	[IDNCC] [int] NULL,
	[ChucVu] [nvarchar](50) NULL,
	[SoDD1] [nvarchar](20) NULL,
	[SoDD2] [nvarchar](20) NULL,
	[DDCongTy] [nvarchar](20) NULL,
	[Email] [nvarchar](500) NULL,
	[Conlam] [bit] NULL,
	[IDTakecare] [int] NULL,
	[TTCaNhan] [nvarchar](max) NULL,
	[TGTuongTac] [datetime] NULL,
	[IDTC] [int] NULL,
	[IDXH] [int] NULL,
 CONSTRAINT [PK_DANHSACHNGUOILIENHE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_YeuCauDen]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_YeuCauDen]
AS
SELECT        dbo.YEUCAUDEN.IDNhanVien AS IDNguoiLap, dbo.YEUCAUDEN.IDKhachHang, dbo.YEUCAUDEN.IDTrangThai, dbo.YEUCAUDEN.IDTakeCare, dbo.YEUCAUDEN.YC, dbo.YEUCAUDEN.TGYeuCau, dbo.YEUCAUDEN.TGNhanXuLy, 
                         dbo.YEUCAUDEN.NoiDung, dbo.KHACHHANG.TenCongTy, TRANGTHAI_1.TrangThai, DANHSACHNHANVIEN_1.HoTen AS TakeCare, dbo.DANHSACHNHANVIEN.HoTen AS NguoiLap, dbo.YEUCAUDEN.ID, dbo.YEUCAUDEN.FileDK, 
                         dbo.YEUCAUDEN.IDNguoiLH, CASE WHEN dbo.DANHSACHNGUOILIENHE.SoDD1 IS NULL THEN dbo.DANHSACHNGUOILIENHE.SoDD2 ELSE dbo.DANHSACHNGUOILIENHE.SoDD1 END AS SDT_NLH, dbo.YEUCAUDEN.IDBP, 
                         dbo.DANHSACHNGUOILIENHE.TenNguoiGD, dbo.YEUCAUDEN.GhiChu, dbo.YEUCAUDEN.TGLap
FROM            dbo.YEUCAUDEN INNER JOIN
                         dbo.DANHSACHNHANVIEN ON dbo.YEUCAUDEN.IDNhanVien = dbo.DANHSACHNHANVIEN.ID INNER JOIN
                         dbo.KHACHHANG ON dbo.YEUCAUDEN.IDKhachHang = dbo.KHACHHANG.ID INNER JOIN
                         dbo.DANHSACHNHANVIEN AS DANHSACHNHANVIEN_1 ON dbo.YEUCAUDEN.IDTakeCare = DANHSACHNHANVIEN_1.ID INNER JOIN
                         dbo.TRANGTHAI AS TRANGTHAI_1 ON dbo.YEUCAUDEN.IDTrangThai = TRANGTHAI_1.ID LEFT OUTER JOIN
                         dbo.DANHSACHNGUOILIENHE ON dbo.YEUCAUDEN.IDNguoiLH = dbo.DANHSACHNGUOILIENHE.ID
GO
/****** Object:  Table [dbo].[NCC]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[TenVietTat] [nvarchar](50) NULL,
	[TenNCC] [nvarchar](1000) NULL,
	[SanPham] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[NguoiLienHe] [nvarchar](500) NULL,
	[ChinhSachThanhToan] [nvarchar](50) NULL,
	[TaiKhoanGD] [nvarchar](300) NULL,
	[SoDonHangXN] [int] NULL,
	[SoTienTheoDatHang] [money] NULL,
	[DaThanhToan] [money] NULL,
	[CongNoPhaiTra] [money] NULL,
	[TuNgay] [datetime] NULL,
	[DenNgay] [datetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone_tel] [nvarchar](50) NULL,
	[MucDo] [nvarchar](50) NULL,
	[MST] [nvarchar](50) NULL,
 CONSTRAINT [PK_NCC_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_HangHoa]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_HangHoa]
AS
SELECT        dbo.HANGHOA.ID, dbo.HANGHOA.MaHH, dbo.HANGHOA.TenHH, dbo.HANGHOA.Hang, dbo.HANGHOA.Ma, dbo.HANGHOA.ThongSo, dbo.HANGHOA.XuatSu, dbo.HANGHOA.GiaNhap, dbo.HANGHOA.VanChuyen, 
                         dbo.HANGHOA.IDNCC, dbo.HANGHOA.ThoiGian, dbo.HANGHOA.IDNhanVien, dbo.HANGHOA.TonKho, dbo.DANHSACHNHANVIEN.HoTen, dbo.NCC.TenNCC, dbo.HANGHOA.GiaNhap + dbo.HANGHOA.VanChuyen AS ThanhTien, 
                         dbo.DONVI.TenDonVi, dbo.HANGHOA.IDDonVi, dbo.HANGHOA.TinhTrang, dbo.HANGHOA.TaiLieu, dbo.HANGHOA.HinhAnh, dbo.HANGHOA.ConSX, dbo.HANGHOA.ThongDung, dbo.HANGHOA.Error, dbo.HANGHOA.Code, 
                         dbo.HANGHOA.TGBaoHanh, dbo.HANGHOA.SoDoMach, dbo.HANGHOA.IdNhom
FROM            dbo.HANGHOA INNER JOIN
                         dbo.DANHSACHNHANVIEN ON dbo.HANGHOA.IDNhanVien = dbo.DANHSACHNHANVIEN.ID INNER JOIN
                         dbo.DONVI ON dbo.HANGHOA.IDDonVi = dbo.DONVI.ID LEFT OUTER JOIN
                         dbo.NCC ON dbo.HANGHOA.IDNCC = dbo.NCC.ID
GO
/****** Object:  View [dbo].[V_Chi]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Chi]
AS
SELECT        IDTaiKhoan, SUM(SoTien) AS TienChi
FROM            dbo.THUCHI
WHERE        (Chi = 1) AND (Duyet = 1)
GROUP BY IDTaiKhoan
GO
/****** Object:  View [dbo].[V_Thu]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Thu]
AS
SELECT        IDTaiKhoan, SUM(SoTien) AS TienThu
FROM            dbo.THUCHI
WHERE        (Thu = 1) AND (Duyet = 1)
GROUP BY IDTaiKhoan
GO
/****** Object:  View [dbo].[V_TAIKHOANNEW]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_TAIKHOANNEW]
AS
SELECT        a.ID, a.TenTaiKhoan, a.SoDu, a.SoTaiKhoan, a.NganHang, a.IDDonVi, b.IDTaiKhoan, b.TienThu, c.IDTaiKhoan AS Expr1, c.TienChi, dbo.DONVI.TenDonVi, a.SoTienDuocChuyen
FROM            dbo.TAIKHOAN AS a LEFT OUTER JOIN
                         dbo.DONVI ON a.IDDonVi = dbo.DONVI.ID LEFT OUTER JOIN
                         dbo.V_Thu AS b ON a.ID = b.IDTaiKhoan LEFT OUTER JOIN
                         dbo.V_Chi AS c ON a.ID = c.IDTaiKhoan
GO
/****** Object:  Table [dbo].[XULYYEUCAUHOIGIA]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XULYYEUCAUHOIGIA](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaHang] [nvarchar](100) NULL,
	[TenHangHoa] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](1000) NULL,
	[Hang] [nvarchar](200) NULL,
	[SL] [float] NULL,
	[TGYeuCau] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
	[TrangThai] [int] NULL,
	[IDNguoiNhan] [int] NULL,
	[IDYCDen] [int] NULL,
	[IDDonVi] [int] NULL,
	[DonGia] [money] NULL,
	[HeSo] [float] NULL,
	[CG] [nvarchar](9) NULL,
	[TinhTrang] [nvarchar](500) NULL,
	[NCC_Demo] [nvarchar](max) NULL,
	[ID_NgChuyenMa] [nvarchar](50) NULL,
 CONSTRAINT [PK_XULYYEUCAUHOIGIA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_XuLyYC]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_XuLyYC]
AS
SELECT dbo.XULYYEUCAUHOIGIA.ID, dbo.XULYYEUCAUHOIGIA.MaHang, dbo.XULYYEUCAUHOIGIA.TenHangHoa, dbo.XULYYEUCAUHOIGIA.NoiDung, dbo.XULYYEUCAUHOIGIA.Hang, dbo.XULYYEUCAUHOIGIA.SL, 
                  dbo.XULYYEUCAUHOIGIA.TGYeuCau, dbo.XULYYEUCAUHOIGIA.GhiChu, dbo.XULYYEUCAUHOIGIA.IDDonVi, dbo.XULYYEUCAUHOIGIA.DonGia, dbo.XULYYEUCAUHOIGIA.HeSo, dbo.XULYYEUCAUHOIGIA.IDYCDen, 
                  dbo.TRANGTHAI.TrangThai, ROUND(ISNULL(dbo.XULYYEUCAUHOIGIA.DonGia, 0) * ISNULL(dbo.XULYYEUCAUHOIGIA.HeSo, 1) * ISNULL(dbo.XULYYEUCAUHOIGIA.SL, 0), - 1) AS GiaBan, 
                  dbo.XULYYEUCAUHOIGIA.TrangThai AS IDTrangThai, dbo.XULYYEUCAUHOIGIA.CG, dbo.XULYYEUCAUHOIGIA.TinhTrang, dbo.XULYYEUCAUHOIGIA.NCC_Demo, dbo.XULYYEUCAUHOIGIA.ID_NgChuyenMa
FROM     dbo.XULYYEUCAUHOIGIA LEFT OUTER JOIN
                  dbo.TRANGTHAI ON dbo.XULYYEUCAUHOIGIA.TrangThai = dbo.TRANGTHAI.ID
GO
/****** Object:  View [dbo].[V_TongTienPO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_TongTienPO]
AS
SELECT        dbo.PO_NoiDung.IDPO, SUM(dbo.DAT_HANG.ThanhTienB) AS TongTien
FROM            dbo.PO_NoiDung LEFT OUTER JOIN
                         dbo.DAT_HANG ON dbo.PO_NoiDung.IDDatHang = dbo.DAT_HANG.ID
GROUP BY dbo.PO_NoiDung.IDPO
GO
/****** Object:  View [dbo].[V_PO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PO]
AS
SELECT        dbo.PO.ID, dbo.PO.IDNCC, dbo.PO.SoPO, dbo.PO.SoCG, dbo.PO.NoiDung, dbo.PO.NgayVe, dbo.PO.NgayDat, dbo.PO.IDTrangThai, dbo.PO.IDNguoiXL, dbo.V_TongTienPO.IDPO, ISNULL(dbo.V_TongTienPO.TongTien, 0) 
                         AS TongTien, dbo.PO.IDXuLy, dbo.PO.VC_Khac, dbo.PO.ThanhToan, dbo.PO.XL_HoaDon, CONVERT(bit, ISNULL(dbo.PO.VAT, 0)) AS VAT, 
                         dbo.V_TongTienPO.TongTien + dbo.V_TongTienPO.TongTien * dbo.PO.VAT * 0.1 + dbo.PO.VC_Khac AS ThucChi, 
                         dbo.V_TongTienPO.TongTien + dbo.V_TongTienPO.TongTien * dbo.PO.VAT * 0.1 + dbo.PO.VC_Khac - dbo.PO.ThanhToan AS No, dbo.V_TongTienPO.TongTien * dbo.PO.VAT * 0.1 AS Tien_VAT, dbo.PO.CK
FROM            dbo.PO LEFT OUTER JOIN
                         dbo.V_TongTienPO ON dbo.PO.ID = dbo.V_TongTienPO.IDPO
GROUP BY dbo.PO.ID, dbo.PO.IDNCC, dbo.PO.SoPO, dbo.PO.SoCG, dbo.PO.NoiDung, dbo.PO.NgayVe, dbo.PO.NgayDat, dbo.PO.IDTrangThai, dbo.PO.IDNguoiXL, dbo.V_TongTienPO.IDPO, dbo.V_TongTienPO.TongTien, dbo.PO.IDXuLy, 
                         dbo.PO.Tien_VAT, dbo.PO.VC_Khac, dbo.PO.ThanhToan, dbo.PO.No, dbo.PO.XL_HoaDon, dbo.PO.VAT, dbo.PO.CK
GO
/****** Object:  Table [dbo].[KANBAN_Detail]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KANBAN_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPhuTrach] [int] NULL,
	[IDKB] [int] NULL,
	[IDQT] [int] NULL,
	[MucDo_HT] [float] NULL,
	[HoanThanh] [bit] NULL,
	[NgayCan] [datetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[LyDo] [nvarchar](max) NULL,
 CONSTRAINT [PK_KANBAN_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Kanban_color]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Kanban_color]()
returns table return

select *
from 
(
  select IDQT,IDKB, MucDo_HT
  from KANBAN_Detail
) src
pivot
(
  sum(MucDo_HT)
  for IDQT in ([1], [2], [3],[4], [5], [6],[7])
) KANBAN_color;
GO
/****** Object:  UserDefinedFunction [dbo].[KANBAN_time]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[KANBAN_time]()
returns table return

select *
from 
(
  select IDQT,IDKB,  isnull(NgayCan,0)as NgayCan
  from KANBAN_Detail
) src
pivot
(
max(NgayCan)
  for IDQT in ([1], [2], [3],[4], [5], [6],[7]) 
) KANBAN_time;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Cacdonhang_dachot]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION  [dbo].[fn_Cacdonhang_dachot]()
RETURNS TABLE 
AS
RETURN 
(
	SELECT    ROW_NUMBER() OVER (ORDER BY KETXUATCHAOGIA.ID )AS [STT1],    dbo.KETXUATCHAOGIA.ID, dbo.KETXUATCHAOGIA.TenVT, dbo.KETXUATCHAOGIA.MaVT, dbo.KETXUATCHAOGIA.Hang, dbo.KETXUATCHAOGIA.IDDVT, dbo.KETXUATCHAOGIA.SL, dbo.KETXUATCHAOGIA.DonGiaNhap, KETXUATCHAOGIA.VAT , KETXUATCHAOGIA.VAT_PT,KETXUATCHAOGIA.HT,
                         dbo.KETXUATCHAOGIA.Heso, dbo.KETXUATCHAOGIA.IDYCD, dbo.KETXUATCHAOGIA.CG, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * ISNULL(dbo.KETXUATCHAOGIA.SLXN,0) AS ThanhTienN, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 
                         0) * dbo.KETXUATCHAOGIA.Heso AS DGBan, ROUND(ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * ISNULL(dbo.KETXUATCHAOGIA.SLXN,0) * dbo.KETXUATCHAOGIA.Heso, - 2) AS ThanhTienB, dbo.DONVI.TenDonVi, 
                         dbo.KETXUATCHAOGIA.TinhTrang, dbo.KETXUATCHAOGIA.IDTrangThai, dbo.KETXUATCHAOGIA.SLXN
FROM            dbo.KETXUATCHAOGIA LEFT OUTER JOIN
                         dbo.DONVI ON dbo.KETXUATCHAOGIA.IDDVT = dbo.DONVI.ID  where ChotPO =1
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Cacphieuthu]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION  [dbo].[fn_Cacphieuthu]()
RETURNS TABLE 
AS
RETURN 
(
	 select THUCHI.* from THUCHI inner join YEUCAUDEN on THUCHI.SoYC=YEUCAUDEN.ID where Thu=1 
)
GO
/****** Object:  Table [dbo].[PHANQUYEN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANQUYEN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
	[Loai] [int] NULL,
 CONSTRAINT [PK_PHANQUYEN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_NHANVIEN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_NHANVIEN]
AS
SELECT        dbo.DANHSACHNHANVIEN.ID, dbo.DANHSACHNHANVIEN.HoTen, dbo.DANHSACHNHANVIEN.DiaChi, dbo.DANHSACHNHANVIEN.SoDienThoai, dbo.DANHSACHNHANVIEN.Email, dbo.DANHSACHNHANVIEN.KichHoat, 
                         dbo.DANHSACHNHANVIEN.MaNV, dbo.PHANQUYEN.TenQuyen, dbo.DANHSACHNHANVIEN.PhanQuyen, dbo.DANHSACHNHANVIEN.ChucVu, dbo.DANHSACHNHANVIEN.TrinhDo, dbo.DANHSACHNHANVIEN.IDTinhTrang, 
                         dbo.DANHSACHNHANVIEN.NgayVaoCT, PHANQUYEN_1.TenQuyen AS TinhTrang, PHANQUYEN_2.TenQuyen AS QuenDN, dbo.DANHSACHNHANVIEN.Full_name, dbo.DANHSACHNHANVIEN.Anh, 
                         dbo.DANHSACHNHANVIEN.Ngaysinh, dbo.DANHSACHNHANVIEN.GhiChu
FROM            dbo.DANHSACHNHANVIEN INNER JOIN
                         dbo.PHANQUYEN ON dbo.DANHSACHNHANVIEN.ChucVu = dbo.PHANQUYEN.ID INNER JOIN
                         dbo.PHANQUYEN AS PHANQUYEN_1 ON dbo.DANHSACHNHANVIEN.IDTinhTrang = PHANQUYEN_1.ID INNER JOIN
                         dbo.PHANQUYEN AS PHANQUYEN_2 ON dbo.DANHSACHNHANVIEN.PhanQuyen = PHANQUYEN_2.ID
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Cacdonhang_dachaogia]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Cacdonhang_dachaogia]()
RETURNS TABLE 
AS
RETURN 
(
	SELECT    ROW_NUMBER() OVER (ORDER BY KETXUATCHAOGIA.ID )AS [STT1],    dbo.KETXUATCHAOGIA.ID, dbo.KETXUATCHAOGIA.TenVT, dbo.KETXUATCHAOGIA.MaVT, dbo.KETXUATCHAOGIA.Hang, dbo.KETXUATCHAOGIA.IDDVT, dbo.KETXUATCHAOGIA.SL, dbo.KETXUATCHAOGIA.DonGiaNhap, KETXUATCHAOGIA.VAT , KETXUATCHAOGIA.VAT_PT,
                         dbo.KETXUATCHAOGIA.Heso, dbo.KETXUATCHAOGIA.IDYCD, dbo.KETXUATCHAOGIA.CG, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * ISNULL(dbo.KETXUATCHAOGIA.SLXN,0) AS ThanhTienN, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 
                         0) * dbo.KETXUATCHAOGIA.Heso AS DGBan, ROUND(ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * ISNULL(dbo.KETXUATCHAOGIA.SLXN,0) * dbo.KETXUATCHAOGIA.Heso, - 2) AS ThanhTienB, dbo.DONVI.TenDonVi, 
                         dbo.KETXUATCHAOGIA.TinhTrang, dbo.KETXUATCHAOGIA.IDTrangThai, dbo.KETXUATCHAOGIA.SLXN
FROM            dbo.KETXUATCHAOGIA LEFT OUTER JOIN
                         dbo.DONVI ON dbo.KETXUATCHAOGIA.IDDVT = dbo.DONVI.ID  
)
GO
/****** Object:  Table [dbo].[KETXUATTHONGTIN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KETXUATTHONGTIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CG] [nvarchar](9) NULL,
	[IDYCD] [int] NULL,
	[NguoiGD] [nvarchar](500) NULL,
	[SDT] [nvarchar](50) NULL,
	[VanChuyen] [decimal](18, 0) NULL,
	[ChietKhau] [decimal](18, 0) NULL,
	[Haiquan] [decimal](18, 0) NULL,
	[PhiDV] [decimal](18, 0) NULL,
	[Vattuphu] [decimal](18, 0) NULL,
	[Phatsinh] [decimal](18, 0) NULL,
 CONSTRAINT [PK_KETXUATTHONGTIN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[frm_LoiNhuan_truocthuchi]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[frm_LoiNhuan_truocthuchi]
(	)
RETURNS TABLE 
AS
RETURN 
(
	select distinct a.* ,b.IDBP,( a.ThanhTienB - a.ThanhTienN - ISNULL(c.ChietKhau,0) - ISNULL(c.VanChuyen,0) ) as LoiNhuan, b.duyet from fn_Cacdonhang_dachot() a left outer join fn_Cacphieuthu() b on a.IDYCD=b.SoYC left outer join KETXUATTHONGTIN c on a.IDYCD=c.IDYCD 
)
GO
/****** Object:  UserDefinedFunction [dbo].[frm_LoiNhuan_sauthuchi]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[frm_LoiNhuan_sauthuchi]
(	)
RETURNS TABLE 
AS
RETURN 
(
	select distinct a.*,b.IDBP,( a.ThanhTienB - a.ThanhTienN - ISNULL(c.ChietKhau,0) - ISNULL(c.VanChuyen,0) ) as LoiNhuanThuc, b.duyet from fn_Cacdonhang_dachot() a inner join fn_Cacphieuthu() b on a.IDYCD=b.SoYC left outer join KETXUATTHONGTIN c on a.IDYCD=c.IDYCD  where b.duyet =1 
)
GO
/****** Object:  Table [dbo].[CHAOGIA]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAOGIA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CG] [nvarchar](9) NULL,
	[IDKhachHang] [int] NOT NULL,
	[IDTrangThai] [int] NULL,
	[NgayGiao] [datetime] NULL,
	[NgayNhan] [datetime] NULL,
	[IDNguoiNhan] [int] NULL,
	[IDTrangThaiXuLy] [int] NULL,
	[TienDo] [smallint] NULL,
	[IDYCD] [int] NULL,
	[FileCG] [nvarchar](max) NULL,
	[ThanhToan] [decimal](18, 0) NULL,
	[No] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHAOGIA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ChaoGia]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ChaoGia]
AS
SELECT        dbo.CHAOGIA.ID, dbo.CHAOGIA.CG, dbo.TRANGTHAI.TrangThai, TRANGTHAI_1.TrangThai AS TrangThaiXuLy, dbo.KHACHHANG.TenCongTy, dbo.CHAOGIA.IDKhachHang, dbo.CHAOGIA.IDTrangThai, dbo.CHAOGIA.NgayGiao, 
                         dbo.CHAOGIA.NgayNhan, dbo.CHAOGIA.IDNguoiNhan, dbo.CHAOGIA.IDTrangThaiXuLy, dbo.CHAOGIA.TienDo, dbo.YEUCAUDEN.YC, dbo.YEUCAUDEN.NoiDung, dbo.CHAOGIA.FileCG, dbo.CHAOGIA.IDYCD, 
                         dbo.YEUCAUDEN.IDTrangThai AS IDTrangThaiYC
FROM            dbo.CHAOGIA INNER JOIN
                         dbo.TRANGTHAI ON dbo.CHAOGIA.IDTrangThai = dbo.TRANGTHAI.ID INNER JOIN
                         dbo.TRANGTHAI AS TRANGTHAI_1 ON dbo.CHAOGIA.IDTrangThaiXuLy = TRANGTHAI_1.ID INNER JOIN
                         dbo.KHACHHANG ON dbo.CHAOGIA.IDKhachHang = dbo.KHACHHANG.ID INNER JOIN
                         dbo.YEUCAUDEN ON dbo.CHAOGIA.IDYCD = dbo.YEUCAUDEN.ID
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LoiNhuan_Tunghangmuc_chưachot]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LoiNhuan_Tunghangmuc_chưachot]
()
RETURNS TABLE 
AS
RETURN 
(
	select d.*, (ISNULL( d.ThanhTienB,0) - ISNULL( d.ThanhTienN,0) - convert(decimal,isnull(e.ChietKhau,0)) - convert(decimal,isnull(e.VanChuyen,0)))LoiNhuan from fn_Cacdonhang_dachaogia() d  left outer join KETXUATTHONGTIN e on d.IDYCD=e.IDYCD 
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LoiNhuan_DaChot]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LoiNhuan_DaChot]
()
RETURNS TABLE 
AS
RETURN 
(
	select   sum (LoiNhuan)LoiNhuandachot ,b.ID  from frm_LoiNhuan_truocthuchi() a inner join YEUCAUDEN b on a.iDYCD=b.ID  group by b.ID 
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LoiNhuan_ChuaChot]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LoiNhuan_ChuaChot]
()
RETURNS TABLE 
AS
RETURN 
(
	select   sum (LoiNhuan)LoiNhuanchuachot ,b.ID  from fn_LoiNhuan_Tunghangmuc_chưachot() a inner join YEUCAUDEN b on a.iDYCD=b.ID  group by b.ID 
)
GO
/****** Object:  UserDefinedFunction [dbo].[LoiNhuan]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[LoiNhuan]()
returns table return
select distinct V_ThuChi.SoYC,TongThu.TongThu,TongChi.TongChi,V_ThuChi.IDBP,round(((TongThu.TongThu-TongChi.TongChi)/1.1),-2) as LoiNhuan from V_ThuChi , (select Sum(SoTien) as TongThu, SoYC  from V_ThuChi where TenPhieu= 10 group by SoYC ,IDBP ) TongThu ,(select Sum(SoTien) as TongChi, SoYC  from V_ThuChi where TenPhieu= 11 group by SoYC ,IDBP) TongChi where V_ThuChi.SoYC=TongChi.SoYC and V_ThuChi.SoYC=TongThu.SoYC and V_ThuChi.Duyet=1 and V_ThuChi.HoanThanh=1 and V_ThuChi.SoYC<>0
GO
/****** Object:  UserDefinedFunction [dbo].[XacNhanDathang]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[XacNhanDathang](@IDYCD nvarchar(20),@CG nvarchar(20))
returns table return
SELECT    ROW_NUMBER() OVER (ORDER BY KETXUATCHAOGIA.ID )AS [STT1],    dbo.KETXUATCHAOGIA.ID, dbo.KETXUATCHAOGIA.TenVT, dbo.KETXUATCHAOGIA.MaVT, dbo.KETXUATCHAOGIA.Hang, dbo.KETXUATCHAOGIA.IDDVT, dbo.KETXUATCHAOGIA.SL, dbo.KETXUATCHAOGIA.DonGiaNhap, KETXUATCHAOGIA.VAT , KETXUATCHAOGIA.VAT_PT,
                         dbo.KETXUATCHAOGIA.Heso, dbo.KETXUATCHAOGIA.IDYCD, dbo.KETXUATCHAOGIA.CG, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * ISNULL(dbo.KETXUATCHAOGIA.SLXN,0) AS ThanhTienN, ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 
                         0) * dbo.KETXUATCHAOGIA.Heso AS DGBan, ROUND(ISNULL(dbo.KETXUATCHAOGIA.DonGiaNhap, 0) * ISNULL(dbo.KETXUATCHAOGIA.SLXN,0) * dbo.KETXUATCHAOGIA.Heso, - 1) AS ThanhTienB, dbo.DONVI.TenDonVi, 
                         dbo.KETXUATCHAOGIA.TinhTrang, dbo.KETXUATCHAOGIA.IDTrangThai, dbo.KETXUATCHAOGIA.SLXN
FROM            dbo.KETXUATCHAOGIA LEFT OUTER JOIN
                         dbo.DONVI ON dbo.KETXUATCHAOGIA.IDDVT = dbo.DONVI.ID
						 Where CG=@CG and IDYCD=@IDYCD 
GO
/****** Object:  View [dbo].[View_CHAOGIA_Thang]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CHAOGIA_Thang]
AS
SELECT        a.ID, a.CG, a.IDKhachHang, a.IDTrangThai, a.NgayGiao, a.NgayNhan, a.IDNguoiNhan, a.IDTrangThaiXuLy, a.TienDo, a.IDYCD, a.FileCG, a.No, a.ThanhToan,
                             (SELECT        SUM(DonGiaNhap * SLXN) AS Expr1
                               FROM            dbo.KETXUATCHAOGIA AS b
                               WHERE        (IDYCD = a.IDYCD)) AS TongN,
                             (SELECT        SUM(DonGiaNhap * VAT * VAT_PT * Heso * SLXN / 100) AS Expr1
                               FROM            dbo.KETXUATCHAOGIA AS b
                               WHERE        (IDYCD = a.IDYCD)) AS TongVAT,
                             (SELECT        SUM(DonGiaNhap * VAT * VAT_PT * Heso * SLXN / 100 + DonGiaNhap * Heso * SLXN) AS Expr1
                               FROM            dbo.KETXUATCHAOGIA AS b
                               WHERE        (IDYCD = a.IDYCD)) AS TongB,
                             (SELECT        SUM(DonGiaNhap * Heso * SLXN) AS Expr1
                               FROM            dbo.KETXUATCHAOGIA AS b
                               WHERE        (IDYCD = a.IDYCD)) AS TongBchuavat, ISNULL(c.ChietKhau, 0) AS ChietKhau, ISNULL(c.VanChuyen, 0) AS VanChuyen, ISNULL(c.Haiquan, 0) AS Haiquan, ISNULL(c.Phatsinh, 0) AS Phatsinh, ISNULL(c.PhiDV, 0) 
                         AS PhiDV, ISNULL(c.Vattuphu, 0) AS Vattuphu, d.NoiDung,
                             (SELECT        SUM(DonGiaNhap * Heso * SLXN) AS Expr1
                               FROM            dbo.KETXUATCHAOGIA AS b
                               WHERE        (IDYCD = a.IDYCD)) - ISNULL(c.ChietKhau, 0) - ISNULL(c.VanChuyen, 0) - ISNULL(c.Haiquan, 0) - ISNULL(c.Phatsinh, 0) - ISNULL(c.PhiDV, 0) - ISNULL(c.Vattuphu, 0) -
                             (SELECT        SUM(DonGiaNhap * SLXN) AS Expr1
                               FROM            dbo.KETXUATCHAOGIA AS b
                               WHERE        (IDYCD = a.IDYCD)) AS Loinhuan, e.TenCongTy, e.TenVietTat, d.YC, DATENAME(MONTH, DATEADD(MONTH, 0, a.NgayNhan)) AS Thang
FROM            dbo.CHAOGIA AS a LEFT OUTER JOIN
                         dbo.KETXUATTHONGTIN AS c ON a.IDYCD = c.IDYCD AND a.CG = c.CG INNER JOIN
                         dbo.YEUCAUDEN AS d ON a.IDYCD = d.ID LEFT OUTER JOIN
                         dbo.KHACHHANG AS e ON d.IDKhachHang = e.ID
WHERE        (a.IDTrangThai = 7) OR
                         (a.IDTrangThai = 8)
GO
/****** Object:  View [dbo].[View_Thangtrongnam]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Thangtrongnam]
AS
WITH R(N) AS (SELECT 1 AS Expr1
                             UNION ALL
                             SELECT N + 1 AS Expr1
                             FROM     R AS R_2
                             WHERE  (N < 12))
    SELECT DATENAME(MONTH, DATEADD(MONTH, - N, '1/1/2021')) AS month, N
    FROM     R AS R_1
GO
/****** Object:  Table [dbo].[BOPHAN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOPHAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaBP] [nvarchar](20) NULL,
	[TenBP] [nvarchar](1000) NULL,
 CONSTRAINT [PK_BOPHAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckList]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[IDQT] [int] NULL,
	[SapXep] [smallint] NULL,
 CONSTRAINT [PK_CheckList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONGVIEC]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIEC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NULL,
	[NoiDungCV] [nvarchar](max) NULL,
	[ChiTietCV] [nvarchar](max) NULL,
	[IDNguoiLap] [int] NULL,
	[IDNguoiDG] [int] NULL,
	[IDNhanXL] [int] NULL,
	[TGNhanXL] [datetime] NULL,
	[TGBatDau] [datetime] NULL,
	[TGKetThuc] [datetime] NULL,
	[TGChot] [datetime] NULL,
	[IDTrangThai] [int] NULL,
	[HoanThanh] [int] NULL,
	[MaCV] [nvarchar](20) NULL,
	[IDMucDo] [int] NULL,
	[Nghi] [bit] NULL,
	[Dimuon_VeSom] [bit] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[IDBP] [int] NULL,
	[IDNguoiBC] [int] NULL,
	[IDYC] [int] NULL,
	[IDKH] [int] NULL,
	[IDNCC] [int] NULL,
	[Hotro] [nvarchar](max) NULL,
 CONSTRAINT [PK_CONGVIEC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONGVIEC_BAOCAO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIEC_BAOCAO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaCV] [nvarchar](20) NULL,
	[IDNguoiBC] [int] NULL,
	[TGBaoCao] [datetime] NULL,
	[TGBatDau] [datetime] NULL,
	[TGKetThuc] [datetime] NULL,
	[IDNguoiTao] [int] NULL,
 CONSTRAINT [PK_CONGVIEC_BAOCAO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSNGANHANG]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSNGANHANG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](2000) NULL,
	[TenEL] [nvarchar](2000) NULL,
	[TenVietTat] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_DSNGANHANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSTAIKHOANGD]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSTAIKHOANGD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNCC] [int] NULL,
	[IDKH] [int] NULL,
	[TenTK] [nvarchar](2000) NULL,
	[SoTK] [nvarchar](50) NULL,
	[IDNganHang] [int] NULL,
	[ChiNhanh] [nvarchar](2000) NULL,
	[ConSD] [bit] NULL,
	[SoTien] [decimal](18, 0) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_DSTAIKHOANGD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGHOA_NHOM]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGHOA_NHOM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](500) NULL,
 CONSTRAINT [PK_HANGHOA_NHOM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGHOA_THONGSO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGHOA_THONGSO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDHH] [int] NOT NULL,
	[ThongSo] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](3000) NULL,
 CONSTRAINT [PK_HANGHOA_THONGSO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SoHD] [nvarchar](50) NULL,
	[CG] [nvarchar](50) NULL,
	[IDYCD] [int] NULL,
	[NgayLap] [datetime] NULL,
	[CongNo] [int] NULL,
	[NgayDenHan] [datetime] NULL,
	[HTTT] [nvarchar](50) NULL,
	[HT] [bit] NULL,
	[SoYC] [nvarchar](500) NULL,
	[SoCG] [nvarchar](500) NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON_ChiTiet]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDHD] [int] NULL,
	[ID_KXCG] [int] NULL,
 CONSTRAINT [PK_HOADON_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HUONGDAN_SUDUNG]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUONGDAN_SUDUNG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HangMuc] [nvarchar](1000) NULL,
	[FileDK] [nvarchar](1000) NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_HUONGDAN_SUDUNG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KANBAN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KANBAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDYC] [int] NULL,
	[IDTRANGTHAI] [int] NULL,
	[IDNgChuyenGiao] [int] NULL,
	[IDNgXuLy] [int] NULL,
	[NgayCanGH] [datetime] NULL,
	[SoDotGH] [smallint] NULL,
	[GhiChu] [nvarchar](2000) NULL,
	[Run] [nvarchar](50) NULL,
	[Position] [tinyint] NULL,
 CONSTRAINT [PK_KANBAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KANBAN_CheckList]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KANBAN_CheckList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDKB_DT] [int] NULL,
	[IDCheckList] [int] NULL,
	[MucDo] [float] NULL,
	[Ck] [bit] NULL,
 CONSTRAINT [PK_KANBAN_CheckList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KANBAN_QUYTRINH]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KANBAN_QUYTRINH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](1000) NULL,
 CONSTRAINT [PK_QUYTRINH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](500) NULL,
	[Diachi] [nvarchar](2000) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
 CONSTRAINT [PK_KHO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICHSU_CHUYENKHOAN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHSU_CHUYENKHOAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNguoiChuyen] [int] NULL,
	[IDnguoiNhan] [int] NULL,
	[ThoiGian] [datetime] NULL,
	[SoTien] [money] NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_LICHSU_CHUYENKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCC_TheoHH]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCC_TheoHH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNCC] [int] NULL,
	[IDHH] [int] NULL,
 CONSTRAINT [PK_NCC_TheoHH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAPKHO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAPKHO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Maphieu] [nvarchar](50) NULL,
	[IDKho] [int] NULL,
	[Ghichu] [nvarchar](2000) NULL,
	[ThoigianBD] [datetime] NULL,
	[ThoigianHT] [datetime] NULL,
	[IDNguoilap] [int] NULL,
	[IDTrangthai] [bit] NULL,
 CONSTRAINT [PK_NHAPKHO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAPKHO_Chitiet]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAPKHO_Chitiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNhapkho] [int] NULL,
	[IDHanghoa] [int] NULL,
	[IDNCC] [int] NULL,
	[Soluong] [float] NULL,
 CONSTRAINT [PK_NHAPKHO_Chitiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NODE_Child]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NODE_Child](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDNode_parent] [int] NULL,
	[Name_node] [nvarchar](1000) NULL,
	[Tag] [nvarchar](1000) NULL,
 CONSTRAINT [PK_NODE_Child] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NODE_Parent]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NODE_Parent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name_node] [nvarchar](500) NULL,
	[position_node] [smallint] NULL,
	[Tag] [nvarchar](1000) NULL,
 CONSTRAINT [PK_NODE_Parent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OKR]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OKR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nam] [smallint] NULL,
	[Quy] [smallint] NULL,
	[Tuan] [smallint] NULL,
	[ThoiGian] [datetime] NULL,
	[ThoiGianBD] [datetime] NULL,
	[ThoiGianKT] [datetime] NULL,
	[IDBoPhan] [int] NULL,
	[O] [nvarchar](1000) NULL,
 CONSTRAINT [PK_OKR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OKR_KR]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OKR_KR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDDVT] [int] NULL,
	[IDOKR] [int] NULL,
	[IDOKR_TIENTRINH] [int] NULL,
	[KR] [nvarchar](10) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[MucTieu] [float] NULL,
	[TienTrinh] [float] NULL,
 CONSTRAINT [PK_OKR_KR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OKR_TIENTRINH]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OKR_TIENTRINH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDOKR_KR] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[GiaTri] [float] NULL,
	[TienTrinh] [float] NULL,
	[YCD] [nvarchar](50) NULL,
	[Tuan] [smallint] NULL,
 CONSTRAINT [PK_OKR_TIENTRINH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OKR_TONGHOP]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OKR_TONGHOP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDOKR] [int] NULL,
	[IDOKR_TIENTRINH] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DiemCanBang] [float] NULL,
	[GiaTriDat] [float] NULL,
 CONSTRAINT [PK_OKR_TONGHOP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PO_DieuKhoanThanhToan]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_DieuKhoanThanhToan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDK] [nvarchar](max) NULL,
 CONSTRAINT [PK_PO_DieuKhoanThanhToan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PO_HinhThucGH]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_HinhThucGH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenHT] [nvarchar](500) NULL,
 CONSTRAINT [PK_PO_HinhThucGH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PO_ThongTinMuaHang]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_ThongTinMuaHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPO] [int] NOT NULL,
	[IDTK] [int] NULL,
	[IDDKTT] [int] NULL,
	[HinhThucGH] [nvarchar](500) NULL,
	[IDNguoiNhan] [int] NULL,
	[DiaChi_GH] [nvarchar](max) NULL,
	[TgGiaoHang] [nvarchar](1000) NULL,
 CONSTRAINT [PK_PO_ThongTinMuaHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUYENTRUYCAP]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYENTRUYCAP](
	[Matruycap] [nvarchar](50) NOT NULL,
	[Q0] [bit] NOT NULL,
	[Q1] [bit] NOT NULL,
	[Q2] [bit] NOT NULL,
	[Q3] [bit] NOT NULL,
	[Q4] [bit] NOT NULL,
	[Q5] [bit] NOT NULL,
	[Q6] [bit] NOT NULL,
	[Q7] [bit] NOT NULL,
	[Q8] [bit] NOT NULL,
	[Q9] [bit] NOT NULL,
	[Q10] [bit] NOT NULL,
	[Q11] [bit] NOT NULL,
	[Q12] [bit] NOT NULL,
	[Q13] [bit] NOT NULL,
	[Q14] [bit] NOT NULL,
	[Q15] [bit] NOT NULL,
	[Q16] [bit] NOT NULL,
	[Q17] [bit] NOT NULL,
	[Q18] [bit] NOT NULL,
	[Q19] [bit] NOT NULL,
	[Q20] [bit] NOT NULL,
	[Q21] [bit] NOT NULL,
	[Q22] [bit] NOT NULL,
	[Q23] [bit] NOT NULL,
	[Q24] [bit] NOT NULL,
	[Q25] [bit] NOT NULL,
	[Q26] [bit] NOT NULL,
	[Q27] [bit] NOT NULL,
	[Q28] [bit] NOT NULL,
	[Q29] [bit] NOT NULL,
	[Q30] [bit] NOT NULL,
	[Q31] [bit] NOT NULL,
	[Q32] [bit] NOT NULL,
	[Q33] [bit] NOT NULL,
	[Q34] [bit] NOT NULL,
	[Q35] [bit] NOT NULL,
	[Q36] [bit] NOT NULL,
	[Q37] [bit] NOT NULL,
	[Q38] [bit] NOT NULL,
	[Q39] [bit] NOT NULL,
	[Q40] [bit] NOT NULL,
	[Q41] [bit] NOT NULL,
	[Q42] [bit] NOT NULL,
	[Q43] [bit] NOT NULL,
	[Q44] [bit] NOT NULL,
	[Q45] [bit] NOT NULL,
	[Q46] [bit] NOT NULL,
	[Q47] [bit] NOT NULL,
	[Q48] [bit] NOT NULL,
	[Q49] [bit] NOT NULL,
	[Q50] [bit] NOT NULL,
	[Q51] [bit] NOT NULL,
	[Q52] [bit] NOT NULL,
	[Q53] [bit] NOT NULL,
	[Q54] [bit] NOT NULL,
	[Q55] [bit] NOT NULL,
	[Q56] [bit] NOT NULL,
	[Q57] [bit] NOT NULL,
	[Q58] [bit] NOT NULL,
	[Q59] [bit] NOT NULL,
	[Q60] [bit] NOT NULL,
	[Q61] [bit] NOT NULL,
	[Q62] [bit] NOT NULL,
	[Q63] [bit] NOT NULL,
	[Q64] [bit] NOT NULL,
	[Q65] [bit] NOT NULL,
	[Q66] [bit] NOT NULL,
	[Q67] [bit] NOT NULL,
	[Q68] [bit] NOT NULL,
	[Q69] [bit] NOT NULL,
	[Q70] [bit] NOT NULL,
	[Q71] [bit] NOT NULL,
	[Q72] [bit] NOT NULL,
	[Q73] [bit] NOT NULL,
	[Q74] [bit] NOT NULL,
	[Q75] [bit] NOT NULL,
	[Q76] [bit] NOT NULL,
	[Q77] [bit] NOT NULL,
	[Q78] [bit] NOT NULL,
	[Q79] [bit] NOT NULL,
	[Q80] [bit] NOT NULL,
	[Q81] [bit] NOT NULL,
	[Q82] [bit] NOT NULL,
	[Q83] [bit] NOT NULL,
	[Q84] [bit] NOT NULL,
	[Q85] [bit] NOT NULL,
	[Q86] [bit] NOT NULL,
	[Q87] [bit] NOT NULL,
	[Q88] [bit] NOT NULL,
	[Q89] [bit] NOT NULL,
	[Q90] [bit] NOT NULL,
	[Q91] [bit] NOT NULL,
	[Q92] [bit] NOT NULL,
	[Q93] [bit] NOT NULL,
	[Q94] [bit] NOT NULL,
	[Q95] [bit] NOT NULL,
	[Q96] [bit] NOT NULL,
	[Q97] [bit] NOT NULL,
	[Q98] [bit] NOT NULL,
	[Q99] [bit] NOT NULL,
	[Q100] [bit] NOT NULL,
	[Q101] [bit] NOT NULL,
	[Q102] [bit] NOT NULL,
	[Q103] [bit] NOT NULL,
	[Q104] [bit] NOT NULL,
	[Q105] [bit] NOT NULL,
	[Q106] [bit] NOT NULL,
	[Q107] [bit] NOT NULL,
	[Q108] [bit] NOT NULL,
	[Q109] [bit] NOT NULL,
	[Q110] [bit] NOT NULL,
	[Q111] [bit] NOT NULL,
	[Q112] [bit] NOT NULL,
	[Q113] [bit] NOT NULL,
	[Q114] [bit] NOT NULL,
	[Q115] [bit] NOT NULL,
	[Q116] [bit] NOT NULL,
	[Q117] [bit] NOT NULL,
	[Q118] [bit] NOT NULL,
	[Q119] [bit] NOT NULL,
	[Q120] [bit] NOT NULL,
	[Q121] [bit] NOT NULL,
	[Q122] [bit] NOT NULL,
	[Q123] [bit] NOT NULL,
	[Q124] [bit] NOT NULL,
	[Q125] [bit] NOT NULL,
	[Q126] [bit] NOT NULL,
	[Q127] [bit] NOT NULL,
	[Q128] [bit] NOT NULL,
	[Q129] [bit] NOT NULL,
	[Q130] [bit] NOT NULL,
	[Q131] [bit] NOT NULL,
	[Q132] [bit] NOT NULL,
	[Q133] [bit] NOT NULL,
	[Q134] [bit] NOT NULL,
	[Q135] [bit] NOT NULL,
	[Q136] [bit] NOT NULL,
	[Q137] [bit] NOT NULL,
	[Q138] [bit] NOT NULL,
	[Q139] [bit] NOT NULL,
	[Quyen] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THONGBAO]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGBAO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SoPhut] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_THONGBAO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUCHI_CongNo]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUCHI_CongNo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDThuChi] [int] NULL,
	[SoPhieu] [nvarchar](50) NULL,
	[SoHD] [nvarchar](50) NULL,
	[IDCG] [int] NULL,
	[Ngaybatdau] [datetime] NULL,
	[Ngaykethuc] [datetime] NULL,
	[SoNgayCN] [int] NULL,
	[DaThu] [bit] NULL,
 CONSTRAINT [PK_THUCHI_CongNo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIEUCHUAN]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIEUCHUAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ThongSo1] [int] NULL,
	[Loai] [smallint] NULL,
 CONSTRAINT [PK_TIEUCHUAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XEPHANG]    Script Date: 10/20/2021 3:48:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XEPHANG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[XH] [nvarchar](50) NULL,
 CONSTRAINT [PK_XEPHANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KETXUATTHONGTIN] ADD  CONSTRAINT [DF_KETXUATTHONGTIN_Haiquan]  DEFAULT ((0)) FOR [Haiquan]
GO
ALTER TABLE [dbo].[KETXUATTHONGTIN] ADD  CONSTRAINT [DF_KETXUATTHONGTIN_PhiDV]  DEFAULT ((0)) FOR [PhiDV]
GO
ALTER TABLE [dbo].[KETXUATTHONGTIN] ADD  CONSTRAINT [DF_KETXUATTHONGTIN_Vattuphu]  DEFAULT ((0)) FOR [Vattuphu]
GO
ALTER TABLE [dbo].[KETXUATTHONGTIN] ADD  CONSTRAINT [DF_KETXUATTHONGTIN_Phatsinh]  DEFAULT ((0)) FOR [Phatsinh]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q1]  DEFAULT ((0)) FOR [Q0]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP]  DEFAULT ((0)) FOR [Q1]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_1]  DEFAULT ((0)) FOR [Q2]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_2]  DEFAULT ((0)) FOR [Q3]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q4]  DEFAULT ((0)) FOR [Q4]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q5]  DEFAULT ((0)) FOR [Q5]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q6]  DEFAULT ((0)) FOR [Q6]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q7]  DEFAULT ((0)) FOR [Q7]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q8]  DEFAULT ((0)) FOR [Q8]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q9]  DEFAULT ((0)) FOR [Q9]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q10]  DEFAULT ((0)) FOR [Q10]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q11]  DEFAULT ((0)) FOR [Q11]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q12]  DEFAULT ((0)) FOR [Q12]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q13]  DEFAULT ((0)) FOR [Q13]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q14]  DEFAULT ((0)) FOR [Q14]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q15]  DEFAULT ((0)) FOR [Q15]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q16]  DEFAULT ((0)) FOR [Q16]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q17]  DEFAULT ((0)) FOR [Q17]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q18]  DEFAULT ((0)) FOR [Q18]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q19]  DEFAULT ((0)) FOR [Q19]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q20]  DEFAULT ((0)) FOR [Q20]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q21]  DEFAULT ((0)) FOR [Q21]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q22]  DEFAULT ((0)) FOR [Q22]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q23]  DEFAULT ((0)) FOR [Q23]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q24]  DEFAULT ((0)) FOR [Q24]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q25]  DEFAULT ((0)) FOR [Q25]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q26]  DEFAULT ((0)) FOR [Q26]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q27]  DEFAULT ((0)) FOR [Q27]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q28]  DEFAULT ((0)) FOR [Q28]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q29]  DEFAULT ((0)) FOR [Q29]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q30]  DEFAULT ((0)) FOR [Q30]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q31]  DEFAULT ((0)) FOR [Q31]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q32]  DEFAULT ((0)) FOR [Q32]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q33]  DEFAULT ((0)) FOR [Q33]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q34]  DEFAULT ((0)) FOR [Q34]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q35]  DEFAULT ((0)) FOR [Q35]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q36]  DEFAULT ((0)) FOR [Q36]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q37]  DEFAULT ((0)) FOR [Q37]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q38]  DEFAULT ((0)) FOR [Q38]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q39]  DEFAULT ((0)) FOR [Q39]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q40]  DEFAULT ((0)) FOR [Q40]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q41]  DEFAULT ((0)) FOR [Q41]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q42]  DEFAULT ((0)) FOR [Q42]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q43]  DEFAULT ((0)) FOR [Q43]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q44]  DEFAULT ((0)) FOR [Q44]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q45]  DEFAULT ((0)) FOR [Q45]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q46]  DEFAULT ((0)) FOR [Q46]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q47]  DEFAULT ((0)) FOR [Q47]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q48]  DEFAULT ((0)) FOR [Q48]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q49]  DEFAULT ((0)) FOR [Q49]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q50]  DEFAULT ((0)) FOR [Q50]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q51]  DEFAULT ((0)) FOR [Q51]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q52]  DEFAULT ((0)) FOR [Q52]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q53]  DEFAULT ((0)) FOR [Q53]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q54]  DEFAULT ((0)) FOR [Q54]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q55]  DEFAULT ((0)) FOR [Q55]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q56]  DEFAULT ((0)) FOR [Q56]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q57]  DEFAULT ((0)) FOR [Q57]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q58]  DEFAULT ((0)) FOR [Q58]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q59]  DEFAULT ((0)) FOR [Q59]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q60]  DEFAULT ((0)) FOR [Q60]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q61]  DEFAULT ((0)) FOR [Q61]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q62]  DEFAULT ((0)) FOR [Q62]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q63]  DEFAULT ((0)) FOR [Q63]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q64]  DEFAULT ((0)) FOR [Q64]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q65]  DEFAULT ((0)) FOR [Q65]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q66]  DEFAULT ((0)) FOR [Q66]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q67]  DEFAULT ((0)) FOR [Q67]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q68]  DEFAULT ((0)) FOR [Q68]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q69]  DEFAULT ((0)) FOR [Q69]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q70]  DEFAULT ((0)) FOR [Q70]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q71]  DEFAULT ((0)) FOR [Q71]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q72]  DEFAULT ((0)) FOR [Q72]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q73]  DEFAULT ((0)) FOR [Q73]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q74]  DEFAULT ((0)) FOR [Q74]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q75]  DEFAULT ((0)) FOR [Q75]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q76]  DEFAULT ((0)) FOR [Q76]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q77]  DEFAULT ((0)) FOR [Q77]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q78]  DEFAULT ((0)) FOR [Q78]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q79]  DEFAULT ((0)) FOR [Q79]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q80]  DEFAULT ((0)) FOR [Q80]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q81]  DEFAULT ((0)) FOR [Q81]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q82]  DEFAULT ((0)) FOR [Q82]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q83]  DEFAULT ((0)) FOR [Q83]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q84]  DEFAULT ((0)) FOR [Q84]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q85]  DEFAULT ((0)) FOR [Q85]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q86]  DEFAULT ((0)) FOR [Q86]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q87]  DEFAULT ((0)) FOR [Q87]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q88]  DEFAULT ((0)) FOR [Q88]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q89]  DEFAULT ((0)) FOR [Q89]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q90]  DEFAULT ((0)) FOR [Q90]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q91]  DEFAULT ((0)) FOR [Q91]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q92]  DEFAULT ((0)) FOR [Q92]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q93]  DEFAULT ((0)) FOR [Q93]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q94]  DEFAULT ((0)) FOR [Q94]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q95]  DEFAULT ((0)) FOR [Q95]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q96]  DEFAULT ((0)) FOR [Q96]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q97]  DEFAULT ((0)) FOR [Q97]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q98]  DEFAULT ((0)) FOR [Q98]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q99]  DEFAULT ((0)) FOR [Q99]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q100]  DEFAULT ((0)) FOR [Q100]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q101]  DEFAULT ((0)) FOR [Q101]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q102]  DEFAULT ((0)) FOR [Q102]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q103]  DEFAULT ((0)) FOR [Q103]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q104]  DEFAULT ((0)) FOR [Q104]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q105]  DEFAULT ((0)) FOR [Q105]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q106]  DEFAULT ((0)) FOR [Q106]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q107]  DEFAULT ((0)) FOR [Q107]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q108]  DEFAULT ((0)) FOR [Q108]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q109]  DEFAULT ((0)) FOR [Q109]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q110]  DEFAULT ((0)) FOR [Q110]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q111]  DEFAULT ((0)) FOR [Q111]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q112]  DEFAULT ((0)) FOR [Q112]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q113]  DEFAULT ((0)) FOR [Q113]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q114]  DEFAULT ((0)) FOR [Q114]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q115]  DEFAULT ((0)) FOR [Q115]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q116]  DEFAULT ((0)) FOR [Q116]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q117]  DEFAULT ((0)) FOR [Q117]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q118]  DEFAULT ((0)) FOR [Q118]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q119]  DEFAULT ((0)) FOR [Q119]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q120]  DEFAULT ((0)) FOR [Q120]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q121]  DEFAULT ((0)) FOR [Q121]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q122]  DEFAULT ((0)) FOR [Q122]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q123]  DEFAULT ((0)) FOR [Q123]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q124]  DEFAULT ((0)) FOR [Q124]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q125]  DEFAULT ((0)) FOR [Q125]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q126]  DEFAULT ((0)) FOR [Q126]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q127]  DEFAULT ((0)) FOR [Q127]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q128]  DEFAULT ((0)) FOR [Q128]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q129]  DEFAULT ((0)) FOR [Q129]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q130]  DEFAULT ((0)) FOR [Q130]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q131]  DEFAULT ((0)) FOR [Q131]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q132]  DEFAULT ((0)) FOR [Q132]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q133]  DEFAULT ((0)) FOR [Q133]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q134]  DEFAULT ((0)) FOR [Q134]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q135]  DEFAULT ((0)) FOR [Q135]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q136]  DEFAULT ((0)) FOR [Q136]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q137]  DEFAULT ((0)) FOR [Q137]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q138]  DEFAULT ((0)) FOR [Q138]
GO
ALTER TABLE [dbo].[QUYENTRUYCAP] ADD  CONSTRAINT [DF_QUYENTRUYCAP_Q139]  DEFAULT ((0)) FOR [Q139]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[11] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CHAOGIA"
            Begin Extent = 
               Top = 21
               Left = 454
               Bottom = 236
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TRANGTHAI"
            Begin Extent = 
               Top = 12
               Left = 241
               Bottom = 125
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TRANGTHAI_1"
            Begin Extent = 
               Top = 163
               Left = 235
               Bottom = 282
               Right = 405
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KHACHHANG"
            Begin Extent = 
               Top = 7
               Left = 666
               Bottom = 137
               Right = 843
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "YEUCAUDEN"
            Begin Extent = 
               Top = 149
               Left = 793
               Bottom = 279
               Right = 963
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ChaoGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ChaoGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ChaoGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "THUCHI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Chi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Chi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DANHSACHNHANVIEN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 284
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DONVI"
            Begin Extent = 
               Top = 137
               Left = 1091
               Bottom = 250
               Right = 1261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NCC"
            Begin Extent = 
               Top = 14
               Left = 723
               Bottom = 312
               Right = 928
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HANGHOA"
            Begin Extent = 
               Top = 39
               Left = 385
               Bottom = 315
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Ou' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_HangHoa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'tput = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_HangHoa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_HangHoa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "KETXUATCHAOGIA"
            Begin Extent = 
               Top = 2
               Left = 307
               Bottom = 180
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "DONVI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_KetXuatChaoGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_KetXuatChaoGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[10] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -30
      End
      Begin Tables = 
         Begin Table = "DANHSACHNHANVIEN"
            Begin Extent = 
               Top = 17
               Left = 338
               Bottom = 240
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "PHANQUYEN"
            Begin Extent = 
               Top = 6
               Left = 609
               Bottom = 126
               Right = 779
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PHANQUYEN_1"
            Begin Extent = 
               Top = 156
               Left = 605
               Bottom = 269
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PHANQUYEN_2"
            Begin Extent = 
               Top = 63
               Left = 59
               Bottom = 176
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_NHANVIEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_NHANVIEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_NHANVIEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 39
               Left = 333
               Bottom = 210
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DONVI"
            Begin Extent = 
               Top = 56
               Left = 108
               Bottom = 172
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 26
               Left = 543
               Bottom = 122
               Right = 713
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 138
               Left = 546
               Bottom = 234
               Right = 716
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TAIKHOANNEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TAIKHOANNEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_TAIKHOANNEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "THUCHI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Thu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Thu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "THUCHI"
            Begin Extent = 
               Top = 11
               Left = 389
               Bottom = 249
               Right = 559
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "YEUCAUDEN"
            Begin Extent = 
               Top = 97
               Left = 1057
               Bottom = 227
               Right = 1227
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "TRANGTHAI"
            Begin Extent = 
               Top = 212
               Left = 628
               Bottom = 308
               Right = 798
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DANHSACHNHANVIEN"
            Begin Extent = 
               Top = 160
               Left = 141
               Bottom = 344
               Right = 311
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TAIKHOAN"
            Begin Extent = 
               Top = 8
               Left = 141
               Bottom = 138
               Right = 311
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "KHACHHANG"
            Begin Extent = 
               Top = 6
               Left = 597
               Bottom = 136
               Right = 767
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         W' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ThuChi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'idth = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ThuChi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ThuChi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[8] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "XULYYEUCAUHOIGIA"
            Begin Extent = 
               Top = 0
               Left = 375
               Bottom = 320
               Right = 547
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "TRANGTHAI"
            Begin Extent = 
               Top = 6
               Left = 592
               Bottom = 119
               Right = 762
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_XuLyYC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_XuLyYC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "YEUCAUDEN"
            Begin Extent = 
               Top = 0
               Left = 353
               Bottom = 218
               Right = 523
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "DANHSACHNHANVIEN"
            Begin Extent = 
               Top = 165
               Left = 91
               Bottom = 328
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KHACHHANG"
            Begin Extent = 
               Top = 16
               Left = 88
               Bottom = 146
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DANHSACHNHANVIEN_1"
            Begin Extent = 
               Top = 165
               Left = 631
               Bottom = 295
               Right = 801
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TRANGTHAI_1"
            Begin Extent = 
               Top = 23
               Left = 579
               Bottom = 136
               Right = 749
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DANHSACHNGUOILIENHE"
            Begin Extent = 
               Top = 8
               Left = 801
               Bottom = 138
               Right = 971
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_YeuCauDen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_YeuCauDen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_YeuCauDen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 136
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CHAOGIA_Thang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CHAOGIA_Thang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HANGHOA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DAT_HANG"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PO"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PO_NoiDung"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DONVI"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 119
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'XNDATHANG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'XNDATHANG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'XNDATHANG'
GO
