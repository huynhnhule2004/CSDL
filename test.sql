-- Le Thi Huynh Nhu
-- PC09147

-- PHAN 1
-- 1.1 Viết câu lệnh SQL để tạo CSDL QLSINHVIEN_MSSV, câu lệnh SQL tạo 3 bảng
create database QLSinhVien_PC09147;

use QLSinhVien_PC09147;

create table SinhVien ( 
	MSSV char(7),
    HoTenSV char(50),
    NgaySinh date
);
create table LopMH (
	MaLop char(7),
    HKNH char(50),
    MaMon char(7),
    MaGV varchar(20)
);
create table Diem ( 
	MSSV char(7),
    MaLop char(7),
    Diem float
);
-- 1.2 Viết câu lệnh SQL tạo khóa chính, khóa ngoại 
alter table SinhVien
add constraint PK_sinhvien primary key (MSSV);

alter table LopMH
add constraint PK_lopmh primary key (MaLop);

alter table Diem
add constraint PK_diem primary key (MSSV,MaLop);

alter table diem
add constraint FK_diem_sv foreign key (MSSV) references sinhvien(MSSV);

alter table diem
add constraint FK_diem_lopmh foreign key (MaLop) references Lopmh(MaLop);


-- 1.3 Viết lệnh tạo ràng buộc cho cột Điểm (Điểm phải từ 0 – 10)
alter table Diem 
add constraint ck_Diem check (Diem >=0 and Diem <=10);

-- 1.4 Viết câu lệnh thêm dữ liệu cho 3 bảng (mỗi bảng tối thiểu 2 dòng dữ liệu
insert into SinhVien
values ('PC06789', 'Nguyen Van Binh', '2005-08-10'),
		('PC04567', 'Le Thi Thanh', '2005-11-20');
        
insert into LopMH
values ('wd19302', 'Spring 2024', 'com2012', 'NgocND9'),
		('WD19303', 'spring 2024', 'web1013','NgocPH11');
        
insert into Diem 
values ('PC094567', 'wd19302', 7.5),
		('PC06789', 'wd19303', 8.9);
        
-- PHAN 2
use congtrinh;
-- 1) Hiển thị thông tin các công trình ở Soc Trang, kinh phí từ 60000 đến 100000.
-- Thông tin hiển thị: tất cả các thông tin liên quan đến công trình
use congtrinh;
-- 2.1 Hiển thị thông tin các công trình ở Soc Trang, kinh phí từ 60000 đến 100000.
-- Thông tin hiển thị: tất cả các thông tin liên quan đến công trình
select * 
from CongTrinh
where TinhThanh = 'Soc Trang' and KinhPhi between 60000 and 100000;

-- 2.2 Hiển thị kinh phí trung bình của các công trình ở Can Tho
select avg(KinhPhi) as 'Kinh phi TB Can Tho'
from congtrinh 
where TinhThanh = 'Can Tho';

-- 2.3 Hiển thị thông tin các công trình có kinh phí cao hơn kinh phí trung bình của các công trình
select * 
from CongTrinh
where KinhPhi > (select avg(kinhPhi)
					from CongTrinh);
                    
-- 2.4 Hiển thị những chủ nhân quản lý từ 3 công trình trở lên. Thông tin
-- hiển thị: TENCHU,PHAI,DIACHI, SLCONGTRINH. Sắp xếp giảm dần theo số
-- công trình
select cn.TenChu, cn.Phai, cn.DiaChiChu, count(ct.sttct) as 'So luong cong trinh'
from ChuNhan cn inner join congtrinh ct
on cn.mscn = ct.mscn
group by cn.TenChu, cn.Phai, cn.DiaChiChu
having count(STTCT) >= 3
order by count(STTCT) desc;

-- 2.5 Hiển thị chủ thầu tham gia nhiều công trình nhất. Thông tin hiển thị: TENTHAU, SLCONGTRINH
select ct.msct, ct.tenthau, count(sttct) as 'SL Cong Trinh'
from chuthau ct inner join congtrinh ctr
on ct.msct = ctr.msct
group by ct.msct, ct.tenthau
order by count(sttct) desc
limit 2; -- tim hieu cach khac

--  2.6 Viết câu truy vấn hiển thị danh sách các kiến trúc sư thiết kế công trình Khach san Ninh Kieu
select tk.mskts, tk.thulao
from thietke tk, congtrinh ct
where tk.sttct = ct.sttct
and tenCT = 'Khach san Ninh Kieu';

-- 2.7 Cập nhật tăng 20% thù lao công trình Khach san Ninh Kieu
update thietke
set thulao = thulao+ thulao*0.2
where sttct in (select sttct
					from CongTrinh
                    where TenCT = 'Khach san Ninh Kieu');

select * from ThietKe;
-- 2.8 Cập nhật kinh phí giảm 10% các công trình chưa có kiến trúc sư tham gia thiết kế
update congtrinh
set kinhphi = kinhphi - kinhphi * 0.1
where sttct not in (select sttct
						from thietke );

-- 2.9 Cho biết mã kiến trúc sư có thù lao trung bình nhỏ nhất
select mskts
from thietke
where thulao = (select min(thulao)
					from thietke);


-- 10) Cho biết tỉnh thành nào nhận nhiều kinh phí nhất. Thông tin hiển thị: TINHTHANH, TONGKINHPHI
select tinhthanh, sum(kinhphi) as 'tongkinhphi'
from congtrinh
group by tinhthanh
order by sum(kinhphi) desc
limit 1;

-- 2.11 Hiển thị TENCT có kinh phí nhiều hơn kinh phí trung bình ở Soc Trang va khong hien thi o soc trang
select *
from congtrinh 
where kinhphi > (select avg(kinhphi) as tongkinhphi
					from congtrinh
					where tinhthanh = 'soc trang')
and tinhthanh != 'soc trang';
    
    
-- 2.12 Tạo ra 1 bảng mới với tên “CONGTRINH_CANTHO1994” dùng để lưu trữ các Công trình có tỉnh thành là Can Tho và NgayBD thuộc năm 1994

-- Tạo bảng mới CONGTRINH_CANTHO1994
CREATE TABLE CONGTRINH_CANTHO1994 
select *
from CongTrinh
where TinhThanh = 'Can Tho' and year(NgayBD) = 1994;



select * from congtrinh_cantho1994;
-- delete


