-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: boletos_ist17j
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `boletos`
--

DROP TABLE IF EXISTS `boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boletos` (
  `bol_id` int NOT NULL,
  `eve_id` int NOT NULL,
  `cat_id_bol` int NOT NULL,
  `bol_precio` decimal(10,0) NOT NULL,
  `bol_cantidad` int NOT NULL,
  PRIMARY KEY (`bol_id`),
  KEY `catalogo_boleto_idx` (`cat_id_bol`),
  KEY `boleto_evento_idx` (`eve_id`),
  CONSTRAINT `boleto_evento` FOREIGN KEY (`eve_id`) REFERENCES `eventos` (`eve_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalogo_boleto` FOREIGN KEY (`cat_id_bol`) REFERENCES `catalogo` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletos`
--

LOCK TABLES `boletos` WRITE;
/*!40000 ALTER TABLE `boletos` DISABLE KEYS */;
INSERT INTO `boletos` VALUES (1,1,4,100,1000),(2,1,4,100,1000),(3,1,5,100,1000),(4,1,4,100,1000),(5,1,5,100,1000);
/*!40000 ALTER TABLE `boletos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo` (
  `cat_id` int NOT NULL,
  `cat_nombre` varchar(45) NOT NULL,
  `cat_descripcion` varchar(100) DEFAULT NULL,
  `cat_padre` int NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
INSERT INTO `catalogo` VALUES (1,'CATEGORIAS',NULL,0),(2,'BOLETOSTIPO',NULL,0),(3,'EVENTOTIPO',NULL,0),(4,'GENERALES',NULL,2),(5,'VIP',NULL,2),(6,'CONCIERTOS',NULL,3),(7,'FESTIVALES',NULL,3),(8,'OBRAS DE TEATRO',NULL,3),(9,'CORPORATIVOS',NULL,3),(10,'DEPORTIVOS',NULL,3),(11,'BENEFICOS',NULL,3),(12,'TALLERES',NULL,3),(13,'CONFERENCIAS',NULL,3),(14,'FAMILIARES',NULL,3);
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cli_cedula` int NOT NULL,
  `cli_nombre` varchar(100) NOT NULL,
  `cli_telefono` varchar(10) NOT NULL,
  `cli_correo` varchar(50) NOT NULL,
  `cli_direccion` varchar(100) NOT NULL,
  `cli_fecha` date NOT NULL,
  PRIMARY KEY (`cli_cedula`),
  UNIQUE KEY `cli_cedula_UNIQUE` (`cli_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (401224407,'Alejandro Muñoz','989650479','asdasda@adsad.com','Venezuela 4-73 y Uruguay','2023-06-24'),(1050518594,'ALEJANDRO','989650479','ASDSAD','ASDASD','2023-06-24'),(1234567891,'Alejandro Muñoz','989650479','asdasda@adsad.com','Venezuela 4-73 y Uruguay','2023-06-24'),(1234567893,'Alejandro Muñoz','989650479','asdasda@adsad.com','Venezuela 4-73 y Uruguay','2023-06-24');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `com_id` int NOT NULL AUTO_INCREMENT,
  `cli_id` int NOT NULL,
  `bol_id` int NOT NULL,
  `com_fecha` date NOT NULL,
  `com_cantidad` int NOT NULL,
  `com_total` decimal(10,0) NOT NULL,
  `usu_id` int NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `cliente_compra_idx` (`cli_id`),
  KEY `boleto_compra_idx` (`bol_id`),
  KEY `usuario_compra_idx` (`usu_id`),
  CONSTRAINT `boleto_compra` FOREIGN KEY (`bol_id`) REFERENCES `boletos` (`bol_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cliente_compra` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_compra` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `eve_id` int NOT NULL AUTO_INCREMENT,
  `eve_nombre` varchar(100) NOT NULL,
  `eve_nombrelugar` varchar(100) NOT NULL,
  `eve_fecha` datetime NOT NULL,
  `eve_direccion` varchar(100) NOT NULL,
  `cat_id_tipoeve` int NOT NULL,
  `org_id` int NOT NULL,
  PRIMARY KEY (`eve_id`),
  KEY `catalogo_evento_idx` (`cat_id_tipoeve`),
  KEY `organizadores_evento_idx` (`org_id`),
  CONSTRAINT `catalogo_evento` FOREIGN KEY (`cat_id_tipoeve`) REFERENCES `catalogo` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `organizadores_evento` FOREIGN KEY (`org_id`) REFERENCES `organizadores` (`org_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'BUBASETA CITY','Bar and Grill','2023-06-24 00:32:00','Veasd',12,1);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizadores`
--

DROP TABLE IF EXISTS `organizadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizadores` (
  `org_id` int NOT NULL AUTO_INCREMENT,
  `org_nombre` varchar(45) NOT NULL,
  `org_telefono` varchar(45) NOT NULL,
  `org_correo` varchar(45) NOT NULL,
  `org_direccion` varchar(45) NOT NULL,
  `org_fecha` date NOT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizadores`
--

LOCK TABLES `organizadores` WRITE;
/*!40000 ALTER TABLE `organizadores` DISABLE KEYS */;
INSERT INTO `organizadores` VALUES (1,'BUBASETA','1234567891','bubaseta@gmail.com','pipipi','2023-06-24'),(2,'MAMBORAP','1234567891','mamborap@gmail.com','asdas','2023-06-25');
/*!40000 ALTER TABLE `organizadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `per_id` int NOT NULL,
  `per_nombre` text,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Escritorio'),(2,'Coordinadores'),(3,'Horario Docente'),(4,'Reportes'),(5,'Acceso'),(6,'Reportes'),(7,'Custodios');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(100) NOT NULL,
  `usu_cedula` varchar(20) NOT NULL,
  `usu_telefono` varchar(20) DEFAULT NULL,
  `usu_correo` varchar(50) DEFAULT NULL,
  `usu_cargo` varchar(20) DEFAULT NULL,
  `usu_login` varchar(20) NOT NULL,
  `usu_clave` varchar(64) NOT NULL,
  `usu_condicion` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`usu_id`),
  UNIQUE KEY `login_UNIQUE` (`usu_login`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'ADMINISTRADOR DEL SISTEMA','-1','782541239','yosdado@gmail.com','Administrador','admin','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(8,'AGUILAR ARIAS DIANA ELIZABETH','1716004864','996450999','','DOCENTE','DAGUILAR','825f11613c4f2f302f0680b1939e665db3422e33cd0336067dcd170933bb39d6',1),(9,'AGUIRRE CHAGNA VICTOR HUGO','1002617809','998736511','','DOCENTE','VAGUIRRE','57c13e45c8f50247db496d995d41586b5c30434025bed4a3cf19165e3d643f14',1),(10,'ALVAREZ JARAMILLO EDISON ROBERTO','1002046231','992396086','','DOCENTE','EALVAREZ','03c057c438b83dc32fbe43d1e901bfa01a071799a0a9a51515732e09dc5e9597',1),(11,'ALVAREZ JIMENEZ JAIRO ALEXIS','1003075957','994869142','','DOCENTE','JALVAREZ','4069684a068778f207a0653e472b1d02a95fefa9f30b86aed688908e6be9cb46',1),(12,'ANDRADE COLLAHUAZO JULIO ADOLFO','1001412616','997682196','','DOCENTE','JANDRADE','b6695169a9807d6196abffd94dc36118021836efe7c6582b6de01c0796c888d0',1),(13,'ARCINIEGA ROCHA RICARDO PATRICIO','1003011200','988010437','','DOCENTE','RARCINIEGA ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(14,'ARICHABALA VALLEJOS DIANA ELIZA','0104645494','991960965','','DOCENTE','DARICHABALA','68e8141a7747fc32d27c4589a16df6cd6f3a28f45dab08288ed292f503fd187e',1),(15,'ARROYO VACA CRISTIAN SEBASTIAN','1003247812','968700913','','DOCENTE','CARROYO','589944af8df0e172a210777b87dc069752855826ce3fa0c12d5df775dacd6983',1),(16,'AULESTIA RUEDA ROBERTO','1003268503','995881177','','DOCENTE','RAULESTIA ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(17,'AYALA PAREDES JOHANNA PAOLA','1003320940','984019817','','DOCENTE','JAYALA','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(18,'BARREZUETA GARCIA DORIS MARLLEY','1001791845','980840124','','DOCENTE','DBARREZUETA','53586abba7aa75443026314420dc103b12971eb3e06e0b62e2c21638adbf701f',1),(19,'BARRIGAS REVELO DIEGO ALEJANDRO','1003560339','995764426','','DOCENTE','DBARRIGAS','8a79158207209468cef41b6844bae34783ed2348c292b0cdbb642b3b5a6bcd26',1),(20,'BURBANO GARCIA JHOMAIRA LORENA','0401198361','991461215','','DOCENTE','JBURBANO','3fc72f60fcffe8438d6339bfb6d60d403a02f54525a81aa80d1cf0656876010c',1),(21,'CABRERA ZULETA PAOLA CAROLINA','1002682605','991641710','','DOCENTE','PCABRERA','8106b16ff61529c0637edc078e424440450e74e97b6092c4fb91d115ab165b28',1),(22,'CADENA CATA\\\\u00d1A MARLON RAFAEL','1716223571','998167006','','DOCENTE','MCADENA','b829ace7eb4a9475c0e633b42356790acc1c05c8af72f3fc7628b55774550644',1),(23,'CAIZA QUISHPE LUIS ARMANDO','1002861027','988431596','','DOCENTE','LCAIZA','03c057c438b83dc32fbe43d1e901bfa01a071799a0a9a51515732e09dc5e9597',1),(24,'CALDERON RODRIGUEZ FLORINDA GEOCONDA','1002418661','985658996','','DOCENTE','FCALDERON','e58fd34671717f65a5e371ad3ac0b2431a354c37de92b9b97a135a866778f7d3',1),(25,'CARRASCAL GARCIA JORGE','1756733968','979420931','','DOCENTE','JCARRASCAL','f6f8cc423eba4a7bb052da7e316fdf7d0ec3fe312de04e240bb441ef93af0ff5',1),(26,'CASTILLO CAICEDO PAMELA ALEXANDRA','1002706339','980112780','','DOCENTE','PCASTILLO','5fd0980cdf297528843c3a00242b51829696998062cf7b55f04f10d8cdaff12c',1),(27,'CASTILLO MESTANZA ANIBAL GONZALO','1001467891','996933275','','DOCENTE','ACASTILLO','ad85112973e3987415bf6709e3aee93a03207b066437a8c0983cb46e435f8072',1),(28,'CERVANTES TAFUR HENRY DANIEL','1002581583','984970328','','DOCENTE','HCERVANTES ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(29,'CHAMORRO PORTILLA MARIA CRISTINA','1002867594','986209244','','DOCENTE','MCHAMORRO','f33d4bd08cb434a4bc47c8013b863cded66a01141ec583f16552556cc8521d79',1),(30,'CHAVEZ RUALES JENNY MARITZA','1003344577','985530624','','DOCENTE','JCHAVEZ','45f7db6e3c065474fa172e7a87e5e71d308b49ce3e4f4521151386bde5683c4d',1),(31,'CHECA RAMIREZ ANA ELIZABETH','1002509998','999042809','','DOCENTE','ACHECA','cacefb43daf354ff623999a86d5fd5a48c5beaf5574069e06ef1c638db9fba71',1),(32,'DIAZ AYALA JOFFRE OMAR','1001650348','993897359','','DOCENTE','JDIAZ','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(33,'ENRIQUEZ CUPUERAN ALVARO ALFONSO','1001770146','999195298','','DOCENTE','AENRIQUEZ','c659677e3e3a52a0e5c8c41b8b1297dd235894486127106b45186b3c258a74ab',1),(34,'ERAZO CHAMORRO VANESSA CRISTINA','1003142781','999323355','','DOCENTE','VERAZO ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(35,'FLORES BENITEZ FERNANDO RENE','1002950465','985354118','','DOCENTE','FFLORES','5e9d61a98822fdc0be3351e9a8625525fc4f1cf2077c63b68cdf051e6b6a1686',1),(36,'FLORES BOSMEDIANO EDISON MARCOS','1003431986','993430040','','DOCENTE','EFLORES','96dfd7b3e4a67ba4ed6393de68661165b6216426d22ce867deb108ad4cb4e0eb',1),(37,'FRAGA PORTILLA JORGE ANDRES','1002735031','997233083','','DOCENTE','JFRAGA','c28dceb9200ee88d93853cbeb4ad0820c16daf0051d0a13a78037fad34da8f3d',1),(38,'GALVEZ CHIRIBOGA LUIS MIGUEL','1003594460','987257717','','DOCENTE','LGALVEZ','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(39,'GARCIA LOPEZ LETTY MAGDALENA','1718514753','996023448','','DOCENTE','LGARCIA','f51d699c1611a97a3c866d30a1c326dbc16b7412343630e29fb142a8e7d696db',1),(40,'GODOY TRUJILLO PAMELA ESTEFANIA','1003294566','985420596','','DOCENTE','PGODOY','76e4cb91f308a6785114fc13f3290cddd6d34fa3fbfe487afbede68cdd0e0dfc',1),(41,'GRANJA AGUINAGA LUCIO ALBERTO','1001628435','981810645','','DOCENTE','LAGRANJA','50342324ac4b7fa690c465943f6693419bea75e749796594ee5dd4cb5e1e6247',1),(42,'GRANJA ALVEAR LOURDES ARACELI','1003444039','987455818','','DOCENTE','AGRANJA','80b40bf3492235edf447d060edbc21b27026242fe8d808364ccc8fc8a1c77497',1),(43,'GUERRERO CABEZAS MIGUEL ANGEL','1002668125','992150617','','DOCENTE','MGUERRERO ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(44,'GUEVARA GUEVARA MARCELO','1002959334','990898754','','DOCENTE','MGUEVARA','d2761b107c45d7702170242ab71962b603596a87fcd541e840b02f4208a90f20',1),(45,'HERRERA MANRIQUE JANNYNE PAMELA','1004007744','989599522','','DOCENTE','JHERRERA','14c3102a39bd5c6257a8f36c5939778720e3940bdb9a3823c62931d6023c564e',1),(46,'HIDALGO HIDALGO BOLIVAR JAVIER','1002341848','968382014','','DOCENTE','BHIDALGO','6aca06190b648724cd576577450f97a7e91ce960d3332edf46c780a6f4534cf0',1),(47,'HIDALGO SALAZAR JEFFERSON FABRICIO','1003537691','995443490','','DOCENTE','JHIDALGO','b9704481924c02c517e994bcf0870af984e73dc2b191c7b55b6c897b7bc71f63',1),(48,'LANDAZURI AGUIRRE SINTHYA CAROLINA','1715549307','984486905','','DOCENTE','SLANDAZURI','0068199537746ae38776ddd714a6babe46ff6f779e5d869f46611c992696872d',1),(49,'LARA ARELLANO MAURICIO ISRAEL','1003529177','991434400','','DOCENTE','MLARA','baf60dfdc66597f648051e755433ed15b5204c558a8fbc9b9d0aa67715247811',1),(50,'LOPEZ GUERRA MILTON BERTULFO','1000969608','999387801','','DOCENTE','MLOPEZ','6f2667486342989142b3c1e31a2a9fce0242c10f1de37bbe5ce1cefb5e4de0af',1),(51,'LUNA UNDA LEONARDO DAVID','1002876041','999787799','','DOCENTE','LLUNA','9337ec4c80064e9022eca705bf90c9a8b169dade4b1e336fc0300c9d0efd7c40',1),(52,'MARTINEZ TORRES PEDRO JOSE','1003662218','992752175','','DOCENTE','PMARTINEZ','e7a22ba3ab2866890149f661970e8145a14593c591122e295c996f5b3eefeb4a',1),(53,'MENDEZ CARVAJAL ERIKA PRICILA','1003754197','986582234','','DOCENTE','EMENDEZ ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(54,'MEZA CARTAGENA JHONATAN FABRICIO','1004228803','969867484','','DOCENTE','JMEZA ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(55,'MONTALVO LOZA CHRISTIAN HERNAN','1002922464','983318104','','DOCENTE','CMONTALVO','48ed82122b7419ee93be7ec0014d35a94a1c218e0ea895d08325d4c116863195',1),(56,'MONTENEGRO RIVERA ANA MERCEDES','0401401484','958970278','','DOCENTE','AMONTENEGRO','28f765cee73b405547d84847cf407fd2c722325b41754e60a3b3a5329ed84769',1),(57,'NARVAEZ ONOFRE JOHANNA ANGELA','1002853495','995327958','','DOCENTE','JNARVAEZ','ba36b97a41e7faf742ab09bf88405ac04f99599a',1),(58,'NARVAEZ QUINTEROS JOSE LUIS','1002501466','991451230','jlnarvaez@ist17dejulio.edu.ec','DOCENTE','JLNARVAEZ','8696c14d36eb1f630165c3af3b729981626b13ca3f898a720393abcce7bce55d',1),(59,'NUÑEZ SILVA BOLIVAR GUALBERTO','0602182883','991897853','','DOCENTE','BNUNIEZ','fbaa27b78f398327fdc8c5f41c9bcbbe5bdc8934283ce1ec98540f8ebc7e1dfb',1),(60,'OBANDO QUITO ROMEL FABIAN','1718305814','959192783','','DOCENTE','ROBANDO','47f57a93d8f83df6d159ad6e67e46c91995b63e6cf1678d7e30535ffbd459873',1),(61,'ORTEGA LOZA FERNANDO WLADIMIR','1002635793','981846427','','DOCENTE','FORTEGA ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(62,'OTERO POTOSI SANTIAGO ANDRES','1003109277','998341210','','DOCENTE','SOTERO','6b11b47b030cc2eed2d947287a6c93bfde15b5e2aa4a6cfec28c28f227deb5dd',1),(63,'PEREZ VILLACIS CRISTINA ALEXANDRA','1803602224','999964943','','DOCENTE','CPEREZ','71e6bbde5e0126907db088f7585a03ab30bb6fa778af54431b319a9f87f23513',1),(64,'PINEDA MAIGUA DIEGO','1002454708','994597207','','DOCENTE','DPINEDA','1fd9a6310396a584fbb2aae668aab53c77f232eebcaeaac1c71306a019109c04',1),(65,'PINTO AYALA SILVIA LORENA','1003567912','998880740','','DOCENTE','SPINTO','3166e520daaab0cf3f0638df7502d2e010cbe06bdf20e8e118866f56586a025b',1),(66,'POZO CASTILLO FRANCISCO','0401126636','994201976','','DOCENTE','FPOZO','03c057c438b83dc32fbe43d1e901bfa01a071799a0a9a51515732e09dc5e9597',1),(67,'POZO DIAS REINALDO RAMIRO','1002097630','989602524','','DOCENTE','RPOZO','90a3b1c8c0039d2bfac8e3a00989a23bdfdf002779dbb599aa12275c749f7a22',1),(68,'QUINATOA OSEJOS MONICA ALEXANDRA','1718005612','997610617','','DOCENTE','MQUINATOA','2f5199cc0969a2aade20020f64c176531238093b5697a0996bc9fc8d4d9bd611',1),(69,'QUINGLA GARRIDO CARLOS ANDRES','1003239306','989792375','','DOCENTE','CQUINGLA','ae209508aab32b2cd621de693b2bdeb58a84fae707c795c6fd2e42e923c359eb',1),(70,'RAMOS CHAVEZ MARIA CAROLINA','1003548615','939392419','','DOCENTE','MRAMOS','c1b755d45d249f697d41f3d5860b237f50256617d53e0b3d9ec9fe069a518fde',1),(71,'RODRIGUEZ PORTILLO AURA GRACIELA','1002710562','995625840','','DOCENTE','ARODRIGUEZ','e29addfef38de630cc90e4f1e1e13062c3637adfc046ab64205d53791ebba38b',1),(72,'ROLDAN ROBLES EDWIN SAUL','1001293560','994283214','','DOCENTE','EROLDAN','0b80c840b3218a5f4e71d9f521a5ac0678eab99bcc2b9a3da1f2b2079de526ec',1),(73,'ROSERO MONTALVO PAUL DAVID','1003378039','969432370','','DOCENTE','PROSERO ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(74,'ROSERO OBANDO ALVARO FRANCISCO','1003171525','984189983','','DOCENTE','AROSERO','87bb74a4b681b7cbc596b2867c89c0eba65dbf621a1ff41e4ac2157511c57094',1),(75,'RUIZ CRUZ MIGUEL ALEJANDRO','1002513107','999049717','','DOCENTE','MRUIZ','576efb4dd260c837b70b41e6a1cff64e0aa3f0c9a215759bb83407b065b781b6',1),(76,'RUIZ PROAÑO JERALDIN MARICELA','1004475958','980853009','','DOCENTE','JRUIZ','a121bad352ec571085a30d79f44d1e74b81c110a46b2c4c37ea6d4ed79dd250b',1),(77,'SANCHEZ VILA TANIA YADIRA','1002524161','998723385','','DOCENTE','TSANCHEZ','a6c619e194341f3a4d1b31a6009ee40d1bfdce4293c0cfec4c6dc0f42e07b171',1),(78,'SANDOVAL PILLAJO LOURDES LILIAN','1002688339','969782095','','DOCENTE','LSANDOVAL','0125d7e6424e19e90f81281a8a6872d96276121fa7086c454ef775ebc9fed748',1),(79,'SANTOS CORREA LUIS ALBERTO','1003670310','993922146','','DOCENTE','LSANTOS','86de2500c162f7ee3a0e08a73190063a2e8899ee03eb70cf1ce87a95cf77c743',1),(80,'SILVA SEGOVIA MARCO POLO RODRIGO','0501601835','962891015','','DOCENTE','MSILVA ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(81,'TEJADA HUERTAS LUIS ALFONSO','1703784007','999602367','','DOCENTE','LTEJADA','a06cd5d03086d145c34ebd80590db5049f970f21a0b0d2012c1c1c5fa712c805',1),(82,'TELLO GUZMAN JAVIER ROSALINO','1003137898','996408148','','DOCENTE','JTELLO','03c057c438b83dc32fbe43d1e901bfa01a071799a0a9a51515732e09dc5e9597',1),(83,'TOAPANTA LEMA JUAN ALEJANDRO','1003543988','961326020','','DOCENTE','ATOAPANTA','b14dbd9091a5490a183480136171a1942c96eb9a01b68cdb9513a441e1f63fff',1),(84,'TORRES ANDRADE FELIPE SANTIAGO','1003702147','984196953','','DOCENTE','FTORRES','25494550e8b5c975b7c66d64a69c88dee841600502549002a6da3880cfb3829e',1),(85,'TORRES GORDILLO MAURO ESTUARDO','0','982246810','','DOCENTE','MTORRES ','ba36b97a41e7faf742ab09bf88405ac04f99599a',0),(86,'TORRES REYES JESSICA XIMENA','1003374525','999767306','','DOCENTE','JTORRES','c98db0a68dbea92effffb0fc934dbef2876718f89a79600bd2b4856d983fb181',1),(87,'UBIDIA VASCONEZ RENATO ALONSO','1723264774','984858605','','DOCENTE','RUBIDIA','cf861e77d069812b4e7972c9341c7312ebb7b453dcbe3413e46c804365a5f39f',1),(88,'YASELGA AUZ EDISON MIGUEL','1002964862','999919573','','DOCENTE','EYASELGA','a4e8ad41bb88bddabd5fa4462f78670146b072d1c63e2170b8090dca77e7680f',1),(89,'YEPEZ RIVADENEIRA JONATHAN DANIEL','1003071915','996234432','','DOCENTE','JYEPEZ','916596c315e47fbcddc0711eeb631d6bcbd2ebec988e4fe1c3eafb4954847cc0',1),(90,'ZURITA MIRANDA ANDREA ESTEFANIA','1003096698','999238991','','DOCENTE','AZURITA','287a1f7a0cd1f4ac5645068856476f1c0f658a6dfb6a4a984b711bb9d970207f',1),(151,'CASTRO TEANGA SANTIAGO XAVIER','1002756177','','','','scastro','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(152,'PIJAL ROJAS JOSE ANTONIO','1001392040','','','','jrojas','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(153,'PINZON BARRIGA LUIS ENRIQUE','0915028062','','','','lpinzon','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(154,'BALLESTEROS JEREZ JESSICA GUADALUPE','1804392338','','jballestero@ist17dejulio.ecu.ec','DOCENTE','jballesteros','9b0f8efc5bf5a72c85e44b2b46bea8db86a32ab6a3144539687e130c7bcdf9d5',1),(156,'BOSMEDIANO CARDENAS CARLOS PATRICIO','1003487954','','','DOCENTE','CBOSMEDIANO','1e9884c71b316c5ea45e37a98230fc830d965225fa4bcdb4b318351d63f7eda2',1),(157,'DELGADO RODRIGUEZ  DENNIS MARTIN','1001671799','','','DOCENTE','DDELGADO','7adf3fc0d53769dc11dd1756179a0b74a07379fd466a691e55523dfa0421ab92',1),(158,'FLORES ORTEGA PATRICIO MIJAHIL','1003368436','','','DOCENTE','PFLORES','2b25423f35b4c9a74751feaa1ff80b48bd2a7b8e14767937180698a8bf8a4405',1),(159,'GARRIDO MONTENEGRO MAURICIO SANTIAGO','502912884','','','DOCENTE','MGARRIDO','51ddfd5042c22805ba183edf55f9d7128196adc89432b2c7caa065847fc1c8c6',1),(160,'ROSERO GARCÍA JHONATHAN FABRICIO','400999496','','','DOCENTE','JROSERO','53421d44357fecb8cf2a4f327f98cd692f7ed4efc9b09a7a53f14e8cc843f3b5',1),(161,'RUANO GONZALEZ EDISON ERNESTO','1001543089','','','DOCENTE','ERUANO','c3fab0a80373c85ccaa2e12fecf6aa3426e66564937e0b4b184e3d6ec0366ada',1),(162,'JARA CUASQUI LUIS PATRICIO','1001769353','','','DOCENTE','LJARA','ecc5342f9fc226de06836c0ae6d545130a4b82fa9cf523037d2c35794f47e6fd',1),(163,'MUÑOZ LANDAZURI JUAN HEBERTH','1001418381','','','DOCENTE','JMUNIOZ','af4c2143119c74dc8b953a6214d4622c9903aa7cdcccf1a56c5c4157a9db9b24',1),(164,'FLORES AUPAZ SANTIAGO IVAN','401465844','','','DOCENTE','SFLORES','cc7ac3a5e9b96dcc608e957fa05429315485fabf6986153f51e91bd5fde1af69',1),(165,'ERAZO CHAFUEL DIEGO ORLANDO','1721879490','','','DOCENTE','DERAZO','08962be293eb0c9c1c4175c427e984a35a60dee1dcde7b977739deec544a0ce9',1),(167,'GARCIA CAMPOS LUIS ALFONSO','1001902822','','','','LAGARCIA','f51d699c1611a97a3c866d30a1c326dbc16b7412343630e29fb142a8e7d696db',1),(168,'GARCIA CARTAGENA YADIRA ESTEFANIA','1003983911','991451230','jlnarvaez@ist17dejulio.edu.ec','DOCENTE','YGARCIA','f51d699c1611a97a3c866d30a1c326dbc16b7412343630e29fb142a8e7d696db',1),(175,'ROSERO LOPEZ ANDREA SAMANTA','0','0','','DOCENTE','SROSERO','8ea28ff088f3eef1ed30397b8bc98e6465c4b9a15753035b557f9825571b9041',1),(177,'CISNEROS CABRERA PABLO LEONIDAS','1001965290','0','pcisneros@ist17dejulio.edu.ec','DOCENTE','pcisneros','b264dd7f0fe0c56e9a1318349d798a1c2520fe36b51548394e095aa091df4355',1),(178,'RODRIGUEZ GUEVARA ADRIAN MARCELO','1003632369','0','amrodriguez@ist17dejulio.edu.ec','DOCENTE','amrodriguez','c72ead07dd3963de388b07ca71882fbe737f37120043cb38b9e427a9a560a3af',1),(179,'POZO JIMÉNEZ ANDERSON ENRIQUE','0401476890','','','PRESIDENTE CIRCULO E','APOZO','23e820dd07fa3b8eaa89d70db273831277ce2b2af603f580e7286f65a7693ce2',1),(180,'RIVADENEIRA ROSERO YADIRA VERONICA','1003885942','','','ADMINISTRADOR BAR','YRIVADENEIRA','3ab7a9a0eef2b90cffc2b8cf7a91f7df408db2bb779100dc0173d2790b4f200f',1),(181,'CHUQUIN RIVERA ISRAEL ALEJANDRO','1003306139','0','','DOCENTE','ICHUQUIN','6e06183b887eabadb047c117b6e6a974eaf048ce9a05a0b63888ac821380321b',1),(182,'CHUQUIN RIVERA ALEJANDRO ISRAEL','1003306139','','','DOCENTE','ACHUQUIN','1ff75123c5d5fd4ebe108c6fe2236a6e59a6a81791d5ef385838c42f2cc58f0d',1),(183,'1050518594','ALEJANDRO MUÑOZ','0989650479','asasdas@gmail.com','100','2022-11-30','',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_permiso` (
  `uspe_id` int NOT NULL AUTO_INCREMENT,
  `usu_id` int NOT NULL,
  `per_id` int NOT NULL,
  PRIMARY KEY (`uspe_id`,`usu_id`,`per_id`),
  KEY `usuper_usuarios_idx` (`usu_id`),
  KEY `usuper_permisos_idx` (`per_id`),
  CONSTRAINT `usuper_permisos` FOREIGN KEY (`per_id`) REFERENCES `permisos` (`per_id`),
  CONSTRAINT `usuper_usuarios` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permiso`
--

LOCK TABLES `usuario_permiso` WRITE;
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
INSERT INTO `usuario_permiso` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(280,8,1),(281,8,3),(282,8,7),(296,9,1),(297,9,3),(298,9,7),(205,10,1),(206,10,3),(207,10,7),(274,11,1),(275,11,3),(276,11,7),(292,12,1),(293,12,2),(294,12,3),(295,12,7),(134,14,1),(135,14,3),(136,14,7),(85,15,1),(86,15,2),(87,15,3),(88,15,7),(8,17,1),(9,17,2),(10,17,3),(11,17,7),(161,18,1),(162,18,3),(163,18,7),(323,19,1),(324,19,3),(325,19,7),(143,20,1),(144,20,3),(145,20,7),(12,21,1),(13,21,2),(14,21,3),(15,21,7),(368,22,1),(369,22,3),(370,22,7),(208,23,1),(209,23,3),(210,23,7),(314,24,1),(315,24,3),(316,24,7),(16,25,1),(17,25,2),(18,25,3),(19,25,7),(470,26,1),(471,26,3),(472,26,7),(98,27,1),(99,27,3),(100,27,7),(137,29,1),(138,29,3),(139,29,7),(119,30,1),(120,30,3),(121,30,7),(519,31,1),(520,31,3),(521,31,7),(507,32,1),(508,32,3),(509,32,7),(311,33,1),(312,33,3),(313,33,7),(173,35,1),(174,35,3),(175,35,7),(20,36,1),(21,36,2),(22,36,3),(23,36,7),(526,37,1),(527,37,3),(528,37,7),(24,38,1),(25,38,2),(26,38,3),(27,38,7),(347,39,1),(348,39,3),(349,39,7),(128,40,1),(129,40,3),(130,40,7),(188,41,1),(189,41,3),(190,41,7),(283,42,1),(284,42,3),(285,42,7),(392,44,1),(393,44,3),(394,44,7),(125,45,1),(126,45,3),(127,45,7),(377,46,1),(378,46,3),(379,46,7),(167,47,1),(168,47,3),(169,47,7),(146,48,1),(147,48,3),(148,48,7),(522,49,1),(523,49,2),(524,49,3),(525,49,7),(485,50,1),(486,50,3),(487,50,7),(265,51,1),(266,51,3),(267,51,7),(32,52,1),(33,52,3),(34,52,7),(35,55,1),(36,55,2),(37,55,3),(38,55,7),(455,56,1),(456,56,2),(457,56,3),(458,56,7),(185,58,1),(186,58,3),(187,58,7),(305,59,1),(306,59,3),(307,59,7),(289,60,1),(290,60,3),(291,60,7),(411,62,1),(412,62,3),(413,62,7),(140,63,1),(141,63,3),(142,63,7),(81,64,1),(82,64,2),(83,64,3),(84,64,7),(170,65,1),(171,65,3),(172,65,7),(510,66,1),(511,66,3),(512,66,7),(152,67,1),(153,67,3),(154,67,7),(359,68,1),(360,68,3),(361,68,7),(101,69,1),(102,69,3),(103,69,7),(404,70,1),(405,70,2),(406,70,3),(407,70,7),(479,71,1),(480,71,3),(481,71,7),(473,72,1),(474,72,3),(475,72,7),(39,74,1),(40,74,3),(41,74,7),(329,75,1),(330,75,3),(331,75,7),(302,76,1),(303,76,3),(304,76,7),(491,77,1),(492,77,3),(493,77,4),(494,77,7),(476,78,1),(477,78,3),(478,78,7),(386,79,1),(387,79,3),(388,79,7),(320,81,1),(321,81,3),(322,81,7),(241,82,1),(242,82,3),(243,82,7),(195,83,1),(196,83,2),(197,83,3),(198,83,7),(440,84,1),(441,84,3),(442,84,7),(42,86,1),(43,86,2),(44,86,3),(45,86,7),(362,87,1),(363,87,3),(364,87,7),(380,88,1),(381,88,3),(382,88,7),(182,89,1),(183,89,3),(184,89,7),(452,90,1),(453,90,3),(454,90,7),(498,153,1),(499,153,4),(500,153,7),(271,154,1),(272,154,3),(273,154,7),(155,156,1),(156,156,3),(157,156,7),(131,157,1),(132,157,3),(133,157,7),(199,158,1),(200,158,3),(201,158,7),(365,159,1),(366,159,3),(367,159,7),(466,161,1),(467,161,3),(468,161,4),(469,161,7),(516,162,1),(517,162,3),(518,162,7),(504,163,1),(505,163,3),(506,163,7),(374,164,1),(375,164,3),(376,164,7),(459,165,1),(460,165,3),(461,165,4),(462,165,7),(371,167,1),(372,167,3),(373,167,7),(414,168,1),(415,168,3),(416,168,7),(398,175,1),(399,175,3),(400,175,7),(408,177,1),(409,177,3),(410,177,7),(501,178,1),(502,178,3),(503,178,7),(428,181,1),(429,181,3),(430,181,7),(443,183,1),(444,183,3),(445,183,7);
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'boletos_ist17j'
--

--
-- Dumping routines for database 'boletos_ist17j'
--
/*!50003 DROP PROCEDURE IF EXISTS `boletos_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `boletos_insert`(in evento int, in tipoboleto int, in precio decimal, in cantidad int)
BEGIN
declare sig int;
	   select max(bol_id) into sig from boletos; 
        set sig=sig+1;
      INSERT INTO boletos (`bol_id`,`eve_id`,`cat_id_bol`,`bol_precio`,`bol_cantidad`)
VALUES (sig,evento,tipoboleto,precio,cantidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `boletos_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `boletos_select`()
BEGIN
select eventos.eve_nombre,catalogo.cat_nombre,bol_precio,bol_cantidad 
from boletos,eventos,catalogo where boletos.eve_id=eventos.eve_id
 and boletos.cat_id_bol=catalogo.cat_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cliente_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente_insert`(in cedula int,in nombre varchar(100),in telefono int,in correo varchar(100) ,in direccion varchar(100))
BEGIN
       INSERT INTO clientes (`cli_cedula`,`cli_nombre`,`cli_telefono`,
		`cli_correo`,`cli_direccion`,`cli_fecha`)
	   VALUES (cedula,nombre,telefono,correo,direccion,current_date());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cliente_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente_select`()
BEGIN
	SELECT clientes.cli_cedula,
    clientes.cli_nombre,
    clientes.cli_telefono,
    clientes.cli_correo,
    clientes.cli_direccion,
    clientes.cli_fecha
FROM clientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `evento_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `evento_insert`(in nombre varchar(100),in nombrelugar varchar(100),in fecha datetime, in direccion varchar(100), in tipoevento int, in organizador int)
BEGIN

declare sig int;
	   select max(eve_id) into sig from eventos; 
        set sig=sig+1;
       INSERT INTO eventos(`eve_id`,`eve_nombre`,`eve_nombrelugar`,`eve_fecha`,
       `eve_direccion`,`cat_id_tipoeve`,`org_id`)
VALUES (sig,nombre,nombrelugar,fecha,direccion,tipoevento,organizador);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `evento_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `evento_select`()
BEGIN
select eve_id, eve_nombre,eve_nombrelugar,eve_fecha, 
eve_direccion, cat_nombre, organizadores.org_nombre from eventos,organizadores,catalogo
where eventos.cat_id_tipoeve= catalogo.cat_id and eventos.org_id=organizadores.org_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `organizador_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `organizador_insert`(in nombre varchar(100),in telefono varchar(10),in correo varchar(100),in direccion varchar(100))
BEGIN

declare sig int;
	   select max(org_id) into sig from organizadores; 
        set sig=sig+1;
       INSERT INTO organizadores
			(org_id,org_nombre,org_telefono,org_correo,org_direccion,org_fecha)
VALUES (sig,nombre,telefono,correo,direccion,current_date());



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `organizador_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `organizador_select`()
BEGIN
SELECT `organizadores`.`org_id`,
    `organizadores`.`org_nombre`,
    `organizadores`.`org_telefono`,
    `organizadores`.`org_correo`,
    `organizadores`.`org_direccion`,
    `organizadores`.`org_fecha`
FROM `boletos_ist17j`.`organizadores`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_catalogo_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_catalogo_select`(in padre int)
BEGIN
	SELECT * FROM catalogo where cat_padre=padre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eventos_combo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eventos_combo`()
BEGIN
select * from eventos where eve_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_logeo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_logeo`(in usuario varchar(50), in clave varchar(100))
BEGIN
SELECT usu_id,usu_nombre,usu_cedula,usu_telefono,usu_correo,usu_cargo,usu_login 
FROM usuario 
WHERE usu_login=usuario AND usu_clave=clave AND usu_condicion='1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_organizadores_combo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_organizadores_combo`()
BEGIN
select * from organizadores where org_id;
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

-- Dump completed on 2023-07-12 11:06:50
