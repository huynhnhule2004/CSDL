-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlynhanvien1
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
-- Table structure for table `du_an`
--

DROP TABLE IF EXISTS `du_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `du_an` (
  `MA_DUAN` char(4) NOT NULL,
  `TEN_DUAN` varchar(100) DEFAULT NULL,
  `NGAY_BATDAU` date DEFAULT NULL,
  `NGAY_KETTHUC` date DEFAULT NULL,
  PRIMARY KEY (`MA_DUAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `du_an`
--

LOCK TABLES `du_an` WRITE;
/*!40000 ALTER TABLE `du_an` DISABLE KEYS */;
INSERT INTO `du_an` VALUES ('DA01','Dự án 01','2023-05-01','2023-07-01'),('DA02','Dự án 02','2023-10-01','2023-10-29'),('DA03','Dự án 03','2023-03-20','2023-06-15'),('DA04','Dự án 04','2023-04-10','2023-09-27'),('DA05','Dự án 05','2023-01-21','2023-08-31'),('DA06','Dự án 06','2023-11-09','2024-05-09'),('DA07','Dự án 07','2023-12-01','2024-12-30');
/*!40000 ALTER TABLE `du_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duan_2023`
--

DROP TABLE IF EXISTS `duan_2023`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duan_2023` (
  `MA_DUAN` char(4) NOT NULL,
  `TEN_DUAN` varchar(100) DEFAULT NULL,
  `NGAY_BATDAU` date DEFAULT NULL,
  `NGAY_KETTHUC` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duan_2023`
--

LOCK TABLES `duan_2023` WRITE;
/*!40000 ALTER TABLE `duan_2023` DISABLE KEYS */;
INSERT INTO `duan_2023` VALUES ('DA01','Dự án 01','2023-05-01','2023-07-01'),('DA02','Dự án 02','2023-10-01','2023-10-29'),('DA03','Dự án 03','2023-03-20','2023-06-15'),('DA04','Dự án 04','2023-04-10','2023-09-27'),('DA05','Dự án 05','2023-01-21','2023-08-31');
/*!40000 ALTER TABLE `duan_2023` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien`
--

DROP TABLE IF EXISTS `nhan_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien` (
  `ID_NhanVien` char(4) NOT NULL,
  `HO_NV` varchar(30) DEFAULT NULL,
  `TEN_NV` varchar(10) DEFAULT NULL,
  `NAM_SINH` year DEFAULT NULL,
  `DIA_CHI` varchar(100) DEFAULT NULL,
  `GIOI_TINH` varchar(3) DEFAULT NULL,
  `LUONG` float DEFAULT NULL,
  `PHG` char(4) DEFAULT NULL,
  PRIMARY KEY (`ID_NhanVien`),
  KEY `PHG` (`PHG`),
  CONSTRAINT `nhan_vien_ibfk_1` FOREIGN KEY (`PHG`) REFERENCES `phong_ban` (`MA_PB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien`
--

LOCK TABLES `nhan_vien` WRITE;
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
INSERT INTO `nhan_vien` VALUES ('NV01','Lê Văn','Cường',1995,'Cần Thơ','Nam',1700,'VP01'),('NV02','Nguyễn Kim','Thúy',1990,'Cà Mau','Nữ',1350,'VP02'),('NV03','Trần Quyết','Thắng',1982,'An Giang','Nam',1450,'VP03'),('NV04','Dương Trúc','Đào',2000,'Hậu Giang','Nữ',1265,'VP04'),('NV05','Lê Trần Thúy','Liễu',1987,'Bạc Liêu','Nữ',1347.5,'VP05'),('NV06','Huỳnh Trúc','Giang',1988,'Cần Thơ','Nữ',990,'VP01'),('NV07','Kiều Minh','Tuấn',1988,'TP.HCM','Nam',1000,'VP02'),('NV08','Ninh Dương Lan','Ngọc',1987,'Kiên Giang','Nữ',1210,'VP04');
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien_can_tho`
--

DROP TABLE IF EXISTS `nhan_vien_can_tho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien_can_tho` (
  `ID_NhanVien` char(4) NOT NULL,
  `HO_NV` varchar(30) DEFAULT NULL,
  `TEN_NV` varchar(10) DEFAULT NULL,
  `NAM_SINH` year DEFAULT NULL,
  `DIA_CHI` varchar(100) DEFAULT NULL,
  `GIOI_TINH` varchar(3) DEFAULT NULL,
  `LUONG` float DEFAULT NULL,
  `PHG` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien_can_tho`
--

LOCK TABLES `nhan_vien_can_tho` WRITE;
/*!40000 ALTER TABLE `nhan_vien_can_tho` DISABLE KEYS */;
INSERT INTO `nhan_vien_can_tho` VALUES ('NV01','Lê Văn','Cường',1995,'Cần Thơ','Nam',1500,'VP01'),('NV06','Huỳnh Trúc','Giang',1988,'Cần Thơ','Nữ',900,'VP01');
/*!40000 ALTER TABLE `nhan_vien_can_tho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien_test`
--

DROP TABLE IF EXISTS `nhan_vien_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien_test` (
  `ID_NhanVien` char(4) NOT NULL,
  `HO_NV` varchar(30) DEFAULT NULL,
  `TEN_NV` varchar(10) DEFAULT NULL,
  `NAM_SINH` year DEFAULT NULL,
  `DIA_CHI` varchar(100) DEFAULT NULL,
  `GIOI_TINH` varchar(3) DEFAULT NULL,
  `LUONG` float DEFAULT NULL,
  `PHG` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien_test`
--

LOCK TABLES `nhan_vien_test` WRITE;
/*!40000 ALTER TABLE `nhan_vien_test` DISABLE KEYS */;
INSERT INTO `nhan_vien_test` VALUES ('NV01','Lê Văn','Cường',1995,'Cần Thơ','Nam',1500,'VP01'),('NV02','Nguyễn Kim','Thúy',1990,'Cà Mau','Nữ',1350,'VP02'),('NV03','Trần Quyết','Thắng',1982,'An Giang','Nam',1400,'VP03'),('NV04','Dương Trúc','Đào',2000,'Hậu Giang','Nữ',1150,'VP04'),('NV05','Lê Trần Thúy','Liễu',1987,'Bạc Liêu','Nữ',1225,'VP05'),('NV06','Huỳnh Trúc','Giang',1988,'Cần Thơ','Nữ',900,'VP01'),('NV07','Kiều Minh','Tuấn',1988,'TP.HCM','Nam',1000,'VP02'),('NV08','Ninh Dương Lan','Ngọc',1987,'Kiên Giang','Nữ',1100,'VP04');
/*!40000 ALTER TABLE `nhan_vien_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong_ban`
--

DROP TABLE IF EXISTS `phong_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phong_ban` (
  `MA_PB` char(4) NOT NULL,
  `TEN_PB` varchar(50) DEFAULT NULL,
  `MA_TRUONGPHONG` char(4) DEFAULT NULL,
  PRIMARY KEY (`MA_PB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong_ban`
--

LOCK TABLES `phong_ban` WRITE;
/*!40000 ALTER TABLE `phong_ban` DISABLE KEYS */;
INSERT INTO `phong_ban` VALUES ('VP01','Phòng Thiết kế','NV01'),('VP02','Phòng Sản xuất','NV02'),('VP03','Phòng Kinh doanh','NV03'),('VP04','Thiết kế 2D','NV04'),('VP05','Thiết kế 3D','NV05'),('VP06','Phòng Nhân Sự',NULL),('VP07','Phòng Y Tế',NULL);
/*!40000 ALTER TABLE `phong_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quanly_duan`
--

DROP TABLE IF EXISTS `quanly_duan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quanly_duan` (
  `MA_DUAN` char(4) NOT NULL,
  `MA_NHANVIEN` char(4) NOT NULL,
  `NGAY_THAM_GIA` date DEFAULT NULL,
  `NGAY_KET_THUC` date DEFAULT NULL,
  `SO_GIO` int DEFAULT NULL,
  `VAI_TRO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MA_DUAN`,`MA_NHANVIEN`),
  KEY `MA_NHANVIEN` (`MA_NHANVIEN`),
  CONSTRAINT `quanly_duan_ibfk_1` FOREIGN KEY (`MA_DUAN`) REFERENCES `du_an` (`MA_DUAN`),
  CONSTRAINT `quanly_duan_ibfk_2` FOREIGN KEY (`MA_NHANVIEN`) REFERENCES `nhan_vien` (`ID_NhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quanly_duan`
--

LOCK TABLES `quanly_duan` WRITE;
/*!40000 ALTER TABLE `quanly_duan` DISABLE KEYS */;
INSERT INTO `quanly_duan` VALUES ('DA01','NV01','2023-05-01','2023-06-01',120,'Tư vấn'),('DA01','NV03','2023-05-15','2023-07-01',200,'Xây dựng'),('DA02','NV04','2023-10-01','2023-10-29',150,'Giám sát'),('DA03','NV01','2023-03-20','2023-06-15',300,'Giám sát'),('DA03','NV07','2023-04-30','2023-05-25',90,'Tư vấn'),('DA04','NV05','2023-04-10','2023-09-27',205,'Xây dựng'),('DA05','NV08','2023-01-31','2023-05-30',400,'Xây dựng');
/*!40000 ALTER TABLE `quanly_duan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 13:05:03
