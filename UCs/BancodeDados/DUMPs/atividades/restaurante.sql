CREATE DATABASE  IF NOT EXISTS `restaurante` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `restaurante`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurante
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
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `salario` decimal(8,2) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Bruss Loza','Analista de Sistemas',7500.00,'2022-03-15','São Paulo'),(2,'Mariana Souza','Desenvolvedora',5200.00,'2021-07-20','Guarulhos'),(3,'Rafael Oliveira','Administrador de Redes',4800.00,'2023-01-10','Santo André'),(4,'Juliana Santos','Analista de Suporte',3200.00,'2022-11-05','Osasco'),(5,'Bruno Costa','Técnico em Informática',3500.00,'2024-02-12','São Paulo'),(7,'Lucas Martins','Desenvolvedor Web',5000.00,'2023-06-22','São Bernardo do Campo'),(8,'Ana Rodrigues','Analista de Banco de Dados',5800.00,'2021-10-04','Mogi das Cruzes'),(9,'Fernando Lima','Técnico de Redes',3800.00,'2024-01-29','Santos'),(10,'Beatriz Carvalho','Estagiária de TI',1800.00,'2025-03-03','Jundiaí');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT 'Brasileiro',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'João Silva','119871237432','Rio de Janeiro','1998-05-12','Brasileira'),(2,'Maria Santos','11976543210','Campinas','2000-08-23','Brasileira'),(3,'Carlos Oliveira','11965432109','Guarulhos','1995-03-17','Brasileira'),(5,'Pedro Costa','11943210987','São Bernardo do Campo','1997-07-28','Brasileira'),(6,'Juliana Lima','11932109876','Mogi das Cruzes','1999-01-14','Brasileira'),(7,'Rafael Almeida','11921098765','Campinas','1996-09-30','Brasileira'),(9,'Bruno Rodrigues','11999887766','São Paulo','1994-12-08','Brasileira'),(10,'Larissa Martins','11988776655','Jundiaí','2000-06-21','Brasileira');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pratos`
--

DROP TABLE IF EXISTS `pratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pratos` (
  `id_prato` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `preco` decimal(5,2) DEFAULT NULL,
  `calorias` int(10) unsigned DEFAULT NULL,
  `tamanho` enum('Pequeno','Médio','Grande') DEFAULT NULL,
  `ingredientes` text DEFAULT NULL,
  `detalhes` varchar(300) DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT 'Brasileira',
  PRIMARY KEY (`id_prato`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pratos`
--

LOCK TABLES `pratos` WRITE;
/*!40000 ALTER TABLE `pratos` DISABLE KEYS */;
INSERT INTO `pratos` VALUES (1,'Feijoada','Prato Principal',39.90,NULL,'Grande','Feijão preto, carne seca, linguiça e bacon',NULL,'Brasileira'),(2,'Strogonoff de Frango','Prato Principal',34.60,NULL,'Médio','Frango, creme de leite, molho de tomate e champignon',NULL,'Brasileira'),(4,'Pizza Margherita','Pizza',45.90,NULL,'Grande','Molho de tomate, mussarela, tomate e manjericão',NULL,'Italiana'),(5,'Sushi','Prato principal',49.90,NULL,'Médio','Arroz, salmão, alga e cream cheese',NULL,'Japonesa'),(7,'Hambúrguer Artesanal','Lanches',34.90,3060,'Médio','Pão, carne bovina, queijo, alface e tomate',NULL,'Americana'),(8,'Tacos','Comida Mexicana',40.99,3000,'Médio','Tortilha, carne, queijo, tomate e alface',NULL,'Mexicana'),(9,'Risoto de Camarão','Prato Principal',52.90,NULL,'Grande','Arroz arbóreo, camarão, queijo parmesão e vinho branco',NULL,'Italiana'),(10,'Bife à Parmegiana','Prato Principal',47.90,NULL,'Grande','Bife, molho de tomate, queijo e presunto',NULL,'Brasileira'),(11,'Pad Thai','Massas',41.90,NULL,'Médio','Macarrão de arroz, camarão, amendoim e legumes',NULL,'Tailandesa'),(12,'Curry de Frango','Prato Principal',38.90,NULL,'Médio','Frango, curry, leite de coco e legumes',NULL,'Indiana');
/*!40000 ALTER TABLE `pratos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-17 16:45:46
