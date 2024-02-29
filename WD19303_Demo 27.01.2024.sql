-- Le Thi Huynh Nhu
-- PC09147
use QuanLyNhanVien1;
-- Hiển thị ID_NV, ho_NV Ten_NV, Ma_duan, ten_duan, vai_tro
select	Nhan_Vien.ID_NhanVien, Nhan_Vien.Ho_NV, Nhan_Vien.Ten_NV, 
Du_An.Ma_DuAn, Du_An.Ten_DuAn, 
QuanLy_DuAn.Vai_Tro
from Nhan_Vien, Du_An, QuanLy_DuAn
where Nhan_Vien.ID_NhanVien = QuanLy_DuAn.Ma_NhanVien
	and Du_An.Ma_DuAn = QuanLy_DuAn.Ma_DuAn;
    
-- Cach 2 dung bi danh
select	NV.ID_NhanVien, NV.Ho_NV, NV.Ten_NV, 
DA.Ma_DuAn, DA.Ten_DuAn, 
QLDA.Vai_Tro
from Nhan_Vien NV, Du_An DA, QuanLy_DuAn QLDA
where NV.ID_NhanVien = QLDA.Ma_NhanVien
	and DA.Ma_DuAn = QLDA.Ma_DuAn;

-- Hiển thị ID_NV, ho_NV Ten_NV, Ten_PB, Ma_duan,ten_duan, vai_tro
select	NV.ID_NhanVien, NV.Ho_NV, NV.Ten_NV, 
		DA.Ma_DuAn, DA.Ten_DuAn, 
		QLDA.Vai_Tro,
		PB.Ten_PB
from Nhan_Vien NV, Du_An DA, QuanLy_DuAn QLDA, Phong_Ban PB
where NV.ID_NhanVien = QLDA.Ma_NhanVien
	and DA.Ma_DuAn = QLDA.Ma_DuAn
    and NV.PHG = PB.Ma_PB;
    
-- Sử dụng INNER JOIN để liên kết các bảng
select NV.ID_NhanVien, NV.Ho_NV, NV.Ten_NV, 
		DA.Ma_DuAn, DA.Ten_DuAn, 
		QLDA.Vai_Tro
from Nhan_Vien NV inner join QuanLy_DuAn QLDA on NV.ID_NhanVien = QLDA.Ma_NhanVien
		inner join Du_An DA on QLDA.Ma_DuAn = DA.Ma_DuAn;

select NV.ID_NhanVien,NV.Ho_NV,NV.Ten_NV,
		PB.Ten_PB,
        DA.Ma_DuAn, DA.Ten_DuAn,
        QLDA.Vai_Tro
from Phong_Ban PB inner join Nhan_Vien NV on PB.Ma_PB = NV.PHG
	inner join QuanLy_DuAn QLDA on NV.ID_NhanVien = QLDA.Ma_NhanVien
    inner join Du_An DA on QLDA.Ma_DuAn = DA.Ma_DuAn;

-- Viết câu truy vấn hiển thị các thông tin
select NV.Ho_NV, NV.Ten_NV, NV.Luong, DA.Ten_DuAn
from Phong_Ban PB inner join Nhan_Vien NV on PB.Ma_PB = NV.PHG
	inner join QuanLy_DuAn QLDA on NV.ID_NhanVien = QLDA.Ma_NhanVien
    inner join Du_An DA on QLDA.Ma_DuAn = DA.Ma_DuAn
where DA.Ngay_BatDau = '2016-01-01'
	and PB.Ten_PB like '%Thiết Kế%';
    
insert into Phong_Ban(Ma_PB, Ten_PB)
values ('VP06','Phòng Nhân Sự'),
		('VP07', 'Phòng Y Tế');
select *
from Phong_Ban;

-- Hiển thị tất cả Ma_PB Ten_PB kèm theo ID_NV, Ho_NV, TenNV đang làm việc tại phòng ban đó

select PB.Ma_PB, PB.Ten_PB,
NV.ID_NhanVien, NV.Ho_NV, NV.Ten_NV
from Phong_Ban PB, Nhan_Vien NV
where PB.Ma_PB = NV.PHG
order by PB.Ma_PB asc;

select PB.Ma_PB, PB.Ten_PB,
NV.ID_NhanVien, NV.Ho_NV, NV.Ten_NV
from Phong_Ban PB left outer join Nhan_Vien NV
		on PB.Ma_PB = NV.PHG
order by PB.Ma_PB asc;

select PB.Ma_PB, PB.Ten_PB,
NV.ID_NhanVien, NV.Ho_NV, NV.Ten_NV
from Nhan_Vien NV right outer join Phong_Ban PB 
		on PB.Ma_PB = NV.PHG
order by PB.Ma_PB asc;

-- Hiển thị số lượng nhân viên làm việc theo từng phòng ban
select 