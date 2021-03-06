CREATE DATABASE  IF NOT EXISTS `dhrelojes` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dhrelojes`;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: dhrelojes
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Center Pompidou'),(2,'Jaquet Droze'),(3,'Tinker');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idUserFK` int(11) NOT NULL,
  `compraRealizada` tinyint(4) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idOrder`),
  KEY `idUserFK_idx` (`idUserFK`),
  CONSTRAINT `idUserFK` FOREIGN KEY (`idUserFK`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `idCategoryFK` int(11) NOT NULL,
  `idSizeFK` int(11) NOT NULL,
  `idProduct_imageFK` int(11) NOT NULL,
  `idOrderFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `idCategoryFK_idx` (`idCategoryFK`),
  KEY `idSizeFK_idx` (`idSizeFK`),
  KEY `idProduct_imageFK_idx` (`idProduct_imageFK`),
  KEY `idOrderFK_idx` (`idOrderFK`),
  CONSTRAINT `idCategoryFK` FOREIGN KEY (`idCategoryFK`) REFERENCES `category` (`idCategory`),
  CONSTRAINT `idOrderFK` FOREIGN KEY (`idOrderFK`) REFERENCES `order` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idSizeFK` FOREIGN KEY (`idSizeFK`) REFERENCES `size` (`idSize`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Midnight','Nuestra cl??sica forma DH, en un elegante dise??o totalmente negro, con detalles sutiles de manecillas blancas luminiscentes e ??ndices de acero en relieve. La Midnight Limited Edition se cre?? como una edici??n muy limitada de solo 100 relojes.',300.00,1,1,1,NULL),(2,'Birds','Esfera de n??car blanco y ??nice negro con apliques en oro rojo 18 quilates grabados y pintados a mano. Caja en oro rojo 18 quilates. Mecanismo aut??mata con animaci??n de p??jaros, eclosi??n y r??o. Movimiento mec??nico de repetici??n de minutos de cuerda manual. Reserva de marcha de 48 horas.',50000.00,2,2,2,NULL),(3,'Black & White','Este reloj New Gent art??stico conmemora el cuadro m??s famoso de Piet Mondrian, Composition en Rouge, Bleu et Blanc II. Lo hace con una correa de silicona negra mate y un estampado de colores en el estilo caracter??stico del artista. La esfera negra sirve de tel??n de fondo para unas agujas blanca y roja que completan el look de este reloj.',700.00,1,3,3,NULL),(4,'Blue sky','Este modelo New Gent art??stico rinde homenaje a la obra Bleu de Ciel de Vassily Kandinsky. Su correa de silicona semitransparente azul claro presenta un estampado de colores basado en el cuadro del conocido pintor. El color azul sigue extendi??ndose por toda la caja de pl??stico mate semitransparente y tambi??n por la trabilla y la hebilla de silicona. ??Los amantes del arte sabr??n apreciarlo!',1300.00,2,1,4,NULL),(5,'Butterfly','Esfera en madera petrificada Chinchilla Red y ??nice negro con apliques en oro rojo 18 quilates grabados a mano. Caja en oro rojo 18 quilates. Mecanismo aut??mata de cuerda manual con sistema de activaci??n mediante pulsador que acciona las alas de la mariposa y la rueda de la carroza. Movimiento mec??nico de horas y minutos de cuerda autom??tica. Reserva de marcha de 68 horas.',35000.00,2,1,5,NULL),(6,'Camel strap','Este es tu nuevo reloj favorito. Cuenta con una caja de acero inoxidable 316L pulido a mano de 38 mm, un acero de grado extra bajo en carbono que se usa a menudo en aplicaciones marinas debido a su alta resistencia a la corrosi??n. Una ventana de cristal de zafiro, conocida por su notable dureza (casi tan dura como el diamante) y resistencia a los ara??azos, protege la esfera m??nima y el movimiento Swiss Ronda. Las correas, flexibles pero resistentes, est??n hechas 100 % con cuero italiano de alta calidad te??ido al vegetal.',150.00,3,3,6,NULL),(7,'Clear','Transl??cido y cl??sico, este reloj tiene una caja transparente fabricada con pl??stico de origen biol??gico y una correa de TPU igualmente transparente. La esencia del tiempo es cristalina: Alrededor de la esfera, brilla un anillo plateado con ??ndices negros y manecillas rojas, azules y amarillas.',700.00,1,3,7,NULL),(8,'Eiffel Tower','Este reloj Gent art??stico homenajea el cl??sico cuadro de Robert Delaunay, La Tour Eiffel. Con ??l, el autor hace honor al ??ngulo ??desde abajo?? que se muestra en el cuadro original. El colorido de este reloj de la colecci??n Centre Pompidou se vuelca sobre una correa de silicona semitransparente de color azul claro mate, una caja de pl??stico azul claro mate y una esfera de color plateado. Todo este reloj refleja a la perfecci??n los din??micos colores del cuadro original.',1250.00,1,2,8,NULL),(9,'Frida','Este reloj New Gent art??stistico conmemora el ic??nico cuadro de Frida Kahlo, El marco, como parte de la colecci??n Centre Pompidou. Su correa de silicona rosa mate semitransparente recubierta por un estampado que llega hasta la esfera, refleja el arte popular y los colores tradicionales mexicanos. La hebilla de pl??stico rosa mate semitransparente y la trabilla de silicona del mismo color hacen que la fiesta no pare en este reloj.',1500.00,1,1,9,NULL),(10,'Green strap','Este es tu nuevo reloj favorito. Cuenta con una caja de acero inoxidable 316L pulido a mano de 38 mm, un acero de grado extra bajo en carbono que se usa a menudo en aplicaciones marinas debido a su alta resistencia a la corrosi??n. Una ventana de cristal de zafiro, conocida por su notable dureza (casi tan dura como el diamante) y resistencia a los ara??azos, protege la esfera m??nima y el movimiento Swiss Ronda. Las correas, flexibles pero resistentes, est??n hechas 100 % con cuero italiano de alta calidad te??ido al vegetal.',150.00,3,3,10,NULL),(11,'Magic Lotus','Esfera n??car blanco grabada y pintada a mano, centro de ??nice negro. Caja y aureola en oro rojo 18 quilates. Decoraci??n aplicada en oro rojo y amarillo 18 quilates grabada y pintada a mano. Movimiento aut??mata mec??nico de cuerda manual con sistema de activaci??n mediante pulsador. Mecanismo aut??mata con animaci??n del estanque, la carpa y la flor de loto. Movimiento mec??nico de horas y minutos de cuerda autom??tica. Reserva de marcha de 68 horas. Di??metro 43 mm.',45000.00,2,2,11,NULL),(12,'Black strap','Este es tu nuevo reloj favorito. Cuenta con una caja de acero inoxidable 316L pulido a mano de 38 mm, un acero de grado extra bajo en carbono que se usa a menudo en aplicaciones marinas debido a su alta resistencia a la corrosi??n. Una ventana de cristal de zafiro, conocida por su notable dureza (casi tan dura como el diamante) y resistencia a los ara??azos, protege la esfera m??nima y el movimiento Swiss Ronda. Las correas, flexibles pero resistentes, est??n hechas 100 % con cuero italiano de alta calidad te??ido al vegetal.',150.00,3,3,12,NULL),(13,'Tropical bird','Esfera n??car blanco grabado y pintado a mano, centro de n??car blanco. Caja y aureola en oro rojo 18 quilates. Decoraci??n aplicada en oro rojo 18 quilates grabada y pintada a mano. Movimiento mec??nico de repetici??n de minutos de cuerda manual. Animaci??n aut??mata del pavo real, las hojas tropicales, el colibr??, el tuc??n, las lib??lulas y la cascada. Reserva de marcha de 50 horas. Di??metro 47 mm',60000.00,2,2,13,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_image` (
  `idProduct_image` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idProduct_image`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'all-black.png'),(2,'bird.png'),(3,'black-white.png'),(4,'blue-sky.png'),(5,'butterfly.png'),(6,'camel-strap.png'),(7,'clear.png'),(8,'eiffel-tower.png'),(9,'frida.png'),(10,'green-watch.png'),(11,'magic-lotus.png'),(12,'new-black.png'),(13,'tropical-bird.png');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'cliente');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size` (
  `idSize` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idSize`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'Small'),(2,'Medium'),(3,'Large');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `dni` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idRoleFK` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'carl','tompson','carl@tomson.com',123,'123','$2a$10$LmPRWta33DlYW.FgmOsyV.DJ1q2djvtSUTMzG/4A987xIzcEJeKAS',2,NULL),(2,'121','11','11@11.com',2,'423','$2a$10$x9KFMN36HbwAMD2ryVI/2OhkLX1h8obODfxynxzR85rpcHlMAEzVm',2,NULL),(3,'Guido','Biagioni','g@g.com',36158697,'Siempre Viva 123','$2a$10$mQ4vX7l3r7zXt45uo.Hyh.6DPUV.GVT9kHfsLnKMGV2TAspINnq1C',2,'image-1654886394992.png'),(4,'Carlos','Sucio','x@x.com',99999999,'Algo 123','$2a$10$legK.ECd24RA8DLcZQZQWOIrzOMYpHILv1VUQKPeHmr4AjhG/IO8G',2,'image-1657990472125.png'),(5,'Marcelo','Tip','marce@tip.com',123123,'123','$2a$10$YGOa0Mi4xT3KBzLgZC7D3uHAeRZam2c9zwT9RN0xCQ7e2ufWV9jxa',2,'image-1658271294621.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-19 19:55:52
