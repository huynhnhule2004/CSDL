-- Le Thi Huynh Nhu
-- PC09147

-- Y4. Tạo các bảng trong CSDL, tạo các ràng buộc: khoá chính, khoá ngoại, ràng buộc duy nhất, ràng buộc kiểm tra ...
-- Tạo CSDL QuanLyThuVien
create database QuanLyThuVien;
use QuanLyThuVien;

-- Tạo bảng SinhVien
create table SinhVien (
	MaSinhVien varchar(10) primary key,
    TenSinhVien varchar(50) not null,
    NgayHetHan date not null,
    ChuyenNganh varchar(50),
    Email varchar(50) not null,
    SDT varchar(10) not null
);

-- Tao bang LoaiSach
create	table LoaiSach (
	MaLoai varchar(10) primary key,
    TenLoai varchar(50) not null
);

-- Tao bang Sach
create	table Sach (
	MaSach varchar(10) primary key,
    TenSach varchar(50) not null,
    TacGia varchar(50),
    NhaXuatBan varchar(50) not null,
    SoLuongBanSao int not null,
    SoTrang int,
    GiaTien float not null,
    ViTri varchar(50) not null,
    NgayNhapKho date,
    MaLoai varchar(10),
    foreign key (MaLoai) references LoaiSach(MaLoai)
);

-- Tao bang PhieuMuon
create table PhieuMuon (
	SoPhieuMuon int auto_increment primary key,
    TenSach varchar(50) not null,
    NgayMuon date not null,
    NgayTra date not null,
    MaSinhVien varchar(10),
    foreign key (MaSinhVien) references SinhVien(MaSinhVien)
);

-- Tao bang ChiTietPhieuMuon
create table ChiTietPhieuMuon (
	SoPhieuMuon int,
    MaSach varchar(10),
    GhiChu varchar (255),
    primary key (SoPhieuMuon, MaSach),
    foreign key (SoPhieuMuon) references PhieuMuon(SoPhieuMuon),
    foreign key (MaSach) references Sach(MaSach)
);

-- Them cac rang buoc
-- So trang phai lon hon 5
alter table Sach
add constraint check_SoTrang
check (SoTrang > 5);

-- So luong ban sao phai lon hon 1
alter table Sach
add constraint check_SoLuongBanSao
check (SoLuongBanSao > 1);

-- Gia tien phai lon hon 0
alter table Sach
add constraint check_GiaTien
check (GiaTien > 0);

-- Ngay tra sach >= Ngay muon sach
alter table PhieuMuon
add constraint check_Ngay
check (NgayTra >= NgayMuon);

-- Email duy nhất
alter table SinhVien
add constraint Unique_Email
unique (Email);

-- SDT duy nhất
alter table SinhVien
add constraint Unique_SDT
unique (SDT);

-- Y5. Nhập dữ liệu vào cho các bảng (ít nhất 5 bản ghỉ trên mỗi bảng)
-- Nhập liệu cho bảng SinhVien
insert into SinhVien
values ('PC01', 'Nguyễn Việt Hoàng', '2025-08-25', 'Lập trình Web', 'hoangvnpc01@gmail.com', '0345562994'),
		('PC02', 'Trần Minh Hiếu', '2025-08-25', 'Thiết kế đồ họa', 'hieutmpc02@gmail.com', '0343782098'),
        ('PC03', 'Hà Tuấn Anh', '2025-08-25', 'Ứng dụng phần mềm', 'anhhtpc03@gmail.com', '0378892447'),
        ('PC04', 'Lê Thị Huỳnh Như', '2025-08-25', 'Lập trình Web', 'nhulthpc04@gmail.com', '0364402449'),
        ('PC05', 'Huỳnh Xuân Nhi', '2025-08-25', 'Thiết kế đồ họa', 'nhihxpc05@gmail.com', '0345562994');

-- Nhập liệu cho bảng LoaiSach
insert into LoaiSach
values ('IT', 'Công nghệ thông tin'),
		('KT', 'Kinh tế'),
        ('DL', 'Du lịch'),
        ('VH', 'Văn học'),
        ('NN', 'Ngoại ngữ');
        
-- Nhập liệu cho bảng Sach
insert into Sach
values ('IT01', 'Lập trình và cuộc sống', 'Jeff Atwood', 'Thanh Niên', 25, 324, 159000, 'Sách Công nghệ thông tin','2020-06-05', 'IT'),
		 ('KT01', 'Chiến Tranh Tiền Tệ', 'Song Hong Bing', 'Lao Động', 10, 532, 107250, 'Sách Kinh tế','2023-03-01', 'KT'),
         ('DL01', 'Những Mảng Màu Du Lịch Việt Nam', 'Phan Huy Xu, Võ Văn Thành', 'Tổng Hợp TPHCM', 9, 314, 121500, 'Sách Du lịch', '2019-07-17','DL'),
         ('VH01', 'Những Tấm Lòng Cao Cả', 'Edmondo De Amicis', 'Văn Học', 20, 416, 106200, 'Sách Văn học','2022-08-25', 'VH'),
         ('NN01', 'Tiếng Anh Cho Người Bắt Đầu', 'Trang Anh, Minh Anh', 'Hồng Đức', 50, 467, 149000, 'Sách Ngoại ngữ','2019-05-10', 'NN'),
         ('IT02', 'SQL For Dummies', 'Allen G.Talylor', 'Hồng Đức', '100', 295, 226000, 'Sách Công nghệ thông tin', '2017-12-03','IT');
         
-- Nhập liệu cho bảng PhieuMuon
insert into PhieuMuon(TenSach, NgayMuon, NgayTra, MaSinhVien)
values ('Chiến tranh tiền tệ','2017-01-12','2017-01-15','PC01'),
		('Những tấm lòng cao cả','2023-12-15','2023-12-18','PC02'),
        ('SQL For Dummies','2023-12-20','2023-12-22','PC03'),
        ('Lập trình và cuộc sống','2024-01-02','2024-01-05','PC04'),
        ('Tiếng Anh cho người bắt đầu','2024-01-10','2024-01-12','PC05');
        
-- Nhập liệu cho bảng ChiTietPhieuMuon
insert into ChiTietPhieuMuon
values (1,'KT01','Đã trả'),
		(2,'VH01','Đã trả'),
        (3,'IT02','Đã trả'),
        (4,'IT01','Chưa trả'),
        (5,'NN01','Chưa trả');
        
-- Y6. Viết các câu truy vấn sau:
-- 6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả thuộc loại sách có mã “IT”.
select TenSach, MaSach, GiaTien, TacGia
from Sach
where MaLoai = 'IT';

-- 6.2 Liệt kê các phiếu mượn gồm các thông tin số phiếu mượn, mã sách , ngày mượn, mã sinh viên có ngày mượn trong tháng 01/2017.
select PM.SoPhieuMuon, CTPM.MaSach, PM.NgayMuon, PM.MaSinhVien
from PhieuMuon PM inner join ChiTietPhieuMuon CTPM on PM.SoPhieuMuon = CTPM.SoPhieuMuon
where PM.NgayMuon like '2017-01%';

-- 6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.
select *
from PhieuMuon PM inner join ChiTietPhieuMuon CTPM on PM.SoPhieuMuon = CTPM.SoPhieuMuon
where CTPM.GhiChu like 'Chưa trả'
order by PM.NgayMuon asc;

-- 6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số lượng sách mỗi loại).
select S.MaLoai, LS.TenLoai, count(LS.MaLoai) as 'SoDauSach'
from Sach S inner join LoaiSach LS on S.MaLoai = LS.MaLoai
group by S.MaLoai, LS.TenLoai;

-- 6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
select MaSinhVien, count(MaSinhVien) as 'SoLuotMuon' 
from PhieuMuon
group by MaSinhVien;

-- 6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.
SELECT *
FROM sach
WHERE TenSach like '%SQL%';

-- 6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã
-- phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
select SV.MaSinhVien, SV.TenSinhVien, PM.SoPhieuMuon, S.TenSach, PM.NgayMuon, PM.NgayTra
from SinhVien SV inner join PhieuMuon PM on SV.MaSinhVien = PM.MaSinhVien
				inner join ChiTietPhieuMuon CTPM on CTPM.SoPhieuMuon = PM.SoPhieuMuon
                inner join Sach S on S.MaSach = CTPM.MaSach
order by NgayMuon;

-- 6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 20 lần.
select S.MaSach, count(CTPM.MaSach) as 'SoLanMuon'
from Sach S inner join ChiTietPhieuMuon CTPM on CTPM.MaSach = S.MaSach
group by S.MaSach
having count(CTPM.MaSach) > 20;

-- 6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm 2014 giảm 30%.
update Sach set GiaTien = GiaTien - GiaTien*0.3
where year(NgayNhapKho) < '2014';

-- 6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã sinh viên PC04 
update ChiTietPhieuMuon CTPM inner join PhieuMuon PM on CTPM.SoPhieuMuon = PM.SoPhieuMuon
set GhiChu = 'Đã trả'
where MaSinhVien = 'PC04';

-- 6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn,
-- tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
select PM.SoPhieuMuon, SV.TenSinhVien, SV.Email, PM.NgayMuon,
	GROUP_CONCAT(S.TenSach) AS DanhSachSachMuon,
	datediff(CURRENT_DATE(), PM.NgayTra) as 'SoNgayQuaHan'
from PhieuMuon PM inner join SinhVien SV on SV.MaSinhVien = PM.MaSinhVien
				inner join ChiTietPhieuMuon CTPM on PM.SoPhieuMuon = CTPM.SoPhieuMuon
                inner join Sach S on S.MaSach = CTPM.MaSach
where CTPM.GhiChu like 'Chưa trả'
and datediff(CURRENT_DATE(), PM.NgayTra) > 0
GROUP BY PM.SoPhieuMuon, SV.TenSinhVien, SV.Email, PM.NgayMuon;

-- 6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có lượt mượn lớn hơn 10
UPDATE Sach
SET SoLuongBanSao = SoLuongBanSao + 5
WHERE MaSach IN (
    SELECT MaSach
    FROM (
        SELECT MaSach, COUNT(*) AS LuotMuon
        FROM ChiTietPhieuMuon
        GROUP BY MaSach
    ) AS T
    WHERE LuotMuon > 10
);
                
-- 6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước '1/1/2010'
DELETE FROM PhieuMuon
WHERE NgayMuon < '2010-01-01' AND NgayTra < '2010-01-01';
   




