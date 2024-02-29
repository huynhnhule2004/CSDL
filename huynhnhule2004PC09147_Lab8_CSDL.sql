-- Lê Thị Huỳnh Như
-- PC09147
use QuanLyBanHang1;

-- PHẦN 1
-- Bài 1 Tạo chỉ mục trên các bảng có tần suất truy vấn nhiều

-- a. Tạo chỉ mục UNIQUE trên cột điện thoại của bảng khách hàng
create unique index DienThoai_Unique ON KhachHang(DienThoai);

-- b. Tạo chỉ mục UNIQUE trên cột email của bảng khách hàng
create unique index Email_Unique on KhachHang(Email);



