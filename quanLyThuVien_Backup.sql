-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlythuvien
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitietphieumuon`
--

DROP TABLE IF EXISTS `chitietphieumuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieumuon` (
  `SoPhieuMuon` int NOT NULL,
  `MaSach` varchar(10) NOT NULL,
  `GhiChu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SoPhieuMuon`,`MaSach`),
  KEY `MaSach` (`MaSach`),
  CONSTRAINT `chitietphieumuon_ibfk_1` FOREIGN KEY (`SoPhieuMuon`) REFERENCES `phieumuon` (`SoPhieuMuon`),
  CONSTRAINT `chitietphieumuon_ibfk_2` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieumuon`
--

LOCK TABLES `chitietphieumuon` WRITE;
/*!40000 ALTER TABLE `chitietphieumuon` DISABLE KEYS */;
INSERT INTO `chitietphieumuon` VALUES (1,'KT01','Đã trả'),(2,'VH01','Đã trả'),(3,'IT02','Đã trả'),(4,'IT01','Đã trả'),(5,'NN01','Chưa trả');
/*!40000 ALTER TABLE `chitietphieumuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaisach`
--

DROP TABLE IF EXISTS `loaisach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaisach` (
  `MaLoai` varchar(10) NOT NULL,
  `TenLoai` varchar(50) NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisach`
--

LOCK TABLES `loaisach` WRITE;
/*!40000 ALTER TABLE `loaisach` DISABLE KEYS */;
INSERT INTO `loaisach` VALUES ('DL','Du lịch'),('IT','Công nghệ thông tin'),('KT','Kinh tế'),('NN','Ngoại ngữ'),('VH','Văn học');
/*!40000 ALTER TABLE `loaisach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieumuon`
--

DROP TABLE IF EXISTS `phieumuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieumuon` (
  `SoPhieuMuon` int NOT NULL AUTO_INCREMENT,
  `TenSach` varchar(50) NOT NULL,
  `NgayMuon` date NOT NULL,
  `NgayTra` date NOT NULL,
  `MaSinhVien` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SoPhieuMuon`),
  KEY `MaSinhVien` (`MaSinhVien`),
  CONSTRAINT `phieumuon_ibfk_1` FOREIGN KEY (`MaSinhVien`) REFERENCES `sinhvien` (`MaSinhVien`),
  CONSTRAINT `check_Ngay` CHECK ((`NgayTra` >= `NgayMuon`))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieumuon`
--

LOCK TABLES `phieumuon` WRITE;
/*!40000 ALTER TABLE `phieumuon` DISABLE KEYS */;
INSERT INTO `phieumuon` VALUES (1,'Chiến tranh tiền tệ','2017-01-12','2017-01-15','PC01'),(2,'Những tấm lòng cao cả','2023-12-15','2023-12-18','PC02'),(3,'SQL For Dummies','2023-12-20','2023-12-22','PC03'),(4,'Lập trình và cuộc sống','2024-01-02','2024-01-05','PC04'),(5,'Tiếng Anh cho người bắt đầu','2024-01-10','2024-01-12','PC05');
/*!40000 ALTER TABLE `phieumuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `MaSach` varchar(10) NOT NULL,
  `TenSach` varchar(50) NOT NULL,
  `TacGia` varchar(50) DEFAULT NULL,
  `NhaXuatBan` varchar(50) NOT NULL,
  `SoLuongBanSao` int NOT NULL,
  `SoTrang` int DEFAULT NULL,
  `GiaTien` float NOT NULL,
  `ViTri` varchar(50) NOT NULL,
  `NgayNhapKho` date DEFAULT NULL,
  `MaLoai` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `MaLoai` (`MaLoai`),
  CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`MaLoai`) REFERENCES `loaisach` (`MaLoai`),
  CONSTRAINT `check_GiaTien` CHECK ((`GiaTien` > 0)),
  CONSTRAINT `check_SoLuongBanSao` CHECK ((`SoLuongBanSao` > 1)),
  CONSTRAINT `check_SoTrang` CHECK ((`SoTrang` > 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES ('DL01','Những Mảng Màu Du Lịch Việt Nam','Phan Huy Xu, Võ Văn Thành','Tổng Hợp TPHCM',9,314,121.5,'Sách Du lịch','2019-07-17','DL'),('IT01','Lập trình và cuộc sống','Jeff Atwood','Thanh Niên',30,324,159,'Sách Công nghệ thông tin','2020-06-05','IT'),('IT02','SQL For Dummies','Allen G.Talylor','Hồng Đức',105,295,226000,'Sách Công nghệ thông tin','2017-12-03','IT'),('KT01','Chiến Tranh Tiền Tệ','Song Hong Bing','Lao Động',15,532,107.25,'Sách Kinh tế','2023-03-01','KT'),('NN01','Tiếng Anh Cho Người Bắt Đầu','Trang Anh, Minh Anh','Hồng Đức',55,467,149,'Sách Ngoại ngữ','2019-05-10','NN'),('VH01','Những Tấm Lòng Cao Cả','Edmondo De Amicis','Văn Học',25,416,106.2,'Sách Văn học','2022-08-25','VH'),('VH02','Chỉ cần mình kiên trì sẽ được như ý nguyện','Dung Keil','Văn học',50,204,90000,'Sách Công nghệ thông tin','2016-07-12','VH'),('VH03','Muôn kiếp nhân sinh','Nguyên Phong','Văn học',50,500,210000,'Sách Văn học','2013-06-15','VH');
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinhvien` (
  `MaSinhVien` varchar(10) NOT NULL,
  `TenSinhVien` varchar(50) NOT NULL,
  `NgayHetHan` date NOT NULL,
  `ChuyenNganh` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `SDT` varchar(10) NOT NULL,
  PRIMARY KEY (`MaSinhVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES ('PC01','Nguyễn Việt Hoàng','2025-08-25','Lập trình Web','hoangvnpc01@gmail.com','0345562994'),('PC02','Trần Minh Hiếu','2025-08-25','Thiết kế đồ họa','hieutmpc02@gmail.com','0343782098'),('PC03','Hà Tuấn Anh','2025-08-25','Ứng dụng phần mềm','anhhtpc03@gmail.com','0378892447'),('PC04','Lê Thị Huỳnh Như','2025-08-25','Lập trình Web','nhulthpc04@gmail.com','0364402449'),('PC05','Huỳnh Xuân Nhi','2025-08-25','Thiết kế đồ họa','nhihxpc05@gmail.com','0345562994');
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07 10:20:40
