-- Le Thi Huynh Nhu
-- PC09147
-- Tao database co ten QuanLyBDS
create database QuanLyBDS;

-- Khai bao database se su dung o cac cau lenh tiep theo
use QuanLyBDS;

-- Tao bang VanPhong
create table VanPhong (
	MaVP char(4) primary key,
    DiaDiemVP varchar(100),
    MaTruongPhong char(4)
);

-- Tao bang NhanVien
create table NhanVien (
	MaNhanVien char(4) primary key,
    HoTenNhanVien varchar(50) not null,
    MaVP char(4),
    foreign key (MaVP) references VanPhong(MaVP)
);

-- Tao bang ChuSoHuu
create table ChuSoHuu (
	MaSoCSH char(5) primary key,
    HoTenCSH varchar(50) not null,
    DiaChiCSH varchar(100) not null,
    SoDT char(10) not null
    );
    
    -- Tao bang BatDongSan
    create	table BatDongSan (
		MaSoBDS char(5) primary key,
        DiaChi varchar(100) not null,
        MaVP char(4),
        MaSoCSH char(5),
        foreign key (MaVP) references VanPhong(MaVP),
        foreign key (MaSoCSH) references ChuSoHuu(MaSoCSH)
    );
    
    -- Tao bang ThanNhan
    create table ThanNhan (
		MaNhanVien char(4),
        Ten varchar(50),
        NgaySinh date,
        MoiQuanHe varchar(10),
        primary key (MaNhanVien,Ten),
        foreign key (MaNhanVien) references NhanVien(MaNhanVien)
    );
    
    -- Bo sung khai bao khoa ngoai VanPhong(MaTruongPhong)
    -- se tham chieu toi NhanVien(MaNhanVien)
    alter table VanPhong
    add constraint FK_VanPhong 
    foreign key (MaTruongPhong) references NhanVien(MaNhanVien);
    
    -- Them cot QueQuan co kieu du lieu varchar(100) vao bang NhanVien
    alter table NhanVien
    add column QueQuan varchar(100);
    
    -- Xoa cot QueQuan khoi bang NhanVien
    alter table NhanVien
    drop column QueQuan;
    
    -- Them cot Luong vao bang NhanVien
    alter table NhanVien
    add column Luong float;
    
    -- Them rang buoc (Constraint) cho cot Luong (Luong >= 1000)
    alter table NhanVien
    add constraint Check_Luong
    check (Luong >= 1000);
    
    -- Xoa rang buoc Luong >= 1000 cua bang NhanVien
    alter table NhanVien
    drop constraint Check_Luong;
    
    /* Tao bang co ten ThanhPho, voi cac thuoc tinh 
		MaTP , kieu du lieu char(5) - la khoa chinh
        TenTP , kieu du lieu varchar(100)
        SoLuongDanCu , kieu du lieu int
	Yeu cau: Khong khai bao khoa chinh trong cau lenh CREATE Table
    Dung lenh ALTER TABLE de khai bao khoa chinh cho bang ThanhPho
    Tao rang buoc SoLuongDanCu phai lon hon 0 va nho hon 10 trieu
    */
    -- Tao bang ThanhPho
    create table ThanhPho (
		MaTP char(5),
        TenTP varchar(100),
        SoLuongDanCu int
    );
    -- Khai bao khoa chinh cho bang ThanhPho
    alter table ThanhPho
    add constraint PK_ThanhPho
    primary key (MaTP);
    
    -- Tao rang buoc cho 0 <= SoLuongDanCu <= 10000000
    alter table ThanhPho
    add constraint Check_SoLuongDanCu
    check (SoLuongDanCu >= 0 and SoLuongDanCu <= 10000000);
    
    