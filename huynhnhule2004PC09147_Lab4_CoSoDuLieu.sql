-- Le Thi Huynh Nhu
-- PC09147

-- Tao database co ten QuanLyBanHang
create database QuanLyBanHang;
use QuanLyBanHang;

-- Tao bang KhachHang
create table KhachHang (
	MaKH char(4) primary key,
    HoTen varchar(50) not null,
    DiaChi varchar(100) not null,
    SoDT char(10), 
    DoanhSo float,
    NgayDangKy date not null,
    NgaySinh date
);

-- Tao bang HoaDon
create table HoaDon (
	SoHoaDon int primary key,
    NgayMuaHang date not null,
    TriGia float,
    MaKH char(4),
    MaNV char(4)
);

-- Tao bang NhanVien
create table NhanVien (
	MaNV char(4) primary key,
    HoTen varchar(50) not null,
    SoDT char(10),
    NgayVaoLam date not null
);

-- Tao bang SanPham
create table SanPham (
	MaSP char(4) primary key,
    TenSP varchar(50) not null,
    Gia float not null,
    DonViTinh varchar(20) not null,
    NuocSanXuat varchar(40) not null
);

-- Tao bang HoaDonChiTiet
create table HoaDonChiTiet (
	MaSP char(4),
    SoHoaDon int,
    SoLuong int not null,
    primary key (MaSP, SoHoaDon),
    foreign key (MaSP) references SanPham(MaSP),
    foreign key (SoHoaDon) references HoaDon(SoHoaDon)
);

-- Bo sung khai bao khoa ngoai
alter table HoaDon
add constraint FK_HoaDon
foreign key (MaKH) references KhachHang(MaKH);

alter table HoaDon
add constraint FK_Hoadon1
foreign key (MaNV) references NhanVien(MaNV);

-- 2.Thêm vào thuộc tính GhiChu có kiểu dữ liệu varchar(20) cho quan hệ (bảng) SanPham
alter table SanPham
add column GhiChu varchar(20);

-- 3.Thêm vào thuộc tính LoaiKH có kiểu dữ liệu tinyint cho quan hệ (bảng) KhachHang
alter table KhachHang
add column LoaiKH tinyint;

-- 4.Sửa kiểu dữ liệu của thuộc tính GhiChu trong quan hệ (bảng) SanPham thành varchar(100).
alter table SanPham
modify column GhiChu varchar(100);

-- 5. Xóa thuộc tính GhiChu trong quan hệ (bảng) SanPham
alter table SanPham
drop column GhiChu;

-- 6. Tạo ràng buộc cho yêu cầu: Ngày đăng ký (NgayDangKy) của Khách hàng phải lớn hơn Ngày sinh (NgaySinh) của Khách hàng.
alter table KhachHang
add constraint Check_KhachHang
check (NgayDangKy > NgaySinh);

-- 7. Tạo ràng buộc Giá Sản Phẩm phải lớn hơn 0
alter table SanPham
add constraint Check_Price
check (Gia >= 0);

-- 8. Tạo ràng buộc Đơn vị tính (DonViTinh) của Sản Phẩm chỉ có thể nhập các giá trị (“Cây”, “Hộp”, “Thùng”).
alter table SanPham
add constraint Check_DonViTinh
check (DonViTinh In ('Cây', 'Hộp', 'Thùng'));