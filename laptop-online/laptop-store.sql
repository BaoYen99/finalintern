-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: latop_store
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_tiet_don_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chi_tiet_don_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `don_gia` int(11) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `tong_tien` bigint(20) DEFAULT NULL,
  `ma_don_hang` int(11) DEFAULT NULL,
  `ma_san_pham` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9wl3houbukbxpixsut6uvojhy` (`ma_don_hang`),
  KEY `FK3ry84nmdxgoarx53qjxd671tk` (`ma_san_pham`),
  CONSTRAINT `fk_chitietdonhang_donhang` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`id`),
  CONSTRAINT `fk_chitietdonhang_sanpham` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don_hang`
--

LOCK TABLES `chi_tiet_don_hang` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don_hang` DISABLE KEYS */;
INSERT INTO `chi_tiet_don_hang` VALUES (2,2000,1,2000,2,1),(3,2000,1,2000,3,1),(4,2000,1,2000,4,1),(5,2000,1,2000,5,4),(6,2000,1,2000,6,1),(12,2000,1,2000,11,5),(13,2000,1,2000,12,2),(15,2000,1,4000,14,2),(16,2000,1,4000,14,4),(17,2000,1,2000,15,2),(18,2000,2,4000,17,2),(19,2000,1,4000,18,3),(20,2000,1,4000,19,3),(21,2000,1,2000,20,4),(22,2000,1,2000,21,3),(23,3000,1,3000,22,5),(24,2000,1,2000,23,2),(25,2000,1,2000,24,3),(26,2000,1,2000,25,2);
/*!40000 ALTER TABLE `chi_tiet_don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_gio_hang`
--

DROP TABLE IF EXISTS `chi_tiet_gio_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chi_tiet_gio_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `so_luong` int(11) NOT NULL,
  `ma_gio_hang` int(11) DEFAULT NULL,
  `ma_san_pham` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK49lmmclnjgb7eck20lwhv0cks` (`ma_gio_hang`),
  KEY `FKkd69a7wiulr4xgohxl0rlhth4` (`ma_san_pham`),
  CONSTRAINT `fk_chitietgiohang_giohang` FOREIGN KEY (`ma_gio_hang`) REFERENCES `gio_hang` (`id`),
  CONSTRAINT `fk_chitietgiohang_sanpham` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_gio_hang`
--

LOCK TABLES `chi_tiet_gio_hang` WRITE;
/*!40000 ALTER TABLE `chi_tiet_gio_hang` DISABLE KEYS */;
INSERT INTO `chi_tiet_gio_hang` VALUES (108,2,37,2);
/*!40000 ALTER TABLE `chi_tiet_gio_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `don_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_chi_nhan` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ho_ten_nguoi_nhan` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `std` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ma_nguoi_dung` int(11) DEFAULT NULL,
  `id_trang_thai` int(11) DEFAULT NULL,
  `id_trang_thai_don_hang` int(11) DEFAULT NULL,
  `id_phuong_thuc` int(11) DEFAULT NULL,
  `ngay_dat_hang` datetime DEFAULT NULL,
  `ngay_nhan_hang` datetime DEFAULT NULL,
  `ngay_thanh_toan` datetime DEFAULT NULL,
  `id_shipper` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnwjiboxao1uvw1siemkvs1jb9_idx` (`ma_nguoi_dung`),
  KEY `fk_donhang_trangthaithanhtoan_idx` (`id_trang_thai`),
  KEY `fk_donhang_trangthaidonhang_idx` (`id_trang_thai_don_hang`),
  KEY `fk_dondang_phuongthucthanhtoan_idx` (`id_phuong_thuc`),
  CONSTRAINT `fk_dondang_phuongthucthanhtoan` FOREIGN KEY (`id_phuong_thuc`) REFERENCES `phuong_thuc_thanh_toan` (`id`),
  CONSTRAINT `fk_donhang_nguoidung` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`),
  CONSTRAINT `fk_donhang_trangthaidonhang` FOREIGN KEY (`id_trang_thai_don_hang`) REFERENCES `trang_thai_don_hang` (`id`),
  CONSTRAINT `fk_donhang_trangthaithanhtoan` FOREIGN KEY (`id_trang_thai`) REFERENCES `trang_thai_thanh_toan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
INSERT INTO `don_hang` VALUES (2,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476399',5,1,3,2,'2021-07-22 09:25:39',NULL,'2021-07-22 10:06:26',20),(3,'k142/h03/10, Âu Cơ, Đà Nẵng','Bảo Yên','0353476499',6,2,3,1,'2021-07-22 09:25:39',NULL,NULL,20),(4,'k142/h03/10, Âu Cơ, Đà Nẵng','Mỹ Hạnh','0353476499',18,1,1,2,'2021-07-22 09:25:39','2021-07-22 09:47:49','2021-07-22 10:06:26',NULL),(5,'k142/h03/10, Âu Cơ, Đà Nẵng','Bảo Yến','0353476399',18,2,1,1,'2021-07-22 09:25:39',NULL,NULL,19),(6,'k142/h03/10, Âu Cơ, Đà Nẵng','võ thị bảo yến','0353476399',15,1,1,2,'2021-07-22 09:25:39','2021-07-22 09:47:49','2021-07-22 10:06:26',20),(11,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476499',15,1,2,2,'2021-07-22 09:25:39',NULL,'2021-07-22 10:06:26',NULL),(12,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476499',16,1,1,1,'2021-07-22 09:25:39','2021-07-22 09:47:49','2021-07-22 10:06:26',NULL),(14,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476399',7,1,1,1,'2021-07-22 09:25:39','2021-07-22 10:24:50','2021-07-22 10:24:50',20),(15,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476399',5,1,1,2,'2021-07-22 09:25:39','2021-07-22 09:47:49','2021-07-22 10:06:26',20),(16,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476399',7,2,2,1,'2021-07-22 09:25:39',NULL,NULL,20),(17,'Trâm Lý Hải Quy Hải Lăng Quảng Trị','Võ Thị Bảo Yến','0353476399',7,1,1,2,'2021-07-22 09:25:39','2021-07-22 09:47:49','2021-07-22 10:06:26',NULL),(18,'k142/h03/10 Âu Cơ Đà Nẵng','Võ Thị Bảo Yến','0353476399',7,1,2,2,'2021-07-22 09:25:39',NULL,'2021-07-22 10:06:26',20),(19,'k142/h03/10 Âu Cơ Đà Nẵng','Võ Thị Bảo Yến','0353476399',7,2,3,1,'2021-07-22 09:25:39',NULL,NULL,19),(20,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476399',7,1,3,2,'2021-07-22 09:25:39',NULL,'2021-07-22 10:06:26',20),(21,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Thị Bảo Yến','0353476399',7,1,1,1,'2021-07-22 09:25:39','2021-07-22 10:25:51','2021-07-22 10:25:51',NULL),(22,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Nguyễn Nguyên An','0353476499',4,2,2,1,'2021-07-22 09:25:39',NULL,NULL,NULL),(23,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Nguyễn Nguyên An','0353476399',4,1,2,2,'2021-07-22 10:06:26',NULL,'2021-07-22 10:06:26',20),(24,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Nguyễn Nguyên An','0353476499',4,2,2,1,'2021-07-22 10:07:17',NULL,NULL,NULL),(25,'k142/h03/10, Âu Cơ, Đà Nẵng','Võ Nguyễn Nguyên An','0353476399',4,2,2,1,'2021-07-23 15:26:22',NULL,NULL,NULL);
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gio_hang`
--

DROP TABLE IF EXISTS `gio_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gio_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tong_tien` bigint(20) DEFAULT '0',
  `ma_nguoi_dung` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gio_hang_nguoi_dung1_idx` (`ma_nguoi_dung`),
  CONSTRAINT `fk_giohang_nguoidung` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gio_hang`
--

LOCK TABLES `gio_hang` WRITE;
/*!40000 ALTER TABLE `gio_hang` DISABLE KEYS */;
INSERT INTO `gio_hang` VALUES (37,4000,7);
/*!40000 ALTER TABLE `gio_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hang_san_xuat`
--

DROP TABLE IF EXISTS `hang_san_xuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hang_san_xuat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_hang` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hang_san_xuat`
--

LOCK TABLES `hang_san_xuat` WRITE;
/*!40000 ALTER TABLE `hang_san_xuat` DISABLE KEYS */;
INSERT INTO `hang_san_xuat` VALUES (1,'Apple'),(2,'Asus'),(3,'Acer'),(4,'Dell'),(5,'HP'),(6,'Lenovo');
/*!40000 ALTER TABLE `hang_san_xuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_hinh_thanh_toan`
--

DROP TABLE IF EXISTS `loai_hinh_thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loai_hinh_thanh_toan` (
  `id` int(11) NOT NULL,
  `ten_loai_hinh_thanh_toan` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_hinh_thanh_toan`
--

LOCK TABLES `loai_hinh_thanh_toan` WRITE;
/*!40000 ALTER TABLE `loai_hinh_thanh_toan` DISABLE KEYS */;
INSERT INTO `loai_hinh_thanh_toan` VALUES (1,'Trực Tiếp'),(2,'Ngân Hàng');
/*!40000 ALTER TABLE `loai_hinh_thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nguoi_dung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_chi` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ten_nguoi_dung` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sdt` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_vai_tro` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `fk_nguoi_dung_vai_tro_idx` (`id_vai_tro`),
  CONSTRAINT `fk_nguoi_dung_vai_tro` FOREIGN KEY (`id_vai_tro`) REFERENCES `phan_quyen` (`id_vai_tro`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (1,'hai quy','Lê Anh Minh','admin','Baoyen123@','0353476399',1),(2,'hai quy','Võ Thị Bảo Yến','AdminYen','Baoyen123@','0353476399',1),(3,'hai quy','Võ Thị Mỹ Hạnh','myhanh123','Baoyen123@','0353476399',2),(4,'hai quy','Võ Nguyễn  Nguyên An','nguyenan123','Baoyen123@','0353476399',2),(5,'hai quy','Võ Thị Quỳnh My','quynhmy123','Baoyen123@','0353476399',2),(6,'hai quy','Võ Thị Quỳnh Chi','quynhchi1234','Baoyen123@','0353476399',2),(7,'hai quy','Võ Trường Hải','truonghai','Baoyen123@','0353476399',2),(9,'hai quy','Đoàn Hậu Minh','hauminh','Baoyen123@','0353476399',2),(13,'hai quy','Võ Thị Cẩm Vân','CanVan123','Camvan123@','0353476399',2),(14,'hai quy','Võ Thị Bình Nguyên','binhnguyen','Baoyen123@','0353476399',2),(15,'hai quy','Đoàn Mạnh Đan','manhdan','Baoyen123@','0353476399',2),(16,'hai quy','Võ Thị Bảo Yến','VoThiBaoYen','Baoyen123@','0353476399',2),(17,'hai quy','Võ Thị Ngọc Thủy','ngocthuy123','Baoyen10199@','0353476399',2),(18,'hai quy','Lê Phan Bảo Hoàng','baohoang','Baoyen123@','0353476399',2),(19,'hai quy','Lê Phan Võ Phong','shippervophong','Baoyen123@','0353476399',3),(20,'hai quy','Lê Phan Văn Thắng','shipperthang','Baoyen123@','0353476399',3),(21,'hai quy','Đoàn Văn Nghĩa','shippernghia','Baoyen123@','0353476399',3);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phan_quyen`
--

DROP TABLE IF EXISTS `phan_quyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phan_quyen` (
  `id_vai_tro` int(11) NOT NULL AUTO_INCREMENT,
  `ten_phan_quyen` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_vai_tro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phan_quyen`
--

LOCK TABLES `phan_quyen` WRITE;
/*!40000 ALTER TABLE `phan_quyen` DISABLE KEYS */;
INSERT INTO `phan_quyen` VALUES (1,'ADMIN'),(2,'USER'),(3,'SHIPPER');
/*!40000 ALTER TABLE `phan_quyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phuong_thuc_thanh_toan`
--

DROP TABLE IF EXISTS `phuong_thuc_thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phuong_thuc_thanh_toan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_phuong_thuc_thanh_toan` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phuong_thuc_thanh_toan`
--

LOCK TABLES `phuong_thuc_thanh_toan` WRITE;
/*!40000 ALTER TABLE `phuong_thuc_thanh_toan` DISABLE KEYS */;
INSERT INTO `phuong_thuc_thanh_toan` VALUES (1,'Trực Tiếp'),(2,'Ngân Hàng');
/*!40000 ALTER TABLE `phuong_thuc_thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `san_pham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `don_gia` int(11) NOT NULL,
  `so_luong_ban` int(11) NOT NULL,
  `so_luong_kho` int(11) NOT NULL,
  `dung_luong_pin` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `he_dieu_hanh` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `man_hinh` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ram` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ten_san_pham` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thiet_ke` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thong_tin_bao_hanh` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thong_tin_chung` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ma_hang_san_xuat` int(11) DEFAULT NULL,
  `anh_san_pham` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_san_pham_hang_san_xuat1_idx` (`ma_hang_san_xuat`),
  CONSTRAINT `fk_sanpham_hangsanxuat` FOREIGN KEY (`ma_hang_san_xuat`) REFERENCES `hang_san_xuat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (1,'Intel, Core i5, 1.8 Ghz',2000,4,100,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz',' MacBook Air 2020','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,'macbook.lpeg'),(2,'Intel, Core i5, 1.8 Ghz',2000,6,147,'5800mAh',' Windown',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Laptop Acer Spin 3 SP314','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',3,'acer.jpg'),(3,' Intel, Core i5, 1.8 Ghz',3000,4,96,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz','ASUS ZenBook UX434FA','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(4,'Intel, Core M3, 1.2 GHz',2000,3,0,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell Latitude E7270','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(5,'Intel, Core M3, 1.2 GHz',2000,2,0,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','HP ProBook 348 G5','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,'hp.png'),(7,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Lenovo Legion Y530 15 i7 8750H','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',6,'lenovo.png'),(8,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','MacBook Pro 13 inch 2020','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,'macbook.lpeg'),(9,'Intel, Core i5, 1.8 Ghz',2000,0,120,'5800mAh',' Windown',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Laptop Acer Spin 5 SP513','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',3,'acer.jpg'),(10,' Intel, Core i5, 1.8 Ghz',2000,0,100,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz','Asus','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(11,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell Latitude E7470','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(12,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','HP Probook 13 i5 8265U','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,'hp.png'),(13,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Lenovo L340 15IRH','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',6,'lenovo.png'),(14,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','MacBook Pro 16 inch','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,'macbook.lpeg'),(15,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','MacBook Retina','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,'macbook.lpeg'),(16,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Windown',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Acer Aspire A315 54 558R','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',3,'acer.jpg'),(17,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Windown',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Laptop Acer Aspire A515 ','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',3,'acer.jpg'),(18,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Windown',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Acer Nitro AN515','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',3,'acer.jpg'),(19,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Windown',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Acer Swift','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',3,'acer.jpg'),(20,' Intel, Core i5, 1.8 Ghz',2000,0,100,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz','ASUS VivoBook A412FA','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(21,' Intel, Core i5, 1.8 Ghz',2000,0,100,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz','ASUS ROG Strix G G531GT','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(22,' Intel, Core i5, 1.8 Ghz',2000,0,100,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz','ASUSPro','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(23,' Intel, Core i5, 1.8 Ghz',2000,0,10,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz',' Asus Chromebook','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(24,' Intel, Core i5, 1.8 Ghz',2000,0,1,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz',' ASUS Transformer Mini','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(25,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell Vostro 3580 i5 8265U','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(26,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell Vostro 3580 i7 8565U','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(27,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell XPS 12','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(28,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell Alienware 17','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(29,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell Precision 5510','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(30,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','HP EliteBook X360 1040 G5','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,'hp.png'),(31,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','HP Envy 13 6ZF26PA ','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,'hp.png'),(32,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','HP Pavilion 15 cs3119TX','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,'hp.png'),(33,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','HP zBook Studio G3','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,'hp.png'),(34,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Lenovo IdeaPad S340 14IIL ','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',6,'lenovo.png'),(35,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Lenovo Ideapad S340 14IWL ','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',6,'lenovo.png'),(36,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Lenovo YOGA S730 13IWL','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',6,'lenovo.png'),(37,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Lenovo Yoga S740 14IIL','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',6,'lenovo.png'),(38,'Intel, Core i5, 1.8 Ghz',2000,0,10,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','MacBook Pro 13 inch','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,'macbook.lpeg'),(39,'Intel, Core i5, 1.8 Ghz',2000,0,100,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','Macbook Air 13 128GB MQD32SA/A (2017)','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,'macbook.lpeg'),(40,'Intel, Core i5, 1.8 Ghz',2000,0,12,'5800mAh',' Mac Os',' 13.3 inch LED-backlit','8 GB, LPDDR3, 1600 Mhz','MacBook Pro 15 inch','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','không cần quá chú trọng vào hiển thị của màn hình',1,'macbook.lpeg'),(41,' Intel, Core i5, 1.8 Ghz',2000,0,100,'6000mAh','Windown','13.3 inch LED-backlit',' 8 GB, LPDDR3, 1600 Mhz','ASUS ZenBook UX434FA','thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,'asus.jpg'),(42,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Dell Latitude E7270','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',4,'dell.jpg'),(43,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','HP zBook Studio G3','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,'hp.png'),(44,'Intel, Core M3, 1.2 GHz',2000,0,150,'6000mAh','Windown',' 12 inch LED-backlit','8 GB, LPDDR3, 1866 MHz','Lenovo Legion Y530 15 i7 8750H','thiết kế không có thay đổi so với phiên bản 2016 nhưng Apple đã nâng cấp thêm bộ nhớ và giới thiệu bộ vi xử lý Intel thế hệ thứ 7','12 tháng','Hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',6,'lenovo.png');
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trang_thai_don_hang`
--

DROP TABLE IF EXISTS `trang_thai_don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trang_thai_don_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_trang_thai` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trang_thai_don_hang`
--

LOCK TABLES `trang_thai_don_hang` WRITE;
/*!40000 ALTER TABLE `trang_thai_don_hang` DISABLE KEYS */;
INSERT INTO `trang_thai_don_hang` VALUES (1,'Đã Giao Hàng'),(2,'Chưa Giao Hàng'),(3,'Đang Giao Hàng');
/*!40000 ALTER TABLE `trang_thai_don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trang_thai_thanh_toan`
--

DROP TABLE IF EXISTS `trang_thai_thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trang_thai_thanh_toan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_trang_thai` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trang_thai_thanh_toan`
--

LOCK TABLES `trang_thai_thanh_toan` WRITE;
/*!40000 ALTER TABLE `trang_thai_thanh_toan` DISABLE KEYS */;
INSERT INTO `trang_thai_thanh_toan` VALUES (1,'Đã Thanh Toán'),(2,'Chưa Thanh Toán');
/*!40000 ALTER TABLE `trang_thai_thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-23 21:26:34
