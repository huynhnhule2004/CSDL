create database QuanLyNhanVien_01022004;
use QuanLyNhanVien_01022004;

select * from Nhan_Vien;

select * from Phong_Ban;

select * from Nhan_Vien, Phong_Ban
where PHG = Ma_PB;

-- Xóa các phòng ban chưa có nhân viên 
select * from Phong_Ban;

delete from Phong_Ban
where Ma_PB not in (select PHG
					from Nhan_Vien
                    where PHG is not null);
