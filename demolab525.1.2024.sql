-- Le Thi Huynh Nhu
-- PC09147

-- Tạo database QuanLyBanHang1
create	database QuanLyBanHang1;

-- Sử dụng database QuanLyBanHang1
use QuanLyBanHang1;

-- Tao các bảng của database QuanLyBanHang1
-- Chú ý xem lại phẩn 2 của lab2 để tạo các bảng đúng theo tên cột và kiểu dữ liệu
-- Tạo bảng KhacHang
create table KhacHang ( 
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
    TeSanPham varchar(50)
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
values ('KH01','Lê Thị Huỳnh','Như','Càng Long, Trà Vinh','huynhnhule2004@gmail.com','0364402449'),
		('KH02','Trần Minh','Hiếu','Sơn Trà, Đà Nẵng','tranminhhieu123@gmail.com','0362347865'),
        ('KH03','Lê Thanh','Hải','Hải Châu, Đà Nẵng','lethanhhai123@gmail.com','0347789365'),
        ('KH04','Trần Lê Vy','Thanh','Bình Thủy, Cần Thơ','tranlevythanh456@gmail.com','0245678993'),
        ('KH05','Huỳnh Xuân','Nhi','Vĩnh Thuận, Kiên Giang','huynhxuannhi123@gmail.com','0256678335'),
        ('KH06','Nguyễn Thị Phương','Thảo','Long Thành, Đồng Nai','nguyenthiphuongthao123@gmail.com','0356784667'),
        ('KH01','Ngô Gia','Linh','Châu Đốc, An Giang','ngogialinh123@gmail.com','0362784997'),
        ('KH01','Ngô Gia','Lập','Cái Răng, Cần Thơ','ngogialap123@gmail.com','0362789337');

-- Nhập dữ liệu cho bảng SanPham
insert into SanPham(MoTa, SoLuong, DonGia, TenSanPham)
values ('Sữa đặc có đường', 35, 2800,'Sữa Ông Thọ'),
		('Đường tinh khiết', 49, 2100, 'Đường Biên Hòa'),
        ('Nước ngọt có ga', 99, 1300, 'Nước ngọt có ga'),
        (
        
        
-- Nhập dữ liệu cho bảng HoaDon

-- Nhập dữ liệu cho bảng HoaDonChiTiet

-- Phần 1
-- a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột

-- b. Hiển thị 5 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, họ và tên, email, số điện thoại

-- c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select MaSaPham, TenSanPham, DonGia*SoLuong as 'Tong tien ton kho'
from SanPham;

-- d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột hoVaTenLot và Ten
-- concat de ghep , like 'H%'
-- cau f betweem and
-- cau g where TrangThai = 'Chưa thanh toán' and year(NgayMuaHang) = '2016';
-- cau h where ma khach hang in 


-- Phần 2
-- a. Hiển thị số lượng khách hàng có trong bảng khách hàng
/* vi du cách viết: select count(*) as 'So luong san pham'
from SanPham; */
-- b. Hiển thị đơn giá lớn nhất trong bảng SanPham
-- c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
-- d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(SoLuong) as 'Tong so luong san pham'
from SanPham;

-- f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
-- sử dung group by

-- g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
-- group by theo ma hoa hon va having count(*)>=3 
