use QuanLyNhanvien1;

select *
from Nhan_Vien;

select * 
from Phong_Ban;

-- Hiển thị ID_NhanVien, Ho_NV, Ten_NV, Ten_PB mà nhân viên đó đang làm việc 
select ID_NhanVien, Ho_NV, Ten_NV,Ten_PB
from Nhan_Vien, Phong_Ban
where Nhan_Vien.PHG = Phong_Ban.Ma_PB;

select *
from quanly_duan;

INSERT INTO DU_AN
VALUES	('DA01','Dự án 01','2023-05-01','2023-07-01'),
		('DA02','Dự án 02','2023-10-01','2023-10-29'),
        ('DA03','Dự án 03','2023-03-20','2023-06-15'),
        ('DA04','Dự án 04','2023-04-10','2023-09-27'),
        ('DA05','Dự án 05','2023-01-21','2023-08-31');
	
INSERT INTO QUANLY_DUAN
VALUES	('DA01','NV01','2023-05-01','2023-06-01',120,'Tư vấn'),
		('DA01','NV03','2023-05-15','2023-07-01',200,'Xây dựng'),
        ('DA02','NV04','2023-10-01','2023-10-29',150,'Giám sát'),
        ('DA03','NV07','2023-04-30','2023-05-25',90,'Tư vấn'),
        ('DA03','NV01','2023-03-20','2023-06-15',300,'Giám sát'),
        ('DA04','NV05','2023-04-10','2023-09-27',205,'Xây dựng'),
        ('DA05','NV08','2023-01-31','2023-05-30',400,'Xây dựng');
        
