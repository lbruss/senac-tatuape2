CREATE DATABASE  IF NOT EXISTS `japdv` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `japdv`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: japdv
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
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `fone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'Tech Supplies LTDA','(11) 987654321','contato@techsupplies.com.br'),(2,'Distribuidora Silva S/A','(21) 34567890','vendas@distribuidorasilva.com'),(3,'Comércio de Embalagens Brasil','(31) 991234567','atendimento@embalagensbrasil.com.br');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `codigoBarras` varchar(100) DEFAULT NULL,
  `descricao` text NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `precoCusto` decimal(8,2) NOT NULL,
  `precoVenda` decimal(8,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `estoqueMinimo` int(11) NOT NULL,
  `idFornecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `codigoBarras` (`codigoBarras`),
  KEY `idFornecedor` (`idFornecedor`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedores` (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'7891234567890','Mouse Sem Fio óptico','Periféricos',25.00,49.90,20,5,1),(2,'7891234567891','Teclado Mecânico RGB','Periféricos',110.00,199.90,12,3,1),(3,'7891234567892','Suporte Ergonomico para Notebook','Acessórios',35.00,69.90,15,4,2),(4,'7891234567893','Cabo HDMI 2.0 2 Metros','Cabos',12.00,29.90,50,10,2),(5,'7891234567894','Caixa de Papelão 30x30x30 (10 Unid)','Embalagens',18.00,35.00,100,20,3),(6,'7891234567895','Fita Adesiva Transparente 45mm x 45m','Embalagens',4.50,12.00,80,15,3);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-14 17:10:28
