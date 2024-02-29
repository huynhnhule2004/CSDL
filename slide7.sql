use QuanLyNhanVien1;

-- Tạo 1 bảng mới với tên Nhan_Vien_Test
-- Copy toàn bộ dữ liệu từ bảng Nhan_Vien sang Nhan_Vien_Test

create table Nhan_Vien_Test
select *
from Nhan_Vien;

select *
from Nhan_Vien_Test;

-- Copy toàn bộ các nhân viên có địa chỉ ở Cần Thơ sang 
-- bảng mới với tên Nhan_Vien_Can_Tho
create table Nhan_Vien_Can_Tho
select * 
from Nhan_Vien
where Dia_Chi = 'Cần Thơ'; 

select * from Nhan_Vien_Can_Tho;

-- Viết câu lệnh tạo ra 1 bảng mới có tên DuAn_2016
-- lấy dữ liệu từ bảng DuAn có
-- ngày bắt đầu và ngày kết thúc trong năm 2016
insert into Du_An(Ma_DuAn, Ten_DuAn, Ngay_BatDau, Ngay_KetThuc)
values ('DA06', 'Dự án 06', '2023-11-09', '2024-05-09'),
		('DA07', 'Dự án 07', '2023-12-01', '2024-12-30');
select * from Du_An;

create table DuAn_2023
select * 
from Du_An
where year(Ngay_BatDau) = 2023 and year(Ngay_KetThuc) = 2023;

select * from DuAn_2023;

-- Viết câu lệnh cập nhật lại lương cho các nhân viên
-- tăng lên 10% nếu nhân viên thuộc phòng ban có tên 'Thiết kế'
select * from Nhan_Vien;

update Nhan_vien
set Luong = Luong + Luong*0.1
where PHG in (select Ma_PB
				From Phong_Ban
                where Ten_PB like '%Thiết kế%');
select * from Nhan_Vien;

-- Cập nhật lại lương cho các nhân viên
-- có tham gi vào dự án có mã 'DA01' lên 50
select * from QuanLy_DuAn;
update Nhan_Vien
set Luong = Luong + 50
where ID_NhanVien in (select Ma_NhanVien
						from QuanLy_DuAn
                        where Ma_DuAn='DA01');
                        
-- Cập nhật lại cột mã trưởng phòng
-- cho phòng ban có tên "Thiết kế 2D"
-- với giá trị mới là mã nhân viên có tên "Kiều Minh Tuấn"
select * from Phong_Ban;

update Phong_Ban
set Ma_TruongPhong = (select ID_NhanVien
						from Nhan_Vien
						where Ho_NV = 'Kiều Minh' and Ten_NV = 'Tuấn')
where Ten_PB like '%Thiết kế 2D%';

-- Xóa các dự án có ngày bắt đầu 
-- và ngày kết thúc sau ngày '01/11/2023'
delete from Du_An
where Ngay_BatDau > '2023-11-01'
	and Ngay_KetThuc > '2023-11-01';
    
    
