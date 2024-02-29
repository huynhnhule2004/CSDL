-- Nguyen Dinh Ngoc
-- PC06789

-- Tao CSDL QuanLyNhanVien1
CREATE DATABASE QuanLyNhanVien1;

-- Su dung QuanLyNhanVien1
USE QuanLyNhanVien1;

-- Tao bang PHONG_BAN
CREATE TABLE PHONG_BAN (
	MA_PB char(4) PRIMARY KEY,
    TEN_PB varchar(50),
    MA_TRUONGPHONG char(4)
);

-- Tao bang NHAN_VIEN
CREATE TABLE NHAN_VIEN (
	ID_NhanVien char(4) PRIMARY KEY,
    HO_NV varchar(30),
    TEN_NV varchar(10),
    NAM_SINH year,
    DIA_CHI varchar(100),
    GIOI_TINH varchar(3),
    LUONG float,
    PHG char(4),
    FOREIGN KEY (PHG) REFERENCES PHONG_BAN(MA_PB)
);

-- Tao bang DU_AN
CREATE TABLE DU_AN (
	MA_DUAN char(4) PRIMARY KEY,
    TEN_DUAN varchar(100),
    NGAY_BATDAU date,
    NGAY_KETTHUC date
);

-- Tao bang QUANLY_DUAN
CREATE TABLE QUANLY_DUAN (
	MA_DUAN char(4),
    MA_NHANVIEN char(4),
    NGAY_THAM_GIA date,
    NGAY_KET_THUC date,
    SO_GIO int,
    VAI_TRO varchar(50),
    PRIMARY KEY (Ma_DUAN,MA_NHANVIEN),
    FOREIGN KEY (MA_DUAN) REFERENCES DU_AN(MA_DUAN),
    FOREIGN KEY (MA_NHANVIEN) REFERENCES NHAN_VIEN(ID_NhanVien)
);


-- NHAP DU LIEU CHO CAC BANG
-- 1. Nhap lieu bang PHONG_BAN
INSERT INTO PHONG_BAN
VALUES ('VP01','Phòng Thiết kế','NV01'),
		('VP02','Phòng Sản xuất','NV02'),
        ('VP03','Phòng Kinh doanh','NV03'),
        ('VP04','Phòng Marketing','NV04'),
        ('VP05','Phòng Kế Toán','NV05');
        
-- Nhap lieu cho bang NHAN_VIEN
INSERT INTO NHAN_VIEN
VALUES ('NV01','Lê Văn','Cường','1995','Cần Thơ','Nam',1500,'VP01'),
		('NV02','Nguyễn Kim','Thúy','1990','Cà Mau','Nữ',1350,'VP02');
-- Nhap bo sung du lieu cho bang NHAN_VIEN
INSERT INTO NHAN_VIEN
VALUES ('NV03','Trần Quyết','Thắng','1982','An Giang','Nam',1400,'VP03'),
		('NV04','Dương Trúc','Đào','2000','Hậu Giang','Nữ',1150,'VP04'),
        ('NV05','Lê Trần Thúy','Liễu','1987','Bạc Liêu','Nữ',1225,'VP05'),
        ('NV06','Huỳnh Trúc','Giang','1988','Cần Thơ','Nữ',900,'VP01'),
		('NV07','Kiều Minh','Tuấn','1988','TP.HCM','Nam',1000,'VP02'),
        ('NV08','Ninh Dương Lan','Ngọc','1987','Kiên Giang','Nữ',1100,'VP04');
        
-- Hien thi toan bo du lieu trong bang PHONG_BAN
SELECT * FROM PHONG_BAN; 

-- Hien thi toan bo du lieu trong bang NHAN_VIEN
SELECT * FROM NHAN_VIEN;   

-- Hien thi ID_NhanVien, Ho, Ten, Nam Sinh, Dia Chi va Luong cua cac Nhan Vien
SELECT ID_NhanVien, HO_NV, TEN_NV, NAM_SINH, DIA_CHI, LUONG
FROM NHAN_VIEN;

-- Hien thi toan bo du lieu cua cac Nhan Vien co Dia Chi o Can Tho
SELECT * FROM NHAN_VIEN
WHERE DIA_CHI = 'Cần Thơ';

-- Hien thi toan bo du lieu cua cac Nhan Vien nam
SELECT * FROM NHAN_VIEN
WHERE GIOI_TINH = 'Nam';   


        

        






