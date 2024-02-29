-- Lê Thị Huỳnh Như
-- PC09147

-- PHẦN 1
-- Bài 1 Viết các câu DML để thực hiện các công việc sau:
-- a. Sử dụng câu lệnh INSERT để thêm dữ liệu các các bảng như sau:
use QuanLyBanHang1;

insert into KhachHang (MaKhachHang, HoVaTenLot, Ten, DiaChi, Email, DienThoai)
	values ('KH001','Nguyễn Thị','Nga','15 Quang Trung TP Đà Nẵng','ngant@gamil.com','0912345670'),
			('KH002','Trần Công','Thành','234 Lê Lợi Quảng Nam','thanhtc@gmail.com','16109423443'),
            ('KH003','Lê Hoàng','Nam','23 Trần Phú TP Huế','namlt@yahoo.com','0989354556'),
            ('KH004','Vũ Ngọc','Hiền','37 Nguyễn Thị Thập TP Đà Nẵng','hienvn@gmail.com','0894545435');
            
insert into SanPham(MoTa, SoLuong, DonGia, TenSanPham)
	values ('Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền',800,6600000,'Samsung Galaxy J7 Pro'),
			('iPhone 6 là một trong những smartphone được yêu thích nhất. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot"',500,8990000,'iPhone 6 32GB'),
            ('Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)',507,11290000,'Laptop Dell Inspiron 3467'),
            ('Pin sạc dự phòng Polymer 5.000mAh eSaver JP85',600,200000,'Pin sạc dự phòng'),
            ('Nokia 3100 phù hợp với SINH VIÊN',100,700000,'Nokia 3100');
            
insert into HoaDon(MaKhachHang, MaHoaDon, NgayMuaHang, TrangThai)
	values ('KH001',120954,'2016-03-23','Đã thanh toán'),
			('KH002',120955,'2016-04-02','Đã thanh toán'),
            ('KH001',120956,'2016-07-12','chưa thanh toán'),
            ('KH004',125957,'2016-12-04','chưa thanh toán');
            
insert into HoaDonChiTiet(MaHoaDon, MaSanPham, SoLuong)
	values (120954,3,40),
			(120954,1,20),
			(120955,2,100),
            (120956,4,6),
            (120956,2,60),
            (120956,1,10),
            (125957,2,50);
            
-- b. Tạo 1 bảng có tên KhachHang_daNang chứa thông tin tin đầy đủ về các khách hàng đến từ Đà Nẵng 
create table KhachHang_DaNang
select *
from KhachHang
where DiaChi like '%Đà Nẵng%';

-- PHẦN 2 Bài 2 Viết các câu lệnh để cập nhật lại dữ liệu cho các bảng
-- a. Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới là ‘16267788989’
update KhachHang
set DienThoai = 16267788989
where MaKhachHang = 'KH002';

-- b. Tăng số lượng mặt hàng có mã ‘3’ lên thêm ‘200’ đơn vị
update SanPham
set Soluong = SoLuong + 200
where MaSanPham = 3;

-- c. Giảm giá cho tất cả sản phẩm giảm 5%
UPDATE SanPham
SET DonGia = DonGia - DonGia*0.05;

-- d. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vị
update SanPham
set SoLuong = SoLuong + 100
where MaSanPham = (
	select HDCT.MaSanPham
	from HoaDon HD inner join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
	group by HDCT.MaSanPham, HD.NgayMuaHang
    having NgayMuaHang like '2016-12%'
	order by sum(HDCT.SoLuong) desc limit 1
);

-- e. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016
update SanPham
set DonGia = DonGia * 0.9
where MaSanPham = ( 
	select HDCT.MaSanPham
	from HoaDon HD inner join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
	group by HDCT.MaSanPham, HD.NgayMuaHang
    having NgayMuaHang like '2016%'
	order by sum(SoLuong) asc limit 2
);

-- f. Cập nhật lại trạng thái “đã thanh toán” cho hoá đơn có mã 120956
update HoaDon 
set TrangThai = 'Đã thanh toán'
where MaHoaDon = 120956;

-- g. Xoá mặt hàng có mã sản phẩm là ‘2’ ra khỏi hoá đơn ‘120956’ và trạng thái là chưa thanh toán.
delete from HoaDonChiTiet
where MaSanPham = 2
		and MaHoaDon in (
			select MaHoaDon 
            from HoaDon
            where MaHoaDon = 120956
            and TrangThai = 'Chưa thanh toán'
        );

-- h. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2016”
delete from KhachHang
where MaKhachHang not in (select MaKhachHang
							from HoaDon
                            where NgayMuaHang >= '2016-01-01');



	