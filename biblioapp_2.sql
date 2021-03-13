-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: biblioapp
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` int NOT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `numero_celular` bigint NOT NULL,
  `programa` varchar(35) DEFAULT NULL,
  `correo` varchar(60) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (99040502,'user','user','30021212',3102545787,'Ingenieria de sistemas','sdasd@g.co','Estudiante','2020-10-11',NULL),(324234324,'UserX','UserX',NULL,3102121454,NULL,'dfsdf@g.co','Otro','2020-10-12',NULL),(646464464,'sadasd','asdasd','5546564',4645464,'Ingeniería Aeronáutica','saddsdsd@d.co','Estudiante','2020-10-12',NULL),(23423434,'ewrwer','werwer','324234',324234343,'Ingeniería Multimedia','erwere@g.co','Docente','2020-10-06',NULL),(999999999,'fsdfsdf','sdfsdf',NULL,23423444,NULL,'werwer@g.co','Otro','2020-10-02','2020-10-12'),(15415454,'sadasd','asds','3242342',4544545,'Ingeniería Electrónica','asd@f.co','Docente','2020-10-12',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id_editorial` int NOT NULL,
  `nombre_editorial` varchar(45) NOT NULL,
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Alfaomega'),(2,'Angosta Editores'),(3,'Alianza'),(4,'Atalanta'),(5,'Atenea'),(6,'Babel Libros'),(7,'Caja Negra'),(8,'ECOE Ediciones'),(9,'Icono Editorial'),(10,'Library of America'),(11,'Penguin Books'),(12,'Planeta'),(13,'Robot'),(14,'Salamandra'),(15,'Siruela'),(16,'Urano');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplar`
--

DROP TABLE IF EXISTS `ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemplar` (
  `id_ejemplares` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `id_libros` int NOT NULL,
  PRIMARY KEY (`id_ejemplares`),
  KEY `fk_ejemplar_libro_idx` (`id_libros`),
  CONSTRAINT `fk_ejemplar_libro` FOREIGN KEY (`id_libros`) REFERENCES `libro` (`id_libros`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplar`
--

LOCK TABLES `ejemplar` WRITE;
/*!40000 ALTER TABLE `ejemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Arte'),(2,'Ciencias'),(3,'Ciencias Humanas'),(4,'Ciencias Políticas y Sociales'),(5,'Cómics Manga'),(6,'Deportes y Juegos'),(7,'Derecho'),(8,'Economía'),(9,'Empresa'),(10,'Fotografía'),(11,'Guías de Viaje'),(12,'Historia'),(13,'Idiomas'),(14,'Infantil'),(15,'Informática'),(16,'Ingeniería'),(17,'Juvenil'),(18,'Libros de Texto y Formación'),(19,'Literatura'),(20,'Manualidades'),(21,'Medicina'),(22,'Música'),(23,'Novelas'),(24,'Psicología y Pedagogía'),(25,'Salud'),(26,'Terror');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_libros` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `autor` varchar(45) NOT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `edicion` varchar(45) NOT NULL,
  `fecha_salida` varchar(45) NOT NULL,
  `ejemplar` int NOT NULL,
  `img_libro` longblob,
  `editorial` int NOT NULL,
  `genero` int NOT NULL,
  PRIMARY KEY (`id_libros`),
  KEY `fk_libro_editorial_idx` (`editorial`),
  KEY `fk_libro_genero_idx` (`genero`),
  CONSTRAINT `fk_libro_editorial` FOREIGN KEY (`editorial`) REFERENCES `editorial` (`id_editorial`),
  CONSTRAINT `fk_libro_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novedad`
--

DROP TABLE IF EXISTS `novedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `novedad` (
  `id` int NOT NULL,
  `motivo` varchar(300) NOT NULL,
  `fehca_reporte` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novedad`
--

LOCK TABLES `novedad` WRITE;
/*!40000 ALTER TABLE `novedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `novedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `fecha_max_devolucion` date NOT NULL,
  `usuario_cedula` int NOT NULL,
  `cliente` int NOT NULL,
  `ejemplar` int NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_prestamo_usuario_idx` (`usuario_cedula`),
  KEY `fk_prestamo_cliente_idx` (`cliente`),
  KEY `fk_prestamo_ejemplar_idx` (`ejemplar`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo_novedad`
--

DROP TABLE IF EXISTS `prestamo_novedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo_novedad` (
  `prestamo_id_prestamo` int NOT NULL,
  `novedad_id` int NOT NULL,
  `multas_id_multa` decimal(15,0) DEFAULT NULL,
  `fecha` int NOT NULL,
  PRIMARY KEY (`prestamo_id_prestamo`,`novedad_id`),
  KEY `fk_prestamo_novedad_prestamo_idx` (`prestamo_id_prestamo`),
  KEY `fk_prestamo_novedad_novedad_idx` (`novedad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo_novedad`
--

LOCK TABLES `prestamo_novedad` WRITE;
/*!40000 ALTER TABLE `prestamo_novedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo_novedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cedula` int NOT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `numero_celular` bigint NOT NULL,
  `correo` varchar(60) NOT NULL,
  `clave` varchar(256) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1016109429,'Sebastian','Jaramillo',3208153573,'sebashlat@gmail.com','7c222fb2927d828af22f592134e8932480637c0d','2020-10-12',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-12 22:59:56
