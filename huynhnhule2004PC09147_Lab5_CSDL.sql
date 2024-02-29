-- Le Thi Huynh Nhu
-- PC09147

-- Tạo database QuanLyBanHang1
create	database QuanLyBanHang1;

-- Sử dụng database QuanLyBanHang1
use QuanLyBanHang1;

-- Tao các bảng của database QuanLyBanHang1
-- Tạo bảng KhacHang
create table KhachHang ( 
	MaKhachHang char(5) primary key,
    HoVaTenLot varchar(50),
    Ten varchar(50),
    DiaChi varchar(255),
    Email varchar(50),
    DienThoai varchar(13)
);
-- Tạo bảng SanPham
create table SanPham (
	MaSanPham int auto_increment primary key, -- tự sinh
    MoTa varchar(255),
    Soluong int,
    DonGia float,
    TenSanPham varchar(50)
);

-- Tạo bảng HoaDon
create table HoaDon (
	MaHoaDon int primary key,
    NgayMuaHang date,
    MaKhachHang char(5),
    TrangThai varchar(30),
    foreign key (MaKhachHang) references KhachHang(MaKhachHang)
);


-- Tạo bảng HoaDonChiTiet
create table HoaDonChiTiet (
	MaHoaDon int,
    MaSanPham int,
    SoLuong int,
    MaHoaDonChiTiet int primary key auto_increment,
    foreign key (MaHoaDon) references HoaDon(MaHoaDon),
    foreign key (MaSanPham) references SanPham(MaSanPham)
);


-- Thêm các ràng buộc 
-- Thêm ràng buộc SoLuong >= 0 trong bảng SanPham
alter table SanPham
add constraint Check_SoLuong
check (SoLuong >= 0);

-- Thêm ràng buộc DonGia >=0 trong bảng SanPham
alter table SanPham
add constraint check_SanPham
check (DonGia >= 0);

-- Nhập dữ liệu cho các bảng (Nhập ít nhất 8 bản ghi cho từng bảng)
-- Nhập dữ liệu cho bảng KhacHang
insert into KhachHang
values ('KH001','Lê Thị Huỳnh','Như','Càng Long, Trà Vinh','huynhnhule2004@gmail.com','0364402449'),
		('KH002','Trần Minh','Hiếu','Sơn Trà, Đà Nẵng','tranminhhieu123@gmail.com','0362347865'),
        ('KH003','Lê Thanh','Hải','Hải Châu, Đà Nẵng','lethanhhai123@gmail.com','0347789365'),
        ('KH004','Trần Lê Vy','Thanh','Bình Thủy, Cần Thơ','tranlevythanh456@gmail.com','0245678993'),
        ('KH005','Huỳnh Xuân','Nhi','Vĩnh Thuận, Kiên Giang','huynhxuannhi123@gmail.com','0256678335'),
        ('KH006','Nguyễn Thị Phương','Thảo','Long Thành, Đồng Nai','nguyenthiphuongthao123@gmail.com','0356784667'),
        ('KH007','Ngô Gia','Linh','Châu Đốc, An Giang','ngogialinh123@gmail.com','0362784997'),
        ('KH008','Ngô Gia','Lập','Cái Răng, Cần Thơ','ngogialap123@gmail.com','0362789337');

-- Nhập dữ liệu cho bảng SanPham
insert into SanPham(MoTa, SoLuong, DonGia, TenSanPham)
values ('Sữa đặc có đường',300,2800,'Sữa Ông Thọ'),
		('Đường tinh khiết',49,2100,'Đường Biên Hòa'),
        ('Nước ngọt có ga',200, 1300,'Nước ngọt Coca-cola'),
        ('Dầu ăn thực vật',100,35000,'Dầu đậu nành'),
        ('Hạt nêm',45,30000,'Hạt nêm Knorr'),
        ('Bột ngọt',30, 28000,'Bột ngọt ajinomoto'),
        ('Muối',45, 12000,'Muối Tây Ninh'),
        ('Nước mắm',60, 30000,'Nước mắm Phú Quốc'),
        ('Tương ớt',37, 10000,'Tương ớt Chinsu');
        
-- Nhập dữ liệu cho bảng HoaDon
insert into HoaDon
values (1,'2024-01-01','KH001','Đã thanh toán'),
		(2,'2016-01-04','KH001','Chưa thanh toán'),
        (3,'2024-01-5','KH002','Đã thanh toán'),
        (4,'2016-01-9','KH003','Đã thanh toán'),
        (5,'2024-01-10','KH004','Đã thanh toán'),
        (6,'2016-12-11','KH005','Chưa thanh toán'),
        (7,'2024-01-12','KH006','Đã thanh toán'),
        (8,'2016-12-15','KH007','Đã thanh toán'),
        (9,'2024-01-20','KH008','Chưa thanh toán');
        
-- Nhập dữ liệu cho bảng HoaDonChiTiet
insert into HoaDonChiTiet(MaHoaDon,MaSanPham,SoLuong)
values (1,'2',5),
		(1,'4',7),
        (1,'7',3),
        (2,'1',10),
        (3,'3',5),
        (3,'5',4),
        (4,'6',15),
        (5,'1',5),
        (6,'8',7),
        (7,'9',2),
        (8,'4',5),
        (1,'3',2),
        (1,'5',3);
-- Phần 1
-- a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
select * 
from KhachHang;

-- b. Hiển thị 5 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, họ và tên, email, số điện thoại
select MaKhachHang,concat(HoVaTenLot,' ',Ten) as HoVaTen,Email,DienThoai
from KhachHang
limit 5;
-- c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select MaSanPham, TenSanPham, DonGia*SoLuong as 'Tong tien ton kho'
from SanPham;

-- d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột hoVaTenLot và Ten
select MaKhachHang, concat(HoVaTenLot,' ',Ten) as HoVaTen, DiaChi
from KhachHang
where Ten like 'H%';

-- e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
select *
from KhachHang
where DiaChi like '%Đà Nẵng%';

-- f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select * 
from SanPham
where SoLuong between 100 and 500;

-- g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng trong năm 2016
select *
from HoaDon
where TrangThai = 'Chưa thanh toán' and year(NgayMuaHang) = '2016';

-- h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003, KH006
select *
from HoaDon
where MaKhachHang in ('KH001','KH003','KH006');


-- Phần 2
-- a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) as 'So luong khach hang'
from KhachHang;

-- b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(DonGia) as 'Don gia lon nhat'
from SanPham;
-- c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(SoLuong) as 'So luong san pham thap nhat'
from SanPham;
-- d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(SoLuong) as 'Tong so luong san pham'
from SanPham;

-- e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select count(*) as 'So hoa don'
from HoaDon
where month(NgayMuaHang) = '12'
and year(NgayMuaHang) = '2016'
and TrangThai = 'Chưa thanh toán';

-- f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select MaHoaDon, count(distinct MaSanPham) as SoLoaiSanPham
from HoaDonChiTiet
group by MaHoaDon;

-- g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select MaHoaDon, count(distinct MaSanPham) as SoLoaiSanPham
from HoaDonChiTiet
group by MaHoaDon
having count(distinct MaSanPham) >= 5;

-- h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select MaHoaDon, NgayMuaHang, MaKhachHang
from HoaDon
order by NgayMuaHang desc;



