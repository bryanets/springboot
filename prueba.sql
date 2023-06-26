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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'computacion',6,'ciclos'),(2,'Administración de Redes y Comunicaciones',6,'Se encarga del estudio y mantenimiento del estado de las redes informáticas y de comunicación'),(3,'Industrial y Sistemas',6,'Serás capaz de gestionar, optimizar y controlar procesos empresariales relacionados con la producción industrial, incrementando la productividad de las organizaciones'),(4,'Administración y Sistemas',6,'Serás un experto en sistemas informáticos, capaz de administrar e implementar soluciones de Business Intelligence para cualquier tipo de organización');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo_academico`
--

LOCK TABLES `ciclo_academico` WRITE;
/*!40000 ALTER TABLE `ciclo_academico` DISABLE KEYS */;
INSERT INTO `ciclo_academico` VALUES (1,1,1,'primero'),(2,1,2,'segundo'),(3,1,3,'tercero'),(4,1,4,'cuarto'),(5,1,5,'quinto'),(6,1,6,'sexto'),(7,2,1,'primero'),(8,2,2,'segundo'),(9,2,3,'tercero'),(10,2,4,'cuarto'),(11,2,5,'quinto'),(12,2,6,'sexto'),(13,3,1,'primero'),(14,3,2,'segundo'),(15,3,3,'tercero'),(16,3,4,'cuarto'),(17,3,5,'quinto'),(18,3,6,'sexto'),(19,4,1,'primero'),(20,4,2,'segundo'),(21,4,3,'tercero'),(22,4,4,'cuarto'),(23,4,5,'quinto'),(24,4,6,'sexto');
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
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Introducción a la algoritmia',3,1,1,NULL),(2,'Arquitectura de Entornos Web',3,1,1,NULL),(3,'Tecnologías de la Información',2,1,1,NULL),(4,'Fundamentos de Gestión Empresarial',2,1,1,NULL),(5,'Matemática I',2,1,1,NULL),(6,'Desarrollo de Habilidades Profesionales I',2,1,1,NULL),(12,'Algoritmos y Estructura de Datos',3,1,1,NULL),(13,'Desarrollo de Entornos Web',3,1,1,NULL),(14,'Base de Datos',2,1,1,NULL),(15,'Modelado de Procesos de Negocios',2,1,1,NULL),(16,'Matemática II',2,1,1,NULL),(17,'Desarrollo de Habilidades Profesionales II',2,1,1,NULL),(18,'EFSRT I',1,1,1,NULL),(19,'Lenguaje de Programación I',3,1,1,NULL),(20,'Programación Orientada a Objetos I',3,1,1,NULL),(21,'Base de Datos Avanzado I',2,1,1,NULL),(22,'Análisis y Diseño de Sistemas I',2,1,1,NULL),(23,'Gestión de Datos Dinámicos',2,1,1,NULL),(24,'Desarrollo de Habilidades Profesionales III',2,1,1,NULL),(25,'EFSRT II',1,1,1,NULL),(26,'Lenguaje de Programación II',3,1,1,NULL),(27,'Programación Orientada a Objetos II',3,1,1,NULL),(28,'Base de Datos Avanzado II',2,1,1,NULL),(29,'Análisis y Diseño de Sistemas II',2,1,1,NULL),(30,'Gestión de Servicios de TI',2,1,1,NULL),(31,'Desarrollo de Habilidades Profesionales IV',2,1,1,NULL),(32,'EFSRT III',1,1,1,NULL),(33,'Desarrollo de Aplicaciones Web I',3,1,1,NULL),(34,'Desarrollo de Aplicaciones Móviles I',3,1,1,NULL),(35,'Desarrollo de Servicios Web I',2,1,1,NULL),(36,'Seguridad de Aplicaciones',2,1,1,NULL),(37,'Gestión de Proyectos de TI',2,1,1,NULL),(38,'Innovación y Emprendimiento',2,1,1,NULL),(39,'EFSRT IV',1,1,1,NULL),(40,'Desarrollo de Aplicaciones Web II',3,1,1,NULL),(41,'Desarrollo de Aplicaciones Móviles II',3,1,1,NULL),(42,'Desarrollo de Servicios Web II',2,1,1,NULL),(43,'Prueba de Software',2,1,1,NULL),(44,'Proyecto Integrador',2,1,1,NULL),(45,'Plan de Negocios',2,1,1,NULL),(46,'EFSRT V',1,1,1,NULL),(47,'Soporte de Software y Hardware',3,2,1,NULL),(48,'Tecnologías de la Información',3,2,1,NULL),(49,'Fundamentos de Gestión Empresarial',2,2,1,NULL),(50,'Arquitectura de Entornos Web',2,2,1,NULL),(51,'Matemática I',2,2,1,NULL),(52,'Desarrollo de Habilidades Profesionales I',2,2,1,NULL),(53,'Fundamentos de Redes',3,2,1,NULL),(54,'Arquitectura de Redes',3,2,1,NULL),(55,'Modelado de Procesos de Negocios',2,2,1,NULL),(56,'Sistemas Operativos',2,2,1,NULL),(57,'Matemática II',2,2,1,NULL),(58,'Desarrollo de Habilidades Profesionales II',2,2,1,NULL),(59,'EFSRT I',1,2,1,NULL),(60,'Estructura y Conmutación de Redes',3,2,1,NULL),(61,'Diseño de Redes',3,2,1,NULL),(62,'Cibeguridad',2,2,1,NULL),(63,'Administración de Sistemas Operativos',2,2,1,NULL),(64,'Gestión de Datos Dinámicos',2,2,1,NULL),(65,'Desarrollo de Habilidades Profesionales III',2,2,1,NULL),(66,'EFSRT II',1,2,1,NULL),(67,'Redes Escalables',3,2,1,NULL),(68,'Comunicaciones Unificadas',3,2,1,NULL),(69,'Análisis de Tráfico de Datos',2,2,1,NULL),(70,'Sistemas Operativos Abiertos',2,2,1,NULL),(71,'Gestión de Servicios de TI',2,2,1,NULL),(72,'Desarrollo de Habilidades Profesionales IV',2,2,1,NULL),(73,'EFSRT III',1,2,1,NULL),(74,'Redes Inalámbricas',3,2,1,NULL),(75,'Internet de las Cosas',3,2,1,NULL),(76,'Intusión Ética',2,2,1,NULL),(77,'Sistemas Operativos Avanzados',2,2,1,NULL),(78,'Gestión de Proyectos de TI',2,2,1,NULL),(79,'Innovación y Emprendimiento',2,2,1,NULL),(80,'EFSRT IV',1,2,1,NULL),(81,'Seguridad Perimetral',3,2,1,NULL),(82,'Redes Programables',3,2,1,NULL),(83,'Análisis Forense',2,2,1,NULL),(84,'Tecnologías de Virtualización',2,2,1,NULL),(85,'Proyecto Integrador',2,2,1,NULL),(86,'Plan de Negocios',2,2,1,NULL),(87,'EFSRT V',1,2,1,NULL),(88,'Introducción a los Procesos',3,3,1,NULL),(89,'Fundamentos de Gestión Empresarial',3,3,1,NULL),(90,'Dibujo Técnico Industrial',2,3,1,NULL),(91,'Tecnologías de Materiales',2,3,1,NULL),(92,'Matemática I',2,3,1,NULL),(93,'Desarrollo de Habilidades Profesionales I',2,3,1,NULL),(94,'Procesos Industriales',3,3,1,NULL),(95,'Modelado de Procesos de Negocio',3,3,1,NULL),(96,'Diseño de Instalaciones',2,3,1,NULL),(97,'Principios Contables',2,3,1,NULL),(98,'Matemática II',2,3,1,NULL),(99,'Desarrollo de Habilidades Profesionales II',2,3,1,NULL),(100,'EFSRT I',1,3,1,NULL),(101,'Métodos y Estudio de Tiempos',3,3,1,NULL),(102,'Gestión de Personas',3,3,1,NULL),(103,'Seguridad y Salud Ocupacional',2,3,1,NULL),(104,'Costos y Presupuestos',2,3,1,NULL),(105,'Gestión de Datos Dinámicos',2,3,1,NULL),(106,'Desarrollo de Habilidades Profesionales III',2,3,1,NULL),(107,'EFSRT II',1,3,1,NULL),(108,'Planificación de la Producción',3,3,1,NULL),(109,'Mejora Continua',3,3,1,NULL),(110,'Gestión Ambiental',2,3,1,NULL),(111,'Gestión del Abastecimiento',2,3,1,NULL),(112,'Tecnología de Empaque',2,3,1,NULL),(113,'Desarrollo de Habilidades Profesionales IV',2,3,1,NULL),(114,'EFSRT III',1,3,1,NULL),(115,'Programación de la Producción',3,3,1,NULL),(116,'Innovación de Operaciones',3,3,1,NULL),(117,'Gestión de la Calidad',2,3,1,NULL),(118,'Gestión del Almacenamiento e Inventario',2,3,1,NULL),(119,'Gestión de Proyectos',2,3,1,NULL),(120,'Innovación y Emprendimiento',2,3,1,NULL),(121,'EFSRT IV',1,3,1,NULL),(122,'Control de la Producción',3,3,1,NULL),(123,'Optimización de Procesos Industriales',3,3,1,NULL),(124,'Mantenimiento Productivo',2,3,1,NULL),(125,'Gestión de la Distribución',2,3,1,NULL),(126,'Lógistica Internacional',2,3,1,NULL),(127,'Plan de Negocios',2,3,1,NULL),(128,'EFSRT V',1,3,1,NULL),(129,'Fundamentos de Gestión Empresarial',3,4,1,NULL),(130,'Tecnologías de la Información',3,4,1,NULL),(131,'Introducción a la Algoritmia',2,4,1,NULL),(132,'Arquitectura de Entornos Web',2,4,1,NULL),(133,'Matemática I',2,4,1,NULL),(134,'Desarrollo de Habilidades Profesionales I',2,4,1,NULL),(135,'Modelado de Procesos de Negocio',3,4,1,NULL),(136,'Base de Datos',3,4,1,NULL),(137,'Algoritmos y Estructura de Datos',2,4,1,NULL),(138,'Desarrollo de Entornos Web',2,4,1,NULL),(139,'Matemática II',2,4,1,NULL),(140,'Desarrollo de Habilidades Profesionales II',2,4,1,NULL),(141,'EFSRT I',1,4,1,NULL),(142,'Procesos Organizacionales',3,4,1,NULL),(143,'Base de Datos Avanzado I',3,4,1,NULL),(144,'Análisis y Diseño de Sistemas I',2,4,1,NULL),(145,'Desarrollo de Sistemas Empresariales',2,4,1,NULL),(146,'Gestión de Datos Dinámicos',2,4,1,NULL),(147,'Desarrollo de Habilidades Profesionales III',2,4,1,NULL),(148,'EFSRT II',1,4,1,NULL),(149,'Gestión de Procesos de Negocio',3,4,1,NULL),(150,'Base de Datos Avanzado II',3,4,1,NULL),(151,'Análisis y Diseño de Sistemas II',2,4,1,NULL),(152,'Integración de Procesos Empresariales',2,4,1,NULL),(153,'Gestión de Servicios de TI',2,4,1,NULL),(154,'Desarrollo de Habilidades Profesionales IV',2,4,1,NULL),(155,'EFSRT III',1,4,1,NULL),(156,'Arquitectura Empresarial',3,4,1,NULL),(157,'Inteligencia de Negocios',3,4,1,NULL),(158,'Aseguramiento de la Calidad del Software',2,4,1,NULL),(159,'Sistemas Integrados de Gestión',2,4,1,NULL),(160,'Gestión de Proyectos de TI',2,4,1,NULL),(161,'Innovación y Emprendimiento',2,4,1,NULL),(162,'EFSRT IV',1,4,1,NULL),(163,'Automatización de Procesos de Negocios',3,4,1,NULL),(164,'Sistema para la Toma de Decisiones',3,4,1,NULL),(165,'Control de la Calidad del Software',2,4,1,NULL),(166,'Proyecto Integrador',2,4,1,NULL),(167,'Seguridad y Auditoría de TI',2,4,1,NULL),(168,'Plan de Negocios',2,4,1,NULL),(169,'EFSRT V',1,4,1,NULL),(170,NULL,NULL,NULL,NULL,1),(171,NULL,NULL,NULL,NULL,2);
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
INSERT INTO `cursos_ciclo` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(6,40),(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(4,67),(4,68),(4,69),(4,70),(4,71),(4,72),(4,73),(5,74),(5,75),(5,76),(5,77),(5,78),(5,79),(5,80),(6,81),(6,82),(6,83),(6,84),(6,85),(6,86),(6,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(2,94),(2,95),(2,96),(2,97),(2,98),(2,99),(2,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(4,108),(4,109),(4,110),(4,111),(4,112),(4,113),(4,114),(5,115),(5,116),(5,117),(5,118),(5,119),(5,120),(5,121),(6,122),(6,123),(6,124),(6,125),(6,126),(6,127),(6,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(2,135),(2,136),(2,137),(2,138),(2,139),(2,140),(2,141),(3,142),(3,143),(3,144),(3,145),(3,146),(3,147),(3,148),(4,149),(4,150),(4,151),(4,152),(4,153),(4,154),(4,155),(5,156),(5,157),(5,158),(5,159),(5,160),(5,161),(5,162),(6,163),(6,164),(6,165),(6,166),(6,167),(6,168),(6,169);
/*!40000 ALTER TABLE `cursos_ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallehorario`
--

DROP TABLE IF EXISTS `detallehorario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallehorario` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_curso` int DEFAULT NULL,
  `id_horario` int DEFAULT NULL,
  `id_matricula` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_1_idx` (`id_curso`),
  KEY `fk_2_idx` (`id_horario`),
  KEY `fk3_idx` (`id_matricula`),
  CONSTRAINT `fk3` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`),
  CONSTRAINT `fk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  CONSTRAINT `fk_2` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallehorario`
--

LOCK TABLES `detallehorario` WRITE;
/*!40000 ALTER TABLE `detallehorario` DISABLE KEYS */;
INSERT INTO `detallehorario` VALUES (1,1,4,2),(2,2,2,2),(3,3,9,2),(4,4,10,2),(5,5,7,2),(6,6,8,2);
/*!40000 ALTER TABLE `detallehorario` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (2,2,'Lunes','08:00:00','09:30:00','T1DN'),(4,1,'Martes','09:45:00','11:15:00','T1DN'),(5,1,'Miercoles','02:30:00','04:15:00','T1TN'),(6,2,'Jueves','02:30:00','04:15:00','T1TN'),(7,5,'Miercoles','12:00:00','01:30:00','T1DN'),(8,6,'Jueves','04:15:00','06:00:00','T1HN'),(9,3,'Viernes','02:30:00','05:45:00','T1NG'),(10,4,'Sabado','01:15:00','03:00:00','T1GE');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,14,1,'2023-06-25'),(2,17,1,'2023-06-26');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,0,0,0,0,170,1),(2,0,0,0,0,171,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'bryan','trebejo','bryantrebejo@hotmail.com','$2a$10$cKE.Y1BJHk.6Skw53xTbDO8MGdE2woJgQkZJ9GUuDlcynFTIcmh8G',1,'bryan','47586985'),(14,'frank','mendoza','i201821212@cibertec.edu.pe','wqwwqwqwq',2,'frank20','12345678'),(15,'Armando','Scripts','sarmando@cibertec.pe',NULL,4,'armando','85203698'),(16,'benedicto','XIV','papita@hotmail.com','$2a$10$hQUVDh6uWf/ioBfKagMbu.mCNfCdgLsYFPm3SOEZUx7bOSvrYnG/C',2,'papaxiv','58963247'),(17,'nailin','inga salazar','nailin@hotmail.com','$2a$10$lfuOIHaoGQ6nyOkbHR6n3ez2ful3FURb9fDrbzqgOjOisqbh1SumW',2,'nailin','85257896');
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

-- Dump completed on 2023-06-26  2:45:19
