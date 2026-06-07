CREATE DATABASE  IF NOT EXISTS `hotelaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotelaria`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: hotelaria
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `apartamento`
--

DROP TABLE IF EXISTS `apartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `identificacao` varchar(255) DEFAULT NULL,
  `funcionario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento`
--

LOCK TABLES `apartamento` WRITE;
/*!40000 ALTER TABLE `apartamento` DISABLE KEYS */;
INSERT INTO `apartamento` VALUES (1,'Quarto Simples','DISPONIVEL','Apartamento 100',1),(2,'Suite Premium','OCUPADO','Apartamento 1100',2),(3,'Quarto Casal','MATUNENCAO','Apartmaneto 200',3),(4,'Suite Master','LIMPEZA','Apartamento 202',4),(5,'Quarto Luxo','DISPONIVEL','Apartamento 505',5);
/*!40000 ALTER TABLE `apartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `administrador_id` bigint DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `Cod_Identificacao` varchar(255) DEFAULT NULL,
  `CPF` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `hotel_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,1,'Gerente','001000','11016417613','ATIVO','Clara Morais','795','TK001',1),(2,1,'Recepcionista','001001','22024522827','ATIVO','Samira Delgado','840','TK002',1),(3,1,'Faxineiro','001002','37530033531','ATIVO','Cleiton Silva','271','TK003',2),(4,1,'Seguranca','001003','48447144549','INATIVO','Joao Almeida','444','TK004',3),(5,1,'Tecnico','001005','557.571.563-57','ATIVO','Wallace Santana','518','TK005',5);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedagem`
--

DROP TABLE IF EXISTS `hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospedagem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_entrada` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `n_pessoas` int DEFAULT NULL,
  `tipo_pagamento` varchar(255) DEFAULT NULL,
  `valor_hospedagem` float DEFAULT NULL,
  `apartamento_id` bigint DEFAULT NULL,
  `funcionario_id` bigint DEFAULT NULL,
  `hospede_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apartamento_id` (`apartamento_id`),
  KEY `funcionario_id` (`funcionario_id`),
  KEY `hospede_id` (`hospede_id`),
  CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`),
  CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `hospedagem_ibfk_3` FOREIGN KEY (`hospede_id`) REFERENCES `hospede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedagem`
--

LOCK TABLES `hospedagem` WRITE;
/*!40000 ALTER TABLE `hospedagem` DISABLE KEYS */;
INSERT INTO `hospedagem` VALUES (1,'2026-05-01','2026-05-05','FINALIZADA',2,'CARTAO',1200,1,1,1),(2,'2026-05-02','2026-05-06','FINALIZADA',1,'PIX',900,2,2,2),(3,'2026-05-03','2026-05-07','ATIVA',3,'CARTAO',1500,3,3,3),(4,'2026-05-04','2026-05-08','ATIVA',2,'CARTAO',2200,4,4,4),(5,'2026-05-05','2026-05-09','FINALIZADA',1,'PIX',900,5,5,5),(6,'2026-05-06','2026-05-10','ATIVA',2,'CARTAO',1500,1,1,2),(7,'2026-05-07','2026-05-11','FINALIZADA',4,'CARTAO',2500,3,3,4),(8,'2026-05-08','2026-05-12','FINALIZADA',2,'DINHEIRO',1800,2,2,3),(9,'2026-05-09','2026-05-13','FINALIZADA',1,'DINHEIRO',850,4,4,5),(10,'2026-05-10','2026-05-14','ATIVA',3,'PIX',2100,5,5,1);
/*!40000 ALTER TABLE `hospedagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospede`
--

DROP TABLE IF EXISTS `hospede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospede` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `CPF` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `hotel_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `hospede_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospede`
--

LOCK TABLES `hospede` WRITE;
/*!40000 ALTER TABLE `hospede` DISABLE KEYS */;
INSERT INTO `hospede` VALUES (1,'76488217355','Belmiro Paes','(63)98761-0981',1),(2,'77348912482','Rodrigo Dias','(64)97354-3635',1),(3,'67223784532','Juliano Golveia','(67)97432-1843',2),(4,'78432578698','Fatima Melo','(66)98234-7390',3),(5,'94832211309','Patrick Belmiro','(65)99090-9038',4);
/*!40000 ALTER TABLE `hospede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `endereco` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'RUA 1, 100 - Brasilia','Hotel Gold','(61)99765-3122'),(2,'RUA 2, 200 - Brasilia','Hotel Emerald','(61)99266-4512'),(3,'RUA 3, 300 - Brasilia','Hotel Diamond','(61)99252-5486'),(4,'RUA 4, 400 - Brasilia','Hotel Pearl','(61)99752-5085'),(5,'RUA 5, 500 - Brasilia','Hotel Platinum','(61)99324-6775');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limpeza`
--

DROP TABLE IF EXISTS `limpeza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limpeza` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_limpeza` date DEFAULT NULL,
  `apartamento_id` bigint DEFAULT NULL,
  `funcionario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apartamento_id` (`apartamento_id`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `limpeza_ibfk_1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`),
  CONSTRAINT `limpeza_ibfk_2` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limpeza`
--

LOCK TABLES `limpeza` WRITE;
/*!40000 ALTER TABLE `limpeza` DISABLE KEYS */;
INSERT INTO `limpeza` VALUES (1,'2026-05-01',1,3),(2,'2026-05-02',2,3),(3,'2026-05-03',3,3),(4,'2026-05-04',4,3),(5,'2026-05-05',5,3);
/*!40000 ALTER TABLE `limpeza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_solicitacao` date DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `apartamento_id` bigint DEFAULT NULL,
  `funcionario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apartamento_id` (`apartamento_id`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `manutencao_ibfk_1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`),
  CONSTRAINT `manutencao_ibfk_2` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao`
--

LOCK TABLES `manutencao` WRITE;
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
INSERT INTO `manutencao` VALUES (1,'2026-05-01','ABERTA','Troca de lampada',1,5),(2,'2026-05-02','FECHADA','Conserto do ar condicionado',2,5),(3,'2026-05-03','ABERTA','Reparo na TV',3,5),(4,'2026-05-04','FECHADA','Manutencao do chuveiro',4,5),(5,'2026-05-05','ABERTA','Troca da fechadura',5,5);
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-07 15:10:25
