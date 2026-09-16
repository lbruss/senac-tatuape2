CREATE DATABASE  IF NOT EXISTS `petshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `petshop`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: petshop
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animais` (
  `id_animal` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `especie` varchar(15) DEFAULT NULL,
  `idade` int(10) unsigned DEFAULT NULL,
  `cor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animais`
--

LOCK TABLES `animais` WRITE;
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
INSERT INTO `animais` VALUES (1,'Billy','cachorro',5,NULL),(2,'Thor','cachorro',3,NULL),(3,'Luna','gato',2,NULL),(4,'Mel','cachorro',6,NULL),(5,'Nina','gato',4,NULL),(6,'Max','cachorro',7,NULL),(7,'Pipoca','coelho',2,NULL),(8,'Bob','cachorro',1,NULL),(9,'Mimi','gato',5,NULL);
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientespet`
--

DROP TABLE IF EXISTS `clientespet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientespet` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `contato` varchar(80) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientespet`
--

LOCK TABLES `clientespet` WRITE;
/*!40000 ALTER TABLE `clientespet` DISABLE KEYS */;
INSERT INTO `clientespet` VALUES (1,'Jorge','251695392912','São Paulo','SP',NULL,NULL),(2,'Mariana','11987654321','São Paulo','SP',NULL,NULL),(3,'Carlos','11125121238','Santo André','SP',NULL,NULL),(4,'Ana','11965432109','São Bernardo do Campo','SP',NULL,NULL),(5,'Lucas','11954321098','Guarulhos','SP',NULL,NULL),(6,'Juliana','11943210987','Osasco','SP',NULL,NULL),(7,'Rafael','11932109876','Mogi das Cruzes','SP',NULL,NULL),(8,'Camila','11921098765','São Paulo','SP',NULL,NULL),(9,'Fernando','11910987654','Santos','SP',NULL,NULL),(10,'Beatriz','11999887766','São Paulo','SP',NULL,NULL),(11,'Gabriel','11988776655','Campinas','SP',NULL,NULL),(12,'Larissa','11977665544','Jundiaí','SP',NULL,NULL),(13,'Pedro','11966554433','São Paulo','SP',NULL,NULL),(14,'Amanda','11955443322','Guarulhos','SP',NULL,NULL),(15,'Bruno','11944332211','Osasco','SP',NULL,NULL),(16,'Isabela','11933221100','Santo André','SP',NULL,NULL),(17,'Diego','11922110099','São Paulo','SP',NULL,NULL),(18,'Letícia','11911009988','São Bernardo do Campo','SP',NULL,NULL),(19,'Matheus','11990088776','Mogi das Cruzes','SP',NULL,NULL);
/*!40000 ALTER TABLE `clientespet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `preco` int(10) unsigned DEFAULT NULL,
  `duracao` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `ativo` enum('Sim','Não') DEFAULT 'Sim',
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,'Escova',20,'60','Higiene','Sim');
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-14 14:17:29
