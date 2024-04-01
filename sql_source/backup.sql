-- MariaDB dump 10.19-11.3.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: agora
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `busco_compro`
--

DROP TABLE IF EXISTS `busco_compro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `busco_compro` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT NULL,
  `ID_Comentario` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_id_busco_compro_comentario` (`ID_Comentario`),
  CONSTRAINT `fk_id_busco_compro_comentario` FOREIGN KEY (`ID_Comentario`) REFERENCES `comentario_busco_compro` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busco_compro`
--

LOCK TABLES `busco_compro` WRITE;
/*!40000 ALTER TABLE `busco_compro` DISABLE KEYS */;
/*!40000 ALTER TABLE `busco_compro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario_busco_compro`
--

DROP TABLE IF EXISTS `comentario_busco_compro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario_busco_compro` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Comentario` text DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_busco_compro`
--

LOCK TABLES `comentario_busco_compro` WRITE;
/*!40000 ALTER TABLE `comentario_busco_compro` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario_busco_compro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_Producto` int(10) unsigned DEFAULT NULL,
  `ID_Usuario` int(10) unsigned DEFAULT NULL,
  `Comentario` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk1_id_usuario` (`ID_Usuario`),
  KEY `fk_id_producto` (`ID_Producto`),
  CONSTRAINT `fk1_id_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `fk_id_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `Calle` varchar(255) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Colonia` varchar(255) DEFAULT NULL,
  `Codigo_Postal` varchar(10) DEFAULT NULL,
  `Ciudad` varchar(255) DEFAULT NULL,
  `Pais` varchar(255) DEFAULT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_productos_envio`
--

DROP TABLE IF EXISTS `orden_productos_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_productos_envio` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_Carrito` int(10) unsigned DEFAULT NULL,
  `Fecha_Emision` timestamp NULL DEFAULT NULL,
  `Fecha_Entrega` timestamp NULL DEFAULT NULL,
  `Estado` enum('Pendiente','Entregado') DEFAULT NULL,
  `Pago` enum('Tarjeta','Efectivo') DEFAULT NULL,
  `Precio_Envio` int(15) DEFAULT NULL,
  `ID_Direccion` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_id_carrito` (`ID_Carrito`),
  KEY `fk_id_direccion` (`ID_Direccion`),
  CONSTRAINT `fk_id_carrito` FOREIGN KEY (`ID_Carrito`) REFERENCES `productos_carrito` (`ID`),
  CONSTRAINT `fk_id_direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_productos_envio`
--

LOCK TABLES `orden_productos_envio` WRITE;
/*!40000 ALTER TABLE `orden_productos_envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_productos_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_productos_negocio`
--

DROP TABLE IF EXISTS `orden_productos_negocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_productos_negocio` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha_Emision` timestamp NULL DEFAULT NULL,
  `Fecha_Entrega` timestamp NULL DEFAULT NULL,
  `Estado` enum('Pendiente','Entregado','Cancelado') DEFAULT NULL,
  `Pago` enum('Tarjeta','Efectivo') DEFAULT NULL,
  `ID_Carrito` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk1_id_carrito` (`ID_Carrito`),
  CONSTRAINT `fk1_id_carrito` FOREIGN KEY (`ID_Carrito`) REFERENCES `productos_carrito` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_productos_negocio`
--

LOCK TABLES `orden_productos_negocio` WRITE;
/*!40000 ALTER TABLE `orden_productos_negocio` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_productos_negocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_publico`
--

DROP TABLE IF EXISTS `perfil_publico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_publico` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int(10) unsigned DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `ID_Producto` int(10) unsigned DEFAULT NULL,
  `ID_Reputacion` int(10) unsigned DEFAULT NULL,
  `ID_Busco_Compro` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk4_id_usuario` (`ID_Usuario`),
  KEY `fk3_id_producto` (`ID_Producto`),
  KEY `fk_id_reputacion` (`ID_Reputacion`),
  KEY `fk_id_busco_compro` (`ID_Busco_Compro`),
  CONSTRAINT `fk3_id_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID`),
  CONSTRAINT `fk4_id_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `fk_id_busco_compro` FOREIGN KEY (`ID_Busco_Compro`) REFERENCES `busco_compro` (`ID`),
  CONSTRAINT `fk_id_reputacion` FOREIGN KEY (`ID_Reputacion`) REFERENCES `reputacion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_publico`
--

LOCK TABLES `perfil_publico` WRITE;
/*!40000 ALTER TABLE `perfil_publico` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_publico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Marca` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  `Precio` float(10,2) DEFAULT NULL,
  `Categoria` enum('Electronica','Moda','Hogar y Jardin','Deportes','Salue y Belleza','Electrodomesticos','Juguetes','Libros','Alimentos','Mascotas') DEFAULT NULL,
  `Estatus` enum('Activo','Inactivo') DEFAULT NULL,
  `Existencias` int(15) DEFAULT NULL,
  `ID_Usuario` int(10) unsigned DEFAULT NULL,
  `Ventas_Totales` int(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_id_usuario` (`ID_Usuario`),
  CONSTRAINT `fk_id_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_carrito`
--

DROP TABLE IF EXISTS `productos_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_carrito` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int(10) unsigned DEFAULT NULL,
  `ID_Producto` int(10) unsigned DEFAULT NULL,
  `Cantidad` int(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk1_id_producto` (`ID_Producto`),
  KEY `fk3_id_usuario` (`ID_Usuario`),
  CONSTRAINT `fk1_id_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID`),
  CONSTRAINT `fk3_id_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_carrito`
--

LOCK TABLES `productos_carrito` WRITE;
/*!40000 ALTER TABLE `productos_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reputacion`
--

DROP TABLE IF EXISTS `reputacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputacion` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Calificacion` int(10) DEFAULT NULL,
  `Comentario` text DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reputacion`
--

LOCK TABLES `reputacion` WRITE;
/*!40000 ALTER TABLE `reputacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reputacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Correo_Electronico` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Contraseña` varchar(255) DEFAULT NULL,
  `ID_Direccion` int(10) unsigned DEFAULT NULL,
  `Genero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk1_id_direccion` (`ID_Direccion`),
  CONSTRAINT `fk1_id_direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 14:12:33
