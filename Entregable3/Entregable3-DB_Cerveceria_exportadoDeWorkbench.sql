-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: entregable_3
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `categorias_cerveza`
--

DROP TABLE IF EXISTS `categorias_cerveza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_cerveza` (
  `Id_categoria_cerveza` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria_cerveza` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_categoria_cerveza`),
  UNIQUE KEY `Id_categoria_cerveza` (`Id_categoria_cerveza`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_cerveza`
--

LOCK TABLES `categorias_cerveza` WRITE;
/*!40000 ALTER TABLE `categorias_cerveza` DISABLE KEYS */;
INSERT INTO `categorias_cerveza` VALUES (1,'Lagers'),(2,'Ales');
/*!40000 ALTER TABLE `categorias_cerveza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_tipos`
--

DROP TABLE IF EXISTS `categorias_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_tipos` (
  `id_categoria_cerveza` int NOT NULL,
  `id_tipo_cerveza` int NOT NULL,
  PRIMARY KEY (`id_categoria_cerveza`,`id_tipo_cerveza`),
  KEY `id_tipo_cerveza` (`id_tipo_cerveza`),
  CONSTRAINT `categorias_tipos_ibfk_1` FOREIGN KEY (`id_categoria_cerveza`) REFERENCES `categorias_cerveza` (`Id_categoria_cerveza`),
  CONSTRAINT `categorias_tipos_ibfk_2` FOREIGN KEY (`id_tipo_cerveza`) REFERENCES `tipos_cerveza` (`Id_tipo_cerveza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_tipos`
--

LOCK TABLES `categorias_tipos` WRITE;
/*!40000 ALTER TABLE `categorias_tipos` DISABLE KEYS */;
INSERT INTO `categorias_tipos` VALUES (1,1),(2,2),(1,3),(2,4),(2,5),(1,6),(2,6),(2,7);
/*!40000 ALTER TABLE `categorias_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cervezas`
--

DROP TABLE IF EXISTS `cervezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cervezas` (
  `Id_cerveza` int NOT NULL AUTO_INCREMENT,
  `nombre_cerveza` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `grado_alcohol` decimal(10,0) DEFAULT NULL,
  `pais_origen` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`Id_cerveza`),
  UNIQUE KEY `Id_cerveza` (`Id_cerveza`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `cervezas_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_cerveza` (`Id_categoria_cerveza`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cervezas`
--

LOCK TABLES `cervezas` WRITE;
/*!40000 ALTER TABLE `cervezas` DISABLE KEYS */;
INSERT INTO `cervezas` VALUES (1,'Poker','Palido',4,'Colombia','2019-06-24',1),(2,'Aguila','Ambar',3,'Colombia','2020-09-06',1),(3,'Club Colombia','Oscuro',5,'Colombia','2021-02-19',1),(4,'Heineken','Palido',4,'Paises Bajos','2020-05-18',2),(5,'Modelo','Oscuro',5,'Mexico','2018-10-05',2);
/*!40000 ALTER TABLE `cervezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cervezas_materias_primas`
--

DROP TABLE IF EXISTS `cervezas_materias_primas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cervezas_materias_primas` (
  `id_cerveza` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  PRIMARY KEY (`id_cerveza`,`id_materia_prima`),
  KEY `id_materia_prima` (`id_materia_prima`),
  CONSTRAINT `cervezas_materias_primas_ibfk_1` FOREIGN KEY (`id_cerveza`) REFERENCES `cervezas` (`Id_cerveza`),
  CONSTRAINT `cervezas_materias_primas_ibfk_2` FOREIGN KEY (`id_materia_prima`) REFERENCES `materias_primas` (`Id_materia_prima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cervezas_materias_primas`
--

LOCK TABLES `cervezas_materias_primas` WRITE;
/*!40000 ALTER TABLE `cervezas_materias_primas` DISABLE KEYS */;
INSERT INTO `cervezas_materias_primas` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3),(3,4);
/*!40000 ALTER TABLE `cervezas_materias_primas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias_primas`
--

DROP TABLE IF EXISTS `materias_primas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias_primas` (
  `Id_materia_prima` int NOT NULL AUTO_INCREMENT,
  `nombre_materia_prima` varchar(255) DEFAULT NULL,
  `usos` varchar(255) DEFAULT NULL,
  `pais_origen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_materia_prima`),
  UNIQUE KEY `Id_materia_prima` (`Id_materia_prima`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias_primas`
--

LOCK TABLES `materias_primas` WRITE;
/*!40000 ALTER TABLE `materias_primas` DISABLE KEYS */;
INSERT INTO `materias_primas` VALUES (1,'Lupulo','Cerveza','Colombia'),(2,'Botella','Envace','Colombia'),(3,'Tapa','Envace','Colombia'),(4,'Malta','Cerveza','Colombia');
/*!40000 ALTER TABLE `materias_primas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_cerveza`
--

DROP TABLE IF EXISTS `tipos_cerveza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_cerveza` (
  `Id_tipo_cerveza` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_cerveza` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_tipo_cerveza`),
  UNIQUE KEY `Id_tipo_cerveza` (`Id_tipo_cerveza`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_cerveza`
--

LOCK TABLES `tipos_cerveza` WRITE;
/*!40000 ALTER TABLE `tipos_cerveza` DISABLE KEYS */;
INSERT INTO `tipos_cerveza` VALUES (1,'Dark'),(2,'Pale'),(3,'Bocks'),(4,'Stouts'),(5,'Porters'),(6,'Belgians'),(7,'Sours');
/*!40000 ALTER TABLE `tipos_cerveza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31 21:01:56
