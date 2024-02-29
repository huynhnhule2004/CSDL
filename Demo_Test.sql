-- Le Thi Huynh Nhu
-- Pc09147

-- Bai 1
create database Demo_Test;

use Demo_Test;

create table PhanLoaiSach (
	MaPL int primary key,
    TenLoai varchar(20) not null,
    MoTa varchar(100) 
);

create table Sach (
	MaSach int primary key,
    TieuDe varchar(50) not null,
    MoTaNgan varchar(200),
    TacGia varchar(30),
    NgayXuatBan date,
    MaPL int,
    foreign key (MaPL) references PhanLoaiSach(MaPL)
);

-- Bai 2
insert into PhanLoaiSach
values (1,'Văn học','Thể loại sách văn học'),
		(2,'Kỹ Thuật','Thể loại sách kỹ thuật'),
        (3,'Lập trình','Sách chuyên về lập trình phần mềm'),
        (4,'Kinh tế','Sách về kinh tế, kỹ năng làm giàu'),
        (5,'Ngoại ngữ','Ngoại ngữ như: tiếng Anh, Nhật');
        
insert into Sach
values  (1,'Cuốn theo chiều gió ,
        