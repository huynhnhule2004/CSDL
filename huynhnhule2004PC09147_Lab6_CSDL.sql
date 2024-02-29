-- Lê Thị Huỳnh Như
-- PC09147

use QuanLyBanHang1;

-- PHẦN 1
-- a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
select HD.MaHoaDon, HD.MaKhachHang, HD.TrangThai, HDCT.MaSanPham, HDCT.SoLuong, HD.NgayMuaHang
from HoaDon HD
join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon;

-- b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với điều kiện maKhachHang = ‘KH001’
select HD.MaHoaDon, HD.MaKhachHang, HD.TrangThai, HDCT.MaSanPham, HDCT.SoLuong, HD.NgayMuaHang
from HoaDon HD
join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
where HD.MaKhachHang = 'KH001';

-- c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành tiền. Với thành tiền= donGia* soLuong
select HD.MaHoaDon, HD.NgayMuaHang,
		SP.TenSanPham,SP.DonGia, 
		HDCT.SoLuong,
        SP.DonGia * HDCT.SoLuong as ThanhTien
from HoaDon HD
join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
join SanPham SP on HDCT.MaSanPham = SP.MaSanPham;

-- d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh toán.
select concat(KH.HoVaTenLot, ' ', KH.Ten) as 'Họ tên',
		KH.Email, KH.DienThoai,
        HD.MaHoaDon, HD.TrangThai,
        (SP.DonGia * HDCT.SoLuong) as 'Tong'
from KhachHang KH join HoaDon HD on KH.MaKhachHang = HD.MaKhachHang
		join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
        join SanPham SP on HDCT.MaSanPham = SP.MaSanPham
where HD.TrangThai = 'Chưa thanh toán';

-- e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần của cột tổng tiền.
select HDCT.MaHoaDon, HD.NgayMuaHang, 
		sum(SP.DonGia * SP.SoLuong) as 'TongTien'
from HoaDon HD
join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
join SanPham SP on HDCT.MaSanPham = SP.MaSanPham
group by MaHoaDon, NgayMuaHang
having sum(SP.DonGia * SP.SoLuong) >= 500000
order by TongTien desc;

-- PHẦN 2
-- a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
select *
from KhachHang KH
where KH.MaKhachHang not in (
		select HoaDon.MaKhachHang 
        from hoadon
        where HoaDon.NgayMuaHang >= '2016-01-01');
        
-- b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
select SP.MaSanPham, SP.TenSanPham, count(HDCT.MaSanPham) as 'SoLuong'
FROM hoadonchitiet HDCT
INNER JOIN HoaDon HD ON	HD.MaHoaDon = HDCT.MaHoaDon
INNER JOIN SanPham SP ON SP.MaSanPham = HDCT.MaSanPham
WHERE MONTH(HD.NgayMuaHang) = 12
    AND YEAR(HD.NgayMuaHang) = 2016
GROUP BY HDCT.MaSanPham
ORDER BY SoLuong DESC
LIMIT 1;
    
-- c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
select KH.MaKhachHang, KH.HoVaTenLot, KH.Ten,
		sum(HDCT.SoLuong * SP.DonGia) as Tong
from HoaDon HD join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
	join SanPham SP on SP.MaSanPham = HDCT.MaSanPham
    join KhachHang KH on KH.MaKhachHang = HD.MaKhachHang
where year(HD.NgayMuaHang) = 2016
group by MaKhachHang
order by sum(HDCT.SoLuong * SP.DonGia) desc
limit 5;

-- d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên “Iphone 7 32GB” trong tháng 12/2016
select	KH.MaKhachHang, Kh.HoVaTenLot, KH.Ten
from HoaDon HD join HoaDonChiTiet HDCT on HD.MaHoaDon = HDCT.MaHoaDon
	join SanPham SP on HDCT.MaSanPham = SP.MaSanPham
    join KhachHang KH on HD.MaKhachHang = KH.MaKhachHang
where KH.DiaChi like '%Đà Nẵng%'
		and SP.TenSanPham = 'Iphone 7 32GB'
		and month(HD.NgayMuaHang) = 12
		and year(HD.NgayMuaHang) = 2016;
-- e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản phẩm.
select SP.MaSanPham, SP.TenSanPham,
		count(*) LuotMua
from SanPham SP join HoaDonChiTiet HDCT on SP.MaSanPham = HDCT.MaSanPham
group by SP.MaSanPham
having count(*) < (
	select avg(SoLuong)
    from (
		select MaSanPham,
        count(*) as SoLuong
        from HoaDonChiTiet
        group by MaSanPham) as temp);