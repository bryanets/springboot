-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: prueba
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
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(255) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'computacion',6,'ciclos');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo_academico`
--

DROP TABLE IF EXISTS `ciclo_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclo_academico` (
  `id_ciclo` int NOT NULL AUTO_INCREMENT,
  `id_carrera` int DEFAULT NULL,
  `numero_ciclo` int DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_ciclo`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `ciclo_academico_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo_academico`
--

LOCK TABLES `ciclo_academico` WRITE;
/*!40000 ALTER TABLE `ciclo_academico` DISABLE KEYS */;
INSERT INTO `ciclo_academico` VALUES (1,1,1,'primero'),(2,1,2,'segundo'),(3,1,3,'tercero'),(4,1,4,'cuarto'),(5,1,5,'quinto'),(6,1,6,'sexto');
/*!40000 ALTER TABLE `ciclo_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(255) DEFAULT NULL,
  `creditos` int DEFAULT NULL,
  `id_carrera` int DEFAULT NULL,
  `id_profesor` int DEFAULT NULL,
  `id_matricula` int DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `cursos_ibfk_1` (`id_carrera`),
  KEY `cursos_ibfk_2` (`id_profesor`),
  KEY `cursos_ibkf_3_idx` (`id_matricula`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE CASCADE,
  CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE,
  CONSTRAINT `cursos_ibkf_3` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Introducción a la algoritmia',3,1,1,NULL),(2,'Arquitectura de Entornos Web',3,1,1,NULL),(3,'Tecnologías de la Información',2,1,1,NULL),(4,'Fundamentos de Gestión Empresarial',2,1,1,NULL),(5,'Matemática I',2,1,1,NULL),(6,'Desarrollo de Habilidades Profesionales I',2,1,1,NULL);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos_ciclo`
--

DROP TABLE IF EXISTS `cursos_ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos_ciclo` (
  `id_ciclo` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id_ciclo`,`id_curso`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `cursos_ciclo_ibfk_1` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclo_academico` (`id_ciclo`),
  CONSTRAINT `cursos_ciclo_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos_ciclo`
--

LOCK TABLES `cursos_ciclo` WRITE;
/*!40000 ALTER TABLE `cursos_ciclo` DISABLE KEYS */;
INSERT INTO `cursos_ciclo` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6);
/*!40000 ALTER TABLE `cursos_ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `id_curso` int DEFAULT NULL,
  `dia_semana` varchar(255) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `aula` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (2,2,'Lunes','08:00:00','09:30:00','T1DN'),(4,1,'Martes','09:45:00','11:15:00','T1DN'),(5,1,'Miercoles','02:30:00','04:15:00','T1TN'),(6,2,'Jueves','02:30:00','04:15:00','T1TN');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_carrera` int DEFAULT NULL,
  `fecha_matricula` date DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `CL1` int DEFAULT NULL,
  `CL2` int DEFAULT NULL,
  `CL3` int DEFAULT NULL,
  `SP` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `id_matricula` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_cursos_notas_idx` (`id_curso`),
  KEY `fk_matricula_idx` (`id_matricula`),
  CONSTRAINT `fk_cursos_notas` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  CONSTRAINT `fk_matricula` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,15);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enlace`
--

DROP TABLE IF EXISTS `tb_enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_enlace` (
  `idenlace` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `ruta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idenlace`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enlace`
--

LOCK TABLES `tb_enlace` WRITE;
/*!40000 ALTER TABLE `tb_enlace` DISABLE KEYS */;
INSERT INTO `tb_enlace` VALUES (2,'usuarios','/usuario/lista'),(3,'carreras','/carrera/lista'),(4,'cursos','/curso/lista'),(5,'matriculas','/matricula/lista'),(6,'horarios','/horario/lista'),(7,'intranet','/usuario/intranet');
/*!40000 ALTER TABLE `tb_enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rol`
--

DROP TABLE IF EXISTS `tb_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rol`
--

LOCK TABLES `tb_rol` WRITE;
/*!40000 ALTER TABLE `tb_rol` DISABLE KEYS */;
INSERT INTO `tb_rol` VALUES (1,'administrador'),(2,'alumno'),(3,'solicitante'),(4,'profesor');
/*!40000 ALTER TABLE `tb_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rol_enlace`
--

DROP TABLE IF EXISTS `tb_rol_enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rol_enlace` (
  `idrol` int NOT NULL,
  `idenlace` int NOT NULL,
  PRIMARY KEY (`idrol`,`idenlace`),
  KEY `fk25` (`idenlace`),
  CONSTRAINT `fk24` FOREIGN KEY (`idrol`) REFERENCES `tb_rol` (`idrol`),
  CONSTRAINT `fk25` FOREIGN KEY (`idenlace`) REFERENCES `tb_enlace` (`idenlace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rol_enlace`
--

LOCK TABLES `tb_rol_enlace` WRITE;
/*!40000 ALTER TABLE `tb_rol_enlace` DISABLE KEYS */;
INSERT INTO `tb_rol_enlace` VALUES (1,2),(1,3),(1,4),(1,5),(1,6),(1,7);
/*!40000 ALTER TABLE `tb_rol_enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `idrol` int DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `dni` varchar(8) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_usuario_rol_idx` (`idrol`),
  KEY `llave_idx` (`idrol`),
  CONSTRAINT `ghgh` FOREIGN KEY (`idrol`) REFERENCES `tb_rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'bryan','trebejo','bryantrebejo@hotmail.com','$2a$10$cKE.Y1BJHk.6Skw53xTbDO8MGdE2woJgQkZJ9GUuDlcynFTIcmh8G',1,'bryan','47586985'),(14,'frank','mendoza','i201821212@cibertec.edu.pe','wqwwqwqwq',3,'frank20','12345678'),(15,'Armando','Scripts','sarmando@cibertec.pe',NULL,4,'armando','85203698'),(16,'benedicto','XIV','papita@hotmail.com','$2a$10$hQUVDh6uWf/ioBfKagMbu.mCNfCdgLsYFPm3SOEZUx7bOSvrYnG/C',3,'papaxiv','58963247');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'prueba'
--

--
-- Dumping routines for database 'prueba'
--
/*!50003 DROP PROCEDURE IF EXISTS `cursos_carrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursos_carrera`(Vcod int)
BEGIN
select ca.id_carrera,ca.nombre_carrera, cu.nombre_curso,cu.creditos, ci.descripcion,cc.id_ciclo from carrera ca 
join cursos cu on cu.id_carrera=ca.id_carrera 
join cursos_ciclo cc on cc.id_curso=cu.id_curso
join ciclo_academico ci on ci.id_ciclo=cc.id_ciclo 
where ca.id_carrera=Vcod; 
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

-- Dump completed on 2023-06-19  5:22:10
