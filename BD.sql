-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: hardvard
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acceso` (
  `cod_menu` int NOT NULL,
  `id_tipoUsuario` int NOT NULL,
  PRIMARY KEY (`cod_menu`,`id_tipoUsuario`),
  KEY `acceso_ibfk_1` (`id_tipoUsuario`),
  CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`id_tipoUsuario`) REFERENCES `tipousuario` (`id_tipoUsuario`),
  CONSTRAINT `acceso_ibfk_2` FOREIGN KEY (`cod_menu`) REFERENCES `menu` (`cod_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(1,2),(2,2),(3,2),(5,2),(6,2),(7,2),(1,6),(5,6);
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclo` (
  `codCiclo` int NOT NULL AUTO_INCREMENT,
  `nomCiclo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`codCiclo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo`
--

LOCK TABLES `ciclo` WRITE;
/*!40000 ALTER TABLE `ciclo` DISABLE KEYS */;
INSERT INTO `ciclo` VALUES (1,'PRIMERO'),(2,'SEGUNDO'),(3,'TERCERO'),(4,'CUARTO'),(5,'QUINTO'),(6,'SEXTO');
/*!40000 ALTER TABLE `ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `cod_curso` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(40) DEFAULT NULL,
  `credi_curso` int DEFAULT NULL,
  `horas_curso` int DEFAULT NULL,
  `codCiclo` int DEFAULT NULL,
  PRIMARY KEY (`cod_curso`),
  KEY `codCiclo` (`codCiclo`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`codCiclo`) REFERENCES `ciclo` (`codCiclo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Lenguaje de programacion',10,2,1),(2,'base de datos',20,3,1),(3,'Programacion orientada a objetos II',10,4,1),(4,'Gestion de servicios TI',20,3,1),(5,'Desarrollo de habilidades profesionales',10,2,1),(6,'Analisis y diseño de sistemas',10,4,1),(7,'Arquitectura de entornos web',10,3,2),(8,'Desarrollo de HP',10,4,2);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarioseccion`
--

DROP TABLE IF EXISTS `horarioseccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarioseccion` (
  `cod_HS` int NOT NULL AUTO_INCREMENT,
  `cod_curso` int NOT NULL,
  `Horario` varchar(45) DEFAULT NULL,
  `Seccion` varchar(45) DEFAULT NULL,
  `Dia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_HS`),
  KEY `fk_codCURSO1_idx` (`cod_curso`),
  CONSTRAINT `fk_codCURSO1` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarioseccion`
--

LOCK TABLES `horarioseccion` WRITE;
/*!40000 ALTER TABLE `horarioseccion` DISABLE KEYS */;
INSERT INTO `horarioseccion` VALUES (2,2,'11:00','T4VN','Viernes'),(3,1,'20:00','T3ML','Domingo'),(4,2,'21:00','I4GN','Martes'),(5,3,'13:00','S2ND','Lunes'),(6,5,'11:00','G3NR','Jueves'),(7,6,'22:00','R5HN','Sabado'),(8,7,'23:00','H2MN','Miercoles'),(9,3,'21:00','K8MF','Domingo'),(10,2,'10:00','O6DS','Lunes'),(11,5,'08:00','K4NS','Jueves'),(12,2,'00:00','TY41','Miercoles'),(13,4,'23:00','5y34','Miercoles');
/*!40000 ALTER TABLE `horarioseccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_usu` varchar(15) NOT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `clave` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `cod_usu_idx` (`cod_usu`),
  CONSTRAINT `cod_usu` FOREIGN KEY (`cod_usu`) REFERENCES `usuario` (`cod_usu`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'USU1','santiago','santiago'),(3,'USU2','USU2','admUSU2'),(8,'USU25','secretaria','secretaria'),(9,'USU33','coordinador','coordinador');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `cod_menu` int NOT NULL AUTO_INCREMENT,
  `descrip_menu` varchar(45) DEFAULT NULL,
  `url_menu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Mantenimiento Matricula','Matricula.jsp'),(2,'Cursos','ServletCurso?tipo=LISTAR'),(3,'Solicitudes','ServletSolicitante?tipo=LISTAR'),(4,'Mantenimiento de usuarios','ServletUsuarios?tipo=LISTAR'),(5,'Horarios y Secciones','ServletHorarioSeccion?tipo=LISTAR'),(6,'Matriculas','Matricular.jsp'),(7,'Notas','ConsultaNotas.jsp');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regmatricula`
--

DROP TABLE IF EXISTS `regmatricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regmatricula` (
  `codMatricula` int NOT NULL AUTO_INCREMENT,
  `cod_usu` varchar(8) NOT NULL,
  `codCiclo` int DEFAULT NULL,
  `cod_carrera` int DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`codMatricula`),
  KEY `codCiclo` (`codCiclo`),
  KEY `cod_carrera` (`cod_carrera`),
  CONSTRAINT `regmatricula_ibfk_1` FOREIGN KEY (`codCiclo`) REFERENCES `ciclo` (`codCiclo`),
  CONSTRAINT `regmatricula_ibfk_2` FOREIGN KEY (`cod_carrera`) REFERENCES `tb_carrera` (`cod_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regmatricula`
--

LOCK TABLES `regmatricula` WRITE;
/*!40000 ALTER TABLE `regmatricula` DISABLE KEYS */;
INSERT INTO `regmatricula` VALUES (1,'USU2',2,1,'Matriculado','2022-11-27'),(12,'USU2934',1,1,'matriculado','2022-11-28'),(13,'USU2916',1,1,'matriculado','2022-11-28'),(14,'USU3049',1,1,'matriculado','2022-11-29'),(15,'USU3136',1,1,'matriculado','2022-11-29'),(16,'USU3235',1,1,'matriculado','2022-11-29'),(17,'USU3448',1,1,'matriculado','2022-11-29'),(18,'USU3513',1,1,'matriculado','2022-11-29'),(19,'USU3667',1,1,'matriculado','2022-11-29'),(20,'USU3421',3,1,'matriculado','2022-11-29'),(22,'USU3832',1,1,'matriculado','2022-11-29'),(23,'USU3462',1,1,'matriculado','2022-11-29');
/*!40000 ALTER TABLE `regmatricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carrera`
--

DROP TABLE IF EXISTS `tb_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_carrera` (
  `cod_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carrera`
--

LOCK TABLES `tb_carrera` WRITE;
/*!40000 ALTER TABLE `tb_carrera` DISABLE KEYS */;
INSERT INTO `tb_carrera` VALUES (1,'COMPUTACION E INFORMATICA'),(2,'ADMNISTRACION DE SISTEMAS'),(3,'INGENIERIA'),(4,'INFORMATICA');
/*!40000 ALTER TABLE `tb_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estudianteasigantura`
--

DROP TABLE IF EXISTS `tb_estudianteasigantura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estudianteasigantura` (
  `codregistro` int NOT NULL AUTO_INCREMENT,
  `cod_usu` varchar(15) NOT NULL,
  `cod_curso` int DEFAULT NULL,
  `nota1` int DEFAULT NULL,
  `nota2` int DEFAULT NULL,
  `nota3` int DEFAULT NULL,
  `nota4` int DEFAULT NULL,
  `promedio` double DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codregistro`),
  KEY `cod_curso` (`cod_curso`),
  KEY `tb_cOdUsuario10_idx` (`cod_usu`),
  CONSTRAINT `tb_cOdUsuario10` FOREIGN KEY (`cod_usu`) REFERENCES `usuario` (`cod_usu`) ON DELETE CASCADE,
  CONSTRAINT `tb_estudianteasigantura_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estudianteasigantura`
--

LOCK TABLES `tb_estudianteasigantura` WRITE;
/*!40000 ALTER TABLE `tb_estudianteasigantura` DISABLE KEYS */;
INSERT INTO `tb_estudianteasigantura` VALUES (9,'USU2934',1,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(10,'USU2934',2,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(11,'USU2934',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(12,'USU2934',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(13,'USU2934',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(14,'USU2934',6,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(15,'USU2916',1,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(16,'USU2916',2,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(17,'USU2916',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(18,'USU2916',4,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(19,'USU2916',5,20,20,20,20,20,'Aprobado'),(20,'USU2916',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(21,'USU3049',1,NULL,NULL,NULL,NULL,NULL,NULL),(22,'USU3049',2,NULL,NULL,NULL,NULL,NULL,NULL),(23,'USU3049',3,NULL,NULL,NULL,NULL,NULL,NULL),(24,'USU3049',4,NULL,NULL,NULL,NULL,NULL,NULL),(25,'USU3049',5,NULL,NULL,NULL,NULL,NULL,NULL),(26,'USU3049',6,NULL,NULL,NULL,NULL,NULL,NULL),(27,'USU3136',1,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(28,'USU3136',2,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(29,'USU3136',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(30,'USU3136',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(31,'USU3136',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(32,'USU3136',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(33,'USU3235',1,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(34,'USU3235',2,NULL,NULL,NULL,NULL,NULL,'Pendiente'),(35,'USU3235',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(36,'USU3235',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(37,'USU3235',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(38,'USU3235',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(39,'USU3448',1,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(40,'USU3448',2,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(41,'USU3448',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(42,'USU3448',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(43,'USU3448',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(44,'USU3448',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(45,'USU3513',1,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(46,'USU3513',2,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(47,'USU3513',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(48,'USU3513',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(49,'USU3513',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(50,'USU3513',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(51,'USU3667',1,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(52,'USU3667',2,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(53,'USU3667',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(54,'USU3667',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(55,'USU3667',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(56,'USU3667',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(57,'USU3832',1,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(58,'USU3832',2,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(59,'USU3832',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(60,'USU3832',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(61,'USU3832',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(62,'USU3832',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(63,'USU3462',1,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(64,'USU3462',2,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(65,'USU3462',3,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(66,'USU3462',4,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(67,'USU3462',5,NULL,NULL,NULL,NULL,NULL,'Desaprobado'),(68,'USU3462',6,NULL,NULL,NULL,NULL,NULL,'Desaprobado');
/*!40000 ALTER TABLE `tb_estudianteasigantura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcarreracur`
--

DROP TABLE IF EXISTS `tbcarreracur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcarreracur` (
  `codCarreCur` int NOT NULL AUTO_INCREMENT,
  `CodCarrera` int DEFAULT NULL,
  `cod_curso` int DEFAULT NULL,
  PRIMARY KEY (`codCarreCur`),
  KEY `cod_curso` (`cod_curso`),
  KEY `CodCarrera` (`CodCarrera`),
  CONSTRAINT `tbcarreracur_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`),
  CONSTRAINT `tbcarreracur_ibfk_2` FOREIGN KEY (`CodCarrera`) REFERENCES `tb_carrera` (`cod_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcarreracur`
--

LOCK TABLES `tbcarreracur` WRITE;
/*!40000 ALTER TABLE `tbcarreracur` DISABLE KEYS */;
INSERT INTO `tbcarreracur` VALUES (1,1,1),(2,1,3);
/*!40000 ALTER TABLE `tbcarreracur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipousuario` (
  `id_tipoUsuario` int NOT NULL AUTO_INCREMENT,
  `tipoUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'administrador'),(2,'secretaria'),(3,'profesor'),(4,'alumno'),(5,'solicitante'),(6,'coordinador');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nomUsu` varchar(45) NOT NULL,
  `apeUsu` varchar(45) NOT NULL,
  `dniUsu` varchar(8) NOT NULL,
  `fonoUsu` varchar(9) DEFAULT NULL,
  `edadUsu` int DEFAULT NULL,
  `sexoUsu` varchar(10) DEFAULT NULL,
  `FecRegistro` date DEFAULT NULL,
  `cod_usu` varchar(8) DEFAULT NULL,
  `id_tipoUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `dniUsu_UNIQUE` (`dniUsu`),
  UNIQUE KEY `cod_usu` (`cod_usu`),
  KEY `id_tipoUsuario` (`id_tipoUsuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipoUsuario`) REFERENCES `tipousuario` (`id_tipoUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'SANTIAGO','GONZALES','73056331','935385207',18,'Masculino','2022-11-11','USU1',1),(2,'felipe','rojas','21783632','232132131',18,'Masculino','2022-11-28','USU2934',4),(5,'santiago','rojas','12312312','123456778',40,'Masculino','2022-11-08','USU2',1),(28,'martin','rojas','76577889','935385207',20,'Femenino','2022-11-28','USU25',2),(29,'martin','daadad','12313123','213123123',20,'Masculino','2022-11-28','USU2916',4),(30,'maria','rojas','43241144','213142144',30,'Femenino','2022-11-29','USU3049',4),(31,'santiago','gonzales','64327111','213131233',19,'Masculino','2022-11-29','USU3136',4),(32,'martin','rojas','21312313','212213123',20,'Masculino','2022-11-29','USU3235',4),(33,'maria','mercedez','12312342','123212111',43,'Femenino','2022-11-29','USU33',6),(34,'martin','carmales','23123144','241421444',23,'Masculino','2022-11-29','USU3448',4),(35,'edy','lalal lelele','47475299','965478523',19,'Femenino','2022-11-29','USU3513',4),(36,'carlos','castillo terrones','36547821','965478523',25,'Masculino','2022-11-29','USU3667',4),(37,'trtrtrtrtrtr','Davolio','92106378','965478523',30,'Femenino','2022-11-29','USU3832',4),(38,'qqqq','qqqqq','99999997','965478523',18,'Masculino','2022-11-29','USU3462',4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hardvard'
--

--
-- Dumping routines for database 'hardvard'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarAlumno`(vidusuario int,vcod_usu varchar(8))
BEGIN
update usuario set id_tipoUsuario=4, cod_usu=vcod_usu where idusuario=vidusuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlumnoxId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlumnoxId`(vidusuario int)
BEGIN
  IF  4 in (select DISTINCT id_tipoUsuario From usuario where idusuario = vidusuario)
    THEN SELECT u.idusuario, u.nomUsu, u.apeUsu, u.dniUsu, u.fonoUsu, u.edadUsu, 
u.sexoUsu, u.FecRegistro, u.cod_usu, u.id_tipoUsuario, t.tipoUsuario, 
m.codCiclo, tc.nombre
FROM usuario u join tipousuario t on u.id_tipoUsuario=t.id_tipoUsuario 
join regmatricula m on u.cod_usu=m.cod_usu join tb_carrera tc on tc.cod_carrera = m.cod_carrera
where u.idusuario = vidusuario;
  ELSEIF 5 in (select DISTINCT id_tipoUsuario From usuario where idusuario = vidusuario) 
THEN SELECT u.idusuario, u.nomUsu, u.apeUsu, u.dniUsu, u.fonoUsu, u.edadUsu, 
u.sexoUsu, u.FecRegistro, u.cod_usu, u.id_tipoUsuario, t.tipoUsuario
FROM usuario u join tipousuario t on u.id_tipoUsuario=t.id_tipoUsuario 
where u.idusuario = vidusuario;
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscarPorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarPorCodigo`(vdni varchar(8))
BEGIN
SELECT u.idusuario, u.nomUsu, u.apeUsu, u.dniUsu, u.fonoUsu, u.edadUsu, u.sexoUsu, u.FecRegistro, u.cod_usu, u.id_tipoUsuario 
FROM usuario u join tipousuario t on u.id_tipoUsuario = t.id_tipoUsuario where u.dniUsu=vdni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscarPorDni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarPorDni`(vdni varchar(8))
BEGIN
SELECT u.idusuario, u.nomUsu, u.apeUsu, u.dniUsu, u.fonoUsu, u.edadUsu, u.sexoUsu, u.FecRegistro, u.cod_usu, u.id_tipoUsuario 
FROM usuario u join tipousuario t on u.id_tipoUsuario = t.id_tipoUsuario where u.dniUsu=vdni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `matricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `matricula`(vcod_usu varchar(8),vcodCiclo int,vcodCarrera int)
BEGIN

  DECLARE var_id INTEGER;
  DECLARE vcodCurso INTEGER;
  DECLARE var_final INTEGER DEFAULT 0;
  DECLARE cursor1 CURSOR FOR SELECT cod_curso FROM cursos where codCiclo=vcodCiclo;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;
  
  insert into regmatricula values(0,vcod_usu,vcodCiclo,vcodCarrera,'matriculado',CURDATE());
	
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vcodCurso;
    IF var_final = 1 THEN
      LEAVE bucle;
    END IF;
    insert into tb_estudianteasigantura (codregistro,cod_usu,cod_curso,estado) values(null,vcod_usu,vcodCurso,'Desaprobado');

  END LOOP bucle;
  CLOSE cursor1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `notasxCod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `notasxCod`(vcod_usu varchar(8))
BEGIN
select c.nombre_curso,e.nota1,e.nota2,e.nota3,e.nota4,e.promedio,e.estado, c.codCiclo 
from tb_estudianteasigantura e join cursos c on e.cod_curso=c.cod_curso
where cod_usu=vcod_usu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-02  4:53:58
