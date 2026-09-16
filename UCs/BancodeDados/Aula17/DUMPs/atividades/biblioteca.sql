CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: biblioteca
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
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `editora` varchar(60) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `paginas` int(10) unsigned DEFAULT NULL,
  `preco` decimal(5,2) DEFAULT NULL,
  `estoque` int(10) unsigned DEFAULT NULL,
  `lingua` varchar(50) DEFAULT 'Português',
  `ano` year(4) DEFAULT NULL,
  `disponivel` enum('Sim','Não') DEFAULT 'Sim',
  PRIMARY KEY (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (2,'O Cortiço','Aluísio Azevedo',NULL,'Romance',208,34.90,NULL,'Português',1990,'Sim'),(3,'Memórias Póstumas de Brás Cubas','Machado de Assis',NULL,'Romance',224,89.90,NULL,'Português',1981,'Sim'),(5,'Capitães da Areia','Jorge Amado',NULL,'Romance',280,44.90,30,'Português',1937,'Sim'),(6,'Vidas Secas','Graciliano Ramos',NULL,'Drama',176,36.90,NULL,'Português',1938,'Sim'),(7,'Grande Sertão: Veredas','Guimarães Rosa','Rocco','Romance',624,59.90,NULL,'Português',1956,'Sim'),(8,'O Pequeno Príncipe','Antoine de Saint-Exupéry',NULL,'Infantil',96,40.99,3000,'Português',1943,'Sim'),(10,'O Hobbit','J.R.R. Tolkien',NULL,'Fantasia',336,54.90,NULL,'Português',1937,'Sim'),(11,'1984','George Orwell',NULL,'Ficção Científica',328,45.90,NULL,'Português',1949,'Sim'),(12,'A Revolução dos Bichos','George Orwell',NULL,'Sátira',152,32.90,NULL,'Português',1945,'Sim'),(13,'O Senhor dos Anéis','J.R.R. Tolkien',NULL,'Fantasia',1216,89.90,NULL,'Português',1954,'Sim'),(14,'It: A Coisa','Stephen King',NULL,'Terror',1104,79.90,NULL,'Português',1986,'Sim'),(15,'Orgulho e Preconceito','Jane Austen',NULL,'Romance',424,39.90,NULL,'Português',1913,'Sim'),(16,'Harry Potter e o Cálice de Fogo','J.K. Rowling','Rocco','Fantasia',583,59.90,15,'Português',2000,'Sim'),(17,'Percy Jackson e o Ladrão de Raios','Rick Riordan','Intrínseca','Fantasia',400,44.90,20,'Português',2005,'Sim'),(18,'Crepúsculo','Stephenie Meyer','Intrínseca','Romance',416,39.90,18,'Português',2005,'Sim'),(19,'O Código Da Vinci','Dan Brown','Sextante','Suspense',560,54.90,12,'Português',2003,'Sim'),(20,'A Culpa é das Estrelas','John Green','Intrínseca','Romance',288,34.90,25,'Português',2012,'Sim');
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-17 15:13:54
