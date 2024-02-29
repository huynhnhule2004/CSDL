use QuanLyNhanVien1;
select * from Nhan_Vien;

-- Tạo chỉ mục cho cột Ten_NV của bảng Nhan_Vien
-- Đặt tên chỉ mục là NhanVien_Index
create index NhanVien_Index on Nhan_Vien(Ten_NV);

-- Xóa chỉ mục NhanVien_Index của bảng Nhan_Vien
drop index NhanVien_Index on Nhan_Vien;