CREATE DATABASE  IF NOT EXISTS `pizzaria` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `pizzaria`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pizzaria
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) NOT NULL,
  `idade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Carlos Eduardo Silva','(11) 98765-1111','carlos.silva@email.com','São Paulo',28),(2,'Mariana Oliveira','(11) 98765-2222','mariana.o@email.com','São Paulo',34),(3,'Lucas Rodrigues','(11) 98765-3333','lucas.rod@email.com','Santo André',22),(4,'Fernanda Costa','(11) 98765-4444','fe.costa@email.com','São Bernardo do Campo',45),(5,'Rafael Santos','(11) 98765-5555','rafael.santos@email.com','São Caetano do Sul',19),(6,'Beatriz Lima','(11) 98765-6666','beatriz.lima@email.com','São Paulo',31),(7,'Thiago Almeida','(11) 98765-7777','thiago.a@email.com','Osasco',27),(8,'Juliana Pereira','(11) 98765-8888','juliana.p@email.com','Guarulhos',39),(9,'Gabriel Souza','(11) 98765-9999','gabriel.souza@email.com','São Paulo',25),(10,'Amanda Carvalho','(11) 98765-0000','amanda.c@email.com','Campinas',52);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `pizza` varchar(100) NOT NULL,
  `tamanho` varchar(20) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `data_pedido` date DEFAULT NULL,
  `statusp` varchar(20) DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'Calabresa','Grande','Salgada',1,45.00,'2026-09-15','Pendente',1),(2,'Mussarela','Média','Salgada',2,38.00,'2026-09-15','Entregue',2),(3,'Frango com Catupiry','Grande','Especial',1,52.00,'2026-09-16','Entregue',3),(4,'Chocolate com Morango','Broto','Doce',1,32.00,'2026-09-16','Entregue',1),(5,'Quatro Queijos','Grande','Salgada',1,48.00,'2026-09-17','Entregue',4),(6,'Portuguesa','Grande','Salgada',1,46.00,'2026-09-17','Entregue',5),(7,'Marguerita','Média','Vegetariana',1,40.00,'2026-09-18','Entregue',6),(8,'Calabresa','Grande','Salgada',2,45.00,'2026-09-18','Entregue',2),(9,'Romeu e Julieta','Broto','Doce',1,30.00,'2026-09-19','Entregue',7),(10,'Pepperoni','Grande','Especial',1,55.00,'2026-09-19','Entregue',8),(11,'Atum com Cebola','Grande','Salgada',1,44.00,'2026-09-20','Entregue',3),(12,'Frango com Catupiry','Média','Especial',1,48.00,'2026-09-20','Entregue',6),(13,'Mussarela','Grande','Salgada',1,42.00,'2026-09-21','A caminho',9),(14,'Calabresa','Família','Salgada',1,58.00,'2026-09-21','Em preparo',10),(15,'Banana com Canela','Média','Doce',1,35.00,'2026-09-21','Em preparo',1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21 16:28:48
