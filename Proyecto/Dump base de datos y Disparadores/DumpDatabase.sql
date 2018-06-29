/*
Navicat MySQL Data Transfer

Source Server         : sdsa
Source Server Version : 50622
Source Host           : db4free.net:3306
Source Database       : aosuidgsjb

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2014-12-28 20:44:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Almacen
-- ----------------------------
DROP TABLE IF EXISTS `Almacen`;
CREATE TABLE `Almacen` (
  `idAlmacen` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAlmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Almacen
-- ----------------------------
INSERT INTO `Almacen` VALUES ('1', 'C/Pepa nº1');
INSERT INTO `Almacen` VALUES ('2', 'C/Juana nº2 ');
INSERT INTO `Almacen` VALUES ('3', 'Poligono ALmacen 3');
INSERT INTO `Almacen` VALUES ('4', 'Edificio Colon Planta 4');
INSERT INTO `Almacen` VALUES ('5', null);

-- ----------------------------
-- Table structure for Historial
-- ----------------------------
DROP TABLE IF EXISTS `Historial`;
CREATE TABLE `Historial` (
  `Referencia` int(255) unsigned NOT NULL,
  `Unidades` bigint(255) NOT NULL,
  PRIMARY KEY (`Referencia`,`Unidades`),
  CONSTRAINT `Referencia` FOREIGN KEY (`Referencia`) REFERENCES `Productos` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Historial
-- ----------------------------
INSERT INTO `Historial` VALUES ('1', '120');
INSERT INTO `Historial` VALUES ('2', '1');
INSERT INTO `Historial` VALUES ('3', '4');
INSERT INTO `Historial` VALUES ('4', '6');

-- ----------------------------
-- Table structure for Productos
-- ----------------------------
DROP TABLE IF EXISTS `Productos`;
CREATE TABLE `Productos` (
  `Referencia` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Tipo` varchar(255) DEFAULT NULL,
  `PrecioCompra` float(255,0) DEFAULT NULL,
  `PrecioVenta` float(255,0) DEFAULT NULL,
  `IVA` int(255) DEFAULT '21',
  `Peso` decimal(65,0) DEFAULT '0',
  `Volumen` decimal(65,0) DEFAULT '0',
  `Proveedor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Productos
-- ----------------------------
INSERT INTO `Productos` VALUES ('1', 'Raton', 'BT', '10', '15', '21', '0', '2', 'INFORMATICA SA');
INSERT INTO `Productos` VALUES ('2', 'Teclado', 'WiFi', '20', '25', '21', '1', '3', 'REPUESTOS SL');
INSERT INTO `Productos` VALUES ('3', 'Monitor', 'Cable', '12', '23', '21', '0', '0', 'INFORMATICA SA');
INSERT INTO `Productos` VALUES ('4', 'Torre', 'ATX', '59', '68', '21', '3', '5', 'MEGASUR SA');

-- ----------------------------
-- Table structure for Stock
-- ----------------------------
DROP TABLE IF EXISTS `Stock`;
CREATE TABLE `Stock` (
  `ProdRef` int(255) unsigned NOT NULL,
  `ProdAlm` int(255) unsigned NOT NULL,
  `Stock` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`ProdRef`,`ProdAlm`),
  KEY `Alm` (`ProdAlm`),
  CONSTRAINT `Alm` FOREIGN KEY (`ProdAlm`) REFERENCES `Almacen` (`idAlmacen`),
  CONSTRAINT `Ref` FOREIGN KEY (`ProdRef`) REFERENCES `Productos` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Stock
-- ----------------------------
INSERT INTO `Stock` VALUES ('1', '2', '23');
INSERT INTO `Stock` VALUES ('1', '3', '12');
INSERT INTO `Stock` VALUES ('2', '2', '54');
INSERT INTO `Stock` VALUES ('2', '3', '10');
