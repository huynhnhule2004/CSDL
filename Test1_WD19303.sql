CREATE DATABASE TEST_1_WD19303;

USE TEST_1_WD19303;

CREATE TABLE VANDONGVIEN
(
	MaVDV int not null,
    TenVDV varchar(20),
    XepHang int,
    Tuoi int,
    Primary key (MaVDV)
);

CREATE TABLE XE
(
	MaXe int not null,
    HangSX varchar(30),
    MauXe varchar(6),
    Primary key (MaXE)
);

CREATE TABLE DANGKY
(
	MaVDV int,
    MaXe int,
    NgayDangKy date,
    Primary key (MaVDV, MaXe),
    Foreign key (MaVDV) references VANDONGVIEN(MaVDV),
    Foreign key (MaXe) references XE(MaXe)
);


INSERT INTO VANDONGVIEN VALUES
(22,'Dustin',7,45),
(29,'Brutus',1,33),
(31,'Lubber',8,55),
(32,'Andy',8,25),
(58,'Rusty',10,35),
(64,'Horatio',7,35),
(71,'Zorba',10,16),
(74,'Horatio',9,35),
(85,'Art',3,25),
(95,'Bob',3,63),
(36,'BarbarB',6,37);

INSERT INTO XE VALUES
(101,'Honda','Xanh'),
(102,'Honda','Đỏ'),
(103,'Suzuki','Vàng'),
(104,'Yamaha','Đỏ');


INSERT INTO DANGKY VALUES
(22,101,'1998-10-10'),
(22,102,'1998-10-10'),
(22,103,'1998-08-10'),
(22,104,'1998-07-10'),
(31,102,'1998-10-11'),
(31,103,'1998-06-11'),
(31,104,'1998-12-11'),
(64,101,'1998-05-09'),
(64,102,'1998-08-09'),
(74,103,'1998-09-09');



