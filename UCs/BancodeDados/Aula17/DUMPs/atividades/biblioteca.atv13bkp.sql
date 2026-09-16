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
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id_autor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'J. K. Rowling','Britânico','1965-07-31'),(2,'Dan Brown','Americana','1964-06-22'),(3,'Markus Zusak','Australiana','1975-06-23'),(4,'Stephenie Meyer','Americana','1973-12-24'),(5,'Suzanne Collins','Americana','1962-08-10'),(6,'Rick Riordan','Americana','1964-06-05'),(7,'Patrick Rothfuss','Americana','1973-06-06'),(8,'John Green','Americana','1977-08-24'),(9,'R.J. Palacio','Americana','1963-07-13'),(10,'Carlos Ruiz Zafón','Espanhola','1964-09-25'),(11,'Neil Gaiman','Britânica','1960-11-10');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Fantasia','Livros que apresentam elementos mágicos, mundos imaginários e criaturas fantásticas.'),(2,'Suspense','Livros que apresentam mistério, tensão e situações que prendem a atenção do leitor.'),(3,'Drama','Livros que abordam conflitos emocionais, sociais ou pessoais dos personagens.'),(4,'Romance','Livros que têm relacionamentos amorosos e questões afetivas como parte importante da história.'),(5,'Ficção Científica','Livros que exploram ciência, tecnologia, futuro e conceitos científicos imaginários ou especulativos.'),(6,'Distopia','Livros que apresentam sociedades fictícias marcadas por controle, desigualdade ou condições sociais negativas.'),(7,'Fantasia','Livros que apresentam elementos mágicos, mundos imaginários e criaturas fantásticas.'),(8,'Suspense','Livros que apresentam mistério, tensão e situações que prendem a atenção do leitor.'),(9,'Drama','Livros que abordam conflitos emocionais, sociais ou pessoais dos personagens.'),(10,'Romance','Livros que têm relacionamentos amorosos e questões afetivas como parte importante da história.'),(11,'Ficção Científica','Livros que exploram ciência, tecnologia, futuro e conceitos científicos imaginários ou especulativos.'),(12,'Distopia','Livros que apresentam sociedades fictícias marcadas por controle, desigualdade ou condições sociais negativas.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `id_editora` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Rocco','Rio de Janeiro','Brasil'),(2,'Intrínseca','Rio de Janeiro','Brasil'),(3,'Arqueiro','São Paulo','Brasil'),(4,'Sextante','Rio de Janeiro','Brasil'),(5,'Suma','São Paulo','Brasil');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `id_emprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `id_leitor` int(11) DEFAULT NULL,
  `id_livro` int(11) DEFAULT NULL,
  `data_emprestimo` date DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL,
  `status_emprestimo` varchar(20) DEFAULT 'Devolvido',
  PRIMARY KEY (`id_emprestimo`),
  KEY `id_leitor` (`id_leitor`),
  KEY `id_livro` (`id_livro`),
  CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`id_leitor`) REFERENCES `leitores` (`id_leitor`),
  CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,1,1,'2026-08-01','2026-08-10','Devolvido'),(2,2,5,'2026-08-03','2026-08-12','Devolvido'),(3,3,8,'2026-08-05','2026-09-11','Devolvido'),(4,4,12,'2026-08-07','2026-08-15','Devolvido'),(5,5,15,'2026-08-10',NULL,'Emprestado'),(6,6,17,'2026-08-12','2026-08-20','Devolvido'),(7,7,19,'2026-08-15',NULL,'Emprestado'),(8,8,20,'2026-08-17','2026-08-25','Devolvido'),(9,1,21,'2026-08-20',NULL,'Emprestado'),(10,2,22,'2026-08-22','2026-08-30','Devolvido'),(11,3,23,'2026-08-24',NULL,'Emprestado'),(12,4,2,'2026-08-26','2026-09-01','Devolvido'),(13,5,6,'2026-08-28',NULL,'Emprestado'),(14,6,10,'2026-08-30','2026-09-03','Devolvido'),(15,7,14,'2026-09-01',NULL,'Emprestado');
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitores`
--

DROP TABLE IF EXISTS `leitores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitores` (
  `id_leitor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_leitor` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_leitor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitores`
--

LOCK TABLES `leitores` WRITE;
/*!40000 ALTER TABLE `leitores` DISABLE KEYS */;
INSERT INTO `leitores` VALUES (1,'Lucas Almeida','lucas.almeida@email.com','11987654321'),(2,'Mariana Santos','mariana.santos@email.com','11976543210'),(3,'Gabriel Oliveira','gabriel.oliveira@email.com','11965432109'),(4,'Beatriz Souza','beatriz.souza@email.com','11954321098'),(5,'Rafael Costa','rafael.costa@email.com','11943210987'),(6,'Ana Carolina Lima','ana.lima@email.com','11932109876'),(7,'Pedro Henrique Silva','pedro.silva@email.com','11921098765'),(8,'Juliana Ferreira','juliana.ferreira@email.com','11910987654');
/*!40000 ALTER TABLE `leitores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `paginas` int(10) unsigned DEFAULT NULL,
  `preco` decimal(5,2) DEFAULT NULL,
  `estoque` int(10) unsigned DEFAULT NULL,
  `lingua` varchar(50) DEFAULT 'Português',
  `ano` year(4) DEFAULT NULL,
  `disponivel` enum('Sim','Não') DEFAULT 'Sim',
  `id_autor` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_editora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `id_autor` (`id_autor`),
  KEY `fk_livros_categorias` (`id_categoria`),
  KEY `fk_livros_editora` (`id_editora`),
  CONSTRAINT `fk_livros_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_livros_editora` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id_editora`),
  CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'Harry Potter e o Cálice de Fogo',583,59.90,30,'Português',2000,'Sim',1,5,3),(2,'Harry Potter e a Ordem da Fênix',703,69.90,12,'Português',2003,'Sim',1,1,2),(3,'Harry Potter e o Enigma do Príncipe',471,64.90,10,'Português',2005,'Sim',1,1,2),(4,'Harry Potter e as Relíquias da Morte',551,69.90,8,'Português',2007,'Sim',2,1,3),(5,'O Código Da Vinci',432,49.90,20,'Português',2003,'Sim',2,2,3),(6,'Anjos e Demônios',464,54.90,18,'Português',2000,'Sim',2,2,4),(7,'A Menina que Roubava Livros',480,59.90,14,'Português',2005,'Sim',3,3,2),(8,'Crepúsculo',416,44.90,16,'Português',2005,'Sim',4,4,1),(9,'Lua Nova',480,44.90,13,'Português',2006,'Sim',4,4,2),(10,'Eclipse',576,49.90,11,'Português',2007,'Sim',4,4,3),(11,'A Hospedeira',560,54.90,9,'Português',2008,'Sim',4,5,4),(12,'Jogos Vorazes',400,49.90,17,'Português',2008,'Sim',5,6,5),(13,'Em Chamas',416,49.90,15,'Português',2009,'Sim',5,6,5),(14,'A Esperança',424,52.90,12,'Português',2010,'Sim',5,6,5),(15,'Percy Jackson e o Ladrão de Raios',400,44.90,20,'Português',2005,'Sim',6,1,3),(16,'O Nome do Vento',656,69.90,7,'Português',2007,'Sim',7,1,2),(17,'A Culpa é das Estrelas',288,39.90,22,'Português',2012,'Sim',8,4,2),(18,'Extraordinário',320,42.90,19,'Português',2012,'Sim',8,3,1),(19,'O Hobbit',336,49.90,10,'Português',2000,'Sim',10,1,1),(20,'A Sombra do Vento',464,54.90,8,'Português',2001,'Sim',10,2,5),(21,'Inferno',448,54.90,14,'Português',2013,'Sim',9,2,5),(22,'O Mar de Monstros',304,42.90,16,'Português',2006,'Sim',9,4,3),(23,'O Teorema Katherine',304,39.90,10,'Português',2006,'Sim',9,1,3);
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

-- Dump completed on 2026-09-11 15:39:15
