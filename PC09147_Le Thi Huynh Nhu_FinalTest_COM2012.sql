-- Le Thi Huynh Nhu
-- PC09147
-- 1.1 Viết câu lệnh tạo tạo Database có tên là: TEST1_MSSV
create database test1_pc09147;

use test1_pc09147;

-- 1.2 Viết câu lệnh tạo bảng và tạo liên kết như trong sơ đồ
create table HoaDon (
	SoHoaDon int primary key,
    NgayLapHoaDon date not null,
    MaKhachHang varchar(4) not null
);
create table Hang (
	MaHang varchar(3) primary key,
    TenHang varchar(50) not null,
    SoLuongTon int not null
);
create table ChiTietHoaDon (
	SoHoaDon int,
    MaHang varchar(3),
    SoLuongBan int,
    DonGia float
);

-- Them rang buoc khoa chinh, ngoai
alter table ChiTietHoaDon
add constraint PK_CTHD primary key (SoHoaDon,MaHang),
add constraint FK_HD foreign key (SoHoaDon) references HoaDon.SoHoaDon,
add constraint FK_H foreign key (MaHang) references Hang.MaHang;
-- Them rang buoc soluongban > 0
alter table ChiTietHoaDon
add constraint Check_SLB
check (SoLuongBan > 0);

-- Bai 2
insert into Hang
values ('SVM', 'Sữa Vinamilk', 50),
		('STH', 'Sữa TH Milk', 20),
        ('DBH', 'Đường Biên Hòa', 45),
        ('BCP', 'Bánh Chocopie', 5),
        ('KHD', 'Kẹo Hải Dương', 30);
        
insert into HoaDon
values (1,'2021-09-11','KH01'),
		(2,'2021-09-29','KH02'),
        (3,'2021-09-30','KH02'),
        (4,'2021-10-01','KH04'),
        (5,'2021-10-01','KH05'),
        (6,'2021-10-04','KH06');
        
insert into ChiTietHoaDon
values (1,'DBH',5,15),
		(1,'BCP',3,8),
        (2,'SVM',10,12),
        (3,'STH',2,13),
        (3,'DBH',10,15),
        (4,'DHG',3,11),
        (5,'BCP',1,8);
        
        
-- 3.1 Hiển thị thông tin các vận động viên đăng ký xe Yamaha màu đỏ
use test_1_wd19303;
select vdv.mavdv, vdv.tenvdv, vdv.tuoi,vdv.xephang
from vandongvien vdv 
inner join DangKy dk on vdv.mavdv = dk.mavdv
inner join xe x on dk.maxe = x.maxe
where x.hangsx = 'Yamaha' and x.mauxe = 'đỏ';

-- 3.2 Hiển thị thông tin các vận động viên tuổi trên 25 và có xếp hạng lớn hơn
-- vận động viên có mã vận động viên là 64. Kết quả hiển thị sắp xếp tăng dần theo tuổi
select * 
from vandongvien
where tuoi > 25
and xephang > (select xephang
				from vandongvien
                where mavdv = 64)
order by tuoi asc;

-- 3.3 Hiển thị thông tin các vận động viên có tên bắt đầu và kết thúc là ký tự B,
-- và tên có ít nhất 4 ký tự
select * 
from vandongvien
where tenvdv like 'B%B' and length(tenvdv) >= 4;

-- 3.4 Hiển thị thông tin các vận động viên chưa đăng ký chiếc xe nào, bao gồm:
-- Mã vận động viên, Tên vận động viên
select mavdv,tenvdv
from vandongvien
where mavdv not in (select mavdv from dangky);

-- 3.5 Hiển thị đầy đủ thông tin các loại xe và số lượng vận động viên đăng ký
-- tương ứng với từng loại xe
select xe.*,count(dk.mavdv) as 'so vdv'
from xe 
left join dangky dk on xe.maxe = dk.maxe
group by xe.maxe;













