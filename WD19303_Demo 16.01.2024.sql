-- Le Thi Huynh Nhu
-- MSSV: PC09147
-- Tao database co ten QuanLyNhanVien
create database QuanLyNhanVien;
create database QuanLyNhanVien1;

-- Xoa database co ten QuanLyNhanVien1
drop database QuanLyNhanVien1;
-- Khai bao database da duoc su dung
use QuanLyNhanVien;
create table VanPhong (
	MaVP char(4) primary key, -- primary key: khai bao khoa chinh
    DiaChiVP varchar(150) not null, -- not null: khong duoc de trong
    SoDienThoaiVP char(10)
);

-- Tao bang NhanVien
create table NhanVien (
	MaNV char(5) primary key,
    HoTenNV varchar(50),
    GioiTinh bit,
    NgaySinh date,
    SoDienThoaiNV char(10),
    MaVP char(4) references VanPhong(MaVP) -- Khai bao khoa ngoai
);