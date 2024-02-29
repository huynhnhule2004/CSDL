USE QuanLyNhanVien1;

-- Hiển thị toàn bộ thông tin của Nhân Viên
SELECT *
FROM NHAN_VIEN;

-- Hiển thị toàn bộ thông tin của 5 nhân viên đầu tiên
SELECT *
FROM NHAN_VIEN
LIMIT 5;

-- Hiển thị thông tin ID_NhanVien, HO_NV, TEN_NV và LUONG của các Nhân viên
SELECT ID_NhanVien,HO_NV,TEN_NV,LUONG
FROM NHAN_VIEN;

-- Hiển thị địa chỉ các nhân viên nhưng lọc bỏ các địa chỉ bị trùng nhau
SELECT DISTINCT DIA_CHI
FROM NHAN_VIEN;

-- Hiển thị thông tin ID_NhanVien, HO_NV, TEN_NV và LUONG của các Nhân viên
-- Cot HO_NV duoc dat ten thanh Ho Nhan Vien
-- Cot TEN_NV duoc dat ten thanh Ten Nhan Vien

SELECT ID_NhanVien, HO_NV AS 'Ho Nhan Vien', TEN_NV AS 'Ten Nhan Vien', Luong
FROM NHAN_VIEN;


-- Hiển thị thông tin ID_NhanVien, HO_NV, TEN_NV và LUONG của các Nhân viên
-- Kết quả hiển thị gộp 2 cột HO_NV và TEN_NV thành 1 cột có tên là "Ho Ten Nhan Vien"
SELECT ID_NhanVien, CONCAT(HO_NV,' ',TEN_NV) AS 'Ho Ten Nhan Vien', LUONG
FROM NHAN_VIEN;

-- Hiển thị toàn bộ thông tin của các Nhân viên có Lương > 1200
SELECT *
FROM NHAN_VIEN
WHERE LUONG > 1200;

-- -- Hiển thị toàn bộ thông tin của các Nhân viên nữ có Lương > 1200
SELECT *
FROM NHAN_VIEN
WHERE GIOI_TINH = 'Nữ' AND LUONG > 1200;

-- Hiển thị toàn bộ thông tin của các Nhân viên có địa chỉ khác Cần Thơ
SELECT *
FROM NHAN_VIEN
WHERE NOT DIA_CHI = 'Cần Thơ';

-- Hiển thị toàn bộ thông tin Nhân viên có Lương trong khoảng từ 1000 đến 1300
SELECT *
FROM NHAN_VIEN
WHERE LUONG BETWEEN 1000 AND 1300;

-- Hiển thị toàn bộ thông tin các nhân viên có địa chỉ ở Cần Thơ, Bạc Liêu và An Giang
SELECT *
FROM NHAN_VIEN
WHERE DIA_CHI IN ('Cần Thơ','Bạc Liêu','An Giang');



-- Hiển thị toàn bộ thông tin của các nhân viên họ Lê
SELECT *
FROM NHAN_VIEN
WHERE HO_NV LIKE 'Lê%';

-- Hiển thị mức lương cao nhất
SELECT MAX(LUONG) AS 'Luong cao nhat'
FROM NHAN_VIEN;

-- Hiển thị mức lương trung bình
SELECT AVG(LUONG) AS 'Luong trung binh'
FROM NHAN_VIEN;

-- Hiển thị số lượng nhân viên trong từng Phòng Ban
SELECT PHG, COUNT(*) AS 'So Luong Nhan Vien'
FROM NHAN_VIEN
GROUP BY PHG;

-- Hiển thị số lượng nhân viên theo từng địa chỉ
SELECT DIA_CHI, COUNT(*) AS 'So Luong Nhan Vien'
FROM NHAN_VIEN
GROUP BY DIA_CHI;

-- -- Hiển thị số lượng nhân viên theo từng địa chỉ
-- Nhưng kết quả chỉ hiển thị các địa chỉ có số lượng nhân viên lớn hơn 1
SELECT DIA_CHI, COUNT(*) AS 'SO LUONG NHAN VIEN'
FROM NHAN_VIEN
GROUP BY DIA_CHI
HAVING COUNT(*) > 1;


-- Hiển thị thông tin toàn bộ nhân viên.
-- Kết quả hiển thị được sắp xếp theo thứ tự tăng dần của cột Lương
SELECT *
FROM NHAN_VIEN
ORDER BY LUONG ASC;

-- Hiển thị thông tin TOP 3 nhân viên có lương cao nhất công ty
