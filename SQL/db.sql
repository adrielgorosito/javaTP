CREATE DATABASE  IF NOT EXISTS `javatp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `javatp`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: javatp
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `historial_compras`
--

DROP TABLE IF EXISTS `historial_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_compras` (
  `idProd` int NOT NULL,
  `dniUser` int NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL,
  `precio` double NOT NULL,
  `formaPago` varchar(45) NOT NULL,
  PRIMARY KEY (`idProd`,`dniUser`,`fecha`),
  KEY `fk_dniU_idx` (`dniUser`),
  CONSTRAINT `fk_dniU` FOREIGN KEY (`dniUser`) REFERENCES `user` (`dni`),
  CONSTRAINT `fk_idP` FOREIGN KEY (`idProd`) REFERENCES `producto` (`id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_compras`
--

LOCK TABLES `historial_compras` WRITE;
/*!40000 ALTER TABLE `historial_compras` DISABLE KEYS */;
INSERT INTO `historial_compras` VALUES (1,42125750,'2023-07-23 19:40:56',1,50000,'Rapipago'),(2,42125750,'2023-07-23 19:40:56',2,100000,'Rapipago'),(3,42125750,'2023-07-23 19:40:56',1,40000,'Pagofacil'),(5,41690840,'2023-07-23 19:40:56',2,60000,'Rapipago'),(7,40700800,'2023-07-23 19:40:56',1,90000,'Pagofacil'),(9,41690840,'2023-07-23 19:40:56',1,70000,'Rapipago'),(15,40123123,'2023-07-23 19:40:56',3,50000,'Rapipago'),(16,40123123,'2023-07-23 19:40:56',1,12000,'Pagofacil');
/*!40000 ALTER TABLE `historial_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_prod` int NOT NULL AUTO_INCREMENT,
  `tipo_prod` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `stock` int NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_prod`),
  KEY `FK_tipop_rod_idx` (`tipo_prod`),
  CONSTRAINT `FK_tipop_rod` FOREIGN KEY (`tipo_prod`) REFERENCES `tipo_producto` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Monitor BenQ 24\'\'','Pantalla Led de 24\'\', negro, 100V/240V, 60Hz',60000,'imgs/productos/1/monitor1.jpg',3,0),(2,1,'Monitor BenQ 24.5\'\'','Pantalla LCD de 24.5\'\', negro, 100V/240V, 240 Hz, DyAC incorporado',150000,'imgs/productos/1/monitor2.jpg',4,1),(3,1,'Monitor BenQ Zowie 24.5\'\'','Pantalla LED de 24.5\'\', negro, 100V/240V, 144 Hz, DyAC incorporado',92000,'imgs/productos/1/monitor3.jpg',2,1),(4,1,'Monitor LG 23.6\'\'','Pantalla LED de 23.6\'\', negro, 100V/240V, 144 Hz',79000,'imgs/productos/1/monitor4.jpg',0,1),(5,2,'Gabinete Sentey K20 Super','Gabinete de vidrio templado, negro, 4 ventiladores, 430 mm x 196 mm x 344 mm',23500,'imgs/productos/2/gabinete1.jpg',1,0),(6,3,'Placa de video NVIDIA EVGA GeForce Rtx 2060','Fabricante NVIDIA, marca EVGA, memoria GDDR6 12 GB',125800,'imgs/productos/3/gpu1.jpg',2,1),(7,3,'Placa de video NVIDIA MSI GeForce GTX 1660 Super','Fabricante NVIDIA, marca MSI, memoria GDDR6 6 GB',94000,'imgs/productos/3/gpu2.jpg',3,1),(8,3,'Placa de video NVIDIA Colorful Geforce RTX 3060 Ti','Fabricante NVIDIA, marca Colorful, memoria GDDR6 6 GB',181500,'imgs/productos/3/gpu3.jpg',1,1),(9,3,'Placa de video NVIDIA MSI GeForce N210','Fabricante NVIDIA, marca MSI, memoria DDR3 1 GB',10500,'imgs/productos/3/gpu4.jpg',3,1),(10,3,'Placa de video NVIDIA Gigabyte GT 1030','Fabricante NVIDIA, marca Gigabyte, memoria DDR4 2 GB',28400,'imgs/productos/3/gpu5.jpg',3,1),(11,3,'Placa de video NVIDIA ASUS GeForce GTX 1050 Ti','Fabricante NVIDIA, marca ASUS, memoria GDDR5 4 GB',65000,'imgs/productos/3/gpu6.jpg',4,1),(12,3,'Placa de video NVIDIA Palit GTX 1660 Ti','Fabricante NVIDIA, marca Palit, memoria GDDR6 6 GB',120000,'imgs/productos/3/gpu7.jpg',2,1),(13,3,'Placa de video NVIDIA PNY GeForce GTX 1650','Fabricante NVIDIA, marca PNY, memoria GDDR6 4 GB',61000,'imgs/productos/3/gpu8.jpg',4,1),(14,3,'Placa de video NVIDIA Zotac GeForce RTX 2060','Fabricante NVIDIA, marca Zotac, memoria GDDR6 6 GB',105000,'imgs/productos/3/gpu9.jpg',2,1),(15,3,'Placa de video NVIDIA INNO3D RTX 3090','Fabricante NVIDIA, marca INNO3D, memoria GDDR6X 24 GB',539000,'imgs/productos/3/gpu10.jpg',0,1),(16,3,'Placa de video AMD XFX RX 580','Fabricante AMD, marca XFX, memoria GDDR5 8 GB',80000,'imgs/productos/3/gpu11.jpg',2,1),(17,3,'Placa de video AMD Arktek RX 550','Fabricante AMD, marca Arktek, memoria GDDR5 4 GB',50000,'imgs/productos/3/gpu12.jpg',3,1),(18,3,'Placa de video AMD Sapphire RX 6500 XT','Fabricante AMD, marca Sapphire, memoria GDDR6 4 GB',65000,'imgs/productos/3/gpu13.jpg',2,1),(19,3,'Placa de video AMD ASRock RX 550','Fabricante AMD, marca ASRock, memoria GDDR5 2 GB',27000,'imgs/productos/3/gpu14.jpg',4,1),(20,5,'Memoria RAM Kingston DDR4 8 GB','DDR4, 8 GB, 2666 MHz',10500,'imgs/productos/5/ram1.jpg',15,1),(21,5,'Memoria RAM Crucial DDR4 8 GB','DDR4, 8 GB, 2666 MHz',7300,'imgs/productos/5/ram2.jpg',21,1),(22,5,'Memoria RAM Corsair DDR4 16 GB','DDR4, 16 GB, 3200 MHz',25000,'imgs/productos/5/ram3.jpg',9,1),(23,6,'Fuente Sentey 550W','Marca Sentey, línea Steel-Nitro Power, 550 W, negra, 100 V/240 V',13000,'imgs/productos/6/fuente1.jpg',4,1),(24,6,'Fuente ATX 550W','Marca ATX, línea ATX-550 P4, 550 W, negra, 200 V',2050,'imgs/productos/6/fuente2.jpg',7,1),(25,6,'Fuente Gigabyte 650W','Marca Gigabyte, línea P650B, 650 W, negra, 100 V/240 V',18000,'imgs/productos/6/fuente3.jpg',5,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Monitores',1),(2,'Gabinetes',0),(3,'Placas de video (GPU)',1),(4,'Procesadores',1),(5,'Memorias RAM',1),(6,'Fuentes',1);
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `dni` int NOT NULL,
  `nombUsuario` varchar(20) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  `provincia` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `usuario_UNIQUE` (`nombUsuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','Admin','Istrador','admin@admin.com',NULL,1,NULL,NULL,NULL),(40123123,'santi123','abc12345','Santiago','Botali','santiagobotali@gmail.com','3472582341',0,'Santa Fe','Rafaela','Dorrego 1230'),(40700800,'gastonbg','123456789','Gaston','Boggino','gastonboggino@gmail.com','341690875',0,'Santa Fe','Carlos Pellegrini','Uriburu 322'),(40766890,'13julian','123julian','Julian','Boxados','boxadosjulian@gmail.com','3471580977',0,'Buenos Aires','San Nicolás','Belgrano 1185'),(41690840,'luchoarmas','luciano1','Luciano','Armas','lucianoarmas1@gmail.com','341553659',0,'Santa Fe','Capitán Bermudez','San Juan 873'),(42125750,'adrielg1','123456789','Adriel','Gorosito','adrielgorosito14@gmail.com','3476609198',0,'Santa Fe','San Lorenzo','Av. San Martin 1076');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-23 19:43:06
