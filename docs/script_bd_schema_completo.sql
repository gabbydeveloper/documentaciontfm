-- MySQL dump 10.13  Distrib 5.7.44, for Win64 (x86_64)
--
-- Host: localhost    Database: gecoecua_ecuadoradventure
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `crm_archivo_comparte`
--

DROP TABLE IF EXISTS `crm_archivo_comparte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_archivo_comparte` (
  `id_archivo_comparte` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_ARCHIVO_COMPARTE',
  `descripcion_archivo_comparte` varchar(100) DEFAULT NULL COMMENT 'Descripción del archivo que comparte',
  `nombre_archivo_comparte` varchar(256) DEFAULT NULL COMMENT 'Nombre del archivo que comparte',
  `fecha_archivo_comparte` datetime DEFAULT NULL COMMENT 'Fecha en la que el archivo se sube',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_archivo_comparte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el archivo que comparte el proveedor con su cliente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_archivo_detalle`
--

DROP TABLE IF EXISTS `crm_archivo_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_archivo_detalle` (
  `id_archivo_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_ARCHIVO_DETALLE',
  `id_detalle_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_DETALLE_CASO',
  `descripcion_archivo_detalle` varchar(256) DEFAULT NULL COMMENT 'Descripción del archivo que sube el usuario',
  `url_archivo_detalle` varchar(256) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_archivo_detalle`),
  KEY `fk_detalle_caso_a_archivo_detalle` (`id_detalle_caso`),
  CONSTRAINT `fk_detalle_caso_a_archivo_detalle` FOREIGN KEY (`id_detalle_caso`) REFERENCES `crm_detalle_caso` (`id_detalle_caso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la ruta de los archivos subidos por el usuario en casos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_area`
--

DROP TABLE IF EXISTS `crm_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla CRM_AREA',
  `descripcion_area` varchar(100) DEFAULT NULL COMMENT 'Descripción del área',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las áreas para el CRM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_caso`
--

DROP TABLE IF EXISTS `crm_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_caso` (
  `id_caso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_CASO',
  `id_telefono` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_motivo_no_aprueba_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_MOTIVO_NO_APRUEBA_CASO',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_tipo_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_TIPO_CASO',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_RESERVA',
  `estado_caso` varchar(3) DEFAULT NULL COMMENT 'Estado en el que se encuentra el caso: ',
  `observacion_resolucion` text COMMENT 'Observaciones del proceso de resolución',
  `id_usuario_envio` varchar(25) DEFAULT NULL COMMENT 'Usuario que envía el caso',
  `fecha_envio` datetime DEFAULT NULL COMMENT 'Fecha y hora de envío',
  `id_usuario_resolucion` varchar(25) DEFAULT NULL COMMENT 'Usuario que coloca la resolución del caso',
  `fecha_resolucion` datetime DEFAULT NULL COMMENT 'Fecha y hora de resolución',
  `id_usuario_aprobacion` varchar(25) DEFAULT NULL COMMENT 'Usuario que apruea el caso',
  `fecha_aprobacion` datetime DEFAULT NULL COMMENT 'Fecha y hora de aprobación del caso',
  `id_usuario_precierre` varchar(25) DEFAULT NULL COMMENT 'Usuario que genera el precierre',
  `fecha_precierre` datetime DEFAULT NULL COMMENT 'Fecha y hora del precierre',
  `id_usuario_cierre` varchar(25) DEFAULT NULL COMMENT 'Usuario que cierra el caso',
  `fecha_cierre` datetime DEFAULT NULL COMMENT 'Fecha y hora de cierre del caso',
  `id_usuario_reproceso` varchar(25) DEFAULT NULL COMMENT 'Usuario que genera el reproceso',
  `fecha_reproceso` datetime DEFAULT NULL COMMENT 'Fecha y hora del reproceso',
  `fecha_ejecucion_desde` datetime DEFAULT NULL COMMENT 'Fecha inicio en la que el personal operará sobre la agencia para resolver el problema',
  `fecha_ejecucion_hasta` datetime DEFAULT NULL COMMENT 'Fecha fin en la que el personal operará sobre la agencia para resolver el problema',
  `nro_estado` int(11) DEFAULT NULL COMMENT 'Indica en qué número de estado está para no permitir que acceda a uno que no sea el siguiente',
  `id_usuario_noaplica` varchar(25) DEFAULT NULL COMMENT 'Usuario que coloca en NO APLICA el caso',
  `fecha_noaplica` datetime DEFAULT NULL COMMENT 'Fecha en la que se coloca que el caso NO APLICA',
  `aplicacion_accedida` varchar(25) DEFAULT NULL COMMENT 'Este campo sirve para saber a qué aplicación se accedió para la última operación',
  `operacion_realizada` varchar(25) DEFAULT NULL COMMENT 'Este campo sirve para saber qué operación realizó en la aplicación accedida',
  `estado_prefactura` char(1) DEFAULT 'P' COMMENT 'Indica el estado de la pre-factura del caso P=Pendiente G=Generada R=Reversada',
  `id_usuario_envia_prefactura` varchar(25) DEFAULT NULL COMMENT 'Usuario que envía la pre-factura a revisión',
  `fecha_envia_prefactura` datetime DEFAULT NULL COMMENT 'Fecha en que se envía a revisión',
  `id_usuario_genera_prefactura` varchar(25) DEFAULT NULL COMMENT 'Usuario que genera la pre-factura',
  `fecha_genera_prefactura` datetime DEFAULT NULL COMMENT 'Fecha en que se genera la pre-factura',
  `id_usuario_reversa_prefactura` varchar(25) DEFAULT NULL COMMENT 'Usuario que reversa la pre-factura',
  `fecha_reversa_prefactura` datetime DEFAULT NULL COMMENT 'Fecha en que se reversa la pre-factura',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_caso`),
  KEY `fk_persona_a_caso` (`id_persona`),
  KEY `fk_telefono_a_caso` (`id_telefono`),
  KEY `id_motivo_no_aprueba_caso` (`id_motivo_no_aprueba_caso`),
  KEY `fk_tipo_caso_a_caso` (`id_tipo_caso`),
  KEY `fk_reserva_a_caso` (`id_reserva`),
  CONSTRAINT `fk_persona_a_caso` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_reserva_a_caso` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`),
  CONSTRAINT `fk_telefono_a_caso` FOREIGN KEY (`id_telefono`) REFERENCES `per_telefono` (`id_telefono`),
  CONSTRAINT `fk_tipo_caso_a_caso` FOREIGN KEY (`id_tipo_caso`) REFERENCES `crm_tipo_caso` (`id_tipo_caso`),
  CONSTRAINT `id_motivo_no_aprueba_caso` FOREIGN KEY (`id_motivo_no_aprueba_caso`) REFERENCES `crm_motivo_no_aprueba_caso` (`id_motivo_no_aprueba_caso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los casos que abren los clientes para res';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_caso_recurrente`
--

DROP TABLE IF EXISTS `crm_caso_recurrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_caso_recurrente` (
  `id_caso_recurrente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_CASO_RECURRENTE',
  `id_tipo_caso_recurrente` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_TIPO_CASO_RECURRENTE',
  `descripcion_caso_recurrente` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de caso',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_caso_recurrente`),
  KEY `fk_tipo_caso_recurrente_a_caso_recurrente` (`id_tipo_caso_recurrente`),
  CONSTRAINT `fk_tipo_caso_recurrente_a_caso_recurrente` FOREIGN KEY (`id_tipo_caso_recurrente`) REFERENCES `crm_tipo_caso_recurrente` (`id_tipo_caso_recurrente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los tipso de caso';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_caso_x_motivo_no_aplica`
--

DROP TABLE IF EXISTS `crm_caso_x_motivo_no_aplica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_caso_x_motivo_no_aplica` (
  `id_caso_x_motivo_no_aplica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_CASO_X_MOTIVO_NO_APLICA',
  `id_motivo_no_aprueba_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_MOTIVO_NO_APRUEBA_CASO',
  `id_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  PRIMARY KEY (`id_caso_x_motivo_no_aplica`),
  KEY `fk_caso_a_motivo_no_aplica` (`id_caso`),
  KEY `fk_motivo_no_aplica_a_caso` (`id_motivo_no_aprueba_caso`),
  CONSTRAINT `fk_caso_a_motivo_no_aplica` FOREIGN KEY (`id_caso`) REFERENCES `crm_caso` (`id_caso`),
  CONSTRAINT `fk_motivo_no_aplica_a_caso` FOREIGN KEY (`id_motivo_no_aprueba_caso`) REFERENCES `crm_motivo_no_aprueba_caso` (`id_motivo_no_aprueba_caso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todos los motivos por los cuáles no aplica un caso';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_correo_x_boton`
--

DROP TABLE IF EXISTS `crm_correo_x_boton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_correo_x_boton` (
  `id_correo_x_boton` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_CORREO_X_BOTON',
  `id_usuario` varchar(25) DEFAULT NULL COMMENT 'Clave primaria de la tabla SEG_USUARIO',
  `tipo_boton` varchar(3) DEFAULT NULL COMMENT 'El tipo del botón de la forma en el que se parametriza la persona a la que se le enviará el correo en el proceso que represente el botón',
  `correo_electronico` varchar(256) DEFAULT NULL COMMENT 'Dirección de correo electrónico o e-mail de la persona',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_correo_x_boton`),
  KEY `fk_usuario_a_correo_x_boton` (`id_usuario`),
  CONSTRAINT `fk_usuario_a_correo_x_boton` FOREIGN KEY (`id_usuario`) REFERENCES `seg_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las personas a las que se les enviará el correo en ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_detalle_caso`
--

DROP TABLE IF EXISTS `crm_detalle_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_detalle_caso` (
  `id_detalle_caso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_DETALLE_CASO',
  `id_caso_recurrente` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO_RECURRENTE',
  `id_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO',
  `id_area` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_AREA',
  `observacion_detalle_caso` text COMMENT 'Observaciones del detalle del caso',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_caso`),
  KEY `fk_caso_a_detalle_caso` (`id_caso`),
  KEY `fk_area_a_detalle_caso` (`id_area`),
  KEY `fk_caso_recurrente_a_detalle_caso` (`id_caso_recurrente`),
  CONSTRAINT `fk_area_a_detalle_caso` FOREIGN KEY (`id_area`) REFERENCES `crm_area` (`id_area`),
  CONSTRAINT `fk_caso_a_detalle_caso` FOREIGN KEY (`id_caso`) REFERENCES `crm_caso` (`id_caso`),
  CONSTRAINT `fk_caso_recurrente_a_detalle_caso` FOREIGN KEY (`id_caso_recurrente`) REFERENCES `crm_caso_recurrente` (`id_caso_recurrente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_detalle_prefactura`
--

DROP TABLE IF EXISTS `crm_detalle_prefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_detalle_prefactura` (
  `id_detalle_prefactura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_DETALLE_PREFACTURA',
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_PRODUCTO',
  `id_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO',
  `cantidad` decimal(15,4) DEFAULT NULL,
  `factor_incremento` decimal(15,4) DEFAULT NULL,
  `precio_unitario` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_prefactura`),
  KEY `fk_caso_a_dealle_prefactura` (`id_caso`),
  KEY `fk_producto_a_detalle_prefactura` (`id_producto`),
  CONSTRAINT `fk_caso_a_dealle_prefactura` FOREIGN KEY (`id_caso`) REFERENCES `crm_caso` (`id_caso`),
  CONSTRAINT `fk_producto_a_detalle_prefactura` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_detalle_valor_prefactura`
--

DROP TABLE IF EXISTS `crm_detalle_valor_prefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_detalle_valor_prefactura` (
  `id_detalle_valor_prefactura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_DETALLE_VALOR_X_ITEM_PREFACTURA',
  `id_detalle_prefactura` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_DETALLE_PREFACTURA',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_IMPUESTO',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Indica qué tipo de valor es el que está almacenado',
  `suprime_impuesto` char(1) DEFAULT NULL COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor_prefactura`),
  KEY `fk_detalle_prefactura_a_detalle_valor` (`id_detalle_prefactura`),
  KEY `FK_fk_impuesto_a_detalle_valor_prefactura` (`id_impuesto`),
  CONSTRAINT `FK_fk_impuesto_a_detalle_valor_prefactura` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_detalle_prefactura_a_detalle_valor` FOREIGN KEY (`id_detalle_prefactura`) REFERENCES `crm_detalle_prefactura` (`id_detalle_prefactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_excepcion_horario`
--

DROP TABLE IF EXISTS `crm_excepcion_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_excepcion_horario` (
  `id_excepcion_horario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_EXCEPCION_HORARIO',
  `id_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO',
  `dia` int(11) DEFAULT NULL COMMENT 'Día de la semana',
  `hora_desde` time DEFAULT NULL COMMENT 'Hora inicio del día',
  `hora_hasta` time DEFAULT NULL COMMENT 'Hora fin del día',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_excepcion_horario`),
  KEY `fk_caso_a_excepcion_horario` (`id_caso`),
  CONSTRAINT `fk_caso_a_excepcion_horario` FOREIGN KEY (`id_caso`) REFERENCES `crm_caso` (`id_caso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las horas que hay que sumar a las horas t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_fecha_corte`
--

DROP TABLE IF EXISTS `crm_fecha_corte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_fecha_corte` (
  `id_fecha_corte` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_FECHA_CORTE',
  `mes` char(2) DEFAULT NULL COMMENT 'Indica el mes en dos dígitos',
  `dia_inicio` int(11) DEFAULT NULL COMMENT 'Indica el día del mes en el que inicia la fecha de corte',
  `dia_fin` int(11) DEFAULT NULL COMMENT 'Indica el día del mes en el que inicia finaliza la fecha de corte',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_fecha_corte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_motivo_no_aprueba_caso`
--

DROP TABLE IF EXISTS `crm_motivo_no_aprueba_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_motivo_no_aprueba_caso` (
  `id_motivo_no_aprueba_caso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_MOTIVO_NO_APRUEBA_CASO',
  `descripcion_motivo_no_aprueba_caso` varchar(256) DEFAULT NULL COMMENT 'Descripcion del motivo',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_motivo_no_aprueba_caso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Motivos parametrizados que indican el porque no se aprobó un';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_parametriza_prefactura`
--

DROP TABLE IF EXISTS `crm_parametriza_prefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_parametriza_prefactura` (
  `id_parametriza_prefactura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_PARAMETRIZA_PREFACTURA',
  `id_empresa_relacionada` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRM_EMPRESA_RELACIONADA',
  `ids_origen_factura` varchar(100) DEFAULT NULL COMMENT 'Todos los tipos de origen de reserva que se pueden ver en la prefactura',
  `id_usuario_asigna_en_cierre` varchar(25) DEFAULT NULL COMMENT 'Usuario que se asigna en el cierre en el automático',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_parametriza_prefactura`),
  KEY `fk_empresa_relacionada_a_parametriza_prefactura` (`id_empresa_relacionada`),
  CONSTRAINT `fk_empresa_relacionada_a_parametriza_prefactura` FOREIGN KEY (`id_empresa_relacionada`) REFERENCES `prm_empresa_relacionada` (`id_empresa_relacionada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_persona_mensaje`
--

DROP TABLE IF EXISTS `crm_persona_mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_persona_mensaje` (
  `id_persona_mensaje` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_PERSONA_MENSAJE',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PER_PERSONA',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_persona_mensaje`),
  KEY `fk_persona_a_persona_mensaje` (`id_persona`),
  CONSTRAINT `fk_persona_a_persona_mensaje` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las personas que irán en el cuerpo del mensaje';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_personal_caso`
--

DROP TABLE IF EXISTS `crm_personal_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_personal_caso` (
  `id_personal_caso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_PERSONAL_CASO',
  `id_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PER_PERSONA',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_personal_caso`),
  KEY `fk_caso_a_personal_caso` (`id_caso`),
  KEY `fk_persona_a_personal_caso` (`id_persona`),
  CONSTRAINT `fk_caso_a_personal_caso` FOREIGN KEY (`id_caso`) REFERENCES `crm_caso` (`id_caso`),
  CONSTRAINT `fk_persona_a_personal_caso` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las personas que podrán ir a dar solución al proble';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_tipo_caso`
--

DROP TABLE IF EXISTS `crm_tipo_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_tipo_caso` (
  `id_tipo_caso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_TIPO_CASO',
  `id_origen_reserva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_ORIGEN_RESERVA',
  `descripcion_tipo_caso` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de caso',
  `principal_tipo_caso` char(1) DEFAULT NULL COMMENT 'Si es el preferido S=Si, caso contrario N=No. Solo puede haber un preferido.',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_caso`),
  KEY `fk_origen_reserva_a_tipo_caso` (`id_origen_reserva`),
  CONSTRAINT `fk_origen_reserva_a_tipo_caso` FOREIGN KEY (`id_origen_reserva`) REFERENCES `res_origen_reserva` (`id_origen_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los tipos de caso';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_tipo_caso_recurrente`
--

DROP TABLE IF EXISTS `crm_tipo_caso_recurrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_tipo_caso_recurrente` (
  `id_tipo_caso_recurrente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_TIPO_CASO_RECURRENTE',
  `descripcion_tipo_caso_recurrente` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de caso',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_caso_recurrente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los tipos de casos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_tipo_relacion_x_boton`
--

DROP TABLE IF EXISTS `crm_tipo_relacion_x_boton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_tipo_relacion_x_boton` (
  `id_tipo_relacion_x_boton` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_TIPO_RELACION_X_BOTON',
  `id_tipo_relacion` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `tipo_boton` varchar(3) DEFAULT NULL COMMENT 'El tipo del botón de la forma en el que se parametriza la persona a la que se le enviará el correo en el proceso que represente el botón',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_relacion_x_boton`),
  KEY `fk_tipo_relacion_a_tipo_relacion_x_boton` (`id_tipo_relacion`),
  CONSTRAINT `fk_tipo_relacion_a_tipo_relacion_x_boton` FOREIGN KEY (`id_tipo_relacion`) REFERENCES `per_tipo_relacion` (`id_tipo_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_tmp_caso_hora`
--

DROP TABLE IF EXISTS `crm_tmp_caso_hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_tmp_caso_hora` (
  `id_tmp_caso_hora` int(11) NOT NULL AUTO_INCREMENT,
  `id_session` varchar(256) DEFAULT NULL,
  `tipo_tmp_caso_hora` varchar(15) DEFAULT NULL,
  `descripcion_tmp_caso_hora` varchar(100) DEFAULT NULL,
  `horas_ejecucion` decimal(15,2) DEFAULT NULL,
  `nro_horas_caso` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tmp_caso_hora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla temporal para el reporte del CRM Casos por agencia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_usuario_x_proceso`
--

DROP TABLE IF EXISTS `crm_usuario_x_proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_usuario_x_proceso` (
  `id_usuario_x_proceso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRM_USUARIO_X_PROCESO',
  `id_usuario` varchar(25) DEFAULT NULL COMMENT 'Código del usuario y clave primaria de la tabla SEG_USUARIO',
  `id_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO',
  `proceso` varchar(3) DEFAULT NULL COMMENT 'Proceso en el que se encuentra el caso dependiendo del estado del mismo',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_usuario_x_proceso`),
  KEY `fk_caso_a_usuario_x_proceso` (`id_caso`),
  KEY `fk_usuario_a_usuario_x_proceso` (`id_usuario`),
  CONSTRAINT `fk_caso_a_usuario_x_proceso` FOREIGN KEY (`id_caso`) REFERENCES `crm_caso` (`id_caso`),
  CONSTRAINT `fk_usuario_a_usuario_x_proceso` FOREIGN KEY (`id_usuario`) REFERENCES `seg_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='En esta tabla se almacenan los usuarios a los que les debe aparecer el caso dependiendo del proceso en el que este se encuentre';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crt_anticipo`
--

DROP TABLE IF EXISTS `crt_anticipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crt_anticipo` (
  `id_anticipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código secuencial de la tabla',
  `id_tipo_forma_pago` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_tipo_forma_pago_compra` int(11) DEFAULT NULL,
  `id_cliente_factura` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_cuenta_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA_BANCARIA',
  `tipo_anticipo` char(1) DEFAULT NULL COMMENT 'Indica si es un anticipo cobrado C o un anticipo pagado P',
  `id_moneda_anticipo` int(11) DEFAULT NULL COMMENT 'Código de la moneda en la que se recibirá el anticipo',
  `nro_cuenta_banco` varchar(100) DEFAULT NULL COMMENT '#Cuenta banco del cheque o deposito',
  `nro_cheque` varchar(100) DEFAULT NULL COMMENT '#Cheque emitido o recibido',
  `nro_deposito` varchar(100) DEFAULT NULL COMMENT '#Depósito realizado o recibido',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `peak` varchar(100) DEFAULT NULL COMMENT 'Campo para colocar el número file del Peak',
  `observacion_pago` text,
  `fecha_anticipo` date DEFAULT NULL COMMENT 'Fecha en la que el cliente hace un anticipo',
  `fecha_sugerida_anticipo` date DEFAULT NULL COMMENT 'Fecha sugerida del pago del anticipo',
  `estado_anticipo` char(1) DEFAULT NULL COMMENT 'Indica si el anticipo está cobrado o no F=Facturado N=No Facturado',
  `id_usuario_paga` text,
  `fecha_paga` text,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_anticipo`),
  KEY `fk_reserva_a_anticipo1` (`id_reserva`),
  KEY `fk_cliente_factura_a_anticipo` (`id_cliente_factura`),
  KEY `fk_persona_a_anticipo` (`id_persona`),
  KEY `fk_proveedor_a_anticipo` (`id_proveedor`),
  KEY `fk_tp_forma_pago_a_anticipo` (`id_tipo_forma_pago`),
  KEY `fk_tp_forma_pago_compra_a_anticipo` (`id_tipo_forma_pago_compra`),
  KEY `fk_cuenta_bancaria_a_anticipo` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_cliente_factura_a_anticipo` FOREIGN KEY (`id_cliente_factura`) REFERENCES `fac_cliente_factura` (`id_cliente_factura`),
  CONSTRAINT `fk_cuenta_bancaria_a_anticipo` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `ctb_cuenta_bancaria` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_persona_a_anticipo` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_proveedor_a_anticipo` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_reserva_a_anticipo` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`),
  CONSTRAINT `fk_tp_forma_pago_a_anticipo` FOREIGN KEY (`id_tipo_forma_pago`) REFERENCES `fac_tipo_forma_pago` (`id_tipo_forma_pago`),
  CONSTRAINT `fk_tp_forma_pago_compra_a_anticipo` FOREIGN KEY (`id_tipo_forma_pago_compra`) REFERENCES `prv_tipo_forma_pago_compra` (`id_tipo_forma_pago_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=2109 DEFAULT CHARSET=latin1 COMMENT='Almacena todos los anticipos, ya sea de clientes o de provee';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crt_cobro_pago`
--

DROP TABLE IF EXISTS `crt_cobro_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crt_cobro_pago` (
  `id_cobro_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_compra` int(11) DEFAULT NULL,
  `id_cliente_factura` int(11) DEFAULT NULL,
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla RES_RESERVA',
  `tipo_cobro_pago` char(1) DEFAULT NULL,
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `estado_cobro_pago` char(1) DEFAULT 'I',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación del documento, esta fecha es modificable.',
  `genera_comprobante` char(1) DEFAULT 'S' COMMENT 'Indica S=si genera o N=no comprobante contable',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_cobro_pago`),
  KEY `fk_cliente_a_cobro_pago` (`id_cliente_factura`),
  KEY `fk_compra_a_cobro_pago` (`id_compra`),
  KEY `fk_factura_a_cobro_pago` (`id_factura`),
  KEY `fk_proveedor_a_cobro_pago` (`id_proveedor`),
  KEY `fk_reserva_a_cobro_pago` (`id_reserva`),
  CONSTRAINT `fk_cliente_a_cobro_pago` FOREIGN KEY (`id_cliente_factura`) REFERENCES `fac_cliente_factura` (`id_cliente_factura`),
  CONSTRAINT `fk_compra_a_cobro_pago` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_factura_a_cobro_pago` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_proveedor_a_cobro_pago` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_reserva_a_cobro_pago` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los datos de cobros y pagos de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crt_detalle_cobro_pago`
--

DROP TABLE IF EXISTS `crt_detalle_cobro_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crt_detalle_cobro_pago` (
  `id_detalle_cobro_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_anticipo` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_forma_pago` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_tipo_forma_pago_compra` int(11) DEFAULT NULL,
  `id_cobro_pago` int(11) DEFAULT NULL,
  `id_forma_pago_compra` int(11) DEFAULT NULL COMMENT 'Código de la tabla',
  `id_comprobante` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla CTB_COMPROBANTE',
  `id_cuenta_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA_BANCARIA',
  `nro_cuenta_banco` varchar(100) DEFAULT NULL COMMENT '#Cuenta banco del cheque o deposito',
  `nro_cheque` varchar(100) DEFAULT NULL COMMENT '#Cheque emitido o recibido',
  `nro_deposito` varchar(100) DEFAULT NULL COMMENT '#Depósito realizado o recibido',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación del documento, esta fecha es modificable.',
  `referencia` varchar(256) DEFAULT NULL,
  `cheque_cobrado` char(1) DEFAULT 'N' COMMENT 'Indica S=si un cheque fue cobrado o N=no se ha cobrado',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_cobro_pago`),
  KEY `fk_anticipo_a_det_cobro_pago` (`id_anticipo`),
  KEY `fk_cobro_pago_a_detalle` (`id_cobro_pago`),
  KEY `fk_forma_pago_compra_a_det_cobro_pago` (`id_forma_pago_compra`),
  KEY `fk_forma_pago_fac_a_det_cobro_pago` (`id_forma_pago`),
  KEY `fk_persona_a_det_cobro_pago` (`id_persona`),
  KEY `fk_tipo_forma_pago_cp_a_det_cobro_pago` (`id_tipo_forma_pago_compra`),
  KEY `fk_comprobante_a_detalle_cobro_pago` (`id_comprobante`),
  KEY `fk_cuenta_bancaria_a_det_cobro_pago` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_anticipo_a_det_cobro_pago` FOREIGN KEY (`id_anticipo`) REFERENCES `crt_anticipo` (`id_anticipo`),
  CONSTRAINT `fk_cobro_pago_a_detalle` FOREIGN KEY (`id_cobro_pago`) REFERENCES `crt_cobro_pago` (`id_cobro_pago`),
  CONSTRAINT `fk_comprobante_a_detalle_cobro_pago` FOREIGN KEY (`id_comprobante`) REFERENCES `ctb_comprobante` (`id_comprobante`),
  CONSTRAINT `fk_cuenta_bancaria_a_det_cobro_pago` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `ctb_cuenta_bancaria` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_forma_pago_compra_a_det_cobro_pago` FOREIGN KEY (`id_forma_pago_compra`) REFERENCES `prv_forma_pago_compra` (`id_forma_pago_compra`),
  CONSTRAINT `fk_forma_pago_fac_a_det_cobro_pago` FOREIGN KEY (`id_forma_pago`) REFERENCES `fac_forma_pago` (`id_forma_pago`),
  CONSTRAINT `fk_persona_a_det_cobro_pago` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tipo_forma_pago_cp_a_det_cobro_pago` FOREIGN KEY (`id_tipo_forma_pago_compra`) REFERENCES `prv_tipo_forma_pago_compra` (`id_tipo_forma_pago_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el detalle del cobro o del pago realizado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crt_multiple_cobro_pago`
--

DROP TABLE IF EXISTS `crt_multiple_cobro_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crt_multiple_cobro_pago` (
  `id_multiple_cobro_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CRT_MULTIPLE_COBRO_PAGO',
  `id_factura` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_compra` int(11) DEFAULT NULL,
  `id_cobro_pago` int(11) DEFAULT NULL COMMENT 'Código de la tabla CRT_COBRO_PAGO',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_multiple_cobro_pago`),
  KEY `fk_cobro_pago_a_multcobropago` (`id_cobro_pago`),
  KEY `fk_compra_a_multcobropago` (`id_compra`),
  KEY `fk_factura_a_multcobropago` (`id_factura`),
  CONSTRAINT `fk_cobro_pago_a_multcobropago` FOREIGN KEY (`id_cobro_pago`) REFERENCES `crt_cobro_pago` (`id_cobro_pago`),
  CONSTRAINT `fk_compra_a_multcobropago` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_factura_a_multcobropago` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las facturas de ventas y compras que se pagaron con un solo pago y un solo asiento en contabilidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_archivo_comprobante`
--

DROP TABLE IF EXISTS `ctb_archivo_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_archivo_comprobante` (
  `id_archivo_comprobante` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_ARCHIVO_COMPROBANTE',
  `id_comprobante` int(11) DEFAULT NULL,
  `descripcion_archivo_comprobante` varchar(256) DEFAULT NULL COMMENT 'Descripción corta del archivo',
  `tipo_archivo` varchar(3) DEFAULT NULL COMMENT 'Tipo de archivo que se está ingresando TXT=Texto, IMG=Imagen',
  `nombre_archivo` varchar(100) DEFAULT NULL COMMENT 'Nombre del archivo donde está grabado el objeto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_archivo_comprobante`),
  KEY `fk_comprobante_a_archivo_comprobante` (`id_comprobante`),
  CONSTRAINT `fk_comprobante_a_archivo_comprobante` FOREIGN KEY (`id_comprobante`) REFERENCES `ctb_comprobante` (`id_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los archivos que sirven de sustento a la transacción contable';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_caja_chica`
--

DROP TABLE IF EXISTS `ctb_caja_chica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_caja_chica` (
  `id_caja_chica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CAJA_CHICA',
  `id_centro_costo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CENTRO_COSTO',
  `id_usuario` varchar(25) DEFAULT NULL COMMENT 'Clave primaria de la tabla SEG_USUARIO',
  `descripcion_caja_chica` varchar(100) DEFAULT NULL,
  `monto_caja_chica` decimal(15,4) DEFAULT NULL,
  `monto_minimo_permitido` decimal(15,4) DEFAULT NULL COMMENT 'Monto mínimo que se permite dejar en Caja Chica',
  `estado_caja_chica` char(1) DEFAULT 'I' COMMENT 'Indica si está A=Activa o I=Inactiva',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_caja_chica`),
  KEY `fk_centro_costo_a_caja_chica` (`id_centro_costo`),
  KEY `fk_usuario_a_caja_chica` (`id_usuario`),
  CONSTRAINT `fk_centro_costo_a_caja_chica` FOREIGN KEY (`id_centro_costo`) REFERENCES `ctb_centro_costo` (`id_centro_costo`),
  CONSTRAINT `fk_usuario_a_caja_chica` FOREIGN KEY (`id_usuario`) REFERENCES `seg_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena la configuración inicial de la Caja Chica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_centro_costo`
--

DROP TABLE IF EXISTS `ctb_centro_costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_centro_costo` (
  `id_centro_costo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CENTRO_COSTO',
  `descripcion_centro_costo` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_centro_costo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los centros de costo del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cheque_anulado`
--

DROP TABLE IF EXISTS `ctb_cheque_anulado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cheque_anulado` (
  `id_cheque_anulado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CHEQUE_ANULADO',
  `id_chequera` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CHEQUERA',
  `id_motivo` int(11) DEFAULT NULL,
  `nro_cheque_anulado` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cheque_anulado`),
  KEY `fk_chequera_a_cheque_anulado` (`id_chequera`),
  KEY `fk_motivo_a_cheque_anulado` (`id_motivo`),
  CONSTRAINT `fk_chequera_a_cheque_anulado` FOREIGN KEY (`id_chequera`) REFERENCES `ctb_chequera` (`id_chequera`),
  CONSTRAINT `fk_motivo_a_cheque_anulado` FOREIGN KEY (`id_motivo`) REFERENCES `prm_motivo` (`id_motivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_chequera`
--

DROP TABLE IF EXISTS `ctb_chequera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_chequera` (
  `id_chequera` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CHEQUERA',
  `id_cuenta_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA_BANCARIA',
  `nro_cheque_inicio` int(11) DEFAULT NULL,
  `nro_cheque_fin` int(11) DEFAULT NULL,
  `estado_chequera` char(3) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_chequera`),
  KEY `fk_cuenta_bancaria_a_chequera` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_cuenta_bancaria_a_chequera` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `ctb_cuenta_bancaria` (`id_cuenta_bancaria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cierre_contable`
--

DROP TABLE IF EXISTS `ctb_cierre_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cierre_contable` (
  `id_cierre_contable` int(11) NOT NULL AUTO_INCREMENT,
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha en la que se genera el cierre contable',
  `cierra_cuentas_ingreso` char(1) DEFAULT NULL COMMENT 'Indica si el sistema debe hacer S=si o N=no el cierre de las cuentas de ingresos',
  `cierra_cuentas_gasto` char(1) DEFAULT NULL COMMENT 'Indica si el sistema debe hacer S=si o N=no el cierre de las cuentas de gastos',
  `cierra_cuentas_costo` char(1) DEFAULT NULL COMMENT 'Indica si el sistema debe hacer S=si o N=no el cierre de las cuentas de costo tanto de ventas como de producción',
  `cierra_utilidad_perdida` char(1) DEFAULT NULL COMMENT 'Indica si el sistema debe hacer S=si o N=no el cierre de la cuenta de utilidad y/o pérdida',
  `estado_cierre_contable` char(1) DEFAULT NULL COMMENT 'Indica si el cierre está P=pendiente o ya se ha C=cerrado',
  `crea_asiento_participacion` char(1) DEFAULT NULL COMMENT 'Indiica S=si crea o N=no el asiento o comprobante contable de la participación a trabajadores',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cierre_contable`),
  KEY `fk_periodo_a_cierre_contable` (`id_periodo`),
  CONSTRAINT `fk_periodo_a_cierre_contable` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_clase_comprobante`
--

DROP TABLE IF EXISTS `ctb_clase_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_clase_comprobante` (
  `id_clase_comprobante` char(4) NOT NULL COMMENT 'Clave primaria de la tabla CTB_CLASE_COMPROBANTE',
  `descripcion_clase_comprobante` varchar(150) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_clase_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_codigo_contable`
--

DROP TABLE IF EXISTS `ctb_codigo_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_codigo_contable` (
  `id_codigo_contable` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CODIGO_CONTABLE',
  `nivel1` int(11) DEFAULT NULL,
  `nivel2` int(11) DEFAULT NULL,
  `nivel3` int(11) DEFAULT NULL,
  `nivel4` int(11) DEFAULT NULL,
  `nivel5` int(11) DEFAULT NULL,
  `nivel6` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `pasivo` int(11) DEFAULT NULL,
  `patrimonio` int(11) DEFAULT NULL,
  `ingreso` int(11) DEFAULT NULL,
  `egreso` int(11) DEFAULT NULL,
  `costo_ventas` int(11) DEFAULT NULL,
  `costo_produccion` int(11) DEFAULT NULL,
  `orden_deudora` int(11) DEFAULT NULL,
  `orden_acreedora` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(15) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(15) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_codigo_contable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_codigo_retencion_iva`
--

DROP TABLE IF EXISTS `ctb_codigo_retencion_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_codigo_retencion_iva` (
  `id_codigo_retencion_iva` varchar(4) NOT NULL COMMENT 'Clave primaria de la tabla CTB_CODIGO_RETENCION_IVA',
  `descripcion_codigo_retencion_iva` varchar(100) DEFAULT NULL COMMENT 'Descripción del código de la retención del IVA',
  `codigo_retencion_iva` varchar(15) DEFAULT NULL COMMENT 'Código para equiparar en los formularios del SRI',
  `estado_codigo_retencion_iva` char(1) DEFAULT NULL COMMENT 'Estado del código de la retención del IVA',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_codigo_retencion_iva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los códigos de retención del IVA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_comprobante`
--

DROP TABLE IF EXISTS `ctb_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_comprobante` (
  `id_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_RESERVA',
  `id_periodo` int(11) DEFAULT NULL,
  `id_tipo_comprobante` int(11) NOT NULL COMMENT 'Código secuencial de la tabla',
  `id_tipo_documento` char(4) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_DOCUMENTO',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PER_PERSONA',
  `codigo_contable` varchar(100) DEFAULT NULL,
  `concepto` text,
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación del documento, esta fecha es modificable.',
  `tipo_origen` varchar(4) DEFAULT NULL,
  `id_origen` varchar(15) DEFAULT NULL,
  `estado_comprobante` char(1) DEFAULT 'I' COMMENT 'Estados que puede tomar el comprobante contable: C=Ingresado,M=Mayorizado,X=anulado',
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `tipo_beneficiario` char(1) DEFAULT NULL COMMENT 'Indica el tipo de beneficiario que es el sujeto del comprobante',
  `nro_documento` varchar(100) DEFAULT NULL,
  `tipo_comprobante` char(1) DEFAULT NULL,
  `nro_comprobante` varchar(100) DEFAULT NULL,
  `secuencial` int(11) DEFAULT NULL,
  `motivo_anulacion` text COMMENT 'Motivo por el cual se anula el comprobante',
  `reversado` char(1) DEFAULT 'N' COMMENT 'Indica S=si el comprobante ha sido o N=no reversado',
  `id_comprobante_valido` int(11) DEFAULT NULL COMMENT 'Indica el código del comprobante que se generó reemplazando el actual',
  `id_comprobante_reversado` int(11) DEFAULT NULL COMMENT 'Indica el código del comprobante que se reversó con el actual',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_comprobante`),
  UNIQUE KEY `idx_codigo_contable` (`codigo_contable`),
  KEY `fk_periodo_compr_cntble` (`id_periodo`),
  KEY `fk_reserva_a_comprobante` (`id_reserva`),
  KEY `fk_tpcmpcnt_a_cmpcnt` (`id_tipo_comprobante`),
  KEY `fk_tipo_documento_a_comprobante` (`id_tipo_documento`),
  KEY `fk_persona_a_comprobante` (`id_persona`),
  CONSTRAINT `fk_periodo_compr_cntble` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`),
  CONSTRAINT `fk_persona_a_comprobante` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_reserva_a_comprobante` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`),
  CONSTRAINT `fk_tipo_documento_a_comprobante` FOREIGN KEY (`id_tipo_documento`) REFERENCES `ctb_tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `fk_tpcmpcnt_a_cmpcnt` FOREIGN KEY (`id_tipo_comprobante`) REFERENCES `ctb_tipo_comprobante` (`id_tipo_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las cabeceras de los comprobantes contabl';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bi_coloca_codcontable` BEFORE INSERT ON `ctb_comprobante` FOR EACH ROW BEGIN
	DECLARE vcCodigoLetras VARCHAR(4);
	DECLARE vcCodigoFecha VARCHAR(50);
	DECLARE vnSecuencial INT;
	DECLARE vcCodigoNumerico VARCHAR(120);
	DECLARE vcCodigoContable VARCHAR(120);
	DECLARE vcCodigoEspecial VARCHAR(6);
  
  SELECT t.codigo_letras 
    INTO vcCodigoLetras
		FROM ctb_tipo_comprobante t 
	 WHERE t.id_tipo_comprobante = new.id_tipo_comprobante;  
  
  SELECT IFNULL(MAX(c.secuencial), 0) + 1
    INTO vnSecuencial
		FROM ctb_comprobante c 
	 WHERE c.fecha_generacion = new.fecha_generacion;
	
	SELECT parametro_texto
		INTO vcCodigoEspecial
		FROM ctb_parametro
	 WHERE id_periodo = new.id_periodo
		 AND id_tipo_parametro = 'ECD';

  SET vcCodigoFecha = DATE_FORMAT(new.fecha_generacion, '%Y%m%d');    
  SET vcCodigoNumerico = LPAD(vnSecuencial, 4, '0');
  IF vcCodigoEspecial IS NOT NULL THEN  
		SET vcCodigoContable = CONCAT(vcCodigoLetras, vcCodigoFecha, vcCodigoEspecial, vcCodigoNumerico);
	ELSE
		SET vcCodigoContable = CONCAT(vcCodigoLetras, vcCodigoFecha, vcCodigoNumerico);
	END IF;
  
  
  SET new.codigo_contable = vcCodigoContable;
  SET new.secuencial = vnSecuencial;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bu_coloca_codcontable` BEFORE UPDATE ON `ctb_comprobante` FOR EACH ROW BEGIN
	DECLARE vcCodigoLetras VARCHAR(4);
	DECLARE vcCodigoFecha VARCHAR(50);
	DECLARE vnSecuencial INT;
	DECLARE vcCodigoNumerico VARCHAR(120);
	DECLARE vcCodigoContable VARCHAR(120);
	DECLARE vcCodigoEspecial VARCHAR(6);

  IF((new.id_tipo_comprobante != old.id_tipo_comprobante) OR (new.fecha_generacion != old.fecha_generacion))
  THEN
		SELECT t.codigo_letras 
			INTO vcCodigoLetras
			FROM ctb_tipo_comprobante t 
		 WHERE t.id_tipo_comprobante = new.id_tipo_comprobante;  
		
		SELECT IFNULL(MAX(c.secuencial), 0) + 1
			INTO vnSecuencial
			FROM ctb_comprobante c 
		 WHERE c.fecha_generacion = new.fecha_generacion;
		
		SELECT parametro_texto
			INTO vcCodigoEspecial
			FROM ctb_parametro
		 WHERE id_periodo = new.id_periodo
			 AND id_tipo_parametro = 'ECD';

		SET vcCodigoFecha = DATE_FORMAT(new.fecha_generacion, '%Y%m%d');    
		SET vcCodigoNumerico = LPAD(vnSecuencial, 4, '0');  
		IF vcCodigoEspecial IS NOT NULL THEN  
			SET vcCodigoContable = CONCAT(vcCodigoLetras, vcCodigoFecha, vcCodigoEspecial, vcCodigoNumerico);
		ELSE
			SET vcCodigoContable = CONCAT(vcCodigoLetras, vcCodigoFecha, vcCodigoNumerico);
		END IF;
		
		
		SET new.codigo_contable = vcCodigoContable;
		SET new.secuencial = vnSecuencial;
	END IF;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ctb_concepto_retencion`
--

DROP TABLE IF EXISTS `ctb_concepto_retencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_concepto_retencion` (
  `id_concepto_retencion` varchar(15) NOT NULL COMMENT 'Clave primaria de la tabla CTB_CONCEPTO_RETENCION',
  `id_tipo_retencion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `descripcion_concepto_retencion` varchar(256) DEFAULT NULL COMMENT 'Descripción del concepto de retención',
  `estado_concepto_retencion` char(1) DEFAULT 'A' COMMENT 'Estado que indica si aún está activo este item para el SRI',
  `mil_porciento` char(1) DEFAULT 'N' COMMENT 'Marca que le indica al sistema que debe dividir para 10 la base imponible',
  `porcentaje` decimal(15,8) DEFAULT '0.00000000' COMMENT 'Porcentaje que se aplica',
  `porcentajes_permitidos` varchar(50) DEFAULT NULL COMMENT 'Porcentajes permitidos, valores separados por punto y coma',
  `aplica_no_sujeto` char(1) DEFAULT 'N' COMMENT 'Indica si este concepto aplica para los NO SUJETOS a retención',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_concepto_retencion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los conceptos de retención autorizados por el SRI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_conciliacion_bancaria`
--

DROP TABLE IF EXISTS `ctb_conciliacion_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_conciliacion_bancaria` (
  `id_conciliacion_bancaria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CONCILIACION_BANCARIA',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA_BANCARIA',
  `estado_conciliacion_bancaria` varchar(3) DEFAULT NULL COMMENT 'Estado de la conciliación bancaria ING=Ingresada, CER=Cerrada',
  `fecha_desde` date DEFAULT NULL COMMENT 'Fecha de inicio de la conciliación bancaria',
  `fecha_hasta` date DEFAULT NULL COMMENT 'Fecha fin de la conciliación bancaria',
  `saldo_estado_cuenta` decimal(15,4) DEFAULT NULL COMMENT 'Saldo del estado de cuenta en esas fechas',
  `observacion_conciliacion_bancaria` varchar(256) DEFAULT NULL COMMENT 'Observación conciliación bancaria',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_conciliacion_bancaria`),
  KEY `FK_ctb_cuenta_bancaria_a_conciliacion` (`id_cuenta_bancaria`),
  KEY `fk_periodo_a_conciliacion_bancaria` (`id_periodo`),
  CONSTRAINT `FK_ctb_cuenta_bancaria_a_conciliacion` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `ctb_cuenta_bancaria` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_periodo_a_conciliacion_bancaria` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las fechas en las que se realiza la conciliación bancaria y cualquier observación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cotizacion_moneda`
--

DROP TABLE IF EXISTS `ctb_cotizacion_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cotizacion_moneda` (
  `id_cotizacion_moneda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código secuencial de la tabla',
  `id_moneda` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `fecha_cotizacion_moneda` date DEFAULT NULL COMMENT 'Fecha en la que se realiza la cotización',
  `valor_cotizacion_moneda` decimal(15,4) DEFAULT NULL COMMENT 'Valor de la cotización con referencia a la moneda principal',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_cotizacion_moneda`),
  KEY `fk_moneda_a_cotizacion` (`id_moneda`),
  CONSTRAINT `fk_moneda_a_cotizacion` FOREIGN KEY (`id_moneda`) REFERENCES `prm_moneda` (`id_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el histórico de la cotización de monedas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cuenta`
--

DROP TABLE IF EXISTS `ctb_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cuenta` (
  `id_periodo` int(11) NOT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PER_PERSONA',
  `id_tipo_cuenta` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_CUENTA',
  `id_cuenta_padre` int(11) DEFAULT NULL,
  `nombre_cuenta` varchar(100) DEFAULT NULL COMMENT 'Nombre de la cuenta contable',
  `descripcion_cuenta` text,
  `codigo_contable` varchar(100) DEFAULT NULL,
  `movimiento` char(1) DEFAULT NULL,
  `naturaleza` char(1) DEFAULT NULL,
  `bancos` char(1) DEFAULT NULL,
  `es_de_retencion` char(1) DEFAULT NULL,
  `tipo_retencion` char(1) DEFAULT NULL,
  `porcentaje_retencion` decimal(15,4) DEFAULT NULL,
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `estado_cuenta` char(1) DEFAULT NULL,
  `tipo_cuenta_reporte` varchar(3) DEFAULT NULL COMMENT 'Indica que tipo de cuenta es para usar en reportes',
  `es_gasto_no_deducible` char(1) DEFAULT 'N' COMMENT 'Indica si es un gasto no deducible local',
  `es_gasto_asignado_ext` char(1) DEFAULT 'N' COMMENT 'Indica si es un gasto asignado del exterior',
  `es_padre` char(1) DEFAULT 'N' COMMENT 'Identifica si la cuenta es padre o no',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_cuenta`),
  UNIQUE KEY `idx_codigo_contable` (`id_periodo`,`codigo_contable`),
  KEY `fk_tpcta_a_cuenta` (`id_tipo_cuenta`),
  KEY `fk_persona_a_cuenta` (`id_persona`),
  CONSTRAINT `fk_periodo_a_cuenta` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`),
  CONSTRAINT `fk_persona_a_cuenta` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tpcta_a_cuenta` FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `ctb_tipo_cuenta` (`id_tipo_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las cuentas contables con las que trabajará la cont';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cuenta_bancaria`
--

DROP TABLE IF EXISTS `ctb_cuenta_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cuenta_bancaria` (
  `id_cuenta_bancaria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CUENTA_BANCARIA',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PER_PERSONA',
  `tipo_cuenta_bancaria` char(1) DEFAULT NULL COMMENT 'Indica si es A=Ahorros o C=Corriente',
  `numero_cuenta_bancaria` varchar(25) DEFAULT NULL COMMENT 'Número de cuenta bancaria',
  `fecha_apertura` date DEFAULT NULL COMMENT 'Fecha en la que se aperturó la cuenta',
  `fecha_cierre` date DEFAULT NULL COMMENT 'Fecha de cierre de la cuenta',
  `observacion_cuenta_bancaria` varchar(256) DEFAULT NULL COMMENT 'Cualquier observación necesaria',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Último usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Última fecha en la que se modifica el registro',
  PRIMARY KEY (`id_cuenta_bancaria`),
  KEY `fk_persona_a_cuenta_bancaria` (`id_persona`),
  CONSTRAINT `fk_persona_a_cuenta_bancaria` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las cuentas bancarias del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cuenta_general`
--

DROP TABLE IF EXISTS `ctb_cuenta_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cuenta_general` (
  `id_cuenta_general` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta` int(11) DEFAULT NULL,
  `id_tipo_cuenta_general` char(4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_general`),
  KEY `fk_cuenta_a_cuenta_general` (`id_cuenta`),
  KEY `fk_tipo_cuenta_general_a_cuenta_general` (`id_tipo_cuenta_general`),
  CONSTRAINT `fk_cuenta_a_cuenta_general` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_tipo_cuenta_general_a_cuenta_general` FOREIGN KEY (`id_tipo_cuenta_general`) REFERENCES `ctb_tipo_cuenta_general` (`id_tipo_cuenta_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las cuentas genéricas para las diferentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cuenta_x_caja_chica`
--

DROP TABLE IF EXISTS `ctb_cuenta_x_caja_chica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cuenta_x_caja_chica` (
  `id_cuenta_x_caja_chica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CUENTA_X_CAJA_CHICA',
  `id_periodo` int(11) DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `id_caja_chica` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CAJA_CHICA',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_x_caja_chica`),
  KEY `fk_caja_chica_a_cuenta` (`id_caja_chica`),
  KEY `fk_cuenta_a_caja_chica` (`id_cuenta`),
  KEY `fk_periodo_a_cuenta_x_centro_costo` (`id_periodo`),
  CONSTRAINT `fk_caja_chica_a_cuenta` FOREIGN KEY (`id_caja_chica`) REFERENCES `ctb_caja_chica` (`id_caja_chica`),
  CONSTRAINT `fk_cuenta_a_caja_chica` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_periodo_a_cuenta_x_centro_costo` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las diferentes cuentas que se usan en cada caja chica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_cuenta_x_cuenta_bancaria`
--

DROP TABLE IF EXISTS `ctb_cuenta_x_cuenta_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_cuenta_x_cuenta_bancaria` (
  `id_cuenta_x_cuenta_bancaria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_CUENTA_X_CUENTA_BANCARIA',
  `id_cuenta` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `id_cuenta_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA_BANCARIA',
  `id_periodo` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_x_cuenta_bancaria`),
  UNIQUE KEY `idx_unk_cuenta_x_periodo_ctabco` (`id_cuenta_bancaria`,`id_periodo`),
  KEY `fk_cuenta_a_cuenta_bancaria` (`id_cuenta`),
  KEY `fk_periodo_a_cuenta_x_cuenta_bancaria` (`id_periodo`),
  CONSTRAINT `fk_cuenta_a_cuenta_bancaria` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_cuenta_bancaria_a_cuenta` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `ctb_cuenta_bancaria` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_periodo_a_cuenta_x_cuenta_bancaria` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las cuentas contables por periodo de las cuentas_bancarias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_det_comprobante`
--

DROP TABLE IF EXISTS `ctb_det_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_det_comprobante` (
  `id_det_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta` int(11) DEFAULT NULL,
  `id_comprobante` int(11) DEFAULT NULL,
  `id_det_conciliacion_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_DET_CONCILIACION_BANCARIA',
  `debe` decimal(15,4) DEFAULT NULL,
  `haber` decimal(15,4) DEFAULT NULL,
  `conciliado` char(1) DEFAULT 'N',
  `tipo_referencia` varchar(4) DEFAULT NULL COMMENT 'Indica que tipo de documento es, CP=Compra, FV=Factura venta',
  `id_referencia` varchar(100) DEFAULT NULL COMMENT 'Indica el código del documento de orgien #Factura, #Compra',
  `orden` int(11) DEFAULT NULL COMMENT 'Orden de las líneas del comprobante',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_det_comprobante`),
  KEY `fk_compcnt_a_detcompcnt` (`id_comprobante`),
  KEY `fk_cuenta_a_detcmpcnt` (`id_cuenta`),
  KEY `fk_det_conc_banc_a_det_comprobante` (`id_det_conciliacion_bancaria`),
  CONSTRAINT `fk_compcnt_a_detcompcnt` FOREIGN KEY (`id_comprobante`) REFERENCES `ctb_comprobante` (`id_comprobante`),
  CONSTRAINT `fk_cuenta_a_detcmpcnt` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_det_conc_banc_a_det_comprobante` FOREIGN KEY (`id_det_conciliacion_bancaria`) REFERENCES `ctb_det_conciliacion_bancaria` (`id_det_conciliacion_bancaria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_det_conciliacion_bancaria`
--

DROP TABLE IF EXISTS `ctb_det_conciliacion_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_det_conciliacion_bancaria` (
  `id_det_conciliacion_bancaria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_DET_CONCILIACION_BANCARIA',
  `id_conciliacion_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CONCILIACION_BANCARIA',
  `id_detalle_cobro_pago` int(11) DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `descripcion_conciliacion_bancaria` text COMMENT 'Descripción de la transacción',
  `fecha` date DEFAULT NULL COMMENT 'Fecha en la que se realiza la transacción',
  `tipo_documento` varchar(4) DEFAULT NULL COMMENT 'Tipo de documento de la conciliación bancaria NDEB/NCRE',
  `nro_documento` varchar(100) DEFAULT NULL COMMENT 'Número del documento de la transacción',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Monto del movimiento',
  `movimiento_conciliado` char(1) DEFAULT NULL COMMENT 'Indica S=si fue o N=no conciliado el movimiento',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_det_conciliacion_bancaria`),
  KEY `fk_conciliacion_bancaaria_a_det_conciliacion_bancaria` (`id_conciliacion_bancaria`),
  KEY `fk_detalle_cobro_pago_a_det_conciliacion_bancaria` (`id_detalle_cobro_pago`),
  KEY `fk_cuenta_a_det_conciliacion_bancaria` (`id_cuenta`),
  CONSTRAINT `fk_conciliacion_bancaaria_a_det_conciliacion_bancaria` FOREIGN KEY (`id_conciliacion_bancaria`) REFERENCES `ctb_conciliacion_bancaria` (`id_conciliacion_bancaria`),
  CONSTRAINT `fk_cuenta_a_det_conciliacion_bancaria` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_detalle_cobro_pago_a_det_conciliacion_bancaria` FOREIGN KEY (`id_detalle_cobro_pago`) REFERENCES `crt_detalle_cobro_pago` (`id_detalle_cobro_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los movimientos subidos de la cuenta bancaria respectiva para conciliarlos con los movimientos internos del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_detalle_liq_caja_chica`
--

DROP TABLE IF EXISTS `ctb_detalle_liq_caja_chica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_detalle_liq_caja_chica` (
  `id_detalle_liq_caja_chica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_DETALLE_CAJA_CHICA',
  `id_compra` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRV_COMPRA',
  `id_liquidacion_caja_chica` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_LIQUIDACION_CAJA_CHICA',
  `descripcion_detalle_liq_caja_chica` varchar(256) DEFAULT NULL COMMENT 'Descripción del detalle sin sustento',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor del detalle de la caja chica',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Último usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Última fecha de modificación dle registro',
  PRIMARY KEY (`id_detalle_liq_caja_chica`),
  KEY `FK_Reference_385` (`id_compra`),
  KEY `fk_liquidacion_cc_a_detalle` (`id_liquidacion_caja_chica`),
  CONSTRAINT `FK_Reference_385` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_liquidacion_cc_a_detalle` FOREIGN KEY (`id_liquidacion_caja_chica`) REFERENCES `ctb_liquidacion_caja_chica` (`id_liquidacion_caja_chica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los detalles de la liquidación de una caja chica en un periodo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_detalle_retencion`
--

DROP TABLE IF EXISTS `ctb_detalle_retencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_detalle_retencion` (
  `id_detalle_retencion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla CTB_DETALLE_RETENCION',
  `id_tipo_retencion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `id_retencion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_RETENCION',
  `id_det_comprobante` int(11) DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `valor_retencion` decimal(15,4) DEFAULT NULL COMMENT 'Valor retenido',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base sobre la que se calcula el impuesto',
  `porcentaje` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje en cantidad entera',
  `concepto_ret_ats` varchar(10) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_retencion`),
  KEY `fk_det_comprb_a_det_reten` (`id_det_comprobante`),
  KEY `fk_retencion_a_det_retencion` (`id_retencion`),
  KEY `fk_tipo_retencion_a_det_retencion` (`id_tipo_retencion`),
  KEY `fk_cuenta_a_det_retencion` (`id_cuenta`),
  CONSTRAINT `fk_cuenta_a_det_retencion` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_det_comprb_a_det_reten` FOREIGN KEY (`id_det_comprobante`) REFERENCES `ctb_det_comprobante` (`id_det_comprobante`),
  CONSTRAINT `fk_retencion_a_det_retencion` FOREIGN KEY (`id_retencion`) REFERENCES `ctb_retencion` (`id_retencion`),
  CONSTRAINT `fk_tipo_retencion_a_det_retencion` FOREIGN KEY (`id_tipo_retencion`) REFERENCES `ctb_tipo_retencion` (`id_tipo_retencion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el detalle de las retenciones del asiento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_historico_mayorizacion`
--

DROP TABLE IF EXISTS `ctb_historico_mayorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_historico_mayorizacion` (
  `id_historico_mayorizacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_comprobante` int(11) DEFAULT NULL,
  `estado_mayorizacion` char(1) DEFAULT NULL,
  `motivo_desmayorizacion` text,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  PRIMARY KEY (`id_historico_mayorizacion`),
  KEY `fk_comprobante_a_hist_mayor` (`id_comprobante`),
  CONSTRAINT `fk_comprobante_a_hist_mayor` FOREIGN KEY (`id_comprobante`) REFERENCES `ctb_comprobante` (`id_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_impuesto_x_utilidad`
--

DROP TABLE IF EXISTS `ctb_impuesto_x_utilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_impuesto_x_utilidad` (
  `id_impuesto_x_utilidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_IMPUESTO_X_UTILIDAD',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `fraccion_basica` decimal(15,4) DEFAULT NULL COMMENT 'Valor desde para el cálculo del impuesto',
  `exceso_hasta` decimal(15,4) DEFAULT NULL COMMENT 'Valor hasta para el cálculo del impuesto',
  `imp_fraccion_basica` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad que se suma para el cálculo del impuesto',
  `imp_fraccion_exceso` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del cálculo del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_impuesto_x_utilidad`),
  KEY `fk_periodo_a_impuestoxutilidad` (`id_periodo`),
  CONSTRAINT `fk_periodo_a_impuestoxutilidad` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Tabla que describe la estructura impositiva del SRI con los porcentajes que se pagan de impuesto y renta de acuerdo a cada rango de utilidad del ejercicio, esta configuración se hace por periodo contable.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_linea_reporte`
--

DROP TABLE IF EXISTS `ctb_linea_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_linea_reporte` (
  `id_linea_reporte` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_LINEA_REPORTE',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `tipo_reporte` varchar(3) DEFAULT NULL COMMENT 'Aquí se coloca el tipo de reporte contable donde debe salir el valor de la cuenta',
  `linea_reporte` varchar(100) DEFAULT NULL COMMENT 'Aquí se coloca el número de la línea del reporte contable donde debe salir el valor de la cuenta',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_linea_reporte`),
  KEY `fk_cuenta_a_linea_reporte` (`id_cuenta`),
  CONSTRAINT `fk_cuenta_a_linea_reporte` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el código de línea en la que el saldo de la cuenta aparecerá en un determinado reporte';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_liquidacion_caja_chica`
--

DROP TABLE IF EXISTS `ctb_liquidacion_caja_chica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_liquidacion_caja_chica` (
  `id_liquidacion_caja_chica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_LIQUIDACION_CAJA_CHICA',
  `id_caja_chica` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CAJA_CHICA',
  `fecha_desde` date DEFAULT NULL COMMENT 'Fecha desde la que se hace la liquidación',
  `fecha_hasta` date DEFAULT NULL COMMENT 'Fecha hasta la que se hace la liquidación',
  `observacion_liquidacion_caja_chica` varchar(256) DEFAULT NULL COMMENT 'Observación de esta liquidación de caja chica',
  `saldo_anterior` decimal(15,4) DEFAULT NULL COMMENT 'Saldo anterior',
  `saldo_actual` decimal(15,4) DEFAULT NULL COMMENT 'Saldo de esta liquidación',
  `total_compras` decimal(15,4) DEFAULT NULL COMMENT 'Diferencia',
  `estado_liquidacion_caja_chica` char(3) DEFAULT 'PEN' COMMENT 'Indica si está LIQ=Liquidada o PEN=Pendiente de liquidar',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Último usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Última fecha de modificación del registro',
  PRIMARY KEY (`id_liquidacion_caja_chica`),
  KEY `fk_caja_chica_a_liquidacion` (`id_caja_chica`),
  CONSTRAINT `fk_caja_chica_a_liquidacion` FOREIGN KEY (`id_caja_chica`) REFERENCES `ctb_caja_chica` (`id_caja_chica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el estado, las fechas, la observación de la liquidación actual de la caja chica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_lote_envio_sri`
--

DROP TABLE IF EXISTS `ctb_lote_envio_sri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_lote_envio_sri` (
  `id_lote_envio_sri` int(11) NOT NULL AUTO_INCREMENT,
  `id_retencion` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_nota_credito` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_NOTA_CREDITO',
  `nombre_archivo` varchar(256) DEFAULT NULL,
  `clave_acceso` varchar(256) DEFAULT NULL,
  `usuario_crea_documento` varchar(25) DEFAULT NULL,
  `nombre_cliente` varchar(256) DEFAULT NULL,
  `email_cliente` varchar(256) DEFAULT NULL,
  `estado_lote_envio_sri` char(3) DEFAULT 'PEN',
  `estado_xml_firmado` char(3) DEFAULT 'PEN',
  `estado_envio_correo` char(3) DEFAULT 'PEN',
  `error_sri` text,
  `fecha_procesamiento` datetime DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_lote_envio_sri`),
  KEY `fk_compra_a_lote_envio_sri` (`id_retencion`),
  KEY `fk_factura_a_lote_envio_sri` (`id_factura`),
  KEY `fk_nota_credito_a_lote_envio_sri` (`id_nota_credito`),
  CONSTRAINT `fk_compra_a_lote_envio_sri` FOREIGN KEY (`id_retencion`) REFERENCES `ctb_retencion` (`id_retencion`),
  CONSTRAINT `fk_factura_a_lote_envio_sri` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_nota_credito_a_lote_envio_sri` FOREIGN KEY (`id_nota_credito`) REFERENCES `fac_nota_credito` (`id_nota_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla en la que se almacenan los datos de los documentos que';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_nombre_alternativo`
--

DROP TABLE IF EXISTS `ctb_nombre_alternativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_nombre_alternativo` (
  `id_nombre_alternativo` int(11) NOT NULL AUTO_INCREMENT,
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta` int(11) DEFAULT NULL,
  `descripcion_nombre_alternativo` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_nombre_alternativo`),
  KEY `fk_cuenta_a_nombres_alternativos` (`id_cuenta`),
  CONSTRAINT `fk_cuenta_a_nombres_alternativos` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los nombres alternativos de las cuentas contables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_parametro`
--

DROP TABLE IF EXISTS `ctb_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_parametro` (
  `id_parametro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_PARAMETRO',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_tipo_parametro` varchar(3) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_PARAMETRO',
  `parametro_texto` varchar(100) DEFAULT NULL COMMENT 'Parámetro texto',
  `parametro_entero` int(11) DEFAULT NULL COMMENT 'Párametro entero',
  `parametro_decimal` decimal(15,4) DEFAULT NULL COMMENT 'Parámetro decimal',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_parametro`),
  KEY `fk_periodo_a_parametro` (`id_periodo`),
  KEY `fk_tipoparametro_a_parametro` (`id_tipo_parametro`),
  CONSTRAINT `fk_periodo_a_parametro` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`),
  CONSTRAINT `fk_tipoparametro_a_parametro` FOREIGN KEY (`id_tipo_parametro`) REFERENCES `ctb_tipo_parametro` (`id_tipo_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tabla que sirve para almacenar algunos parámetros necesarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_periodo`
--

DROP TABLE IF EXISTS `ctb_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_periodo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `descripcion_periodo` varchar(100) DEFAULT NULL,
  `fecha_inicio_periodo` date DEFAULT NULL,
  `fecha_fin_periodo` date DEFAULT NULL,
  `estado_periodo` char(1) DEFAULT NULL,
  `saldos_copiados` char(1) DEFAULT 'N' COMMENT 'Este campo indica S=Si ya se han copiado los saldos iniciales del periodo anterior',
  `principal_periodo` char(1) DEFAULT 'N' COMMENT 'Indica S=si se escoge el periodo por default o N=no se escoge',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los periodos contables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_reposicion_caja_chica`
--

DROP TABLE IF EXISTS `ctb_reposicion_caja_chica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_reposicion_caja_chica` (
  `id_reposicion_caja_chica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_REPOSICION_CAJA_CHICA',
  `id_tipo_forma_pago_compra` int(11) DEFAULT NULL,
  `id_liquidacion_caja_chica` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_LIQUIDACION_CAJA_CHICA',
  `id_cuenta_bancaria` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA_BANCARIA',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha en la que se genera la reposición de la caja chica',
  `estado_reposicion_caja_chica` char(3) DEFAULT 'PEN' COMMENT 'Indica si la reposición está PEN=Pendiente de contabilizar o ya está CTB=Contabilizada',
  `nro_deposito` varchar(100) DEFAULT NULL,
  `nro_cheque` varchar(100) DEFAULT NULL,
  `valor` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reposicion_caja_chica`),
  KEY `fk_cuenta_bancaria_a_reposicion_caja_chica` (`id_cuenta_bancaria`),
  KEY `fk_forma_pago_a_reposicion_caja_chica` (`id_tipo_forma_pago_compra`),
  KEY `fk_liquidacion_a_reposicion_caja_chica` (`id_liquidacion_caja_chica`),
  CONSTRAINT `fk_cuenta_bancaria_a_reposicion_caja_chica` FOREIGN KEY (`id_cuenta_bancaria`) REFERENCES `ctb_cuenta_bancaria` (`id_cuenta_bancaria`),
  CONSTRAINT `fk_forma_pago_a_reposicion_caja_chica` FOREIGN KEY (`id_tipo_forma_pago_compra`) REFERENCES `prv_tipo_forma_pago_compra` (`id_tipo_forma_pago_compra`),
  CONSTRAINT `fk_liquidacion_a_reposicion_caja_chica` FOREIGN KEY (`id_liquidacion_caja_chica`) REFERENCES `ctb_liquidacion_caja_chica` (`id_liquidacion_caja_chica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todas las reposiciones de la Caja Chica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_retencion`
--

DROP TABLE IF EXISTS `ctb_retencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_retencion` (
  `id_retencion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_RETENCION',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_comprobante` int(11) DEFAULT NULL,
  `id_compra` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRV_COMPRA',
  `id_factura` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_FACTURA',
  `nro_retencion` varchar(15) DEFAULT NULL COMMENT 'Nro. de retención',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación de la retención',
  `establecimiento_ats` varchar(100) DEFAULT NULL COMMENT 'Nro. de establecimiento para el ATS',
  `punto_emision_ats` varchar(100) DEFAULT NULL COMMENT 'Punto de emisión para el ATS',
  `nro_autorizacion_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_hora_autorizacion_ats` datetime DEFAULT NULL COMMENT 'Campo ATS',
  `ambiente_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `emision_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `clave_acceso_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `estado_retencion` varchar(3) DEFAULT 'ACT' COMMENT 'Indica si la retención está activa=ACT o anulada=XXX',
  `estado_envio` char(1) DEFAULT NULL COMMENT 'Este estado es para saber si se envió correctamente al SRI un documento',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_retencion`),
  KEY `fk_comprobante_a_retencion` (`id_comprobante`),
  KEY `fk_persona_a_retencion` (`id_persona`),
  KEY `fk_compra_a_retencion` (`id_compra`),
  KEY `fk_factura_a_retencion` (`id_factura`),
  CONSTRAINT `fk_compra_a_retencion` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_comprobante_a_retencion` FOREIGN KEY (`id_comprobante`) REFERENCES `ctb_comprobante` (`id_comprobante`),
  CONSTRAINT `fk_factura_a_retencion` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_persona_a_retencion` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_secuencia_comprobante`
--

DROP TABLE IF EXISTS `ctb_secuencia_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_secuencia_comprobante` (
  `id_secuencia_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_comprobante` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `anio` varchar(4) DEFAULT NULL,
  `mes` varchar(4) DEFAULT NULL,
  `secuencia` decimal(15,0) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_secuencia_comprobante`),
  KEY `fk_tipo_comprobante_secuencia` (`id_tipo_comprobante`),
  CONSTRAINT `fk_tipo_comprobante_secuencia` FOREIGN KEY (`id_tipo_comprobante`) REFERENCES `ctb_tipo_comprobante` (`id_tipo_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_secuencial`
--

DROP TABLE IF EXISTS `ctb_secuencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_secuencial` (
  `id_secuencial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_SECUENCIAL',
  `tipo_secuencial` varchar(4) DEFAULT NULL COMMENT 'Tipo secuencial ingresado',
  `secuencial_inicial` decimal(15,0) DEFAULT NULL COMMENT 'Secuencia inicial',
  `secuencia_final` decimal(15,0) DEFAULT NULL COMMENT 'Secuencia final',
  `tipo_generacion` char(1) DEFAULT NULL COMMENT 'Indica si la generación del documento es M=manual o E=electrónica',
  `codigo_autorizacion` varchar(15) DEFAULT NULL COMMENT 'Es el código de autorización que se imprime en las retenciones manuales',
  `fecha_vigencia` date DEFAULT NULL COMMENT 'Es la fecha de vigencia de la numeración de los comprobantes manuales',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_secuencial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Almacena los secuenciales de facturas y notas de crédito y débito';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_tipo_comprobante`
--

DROP TABLE IF EXISTS `ctb_tipo_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_tipo_comprobante` (
  `id_tipo_comprobante` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código secuencial de la tabla',
  `id_clase_comprobante` char(4) DEFAULT NULL,
  `descripcion_tipo_comprobante` varchar(100) DEFAULT NULL,
  `codigo_letras` varchar(4) DEFAULT NULL,
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_comprobante`),
  UNIQUE KEY `idx_uk_clase` (`id_clase_comprobante`) COMMENT 'No se puede repetir la clase del comprobante',
  CONSTRAINT `fk_clase_comprobante_a_tipo_comprobante` FOREIGN KEY (`id_clase_comprobante`) REFERENCES `ctb_clase_comprobante` (`id_clase_comprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los tipos de comprobantes contables exist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_tipo_cuenta`
--

DROP TABLE IF EXISTS `ctb_tipo_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_tipo_cuenta` (
  `id_tipo_cuenta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_TIPO_CUENTA',
  `descripcion_tipo_cuenta` varchar(256) DEFAULT NULL COMMENT 'Descripción del tipo de cuenta',
  `orden` decimal(15,0) DEFAULT NULL COMMENT 'Orden de presentación de los módulos',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Almacena el tipo de cuenta ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_tipo_cuenta_general`
--

DROP TABLE IF EXISTS `ctb_tipo_cuenta_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_tipo_cuenta_general` (
  `id_tipo_cuenta_general` char(4) NOT NULL,
  `descripcion_tipo_cuenta_general` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_cuenta_general`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_tipo_documento`
--

DROP TABLE IF EXISTS `ctb_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_tipo_documento` (
  `id_tipo_documento` char(4) NOT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_DOCUMENTO',
  `descripcion_tipo_documento` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de documento',
  `tipo_uso` char(1) DEFAULT 'M' COMMENT 'Indica si se puede usar en asientos manuales o no',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_tipo_parametro`
--

DROP TABLE IF EXISTS `ctb_tipo_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_tipo_parametro` (
  `id_tipo_parametro` varchar(3) NOT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_PARAMETRO',
  `descripcion_tipo_parametro` varchar(256) DEFAULT NULL COMMENT 'Descripción del tipo de parámetro',
  `tipo_dato` varchar(4) DEFAULT NULL COMMENT 'Tipo de dato del parámetro',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_parametro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los tipos de parámetro contables, únicamente el usuario super administrador puede manipular los datos de esta tabla';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_tipo_retencion`
--

DROP TABLE IF EXISTS `ctb_tipo_retencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_tipo_retencion` (
  `id_tipo_retencion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_pais` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `descripcion_tipo_retencion` varchar(100) DEFAULT NULL,
  `porcentaje` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje en cantidad entera',
  `codigo_formulario` varchar(15) DEFAULT NULL,
  `ingreso_manual` char(1) DEFAULT NULL,
  `codigo_formulario_ats` varchar(4) DEFAULT NULL,
  `tipo_retencion` char(1) DEFAULT NULL COMMENT 'Indica si es retención x IVA=I o x RENTA=R',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_retencion`),
  KEY `fk_impuesto_a_tipo_retencion` (`id_impuesto`),
  KEY `fk_pais_a_tipo_retencion` (`id_pais`),
  CONSTRAINT `fk_impuesto_a_tipo_retencion` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_pais_a_tipo_retencion` FOREIGN KEY (`id_pais`) REFERENCES `per_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Almacena los tipos de retención y renta que se aplican';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctb_tipo_retencion_x_cuenta`
--

DROP TABLE IF EXISTS `ctb_tipo_retencion_x_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctb_tipo_retencion_x_cuenta` (
  `id_tipo_retencion_x_cuenta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION_X_CUENTA',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_tipo_retencion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `id_cuenta_credito` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `id_cuenta_retencion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Código del usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Código del usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_retencion_x_cuenta`),
  KEY `fk_cuenta_a_tipo_retencion_credito` (`id_cuenta_credito`),
  KEY `fk_cuenta_a_tipo_retencion_retencion` (`id_cuenta_retencion`),
  KEY `fk_periodo_a_tipo_retencion_x_cuenta` (`id_periodo`),
  KEY `fk_tipo_retencion_a_cuenta` (`id_tipo_retencion`),
  CONSTRAINT `fk_cuenta_a_tipo_retencion_credito` FOREIGN KEY (`id_cuenta_credito`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_cuenta_a_tipo_retencion_retencion` FOREIGN KEY (`id_cuenta_retencion`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_periodo_a_tipo_retencion_x_cuenta` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`),
  CONSTRAINT `fk_tipo_retencion_a_cuenta` FOREIGN KEY (`id_tipo_retencion`) REFERENCES `ctb_tipo_retencion` (`id_tipo_retencion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_campo_configuracion`
--

DROP TABLE IF EXISTS `fac_campo_configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_campo_configuracion` (
  `id_campo_configuracion` int(11) NOT NULL,
  `descripcion_campo_configuracion` varchar(100) DEFAULT NULL,
  `etiqueta_campo_configuracion` varchar(100) DEFAULT NULL,
  `columna_campo_configuracion` varchar(100) DEFAULT NULL,
  `tipo_dato` varchar(4) DEFAULT NULL,
  `tipo_campo_configuracion` varchar(4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_campo_configuracion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los campos disponibles en la configuració';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_cliente_factura`
--

DROP TABLE IF EXISTS `fac_cliente_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_cliente_factura` (
  `id_cliente_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `tipo_identificacion_ats` varchar(3) DEFAULT NULL COMMENT 'Tipo de identificación relacionada al SRI',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_cliente_factura`),
  UNIQUE KEY `idx_norepetir_persona` (`id_persona`),
  CONSTRAINT `fk_persona_a_cliente_factura` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todos los clientes de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_configura_cabecera`
--

DROP TABLE IF EXISTS `fac_configura_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_configura_cabecera` (
  `id_configura_cabecera` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código tabla',
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `tipo_documento` varchar(4) DEFAULT NULL,
  `tipo_campo` varchar(4) DEFAULT NULL COMMENT 'Tipo de campo, si es CABE=cabecera o DETL=detalle',
  `campo_impresion` varchar(4) DEFAULT NULL COMMENT 'Campo pre-establecido de la cabecera',
  `texto_etiqueta` varchar(100) DEFAULT NULL COMMENT 'Texto del campo',
  `orientacion_campo` varchar(4) DEFAULT NULL COMMENT 'Orientación del campo DERE=derecha, IZQR=izquierda, TODO=ocupa todo',
  `orden_campo` decimal(15,0) DEFAULT NULL COMMENT 'Cantidad entera que representa el orden',
  `lleva_decimales` char(1) DEFAULT NULL COMMENT 'Indica si debe colarse el dato con o sin decimales',
  `porcentaje_tamano` decimal(15,2) DEFAULT NULL COMMENT 'Porcentaje de tamaño que ocupará en la impresión',
  `alineacion` varchar(4) DEFAULT NULL COMMENT 'Alineación de la columna en el reporte',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_configura_cabecera`),
  KEY `fk_idioma_a_config_impresion` (`id_idioma`),
  CONSTRAINT `fk_idioma_a_config_impresion` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena la configuración de la impresión de la fa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_configura_impresion`
--

DROP TABLE IF EXISTS `fac_configura_impresion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_configura_impresion` (
  `id_configura_impresion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `tipo_documento` varchar(4) DEFAULT NULL,
  `tipo_letra` varchar(4) DEFAULT NULL COMMENT 'Tipo de letra con la que se imprimirá la factura',
  `tamano_letra` decimal(15,4) DEFAULT NULL COMMENT 'Tamaño de las letras con la que se imprimirá la factura',
  `cantidad_en_letras` char(1) DEFAULT NULL COMMENT 'Cantidad en letras al final, si-no.',
  `agrupado_x_producto` char(1) DEFAULT NULL,
  `impresion_rapida` char(1) DEFAULT NULL,
  `coloca_simbolo_moneda` char(1) DEFAULT NULL,
  `tamano_pagina` varchar(4) DEFAULT NULL,
  `firmas` char(1) DEFAULT NULL,
  `imprime_fechas_descripcion` char(1) DEFAULT NULL,
  `tipo_configuracion` char(1) DEFAULT NULL,
  `html_cabecera` text,
  `html_detalle` text,
  `html_pie` text,
  `nro_max_detalles` int(11) DEFAULT NULL,
  `relleno_detalles` text,
  `orientacion_impresion` char(1) DEFAULT NULL,
  `borde_detalle` char(1) DEFAULT NULL,
  `imprime_total_x_persona` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_configura_impresion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Configuración general de la impresión de una factura';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_contabilidad_detalle_fac`
--

DROP TABLE IF EXISTS `fac_contabilidad_detalle_fac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_contabilidad_detalle_fac` (
  `id_contabilidad_detalle_fac` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla FAC_CONTABILIDAD_DETALLE_FAC',
  `id_cuenta` int(11) DEFAULT NULL,
  `id_detalle_factura` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_contabilidad_detalle_fac`),
  KEY `fk_cuenta_a_contabilidad_detalle_fac` (`id_cuenta`),
  KEY `fk_det_factura_a_contabilidad_detalle_fac` (`id_detalle_factura`),
  CONSTRAINT `fk_cuenta_a_contabilidad_detalle_fac` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_det_factura_a_contabilidad_detalle_fac` FOREIGN KEY (`id_detalle_factura`) REFERENCES `fac_detalle_factura` (`id_detalle_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_cuenta_x_cliente`
--

DROP TABLE IF EXISTS `fac_cuenta_x_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_cuenta_x_cliente` (
  `id_cuenta_x_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cliente_factura` int(11) DEFAULT NULL,
  `id_cuenta_fp_noinmediata` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar la forma de pago inmediata',
  `id_cuenta_fp_inmediata` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar la forma de pago no inmediata',
  `id_cuenta_anticipo` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar el anticipo',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_x_cliente`),
  UNIQUE KEY `idx_cuenta_x_periodo_x_cliente` (`id_cliente_factura`,`id_periodo`),
  KEY `fk_periodo_a_cuenta_x_cliente` (`id_periodo`),
  CONSTRAINT `fk_cliente_a_cuenta` FOREIGN KEY (`id_cliente_factura`) REFERENCES `fac_cliente_factura` (`id_cliente_factura`),
  CONSTRAINT `fk_periodo_a_cuenta_x_cliente` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las cuentas que necesita el cliente por c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_detalle_factura`
--

DROP TABLE IF EXISTS `fac_detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_detalle_factura` (
  `id_detalle_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto_x_precio_producto` int(11) DEFAULT NULL,
  `id_precio_x_temporada` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `id_unidad_estrategica` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `id_detalle_reserva` int(11) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL,
  `id_motivo_ingreso_manual` int(11) DEFAULT NULL,
  `id_detalle_factura_ss` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `nro_pax` decimal(15,8) DEFAULT NULL,
  `nro_unidades` decimal(15,8) DEFAULT NULL,
  `precio_unitario` decimal(15,8) DEFAULT NULL,
  `total_impuesto_porcentaje` decimal(15,8) DEFAULT NULL,
  `total_impuesto_valor` decimal(15,8) DEFAULT NULL,
  `total_impuesto_neto` decimal(15,8) DEFAULT NULL,
  `porcentaje_descuento` decimal(15,8) DEFAULT NULL,
  `descuento_en_valor` decimal(15,8) DEFAULT NULL,
  `prioridad_descuento` varchar(3) DEFAULT NULL,
  `precio_total` decimal(15,8) DEFAULT NULL,
  `individual_general` char(1) DEFAULT NULL,
  `medida_calculo_precio` char(1) DEFAULT NULL,
  `se_reserva` char(1) DEFAULT NULL,
  `tipo_precio` char(1) DEFAULT NULL,
  `observacion_detalle` text,
  `es_single_suplement` char(1) DEFAULT NULL,
  `comision_fija` decimal(15,8) DEFAULT NULL,
  `porcentaje_utilidad` decimal(15,8) DEFAULT NULL,
  `cantidad_parcial` decimal(15,2) DEFAULT NULL,
  `cantidad_total` decimal(15,8) DEFAULT NULL,
  `blank_copy` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_factura`),
  KEY `fk_prd_x_precio_a_det_factura` (`id_producto_x_precio_producto`),
  KEY `fk_producto_a_det_factura` (`id_producto`),
  KEY `fk_factura_a_det_factura` (`id_factura`),
  KEY `fk_temporada_a_det_factura` (`id_precio_x_temporada`),
  KEY `fk_unidad_estrategica_a_det_factura` (`id_unidad_estrategica`),
  KEY `fk_det_reserva_a_det_factura` (`id_detalle_reserva`),
  CONSTRAINT `fk_det_reserva_a_det_factura` FOREIGN KEY (`id_detalle_reserva`) REFERENCES `res_detalle_reserva` (`id_detalle_reserva`),
  CONSTRAINT `fk_factura_a_det_factura` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_prd_x_precio_a_det_factura` FOREIGN KEY (`id_producto_x_precio_producto`) REFERENCES `prd_producto_x_precio_producto` (`id_producto_x_precio_producto`),
  CONSTRAINT `fk_producto_a_det_factura` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_temporada_a_det_factura` FOREIGN KEY (`id_precio_x_temporada`) REFERENCES `prd_precio_x_temporada` (`id_precio_x_temporada`),
  CONSTRAINT `fk_unidad_estrategica_a_det_factura` FOREIGN KEY (`id_unidad_estrategica`) REFERENCES `prd_unidad_estrategica` (`id_unidad_estrategica`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_detalle_nota_credito`
--

DROP TABLE IF EXISTS `fac_detalle_nota_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_detalle_nota_credito` (
  `id_detalle_nota_credito` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto_x_precio_producto` int(11) DEFAULT NULL,
  `id_precio_x_temporada` int(11) DEFAULT NULL,
  `id_nota_credito` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `id_detalle_factura` int(11) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL,
  `id_motivo_ingreso_manual` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `nro_pax` decimal(15,8) DEFAULT NULL,
  `nro_unidades` decimal(15,8) DEFAULT NULL,
  `precio_unitario` decimal(15,8) DEFAULT NULL,
  `total_impuesto_porcentaje` decimal(15,8) DEFAULT NULL,
  `total_impuesto_valor` decimal(15,8) DEFAULT NULL,
  `total_impuesto_neto` decimal(15,8) DEFAULT NULL,
  `porcentaje_descuento` decimal(15,8) DEFAULT NULL,
  `descuento_en_valor` decimal(15,8) DEFAULT NULL,
  `prioridad_descuento` varchar(3) DEFAULT NULL,
  `precio_total` decimal(15,8) DEFAULT NULL,
  `individual_general` char(1) DEFAULT NULL,
  `medida_calculo_precio` char(1) DEFAULT NULL,
  `se_reserva` char(1) DEFAULT NULL,
  `tipo_precio` char(1) DEFAULT NULL,
  `observacion_detalle` text,
  `es_single_suplement` char(1) DEFAULT NULL,
  `comision_fija` decimal(15,8) DEFAULT NULL,
  `porcentaje_utilidad` decimal(15,8) DEFAULT NULL,
  `cantidad_parcial` decimal(15,2) DEFAULT NULL,
  `cantidad_total` decimal(15,8) DEFAULT NULL,
  `blank_copy` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_nota_credito`),
  KEY `fk_prd_x_precio_a_det_nota_credito` (`id_producto_x_precio_producto`),
  KEY `fk_producto_a_det_nota_credito` (`id_producto`),
  KEY `fk_nota_credito_a_det_nota_credito` (`id_nota_credito`),
  KEY `fk_temporada_a_det_nota_credito` (`id_precio_x_temporada`),
  KEY `fk_det_factura_a_det_nota_credito` (`id_detalle_factura`),
  CONSTRAINT `fk_det_factura_a_det_nota_credito` FOREIGN KEY (`id_detalle_factura`) REFERENCES `fac_detalle_factura` (`id_detalle_factura`),
  CONSTRAINT `fk_nota_credito_a_det_nota_credito` FOREIGN KEY (`id_nota_credito`) REFERENCES `fac_nota_credito` (`id_nota_credito`),
  CONSTRAINT `fk_prd_x_precio_a_det_nota_credito` FOREIGN KEY (`id_producto_x_precio_producto`) REFERENCES `prd_producto_x_precio_producto` (`id_producto_x_precio_producto`),
  CONSTRAINT `fk_producto_a_det_nota_credito` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_temporada_a_det_nota_credito` FOREIGN KEY (`id_precio_x_temporada`) REFERENCES `prd_precio_x_temporada` (`id_precio_x_temporada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_detalle_proforma`
--

DROP TABLE IF EXISTS `fac_detalle_proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_detalle_proforma` (
  `id_detalle_proforma` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto_x_precio_producto` int(11) DEFAULT NULL,
  `id_precio_x_temporada` int(11) DEFAULT NULL,
  `id_proforma` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL,
  `id_motivo_ingreso_manual` int(11) DEFAULT NULL,
  `id_detalle_proforma_ss` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `nro_pax` decimal(15,8) DEFAULT NULL,
  `nro_unidades` decimal(15,8) DEFAULT NULL,
  `precio_unitario` decimal(15,8) DEFAULT NULL,
  `total_impuesto_porcentaje` decimal(15,8) DEFAULT NULL,
  `total_impuesto_valor` decimal(15,8) DEFAULT NULL,
  `total_impuesto_neto` decimal(15,8) DEFAULT NULL,
  `porcentaje_descuento` decimal(15,8) DEFAULT NULL,
  `descuento_en_valor` decimal(15,8) DEFAULT NULL,
  `prioridad_descuento` varchar(3) DEFAULT NULL,
  `precio_total` decimal(15,8) DEFAULT NULL,
  `individual_general` char(1) DEFAULT NULL,
  `medida_calculo_precio` char(1) DEFAULT NULL,
  `se_reserva` char(1) DEFAULT NULL,
  `tipo_precio` char(1) DEFAULT NULL,
  `observacion_detalle` text,
  `es_single_suplement` char(1) DEFAULT NULL,
  `comision_fija` decimal(15,8) DEFAULT NULL,
  `porcentaje_utilidad` decimal(15,8) DEFAULT NULL,
  `cantidad_parcial` decimal(15,2) DEFAULT NULL,
  `cantidad_total` decimal(15,8) DEFAULT NULL,
  `blank_copy` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_proforma`),
  KEY `fk_prd_x_precio_a_det_proforma` (`id_producto_x_precio_producto`),
  KEY `fk_producto_a_det_proforma` (`id_producto`),
  KEY `fk_proforma_a_det_proforma` (`id_proforma`),
  KEY `fk_temporada_a_det_proforma` (`id_precio_x_temporada`),
  CONSTRAINT `fk_prd_x_precio_a_det_proforma` FOREIGN KEY (`id_producto_x_precio_producto`) REFERENCES `prd_producto_x_precio_producto` (`id_producto_x_precio_producto`),
  CONSTRAINT `fk_producto_a_det_proforma` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_proforma_a_det_proforma` FOREIGN KEY (`id_proforma`) REFERENCES `fac_proforma` (`id_proforma`),
  CONSTRAINT `fk_temporada_a_det_proforma` FOREIGN KEY (`id_precio_x_temporada`) REFERENCES `prd_precio_x_temporada` (`id_precio_x_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=114284 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_detalle_valor`
--

DROP TABLE IF EXISTS `fac_detalle_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_detalle_valor` (
  `id_detalle_valor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `id_factura` int(11) DEFAULT NULL COMMENT 'Número secuencial que identifica la factura',
  `id_proforma` int(11) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código del impuesto o descuento a aplicarse',
  `id_nota_credito` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_NOTA_CREDITO',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor`),
  KEY `fk_factura_a_det_valor` (`id_factura`),
  KEY `fk_impuesto_a_det_valor` (`id_impuesto`),
  KEY `fk_nota_credito_a_detalle_valor` (`id_nota_credito`),
  KEY `fk_proforma_a_det_valor` (`id_proforma`),
  CONSTRAINT `fk_factura_a_det_valor` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_impuesto_a_det_valor` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_nota_credito_a_detalle_valor` FOREIGN KEY (`id_nota_credito`) REFERENCES `fac_nota_credito` (`id_nota_credito`),
  CONSTRAINT `fk_proforma_a_det_valor` FOREIGN KEY (`id_proforma`) REFERENCES `fac_proforma` (`id_proforma`)
) ENGINE=InnoDB AUTO_INCREMENT=99619 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el detalle de los valores de la factura';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_detalle_valor_x_insumo`
--

DROP TABLE IF EXISTS `fac_detalle_valor_x_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_detalle_valor_x_insumo` (
  `id_detalle_valor_x_insumo_fac` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla FAC_DETALLE_VALOR_X_INSUMO',
  `id_insumo_x_itinerario_fac` int(11) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `cambio_a_mano` char(1) DEFAULT 'N' COMMENT 'Indica si se ha hecho un cambio manual a un impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor_x_insumo_fac`),
  KEY `fk_impuesto_a_detalle_valor_x_insumo_fac` (`id_impuesto`),
  KEY `fk_insumo_a_detalle_valor_fac` (`id_insumo_x_itinerario_fac`),
  CONSTRAINT `fk_impuesto_a_detalle_valor_x_insumo_fac` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_insumo_a_detalle_valor_fac` FOREIGN KEY (`id_insumo_x_itinerario_fac`) REFERENCES `fac_insumo_x_itinerario` (`id_insumo_x_itinerario_fac`)
) ENGINE=InnoDB AUTO_INCREMENT=2151351 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_fac_detalle_valor_x_insumo` AFTER UPDATE ON `fac_detalle_valor_x_insumo` FOR EACH ROW BEGIN
  DECLARE valorPk VARCHAR(50);
  DECLARE usuario VARCHAR(50);
  DECLARE campos TEXT;
  DECLARE valorAnterior TEXT;
  DECLARE valorActual TEXT;
  DECLARE camposMaestro TEXT;
  DECLARE valoresMaestro TEXT;
  
  SET campos = '';
  SET valorAnterior = '';
  SET valorActual = '';
  SET camposMaestro = '';
  SET valoresMaestro = '';
  
  SET valorPk = old.id_detalle_valor_x_insumo_fac;

  IF (IFNULL(new.id_insumo_x_itinerario_fac, '') != IFNULL(old.id_insumo_x_itinerario_fac, ''))
  THEN
    SET campos = concat(campos, 'id_insumo_x_itinerario_fac~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_insumo_x_itinerario_fac, ''), '~');
    SET valorActual = concat(valorActual, new.id_insumo_x_itinerario_fac, '~');
  END IF;
  IF (IFNULL(new.id_impuesto, '') != IFNULL(old.id_impuesto, ''))
  THEN
    SET campos = concat(campos, 'id_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.id_impuesto, '~');
  END IF;
  IF (IFNULL(new.tipo_detalle_valor, '') != IFNULL(old.tipo_detalle_valor, ''))
  THEN
    SET campos = concat(campos, 'tipo_detalle_valor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.tipo_detalle_valor, ''), '~');
    SET valorActual = concat(valorActual, new.tipo_detalle_valor, '~');
  END IF;
  IF (IFNULL(new.suprime_impuesto, '') != IFNULL(old.suprime_impuesto, ''))
  THEN
    SET campos = concat(campos, 'suprime_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.suprime_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.suprime_impuesto, '~');
  END IF;
  IF (IFNULL(new.valor, '') != IFNULL(old.valor, ''))
  THEN
    SET campos = concat(campos, 'valor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.valor, ''), '~');
    SET valorActual = concat(valorActual, new.valor, '~');
  END IF;
  IF (IFNULL(new.porcentaje_impuesto, '') != IFNULL(old.porcentaje_impuesto, ''))
  THEN
    SET campos = concat(campos, 'porcentaje_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.porcentaje_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.porcentaje_impuesto, '~');
  END IF;
  IF (IFNULL(new.base_imponible, '') != IFNULL(old.base_imponible, ''))
  THEN
    SET campos = concat(campos, 'base_imponible~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.base_imponible, ''), '~');
    SET valorActual = concat(valorActual, new.base_imponible, '~');
  END IF;
  IF (IFNULL(new.cambio_a_mano, '') != IFNULL(old.cambio_a_mano, ''))
  THEN
    SET campos = concat(campos, 'cambio_a_mano~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.cambio_a_mano, ''), '~');
    SET valorActual = concat(valorActual, new.cambio_a_mano, '~');
  END IF;
  SET usuario = new.id_usuario_modifica;
  
  IF campos != '' THEN
    INSERT INTO gecoecua_ecuadoradventure.seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'fac_detalle_valor_x_insumo',
      'UPDATE',
      camposMaestro,
      valoresMaestro,
      valorPk,
      campos,
      valorAnterior,
      valorActual,
      usuario,
      NOW()
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fac_detalle_valor_x_producto`
--

DROP TABLE IF EXISTS `fac_detalle_valor_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_detalle_valor_x_producto` (
  `id_detalle_valor_x_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `id_detalle_nota_credito` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_DETALLE_NOTA_CREDITO',
  `id_detalle_factura` int(11) DEFAULT NULL COMMENT 'Código del detalle de la factura',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código del impuesto o descuento a aplicarse',
  `id_detalle_proforma` int(11) DEFAULT NULL,
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor_x_producto`),
  KEY `fk_detalle_nc_a_det_valor_x_prd` (`id_detalle_nota_credito`),
  KEY `fk_det_factura_a_det_valor_x_prd` (`id_detalle_factura`),
  KEY `fk_det_proforma_a_det_valor_x_prd` (`id_detalle_proforma`),
  KEY `fk_impuesto_a_det_valor_x_prd` (`id_impuesto`),
  CONSTRAINT `fk_det_factura_a_det_valor_x_det` FOREIGN KEY (`id_detalle_factura`) REFERENCES `fac_detalle_factura` (`id_detalle_factura`),
  CONSTRAINT `fk_det_nota_credito_a_det_valor_x_det` FOREIGN KEY (`id_detalle_nota_credito`) REFERENCES `fac_detalle_nota_credito` (`id_detalle_nota_credito`),
  CONSTRAINT `fk_det_proforma_a_det_valor_x_det` FOREIGN KEY (`id_detalle_proforma`) REFERENCES `fac_detalle_proforma` (`id_detalle_proforma`),
  CONSTRAINT `fk_impuesto_a_det_valor_x_prd` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=325156 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el detalle del valor por cada producto en';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_encabezado_pie`
--

DROP TABLE IF EXISTS `fac_encabezado_pie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_encabezado_pie` (
  `id_encabezado_pie_fac` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla FAC_ENCABEZADO_PIE',
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `id_proforma` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `encabezado_itinerario` text COMMENT 'Encabezado parametrizable por proforma que va en el reporte de itinerario',
  `pie_itinerario` text COMMENT 'Pie parametrizable por proforma que va en el reporte de itinerario',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_encabezado_pie_fac`),
  KEY `fk_idioma_a_encabezado_pie` (`id_idioma`),
  KEY `fk_proforma_a_encabezado_pie` (`id_proforma`),
  CONSTRAINT `fk_idioma_a_encabezado_pie` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_proforma_a_encabezado_pie` FOREIGN KEY (`id_proforma`) REFERENCES `fac_proforma` (`id_proforma`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COMMENT='Almacena el encabezado y el pie del itinerario por proforma';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_factura`
--

DROP TABLE IF EXISTS `fac_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número secuencial que identifica la factura',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de reserva',
  `id_motivo_anulacion` int(11) DEFAULT NULL COMMENT 'Código del motivo de anulación',
  `id_motivo_descuento` int(11) DEFAULT NULL,
  `codigo_agencia` varchar(100) DEFAULT NULL COMMENT 'Código de la agencia que realiza la reserva',
  `nro_factura` varchar(100) DEFAULT NULL COMMENT 'Campo en el que se ingresa el número de factura del bloque que se imprime',
  `estado_factura` varchar(4) DEFAULT NULL COMMENT 'Estado en el que se encuentra la factura puede ser, PRE=Visualización previa, PAG=Pagada',
  `fecha_pago_factura` date DEFAULT NULL COMMENT 'Fecha que indica el día del pago de la factura',
  `porcentaje_dscto_adicional` decimal(15,6) DEFAULT NULL,
  `id_moneda_factura` int(11) DEFAULT NULL COMMENT 'Moneda en la que se ingresa la factura',
  `modo_generacion` char(1) DEFAULT NULL COMMENT 'En este campo se almacena el dato del modo en que se generará la factura: D=Detallada o R=Resumida',
  `genera_todo` char(1) DEFAULT NULL COMMENT 'Indica si genera todo el contenido de la reserva',
  `genera_hospedaje` char(1) DEFAULT NULL COMMENT 'Indica que debe generar solo la parte de hospedaje',
  `genera_consumo_x_persona` char(1) DEFAULT NULL COMMENT 'Indica que debe generar solo el consumo de la persona indicada en la factura',
  `genera_consumo_x_reserva` char(1) DEFAULT NULL COMMENT 'Indica que debe generar solo el consumo de toda la reserva',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación de la factura',
  `fecha_pago` datetime DEFAULT NULL COMMENT 'Fecha de pago de la factura',
  `fecha_anulacion` datetime DEFAULT NULL COMMENT 'Fecha de anulación de la factura si fuere anulada',
  `importado_de` varchar(4) DEFAULT NULL,
  `id_importado_de` int(11) DEFAULT NULL,
  `observacion_factura` text COMMENT 'Observación adicional',
  `nro_pax` decimal(15,0) DEFAULT NULL COMMENT 'Cantidad de pasajeros',
  `id_persona_contacto` int(11) DEFAULT NULL COMMENT 'Código de la persona de contacto',
  `establecimiento_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `punto_emision_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `nro_autorizacion_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_hora_autorizacion_ats` datetime DEFAULT NULL COMMENT 'Campo ATS',
  `ambiente_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `emision_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `clave_acceso_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `tipo_comprobante_ats` varchar(4) DEFAULT NULL COMMENT 'Campo ATS',
  `descuento_en_valor` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de descuento representado en valor',
  `prioridad_descuento` varchar(3) DEFAULT NULL COMMENT 'Indica sobre que cantidad se prioriza el descuento, la otra cambia',
  `tipo_electronica_manual` char(1) DEFAULT NULL COMMENT 'Indica si la factura, retención o nota de crédito fue E=Electrónica o M=Manual',
  `estado_envio` char(1) DEFAULT NULL COMMENT 'Este estado es para saber si se envió correctamente al SRI un documento',
  `es_punto_venta` char(1) DEFAULT 'N' COMMENT 'Indica si la factura es de punto de venta o no',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_persona_a_factura` (`id_persona`),
  KEY `fk_reserva_a_factura` (`id_reserva`),
  CONSTRAINT `fk_persona_a_factura` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_reserva_a_factura` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Almacena la cabecera de la factura';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bi_crea_cliente_factura` BEFORE INSERT ON `fac_factura` FOR EACH ROW BEGIN
	DECLARE existe INTEGER;

	SELECT id_cliente_factura
	  INTO existe
	  FROM fac_cliente_factura
	 WHERE id_persona = new.id_persona;

	IF existe = NULL THEN
    INSERT INTO fac_cliente_factura(id_persona, id_usuario_crea, fecha_crea)
    VALUES (new.id_persona, new.id_usuario_crea, NOW());
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fac_forma_pago`
--

DROP TABLE IF EXISTS `fac_forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_forma_pago` (
  `id_forma_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código secuencia',
  `id_factura` int(11) DEFAULT NULL COMMENT 'Número secuencial que identifica la factura',
  `id_nota_credito` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_NOTA_CREDITO',
  `id_tipo_forma_pago` int(11) DEFAULT NULL,
  `porcentaje_forma_pago` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje que se paga con esta forma de pago',
  `id_moneda_forma_pago` int(11) DEFAULT NULL COMMENT 'Moneda del pago',
  `estado_forma_pago` char(1) DEFAULT 'F' COMMENT 'Indica si fue registrada en la factura o en el cobro',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`),
  KEY `fk_factura_a_forma_pago` (`id_factura`),
  KEY `fk_nota_credito_a_forma_pago` (`id_nota_credito`),
  KEY `fk_tp_forma_pago_a_forma_pago` (`id_tipo_forma_pago`),
  CONSTRAINT `fk_factura_a_forma_pago` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_nota_credito_a_forma_pago` FOREIGN KEY (`id_nota_credito`) REFERENCES `fac_nota_credito` (`id_nota_credito`),
  CONSTRAINT `fk_tp_forma_pago_a_forma_pago` FOREIGN KEY (`id_tipo_forma_pago`) REFERENCES `fac_tipo_forma_pago` (`id_tipo_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena todas las formas de pago con las que se pagó una fa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_idioma_x_itinerario`
--

DROP TABLE IF EXISTS `fac_idioma_x_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_idioma_x_itinerario` (
  `id_idioma_x_itinerario_fac` int(11) NOT NULL AUTO_INCREMENT,
  `id_itinerario_fac` int(11) DEFAULT NULL,
  `id_tipo_inclusion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_TIPO_INCLUSION',
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `descripcion_itinerario` text COMMENT 'Descripción del itinerario',
  `origen` varchar(100) DEFAULT NULL COMMENT 'Punto de salida',
  `destino` varchar(100) DEFAULT NULL COMMENT 'Punto de llegada',
  `actividad` text COMMENT 'Actividad que se va a realizar durante el viaje o en el destino',
  `duracion_itinerario` varchar(100) DEFAULT NULL COMMENT 'Duración del itinerario actual',
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_idioma_x_itinerario_fac`),
  KEY `fk_idioma_a_facidiomaxiti` (`id_idioma`),
  KEY `fk_itinerario_fac_a_idioma_x_itinerario_fac` (`id_itinerario_fac`),
  CONSTRAINT `fk_idioma_a_facidiomaxiti` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_itinerario_fac_a_idioma_x_itinerario_fac` FOREIGN KEY (`id_itinerario_fac`) REFERENCES `fac_itinerario` (`id_itinerario_fac`)
) ENGINE=InnoDB AUTO_INCREMENT=244025 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el idioma x itinerario de la factura';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_insumo_x_itinerario`
--

DROP TABLE IF EXISTS `fac_insumo_x_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_insumo_x_itinerario` (
  `id_insumo_x_itinerario_fac` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_producto_x_precio_producto` int(11) DEFAULT NULL COMMENT 'Código de la tabla',
  `id_precio_insumo` int(11) DEFAULT NULL COMMENT 'Código lista de precios',
  `id_itinerario_fac` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_insumo_x_itinerario_fac2` int(11) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL COMMENT 'Código del motivo de descuento',
  `tipo_insumo_x_itinerario` char(1) DEFAULT NULL COMMENT 'Indica si es I=insumo o P=producto',
  `cantidad_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Es la cantidad que se va a usar o se uso en la reserva',
  `nro_pax_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Número de paxs que ocuparán un insumo',
  `tipo_precio` char(1) DEFAULT NULL COMMENT 'Es el tipo de precio que se está aplicando al producto, C=Calculado en base a los insumos o F=Fijo',
  `precio_fijo` decimal(15,4) DEFAULT NULL COMMENT 'Es el precio fijo del insumo',
  `factor_precio` decimal(15,4) DEFAULT NULL COMMENT 'Es el factor por el que se multiplica el precio',
  `costo_presupuestado` decimal(15,4) DEFAULT NULL COMMENT 'Costo presupuestado del insumo',
  `total_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Total impuesto del insumo',
  `costo_real` decimal(15,4) DEFAULT NULL COMMENT 'Costo real del insumo',
  `descuento_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Descuento del insumo',
  `nro_comprobante_insumo` varchar(100) DEFAULT NULL COMMENT 'Número de comprobante de la compra del insumo',
  `fecha_inicio_insumo` datetime DEFAULT NULL COMMENT 'Hora y fecha para saber en qué momento empieza a ser utilizado el insumo',
  `fecha_fin_insumo` datetime DEFAULT NULL COMMENT 'Hora y fecha para saber en qué momento termina de ser utilizado el insumo',
  `fecha_max_pago` date DEFAULT NULL COMMENT 'Campo que almacena la fecha máxima de pago del insumo usado',
  `fecha_pago_insumo` date DEFAULT NULL COMMENT 'Fecha en la que se efectivamente se hace el pago del insumo',
  `codigo_confirma_proveedor` text COMMENT 'Código de confirmación que da el proveedor',
  `observacion_insumo` text COMMENT 'Observación del insumo',
  `insumo_pagado` char(1) DEFAULT 'N' COMMENT 'Indica si el insumo está pagado',
  `insumo_facturado` char(1) DEFAULT 'N' COMMENT 'Indica si el insumo está facturado',
  `utilidad_x_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de utilidad por insumo en el producto',
  `aprueba_pago` char(1) DEFAULT 'N' COMMENT 'Indica si el pago está aprobado S o no N',
  `id_usuario_responsable` varchar(25) DEFAULT NULL COMMENT 'Código del usuario que colocará los costos reales en el sistema',
  `hora_ejecucion` time DEFAULT NULL COMMENT 'Permite almacenar la hora de ejecución de un servicio',
  `fecha_confirmacion` date DEFAULT NULL COMMENT 'Indispensable para controlar cuándo se confirmó una reserva de servicios',
  `time_limit` date DEFAULT NULL,
  `dar_anticipo` char(1) DEFAULT 'N' COMMENT 'Indica si se debe S dar o no N un anticipo antes de operar la reserva',
  `centro_costos` varchar(100) DEFAULT NULL COMMENT 'Centro de costos',
  `costo_real_sin_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Costo real más impuestos',
  `inventario_descargado` char(1) DEFAULT 'N' COMMENT 'Indica si este insumo ya se ha descargado o no del inventario',
  `lugar` varchar(128) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_insumo_x_itinerario_fac`),
  KEY `fk_insumo_a_insumo_x_itinerario` (`id_insumo`),
  KEY `fk_itinerario_fac_a_insumo_x_itinerario` (`id_itinerario_fac`),
  KEY `fk_prdxpreprd_a_insumoxitinerario` (`id_producto_x_precio_producto`),
  KEY `fk_precioinsumo_a_insumoxitinerario` (`id_precio_insumo`),
  KEY `fk_producto_a_insumoxitinerario` (`id_producto`),
  KEY `fk_proveedor_a_insumoxitinerario` (`id_proveedor`),
  CONSTRAINT `fk_insumo_a_insumo_x_itinerario` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_itinerario_fac_a_insumo_x_itinerario` FOREIGN KEY (`id_itinerario_fac`) REFERENCES `fac_itinerario` (`id_itinerario_fac`),
  CONSTRAINT `fk_prdxpreprd_a_insumoxitinerario` FOREIGN KEY (`id_producto_x_precio_producto`) REFERENCES `prd_producto_x_precio_producto` (`id_producto_x_precio_producto`),
  CONSTRAINT `fk_precioinsumo_a_insumoxitinerario` FOREIGN KEY (`id_precio_insumo`) REFERENCES `prd_precio_insumo` (`id_precio_insumo`),
  CONSTRAINT `fk_producto_a_insumoxitinerario` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_proveedor_a_insumoxitinerario` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=1180669 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_fac_insumo_x_itinerario` AFTER UPDATE ON `fac_insumo_x_itinerario` FOR EACH ROW BEGIN
  DECLARE valorPk VARCHAR(50);
  DECLARE usuario VARCHAR(50);
  DECLARE campos TEXT;
  DECLARE valorAnterior TEXT;
  DECLARE valorActual TEXT;
  DECLARE camposMaestro TEXT;
  DECLARE valoresMaestro TEXT;
  
  SET campos = '';
  SET valorAnterior = '';
  SET valorActual = '';
  SET camposMaestro = '';
  SET valoresMaestro = '';
  
  SET valorPk = old.id_insumo_x_itinerario_fac;

  IF (IFNULL(new.id_insumo, '') != IFNULL(old.id_insumo, ''))
  THEN
    SET campos = concat(campos, 'id_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.id_insumo, '~');
  END IF;
  IF (IFNULL(new.id_producto_x_precio_producto, '') != IFNULL(old.id_producto_x_precio_producto, ''))
  THEN
    SET campos = concat(campos, 'id_producto_x_precio_producto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_producto_x_precio_producto, ''), '~');
    SET valorActual = concat(valorActual, new.id_producto_x_precio_producto, '~');
  END IF;
  IF (IFNULL(new.id_precio_insumo, '') != IFNULL(old.id_precio_insumo, ''))
  THEN
    SET campos = concat(campos, 'id_precio_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_precio_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.id_precio_insumo, '~');
  END IF;
  IF (IFNULL(new.id_itinerario_fac, '') != IFNULL(old.id_itinerario_fac, ''))
  THEN
    SET campos = concat(campos, 'id_itinerario_fac~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_itinerario_fac, ''), '~');
    SET valorActual = concat(valorActual, new.id_itinerario_fac, '~');
  END IF;
  IF (IFNULL(new.id_producto, '') != IFNULL(old.id_producto, ''))
  THEN
    SET campos = concat(campos, 'id_producto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_producto, ''), '~');
    SET valorActual = concat(valorActual, new.id_producto, '~');
  END IF;
  IF (IFNULL(new.id_proveedor, '') != IFNULL(old.id_proveedor, ''))
  THEN
    SET campos = concat(campos, 'id_proveedor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_proveedor, ''), '~');
    SET valorActual = concat(valorActual, new.id_proveedor, '~');
  END IF;
  IF (IFNULL(new.id_insumo_x_itinerario_fac2, '') != IFNULL(old.id_insumo_x_itinerario_fac2, ''))
  THEN
    SET campos = concat(campos, 'id_insumo_x_itinerario_fac2~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_insumo_x_itinerario_fac2, ''), '~');
    SET valorActual = concat(valorActual, new.id_insumo_x_itinerario_fac2, '~');
  END IF;
  IF (IFNULL(new.id_motivo_descuento, '') != IFNULL(old.id_motivo_descuento, ''))
  THEN
    SET campos = concat(campos, 'id_motivo_descuento~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_motivo_descuento, ''), '~');
    SET valorActual = concat(valorActual, new.id_motivo_descuento, '~');
  END IF;
  IF (IFNULL(new.tipo_insumo_x_itinerario, '') != IFNULL(old.tipo_insumo_x_itinerario, ''))
  THEN
    SET campos = concat(campos, 'tipo_insumo_x_itinerario~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.tipo_insumo_x_itinerario, ''), '~');
    SET valorActual = concat(valorActual, new.tipo_insumo_x_itinerario, '~');
  END IF;
  IF (IFNULL(new.cantidad_insumo, '') != IFNULL(old.cantidad_insumo, ''))
  THEN
    SET campos = concat(campos, 'cantidad_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.cantidad_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.cantidad_insumo, '~');
  END IF;
  IF (IFNULL(new.nro_pax_insumo, '') != IFNULL(old.nro_pax_insumo, ''))
  THEN
    SET campos = concat(campos, 'nro_pax_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_pax_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.nro_pax_insumo, '~');
  END IF;
  IF (IFNULL(new.tipo_precio, '') != IFNULL(old.tipo_precio, ''))
  THEN
    SET campos = concat(campos, 'tipo_precio~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.tipo_precio, ''), '~');
    SET valorActual = concat(valorActual, new.tipo_precio, '~');
  END IF;
  IF (IFNULL(new.precio_fijo, '') != IFNULL(old.precio_fijo, ''))
  THEN
    SET campos = concat(campos, 'precio_fijo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.precio_fijo, ''), '~');
    SET valorActual = concat(valorActual, new.precio_fijo, '~');
  END IF;
  IF (IFNULL(new.factor_precio, '') != IFNULL(old.factor_precio, ''))
  THEN
    SET campos = concat(campos, 'factor_precio~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.factor_precio, ''), '~');
    SET valorActual = concat(valorActual, new.factor_precio, '~');
  END IF;
  IF (IFNULL(new.costo_presupuestado, '') != IFNULL(old.costo_presupuestado, ''))
  THEN
    SET campos = concat(campos, 'costo_presupuestado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.costo_presupuestado, ''), '~');
    SET valorActual = concat(valorActual, new.costo_presupuestado, '~');
  END IF;
  IF (IFNULL(new.total_impuesto, '') != IFNULL(old.total_impuesto, ''))
  THEN
    SET campos = concat(campos, 'total_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.total_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.total_impuesto, '~');
  END IF;
  IF (IFNULL(new.costo_real, '') != IFNULL(old.costo_real, ''))
  THEN
    SET campos = concat(campos, 'costo_real~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.costo_real, ''), '~');
    SET valorActual = concat(valorActual, new.costo_real, '~');
  END IF;
  IF (IFNULL(new.descuento_insumo, '') != IFNULL(old.descuento_insumo, ''))
  THEN
    SET campos = concat(campos, 'descuento_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.descuento_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.descuento_insumo, '~');
  END IF;
  IF (IFNULL(new.nro_comprobante_insumo, '') != IFNULL(old.nro_comprobante_insumo, ''))
  THEN
    SET campos = concat(campos, 'nro_comprobante_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_comprobante_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.nro_comprobante_insumo, '~');
  END IF;
  IF (IFNULL(new.fecha_inicio_insumo, '') != IFNULL(old.fecha_inicio_insumo, ''))
  THEN
    SET campos = concat(campos, 'fecha_inicio_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_inicio_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_inicio_insumo, '~');
  END IF;
  IF (IFNULL(new.fecha_fin_insumo, '') != IFNULL(old.fecha_fin_insumo, ''))
  THEN
    SET campos = concat(campos, 'fecha_fin_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_fin_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_fin_insumo, '~');
  END IF;
  IF (IFNULL(new.fecha_max_pago, '') != IFNULL(old.fecha_max_pago, ''))
  THEN
    SET campos = concat(campos, 'fecha_max_pago~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_max_pago, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_max_pago, '~');
  END IF;
  IF (IFNULL(new.fecha_pago_insumo, '') != IFNULL(old.fecha_pago_insumo, ''))
  THEN
    SET campos = concat(campos, 'fecha_pago_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_pago_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_pago_insumo, '~');
  END IF;
  IF (IFNULL(new.codigo_confirma_proveedor, '') != IFNULL(old.codigo_confirma_proveedor, ''))
  THEN
    SET campos = concat(campos, 'codigo_confirma_proveedor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.codigo_confirma_proveedor, ''), '~');
    SET valorActual = concat(valorActual, new.codigo_confirma_proveedor, '~');
  END IF;
  IF (IFNULL(new.observacion_insumo, '') != IFNULL(old.observacion_insumo, ''))
  THEN
    SET campos = concat(campos, 'observacion_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_insumo, '~');
  END IF;
  IF (IFNULL(new.insumo_pagado, '') != IFNULL(old.insumo_pagado, ''))
  THEN
    SET campos = concat(campos, 'insumo_pagado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.insumo_pagado, ''), '~');
    SET valorActual = concat(valorActual, new.insumo_pagado, '~');
  END IF;
  IF (IFNULL(new.insumo_facturado, '') != IFNULL(old.insumo_facturado, ''))
  THEN
    SET campos = concat(campos, 'insumo_facturado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.insumo_facturado, ''), '~');
    SET valorActual = concat(valorActual, new.insumo_facturado, '~');
  END IF;
  IF (IFNULL(new.utilidad_x_insumo, '') != IFNULL(old.utilidad_x_insumo, ''))
  THEN
    SET campos = concat(campos, 'utilidad_x_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.utilidad_x_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.utilidad_x_insumo, '~');
  END IF;
  IF (IFNULL(new.aprueba_pago, '') != IFNULL(old.aprueba_pago, ''))
  THEN
    SET campos = concat(campos, 'aprueba_pago~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.aprueba_pago, ''), '~');
    SET valorActual = concat(valorActual, new.aprueba_pago, '~');
  END IF;
  IF (IFNULL(new.id_usuario_responsable, '') != IFNULL(old.id_usuario_responsable, ''))
  THEN
    SET campos = concat(campos, 'id_usuario_responsable~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_usuario_responsable, ''), '~');
    SET valorActual = concat(valorActual, new.id_usuario_responsable, '~');
  END IF;
  IF (IFNULL(new.hora_ejecucion, '') != IFNULL(old.hora_ejecucion, ''))
  THEN
    SET campos = concat(campos, 'hora_ejecucion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.hora_ejecucion, ''), '~');
    SET valorActual = concat(valorActual, new.hora_ejecucion, '~');
  END IF;
  IF (IFNULL(new.fecha_confirmacion, '') != IFNULL(old.fecha_confirmacion, ''))
  THEN
    SET campos = concat(campos, 'fecha_confirmacion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_confirmacion, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_confirmacion, '~');
  END IF;
  IF (IFNULL(new.time_limit, '') != IFNULL(old.time_limit, ''))
  THEN
    SET campos = concat(campos, 'time_limit~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.time_limit, ''), '~');
    SET valorActual = concat(valorActual, new.time_limit, '~');
  END IF;
  IF (IFNULL(new.dar_anticipo, '') != IFNULL(old.dar_anticipo, ''))
  THEN
    SET campos = concat(campos, 'dar_anticipo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.dar_anticipo, ''), '~');
    SET valorActual = concat(valorActual, new.dar_anticipo, '~');
  END IF;
  IF (IFNULL(new.centro_costos, '') != IFNULL(old.centro_costos, ''))
  THEN
    SET campos = concat(campos, 'centro_costos~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.centro_costos, ''), '~');
    SET valorActual = concat(valorActual, new.centro_costos, '~');
  END IF;
  IF (IFNULL(new.costo_real_sin_impuesto, '') != IFNULL(old.costo_real_sin_impuesto, ''))
  THEN
    SET campos = concat(campos, 'costo_real_sin_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.costo_real_sin_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.costo_real_sin_impuesto, '~');
  END IF;
  IF (IFNULL(new.inventario_descargado, '') != IFNULL(old.inventario_descargado, ''))
  THEN
    SET campos = concat(campos, 'inventario_descargado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.inventario_descargado, ''), '~');
    SET valorActual = concat(valorActual, new.inventario_descargado, '~');
  END IF;
  IF (IFNULL(new.lugar, '') != IFNULL(old.lugar, ''))
  THEN
    SET campos = concat(campos, 'lugar~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.lugar, ''), '~');
    SET valorActual = concat(valorActual, new.lugar, '~');
  END IF;
  SET usuario = new.id_usuario_modifica;
  SELECT CONCAT(IFNULL(i.id_detalle_proforma, 'id_detalle_factura'),IFNULL(i.id_detalle_factura, 'id_detalle_proforma'),'~id_itinerario_fac'), 
                              CONCAT(IFNULL(i.id_detalle_proforma, i.id_detalle_factura),IFNULL(i.id_detalle_factura, i.id_detalle_proforma),'~',i.id_itinerario_fac)
                         INTO camposMaestro, valoresMaestro
                         FROM gecoecua_ecuadoradventure.fac_itinerario i
                        WHERE i.id_itinerario_fac = old.id_itinerario_fac; 
  
  IF campos != '' THEN
    INSERT INTO gecoecua_ecuadoradventure.seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'fac_insumo_x_itinerario',
      'UPDATE',
      camposMaestro,
      valoresMaestro,
      valorPk,
      campos,
      valorAnterior,
      valorActual,
      usuario,
      NOW()
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fac_itinerario`
--

DROP TABLE IF EXISTS `fac_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_itinerario` (
  `id_itinerario_fac` int(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_proforma` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_detalle_factura` int(11) DEFAULT NULL COMMENT 'Código del detalle de la factura',
  `dia_itinerario` int(11) DEFAULT NULL COMMENT 'Número de día correspondiente al orden en el itinerario',
  `fecha_cumple_itinerario` date DEFAULT NULL,
  `imagen_itinerario` varchar(100) DEFAULT NULL COMMENT 'Imagen del itinerario de la proforma',
  `importado` char(1) DEFAULT NULL COMMENT 'Se coloca S=Si cuando fue importado de otro producto ajeno al que pertenece y N=No si no lo fue',
  `id_producto_importacion` varchar(15) DEFAULT NULL COMMENT 'Código del producto desde el que se extrajeron los días del itinerario',
  `dia_importacion` int(11) DEFAULT NULL COMMENT 'Día del itinerario importado',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_itinerario_fac`),
  KEY `fk_det_factura_a_itinerario` (`id_detalle_factura`),
  KEY `fk_det_proforma_a_itinerario` (`id_detalle_proforma`),
  CONSTRAINT `fk_det_factura_a_itinerario` FOREIGN KEY (`id_detalle_factura`) REFERENCES `fac_detalle_factura` (`id_detalle_factura`),
  CONSTRAINT `fk_det_proforma_a_itinerario` FOREIGN KEY (`id_detalle_proforma`) REFERENCES `fac_detalle_proforma` (`id_detalle_proforma`)
) ENGINE=InnoDB AUTO_INCREMENT=355093 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el itinerario de la factura';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_nota_credito`
--

DROP TABLE IF EXISTS `fac_nota_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_nota_credito` (
  `id_nota_credito` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla FAC_NOTA_CREDITO',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_factura` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `establecimiento_ats` varchar(100) DEFAULT NULL COMMENT 'Nro. de establecimiento para el ATS',
  `punto_emision_ats` varchar(100) DEFAULT NULL COMMENT 'Punto de emisión para el ATS',
  `nro_autorizacion_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `ambiente_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `emision_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `clave_acceso_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `tipo_comprobante_ats` varchar(4) DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación de la nota de crédito',
  `estado_nota_credito` varchar(4) DEFAULT NULL COMMENT 'Estado de la nota de crédito',
  `fecha_hora_autorizacion_ats` datetime DEFAULT NULL COMMENT 'Campo ATS',
  `nro_nota_credito` varchar(100) DEFAULT NULL COMMENT 'Número del documento generado de la nota de crédito',
  `porcentaje_dscto_adicional` decimal(15,6) DEFAULT NULL COMMENT 'Porcentaje de descuento adicional en la cabecera',
  `descuento_en_valor` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de descuento representado en valor',
  `prioridad_descuento` varchar(3) DEFAULT NULL COMMENT 'Indica sobre que cantidad se prioriza el descuento, la otra cambia',
  `tipo_electronica_manual` char(1) DEFAULT NULL COMMENT 'Indica si la factura, retención o nota de crédito fue E=Electrónica o M=Manual',
  `estado_envio` char(1) DEFAULT NULL COMMENT 'Este estado es para saber si se envió correctamente al SRI un documento',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_nota_credito`),
  KEY `fk_factura_a_nota_credito` (`id_factura`),
  KEY `fk_persona_a_nota_credito` (`id_persona`),
  CONSTRAINT `fk_factura_a_nota_credito` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_persona_a_nota_credito` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las notas de crédito que reversan las factura';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_proforma`
--

DROP TABLE IF EXISTS `fac_proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_proforma` (
  `id_proforma` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla RES_RESERVA',
  `codigo_agencia` varchar(100) DEFAULT NULL COMMENT 'Código de la agencia que realiza la reserva',
  `porcentaje_dscto_adicional` decimal(15,6) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL,
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación de la proforma',
  `observacion_proforma` text,
  `nro_pax` decimal(15,0) DEFAULT NULL COMMENT 'Cantidad de pasajeros',
  `id_persona_contacto` int(11) DEFAULT NULL COMMENT 'Código de la persona de contacto',
  `id_importado_de` int(11) DEFAULT NULL COMMENT 'Indica el código del documento desde el cual se hizo la importación',
  `importado_de` varchar(4) DEFAULT NULL COMMENT 'Indica el tipo de documento desde el cual se hizo la importación',
  `fecha_pago_proximo` date DEFAULT NULL COMMENT 'Fecha que indica el proximo pago de la reserva',
  `fecha_pago_final` date DEFAULT NULL COMMENT 'Fecha que indica el pago final de la reserva',
  `time_limit` datetime DEFAULT NULL,
  `observacion_privada` text,
  `descuento_en_valor` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de descuento representado en valor',
  `prioridad_descuento` varchar(3) DEFAULT NULL COMMENT 'Indica sobre que cantidad se prioriza el descuento, la otra cambia',
  `valor_pago_proximo` decimal(15,2) DEFAULT NULL COMMENT 'Valor que se pagará en la fecha pago próximo',
  `valor_pago_final` decimal(15,2) DEFAULT NULL COMMENT 'Valor que se pagará en la fecha pago final',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_proforma`),
  KEY `fk_persona_a_proforma` (`id_persona`),
  KEY `fk_reserva_a_proforma` (`id_reserva`),
  CONSTRAINT `fk_persona_a_proforma` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_reserva_a_proforma` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=3312 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las proformas';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_fac_proforma` AFTER UPDATE ON `fac_proforma` FOR EACH ROW BEGIN
  DECLARE valorPk VARCHAR(50);
  DECLARE usuario VARCHAR(50);
  DECLARE campos TEXT;
  DECLARE valorAnterior TEXT;
  DECLARE valorActual TEXT;
  DECLARE camposMaestro TEXT;
  DECLARE valoresMaestro TEXT;
  
  SET campos = '';
  SET valorAnterior = '';
  SET valorActual = '';
  SET camposMaestro = '';
  SET valoresMaestro = '';
  
  SET valorPk = old.id_proforma;

  IF (IFNULL(new.id_persona, '') != IFNULL(old.id_persona, ''))
  THEN
    SET campos = concat(campos, 'id_persona~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_persona, ''), '~');
    SET valorActual = concat(valorActual, new.id_persona, '~');
  END IF;
  IF (IFNULL(new.id_reserva, '') != IFNULL(old.id_reserva, ''))
  THEN
    SET campos = concat(campos, 'id_reserva~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_reserva, ''), '~');
    SET valorActual = concat(valorActual, new.id_reserva, '~');
  END IF;
  IF (IFNULL(new.codigo_agencia, '') != IFNULL(old.codigo_agencia, ''))
  THEN
    SET campos = concat(campos, 'codigo_agencia~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.codigo_agencia, ''), '~');
    SET valorActual = concat(valorActual, new.codigo_agencia, '~');
  END IF;
  IF (IFNULL(new.porcentaje_dscto_adicional, '') != IFNULL(old.porcentaje_dscto_adicional, ''))
  THEN
    SET campos = concat(campos, 'porcentaje_dscto_adicional~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.porcentaje_dscto_adicional, ''), '~');
    SET valorActual = concat(valorActual, new.porcentaje_dscto_adicional, '~');
  END IF;
  IF (IFNULL(new.id_motivo_descuento, '') != IFNULL(old.id_motivo_descuento, ''))
  THEN
    SET campos = concat(campos, 'id_motivo_descuento~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_motivo_descuento, ''), '~');
    SET valorActual = concat(valorActual, new.id_motivo_descuento, '~');
  END IF;
  IF (IFNULL(new.fecha_generacion, '') != IFNULL(old.fecha_generacion, ''))
  THEN
    SET campos = concat(campos, 'fecha_generacion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_generacion, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_generacion, '~');
  END IF;
  IF (IFNULL(new.observacion_proforma, '') != IFNULL(old.observacion_proforma, ''))
  THEN
    SET campos = concat(campos, 'observacion_proforma~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_proforma, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_proforma, '~');
  END IF;
  IF (IFNULL(new.nro_pax, '') != IFNULL(old.nro_pax, ''))
  THEN
    SET campos = concat(campos, 'nro_pax~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_pax, ''), '~');
    SET valorActual = concat(valorActual, new.nro_pax, '~');
  END IF;
  IF (IFNULL(new.id_persona_contacto, '') != IFNULL(old.id_persona_contacto, ''))
  THEN
    SET campos = concat(campos, 'id_persona_contacto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_persona_contacto, ''), '~');
    SET valorActual = concat(valorActual, new.id_persona_contacto, '~');
  END IF;
  IF (IFNULL(new.id_importado_de, '') != IFNULL(old.id_importado_de, ''))
  THEN
    SET campos = concat(campos, 'id_importado_de~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_importado_de, ''), '~');
    SET valorActual = concat(valorActual, new.id_importado_de, '~');
  END IF;
  IF (IFNULL(new.importado_de, '') != IFNULL(old.importado_de, ''))
  THEN
    SET campos = concat(campos, 'importado_de~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.importado_de, ''), '~');
    SET valorActual = concat(valorActual, new.importado_de, '~');
  END IF;
  IF (IFNULL(new.fecha_pago_proximo, '') != IFNULL(old.fecha_pago_proximo, ''))
  THEN
    SET campos = concat(campos, 'fecha_pago_proximo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_pago_proximo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_pago_proximo, '~');
  END IF;
  IF (IFNULL(new.fecha_pago_final, '') != IFNULL(old.fecha_pago_final, ''))
  THEN
    SET campos = concat(campos, 'fecha_pago_final~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_pago_final, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_pago_final, '~');
  END IF;
  IF (IFNULL(new.time_limit, '') != IFNULL(old.time_limit, ''))
  THEN
    SET campos = concat(campos, 'time_limit~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.time_limit, ''), '~');
    SET valorActual = concat(valorActual, new.time_limit, '~');
  END IF;
  IF (IFNULL(new.observacion_privada, '') != IFNULL(old.observacion_privada, ''))
  THEN
    SET campos = concat(campos, 'observacion_privada~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_privada, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_privada, '~');
  END IF;
  IF (IFNULL(new.descuento_en_valor, '') != IFNULL(old.descuento_en_valor, ''))
  THEN
    SET campos = concat(campos, 'descuento_en_valor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.descuento_en_valor, ''), '~');
    SET valorActual = concat(valorActual, new.descuento_en_valor, '~');
  END IF;
  IF (IFNULL(new.prioridad_descuento, '') != IFNULL(old.prioridad_descuento, ''))
  THEN
    SET campos = concat(campos, 'prioridad_descuento~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.prioridad_descuento, ''), '~');
    SET valorActual = concat(valorActual, new.prioridad_descuento, '~');
  END IF;
  IF (IFNULL(new.valor_pago_proximo, '') != IFNULL(old.valor_pago_proximo, ''))
  THEN
    SET campos = concat(campos, 'valor_pago_proximo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.valor_pago_proximo, ''), '~');
    SET valorActual = concat(valorActual, new.valor_pago_proximo, '~');
  END IF;
  IF (IFNULL(new.valor_pago_final, '') != IFNULL(old.valor_pago_final, ''))
  THEN
    SET campos = concat(campos, 'valor_pago_final~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.valor_pago_final, ''), '~');
    SET valorActual = concat(valorActual, new.valor_pago_final, '~');
  END IF;
  SET usuario = new.id_usuario_modifica;
  
  IF campos != '' THEN
    INSERT INTO gecoecua_ecuadoradventure.seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'fac_proforma',
      'UPDATE',
      camposMaestro,
      valoresMaestro,
      valorPk,
      campos,
      valorAnterior,
      valorActual,
      usuario,
      NOW()
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fac_tipo_forma_pago`
--

DROP TABLE IF EXISTS `fac_tipo_forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_tipo_forma_pago` (
  `id_tipo_forma_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_forma_pago_sri` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_TIPO_FORMA_PAGO_SRI',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_IMPUESTO',
  `descripcion_tipo_forma_pago` varchar(100) DEFAULT NULL,
  `efectivo_credito` char(1) DEFAULT NULL,
  `estado_tipo_forma_pago` char(1) DEFAULT 'A' COMMENT 'Indica si el empleado está Activo o Inactivo',
  `plazo` decimal(15,0) DEFAULT NULL COMMENT 'plazo del crédito',
  `requiere_cobro` char(1) DEFAULT 'N' COMMENT 'indica si requiere o no cobro',
  `requiere_entidad_financiera` char(1) DEFAULT 'N' COMMENT 'Indica si requiere o no informar datos de una entidad financiera',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_forma_pago`),
  KEY `fk_impuesto_a_tipo_forma_pago` (`id_impuesto`),
  CONSTRAINT `fk_impuesto_a_tipo_forma_pago` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Almacena los tipos de formas de pago existentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fac_tipo_forma_pago_sri`
--

DROP TABLE IF EXISTS `fac_tipo_forma_pago_sri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_tipo_forma_pago_sri` (
  `id_tipo_forma_pago_sri` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_forma_pago_sri` varchar(256) DEFAULT NULL,
  `codigo_sri` varchar(4) DEFAULT NULL,
  `estado_tipo_forma_pago_sri` char(1) DEFAULT 'A',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_forma_pago_sri`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='Tipos de formas de pago implantados por el SRI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_kardex`
--

DROP TABLE IF EXISTS `inv_kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_kardex` (
  `id_kardex` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del kardex',
  `id_proveedor` int(11) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código del insumo',
  `id_detalle_compra` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRV_DETALLE_COMPRA',
  `id_insumo_x_itinerario_fac` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_INSUMO_X_ITINERARIO',
  `signo_kardex` char(1) DEFAULT NULL COMMENT 'Indica si es entrada o salida',
  `cantidad_kardex` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad que entró o salio de la existencia',
  `valor_compra_kardex` decimal(15,4) DEFAULT NULL COMMENT 'Valor de compra del insumo a partir de una adquisición',
  `fecha_registro` datetime DEFAULT NULL COMMENT 'Fecha en la que se registra la entrada o salida de existencia',
  `tipo_registro` char(1) DEFAULT NULL COMMENT 'Indica de que tipo es la línea del registro, ya sea I=Inventario Inicial, E=Entrada, S=Salida',
  `cantidad_saldo` decimal(15,4) DEFAULT NULL COMMENT 'Para el resultado del cálculo de la entrada y salida',
  `valor_promedio` decimal(15,4) DEFAULT NULL COMMENT 'Para el resultado del cálculo de la entrada y salida',
  `valor_saldo` decimal(15,4) DEFAULT NULL COMMENT 'Para el resultado del cálculo de la entrada y salida',
  `id_motivo_ingreso` int(11) DEFAULT NULL COMMENT 'Motivo de ingreso manual',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_kardex`),
  KEY `fk_insumo_x_prv_a_kardex` (`id_proveedor`,`id_insumo`),
  KEY `fk_insumo_x_prv_a_kardex1` (`id_insumo`),
  KEY `fk_detalle_compra_a_kardex` (`id_detalle_compra`),
  KEY `fk_insumo_x_itinerario_a_kardex` (`id_insumo_x_itinerario_fac`),
  CONSTRAINT `fk_detalle_compra_a_kardex` FOREIGN KEY (`id_detalle_compra`) REFERENCES `prv_detalle_compra` (`id_detalle_compra`),
  CONSTRAINT `fk_insumo_a_kardex` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_insumo_x_itinerario_a_kardex` FOREIGN KEY (`id_insumo_x_itinerario_fac`) REFERENCES `fac_insumo_x_itinerario` (`id_insumo_x_itinerario_fac`),
  CONSTRAINT `fk_proveedor_a_kardex` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_tipo_presentacion`
--

DROP TABLE IF EXISTS `inv_tipo_presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_tipo_presentacion` (
  `id_tipo_presentacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_presentacion` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_presentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tabla donde se guardan los tipos de presentación que puede t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_ubicacion_existencia`
--

DROP TABLE IF EXISTS `inv_ubicacion_existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_ubicacion_existencia` (
  `id_ubicacion_existencia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_ubicacion_existencia` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion_existencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_unidad_medida`
--

DROP TABLE IF EXISTS `inv_unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_unidad_medida` (
  `id_unidad_medida` varchar(4) NOT NULL,
  `descripcion_unidad_medida` varchar(100) DEFAULT NULL,
  `tipo_unidad` char(1) DEFAULT NULL COMMENT 'Tipo de unidad U=Unico V=Varios',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_unidad_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_calle`
--

DROP TABLE IF EXISTS `per_calle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_calle` (
  `id_calle` int(11) NOT NULL AUTO_INCREMENT,
  `id_subsector_courier` int(11) DEFAULT NULL,
  `id_orientacion_calle` int(11) DEFAULT NULL,
  `id_ciudad_calle` int(11) DEFAULT NULL,
  `id_sector_calle` int(11) DEFAULT NULL,
  `descripcion_calle` varchar(100) DEFAULT NULL,
  `orientacion_calle` varchar(15) DEFAULT NULL,
  `numero_calle` int(11) DEFAULT NULL,
  `subnumero_calle` varchar(15) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_calle`),
  KEY `fk_orientacion_a_calle` (`id_orientacion_calle`),
  KEY `fk_subsector_a_calle` (`id_subsector_courier`),
  CONSTRAINT `fk_orientacion_a_calle` FOREIGN KEY (`id_orientacion_calle`) REFERENCES `per_orientacion_calle` (`id_orientacion_calle`),
  CONSTRAINT `fk_subsector_a_calle` FOREIGN KEY (`id_subsector_courier`) REFERENCES `per_subsector_courier` (`id_subsector_courier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las calles para saber su sector';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_caracteristica`
--

DROP TABLE IF EXISTS `per_caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_caracteristica` (
  `id_caracteristica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la característica',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_tipo_caracteristica` int(11) DEFAULT NULL COMMENT 'Código del tipo de característica',
  `descripcion_caracteristica` text COMMENT 'Descripción particular',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`),
  KEY `fk_persona_a_caracteristica` (`id_persona`),
  KEY `fk_tp_caract_a_caracteristica` (`id_tipo_caracteristica`),
  CONSTRAINT `fk_persona_a_caracteristica` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tp_caract_a_caracteristica` FOREIGN KEY (`id_tipo_caracteristica`) REFERENCES `per_tipo_caracteristica` (`id_tipo_caracteristica`)
) ENGINE=InnoDB AUTO_INCREMENT=28730 DEFAULT CHARSET=latin1 COMMENT='Contiene las características especiales de una persona, tall';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_ciudad`
--

DROP TABLE IF EXISTS `per_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_ciudad` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `id_provincia` int(11) DEFAULT NULL COMMENT 'Código de la provincia',
  `descripcion_ciudad` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ciudad`),
  KEY `fk_provincia_a_ciudad` (`id_provincia`),
  CONSTRAINT `fk_provincia_a_ciudad` FOREIGN KEY (`id_provincia`) REFERENCES `per_provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COMMENT='Almacena las ciudades, cantones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_denominacion`
--

DROP TABLE IF EXISTS `per_denominacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_denominacion` (
  `id_denominacion` varchar(4) NOT NULL COMMENT 'Código del tipo de denominación ',
  `descripcion_denominacion` varchar(100) DEFAULT NULL COMMENT 'Descripción propiamente dicha de la denominación',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_denominacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene el título, profesión o denominación de la persona, ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_direccion`
--

DROP TABLE IF EXISTS `per_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la dirección de la persona',
  `id_tipo_direccion` varchar(4) DEFAULT NULL COMMENT 'Código del tipo de dirección',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_calle` int(11) DEFAULT NULL,
  `id_ciudad_direccion` int(11) DEFAULT NULL,
  `id_sector_calle1` int(11) DEFAULT NULL,
  `id_subsector_calle1` int(11) DEFAULT NULL,
  `id_sector_calle2` int(11) DEFAULT NULL,
  `id_subsector_calle2` int(11) DEFAULT NULL,
  `id_calle_secundaria` int(11) DEFAULT NULL COMMENT 'Id calle secundaria',
  `id_ciudad_courier` int(11) DEFAULT NULL,
  `sector` varchar(256) DEFAULT NULL COMMENT 'Sitio donde se localiza la dirección',
  `calle_principal` varchar(256) DEFAULT NULL COMMENT 'Calle principal donde se encuentra la dirección',
  `nro_casa_o_edificio` varchar(100) DEFAULT NULL COMMENT 'Número de casa o edificio de la dirección',
  `codigo_tramo` varchar(100) DEFAULT NULL,
  `codigo_numerico` decimal(15,0) DEFAULT NULL,
  `calle_secundaria` varchar(256) DEFAULT NULL COMMENT 'Calle secundaria de la dirección',
  `nombre_edificio` varchar(256) DEFAULT NULL COMMENT 'Nombre del edificio de la dirección',
  `nro_departamento` varchar(100) DEFAULT NULL COMMENT 'Número del departamento',
  `dato_adicional` varchar(256) DEFAULT NULL COMMENT 'En caso de requerirse se colocan especificaciones adicionales de la dirección, como color de casa, etc.',
  `principal_direccion` char(1) DEFAULT NULL COMMENT 'Indica si es la dirección preferida',
  `latitud_gps` decimal(15,4) DEFAULT NULL COMMENT 'Dato para el módulo Verde',
  `longitud_gps` decimal(15,4) DEFAULT NULL COMMENT 'Dato para el módulo Verde',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_direccion`),
  KEY `fk_ciudad_a_direccion1` (`id_ciudad_direccion`),
  KEY `fk_calle_a_direccion` (`id_calle`),
  KEY `fk_persona_a_direccion` (`id_persona`),
  KEY `fk_tp_dir_a_direccion` (`id_tipo_direccion`),
  CONSTRAINT `fk_calle_a_direccion` FOREIGN KEY (`id_calle`) REFERENCES `per_calle` (`id_calle`),
  CONSTRAINT `fk_persona_a_direccion` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tp_dir_a_direccion` FOREIGN KEY (`id_tipo_direccion`) REFERENCES `per_tipo_direccion` (`id_tipo_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=latin1 COMMENT='Almacena todas las direcciones de la persona';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_ficha_medica`
--

DROP TABLE IF EXISTS `per_ficha_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_ficha_medica` (
  `id_ficha_medica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del item de la ficha médica',
  `id_tipo_ficha_medica` int(11) DEFAULT NULL COMMENT 'Código del tipo de ficha médica',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `descripcion_ficha_medica` varchar(256) DEFAULT NULL COMMENT 'Descripción del item de la ficha médica',
  `codigo_examen` varchar(256) DEFAULT NULL COMMENT 'Código del examen realizado',
  `resultado_examen` char(1) DEFAULT NULL COMMENT 'Resultado del examen realizado',
  `app_si_no` char(1) DEFAULT 'N' COMMENT 'Indica si viene de la aplicación médica o no',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ficha_medica`),
  KEY `fk_persona_a_ficha_medica` (`id_persona`),
  KEY `fk_tp_fic_med_a_ficha_medica` (`id_tipo_ficha_medica`),
  CONSTRAINT `fk_persona_a_ficha_medica` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tp_fic_med_a_ficha_medica` FOREIGN KEY (`id_tipo_ficha_medica`) REFERENCES `per_tipo_ficha_medica` (`id_tipo_ficha_medica`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='Contiene los datos de la ficha médica de la persona';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_identificacion`
--

DROP TABLE IF EXISTS `per_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_identificacion` (
  `id_identificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la identificación',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_tipo_identificacion` varchar(4) DEFAULT NULL COMMENT 'Código del tipo de identificación',
  `descripcion_identificacion` varchar(100) DEFAULT NULL COMMENT 'Número propiamente dicho de la identificación',
  `fecha_caducidad` date DEFAULT NULL COMMENT 'Fecha de caducidad de la identificación',
  `principal_identificacion` char(1) DEFAULT NULL COMMENT 'Campo que identifica cuál es la identificación principal (solo puede haber una)',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_identificacion`),
  KEY `fk_persona_a_identificacion` (`id_persona`),
  KEY `fk_tipo_iden_a_identificacion` (`id_tipo_identificacion`),
  CONSTRAINT `fk_persona_a_identificacion` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tipo_iden_a_identificacion` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `per_tipo_identificacion` (`id_tipo_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11939 DEFAULT CHARSET=latin1 COMMENT='Almacena los números de identificación que posee una persona';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_nacionalidad`
--

DROP TABLE IF EXISTS `per_nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la nacionalidad',
  `descripcion_nacionalidad` varchar(100) DEFAULT NULL COMMENT 'Descripción de la nacionalidad',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los gerundios de los paises, o puede ser ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_orientacion_calle`
--

DROP TABLE IF EXISTS `per_orientacion_calle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_orientacion_calle` (
  `id_orientacion_calle` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_orientacion_calle` varchar(100) DEFAULT NULL,
  `orden_orientacion_calle` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_orientacion_calle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los datos de la orientación de la calle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_pais`
--

DROP TABLE IF EXISTS `per_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del país',
  `descripcion_pais` varchar(100) DEFAULT NULL COMMENT 'Nombre del país',
  `codigo_area` varchar(4) DEFAULT NULL COMMENT 'El código de área a nivel internacional',
  `codigo_ats` varchar(15) DEFAULT NULL COMMENT 'Campo ATS',
  `codigo_paraiso_fiscal` varchar(4) DEFAULT NULL COMMENT 'Código paraíso fiscal según SRI',
  `tipo_regimen_fiscal` varchar(2) DEFAULT NULL COMMENT 'Tipos de regímen fiscal del exterior',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los paises del mundo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_persona`
--

DROP TABLE IF EXISTS `per_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la persona',
  `id_tipo_empresa` varchar(4) DEFAULT NULL COMMENT 'Código del tipo de empresa',
  `id_nacionalidad` int(11) DEFAULT NULL COMMENT 'Código de la nacionalidad',
  `id_denominacion` varchar(4) DEFAULT NULL COMMENT 'Código del tipo de denominación ',
  `id_pais` int(11) DEFAULT NULL COMMENT 'Código del país',
  `id_zona` int(11) DEFAULT NULL,
  `apellido1` varchar(25) DEFAULT NULL COMMENT 'Primer apellido de la persona',
  `apellido2` varchar(25) DEFAULT NULL COMMENT 'Segundo apellido de la persona',
  `nombre1` varchar(25) DEFAULT NULL COMMENT 'Primer nombre de la persona',
  `nombre2` varchar(25) DEFAULT NULL COMMENT 'Segundo nombre de la persona',
  `nombre_comercial` varchar(256) DEFAULT NULL COMMENT 'Nombre comercial de la persona, en caso de naturales es con la denominación, en caso de empresas se solicita',
  `razon_social` varchar(256) DEFAULT NULL COMMENT 'Es la razón social de una persona, en caso de natural, es la unión de sus apellidos y nombres, en caso de jurídica es el nombre con el que se le llama usualmente',
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'Es la fecha de nacimiento de una persona natural, en el caso de jurídica es la fecha de constitución',
  `correo_electronico` varchar(256) DEFAULT NULL COMMENT 'Dirección de correo electrónico o e-mail de la persona',
  `pagina_web` varchar(256) DEFAULT NULL COMMENT 'Dirección de la página web de la persona ',
  `apartado_postal` varchar(256) DEFAULT NULL COMMENT 'Dirección de casilla de correo de la persona',
  `fotografia` varchar(256) DEFAULT NULL COMMENT 'Ruta de acceso al archivo imagen que contiene la fotografía de la persona',
  `estado_persona` char(1) DEFAULT NULL COMMENT 'Si la persona esta activa o no en la base de datos - muerto/ no es empleado/ ',
  `newsletter_si_no` char(1) DEFAULT NULL COMMENT 'Para saber si el cliente quiere recibir emails de la empresa',
  `es_entidad_financiera` char(1) DEFAULT 'N' COMMENT 'Indica si es una entidad financiera o no',
  `genero` char(1) DEFAULT NULL COMMENT 'Sexo de la persona',
  `tipo_persona` char(1) DEFAULT NULL COMMENT 'Tipo de la persona, J=empresa, N=natural',
  `estado_civil` char(1) DEFAULT NULL COMMENT 'Indica el estado civil de la persona, S=Soltero, C=Casado, V=Viudo, U=Unión libre, D=Divorciado',
  `dias_time_limit` int(11) DEFAULT NULL COMMENT 'Número de días que debe transcurrir entre la fecha time limit y la fecha actual para lanzar alertas',
  `nro_horas_caso` int(11) DEFAULT NULL COMMENT 'Indica el número de horas de resolución por usuario y por agencia',
  `replica_persona` char(1) DEFAULT 'S' COMMENT 'Indica si la persona se replica o no en la sincronización de empresas',
  `nick_empresa_relacionada` varchar(256) DEFAULT NULL COMMENT 'Nick de la empresa relacionada',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk_denom_a_persona` (`id_denominacion`),
  KEY `fk_nacionalidad_a_persona` (`id_nacionalidad`),
  KEY `fk_pais_a_persona` (`id_pais`),
  KEY `fk_tp_emp_a_persona` (`id_tipo_empresa`),
  KEY `fk_zona_a_persona` (`id_zona`),
  CONSTRAINT `fk_denom_a_persona` FOREIGN KEY (`id_denominacion`) REFERENCES `per_denominacion` (`id_denominacion`),
  CONSTRAINT `fk_nacionalidad_a_persona` FOREIGN KEY (`id_nacionalidad`) REFERENCES `per_nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `fk_pais_a_persona` FOREIGN KEY (`id_pais`) REFERENCES `per_pais` (`id_pais`),
  CONSTRAINT `fk_tp_emp_a_persona` FOREIGN KEY (`id_tipo_empresa`) REFERENCES `per_tipo_empresa` (`id_tipo_empresa`),
  CONSTRAINT `fk_zona_a_persona` FOREIGN KEY (`id_zona`) REFERENCES `per_zona` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=13289 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los datos generales con los que se le ide';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_provincia`
--

DROP TABLE IF EXISTS `per_provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_provincia` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la provincia',
  `id_pais` int(11) DEFAULT NULL COMMENT 'Código del país',
  `descripcion_provincia` varchar(100) DEFAULT NULL COMMENT 'Nombre de la provincia',
  `codigo_area` varchar(4) DEFAULT NULL COMMENT 'El código de área a nivel internacional',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_provincia`),
  KEY `fk_pais_a_provincia` (`id_pais`),
  CONSTRAINT `fk_pais_a_provincia` FOREIGN KEY (`id_pais`) REFERENCES `per_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='Almacena las posibles provincias de cualquier país';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_relacion`
--

DROP TABLE IF EXISTS `per_relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_relacion` (
  `id_relacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_relacion` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_persona2` int(11) DEFAULT NULL,
  `principal_relacion` char(1) DEFAULT NULL COMMENT 'Indica si es la relación principal y solo hay una por persona',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_relacion`),
  KEY `fk_persona_a_relacion2` (`id_persona2`),
  KEY `fk_persona_a_relacion1` (`id_persona`),
  KEY `fk_tipo_relacion_a_relacion` (`id_tipo_relacion`),
  CONSTRAINT `fk_persona_a_relacion1` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_persona_a_relacion2` FOREIGN KEY (`id_persona2`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tipo_relacion_a_relacion` FOREIGN KEY (`id_tipo_relacion`) REFERENCES `per_tipo_relacion` (`id_tipo_relacion`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='Contiene los datos de una relación entre dos personas, A he';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_sector_courier`
--

DROP TABLE IF EXISTS `per_sector_courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_sector_courier` (
  `id_sector_courier` int(11) NOT NULL AUTO_INCREMENT,
  `id_ciudad` int(11) DEFAULT NULL,
  `descripcion_sector_courier` varchar(256) DEFAULT NULL,
  `limite_sector_courier` varchar(256) DEFAULT NULL,
  `orden_sector_courier` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sector_courier`),
  KEY `fk_ciudad_a_sector` (`id_ciudad`),
  CONSTRAINT `fk_ciudad_a_sector` FOREIGN KEY (`id_ciudad`) REFERENCES `per_ciudad` (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_sincroniza_con`
--

DROP TABLE IF EXISTS `per_sincroniza_con`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_sincroniza_con` (
  `id_sincroniza_con` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PER_SINCRONIZA_CON',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PER_PERSONA',
  `id_empresa_relacionada` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRM_EMPRESA_RELACIONADA',
  `sincroniza` char(1) DEFAULT 'N' COMMENT 'Indica si se debe insertar esta persona en las otras empresas relacionadas',
  PRIMARY KEY (`id_sincroniza_con`),
  KEY `fk_persona_a_sincroniza_con` (`id_persona`),
  KEY `fk_empresa_relacionada_a_sincroniza_con` (`id_empresa_relacionada`),
  CONSTRAINT `fk_empresa_relacionada_a_sincroniza_con` FOREIGN KEY (`id_empresa_relacionada`) REFERENCES `prm_empresa_relacionada` (`id_empresa_relacionada`),
  CONSTRAINT `fk_persona_a_sincroniza_con` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_subsector_courier`
--

DROP TABLE IF EXISTS `per_subsector_courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_subsector_courier` (
  `id_subsector_courier` int(11) NOT NULL AUTO_INCREMENT,
  `id_sector_courier` int(11) DEFAULT NULL,
  `id_ciudad_subsector` int(11) DEFAULT NULL,
  `descripcion_subsector_courier` varchar(100) DEFAULT NULL,
  `limite_sector_courier` varchar(256) DEFAULT NULL,
  `orden_subsector_courier` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_subsector_courier`),
  KEY `fk_sector_a_subsector` (`id_sector_courier`),
  CONSTRAINT `fk_sector_a_subsector` FOREIGN KEY (`id_sector_courier`) REFERENCES `per_sector_courier` (`id_sector_courier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Subsector del cuourier';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_telefono`
--

DROP TABLE IF EXISTS `per_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_telefono` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del teléfono',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_tipo_telefono` char(4) DEFAULT NULL,
  `descripcion_telefono` varchar(100) DEFAULT NULL COMMENT 'Número de teléfono',
  `principal_telefono` char(1) DEFAULT NULL COMMENT 'Indica si es el teléfono preferido',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `fk_persona_a_telefono` (`id_persona`),
  KEY `fk_tipo_telefono_a_telefono` (`id_tipo_telefono`),
  CONSTRAINT `fk_persona_a_telefono` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tipo_telefono_a_telefono` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `per_tipo_telefono` (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=1659 DEFAULT CHARSET=latin1 COMMENT='Almacena todos los teléfonos de una persona';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_tipo_caracteristica`
--

DROP TABLE IF EXISTS `per_tipo_caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_tipo_caracteristica` (
  `id_tipo_caracteristica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del tipo de característica',
  `descripcion_tipo_caracteristica` varchar(100) DEFAULT NULL COMMENT 'Descripción o nombre del tipo de característica',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_caracteristica`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='Contiene el tipo de característica de la persona, que puede ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_tipo_direccion`
--

DROP TABLE IF EXISTS `per_tipo_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_tipo_direccion` (
  `id_tipo_direccion` varchar(4) NOT NULL COMMENT 'Código del tipo de dirección',
  `descripcion_tipo_direccion` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de dirección',
  `principal_tipo_direccion` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los tipos de dirección posibles, puede ser DOMICILI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_tipo_empresa`
--

DROP TABLE IF EXISTS `per_tipo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_tipo_empresa` (
  `id_tipo_empresa` varchar(4) NOT NULL COMMENT 'Código del tipo de empresa',
  `descripcion_tipo_empresa` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de empresa',
  `tipo_empresa_interno` varchar(4) DEFAULT NULL COMMENT 'Es el código interno para saber si es una FIN=Institución Financiera, PER=Solo una persona particular',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el tipo de empresa, en caso de ser una pe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_tipo_ficha_medica`
--

DROP TABLE IF EXISTS `per_tipo_ficha_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_tipo_ficha_medica` (
  `id_tipo_ficha_medica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del tipo de ficha médica',
  `descripcion_tipo_ficha_medica` varchar(100) DEFAULT NULL COMMENT 'Descripción o nombre del tipo de item que va a ser usado en la ficha médica',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_ficha_medica`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Contiene los tipos de ficha médica, puede ser, enfermedad ac';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_tipo_identificacion`
--

DROP TABLE IF EXISTS `per_tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_tipo_identificacion` (
  `id_tipo_identificacion` varchar(4) NOT NULL COMMENT 'Código del tipo de identificación',
  `id_tipo_identificacion_especial` varchar(3) DEFAULT NULL,
  `descripcion_tipo_identificacion` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de identificación',
  `tipo_identificacion_ats` varchar(3) DEFAULT NULL COMMENT 'Tipo de identificación relacionada al SRI',
  `principal_tipo_identificacion` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_identificacion`),
  KEY `fk_tipo_identif_esp_a_tipo_identificacion` (`id_tipo_identificacion_especial`),
  CONSTRAINT `fk_tipo_identif_esp_a_tipo_identificacion` FOREIGN KEY (`id_tipo_identificacion_especial`) REFERENCES `prv_tipo_identificacion_especial` (`id_tipo_identificacion_especial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los tipos posibles de identificación, puede ser CED';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_tipo_relacion`
--

DROP TABLE IF EXISTS `per_tipo_relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_tipo_relacion` (
  `id_tipo_relacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del tipo de relación',
  `descripcion_tipo_relacion` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de relación',
  `id_tipo_relacion_inversa` int(11) DEFAULT NULL COMMENT 'Sirve para identificar la relación inversa a la que corresponde',
  `tipo_interno` varchar(4) DEFAULT NULL COMMENT 'Sirve para indicar el tipo de relación interno para saber cuál es la relación que debe ser usada en uno u otro caso',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_relacion`),
  UNIQUE KEY `idx_unk_tipo_interno` (`tipo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Contiene los tipos de relaciones existentes, hermano(a), esp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_tipo_telefono`
--

DROP TABLE IF EXISTS `per_tipo_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_tipo_telefono` (
  `id_tipo_telefono` char(4) NOT NULL,
  `descripcion_tipo_telefono` varchar(100) DEFAULT NULL,
  `principal_tipo_telefono` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el tipo del teléfono del cliente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `per_zona`
--

DROP TABLE IF EXISTS `per_zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_zona` (
  `id_zona` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_zona` varchar(250) DEFAULT NULL,
  `porcentaje_zona` decimal(15,8) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_archivo_producto`
--

DROP TABLE IF EXISTS `prd_archivo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_archivo_producto` (
  `id_archivo_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRD_ARCHIVO_PRODUCTO',
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `descripcion_archivo_producto` varchar(256) DEFAULT NULL COMMENT 'Descripción del archivo del producto',
  `nombre_archivo` varchar(100) DEFAULT NULL COMMENT 'Nombre del archivo donde está grabado el objeto',
  `tipo_archivo` varchar(3) DEFAULT NULL COMMENT 'Tipo de archivo que se está ingresando TXT=Texto, IMG=Imagen',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_archivo_producto`),
  KEY `fk_producto_a_archivo` (`id_producto`),
  CONSTRAINT `fk_producto_a_archivo` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1 COMMENT='Almacena los archivos de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_cuenta_x_impuesto`
--

DROP TABLE IF EXISTS `prd_cuenta_x_impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_cuenta_x_impuesto` (
  `id_cuenta_x_impuesto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRD_CUENTA_X_IMPUESTO',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta_venta` int(11) DEFAULT NULL COMMENT 'Cuenta para la venta',
  `id_cuenta_compra` int(11) DEFAULT NULL COMMENT 'Cuenta para la compra',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_x_impuesto`),
  UNIQUE KEY `idx_cuenta_x_periodo_x_impuesto` (`id_impuesto`,`id_periodo`),
  KEY `fk_periodo_a_cuenta_x_impuesto` (`id_periodo`),
  CONSTRAINT `fk_impuesto_a_cuenta` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_periodo_a_cuenta_x_impuesto` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las cuentas del impuesto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_cuenta_x_insumo`
--

DROP TABLE IF EXISTS `prd_cuenta_x_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_cuenta_x_insumo` (
  `id_cuenta_x_insumo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRD_CUENTA_X_INSUMO',
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta_insumo` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar los movimientos de insumos',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_x_insumo`),
  UNIQUE KEY `idx_cuenta_x_periodo_x_insumo` (`id_insumo`,`id_periodo`),
  KEY `fk_periodo_a_cuenta_x_insumo` (`id_periodo`),
  CONSTRAINT `fk_insumo_a_cuenta` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_periodo_a_cuenta_x_insumo` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=1505 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las cuentas por insumo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_cuenta_x_producto`
--

DROP TABLE IF EXISTS `prd_cuenta_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_cuenta_x_producto` (
  `id_cuenta_x_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRD_CUENTA_X_PRODUCTO',
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta_producto` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar los movimientos del producto',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_x_producto`),
  UNIQUE KEY `idx_cuenta_x_periodo_x_producto` (`id_producto`,`id_periodo`),
  KEY `fk_periodo_a_cuenta_x_producto` (`id_periodo`),
  CONSTRAINT `fk_periodo_a_cuenta_x_producto` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`),
  CONSTRAINT `fk_producto_a_cuenta` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena las cuentas del producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_detalle_patron_insumo`
--

DROP TABLE IF EXISTS `prd_detalle_patron_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_detalle_patron_insumo` (
  `id_detalle_patron_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_insumo` int(11) DEFAULT NULL COMMENT 'Código del tipo de insumo',
  `id_precio_insumo` int(11) DEFAULT NULL COMMENT 'Código lista de precios',
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_patron_insumo` int(11) DEFAULT NULL,
  `tipo_insumo_x_itinerario` char(1) DEFAULT NULL COMMENT 'Indica si es I=insumo o P=producto',
  `tipo_precio` char(1) DEFAULT NULL COMMENT 'Es el tipo de precio que se está aplicando al producto, C=Calculado en base a los insumos o F=Fijo',
  `precio_fijo` decimal(15,4) DEFAULT NULL COMMENT 'Es el precio fijo del insumo',
  `factor_precio` decimal(15,4) DEFAULT NULL COMMENT 'Es el factor por el que se multiplica el precio',
  `cantidad_insumo_producto` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad que se supone se usará en la concepción del producto',
  `utilidad_x_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de utilidad por insumo en el producto',
  `hora_ejecucion` time DEFAULT NULL COMMENT 'Permite almacenar la hora de ejecución de un servicio',
  `observacion_patron_insumo` text COMMENT 'Observación para heredar',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_patron_insumo`),
  KEY `fk_insumo_a_detpatron` (`id_insumo`),
  KEY `fk_patron_a_detpatron` (`id_patron_insumo`),
  KEY `fk_precio_insumo_a_detpatron` (`id_precio_insumo`),
  KEY `fk_tipo_insumo_a_detpatron` (`id_tipo_insumo`),
  CONSTRAINT `fk_insumo_a_detpatron` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_patron_a_detpatron` FOREIGN KEY (`id_patron_insumo`) REFERENCES `prd_patron_insumo` (`id_patron_insumo`),
  CONSTRAINT `fk_precio_insumo_a_detpatron` FOREIGN KEY (`id_precio_insumo`) REFERENCES `prd_precio_insumo` (`id_precio_insumo`),
  CONSTRAINT `fk_tipo_insumo_a_detpatron` FOREIGN KEY (`id_tipo_insumo`) REFERENCES `prd_tipo_insumo` (`id_tipo_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=1084 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los detalles del patrón de insumos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_disponibilidad`
--

DROP TABLE IF EXISTS `prd_disponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_disponibilidad` (
  `id_disponibilidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `fecha_inicio_disponibilidad` date DEFAULT NULL COMMENT 'Fecha donde inicia la disponibilidad',
  `fecha_fin_disponibilidad` date DEFAULT NULL COMMENT 'Fecha donde finaliza la disponibilidad',
  `disponibilidad` int(11) DEFAULT NULL COMMENT 'Número de espacios disponibles',
  `estado_disponibilidad` char(1) DEFAULT NULL COMMENT 'Estado de esta disponibilidad',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_disponibilidad`),
  KEY `fk_producto_a_disponibilidad` (`id_producto`),
  CONSTRAINT `fk_producto_a_disponibilidad` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las fechas de disponibilidad del producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_idioma_x_itinerario`
--

DROP TABLE IF EXISTS `prd_idioma_x_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_idioma_x_itinerario` (
  `id_idioma_x_itinerario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `id_tipo_inclusion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_TIPO_INCLUSION',
  `id_itinerario` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `descripcion_itinerario` text COMMENT 'Descripción del itinerario',
  `origen` varchar(100) DEFAULT NULL COMMENT 'Punto de salida',
  `destino` varchar(100) DEFAULT NULL COMMENT 'Punto de llegada',
  `actividad` varchar(256) DEFAULT NULL COMMENT 'Actividad que se va a realizar durante el viaje o en el destino',
  `duracion_itinerario` varchar(100) DEFAULT NULL COMMENT 'Duración del itinerario actual',
  `tipo_comida_incluida` varchar(10) DEFAULT NULL,
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_idioma_x_itinerario`),
  KEY `fk_idioma_a_itinerario` (`id_idioma`),
  KEY `fk_itinerario_a_idioma` (`id_itinerario`),
  CONSTRAINT `fk_idioma_a_itinerario` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_itinerario_a_idioma` FOREIGN KEY (`id_itinerario`) REFERENCES `prd_itinerario` (`id_itinerario`)
) ENGINE=InnoDB AUTO_INCREMENT=7762 DEFAULT CHARSET=latin1 COMMENT='Almacena el itinerario en diferentes idiomas configurados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_idioma_x_producto`
--

DROP TABLE IF EXISTS `prd_idioma_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_idioma_x_producto` (
  `id_idioma_x_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `nombre_corto` text COMMENT 'Nombre corto que identifica al producto actual',
  `descripcion_producto` text COMMENT 'Descripción del producto',
  `principal_idioma` char(1) DEFAULT NULL COMMENT 'Indica cual idioma debe actualizar en los datos principales',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_idioma_x_producto`),
  UNIQUE KEY `idx_unico_idioma_x_producto` (`id_producto`,`id_idioma`),
  KEY `fk_idioma_a_producto` (`id_idioma`),
  CONSTRAINT `fk_idioma_a_producto` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_producto_a_idioma` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4336 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_impuesto`
--

DROP TABLE IF EXISTS `prd_impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_impuesto` (
  `id_impuesto` varchar(4) NOT NULL COMMENT 'Código del impuesto o descuento a aplicarse',
  `descripcion_impuesto` varchar(100) DEFAULT NULL COMMENT 'Descripción del impuesto o descuento a aplicarse',
  `cantidad_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto o descuento a aplicarse',
  `tipo_impuesto` varchar(4) DEFAULT NULL COMMENT 'Tipo, impuesto o cantidad fija a aplicarse, es decir si es un P=Porcentaje o es un V= valor fijo',
  `tipo_valor` char(1) DEFAULT 'F' COMMENT 'Indica de donde toma el valor, sea F=fijo o del R=rango',
  `obligatoriedad` varchar(4) DEFAULT NULL COMMENT 'Indica Si el impuesto o descuento es obligatorio o no',
  `fecha_desde_ats` date DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_hasta_ats` date DEFAULT NULL COMMENT 'Campo ATS',
  `tipo_ats` varchar(3) DEFAULT NULL COMMENT 'Tipo de impuesto para el ATS',
  `codigo_porcentaje` varchar(11) DEFAULT NULL,
  `codigo_impuesto_retencion` varchar(4) DEFAULT NULL,
  `estado_impuesto` char(1) DEFAULT 'A' COMMENT 'Indica A=Activo e I=Inactivo',
  `id_usuario_crea` varchar(15) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(15) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los impuestos y/o descuentos aplicados sobre cada p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_impuesto_x_insumo`
--

DROP TABLE IF EXISTS `prd_impuesto_x_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_impuesto_x_insumo` (
  `id_impuesto_x_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código del insumo',
  `valor_impuesto` decimal(15,4) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código del impuesto o descuento a aplicarse',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_impuesto_x_insumo`),
  UNIQUE KEY `idx_norepetir_impuesto_insumo` (`id_impuesto`,`id_insumo`),
  KEY `fk_insumo_a_imp_x_insumo` (`id_insumo`),
  CONSTRAINT `fk_impuesto_a_imp_x_ins` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_insumo_a_imp_x_insumo` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=11011 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los impuetos a los que está sujeto un ins';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_prd_impuesto_x_insumo` AFTER UPDATE ON `prd_impuesto_x_insumo` FOR EACH ROW BEGIN
  DECLARE vcValorPk VARCHAR(50);
  DECLARE vcUsuario VARCHAR(50);
  DECLARE vcCampos TEXT;
  DECLARE vcValorAnterior TEXT;
  DECLARE vcValorActual TEXT;
  DECLARE vcCamposMaestro TEXT;
  DECLARE vcValoresMaestro TEXT;
  
  SET vcCampos = '';
  SET vcValorAnterior = '';
  SET vcValorActual = '';
  SET vcCamposMaestro = '';
  SET vcValoresMaestro = '';

  SET vcValorPk = old.id_impuesto_x_insumo;
  IF(IFNULL(new.id_insumo, '') != IFNULL(old.id_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_insumo, '~');
  END IF;
  
  IF(IFNULL(new.id_impuesto, '') != IFNULL(old.id_impuesto, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_impuesto~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_impuesto, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_impuesto, '~');
  END IF;
  
  SET vcUsuario = new.id_usuario_modifica;
  SET vcCamposMaestro = 'id_insumo';
  SET vcValoresMaestro = old.id_insumo;  
  
  IF(vcCampos != '')
  THEN
    INSERT INTO seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'prd_impuesto_x_insumo',
      'UPDATE',
      vcCamposMaestro,
      vcValoresMaestro,
      vcValorPk,
      vcCampos,
      vcValorAnterior,
      vcValorActual,
      vcUsuario,
      ADDTIME(now(), '00:00')
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prd_impuesto_x_producto`
--

DROP TABLE IF EXISTS `prd_impuesto_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_impuesto_x_producto` (
  `id_impuesto_x_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código del impuesto o descuento a aplicarse',
  `id_producto` varchar(15) DEFAULT NULL,
  `valor_impuesto` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_impuesto_x_producto`),
  UNIQUE KEY `idx_norepetir_impuesto_producto` (`id_impuesto`,`id_producto`),
  KEY `fk_producto_a_imp_x_prd` (`id_producto`),
  CONSTRAINT `fk_impuesto_a_imp_x_prd` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_producto_a_imp_x_prd` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los impuestos que aplican sobre cada prod';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_insumo`
--

DROP TABLE IF EXISTS `prd_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_insumo` (
  `id_insumo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del insumo',
  `id_tipo_insumo` int(11) DEFAULT NULL COMMENT 'Código del tipo de insumo',
  `id_tipo_presentacion` int(11) DEFAULT NULL,
  `id_ubicacion_existencia` int(11) DEFAULT NULL,
  `id_unidad_medida` varchar(4) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRV_PROVEEDOR',
  `porcion_x_medida` decimal(15,4) DEFAULT NULL COMMENT 'Indica cuantas porciones se gastarán con cada medida que ingrese',
  `descripcion_insumo` varchar(256) DEFAULT NULL COMMENT 'Descripción del insumo',
  `costo_presupuestado` decimal(15,4) DEFAULT NULL COMMENT 'Costo presupuestado',
  `costo_promedio` decimal(15,4) DEFAULT NULL COMMENT 'Costro del promedio ponderado',
  `id_moneda_presupuesto` int(11) DEFAULT NULL,
  `estado_insumo` char(1) DEFAULT NULL,
  `individual_general` char(1) DEFAULT NULL COMMENT 'Individual I (por cada uno) o General G (para todos)',
  `imagen_insumo` varchar(256) DEFAULT NULL,
  `stock_maximo` decimal(15,4) DEFAULT NULL,
  `stock_minimo` decimal(15,4) DEFAULT NULL,
  `publico_privado` char(1) DEFAULT NULL COMMENT 'Indica si el insumo es público que lo puede mirar cualquiera o privado solo gente interna',
  `tipo_precio_insumo` char(1) DEFAULT NULL COMMENT 'Campo que indica el tipo de precio que se aplicará al insumo, puede ser L=Tomar del listado, I=Tomar del inventario',
  `observacion_insumo` text COMMENT 'Observaciones del insumo',
  `tipo_bien` varchar(3) DEFAULT NULL COMMENT 'Indica si el producto es un BIEN o un SERVICIO',
  `dar_anticipo` char(1) DEFAULT 'N' COMMENT 'Indica si se debe S dar o no N un anticipo antes de operar la reserva',
  `codigo_externo` varchar(100) DEFAULT NULL COMMENT 'Código que sirve para emparejar con los insumos de las facturas de venta del proveedor',
  `caja_chica` char(1) DEFAULT NULL COMMENT 'Indica S=si se maneja o N=no con caja chica',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_insumo`),
  KEY `fk_insumo_a_tp_insumo` (`id_tipo_insumo`),
  KEY `fk_presentacion_a_insumo` (`id_tipo_presentacion`),
  KEY `fk_ubic_exist_a_insumo` (`id_ubicacion_existencia`),
  KEY `fk_und_med_a_insumo` (`id_unidad_medida`),
  KEY `fk_proveedor_a_insumo` (`id_proveedor`),
  CONSTRAINT `fk_insumo_a_tp_insumo` FOREIGN KEY (`id_tipo_insumo`) REFERENCES `prd_tipo_insumo` (`id_tipo_insumo`),
  CONSTRAINT `fk_presentacion_a_insumo` FOREIGN KEY (`id_tipo_presentacion`) REFERENCES `inv_tipo_presentacion` (`id_tipo_presentacion`),
  CONSTRAINT `fk_proveedor_a_insumo` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_ubic_exist_a_insumo` FOREIGN KEY (`id_ubicacion_existencia`) REFERENCES `inv_ubicacion_existencia` (`id_ubicacion_existencia`),
  CONSTRAINT `fk_und_med_a_insumo` FOREIGN KEY (`id_unidad_medida`) REFERENCES `inv_unidad_medida` (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=5612 DEFAULT CHARSET=latin1 COMMENT='Almacena los insumos que se necesitarán en un viaje, para un';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_prd_insumo` AFTER UPDATE ON `prd_insumo` FOR EACH ROW BEGIN
  DECLARE vcValorPk VARCHAR(50);
  DECLARE vcUsuario VARCHAR(50);
  DECLARE vcCampos TEXT;
  DECLARE vcValorAnterior TEXT;
  DECLARE vcValorActual TEXT;
  DECLARE vcCamposMaestro TEXT;
  DECLARE vcValoresMaestro TEXT;
  
  SET vcCampos = '';
  SET vcValorAnterior = '';
  SET vcValorActual = '';
  SET vcCamposMaestro = '';
  SET vcValoresMaestro = '';

  SET vcValorPk = old.id_insumo;
  IF(IFNULL(new.id_tipo_insumo, '') != IFNULL(old.id_tipo_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_tipo_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_tipo_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_tipo_insumo, '~');
  END IF;
  
  IF(IFNULL(new.id_tipo_presentacion, '') != IFNULL(old.id_tipo_presentacion, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_tipo_presentacion~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_tipo_presentacion, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_tipo_presentacion, '~');
  END IF;
  
  IF(IFNULL(new.id_ubicacion_existencia, '') != IFNULL(old.id_ubicacion_existencia, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_ubicacion_existencia~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_ubicacion_existencia, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_ubicacion_existencia, '~');
  END IF;
  
  IF(IFNULL(new.id_unidad_medida, '') != IFNULL(old.id_unidad_medida, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_unidad_medida~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_unidad_medida, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_unidad_medida, '~');
  END IF;
  
  IF(IFNULL(new.porcion_x_medida, '') != IFNULL(old.porcion_x_medida, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'porcion_x_medida~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.porcion_x_medida, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.porcion_x_medida, '~');
  END IF;
  
  IF(IFNULL(new.descripcion_insumo, '') != IFNULL(old.descripcion_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'descripcion_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.descripcion_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.descripcion_insumo, '~');
  END IF;
  
  IF(IFNULL(new.costo_presupuestado, '') != IFNULL(old.costo_presupuestado, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'costo_presupuestado~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.costo_presupuestado, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.costo_presupuestado, '~');
  END IF;
  
  IF(IFNULL(new.costo_promedio, '') != IFNULL(old.costo_promedio, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'costo_promedio~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.costo_promedio, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.costo_promedio, '~');
  END IF;
  
  IF(IFNULL(new.id_moneda_presupuesto, '') != IFNULL(old.id_moneda_presupuesto, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_moneda_presupuesto~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_moneda_presupuesto, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_moneda_presupuesto, '~');
  END IF;
  
  IF(IFNULL(new.estado_insumo, '') != IFNULL(old.estado_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'estado_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.estado_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.estado_insumo, '~');
  END IF;
  
  IF(IFNULL(new.individual_general, '') != IFNULL(old.individual_general, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'individual_general~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.individual_general, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.individual_general, '~');
  END IF;
  
  IF(IFNULL(new.imagen_insumo, '') != IFNULL(old.imagen_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'imagen_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.imagen_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.imagen_insumo, '~');
  END IF;
  
  IF(IFNULL(new.stock_maximo, '') != IFNULL(old.stock_maximo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'stock_maximo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.stock_maximo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.stock_maximo, '~');
  END IF;
  
  IF(IFNULL(new.stock_minimo, '') != IFNULL(old.stock_minimo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'stock_minimo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.stock_minimo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.stock_minimo, '~');
  END IF;
  
  IF(IFNULL(new.publico_privado, '') != IFNULL(old.publico_privado, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'publico_privado~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.publico_privado, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.publico_privado, '~');
  END IF;
  
  IF(IFNULL(new.tipo_precio_insumo, '') != IFNULL(old.tipo_precio_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'tipo_precio_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.tipo_precio_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.tipo_precio_insumo, '~');
  END IF;
  
  IF(IFNULL(new.observacion_insumo, '') != IFNULL(old.observacion_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'observacion_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.observacion_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.observacion_insumo, '~');
  END IF;
  
  IF(IFNULL(new.tipo_bien, '') != IFNULL(old.tipo_bien, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'tipo_bien~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.tipo_bien, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.tipo_bien, '~');
  END IF;
  
  IF(IFNULL(new.dar_anticipo, '') != IFNULL(old.dar_anticipo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'dar_anticipo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.dar_anticipo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.dar_anticipo, '~');
  END IF;
  
  IF(IFNULL(new.codigo_externo, '') != IFNULL(old.codigo_externo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'codigo_externo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.codigo_externo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.codigo_externo, '~');
  END IF;
  
  SET vcUsuario = new.id_usuario_modifica;
  SET vcCamposMaestro = 'id_tipo_insumo';
  SET vcValoresMaestro = old.id_tipo_insumo;  
  
  IF(vcCampos != '')
  THEN
    INSERT INTO seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'prd_insumo',
      'UPDATE',
      vcCamposMaestro,
      vcValoresMaestro,
      vcValorPk,
      vcCampos,
      vcValorAnterior,
      vcValorActual,
      vcUsuario,
      ADDTIME(now(), '00:00')
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prd_insumo_anexo`
--

DROP TABLE IF EXISTS `prd_insumo_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_insumo_anexo` (
  `id_insumo_anexo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRD_INSUMO_ANEXO',
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_INSUMO',
  `id_insumo2` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_INSUMO',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que modifica el registro',
  PRIMARY KEY (`id_insumo_anexo`),
  KEY `fk_insumo_a_insumo_anexo` (`id_insumo`),
  KEY `fk_insumo_a_insumo_anexo2` (`id_insumo2`),
  CONSTRAINT `fk_insumo_a_insumo_anexo` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_insumo_a_insumo_anexo2` FOREIGN KEY (`id_insumo2`) REFERENCES `prd_insumo` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_insumo_x_itinerario`
--

DROP TABLE IF EXISTS `prd_insumo_x_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_insumo_x_itinerario` (
  `id_insumo_x_itinerario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código insumo por itinerario',
  `id_precio_insumo` int(11) DEFAULT NULL,
  `id_itinerario` int(11) DEFAULT NULL COMMENT 'Código del itinerario',
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código del insumo',
  `id_proveedor` int(11) DEFAULT NULL,
  `id_tipo_insumo` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `tipo_insumo_x_itinerario` char(1) DEFAULT NULL,
  `tipo_precio` char(1) DEFAULT NULL,
  `precio_fijo` decimal(15,4) DEFAULT NULL,
  `factor_precio` decimal(15,4) DEFAULT NULL,
  `cantidad_insumo_producto` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad que se supone se usará en la concepción del producto',
  `utilidad_x_insumo` decimal(15,4) DEFAULT NULL,
  `hora_ejecucion` time DEFAULT NULL COMMENT 'Permite almacenar la hora de ejecución de un servicio',
  `observacion_insumo_x_itinerario` text,
  `centro_costos` varchar(100) DEFAULT NULL COMMENT 'Centro de costos',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_insumo_x_itinerario`),
  KEY `fk_insumo_a_insxiti` (`id_insumo`),
  KEY `fk_itinerario_a_insxiti` (`id_itinerario`),
  KEY `fk_lista_precios_a_insxiti` (`id_precio_insumo`),
  KEY `fk_producto_a_insxiti` (`id_producto`),
  KEY `fk_proveedor_a_insxitin_prd` (`id_proveedor`),
  KEY `fk_tipo_insumo_a_insumo_x_itinerario` (`id_tipo_insumo`),
  CONSTRAINT `fk_insumo_a_insxiti` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_itinerario_a_insxiti` FOREIGN KEY (`id_itinerario`) REFERENCES `prd_itinerario` (`id_itinerario`),
  CONSTRAINT `fk_lista_precios_a_insxiti` FOREIGN KEY (`id_precio_insumo`) REFERENCES `prd_precio_insumo` (`id_precio_insumo`),
  CONSTRAINT `fk_producto_a_insxiti` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_proveedor_a_insxitin_prd` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_tipo_insumo_a_insumo_x_itinerario` FOREIGN KEY (`id_tipo_insumo`) REFERENCES `prd_tipo_insumo` (`id_tipo_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=34289 DEFAULT CHARSET=latin1 COMMENT='Almacena todos los insumos por cada itinerario (TABLA DE CRU';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_itinerario`
--

DROP TABLE IF EXISTS `prd_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_itinerario` (
  `id_itinerario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del itinerario',
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `dia_itinerario` int(11) DEFAULT NULL COMMENT 'Número de día correspondiente al orden en el itinerario',
  `imagen_itinerario` varchar(100) DEFAULT 'blanco.jpg',
  `id_unidad_estrategica_itinerario` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_itinerario`),
  KEY `fk_prd_a_itinerario` (`id_producto`),
  CONSTRAINT `fk_prd_a_itinerario` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=12381 DEFAULT CHARSET=latin1 COMMENT='Almacena el itinerario del producto, en caso de ser operació';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_mantenimiento`
--

DROP TABLE IF EXISTS `prd_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRD_MANTENIMIENTO',
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `kilometraje_mantenimiento` varchar(100) DEFAULT NULL COMMENT 'Indica el kilometraje en el cuál se hará el respectivo mantenimiento',
  `kilometraje_alerta1` varchar(100) DEFAULT NULL COMMENT 'Indica el kilometraje en el que se halle el producto para lanzar la primera alerta',
  `kilometraje_alerta2` varchar(100) DEFAULT NULL COMMENT 'Indica el kilometraje en el que se halle el producto para lanzar la segunda alerta',
  `realizado` char(1) DEFAULT NULL COMMENT 'Indica si el mantenimiento fue realizado o no en el kilometraje indicado',
  `fecha` date DEFAULT NULL COMMENT 'Fecha en la que se realizó el mantenimiento',
  `hora` time DEFAULT NULL COMMENT 'Hora en la que se realizó el mantenimiento',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_mantenimiento`),
  KEY `fk_insumo_a_mantenimiento` (`id_insumo`),
  KEY `fk_producto_a_mantenimiento` (`id_producto`),
  CONSTRAINT `fk_insumo_a_mantenimiento` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_producto_a_mantenimiento` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que sirve para grabar el mantenimiento que se le dará al producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_operacion`
--

DROP TABLE IF EXISTS `prd_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_operacion` (
  `id_operacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_operacion` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Tabla que almecena las operaciones por empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_parametro_cotizador`
--

DROP TABLE IF EXISTS `prd_parametro_cotizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_parametro_cotizador` (
  `id_parametro_cotizador` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRD_PARAMETRO_COTIZADOR',
  `porcentaje_neto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje neto en cantidad',
  `porcentaje_venta` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de ventas en cantidad',
  `rango_pax` varchar(256) DEFAULT NULL COMMENT 'Rango de pax: varios números enteros separados con coma',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_parametro_cotizador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todos los parámetros del cotizador';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_patron_insumo`
--

DROP TABLE IF EXISTS `prd_patron_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_patron_insumo` (
  `id_patron_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_patron_insumo` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_patron_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las cabeceras para los patrones de insumo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_precio_insumo`
--

DROP TABLE IF EXISTS `prd_precio_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_precio_insumo` (
  `id_precio_insumo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código lista de precios',
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código del insumo',
  `precio_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Precio establecido en cantidad',
  `fecha_inicio_vigencia` date DEFAULT NULL COMMENT 'Fecha inicial de vigencia',
  `fecha_fin_vigencia` date DEFAULT NULL COMMENT 'Fecha final de vigencia',
  `principal_precio_insumo` char(1) DEFAULT NULL COMMENT 'Indica el precio preferido del insumo para tomar en cuenta',
  `pax_ini` int(11) DEFAULT NULL COMMENT 'Inicio del rango de paxs',
  `pax_fin` int(11) DEFAULT NULL COMMENT 'Fin del rango de paxs',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_precio_insumo`),
  KEY `fk_insumo_a_lista_precios` (`id_insumo`),
  CONSTRAINT `fk_insumo_a_lista_precios` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=65684 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el listado de precios por insumo';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_prd_precio_insumo` AFTER UPDATE ON `prd_precio_insumo` FOR EACH ROW BEGIN
  DECLARE vcValorPk VARCHAR(50);
  DECLARE vcUsuario VARCHAR(50);
  DECLARE vcCampos TEXT;
  DECLARE vcValorAnterior TEXT;
  DECLARE vcValorActual TEXT;
  DECLARE vcCamposMaestro TEXT;
  DECLARE vcValoresMaestro TEXT;
  
  SET vcCampos = '';
  SET vcValorAnterior = '';
  SET vcValorActual = '';
  SET vcCamposMaestro = '';
  SET vcValoresMaestro = '';

  SET vcValorPk = old.id_precio_insumo;
  IF(IFNULL(new.id_insumo, '') != IFNULL(old.id_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_insumo, '~');
  END IF;
  
  IF(IFNULL(new.precio_insumo, '') != IFNULL(old.precio_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'precio_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.precio_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.precio_insumo, '~');
  END IF;
  
  IF(IFNULL(new.fecha_inicio_vigencia, '') != IFNULL(old.fecha_inicio_vigencia, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'fecha_inicio_vigencia~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(DATE_FORMAT(old.fecha_inicio_vigencia, '%d/%m/%Y'), ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, DATE_FORMAT(new.fecha_inicio_vigencia, '%d/%m/%Y'), '~');
  END IF;
  
  IF(IFNULL(new.fecha_fin_vigencia, '') != IFNULL(old.fecha_fin_vigencia, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'fecha_fin_vigencia~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(DATE_FORMAT(old.fecha_fin_vigencia, '%d/%m/%Y'), ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, DATE_FORMAT(new.fecha_fin_vigencia, '%d/%m/%Y'), '~');
  END IF;
  
  IF(IFNULL(new.principal_precio_insumo, '') != IFNULL(old.principal_precio_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'principal_precio_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.principal_precio_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.principal_precio_insumo, '~');
  END IF;
  
  IF(IFNULL(new.pax_ini, '') != IFNULL(old.pax_ini, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'pax_ini~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.pax_ini, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.pax_ini, '~');
  END IF;
  
  IF(IFNULL(new.pax_fin, '') != IFNULL(old.pax_fin, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'pax_fin~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.pax_fin, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.pax_fin, '~');
  END IF;
  
  SET vcUsuario = new.id_usuario_modifica;
  SET vcCamposMaestro = 'id_insumo';
  SET vcValoresMaestro = old.id_insumo;  
  
  IF(vcCampos != '')
  THEN
    INSERT INTO seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'prd_precio_insumo',
      'UPDATE',
      vcCamposMaestro,
      vcValoresMaestro,
      vcValorPk,
      vcCampos,
      vcValorAnterior,
      vcValorActual,
      vcUsuario,
      ADDTIME(now(), '00:00')
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prd_precio_producto`
--

DROP TABLE IF EXISTS `prd_precio_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_precio_producto` (
  `id_precio_producto` varchar(15) NOT NULL COMMENT 'Código de la tabla',
  `descripcion_precio_producto` varchar(100) DEFAULT NULL,
  `estado_precio_producto` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_precio_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los distintos precios de los productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_precio_producto_x_temporada`
--

DROP TABLE IF EXISTS `prd_precio_producto_x_temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_precio_producto_x_temporada` (
  `id_precio_producto_x_temporada` int(11) NOT NULL AUTO_INCREMENT,
  `id_temporada` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_TEMPORADA',
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_PRODUCTO',
  `descripcion_precio_producto_x_temporada` varchar(100) DEFAULT NULL,
  `precio` decimal(15,4) DEFAULT NULL,
  `pax_ini` bigint(20) DEFAULT NULL,
  `pax_fin` bigint(20) DEFAULT NULL,
  `tarifa_rac` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_precio_producto_x_temporada`),
  KEY `fk_producto_a_precio_producto` (`id_producto`),
  KEY `fk_temporada_a_precio_producto` (`id_temporada`),
  CONSTRAINT `fk_producto_a_precio_producto` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_temporada_a_precio_producto` FOREIGN KEY (`id_temporada`) REFERENCES `prd_temporada` (`id_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=65536 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los precios de los productos por temporada';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_precio_x_temporada`
--

DROP TABLE IF EXISTS `prd_precio_x_temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_precio_x_temporada` (
  `id_precio_x_temporada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del precio',
  `id_temporada` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_precio_producto` varchar(15) DEFAULT NULL COMMENT 'Código de la tabla',
  `precio` decimal(15,4) DEFAULT NULL COMMENT 'Precio en números',
  `id_moneda_precio` int(11) DEFAULT NULL COMMENT 'La moneda en la que se estableció el precio',
  `pax_ini` int(11) DEFAULT NULL COMMENT 'Inicio del rango de paxs',
  `pax_fin` int(11) DEFAULT NULL COMMENT 'Fin del rango de paxs',
  `tarifa_rac` decimal(15,2) DEFAULT NULL COMMENT 'Tarifa RAC',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_precio_x_temporada`),
  UNIQUE KEY `idx_no_repetir_precio_x_temporada` (`id_precio_producto`,`id_temporada`),
  KEY `fk_temp_a_precio_tp_prd_temp` (`id_temporada`),
  CONSTRAINT `fk_precio_a_precio_x_temp` FOREIGN KEY (`id_precio_producto`) REFERENCES `prd_precio_producto` (`id_precio_producto`),
  CONSTRAINT `fk_temp_a_precio_tp_prd_temp` FOREIGN KEY (`id_temporada`) REFERENCES `prd_temporada` (`id_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=32099 DEFAULT CHARSET=latin1 COMMENT='Almacena la utilidad de cada tipo de producto por cada tempo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_producto`
--

DROP TABLE IF EXISTS `prd_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_producto` (
  `id_producto` varchar(15) NOT NULL COMMENT 'Código del producto',
  `id_tipo_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `descripcion_producto` text COMMENT 'Descripción del producto',
  `nombre_corto` text COMMENT 'Nombre corto que identifica al producto actual',
  `ubicacion_producto` varchar(100) DEFAULT NULL COMMENT 'Ubicaciónd el producto, en caso de ser habitación o mesa',
  `capacidad_minima` decimal(15,0) DEFAULT NULL COMMENT 'Número mínimo de personas en en un programa turístico, transporte, habitación o mesa',
  `capacidad_maxima` decimal(15,0) DEFAULT NULL COMMENT 'Número máximo de personas en en un programa turístico, transporte, habitación o mesa',
  `id_moneda_precio` int(11) DEFAULT NULL COMMENT 'La moneda en la que se estableció el precio',
  `estado_producto` char(1) DEFAULT NULL COMMENT 'Es el estado que toma un producto',
  `tipo_precio` char(1) DEFAULT NULL COMMENT 'Es el tipo de precio que se está aplicando al producto, C=Calculado en base a los insumos o F=Fijo',
  `precio_sin_utilidad` decimal(15,4) DEFAULT NULL COMMENT 'Es el precio que se le da a cada producto antes de la utilidad, puede ser también calculado en base a los insumos',
  `porcentaje_utilidad` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de utilidad sobre el precio cuando es calculado',
  `imagen_producto` varchar(256) DEFAULT NULL COMMENT 'Ruta de donde se encuentra la imagen del producto',
  `individual_general` char(1) DEFAULT NULL COMMENT 'Individual I (por cada uno) o General G (para todos)',
  `se_reserva` char(1) DEFAULT NULL COMMENT 'Campo que indica si "S" el campo es suceptible de reserva o no "N", por ejm cuando es un plato de comida no se reserva si no que se carga.',
  `medida_calculo_precio` char(1) DEFAULT NULL COMMENT 'Indica en que unidad de tiempo se calcula el precio, D=Días, H=Horas',
  `cantidad_inicial` decimal(15,4) DEFAULT NULL COMMENT 'Indica la cantidad inicial de productos a reservarse o facturarse',
  `total_inicial` decimal(15,4) DEFAULT NULL COMMENT 'Indica el valor total resultante de multiplicar el valor del producto por la cantidad inicial',
  `bloquea_horario` char(1) DEFAULT 'N' COMMENT 'Indica si bloquea o no el producto en el horario reservado',
  `depende_itinerario` char(1) DEFAULT 'S',
  `nro_espacios` int(11) DEFAULT NULL,
  `es_espacio` char(1) DEFAULT NULL,
  `se_divide` char(1) DEFAULT NULL,
  `comision_fija` decimal(15,4) DEFAULT NULL,
  `tipo_bien` varchar(3) DEFAULT NULL COMMENT 'Indica si el producto es un BIEN o un SERVICIO',
  `corta_itinerario` char(1) DEFAULT 'N' COMMENT 'Indica si se puede cortar el itinerario dependiendo de las fechas escogidas',
  `notas` text COMMENT 'Notas del producto',
  `destino_principal` varchar(256) DEFAULT NULL COMMENT 'Breve descripción general del destino principal del viaje',
  `tipo_comida_incluida` varchar(10) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_tp_prd_a_prd` (`id_tipo_producto`),
  CONSTRAINT `fk_tp_prd_a_prd` FOREIGN KEY (`id_tipo_producto`) REFERENCES `prd_tipo_producto` (`id_tipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los productos del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_producto_x_precio_producto`
--

DROP TABLE IF EXISTS `prd_producto_x_precio_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_producto_x_precio_producto` (
  `id_producto_x_precio_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(15) DEFAULT NULL COMMENT 'Código del producto',
  `id_precio_producto` varchar(15) DEFAULT NULL COMMENT 'Código de la tabla',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_producto_x_precio_producto`),
  UNIQUE KEY `idx_no_repetir_producto_x_precio_producto` (`id_producto`,`id_precio_producto`),
  KEY `fk_precio_a_producto` (`id_precio_producto`),
  CONSTRAINT `fk_precio_a_producto` FOREIGN KEY (`id_precio_producto`) REFERENCES `prd_precio_producto` (`id_precio_producto`),
  CONSTRAINT `fk_producto_a_precio` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5637 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_rango_impuesto`
--

DROP TABLE IF EXISTS `prd_rango_impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_rango_impuesto` (
  `id_rango_impuesto` int(11) NOT NULL AUTO_INCREMENT,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_IMPUESTO',
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `porcentaje` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rango_impuesto`),
  KEY `fk_impuesto_a_rango_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_impuesto_a_rango_impuesto` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_super_tipo_insumo`
--

DROP TABLE IF EXISTS `prd_super_tipo_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_super_tipo_insumo` (
  `id_super_tipo_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_operacion_x_empresa` int(11) DEFAULT NULL,
  `descripcion_super_tipo_insumo` varchar(100) DEFAULT NULL,
  `tipo_orden_trabajo` char(1) DEFAULT 'N' COMMENT 'Tipo que indica si el super tipo es para la orden de trabajo',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_super_tipo_insumo`),
  KEY `fk_tipo_op_x_emp_a_super_tipo_insumo` (`id_tipo_operacion_x_empresa`),
  CONSTRAINT `fk_tipo_op_x_emp_a_super_tipo_insumo` FOREIGN KEY (`id_tipo_operacion_x_empresa`) REFERENCES `prm_tipo_operacion_x_empresa` (`id_tipo_operacion_x_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el super tipo de insumo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_temporada`
--

DROP TABLE IF EXISTS `prd_temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_temporada` (
  `id_temporada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la temporada',
  `descripcion_temporada` varchar(100) DEFAULT NULL COMMENT 'Descripción corta de la temporada',
  `fecha_inicio_temporada` date DEFAULT NULL COMMENT 'Fecha de inicio de temporada',
  `fecha_fin_temporada` date DEFAULT NULL COMMENT 'Fecha de fin de temporada',
  `principal_temporada` char(1) DEFAULT NULL COMMENT 'Indica cuál es la temporada activa',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Almacena las temporadas que existen en el año';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_tipo_inclusion`
--

DROP TABLE IF EXISTS `prd_tipo_inclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_tipo_inclusion` (
  `id_tipo_inclusion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_inclusion` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_inclusion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el tipo de comida incluida';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_tipo_insumo`
--

DROP TABLE IF EXISTS `prd_tipo_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_tipo_insumo` (
  `id_tipo_insumo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del tipo de insumo',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Codigo del proveedor',
  `id_super_tipo_insumo` int(11) DEFAULT NULL,
  `descripcion_tipo_insumo` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de insumo',
  `inventariar` char(1) DEFAULT NULL COMMENT 'Indica si el tipo de producto se inventariza o no',
  `tipo_interno` char(1) DEFAULT NULL COMMENT 'Indica el uso interno que se le dará al tipo de insumo',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_insumo`),
  KEY `fk_proveedor_a_tipo_insumo` (`id_proveedor`),
  KEY `fk_super_tipo_a_tipo_insumo` (`id_super_tipo_insumo`),
  CONSTRAINT `fk_proveedor_a_tipo_insumo` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_super_tipo_a_tipo_insumo` FOREIGN KEY (`id_super_tipo_insumo`) REFERENCES `prd_super_tipo_insumo` (`id_super_tipo_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=3232 DEFAULT CHARSET=latin1 COMMENT='Almacena los tipos de insumo, como por ejemplo: ropa, acceso';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_prd_tipo_insumo` AFTER UPDATE ON `prd_tipo_insumo` FOR EACH ROW BEGIN
  DECLARE vcValorPk VARCHAR(50);
  DECLARE vcUsuario VARCHAR(50);
  DECLARE vcCampos TEXT;
  DECLARE vcValorAnterior TEXT;
  DECLARE vcValorActual TEXT;
  DECLARE vcCamposMaestro TEXT;
  DECLARE vcValoresMaestro TEXT;
  
  SET vcCampos = '';
  SET vcValorAnterior = '';
  SET vcValorActual = '';
  SET vcCamposMaestro = '';
  SET vcValoresMaestro = '';

  SET vcValorPk = old.id_tipo_insumo;
  IF(IFNULL(new.id_proveedor, '') != IFNULL(old.id_proveedor, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_proveedor~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_proveedor, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_proveedor, '~');
  END IF;
  
  IF(IFNULL(new.id_super_tipo_insumo, '') != IFNULL(old.id_super_tipo_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'id_super_tipo_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.id_super_tipo_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.id_super_tipo_insumo, '~');
  END IF;
  
  IF(IFNULL(new.descripcion_tipo_insumo, '') != IFNULL(old.descripcion_tipo_insumo, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'descripcion_tipo_insumo~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.descripcion_tipo_insumo, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.descripcion_tipo_insumo, '~');
  END IF;
  
  IF(IFNULL(new.inventariar, '') != IFNULL(old.inventariar, ''))
  THEN
    SET vcCampos = CONCAT(vcCampos, 'inventariar~');
    SET vcValorAnterior = CONCAT(vcValorAnterior, IFNULL(old.inventariar, ''), '~');
    SET vcValorActual = CONCAT(vcValorActual, new.inventariar, '~');
  END IF;
  
  IF(vcCampos != '')
  THEN
    INSERT INTO seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'prd_tipo_insumo',
      'UPDATE',
      vcCamposMaestro,
      vcValoresMaestro,
      vcValorPk,
      vcCampos,
      vcValorAnterior,
      vcValorActual,
      vcUsuario,
      ADDTIME(now(), '00:00')
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prd_tipo_producto`
--

DROP TABLE IF EXISTS `prd_tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_tipo_producto` (
  `id_tipo_producto` varchar(15) NOT NULL COMMENT 'Código del producto',
  `id_unidad_estrategica` int(11) DEFAULT NULL,
  `descripcion_tipo_producto` varchar(100) DEFAULT NULL COMMENT 'Descripción del producto',
  `estado_tipo_producto` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_producto`),
  KEY `fk_und_estr_a_tipo_producto` (`id_unidad_estrategica`),
  CONSTRAINT `fk_und_estr_a_tipo_producto` FOREIGN KEY (`id_unidad_estrategica`) REFERENCES `prd_unidad_estrategica` (`id_unidad_estrategica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el tipo de producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prd_unidad_estrategica`
--

DROP TABLE IF EXISTS `prd_unidad_estrategica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_unidad_estrategica` (
  `id_unidad_estrategica` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) DEFAULT NULL,
  `id_tipo_operacion_x_empresa` int(11) DEFAULT NULL COMMENT 'Código del tipo de operación por empresa',
  `descripcion_unidad_estrategica` varchar(100) DEFAULT NULL,
  `principal_unidad_estrategica` char(1) DEFAULT 'N' COMMENT 'Indica si la unidad estratégica es la preferida',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_unidad_estrategica`),
  KEY `fk_operacion_a_und_estr` (`id_operacion`),
  KEY `fk_tp_operacion_a_und_estr` (`id_tipo_operacion_x_empresa`),
  CONSTRAINT `fk_operacion_a_und_estr` FOREIGN KEY (`id_operacion`) REFERENCES `prd_operacion` (`id_operacion`),
  CONSTRAINT `fk_tp_operacion_a_und_estr` FOREIGN KEY (`id_tipo_operacion_x_empresa`) REFERENCES `prm_tipo_operacion_x_empresa` (`id_tipo_operacion_x_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena la unidad estratégica del negocio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_anios_consulta`
--

DROP TABLE IF EXISTS `prm_anios_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_anios_consulta` (
  `id_anios_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_anios_consulta` varchar(15) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_anios_consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='Tabla donde se parametrizan los años para las consultas real';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_cod_impuesto_retencion_sri`
--

DROP TABLE IF EXISTS `prm_cod_impuesto_retencion_sri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_cod_impuesto_retencion_sri` (
  `id_cod_impuesto_retencion_sri` varchar(3) NOT NULL,
  `descripcion_cod_impuesto_retencion_sri` varchar(256) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cod_impuesto_retencion_sri`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_codigo_porcentaje_sri`
--

DROP TABLE IF EXISTS `prm_codigo_porcentaje_sri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_codigo_porcentaje_sri` (
  `id_codigo_porcentaje_sri` varchar(15) NOT NULL,
  `descripcion_codigo_porcentaje_sri` text,
  `estado_codigo_porcentaje_sri` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_codigo_porcentaje_sri`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_correo_enviado`
--

DROP TABLE IF EXISTS `prm_correo_enviado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_correo_enviado` (
  `id_correo_enviado` int(11) NOT NULL AUTO_INCREMENT,
  `send_to_email` varchar(100) DEFAULT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `reply_to_email` varchar(100) DEFAULT NULL,
  `subject_email` varchar(500) DEFAULT NULL,
  `body` text,
  `has_attachment` char(1) DEFAULT NULL,
  `estado_envio` char(1) DEFAULT NULL,
  `error_envio` text,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  PRIMARY KEY (`id_correo_enviado`)
) ENGINE=InnoDB AUTO_INCREMENT=3394 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_empresa`
--

DROP TABLE IF EXISTS `prm_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la empresa',
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `id_persona` int(11) DEFAULT NULL,
  `id_tipo_regimen_tributario` char(3) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `nro_horas_dia` decimal(15,4) DEFAULT NULL,
  `dias_timeout` int(11) DEFAULT NULL COMMENT 'Número de días en que una reserva permanece bloqueada hasta que se de la confirmación con anticipo',
  `imagen_logo` varchar(256) DEFAULT NULL,
  `slogan` varchar(256) DEFAULT NULL,
  `establecimiento_ats` varchar(100) DEFAULT NULL,
  `punto_emision_ats` varchar(100) DEFAULT NULL,
  `contribuyente_especial` char(1) DEFAULT 'N',
  `obligado_contabilidad` char(1) DEFAULT 'N',
  `nro_contribuyente_especial` varchar(15) DEFAULT NULL,
  `principal_empresa` char(1) DEFAULT 'N',
  `tipo_emision` int(11) DEFAULT NULL COMMENT 'Indica el tipo de emisión en el que está trabajando el sistema Normal: 1 o Indisponibilidad: 2',
  `archivo_firma` varchar(256) DEFAULT NULL COMMENT 'Indica el nombre del archivo de la firma electrónica',
  `clave_firma` varchar(100) DEFAULT NULL COMMENT 'Indica la clave del archivo de la firma electrónica',
  `requiere_fact_electr` char(1) DEFAULT 'N' COMMENT 'Indica si va a usar la facturación electrónica de GECO',
  `dias_time_limit` int(11) DEFAULT NULL COMMENT 'Número de días que debe transcurrir entre la fecha time limit y la fecha actual para lanzar alertas',
  `clave_firma_sin` varchar(100) DEFAULT NULL COMMENT 'Clave de la firma sin encriptar',
  `requiere_ret_electr` char(1) DEFAULT 'N' COMMENT 'Indica si va a usar la retención electrónica de GECO',
  `habilita_correo_personalizado` char(1) DEFAULT NULL COMMENT 'Indica si habilita o no el correo personalizado para esta empresa',
  `smtp_server` varchar(100) DEFAULT NULL COMMENT 'SMTP Server',
  `port_server` varchar(15) DEFAULT NULL COMMENT 'Puerto 25, 465, 587',
  `ssl_server` char(1) DEFAULT NULL COMMENT 'SSL true o false',
  `activa_sincronizacion` char(1) DEFAULT 'N' COMMENT 'Indica S=si se debe activar o N=no la sincronización entre empresas',
  `dias_vigencia_clave` int(11) DEFAULT NULL COMMENT 'Indica el número de días en los que está vigente la última clave, después el sistema obliga al usuario a cambiar la clave',
  `protocolo_seguridad_medica` text COMMENT 'Campo que guarda el protocolo de seguridad médica de cada empresa',
  `es_agente_retencion` char(1) DEFAULT NULL COMMENT 'Indica si la empresa es agente de retención S=si o N=no',
  `tipo_conciliacion_bancaria` char(3) DEFAULT 'ING' COMMENT 'Indica si la empresa llevará una conciliación bancaria con EST=Estado de cuenta o sólo con ING=Ingreso de movimientos divergentes',
  `desactiva_confirmacion_x_anticipo` char(1) DEFAULT 'N' COMMENT 'Indica S=si está o N=no desactivado el paso de estado a confirmado de la reserva al completar con anticipos el valor total',
  `we_activa_wetravel` char(1) DEFAULT 'N' COMMENT 'Indica si la empresa va a trabajar con WeTravel o no',
  `we_codigo_autorizacion` text COMMENT 'Es el código de autorización para conectarse a WeTravel',
  `correo_personalizado` varchar(100) DEFAULT NULL COMMENT 'Correo personalizado',
  `clave_correo` varchar(20) DEFAULT NULL COMMENT 'Clave del correo personalizado',
  `nombre_correo` varchar(100) DEFAULT NULL COMMENT 'Nombre con el que aparece el correo personalizado',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `fk_idioma_a_empresa` (`id_idioma`),
  KEY `fk_persona_a_empresa` (`id_persona`),
  KEY `fk_tipo_regimen_a_empresa` (`id_tipo_regimen_tributario`),
  CONSTRAINT `fk_idioma_a_empresa` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_persona_a_empresa` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tipo_regimen_a_empresa` FOREIGN KEY (`id_tipo_regimen_tributario`) REFERENCES `prm_tipo_regimen_tributario` (`id_tipo_regimen_tributario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_empresa_relacionada`
--

DROP TABLE IF EXISTS `prm_empresa_relacionada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_empresa_relacionada` (
  `id_empresa_relacionada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRM_EMPRESA_RELACIONADA',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_empresa` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `nick_empresa_relacionada` varchar(256) DEFAULT NULL COMMENT 'Nick de la empresa relacionada',
  `tipo_empresa_relacionada` varchar(3) DEFAULT NULL COMMENT 'Indica si la empresa relacionada es CLI=Cliente o PRV=Proveedor',
  `estado_empresa_relacionada` char(1) DEFAULT 'A' COMMENT 'Indica si la empresa relacionada sigue Activa o no',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_empresa_relacionada`),
  KEY `fk_empresa_a_empresa_relacionada` (`id_empresa`),
  KEY `fk_persona_a_empresa_relacionada` (`id_persona`),
  CONSTRAINT `fk_empresa_a_empresa_relacionada` FOREIGN KEY (`id_empresa`) REFERENCES `prm_empresa` (`id_empresa`),
  CONSTRAINT `fk_persona_a_empresa_relacionada` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las empresas relacionadas con sus nicks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_feriado`
--

DROP TABLE IF EXISTS `prm_feriado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_feriado` (
  `id_feriado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria tabla PRM_FERIADO',
  `descripcion_feriado` varchar(100) DEFAULT NULL COMMENT 'Descripción del día feriado',
  `fecha_feriado` date DEFAULT NULL COMMENT 'Fecha exacta del día feriado',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_feriado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los días feriados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_idioma`
--

DROP TABLE IF EXISTS `prm_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_idioma` (
  `id_idioma` varchar(4) NOT NULL COMMENT 'Código del idioma',
  `descripcion_idioma` varchar(100) DEFAULT NULL COMMENT 'Nombre o descripción del idioma',
  `despliega_en_login` char(1) DEFAULT NULL COMMENT 'Indica si despliega o no en el login',
  `principal_idioma` char(1) DEFAULT 'N',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene todos los idiomas a los que se puede traducir el si';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_moneda`
--

DROP TABLE IF EXISTS `prm_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_moneda` (
  `id_moneda` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_moneda` varchar(100) DEFAULT NULL COMMENT 'Nombre de la moneda',
  `simbolo_moneda` varchar(4) DEFAULT NULL,
  `codigo_letras` varchar(3) DEFAULT NULL COMMENT 'Código corto en letras de la moneda',
  `principal_moneda` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla para llevar los distintos tipos de moneda y su respect';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_motivo`
--

DROP TABLE IF EXISTS `prm_motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_motivo` (
  `id_motivo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_motivo` varchar(4) DEFAULT NULL COMMENT 'Código',
  `id_modulo` varchar(4) DEFAULT NULL COMMENT 'Código del módulo del sistema',
  `descripcion_motivo` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_motivo`),
  KEY `fk_modulo_a_motivo` (`id_modulo`),
  KEY `fk_tpmotivo_a_motivo` (`id_tipo_motivo`),
  CONSTRAINT `fk_modulo_a_motivo` FOREIGN KEY (`id_modulo`) REFERENCES `seg_modulo` (`id_modulo`),
  CONSTRAINT `fk_tpmotivo_a_motivo` FOREIGN KEY (`id_tipo_motivo`) REFERENCES `prm_tipo_motivo` (`id_tipo_motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena la descripción de los motivos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_observacion_reporte`
--

DROP TABLE IF EXISTS `prm_observacion_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_observacion_reporte` (
  `id_observacion_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `id_objeto` int(11) DEFAULT NULL,
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `descripcion_observacion_reporte` text COMMENT 'Observación en cualquier idioma',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_observacion_reporte`),
  KEY `fk_idioma_observacion_reporte` (`id_idioma`),
  KEY `fk_objeto_observacion_reporte` (`id_objeto`),
  CONSTRAINT `fk_idioma_observacion_reporte` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_objeto_observacion_reporte` FOREIGN KEY (`id_objeto`) REFERENCES `seg_objeto` (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Observaciones en distintos idiomas para algunos reportes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_orden_servicio`
--

DROP TABLE IF EXISTS `prm_orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_orden_servicio` (
  `id_orden_servicio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRM_ORDEN_SERVICIO',
  `id_super_tipo_insumo` int(11) DEFAULT NULL,
  `nro_columna` varchar(15) DEFAULT NULL COMMENT 'Número de columna que se parametriza',
  `imprime_observaciones` char(1) DEFAULT NULL COMMENT 'Indica si imprime o no las observaciones',
  `imprime_cantidad` char(1) DEFAULT NULL COMMENT 'Indica si imprime o no la cantidad de insumos',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_orden_servicio`),
  KEY `fk_tipo_insumo_a_param_orden_servicio` (`id_super_tipo_insumo`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la parametrización del reporte ORDEN DE SERVICIOS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_restaurado`
--

DROP TABLE IF EXISTS `prm_restaurado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_restaurado` (
  `id_restaurado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_restaurado` char(3) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_restaurado`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_sincronizacion`
--

DROP TABLE IF EXISTS `prm_sincronizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_sincronizacion` (
  `id_sincronizacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRM_SINCRONIZACION',
  `id_empresa_relacionada` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRM_EMPRESA_RELACIONADA',
  `nombre_tabla` varchar(256) DEFAULT NULL COMMENT 'Nombre de la tabla que se sincroniza',
  `id_interno` varchar(15) DEFAULT NULL COMMENT 'Código interno del dato que se sincroniza',
  `id_externo` varchar(15) DEFAULT NULL COMMENT 'Código externo del dato que se sincroniza',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_sincronizacion`),
  UNIQUE KEY `idx_unk_datos` (`nombre_tabla`,`id_interno`,`id_empresa_relacionada`),
  KEY `fk_empresa_relacionada_a_sincronizacion` (`id_empresa_relacionada`),
  CONSTRAINT `fk_empresa_relacionada_a_sincronizacion` FOREIGN KEY (`id_empresa_relacionada`) REFERENCES `prm_empresa_relacionada` (`id_empresa_relacionada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todos los datos del CRM sincronizados ent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_tipo_identificacion_sri`
--

DROP TABLE IF EXISTS `prm_tipo_identificacion_sri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_tipo_identificacion_sri` (
  `id_tipo_identificacion_sri` varchar(3) NOT NULL,
  `descripcion_tipo_identificacion_sri` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_identificacion_sri`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_tipo_impuesto_sri`
--

DROP TABLE IF EXISTS `prm_tipo_impuesto_sri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_tipo_impuesto_sri` (
  `id_tipo_impuesto_sri` varchar(3) NOT NULL,
  `descripcion_tipo_impuesto_sri` varchar(256) DEFAULT NULL,
  `es_servicio` char(1) DEFAULT 'N' COMMENT 'Indica S=si es o N0no el impuesto que corresponde al servicio',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_impuesto_sri`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_tipo_motivo`
--

DROP TABLE IF EXISTS `prm_tipo_motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_tipo_motivo` (
  `id_tipo_motivo` varchar(4) NOT NULL COMMENT 'Código',
  `descripcion_tipo_motivo` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de motivo',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_motivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los tipos de motivo que pueden existir.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_tipo_operacion`
--

DROP TABLE IF EXISTS `prm_tipo_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_tipo_operacion` (
  `id_tipo_operacion` varchar(4) NOT NULL COMMENT 'Código del tipo de operación',
  `descripcion_tipo_operacion` varchar(100) DEFAULT NULL COMMENT 'Descripción del tipo de operación',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los tipos de operaciones que puede realizar una emp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_tipo_operacion_x_empresa`
--

DROP TABLE IF EXISTS `prm_tipo_operacion_x_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_tipo_operacion_x_empresa` (
  `id_tipo_operacion_x_empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del tipo de operación por empresa',
  `id_empresa` int(11) DEFAULT NULL COMMENT 'Código de la empresa',
  `id_tipo_operacion` varchar(4) DEFAULT NULL COMMENT 'Código del tipo de operación',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_operacion_x_empresa`),
  KEY `fk_empresa_a_tp_oper_x_empr` (`id_empresa`),
  KEY `fk_tipo_operacion_a_tp_oper_x_empr` (`id_tipo_operacion`),
  CONSTRAINT `fk_empresa_a_tp_oper_x_empr` FOREIGN KEY (`id_empresa`) REFERENCES `prm_empresa` (`id_empresa`),
  CONSTRAINT `fk_tipo_operacion_a_tp_oper_x_empr` FOREIGN KEY (`id_tipo_operacion`) REFERENCES `prm_tipo_operacion` (`id_tipo_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todos los tipos de operaciones a los que ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_tipo_regimen_tributario`
--

DROP TABLE IF EXISTS `prm_tipo_regimen_tributario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prm_tipo_regimen_tributario` (
  `id_tipo_regimen_tributario` char(3) NOT NULL,
  `descripcion_tipo_regimen_tributario` varchar(100) DEFAULT NULL,
  `estado_tipo_regimen_tributario` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_regimen_tributario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_archivo_proveedor`
--

DROP TABLE IF EXISTS `prv_archivo_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_archivo_proveedor` (
  `id_archivo_proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRV_ARCHIVO_PROVEEDOR',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `descripcion_archivo_proveedor` varchar(256) DEFAULT NULL COMMENT 'Descripcion del archivo',
  `nombre_archivo` varchar(100) DEFAULT NULL COMMENT 'Nombre del archivo donde está grabado el objeto',
  `tipo_archivo` varchar(3) DEFAULT NULL COMMENT 'Tipo de archivo que se está ingresando TXT=Texto, IMG=Imagen',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_archivo_proveedor`),
  KEY `fk_proveedor_a_archivo` (`id_proveedor`),
  CONSTRAINT `fk_proveedor_a_archivo` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Almacena los archivos relacionados con el proveedor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_cabecera_xml`
--

DROP TABLE IF EXISTS `prv_cabecera_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_cabecera_xml` (
  `id_cabecera_xml` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_compra` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRV_COMPRA',
  `id_factura` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla FAC_FACTURA',
  `id_retencion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_RETENCION',
  `estado_cabecera_xml` varchar(3) DEFAULT NULL COMMENT 'Estado en el que se encuentra el dato transitorio ING=Ingresado, PRC=Procesado, XXX=Anulado',
  `nombre_xml` varchar(256) DEFAULT NULL COMMENT 'Nombre del archivo XML que se sube',
  `observacion_xml` varchar(256) DEFAULT NULL COMMENT 'Observaciones a cerca del archivo incluidas por el sistema',
  `nro_factura` varchar(100) DEFAULT NULL COMMENT 'Campo en el que se ingresa el número de factura del bloque que se imprime',
  `descuento_compra` decimal(15,4) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL COMMENT 'Código del motivo de descuento',
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación del documento, esta fecha es modificable.',
  `fecha_pago` datetime DEFAULT NULL COMMENT 'Fecha de pago',
  `id_motivo_anulacion` int(11) DEFAULT NULL COMMENT 'Código del motivo de anulación',
  `sustento_tributario_ats` varchar(4) DEFAULT NULL COMMENT 'Campo ATS',
  `tipo_comprobante_ats` varchar(4) DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_emision_ats` date DEFAULT NULL COMMENT 'Campo ATS',
  `establecimiento_ats` varchar(100) DEFAULT NULL COMMENT 'Nro. de establecimiento para el ATS',
  `punto_emision_ats` varchar(100) DEFAULT NULL COMMENT 'Punto de emisión para el ATS',
  `nro_autorizacion_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `tipo_pago_ats` varchar(3) DEFAULT NULL COMMENT 'Campo ATS',
  `convenio_dt_ats` char(1) DEFAULT NULL COMMENT 'Campo ATS',
  `sujeto_ret_ats` char(1) DEFAULT NULL COMMENT 'Campo ATS',
  `comprobante_ret_ats` char(1) DEFAULT NULL COMMENT 'Campo ATS',
  `establecimiento_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `punto_emision_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `secuencial_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `nro_autoriza_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_emision_ret_ats` date DEFAULT NULL COMMENT 'Campo ATS',
  `codigo_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `concepto_ret_ats` text COMMENT 'Campo ATS',
  `nro_serie_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `no_ats` char(1) DEFAULT 'S' COMMENT 'Si está en N, esta compra no va en el ATS',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_RESERVA',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_cabecera_xml`),
  KEY `fk_compra_a_cabxml` (`id_compra`),
  KEY `fk_proveedor_a_cabxml` (`id_proveedor`),
  KEY `fk_reserva_a_cabecera_xml` (`id_reserva`),
  KEY `fk_factura_a_reserva` (`id_factura`),
  KEY `fk_retencion_a_cabecera_xml` (`id_retencion`),
  CONSTRAINT `fk_compra_a_cabxml` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_factura_a_reserva` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_proveedor_a_cabxml` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_reserva_a_cabecera_xml` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`),
  CONSTRAINT `fk_retencion_a_cabecera_xml` FOREIGN KEY (`id_retencion`) REFERENCES `ctb_retencion` (`id_retencion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena transitoriamente las compras que vienen en el archivo XML de subida masiva.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_compra`
--

DROP TABLE IF EXISTS `prv_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_compra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_RESERVA',
  `id_pais` int(11) DEFAULT NULL COMMENT 'Código tabla PER_PAIS',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_centro_costo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CENTRO_COSTO',
  `nro_factura` varchar(100) DEFAULT NULL COMMENT 'Campo en el que se ingresa el número de factura del bloque que se imprime',
  `descuento_compra` decimal(15,4) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL COMMENT 'Código del motivo de descuento',
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `estado_compra` char(1) DEFAULT NULL,
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación de la compra',
  `fecha_pago` date DEFAULT NULL COMMENT 'Fecha en la que se realiza el pago de la compra',
  `id_motivo_anulacion` int(11) DEFAULT NULL,
  `sustento_tributario_ats` varchar(4) DEFAULT NULL COMMENT 'Campo ATS',
  `tipo_comprobante_ats` varchar(4) DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_emision_ats` date DEFAULT NULL COMMENT 'Campo ATS',
  `establecimiento_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `punto_emision_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `nro_autorizacion_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `tipo_pago_ats` varchar(3) DEFAULT NULL COMMENT 'Campo ATS',
  `convenio_dt_ats` char(1) DEFAULT NULL COMMENT 'Campo ATS',
  `sujeto_ret_ats` char(1) DEFAULT NULL COMMENT 'Campo ATS',
  `comprobante_ret_ats` char(1) DEFAULT NULL COMMENT 'Campo ATS',
  `establecimiento_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `punto_emision_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `secuencial_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `nro_autoriza_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `fecha_emision_ret_ats` date DEFAULT NULL COMMENT 'Campo ATS',
  `codigo_ret_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `concepto_ret_ats` text COMMENT 'Campo ATS',
  `nro_serie_ats` varchar(100) DEFAULT NULL COMMENT 'Campo ATS',
  `no_ats` char(1) DEFAULT 'S' COMMENT 'Si está en N, esta compra no va en el ATS',
  `origen_archivo` char(1) DEFAULT 'N' COMMENT 'Indica si proviene o no de archivo S o N',
  `tipo_electronica_manual` char(1) DEFAULT NULL COMMENT 'Indica si la factura, retención o nota de crédito fue E=Electrónica o M=Manual',
  `clave_acceso_ret_ats` varchar(256) DEFAULT NULL COMMENT 'Clave de acceso que la retención electrónica genera',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_compra`),
  KEY `fk_pais_a_compra` (`id_pais`),
  KEY `fk_proveedor_a_compra` (`id_proveedor`),
  KEY `fk_reserva_a_compra` (`id_reserva`),
  KEY `fk_centro_costo_a_compra` (`id_centro_costo`),
  CONSTRAINT `fk_centro_costo_a_compra` FOREIGN KEY (`id_centro_costo`) REFERENCES `ctb_centro_costo` (`id_centro_costo`),
  CONSTRAINT `fk_pais_a_compra` FOREIGN KEY (`id_pais`) REFERENCES `per_pais` (`id_pais`),
  CONSTRAINT `fk_proveedor_a_compra` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_reserva_a_compra` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las compras de insumos, bienes y servicio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_contabilidad_detalle_prv`
--

DROP TABLE IF EXISTS `prv_contabilidad_detalle_prv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_contabilidad_detalle_prv` (
  `id_contabilidad_detalle_prv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRV_contabilidad_detalle_prv',
  `id_detalle_compra` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRV_DETALLE_COMPRA',
  `id_cuenta` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CUENTA',
  `id_concepto_retencion` varchar(15) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CONCEPTO_RETENCION',
  `id_tipo_retencion_ir` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `id_tipo_retencion_iva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que se realiza la última modificación del registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se realiza la última modificación del registro',
  PRIMARY KEY (`id_contabilidad_detalle_prv`),
  KEY `fk_concepto_a_contabilidad_detalle_prv` (`id_concepto_retencion`),
  KEY `fk_cuenta_a_contabilidad_detalle_prv` (`id_cuenta`),
  KEY `fk_det_compra_a_contabilidad_detalle_prv` (`id_detalle_compra`),
  KEY `fk_tipo_retencion_a_contab_det_compra_ir` (`id_tipo_retencion_ir`),
  KEY `fk_tipo_retencion_a_contab_det_compra_iva` (`id_tipo_retencion_iva`),
  CONSTRAINT `fk_concepto_a_contabilidad_detalle_prv` FOREIGN KEY (`id_concepto_retencion`) REFERENCES `ctb_concepto_retencion` (`id_concepto_retencion`),
  CONSTRAINT `fk_cuenta_a_contabilidad_detalle_prv` FOREIGN KEY (`id_cuenta`) REFERENCES `ctb_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_det_compra_a_contabilidad_detalle_prv` FOREIGN KEY (`id_detalle_compra`) REFERENCES `prv_detalle_compra` (`id_detalle_compra`),
  CONSTRAINT `fk_tipo_retencion_a_contab_det_compra_ir` FOREIGN KEY (`id_tipo_retencion_ir`) REFERENCES `ctb_tipo_retencion` (`id_tipo_retencion`),
  CONSTRAINT `fk_tipo_retencion_a_contab_det_compra_iva` FOREIGN KEY (`id_tipo_retencion_iva`) REFERENCES `ctb_tipo_retencion` (`id_tipo_retencion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_cuenta_x_proveedor`
--

DROP TABLE IF EXISTS `prv_cuenta_x_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_cuenta_x_proveedor` (
  `id_cuenta_x_proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla PRV_CUENTA_X_PROVEEDOR',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_periodo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_PERIODO',
  `id_cuenta_fp_noinmediata` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar la forma de pago inmediata',
  `id_cuenta_fp_inmediata` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar la forma de pago no inmediata',
  `id_cuenta_anticipo` int(11) DEFAULT NULL COMMENT 'Cuenta para contabilizar el anticipo',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_x_proveedor`),
  UNIQUE KEY `idx_cuenta_x_periodo_x_proveedor` (`id_proveedor`,`id_periodo`),
  KEY `fk_periodo_a_cuenta_x_proveedor` (`id_periodo`),
  CONSTRAINT `fk_periodo_a_cuenta_x_proveedor` FOREIGN KEY (`id_periodo`) REFERENCES `ctb_periodo` (`id_periodo`),
  CONSTRAINT `fk_proveedor_a_cuenta` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=1230 DEFAULT CHARSET=latin1 COMMENT='Almacena las cuentas que necesita el proveedor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_detalle_compra`
--

DROP TABLE IF EXISTS `prv_detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_detalle_compra` (
  `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_compra` int(11) DEFAULT NULL,
  `cantidad_detalle` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad de productos vendidos del mismo tipo',
  `precio_unitario` decimal(15,4) DEFAULT NULL,
  `impuesto_valor` decimal(15,4) DEFAULT NULL COMMENT 'Indica la cantidad fija que hay que cobrar como impuesto',
  `impuesto_porcentaje` decimal(15,4) DEFAULT NULL COMMENT 'Indica el porcentaje de impuesto a cobrar',
  `impuesto_total` decimal(15,4) DEFAULT NULL,
  `descuento_detalle` decimal(15,4) DEFAULT NULL COMMENT 'Valor del descuento otorgado',
  `id_motivo_descuento` int(11) DEFAULT NULL COMMENT 'Código del motivo de descuento',
  `ingresar_kardex` char(1) DEFAULT 'S' COMMENT 'Este campo indica si se debe o no ingresar al kardex',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_compra`),
  KEY `fk_compra_a_det_compra` (`id_compra`),
  KEY `fk_insumo_a_det_compra` (`id_insumo`),
  CONSTRAINT `fk_compra_a_det_compra` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_insumo_a_det_compra` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el detalle de insumos, bienes y servicios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_detalle_valor_compra`
--

DROP TABLE IF EXISTS `prv_detalle_valor_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_detalle_valor_compra` (
  `id_detalle_valor_compra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `id_compra` int(11) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_valor_compra`),
  KEY `fk_compra_a_det_valor` (`id_compra`),
  KEY `fk_impuesto_a_det_valor_compra` (`id_impuesto`),
  CONSTRAINT `fk_compra_a_det_valor` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_impuesto_a_det_valor_compra` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el detalle de valores totales de la compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_detalle_valor_compra_x_item`
--

DROP TABLE IF EXISTS `prv_detalle_valor_compra_x_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_detalle_valor_compra_x_item` (
  `id_detalle_valor_compra_x_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_compra` int(11) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_valor_compra_x_item`),
  KEY `fk_detalle_a_det_valor_compra` (`id_detalle_compra`),
  KEY `fk_impuesto_a_det_valor_det_compra` (`id_impuesto`),
  CONSTRAINT `fk_detalle_a_det_valor_compra` FOREIGN KEY (`id_detalle_compra`) REFERENCES `prv_detalle_compra` (`id_detalle_compra`),
  CONSTRAINT `fk_impuesto_a_det_valor_det_compra` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el detalle valor de la compra por cada item del det';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_detalle_valor_xml`
--

DROP TABLE IF EXISTS `prv_detalle_valor_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_detalle_valor_xml` (
  `id_detalle_valor_xml` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `id_cabecera_xml` int(11) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL,
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_valor_xml`),
  KEY `fk_cabxml_a_detvalxml` (`id_cabecera_xml`),
  KEY `fk_impuesto_a_detvalxml` (`id_impuesto`),
  CONSTRAINT `fk_cabxml_a_detvalxml` FOREIGN KEY (`id_cabecera_xml`) REFERENCES `prv_cabecera_xml` (`id_cabecera_xml`),
  CONSTRAINT `fk_impuesto_a_detvalxml` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el detalle de valores totales de la compra subida desde el archivo XML';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_detalle_valor_xml_x_item`
--

DROP TABLE IF EXISTS `prv_detalle_valor_xml_x_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_detalle_valor_xml_x_item` (
  `id_detalle_valor_xml_x_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_impuesto` varchar(4) DEFAULT NULL,
  `id_detalle_xml` int(11) DEFAULT NULL,
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_valor_xml_x_item`),
  KEY `fk_detxml_a_detvalxitemxml` (`id_detalle_xml`),
  KEY `fk_impuesto_a_detvalxitemxml` (`id_impuesto`),
  CONSTRAINT `fk_detxml_a_detvalxitemxml` FOREIGN KEY (`id_detalle_xml`) REFERENCES `prv_detalle_xml` (`id_detalle_xml`),
  CONSTRAINT `fk_impuesto_a_detvalxitemxml` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el detalle valor de la compra por cada item del detalle del XML';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_detalle_xml`
--

DROP TABLE IF EXISTS `prv_detalle_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_detalle_xml` (
  `id_detalle_xml` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo` int(11) DEFAULT NULL,
  `id_cabecera_xml` int(11) DEFAULT NULL,
  `cantidad_detalle` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad de productos vendidos del mismo tipo',
  `precio_unitario` decimal(15,4) DEFAULT NULL,
  `impuesto_valor` decimal(15,4) DEFAULT NULL COMMENT 'Indica la cantidad fija que hay que cobrar como impuesto',
  `impuesto_porcentaje` decimal(15,4) DEFAULT NULL COMMENT 'Indica el porcentaje de impuesto a cobrar',
  `impuesto_total` decimal(15,4) DEFAULT NULL,
  `descuento_detalle` decimal(15,4) DEFAULT NULL COMMENT 'Valor del descuento otorgado',
  `id_motivo_descuento` int(11) DEFAULT NULL COMMENT 'Código del motivo de descuento',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_xml`),
  KEY `fk_insumo_a_detxml` (`id_insumo`),
  KEY `fk_cabxml_a_detxml` (`id_cabecera_xml`),
  CONSTRAINT `fk_cabxml_a_detxml` FOREIGN KEY (`id_cabecera_xml`) REFERENCES `prv_cabecera_xml` (`id_cabecera_xml`),
  CONSTRAINT `fk_insumo_a_detxml` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena transitoriamente el detalle de insumos, bienes y servicios y activos fijos contenidos en los archivos XML';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_forma_pago_compra`
--

DROP TABLE IF EXISTS `prv_forma_pago_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_forma_pago_compra` (
  `id_forma_pago_compra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `id_compra` int(11) DEFAULT NULL,
  `id_tipo_forma_pago_compra` int(11) DEFAULT NULL,
  `porcentaje_forma_pago` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje que se paga con esta forma de pago',
  `id_moneda_forma_pago` int(11) DEFAULT NULL COMMENT 'Moneda del pago',
  `estado_forma_pago` char(1) DEFAULT 'F' COMMENT 'Indica si fue registrada en la factura o en el cobro',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_forma_pago_compra`),
  KEY `fk_compra_a_forma_pago` (`id_compra`),
  KEY `fk_tipo_forma_pago_a_forma_pago_compra` (`id_tipo_forma_pago_compra`),
  CONSTRAINT `fk_compra_a_forma_pago` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_tipo_forma_pago_a_forma_pago_compra` FOREIGN KEY (`id_tipo_forma_pago_compra`) REFERENCES `prv_tipo_forma_pago_compra` (`id_tipo_forma_pago_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la forma de pago de la compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_generico_zip`
--

DROP TABLE IF EXISTS `prv_generico_zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_generico_zip` (
  `id_generico_zip` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la clave PRV_GENERICO_ZIP',
  `id_tipo_insumo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_TIPO_INSUMO',
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_INSUMO',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_generico_zip`),
  KEY `fk_insumo_a_generico_zip` (`id_insumo`),
  KEY `fk_tipo_insumo_a_generico_zip` (`id_tipo_insumo`),
  CONSTRAINT `fk_insumo_a_generico_zip` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_tipo_insumo_a_generico_zip` FOREIGN KEY (`id_tipo_insumo`) REFERENCES `prd_tipo_insumo` (`id_tipo_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los datos genéricos para colocar en los insumos de las compras subidas por ZIP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_proveedor`
--

DROP TABLE IF EXISTS `prv_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_tipo_retencion_ir` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `id_tipo_retencion_iva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_TIPO_RETENCION',
  `id_concepto_retencion` varchar(15) DEFAULT NULL COMMENT 'Clave primaria de la tabla CTB_CONCEPTO_RETENCION',
  `estado_proveedor` char(1) DEFAULT NULL,
  `es_interno` char(1) DEFAULT 'N',
  `tipo_identificacion_ats` varchar(3) DEFAULT NULL COMMENT 'Tipo de identificación relacionada al SRI',
  `dias_fecha_max` int(11) DEFAULT NULL COMMENT 'Dias menos o mas para fecha maxima',
  `dias_time_limit` int(11) DEFAULT NULL COMMENT 'Número de días que debe transcurrir entre la fecha time limit y la fecha actual para lanzar alertas',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `idx_norepetir_persona` (`id_persona`),
  KEY `fk_operacion_a_proveedor` (`id_operacion`),
  KEY `fk_tipo_retencion_ir_a_proveedor` (`id_tipo_retencion_ir`),
  KEY `fk_tipo_retencion_iva_a_proveedor` (`id_tipo_retencion_iva`),
  KEY `fk_concepto_retencion_a_proveedor` (`id_concepto_retencion`),
  CONSTRAINT `fk_concepto_retencion_a_proveedor` FOREIGN KEY (`id_concepto_retencion`) REFERENCES `ctb_concepto_retencion` (`id_concepto_retencion`),
  CONSTRAINT `fk_operacion_a_proveedor` FOREIGN KEY (`id_operacion`) REFERENCES `prd_operacion` (`id_operacion`),
  CONSTRAINT `fk_persona_a_proveedor` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_tipo_retencion_ir_a_proveedor` FOREIGN KEY (`id_tipo_retencion_ir`) REFERENCES `ctb_tipo_retencion` (`id_tipo_retencion`),
  CONSTRAINT `fk_tipo_retencion_iva_a_proveedor` FOREIGN KEY (`id_tipo_retencion_iva`) REFERENCES `ctb_tipo_retencion` (`id_tipo_retencion`)
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=latin1 COMMENT='Almacena las personas que proveen los productos o insumos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_sustento_tributario`
--

DROP TABLE IF EXISTS `prv_sustento_tributario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_sustento_tributario` (
  `id_sustento_tributario` char(11) NOT NULL,
  `descripcion_sustento_tributario` varchar(200) DEFAULT NULL,
  `estado_sustento_tributario` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sustento_tributario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los datos de sustento tributario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_tipo_forma_pago_compra`
--

DROP TABLE IF EXISTS `prv_tipo_forma_pago_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_tipo_forma_pago_compra` (
  `id_tipo_forma_pago_compra` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_forma_pago_compra` varchar(100) DEFAULT NULL,
  `efectivo_credito` char(1) DEFAULT NULL,
  `estado_tipo_forma_pago_compra` char(1) DEFAULT 'A',
  `plazo` decimal(15,0) DEFAULT NULL,
  `requiere_cobro` char(1) DEFAULT 'S',
  `codigo_ats` varchar(15) DEFAULT NULL COMMENT 'Campo ATS',
  `requiere_entidad_financiera` char(1) DEFAULT 'N' COMMENT 'Indica si requiere o no informar datos de una entidad financiera',
  `es_caja_chica` char(1) DEFAULT 'N' COMMENT 'Indica si la forma de pago se refiere a la caja chica',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_forma_pago_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el tipo de forma de pago con la que se realiza una compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prv_tipo_identificacion_especial`
--

DROP TABLE IF EXISTS `prv_tipo_identificacion_especial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prv_tipo_identificacion_especial` (
  `id_tipo_identificacion_especial` varchar(3) NOT NULL,
  `descripcion_tipo_identificacion_especial` varchar(256) DEFAULT NULL,
  `estado_identificacion_especial` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_identificacion_especial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda el tipo de indentificación especial del SRI para proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_afinidad`
--

DROP TABLE IF EXISTS `res_afinidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_afinidad` (
  `id_afinidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_AFINIDAD',
  `descripcion_afinidad` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_afinidad`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Permite configurar los tipos de afinidad que existen para relacionar pasajeros';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_anticipo_x_nota_credito`
--

DROP TABLE IF EXISTS `res_anticipo_x_nota_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_anticipo_x_nota_credito` (
  `id_anticipo_x_nota_credito` int(11) NOT NULL AUTO_INCREMENT,
  `id_anticipo` int(11) DEFAULT NULL,
  `id_nota_credito` int(11) DEFAULT NULL,
  `valor` decimal(15,6) DEFAULT NULL,
  `fecha_cruce` date DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_anticipo_x_nota_credito`),
  KEY `fk_anticipo_a_nota_credito` (`id_anticipo`),
  KEY `fk_nota_credito_a_anticipo` (`id_nota_credito`),
  CONSTRAINT `fk_anticipo_a_nota_credito` FOREIGN KEY (`id_anticipo`) REFERENCES `crt_anticipo` (`id_anticipo`),
  CONSTRAINT `fk_nota_credito_a_anticipo` FOREIGN KEY (`id_nota_credito`) REFERENCES `res_nota_credito` (`id_nota_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_archivo_reserva`
--

DROP TABLE IF EXISTS `res_archivo_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_archivo_reserva` (
  `id_archivo_reserva` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_ARCHIVO_RESERVA',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `descripcion_archivo_reserva` varchar(256) DEFAULT NULL COMMENT 'Descripción del archivo',
  `nombre_archivo` varchar(100) DEFAULT NULL COMMENT 'Nombre del archivo donde está grabado el objeto',
  `tipo_archivo` varchar(3) DEFAULT NULL COMMENT 'Tipo de archivo que se está ingresando TXT=Texto, IMG=Imagen',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_archivo_reserva`),
  KEY `fk_reserva_a_archivo` (`id_reserva`),
  CONSTRAINT `fk_reserva_a_archivo` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='Almacena los archivos relacionados con la reserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_cantidad_ocupacion`
--

DROP TABLE IF EXISTS `res_cantidad_ocupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_cantidad_ocupacion` (
  `id_cantidad_ocupacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_operacion` varchar(4) DEFAULT NULL COMMENT 'Código del tipo de operación',
  `id_unidad_estrategica` int(11) DEFAULT NULL,
  `cantidad_producto_ocupacion` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad del producto para saber su ocupación',
  `cantidad_subproducto_ocupacion` decimal(15,4) DEFAULT NULL COMMENT 'Cantidad del producto contenido en otro producto para saber su ocupación',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cantidad_ocupacion`),
  KEY `fk_tp_operacion_a_cantidad_ocupacion` (`id_tipo_operacion`),
  KEY `fk_und_estr_a_cantidad_ocupacion` (`id_unidad_estrategica`),
  CONSTRAINT `fk_tp_operacion_a_cantidad_ocupacion` FOREIGN KEY (`id_tipo_operacion`) REFERENCES `prm_tipo_operacion` (`id_tipo_operacion`),
  CONSTRAINT `fk_und_estr_a_cantidad_ocupacion` FOREIGN KEY (`id_unidad_estrategica`) REFERENCES `prd_unidad_estrategica` (`id_unidad_estrategica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que sirve para almacenar el número total de habitacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_clasificacion`
--

DROP TABLE IF EXISTS `res_clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_clasificacion` (
  `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_clasificacion` varchar(100) DEFAULT NULL,
  `tipo_clasificacion` varchar(4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_clasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_clasificador_excluido`
--

DROP TABLE IF EXISTS `res_clasificador_excluido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_clasificador_excluido` (
  `id_clasificador_excluido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_CLASIFICADOR_EXCLUIDO',
  `id_super_tipo_insumo` int(11) DEFAULT NULL,
  `tipo_exclusion` char(1) DEFAULT NULL COMMENT 'Indica de qué procesp excluye el clasificador C=Reinserción de cantidad, G=Regeneración de componentes',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_clasificador_excluido`),
  KEY `fk_super_tipo_insumo_a_exclusion` (`id_super_tipo_insumo`),
  CONSTRAINT `fk_super_tipo_insumo_a_exclusion` FOREIGN KEY (`id_super_tipo_insumo`) REFERENCES `prd_super_tipo_insumo` (`id_super_tipo_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='Ventana que almacena los clasificadores de insumos excluídos de la reinserción de cantidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_clasificador_mercado`
--

DROP TABLE IF EXISTS `res_clasificador_mercado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_clasificador_mercado` (
  `id_clasificador_mercado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria tabla RES_CLASIFICADOR_MERCADO',
  `descripcion_clasificador_mercado` varchar(150) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_clasificador_mercado`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_comisionante_cuadro_venta`
--

DROP TABLE IF EXISTS `res_comisionante_cuadro_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_comisionante_cuadro_venta` (
  `id_comisionante_cuadro_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `porcentaje_comision` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` datetime DEFAULT NULL,
  `fecha_modifica` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_comisionante_cuadro_venta`),
  UNIQUE KEY `idx_persona_contacto` (`id_persona`),
  CONSTRAINT `fk_persona_a_comis_cuadro_vta` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_configuracion_x_estado`
--

DROP TABLE IF EXISTS `res_configuracion_x_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_configuracion_x_estado` (
  `id_configuracion_x_estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_CONFIGURACION_X_ESTADO',
  `estado_reserva` char(3) DEFAULT NULL,
  `cambia_con_anticipo` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuracion_x_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_cotizador`
--

DROP TABLE IF EXISTS `res_cotizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_cotizador` (
  `id_cotizador` int(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_proforma` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_detalle_reserva` int(11) DEFAULT NULL,
  `orden_visual` int(11) DEFAULT NULL,
  `nro_pax` int(11) DEFAULT NULL COMMENT 'Cantidad de pasajeros',
  `costo_individual` decimal(15,4) DEFAULT NULL,
  `costo_general` decimal(15,4) DEFAULT NULL,
  `total_con_impuesto` decimal(15,4) DEFAULT NULL,
  `costo_x_pax_con_impuesto` decimal(15,4) DEFAULT NULL,
  `porcentaje_neto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje neto en cantidad',
  `precio_total_neto` decimal(15,4) DEFAULT NULL,
  `porcentaje_venta` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de ventas en cantidad',
  `precio_total_rac` decimal(15,4) DEFAULT NULL,
  `precio_x_pax_neto` decimal(15,4) DEFAULT NULL,
  `precio_x_pax_rac` decimal(15,4) DEFAULT NULL,
  `gratuidad_pax_neta` decimal(15,4) DEFAULT NULL,
  `gratuidad_pax_rac` decimal(15,4) DEFAULT NULL,
  `single_supp_neto` decimal(15,4) DEFAULT NULL,
  `single_supp_rac` decimal(15,4) DEFAULT NULL,
  `descuento_tpl_neto` decimal(15,4) DEFAULT NULL,
  `descuento_tpl_rac` decimal(15,4) DEFAULT NULL,
  `precio_total_neto_tpl` decimal(15,4) DEFAULT NULL,
  `precio_total_rac_tpl` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_cotizador`),
  KEY `fk_detalle_proforma_a_cotizador` (`id_detalle_proforma`),
  KEY `fk_det_reserva_a_cotizador` (`id_detalle_reserva`),
  CONSTRAINT `fk_det_reserva_a_cotizador` FOREIGN KEY (`id_detalle_reserva`) REFERENCES `res_detalle_reserva` (`id_detalle_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=latin1 COMMENT='Almacena los datos del cotizador de un producto de una reser';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_detalle_reserva`
--

DROP TABLE IF EXISTS `res_detalle_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_detalle_reserva` (
  `id_detalle_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto_x_precio_producto` int(11) DEFAULT NULL,
  `id_precio_x_temporada` int(11) DEFAULT NULL,
  `id_reserva` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `id_per_x_rsrv_x_prd_cargo` int(11) DEFAULT NULL,
  `id_persona_mesero` int(11) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL,
  `id_motivo_ingreso_manual` int(11) DEFAULT NULL,
  `id_detalle_reserva_ss` int(11) DEFAULT NULL,
  `id_caso_relacionado` int(11) DEFAULT NULL,
  `id_lugar` int(11) DEFAULT NULL,
  `id_lugar2` int(11) DEFAULT NULL,
  `id_vuelo` int(11) DEFAULT NULL,
  `cargado` char(1) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `hora_ejecucion` datetime DEFAULT NULL,
  `nro_pax` decimal(15,8) DEFAULT NULL,
  `nro_unidades` decimal(15,8) DEFAULT NULL,
  `precio_unitario` decimal(15,8) DEFAULT NULL,
  `total_impuesto_porcentaje` decimal(15,8) DEFAULT NULL,
  `total_impuesto_valor` decimal(15,8) DEFAULT NULL,
  `total_impuesto_neto` decimal(15,8) DEFAULT NULL,
  `porcentaje_descuento` decimal(15,8) DEFAULT NULL,
  `descuento_en_valor` decimal(15,8) DEFAULT NULL,
  `prioridad_descuento` varchar(3) DEFAULT NULL,
  `precio_total` decimal(15,8) DEFAULT NULL,
  `individual_general` char(1) DEFAULT NULL,
  `medida_calculo_precio` char(1) DEFAULT NULL,
  `se_reserva` char(1) DEFAULT NULL,
  `tipo_precio` char(1) DEFAULT NULL,
  `observacion_detalle` text,
  `es_single_suplement` char(1) DEFAULT NULL,
  `comision_fija` decimal(15,8) DEFAULT NULL,
  `porcentaje_utilidad` decimal(15,8) DEFAULT NULL,
  `cantidad_parcial` decimal(15,8) DEFAULT NULL,
  `cantidad_total` decimal(15,8) DEFAULT NULL,
  `ejecutado` int(11) DEFAULT '0',
  `blank_copy` char(1) DEFAULT NULL,
  `we_welcome_message` varchar(256) DEFAULT NULL COMMENT 'Campo para colocar el welcome message que va a WeTravel',
  `we_fees_pay` varchar(100) DEFAULT NULL COMMENT 'Campo que indica cómo se hará el pago de los fees para WeTravel',
  `we_id_image` varchar(100) DEFAULT NULL,
  `we_public_private` char(1) DEFAULT 'V' COMMENT 'Campo que indica si el trip es P=Público o V=Privado',
  `we_id_paragraph` varchar(100) DEFAULT NULL COMMENT 'Código del párrafo en WeTravel',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_reserva`),
  KEY `fk_prc_tpprodxtmp_a_det_reserva` (`id_precio_x_temporada`),
  KEY `fk_prd_x_precio_a_det_reserva` (`id_producto_x_precio_producto`),
  KEY `fk_producto_a_det_reserva` (`id_producto`),
  KEY `fk_reserva_a_det_reserva` (`id_reserva`),
  KEY `fk_lugar_a_detalle_reserva1` (`id_lugar`),
  KEY `fk_lugar_a_detalle_reserva2` (`id_lugar2`),
  KEY `fk_vuelo_a_detalle_reserva` (`id_vuelo`),
  CONSTRAINT `fk_lugar_a_detalle_reserva1` FOREIGN KEY (`id_lugar`) REFERENCES `res_lugar` (`id_lugar`),
  CONSTRAINT `fk_lugar_a_detalle_reserva2` FOREIGN KEY (`id_lugar2`) REFERENCES `res_lugar` (`id_lugar`),
  CONSTRAINT `fk_prc_tpprodxtmp_a_det_reserva` FOREIGN KEY (`id_precio_x_temporada`) REFERENCES `prd_precio_x_temporada` (`id_precio_x_temporada`),
  CONSTRAINT `fk_prd_x_precio_a_det_reserva` FOREIGN KEY (`id_producto_x_precio_producto`) REFERENCES `prd_producto_x_precio_producto` (`id_producto_x_precio_producto`),
  CONSTRAINT `fk_producto_a_det_reserva` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_reserva_a_det_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`),
  CONSTRAINT `fk_vuelo_a_detalle_reserva` FOREIGN KEY (`id_vuelo`) REFERENCES `res_vuelo` (`id_vuelo`)
) ENGINE=InnoDB AUTO_INCREMENT=25114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_detalle_valor`
--

DROP TABLE IF EXISTS `res_detalle_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_detalle_valor` (
  `id_detalle_valor_res` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_DETALLE_VALOR',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor_res`),
  KEY `fk_impuesto_a_detalle_valor_res` (`id_impuesto`),
  KEY `fk_reserva_a_detalle_valor` (`id_reserva`),
  CONSTRAINT `fk_impuesto_a_detalle_valor_res` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_reserva_a_detalle_valor` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=221251 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los totales de la cabecera de la reserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_detalle_valor_prd`
--

DROP TABLE IF EXISTS `res_detalle_valor_prd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_detalle_valor_prd` (
  `id_detalle_valor_prd` int(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_reserva` int(11) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código del impuesto o descuento a aplicarse',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Indica qué tipo de valor es el que está almacenado en la línea correspondiente',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor_prd`),
  KEY `fk_impuesto_a_det_valor_prd` (`id_impuesto`),
  KEY `fk_det_reserva_a_det_valor_prd` (`id_detalle_reserva`),
  CONSTRAINT `fk_det_reserva_a_det_valor_prd` FOREIGN KEY (`id_detalle_reserva`) REFERENCES `res_detalle_reserva` (`id_detalle_reserva`),
  CONSTRAINT `fk_impuesto_a_det_valor_prd` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=284540 DEFAULT CHARSET=latin1 COMMENT='Almacena los valores resultantes de la reserva del producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_detalle_valor_x_insumo`
--

DROP TABLE IF EXISTS `res_detalle_valor_x_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_detalle_valor_x_insumo` (
  `id_detalle_valor_x_insumo_res` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_DETALLE_VALOR_X_INSUMO',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_insumo_x_itinerario_res` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT 'N' COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `cambio_a_mano` char(1) DEFAULT 'N' COMMENT 'Indica si se ha hecho un cambio manual a un impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor_x_insumo_res`),
  KEY `fk_impuesto_a_detalle_valor_x_insumo_res` (`id_impuesto`),
  KEY `fk_insumo_a_detalle_valor_res` (`id_insumo_x_itinerario_res`),
  CONSTRAINT `fk_impuesto_a_detalle_valor_x_insumo_res` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_insumo_a_detalle_valor_res` FOREIGN KEY (`id_insumo_x_itinerario_res`) REFERENCES `res_insumo_x_itinerario` (`id_insumo_x_itinerario_res`)
) ENGINE=InnoDB AUTO_INCREMENT=1665606 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_res_detalle_valor_x_insumo` AFTER UPDATE ON `res_detalle_valor_x_insumo` FOR EACH ROW BEGIN
  DECLARE valorPk VARCHAR(50);
  DECLARE usuario VARCHAR(50);
  DECLARE campos TEXT;
  DECLARE valorAnterior TEXT;
  DECLARE valorActual TEXT;
  DECLARE camposMaestro TEXT;
  DECLARE valoresMaestro TEXT;
  
  SET campos = '';
  SET valorAnterior = '';
  SET valorActual = '';
  SET camposMaestro = '';
  SET valoresMaestro = '';
  
  SET valorPk = old.id_detalle_valor_x_insumo_res;

  IF (IFNULL(new.id_impuesto, '') != IFNULL(old.id_impuesto, ''))
  THEN
    SET campos = concat(campos, 'id_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.id_impuesto, '~');
  END IF;
  IF (IFNULL(new.id_insumo_x_itinerario_res, '') != IFNULL(old.id_insumo_x_itinerario_res, ''))
  THEN
    SET campos = concat(campos, 'id_insumo_x_itinerario_res~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_insumo_x_itinerario_res, ''), '~');
    SET valorActual = concat(valorActual, new.id_insumo_x_itinerario_res, '~');
  END IF;
  IF (IFNULL(new.tipo_detalle_valor, '') != IFNULL(old.tipo_detalle_valor, ''))
  THEN
    SET campos = concat(campos, 'tipo_detalle_valor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.tipo_detalle_valor, ''), '~');
    SET valorActual = concat(valorActual, new.tipo_detalle_valor, '~');
  END IF;
  IF (IFNULL(new.suprime_impuesto, '') != IFNULL(old.suprime_impuesto, ''))
  THEN
    SET campos = concat(campos, 'suprime_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.suprime_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.suprime_impuesto, '~');
  END IF;
  IF (IFNULL(new.valor, '') != IFNULL(old.valor, ''))
  THEN
    SET campos = concat(campos, 'valor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.valor, ''), '~');
    SET valorActual = concat(valorActual, new.valor, '~');
  END IF;
  IF (IFNULL(new.porcentaje_impuesto, '') != IFNULL(old.porcentaje_impuesto, ''))
  THEN
    SET campos = concat(campos, 'porcentaje_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.porcentaje_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.porcentaje_impuesto, '~');
  END IF;
  IF (IFNULL(new.base_imponible, '') != IFNULL(old.base_imponible, ''))
  THEN
    SET campos = concat(campos, 'base_imponible~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.base_imponible, ''), '~');
    SET valorActual = concat(valorActual, new.base_imponible, '~');
  END IF;
  IF (IFNULL(new.cambio_a_mano, '') != IFNULL(old.cambio_a_mano, ''))
  THEN
    SET campos = concat(campos, 'cambio_a_mano~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.cambio_a_mano, ''), '~');
    SET valorActual = concat(valorActual, new.cambio_a_mano, '~');
  END IF;
  SET usuario = new.id_usuario_modifica;
  
  IF campos != '' THEN
    INSERT INTO gecoecua_ecuadoradventure.seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'res_detalle_valor_x_insumo',
      'UPDATE',
      camposMaestro,
      valoresMaestro,
      valorPk,
      campos,
      valorAnterior,
      valorActual,
      usuario,
      NOW()
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `res_encabezado_pie`
--

DROP TABLE IF EXISTS `res_encabezado_pie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_encabezado_pie` (
  `id_encabezado_pie_res` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_ENCABEZADO_PIE',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `encabezado_itinerario` text COMMENT 'Encabezado parametrizable por proforma que va en el reporte de itinerario',
  `pie_itinerario` text COMMENT 'Pie parametrizable por proforma que va en el reporte de itinerario',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_encabezado_pie_res`),
  KEY `fk_idioma_encabezado_pie` (`id_idioma`),
  KEY `fk_reserva_a_encabezado_pie` (`id_reserva`),
  CONSTRAINT `fk_idioma_encabezado_pie` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_reserva_a_encabezado_pie` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el encabezado y el pie del itinerario por';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_fee_comercial`
--

DROP TABLE IF EXISTS `res_fee_comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_fee_comercial` (
  `id_fee_comercial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_FEE_COMERCIAL',
  `descripcion_fee_comercial` varchar(260) DEFAULT NULL COMMENT 'Nombre del fee comercial',
  `tasa_fee_comercial` decimal(15,4) DEFAULT NULL COMMENT 'Tasa del fee comercial',
  `aplica_sobre` char(3) DEFAULT NULL,
  `tipo_valor` char(1) DEFAULT 'P' COMMENT 'Indica si el fee es un P=porcentaje o un V=valor fijo',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que realiza la última modificación en el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se realiza la última modificación en el registro',
  PRIMARY KEY (`id_fee_comercial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_fee_comercial_x_reserva`
--

DROP TABLE IF EXISTS `res_fee_comercial_x_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_fee_comercial_x_reserva` (
  `id_fee_comercial_x_reserva` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_FEE_COMERCIAL_X_RESERVA',
  `id_fee_comercial` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_FEE_COMERCIAL',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_RESERVA',
  `fecha_sugerida` date DEFAULT NULL COMMENT 'Indica la fecha sugerida de pago',
  `valor` decimal(15,6) DEFAULT NULL COMMENT 'Indica el valor que tesorería debe pagar',
  `porcentaje` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del fee comercial',
  `estado_fee_comercial` char(1) DEFAULT 'I' COMMENT 'Indica si el fee está I=Ingresado o P=pendiente de pago',
  `observacion_pago` text COMMENT 'Indica el valor que tesorería debe pagar',
  `id_usuario_paga` varchar(25) DEFAULT NULL COMMENT 'Indica el valor que tesorería debe pagar',
  `fecha_paga` datetime DEFAULT NULL COMMENT 'Indica el valor que tesorería debe pagar',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que realiza la última motificación del registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se realiza la última motificación del registro',
  PRIMARY KEY (`id_fee_comercial_x_reserva`),
  KEY `fk_fee_comercial_a_reserva` (`id_fee_comercial`),
  KEY `fk_reserva_a_fee_comercial` (`id_reserva`),
  CONSTRAINT `fk_fee_comercial_a_reserva` FOREIGN KEY (`id_fee_comercial`) REFERENCES `res_fee_comercial` (`id_fee_comercial`),
  CONSTRAINT `fk_reserva_a_fee_comercial` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_forma_pedido`
--

DROP TABLE IF EXISTS `res_forma_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_forma_pedido` (
  `id_forma_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_FORMA_PEDIDO',
  `descripcion_forma_pedido` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_forma_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las formas de pedido de la orden';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_guia`
--

DROP TABLE IF EXISTS `res_guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_guia` (
  `id_guia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_GUIA',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_guia`),
  KEY `fk_proveedor_a_guia` (`id_proveedor`),
  KEY `fk_reserva_a_guia` (`id_reserva`),
  CONSTRAINT `fk_proveedor_a_guia` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_reserva_a_guia` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=1984 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los proveedores guias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_idioma_x_itinerario`
--

DROP TABLE IF EXISTS `res_idioma_x_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_idioma_x_itinerario` (
  `id_idioma_x_itinerario_res` int(11) NOT NULL AUTO_INCREMENT,
  `id_idioma` varchar(4) DEFAULT NULL COMMENT 'Código del idioma',
  `id_tipo_inclusion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_TIPO_INCLUSION',
  `id_itinerario_res` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `descripcion_itinerario` text COMMENT 'Descripción del itinerario',
  `origen` varchar(100) DEFAULT NULL COMMENT 'Punto de salida',
  `destino` varchar(100) DEFAULT NULL COMMENT 'Punto de llegada',
  `actividad` text COMMENT 'Actividad que se va a realizar durante el viaje o en el destino',
  `duracion_itinerario` varchar(100) DEFAULT NULL COMMENT 'Duración del itinerario actual',
  `observaciones` text COMMENT 'Observación sobre el viaje',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_idioma_x_itinerario_res`),
  KEY `fk_idioma_a_itinerario_res` (`id_idioma`),
  KEY `fk_itinerario_a_idioma_res` (`id_itinerario_res`),
  CONSTRAINT `fk_idioma_a_itinerario_res` FOREIGN KEY (`id_idioma`) REFERENCES `prm_idioma` (`id_idioma`),
  CONSTRAINT `fk_itinerario_a_idioma_res` FOREIGN KEY (`id_itinerario_res`) REFERENCES `res_itinerario` (`id_itinerario_res`)
) ENGINE=InnoDB AUTO_INCREMENT=61330 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los itinerarios en los diferentes idiomas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_insumo_x_itinerario`
--

DROP TABLE IF EXISTS `res_insumo_x_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_insumo_x_itinerario` (
  `id_insumo_x_itinerario_res` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo` int(11) DEFAULT NULL COMMENT 'Código del insumo',
  `id_precio_insumo` int(11) DEFAULT NULL,
  `id_precio_x_temporada` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `id_compra` int(11) DEFAULT NULL COMMENT 'Código de la tabla de compras',
  `id_producto_x_precio_producto` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_itinerario_res` int(11) DEFAULT NULL COMMENT 'Código del itinerario',
  `id_insumo_x_itinerario_res2` int(11) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL COMMENT 'Código del motivo de descuento',
  `tipo_insumo_x_itinerario` char(1) DEFAULT 'I' COMMENT 'Tipo de insumo, sea I=Insumo o P=Producto',
  `cantidad_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Es la cantidad que se va a usar o se uso en la reserva',
  `nro_pax_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Número de paxs que ocuparán el insumo',
  `tipo_precio` char(1) DEFAULT NULL,
  `precio_fijo` decimal(15,4) DEFAULT NULL,
  `factor_precio` decimal(15,4) DEFAULT NULL,
  `costo_presupuestado` decimal(15,4) DEFAULT NULL COMMENT 'Costo presupuestado del insumo',
  `total_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Total impuesto del insumo',
  `costo_real` decimal(15,4) DEFAULT NULL COMMENT 'Costo real del insumo',
  `descuento_insumo` decimal(15,4) DEFAULT NULL COMMENT 'Descuento del insumo',
  `nro_comprobante_insumo` varchar(100) DEFAULT NULL COMMENT 'Número de comprobante de la compra del insumo',
  `fecha_inicio_insumo` datetime DEFAULT NULL COMMENT 'Hora y fecha para saber en qué momento empieza a ser utilizado el insumo',
  `fecha_fin_insumo` datetime DEFAULT NULL COMMENT 'Hora y fecha para saber en qué momento termina de ser utilizado el insumo',
  `fecha_max_pago` date DEFAULT NULL COMMENT 'Campo que almacena la fecha máxima de pago del insumo usado',
  `fecha_pago_insumo` date DEFAULT NULL,
  `codigo_confirma_proveedor` text COMMENT 'Código de confirmación que da el proveedor',
  `observacion_insumo` text COMMENT 'Observación del insumo',
  `insumo_pagado` char(1) DEFAULT 'N',
  `insumo_facturado` char(1) DEFAULT 'N',
  `utilidad_x_insumo` decimal(15,4) DEFAULT NULL,
  `aprueba_pago` char(1) DEFAULT 'N' COMMENT 'Indica si el pago está aprobado S o no N',
  `id_usuario_responsable` varchar(25) DEFAULT NULL COMMENT 'Código del usuario que colocará los costos reales en el sistema',
  `hora_ejecucion` time DEFAULT NULL COMMENT 'Permite almacenar la hora de ejecución de un servicio',
  `fecha_confirmacion` date DEFAULT NULL COMMENT 'Indispensable para controlar cuándo se confirmó una reserva de servicios',
  `time_limit` date DEFAULT NULL,
  `dar_anticipo` char(1) DEFAULT 'N' COMMENT 'Indica si se debe S dar o no N un anticipo antes de operar la reserva',
  `centro_costos` varchar(100) DEFAULT NULL COMMENT 'Centro de costos',
  `costo_real_sin_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Costo real más impuestos',
  `inventario_descargado` char(1) DEFAULT 'N' COMMENT 'Indica si este insumo ya se ha descargado o no del inventario',
  `lugar` varchar(128) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_insumo_x_itinerario_res`),
  KEY `fk_insumoiti_a_insumoiti_res` (`id_insumo_x_itinerario_res2`),
  KEY `fk_compra_a_insxiti_res` (`id_compra`),
  KEY `fk_insumo_a_insumo_x_iti` (`id_insumo`),
  KEY `fk_itinerario_a_ins_x_iti` (`id_itinerario_res`),
  KEY `fk_prc_x_tmp_a_insumo_x_itinerario` (`id_precio_x_temporada`),
  KEY `fk_prd_x_precio_a_ins_x_iti` (`id_producto_x_precio_producto`),
  KEY `fk_precio_insumo_a_insxiti_res` (`id_precio_insumo`),
  KEY `fk_producto_a_resinsxiti` (`id_producto`),
  KEY `fk_proveedor_a_insxitin_res` (`id_proveedor`),
  CONSTRAINT `fk_compra_a_insxiti_res` FOREIGN KEY (`id_compra`) REFERENCES `prv_compra` (`id_compra`),
  CONSTRAINT `fk_insumo_a_insumo_x_iti` FOREIGN KEY (`id_insumo`) REFERENCES `prd_insumo` (`id_insumo`),
  CONSTRAINT `fk_itinerario_a_ins_x_iti` FOREIGN KEY (`id_itinerario_res`) REFERENCES `res_itinerario` (`id_itinerario_res`),
  CONSTRAINT `fk_prc_x_tmp_a_insumo_x_itinerario` FOREIGN KEY (`id_precio_x_temporada`) REFERENCES `prd_precio_x_temporada` (`id_precio_x_temporada`),
  CONSTRAINT `fk_prd_x_precio_a_ins_x_iti` FOREIGN KEY (`id_producto_x_precio_producto`) REFERENCES `prd_producto_x_precio_producto` (`id_producto_x_precio_producto`),
  CONSTRAINT `fk_precio_insumo_a_insxiti_res` FOREIGN KEY (`id_precio_insumo`) REFERENCES `prd_precio_insumo` (`id_precio_insumo`),
  CONSTRAINT `fk_producto_a_resinsxiti` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`),
  CONSTRAINT `fk_proveedor_a_insxitin_res` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=624104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_res_insumo_x_itinerario` AFTER UPDATE ON `res_insumo_x_itinerario` FOR EACH ROW BEGIN
  DECLARE valorPk VARCHAR(50);
  DECLARE usuario VARCHAR(50);
  DECLARE campos TEXT;
  DECLARE valorAnterior TEXT;
  DECLARE valorActual TEXT;
  DECLARE camposMaestro TEXT;
  DECLARE valoresMaestro TEXT;
  
  SET campos = '';
  SET valorAnterior = '';
  SET valorActual = '';
  SET camposMaestro = '';
  SET valoresMaestro = '';
  
  SET valorPk = old.id_insumo_x_itinerario_res;

  IF (IFNULL(new.id_insumo, '') != IFNULL(old.id_insumo, ''))
  THEN
    SET campos = concat(campos, 'id_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.id_insumo, '~');
  END IF;
  IF (IFNULL(new.id_precio_insumo, '') != IFNULL(old.id_precio_insumo, ''))
  THEN
    SET campos = concat(campos, 'id_precio_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_precio_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.id_precio_insumo, '~');
  END IF;
  IF (IFNULL(new.id_precio_x_temporada, '') != IFNULL(old.id_precio_x_temporada, ''))
  THEN
    SET campos = concat(campos, 'id_precio_x_temporada~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_precio_x_temporada, ''), '~');
    SET valorActual = concat(valorActual, new.id_precio_x_temporada, '~');
  END IF;
  IF (IFNULL(new.id_producto, '') != IFNULL(old.id_producto, ''))
  THEN
    SET campos = concat(campos, 'id_producto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_producto, ''), '~');
    SET valorActual = concat(valorActual, new.id_producto, '~');
  END IF;
  IF (IFNULL(new.id_compra, '') != IFNULL(old.id_compra, ''))
  THEN
    SET campos = concat(campos, 'id_compra~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_compra, ''), '~');
    SET valorActual = concat(valorActual, new.id_compra, '~');
  END IF;
  IF (IFNULL(new.id_producto_x_precio_producto, '') != IFNULL(old.id_producto_x_precio_producto, ''))
  THEN
    SET campos = concat(campos, 'id_producto_x_precio_producto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_producto_x_precio_producto, ''), '~');
    SET valorActual = concat(valorActual, new.id_producto_x_precio_producto, '~');
  END IF;
  IF (IFNULL(new.id_proveedor, '') != IFNULL(old.id_proveedor, ''))
  THEN
    SET campos = concat(campos, 'id_proveedor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_proveedor, ''), '~');
    SET valorActual = concat(valorActual, new.id_proveedor, '~');
  END IF;
  IF (IFNULL(new.id_itinerario_res, '') != IFNULL(old.id_itinerario_res, ''))
  THEN
    SET campos = concat(campos, 'id_itinerario_res~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_itinerario_res, ''), '~');
    SET valorActual = concat(valorActual, new.id_itinerario_res, '~');
  END IF;
  IF (IFNULL(new.id_insumo_x_itinerario_res2, '') != IFNULL(old.id_insumo_x_itinerario_res2, ''))
  THEN
    SET campos = concat(campos, 'id_insumo_x_itinerario_res2~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_insumo_x_itinerario_res2, ''), '~');
    SET valorActual = concat(valorActual, new.id_insumo_x_itinerario_res2, '~');
  END IF;
  IF (IFNULL(new.id_motivo_descuento, '') != IFNULL(old.id_motivo_descuento, ''))
  THEN
    SET campos = concat(campos, 'id_motivo_descuento~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_motivo_descuento, ''), '~');
    SET valorActual = concat(valorActual, new.id_motivo_descuento, '~');
  END IF;
  IF (IFNULL(new.tipo_insumo_x_itinerario, '') != IFNULL(old.tipo_insumo_x_itinerario, ''))
  THEN
    SET campos = concat(campos, 'tipo_insumo_x_itinerario~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.tipo_insumo_x_itinerario, ''), '~');
    SET valorActual = concat(valorActual, new.tipo_insumo_x_itinerario, '~');
  END IF;
  IF (IFNULL(new.cantidad_insumo, '') != IFNULL(old.cantidad_insumo, ''))
  THEN
    SET campos = concat(campos, 'cantidad_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.cantidad_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.cantidad_insumo, '~');
  END IF;
  IF (IFNULL(new.nro_pax_insumo, '') != IFNULL(old.nro_pax_insumo, ''))
  THEN
    SET campos = concat(campos, 'nro_pax_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_pax_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.nro_pax_insumo, '~');
  END IF;
  IF (IFNULL(new.tipo_precio, '') != IFNULL(old.tipo_precio, ''))
  THEN
    SET campos = concat(campos, 'tipo_precio~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.tipo_precio, ''), '~');
    SET valorActual = concat(valorActual, new.tipo_precio, '~');
  END IF;
  IF (IFNULL(new.precio_fijo, '') != IFNULL(old.precio_fijo, ''))
  THEN
    SET campos = concat(campos, 'precio_fijo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.precio_fijo, ''), '~');
    SET valorActual = concat(valorActual, new.precio_fijo, '~');
  END IF;
  IF (IFNULL(new.factor_precio, '') != IFNULL(old.factor_precio, ''))
  THEN
    SET campos = concat(campos, 'factor_precio~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.factor_precio, ''), '~');
    SET valorActual = concat(valorActual, new.factor_precio, '~');
  END IF;
  IF (IFNULL(new.costo_presupuestado, '') != IFNULL(old.costo_presupuestado, ''))
  THEN
    SET campos = concat(campos, 'costo_presupuestado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.costo_presupuestado, ''), '~');
    SET valorActual = concat(valorActual, new.costo_presupuestado, '~');
  END IF;
  IF (IFNULL(new.total_impuesto, '') != IFNULL(old.total_impuesto, ''))
  THEN
    SET campos = concat(campos, 'total_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.total_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.total_impuesto, '~');
  END IF;
  IF (IFNULL(new.costo_real, '') != IFNULL(old.costo_real, ''))
  THEN
    SET campos = concat(campos, 'costo_real~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.costo_real, ''), '~');
    SET valorActual = concat(valorActual, new.costo_real, '~');
  END IF;
  IF (IFNULL(new.descuento_insumo, '') != IFNULL(old.descuento_insumo, ''))
  THEN
    SET campos = concat(campos, 'descuento_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.descuento_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.descuento_insumo, '~');
  END IF;
  IF (IFNULL(new.nro_comprobante_insumo, '') != IFNULL(old.nro_comprobante_insumo, ''))
  THEN
    SET campos = concat(campos, 'nro_comprobante_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_comprobante_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.nro_comprobante_insumo, '~');
  END IF;
  IF (IFNULL(new.fecha_inicio_insumo, '') != IFNULL(old.fecha_inicio_insumo, ''))
  THEN
    SET campos = concat(campos, 'fecha_inicio_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_inicio_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_inicio_insumo, '~');
  END IF;
  IF (IFNULL(new.fecha_fin_insumo, '') != IFNULL(old.fecha_fin_insumo, ''))
  THEN
    SET campos = concat(campos, 'fecha_fin_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_fin_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_fin_insumo, '~');
  END IF;
  IF (IFNULL(new.fecha_max_pago, '') != IFNULL(old.fecha_max_pago, ''))
  THEN
    SET campos = concat(campos, 'fecha_max_pago~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_max_pago, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_max_pago, '~');
  END IF;
  IF (IFNULL(new.fecha_pago_insumo, '') != IFNULL(old.fecha_pago_insumo, ''))
  THEN
    SET campos = concat(campos, 'fecha_pago_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_pago_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_pago_insumo, '~');
  END IF;
  IF (IFNULL(new.codigo_confirma_proveedor, '') != IFNULL(old.codigo_confirma_proveedor, ''))
  THEN
    SET campos = concat(campos, 'codigo_confirma_proveedor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.codigo_confirma_proveedor, ''), '~');
    SET valorActual = concat(valorActual, new.codigo_confirma_proveedor, '~');
  END IF;
  IF (IFNULL(new.observacion_insumo, '') != IFNULL(old.observacion_insumo, ''))
  THEN
    SET campos = concat(campos, 'observacion_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_insumo, '~');
  END IF;
  IF (IFNULL(new.insumo_pagado, '') != IFNULL(old.insumo_pagado, ''))
  THEN
    SET campos = concat(campos, 'insumo_pagado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.insumo_pagado, ''), '~');
    SET valorActual = concat(valorActual, new.insumo_pagado, '~');
  END IF;
  IF (IFNULL(new.insumo_facturado, '') != IFNULL(old.insumo_facturado, ''))
  THEN
    SET campos = concat(campos, 'insumo_facturado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.insumo_facturado, ''), '~');
    SET valorActual = concat(valorActual, new.insumo_facturado, '~');
  END IF;
  IF (IFNULL(new.utilidad_x_insumo, '') != IFNULL(old.utilidad_x_insumo, ''))
  THEN
    SET campos = concat(campos, 'utilidad_x_insumo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.utilidad_x_insumo, ''), '~');
    SET valorActual = concat(valorActual, new.utilidad_x_insumo, '~');
  END IF;
  IF (IFNULL(new.aprueba_pago, '') != IFNULL(old.aprueba_pago, ''))
  THEN
    SET campos = concat(campos, 'aprueba_pago~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.aprueba_pago, ''), '~');
    SET valorActual = concat(valorActual, new.aprueba_pago, '~');
  END IF;
  IF (IFNULL(new.id_usuario_responsable, '') != IFNULL(old.id_usuario_responsable, ''))
  THEN
    SET campos = concat(campos, 'id_usuario_responsable~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_usuario_responsable, ''), '~');
    SET valorActual = concat(valorActual, new.id_usuario_responsable, '~');
  END IF;
  IF (IFNULL(new.hora_ejecucion, '') != IFNULL(old.hora_ejecucion, ''))
  THEN
    SET campos = concat(campos, 'hora_ejecucion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.hora_ejecucion, ''), '~');
    SET valorActual = concat(valorActual, new.hora_ejecucion, '~');
  END IF;
  IF (IFNULL(new.fecha_confirmacion, '') != IFNULL(old.fecha_confirmacion, ''))
  THEN
    SET campos = concat(campos, 'fecha_confirmacion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_confirmacion, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_confirmacion, '~');
  END IF;
  IF (IFNULL(new.time_limit, '') != IFNULL(old.time_limit, ''))
  THEN
    SET campos = concat(campos, 'time_limit~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.time_limit, ''), '~');
    SET valorActual = concat(valorActual, new.time_limit, '~');
  END IF;
  IF (IFNULL(new.dar_anticipo, '') != IFNULL(old.dar_anticipo, ''))
  THEN
    SET campos = concat(campos, 'dar_anticipo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.dar_anticipo, ''), '~');
    SET valorActual = concat(valorActual, new.dar_anticipo, '~');
  END IF;
  IF (IFNULL(new.centro_costos, '') != IFNULL(old.centro_costos, ''))
  THEN
    SET campos = concat(campos, 'centro_costos~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.centro_costos, ''), '~');
    SET valorActual = concat(valorActual, new.centro_costos, '~');
  END IF;
  IF (IFNULL(new.costo_real_sin_impuesto, '') != IFNULL(old.costo_real_sin_impuesto, ''))
  THEN
    SET campos = concat(campos, 'costo_real_sin_impuesto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.costo_real_sin_impuesto, ''), '~');
    SET valorActual = concat(valorActual, new.costo_real_sin_impuesto, '~');
  END IF;
  IF (IFNULL(new.inventario_descargado, '') != IFNULL(old.inventario_descargado, ''))
  THEN
    SET campos = concat(campos, 'inventario_descargado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.inventario_descargado, ''), '~');
    SET valorActual = concat(valorActual, new.inventario_descargado, '~');
  END IF;
  IF (IFNULL(new.lugar, '') != IFNULL(old.lugar, ''))
  THEN
    SET campos = concat(campos, 'lugar~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.lugar, ''), '~');
    SET valorActual = concat(valorActual, new.lugar, '~');
  END IF;
  SET usuario = new.id_usuario_modifica;
  SELECT concat('id_reserva~id_detalle_reserva~id_itinerario_res'), concat(dr.id_reserva,'~',dr.id_detalle_reserva,'~',i.id_itinerario_res)
                          INTO camposMaestro, valoresMaestro
                          FROM gecoecua_ecuadoradventure.res_itinerario i INNER JOIN gecoecua_ecuadoradventure.res_detalle_reserva dr ON i.id_detalle_reserva = dr.id_detalle_reserva
                          WHERE i.id_itinerario_res = old.id_itinerario_res; 
  
  IF campos != '' THEN
    INSERT INTO gecoecua_ecuadoradventure.seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'res_insumo_x_itinerario',
      'UPDATE',
      camposMaestro,
      valoresMaestro,
      valorPk,
      campos,
      valorAnterior,
      valorActual,
      usuario,
      NOW()
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `res_itinerario`
--

DROP TABLE IF EXISTS `res_itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_itinerario` (
  `id_itinerario_res` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del itinerario',
  `id_detalle_reserva` int(11) DEFAULT NULL,
  `id_orden_trabajo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_ORDEN_TRABAJO',
  `dia_itinerario` int(11) DEFAULT NULL COMMENT 'Día del itinerario',
  `imagen_itinerario` varchar(100) DEFAULT NULL COMMENT 'almacena el nombre de la imagen del itinerario',
  `fecha_cumple_itinerario` date DEFAULT NULL,
  `importado` char(1) DEFAULT NULL COMMENT 'Se coloca S=Si cuando fue importado de otro producto ajeno al que pertenece y N=No si no lo fue',
  `id_producto_importacion` varchar(15) DEFAULT NULL COMMENT 'Código del producto desde el que se extrajeron los días del itinerario',
  `dia_importacion` int(11) DEFAULT NULL COMMENT 'Día del itinerario importado',
  `hora_inicio` time DEFAULT NULL COMMENT 'Hora inicio para la orden de trabajo',
  `hora_fin` time DEFAULT NULL COMMENT 'Hora fin para la orden de trabajo',
  `we_id_itinerary` varchar(50) DEFAULT NULL COMMENT 'Código del itinerario en WeTravel',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_itinerario_res`),
  KEY `fk_det_reserva_a_itinerario` (`id_detalle_reserva`),
  KEY `fk_orden_trabajo_a_itinerario` (`id_orden_trabajo`),
  CONSTRAINT `fk_det_reserva_a_itinerario` FOREIGN KEY (`id_detalle_reserva`) REFERENCES `res_detalle_reserva` (`id_detalle_reserva`),
  CONSTRAINT `fk_orden_trabajo_a_itinerario` FOREIGN KEY (`id_orden_trabajo`) REFERENCES `res_orden_trabajo` (`id_orden_trabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=85361 DEFAULT CHARSET=latin1 COMMENT='Almacena el itinerario en la reserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_lugar`
--

DROP TABLE IF EXISTS `res_lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_lugar` (
  `id_lugar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_LUGAR',
  `descripcion_lugar` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_lugar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_meta_semanal`
--

DROP TABLE IF EXISTS `res_meta_semanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_meta_semanal` (
  `id_meta_semanal` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) DEFAULT NULL,
  `fecha_inicio_semana` date DEFAULT NULL,
  `fecha_fin_semana` date DEFAULT NULL,
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_meta_semanal`),
  KEY `fk_operacion_a_meta_semanal` (`id_operacion`),
  CONSTRAINT `fk_operacion_a_meta_semanal` FOREIGN KEY (`id_operacion`) REFERENCES `prd_operacion` (`id_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Ingreso del valor de la meta semanal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_nota_credito`
--

DROP TABLE IF EXISTS `res_nota_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_nota_credito` (
  `id_nota_credito` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) DEFAULT NULL,
  `id_nota_credito_origen` int(11) DEFAULT NULL COMMENT 'Indica el código de la nota de crédito origen',
  `id_persona` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `tipo_nota_credito` char(3) DEFAULT NULL,
  `fecha_generacion` date DEFAULT NULL,
  `valor_nota_credito` decimal(15,4) DEFAULT NULL,
  `estado_nota_credito` char(3) DEFAULT 'PEN' COMMENT 'Estado que indica si la nota de crédito ha sido USA=usada o está PEN=pendiente de usar una reserva',
  `observacion` varchar(564) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_nota_credito`),
  KEY `fk_reserva_a_res_nota_credito` (`id_reserva`),
  KEY `fk_persona_a_res_nota_credito` (`id_persona`),
  KEY `fk_proveedor_a_res_nota_credito` (`id_proveedor`),
  KEY `fk_nota_cred_a_nota_cred_res` (`id_nota_credito_origen`),
  CONSTRAINT `fk_nota_cred_a_nota_cred_res` FOREIGN KEY (`id_nota_credito_origen`) REFERENCES `res_nota_credito` (`id_nota_credito`),
  CONSTRAINT `fk_persona_a_res_nota_credito` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_proveedor_a_res_nota_credito` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_reserva_a_res_nota_credito` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_observacion_general`
--

DROP TABLE IF EXISTS `res_observacion_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_observacion_general` (
  `id_observacion_general` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `descripcion_observacion_general` text,
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_observacion_general`),
  KEY `fk_reserva_a_observacion` (`id_reserva`),
  CONSTRAINT `fk_reserva_a_observacion` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 COMMENT='Almacena las observaciones generales de reserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_observacion_proveedor`
--

DROP TABLE IF EXISTS `res_observacion_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_observacion_proveedor` (
  `id_observacion_proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_OBSERVACION_PROVEEDOR',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Código secuencial de la tabla',
  `descripcion_observacion_proveedor` text COMMENT 'Texto de la observación',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_observacion_proveedor`),
  KEY `fk_proveedor_a_observacion` (`id_proveedor`),
  KEY `fk_reserva_a_observacion_proveedor` (`id_reserva`),
  CONSTRAINT `fk_proveedor_a_observacion` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_reserva_a_observacion_proveedor` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las observaciones de los proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_orden_trabajo`
--

DROP TABLE IF EXISTS `res_orden_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_orden_trabajo` (
  `id_orden_trabajo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_ORDEN_TRABAJO',
  `id_forma_pedido` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_FORMA_PEDIDO',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PER_PERSONA',
  `id_origen_reserva` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_ORIGEN_RESERVA',
  `id_caso` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla CRM_CASO',
  `id_persona_contacto` int(11) DEFAULT NULL,
  `descripcion_orden_trabajo` varchar(256) DEFAULT NULL,
  `estado_orden_trabajo` char(3) DEFAULT 'ING' COMMENT 'Indica el estado actual de la orden de trabajo',
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `valor_presupuestado` decimal(15,4) DEFAULT NULL,
  `valor_liquidado` decimal(15,4) DEFAULT NULL,
  `observacion_orden_trabajo` varchar(256) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_orden_trabajo`),
  KEY `fk_caso_a_orden_trabajo` (`id_caso`),
  KEY `fk_forma_pedido_a_orden_trabajo` (`id_forma_pedido`),
  KEY `fk_origen_reserva_a_orden_trabajo` (`id_origen_reserva`),
  KEY `fk_persona_a_orden_trabajo` (`id_persona`),
  CONSTRAINT `fk_caso_a_orden_trabajo` FOREIGN KEY (`id_caso`) REFERENCES `crm_caso` (`id_caso`),
  CONSTRAINT `fk_forma_pedido_a_orden_trabajo` FOREIGN KEY (`id_forma_pedido`) REFERENCES `res_forma_pedido` (`id_forma_pedido`),
  CONSTRAINT `fk_origen_reserva_a_orden_trabajo` FOREIGN KEY (`id_origen_reserva`) REFERENCES `res_origen_reserva` (`id_origen_reserva`),
  CONSTRAINT `fk_persona_a_orden_trabajo` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las órdenes de trabajo y genera el código con el que se trabajará';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_origen_reserva`
--

DROP TABLE IF EXISTS `res_origen_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_origen_reserva` (
  `id_origen_reserva` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `descripcion_origen_reserva` varchar(256) DEFAULT NULL COMMENT 'Descripción del origen de la reserva',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_origen_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el origen de la reserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_persona_x_reserva`
--

DROP TABLE IF EXISTS `res_persona_x_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_persona_x_reserva` (
  `id_persona_x_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de reserva',
  `id_tipo_habitacion` int(11) DEFAULT NULL COMMENT 'Codigo del tipo de habitacion',
  `id_afinidad` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla RES_AFINIDAD',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `procedencia_persona` varchar(100) DEFAULT NULL COMMENT 'Para colocar procedencia para informar al ente regulador',
  `destino_persona` varchar(100) DEFAULT NULL COMMENT 'Para colocar destino para informar al ente regulador',
  `pick_up_time` datetime DEFAULT NULL COMMENT 'Fecha y hora en la que se debe recoger al pax',
  `check_out_time` datetime DEFAULT NULL COMMENT 'Fecha y hora en la que el pax deja el tour',
  `transporte_arribo` varchar(256) DEFAULT NULL COMMENT 'Nombre del transporte de llegada',
  `transporte_salida` varchar(256) DEFAULT NULL COMMENT 'Nombre del transporte de salida',
  `vuelo_in` varchar(100) DEFAULT NULL COMMENT 'Sirve para presentar la información de vuelos relacionados a los pax para el Parque Nacional Galápagos.',
  `id_tipo_habitacion2` varchar(100) DEFAULT NULL COMMENT 'Tipo de habitación TH2',
  `id_tipo_habitacion3` varchar(100) DEFAULT NULL COMMENT 'Tipo de habitación TH2',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_persona_x_reserva`),
  KEY `fk_afinidad_a_persona_x_reserva` (`id_afinidad`),
  KEY `fk_persona_a_persona_x_res` (`id_persona`),
  KEY `fk_reserva_a_persona_x_res` (`id_reserva`),
  KEY `fk_tipo_habitacion_a_pers_x_res` (`id_tipo_habitacion`),
  CONSTRAINT `fk_afinidad_a_persona_x_reserva` FOREIGN KEY (`id_afinidad`) REFERENCES `res_afinidad` (`id_afinidad`),
  CONSTRAINT `fk_persona_a_persona_x_res` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_reserva_a_persona_x_res` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`),
  CONSTRAINT `fk_tipo_habitacion_a_pers_x_res` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `res_tipo_habitacion` (`id_tipo_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=12417 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena las personas que van a intervenir en una ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_persona_x_reserva_x_producto`
--

DROP TABLE IF EXISTS `res_persona_x_reserva_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_persona_x_reserva_x_producto` (
  `id_persona_x_reserva_x_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de persona por reserva y por producto',
  `id_insumo_x_itinerario_res` int(11) DEFAULT NULL,
  `id_detalle_reserva` int(11) DEFAULT NULL,
  `id_persona_x_reserva` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_persona_x_reserva_x_producto`),
  KEY `fk_ins_x_iti_a_per_x_res_x_prd` (`id_insumo_x_itinerario_res`),
  KEY `fk_persona_x_res_a_pers_x_res_x_prd` (`id_persona_x_reserva`),
  KEY `fk_det_reserva_a_per_x_rsr_x_prd` (`id_detalle_reserva`),
  CONSTRAINT `fk_det_reserva_a_per_x_rsr_x_prd` FOREIGN KEY (`id_detalle_reserva`) REFERENCES `res_detalle_reserva` (`id_detalle_reserva`),
  CONSTRAINT `fk_ins_x_iti_a_per_x_res_x_prd` FOREIGN KEY (`id_insumo_x_itinerario_res`) REFERENCES `res_insumo_x_itinerario` (`id_insumo_x_itinerario_res`),
  CONSTRAINT `fk_persona_x_res_a_pers_x_res_x_prd` FOREIGN KEY (`id_persona_x_reserva`) REFERENCES `res_persona_x_reserva` (`id_persona_x_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=1981603 DEFAULT CHARSET=latin1 COMMENT='Persona por reserva y por producto (TABLA DE CRUCE)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_personal_orden_trabajo`
--

DROP TABLE IF EXISTS `res_personal_orden_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_personal_orden_trabajo` (
  `id_personal_orden_trabajo` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) DEFAULT NULL,
  `tipo_personal_orden_trabajo` char(3) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_personal_orden_trabajo`),
  UNIQUE KEY `idx_unico_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_proveedor_a_personal_orden_trabajo` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todo el personal para escoger en la orden de trabajo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_proveedor_cuadro_venta`
--

DROP TABLE IF EXISTS `res_proveedor_cuadro_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_proveedor_cuadro_venta` (
  `id_proveedor_cuadro_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` datetime DEFAULT NULL,
  `fecha_modifica` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor_cuadro_venta`),
  UNIQUE KEY `idx_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_proveedor_a_prv_cuadro_vta` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_registro_estado`
--

DROP TABLE IF EXISTS `res_registro_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_registro_estado` (
  `id_registro_estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código secuencia del registro del estado',
  `id_motivo` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRM_MOTIVO',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'Código secuencial de reserva',
  `estado_anterior` varchar(4) DEFAULT NULL COMMENT 'Estado en el que se encontraba la reserva antes de tomar el estado que se está registrando',
  `estado_actual` varchar(4) DEFAULT NULL COMMENT 'Estado que se registra',
  `devuelve_anticipo` char(1) DEFAULT NULL COMMENT 'Cuando es una cancelación indica si devuelve o no el anticipo',
  `porcentaje_devolucion_anticipo` decimal(15,4) DEFAULT NULL COMMENT 'Si se devuelve el anticipo aquí se ingresa el porcentaje que se devuelve',
  `nro_pax_arrivo` int(15) DEFAULT NULL,
  `observacion_registro_estado` text COMMENT 'Observación extra del registro del anticipo',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_registro_estado`),
  KEY `fk_motivo_a_registro_estado` (`id_motivo`),
  KEY `fk_reserva_a_registro_estado` (`id_reserva`),
  CONSTRAINT `fk_motivo_a_registro_estado` FOREIGN KEY (`id_motivo`) REFERENCES `prm_motivo` (`id_motivo`),
  CONSTRAINT `fk_reserva_a_registro_estado` FOREIGN KEY (`id_reserva`) REFERENCES `res_reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=4462 DEFAULT CHARSET=latin1 COMMENT='Tabla que permite ingresar el registro completo cuando se re';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_reserva`
--

DROP TABLE IF EXISTS `res_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código secuencial de reserva',
  `id_tipo_reserva` int(11) DEFAULT NULL,
  `id_tipo_experiencia` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_clasificacion` int(11) DEFAULT NULL,
  `id_clasificador_mercado` int(11) DEFAULT NULL COMMENT 'Clave primaria tabla RES_CLASIFICADOR_MERCADO',
  `id_proveedor` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRV_PROVEEDOR',
  `id_origen_reserva` int(11) DEFAULT NULL,
  `estado_reserva` varchar(4) NOT NULL DEFAULT 'ING' COMMENT 'Estado actual en el que se encuentra la reserva BLQ-Bloqueada RSV-Reservada CNF-Confirmada XXX-Cancelada OKN-Semicompleta OKY-Completa',
  `codigo_agencia` varchar(100) DEFAULT NULL COMMENT 'Código de la agencia que realiza la reserva',
  `observacion_reserva` text COMMENT 'Observación de la reserva, pública visualizan todos',
  `observacion_privada` text COMMENT 'Observación que puede visualizar solo el guía',
  `observacion_reporte` text,
  `observacion_reporte2` text COMMENT 'Observación ingresada desde el reporte mensual',
  `observacion_reporte3` text COMMENT 'Observación del reporte de cierre de file',
  `observacion_facturacion` text COMMENT 'Campo para colocar observaciones acerca de la facturacion',
  `ruta_archivo_referencia` varchar(256) DEFAULT NULL,
  `fecha_generacion` date DEFAULT NULL COMMENT 'Fecha de generación de la reserva',
  `fecha_pago` datetime DEFAULT NULL COMMENT 'Fecha de pago de la reserva',
  `nro_pax` int(11) DEFAULT NULL,
  `id_persona_contacto` int(11) DEFAULT NULL COMMENT 'Código de la persona de contacto',
  `importado_de` varchar(4) DEFAULT NULL COMMENT 'Indica si fue importado de PROF=Proforma,RESR=Reserva,FACT=Otra factura',
  `id_importado_de` int(11) DEFAULT NULL COMMENT 'Indica el código del importe',
  `fecha_pago_proximo` date DEFAULT NULL COMMENT 'Fecha que indica el proximo pago de la reserva',
  `fecha_pago_final` date DEFAULT NULL COMMENT 'Fecha que indica el pago final de la reserva',
  `time_limit` datetime DEFAULT NULL,
  `id_usuario_responsable` varchar(25) DEFAULT NULL,
  `porcentaje_dscto_adicional` decimal(15,6) DEFAULT NULL,
  `id_motivo_descuento` int(11) DEFAULT NULL COMMENT 'Código del motivo de descuento',
  `descuento_en_valor` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje de descuento representado en valor',
  `prioridad_descuento` varchar(3) DEFAULT NULL COMMENT 'Indica sobre que cantidad se prioriza el descuento, la otra cambia',
  `valor_pago_proximo` decimal(15,2) DEFAULT NULL COMMENT 'Valor que se pagará en la fecha pago próximo',
  `valor_pago_final` decimal(15,2) DEFAULT NULL COMMENT 'Valor que se pagará en la fecha pago final',
  `nro_encuesta_presentada` int(11) DEFAULT NULL COMMENT 'Número de encuestas presentadas',
  `nro_encuesta_faltante` int(11) DEFAULT NULL COMMENT 'Número de encuestas faltantes',
  `porcentaje_satisfaccion` decimal(15,4) DEFAULT NULL,
  `tipo_generacion` char(1) DEFAULT 'N' COMMENT 'Indica con que tipo de generación se creó la factura N=Normal P=Pre-Factura Automática',
  `id_usuario_rp` varchar(25) DEFAULT NULL COMMENT 'Usuario realizado por',
  `itinerario_enviado` char(1) DEFAULT 'N' COMMENT 'Indica si el itinerario ha sido enviado',
  `nro_factura_local` varchar(100) DEFAULT NULL COMMENT 'Número factura local',
  `facturada` char(1) DEFAULT 'N' COMMENT 'Indica si la reserva está facturada o no',
  `fecha_facturacion` date DEFAULT NULL COMMENT 'Fecha de facturación en caso de cambio',
  `we_id_trip` varchar(50) DEFAULT NULL COMMENT 'Código del viaje en WeTravel',
  `we_url` varchar(200) DEFAULT NULL,
  `we_published` char(1) DEFAULT 'N',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_origen_a_reserva` (`id_origen_reserva`),
  KEY `fk_persona_a_reserva` (`id_persona`),
  KEY `fk_tipo_experiencia_a_reserva` (`id_tipo_experiencia`),
  KEY `fk_tipo_res_a_reserva` (`id_tipo_reserva`),
  KEY `fk_clasificador_mercado_a_reserva` (`id_clasificador_mercado`),
  KEY `fk_proveedor_a_reserva` (`id_proveedor`),
  KEY `fk_clasificacion_a_reserva` (`id_clasificacion`),
  CONSTRAINT `fk_clasificacion_a_reserva` FOREIGN KEY (`id_clasificacion`) REFERENCES `res_clasificacion` (`id_clasificacion`),
  CONSTRAINT `fk_clasificador_mercado_a_reserva` FOREIGN KEY (`id_clasificador_mercado`) REFERENCES `res_clasificador_mercado` (`id_clasificador_mercado`),
  CONSTRAINT `fk_origen_a_reserva` FOREIGN KEY (`id_origen_reserva`) REFERENCES `res_origen_reserva` (`id_origen_reserva`),
  CONSTRAINT `fk_persona_a_reserva` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`),
  CONSTRAINT `fk_proveedor_a_reserva` FOREIGN KEY (`id_proveedor`) REFERENCES `prv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_tipo_experiencia_a_reserva` FOREIGN KEY (`id_tipo_experiencia`) REFERENCES `res_tipo_experiencia` (`id_tipo_experiencia`),
  CONSTRAINT `fk_tipo_res_a_reserva` FOREIGN KEY (`id_tipo_reserva`) REFERENCES `res_tipo_reserva` (`id_tipo_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=3185 DEFAULT CHARSET=latin1 COMMENT='Almacena las reservas que se realicen sobre todos los produc';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_au_aud_res_reserva` AFTER UPDATE ON `res_reserva` FOR EACH ROW BEGIN
  DECLARE valorPk VARCHAR(50);
  DECLARE usuario VARCHAR(50);
  DECLARE campos TEXT;
  DECLARE valorAnterior TEXT;
  DECLARE valorActual TEXT;
  DECLARE camposMaestro TEXT;
  DECLARE valoresMaestro TEXT;
  
  SET campos = '';
  SET valorAnterior = '';
  SET valorActual = '';
  SET camposMaestro = '';
  SET valoresMaestro = '';
  
  SET valorPk = old.id_reserva;

  IF (IFNULL(new.id_tipo_reserva, '') != IFNULL(old.id_tipo_reserva, ''))
  THEN
    SET campos = concat(campos, 'id_tipo_reserva~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_tipo_reserva, ''), '~');
    SET valorActual = concat(valorActual, new.id_tipo_reserva, '~');
  END IF;
  IF (IFNULL(new.id_tipo_experiencia, '') != IFNULL(old.id_tipo_experiencia, ''))
  THEN
    SET campos = concat(campos, 'id_tipo_experiencia~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_tipo_experiencia, ''), '~');
    SET valorActual = concat(valorActual, new.id_tipo_experiencia, '~');
  END IF;
  IF (IFNULL(new.id_persona, '') != IFNULL(old.id_persona, ''))
  THEN
    SET campos = concat(campos, 'id_persona~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_persona, ''), '~');
    SET valorActual = concat(valorActual, new.id_persona, '~');
  END IF;
  IF (IFNULL(new.id_origen_reserva, '') != IFNULL(old.id_origen_reserva, ''))
  THEN
    SET campos = concat(campos, 'id_origen_reserva~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_origen_reserva, ''), '~');
    SET valorActual = concat(valorActual, new.id_origen_reserva, '~');
  END IF;
  IF (IFNULL(new.estado_reserva, '') != IFNULL(old.estado_reserva, ''))
  THEN
    SET campos = concat(campos, 'estado_reserva~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.estado_reserva, ''), '~');
    SET valorActual = concat(valorActual, new.estado_reserva, '~');
  END IF;
  IF (IFNULL(new.codigo_agencia, '') != IFNULL(old.codigo_agencia, ''))
  THEN
    SET campos = concat(campos, 'codigo_agencia~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.codigo_agencia, ''), '~');
    SET valorActual = concat(valorActual, new.codigo_agencia, '~');
  END IF;
  IF (IFNULL(new.observacion_reserva, '') != IFNULL(old.observacion_reserva, ''))
  THEN
    SET campos = concat(campos, 'observacion_reserva~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_reserva, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_reserva, '~');
  END IF;
  IF (IFNULL(new.observacion_privada, '') != IFNULL(old.observacion_privada, ''))
  THEN
    SET campos = concat(campos, 'observacion_privada~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_privada, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_privada, '~');
  END IF;
  IF (IFNULL(new.observacion_reporte, '') != IFNULL(old.observacion_reporte, ''))
  THEN
    SET campos = concat(campos, 'observacion_reporte~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_reporte, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_reporte, '~');
  END IF;
  IF (IFNULL(new.observacion_reporte2, '') != IFNULL(old.observacion_reporte2, ''))
  THEN
    SET campos = concat(campos, 'observacion_reporte2~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_reporte2, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_reporte2, '~');
  END IF;
  IF (IFNULL(new.observacion_reporte3, '') != IFNULL(old.observacion_reporte3, ''))
  THEN
    SET campos = concat(campos, 'observacion_reporte3~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.observacion_reporte3, ''), '~');
    SET valorActual = concat(valorActual, new.observacion_reporte3, '~');
  END IF;
  IF (IFNULL(new.ruta_archivo_referencia, '') != IFNULL(old.ruta_archivo_referencia, ''))
  THEN
    SET campos = concat(campos, 'ruta_archivo_referencia~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.ruta_archivo_referencia, ''), '~');
    SET valorActual = concat(valorActual, new.ruta_archivo_referencia, '~');
  END IF;
  IF (IFNULL(new.fecha_generacion, '') != IFNULL(old.fecha_generacion, ''))
  THEN
    SET campos = concat(campos, 'fecha_generacion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_generacion, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_generacion, '~');
  END IF;
  IF (IFNULL(new.fecha_pago, '') != IFNULL(old.fecha_pago, ''))
  THEN
    SET campos = concat(campos, 'fecha_pago~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_pago, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_pago, '~');
  END IF;
  IF (IFNULL(new.nro_pax, '') != IFNULL(old.nro_pax, ''))
  THEN
    SET campos = concat(campos, 'nro_pax~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_pax, ''), '~');
    SET valorActual = concat(valorActual, new.nro_pax, '~');
  END IF;
  IF (IFNULL(new.id_persona_contacto, '') != IFNULL(old.id_persona_contacto, ''))
  THEN
    SET campos = concat(campos, 'id_persona_contacto~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_persona_contacto, ''), '~');
    SET valorActual = concat(valorActual, new.id_persona_contacto, '~');
  END IF;
  IF (IFNULL(new.importado_de, '') != IFNULL(old.importado_de, ''))
  THEN
    SET campos = concat(campos, 'importado_de~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.importado_de, ''), '~');
    SET valorActual = concat(valorActual, new.importado_de, '~');
  END IF;
  IF (IFNULL(new.id_importado_de, '') != IFNULL(old.id_importado_de, ''))
  THEN
    SET campos = concat(campos, 'id_importado_de~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_importado_de, ''), '~');
    SET valorActual = concat(valorActual, new.id_importado_de, '~');
  END IF;
  IF (IFNULL(new.fecha_pago_proximo, '') != IFNULL(old.fecha_pago_proximo, ''))
  THEN
    SET campos = concat(campos, 'fecha_pago_proximo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_pago_proximo, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_pago_proximo, '~');
  END IF;
  IF (IFNULL(new.fecha_pago_final, '') != IFNULL(old.fecha_pago_final, ''))
  THEN
    SET campos = concat(campos, 'fecha_pago_final~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.fecha_pago_final, ''), '~');
    SET valorActual = concat(valorActual, new.fecha_pago_final, '~');
  END IF;
  IF (IFNULL(new.time_limit, '') != IFNULL(old.time_limit, ''))
  THEN
    SET campos = concat(campos, 'time_limit~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.time_limit, ''), '~');
    SET valorActual = concat(valorActual, new.time_limit, '~');
  END IF;
  IF (IFNULL(new.id_usuario_responsable, '') != IFNULL(old.id_usuario_responsable, ''))
  THEN
    SET campos = concat(campos, 'id_usuario_responsable~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_usuario_responsable, ''), '~');
    SET valorActual = concat(valorActual, new.id_usuario_responsable, '~');
  END IF;
  IF (IFNULL(new.porcentaje_dscto_adicional, '') != IFNULL(old.porcentaje_dscto_adicional, ''))
  THEN
    SET campos = concat(campos, 'porcentaje_dscto_adicional~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.porcentaje_dscto_adicional, ''), '~');
    SET valorActual = concat(valorActual, new.porcentaje_dscto_adicional, '~');
  END IF;
  IF (IFNULL(new.id_motivo_descuento, '') != IFNULL(old.id_motivo_descuento, ''))
  THEN
    SET campos = concat(campos, 'id_motivo_descuento~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_motivo_descuento, ''), '~');
    SET valorActual = concat(valorActual, new.id_motivo_descuento, '~');
  END IF;
  IF (IFNULL(new.descuento_en_valor, '') != IFNULL(old.descuento_en_valor, ''))
  THEN
    SET campos = concat(campos, 'descuento_en_valor~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.descuento_en_valor, ''), '~');
    SET valorActual = concat(valorActual, new.descuento_en_valor, '~');
  END IF;
  IF (IFNULL(new.prioridad_descuento, '') != IFNULL(old.prioridad_descuento, ''))
  THEN
    SET campos = concat(campos, 'prioridad_descuento~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.prioridad_descuento, ''), '~');
    SET valorActual = concat(valorActual, new.prioridad_descuento, '~');
  END IF;
  IF (IFNULL(new.valor_pago_proximo, '') != IFNULL(old.valor_pago_proximo, ''))
  THEN
    SET campos = concat(campos, 'valor_pago_proximo~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.valor_pago_proximo, ''), '~');
    SET valorActual = concat(valorActual, new.valor_pago_proximo, '~');
  END IF;
  IF (IFNULL(new.valor_pago_final, '') != IFNULL(old.valor_pago_final, ''))
  THEN
    SET campos = concat(campos, 'valor_pago_final~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.valor_pago_final, ''), '~');
    SET valorActual = concat(valorActual, new.valor_pago_final, '~');
  END IF;
  IF (IFNULL(new.nro_encuesta_presentada, '') != IFNULL(old.nro_encuesta_presentada, ''))
  THEN
    SET campos = concat(campos, 'nro_encuesta_presentada~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_encuesta_presentada, ''), '~');
    SET valorActual = concat(valorActual, new.nro_encuesta_presentada, '~');
  END IF;
  IF (IFNULL(new.nro_encuesta_faltante, '') != IFNULL(old.nro_encuesta_faltante, ''))
  THEN
    SET campos = concat(campos, 'nro_encuesta_faltante~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.nro_encuesta_faltante, ''), '~');
    SET valorActual = concat(valorActual, new.nro_encuesta_faltante, '~');
  END IF;
  IF (IFNULL(new.porcentaje_satisfaccion, '') != IFNULL(old.porcentaje_satisfaccion, ''))
  THEN
    SET campos = concat(campos, 'porcentaje_satisfaccion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.porcentaje_satisfaccion, ''), '~');
    SET valorActual = concat(valorActual, new.porcentaje_satisfaccion, '~');
  END IF;
  IF (IFNULL(new.tipo_generacion, '') != IFNULL(old.tipo_generacion, ''))
  THEN
    SET campos = concat(campos, 'tipo_generacion~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.tipo_generacion, ''), '~');
    SET valorActual = concat(valorActual, new.tipo_generacion, '~');
  END IF;
  IF (IFNULL(new.id_usuario_rp, '') != IFNULL(old.id_usuario_rp, ''))
  THEN
    SET campos = concat(campos, 'id_usuario_rp~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.id_usuario_rp, ''), '~');
    SET valorActual = concat(valorActual, new.id_usuario_rp, '~');
  END IF;
  IF (IFNULL(new.itinerario_enviado, '') != IFNULL(old.itinerario_enviado, ''))
  THEN
    SET campos = concat(campos, 'itinerario_enviado~');
    SET valorAnterior = concat(valorAnterior, ifnull(old.itinerario_enviado, ''), '~');
    SET valorActual = concat(valorActual, new.itinerario_enviado, '~');
  END IF;
  SET usuario = new.id_usuario_modifica;
  
  IF campos != '' THEN
    INSERT INTO gecoecua_ecuadoradventure.seg_auditoria
    (
      tabla_auditoria,
      evento_auditoria,
      campos_maestro,
      valores_maestro,
      valor_clave_auditoria,
      nombre_campo_auditoria,
      valor_anterior_auditoria,
      valor_actual_auditoria,
      usuario_auditoria,
      fecha_auditoria
    )
    VALUES
    (
      'res_reserva',
      'UPDATE',
      camposMaestro,
      valoresMaestro,
      valorPk,
      campos,
      valorAnterior,
      valorActual,
      usuario,
      NOW()
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `res_tipo_experiencia`
--

DROP TABLE IF EXISTS `res_tipo_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_tipo_experiencia` (
  `id_tipo_experiencia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `descripcion_tipo_experiencia` varchar(256) DEFAULT NULL COMMENT 'Descripción del tipo de experiencia',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_experiencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el tipo de experiencia de la reserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_tipo_habitacion`
--

DROP TABLE IF EXISTS `res_tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_tipo_habitacion` (
  `id_tipo_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_habitacion` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todos los tipos de habitación definidos p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_tipo_reserva`
--

DROP TABLE IF EXISTS `res_tipo_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_tipo_reserva` (
  `id_tipo_reserva` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla',
  `descripcion_tipo_reserva` varchar(256) DEFAULT NULL COMMENT 'Descripción del tipo de reserva',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_tipo_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los tipos de reservas que pueden existir';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_ultimo_saldo_x_cliente`
--

DROP TABLE IF EXISTS `res_ultimo_saldo_x_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_ultimo_saldo_x_cliente` (
  `id_ultimo_saldo_x_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `valor_ultimo_saldo_x_cliente` decimal(15,4) DEFAULT NULL,
  `anio_ultimo_saldo_x_cliente` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ultimo_saldo_x_cliente`),
  KEY `fk_persona_a_ult_saldo_x_cli` (`id_persona`),
  CONSTRAINT `fk_persona_a_ult_saldo_x_cli` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena el último saldo anual por cliente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_usuario_realizado_por`
--

DROP TABLE IF EXISTS `res_usuario_realizado_por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_usuario_realizado_por` (
  `id_usuario_realizado_por` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(25) DEFAULT NULL COMMENT 'Código del usuario y clave primaria de la tabla SEG_USUARIO',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario_realizado_por`),
  KEY `fk_usuario_a_usr_realizado_por` (`id_usuario`),
  CONSTRAINT `fk_usuario_a_usr_realizado_por` FOREIGN KEY (`id_usuario`) REFERENCES `seg_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena un usuario que se presentará siempre en el reporte de cierre de file';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_vuelo`
--

DROP TABLE IF EXISTS `res_vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_vuelo` (
  `id_vuelo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_VUELO',
  `descripcion_vuelo` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `res_wepackage`
--

DROP TABLE IF EXISTS `res_wepackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_wepackage` (
  `id_wepackage` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla RES_WEPACKAGE',
  `id_detalle_reserva` int(11) DEFAULT NULL,
  `nombre_wepackage` varchar(200) DEFAULT NULL COMMENT 'Nombre corto que identifica al paquete',
  `descripcion_wepackage` text COMMENT 'Descripción del package',
  `precio_wepackage` decimal(15,4) DEFAULT NULL COMMENT 'Precio del package',
  `disponibilidad` int(11) DEFAULT NULL COMMENT 'Cantidad de lugares disponibles para el paquete',
  `dias_antes_salida` int(11) DEFAULT NULL COMMENT 'Días antes de la salida',
  `we_id_package` varchar(100) DEFAULT NULL COMMENT 'Código del paquete en WeTravel',
  `id_usuario_crea` varchar(15) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(15) DEFAULT NULL COMMENT 'Último usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se realiza la última modificación del registro',
  PRIMARY KEY (`id_wepackage`),
  KEY `fk_detalle_reserva_a_wepackage` (`id_detalle_reserva`),
  CONSTRAINT `fk_detalle_reserva_a_wepackage` FOREIGN KEY (`id_detalle_reserva`) REFERENCES `res_detalle_reserva` (`id_detalle_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_caja_diaria`
--

DROP TABLE IF EXISTS `rst_caja_diaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_caja_diaria` (
  `id_caja_diaria` int(11) NOT NULL AUTO_INCREMENT,
  `id_operacion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_OPERACION',
  `estado_caja_diaria` char(1) DEFAULT NULL,
  `fecha_hora_apertura` datetime DEFAULT NULL,
  `fecha_hora_cierre` datetime DEFAULT NULL,
  `valor_apertura` decimal(15,4) DEFAULT NULL,
  `valor_cierre_efectivo` decimal(15,4) DEFAULT NULL,
  `valor_cierre_dia` decimal(15,4) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_caja_diaria`),
  KEY `fk_operacion_a_caja_diaria` (`id_operacion`),
  CONSTRAINT `fk_operacion_a_caja_diaria` FOREIGN KEY (`id_operacion`) REFERENCES `prd_operacion` (`id_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_comanda`
--

DROP TABLE IF EXISTS `rst_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_comanda` (
  `id_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `id_mesa` int(11) DEFAULT NULL,
  `id_motivo` int(11) DEFAULT NULL,
  `nro_comanda` int(11) DEFAULT NULL,
  `estado_comanda` char(1) DEFAULT NULL,
  `nro_ocupantes` int(15) DEFAULT NULL,
  `observacion_comanda` varchar(256) DEFAULT NULL,
  `porcentaje_descuento` decimal(15,6) DEFAULT NULL,
  `motivo_descuento` varchar(256) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_comanda`),
  KEY `fk_mesa_x_comanda` (`id_mesa`),
  KEY `fk_motivo_a_comanda` (`id_motivo`),
  CONSTRAINT `fk_mesa_x_comanda` FOREIGN KEY (`id_mesa`) REFERENCES `rst_mesa` (`id_mesa`),
  CONSTRAINT `fk_motivo_a_comanda` FOREIGN KEY (`id_motivo`) REFERENCES `prm_motivo` (`id_motivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_descuento`
--

DROP TABLE IF EXISTS `rst_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_descuento` (
  `id_descuento` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(15) DEFAULT NULL,
  `motivo_descuento` varchar(256) DEFAULT NULL,
  `porcentaje_descuento` decimal(15,6) DEFAULT NULL,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_descuento`),
  KEY `fk_producto_a_descuento` (`id_producto`),
  CONSTRAINT `fk_producto_a_descuento` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_detalle_comanda`
--

DROP TABLE IF EXISTS `rst_detalle_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_detalle_comanda` (
  `id_detalle_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `id_comanda` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `id_motivo` int(11) DEFAULT NULL,
  `id_pedido_comanda` int(11) DEFAULT NULL,
  `cantidad` decimal(15,4) DEFAULT NULL,
  `precio` decimal(15,4) DEFAULT NULL,
  `total_impuesto_porcentaje` decimal(15,4) DEFAULT NULL,
  `total_impuesto_valor` decimal(15,4) DEFAULT NULL,
  `total_impuesto` decimal(15,4) DEFAULT NULL,
  `estado_detalle_comanda` varchar(3) DEFAULT NULL,
  `observacion_detalle_comanda` text,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_comanda`),
  KEY `fk_producto_a_detalle_comanda` (`id_producto`),
  KEY `fk_motivo_a_detalle_comanda` (`id_motivo`),
  KEY `fk_comanda_a_det_comanda` (`id_comanda`),
  KEY `fk_pedido_a_detalle` (`id_pedido_comanda`),
  CONSTRAINT `fk_comanda_a_det_comanda` FOREIGN KEY (`id_comanda`) REFERENCES `rst_comanda` (`id_comanda`),
  CONSTRAINT `fk_motivo_a_detalle_comanda` FOREIGN KEY (`id_motivo`) REFERENCES `prm_motivo` (`id_motivo`),
  CONSTRAINT `fk_pedido_a_detalle` FOREIGN KEY (`id_pedido_comanda`) REFERENCES `rst_pedido_comanda` (`id_pedido_comanda`),
  CONSTRAINT `fk_producto_a_detalle_comanda` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_detalle_valor_comanda`
--

DROP TABLE IF EXISTS `rst_detalle_valor_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_detalle_valor_comanda` (
  `id_detalle_valor_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido_comanda` int(11) DEFAULT NULL,
  `id_impuesto` varchar(4) DEFAULT NULL,
  `tipo_detalle_valor` char(1) DEFAULT NULL,
  `suprime_impuesto` char(1) DEFAULT NULL,
  `valor` decimal(15,4) DEFAULT NULL,
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL,
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `estado_detalle_valor_comanda` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle_valor_comanda`),
  KEY `fk_pedido_comanda_a_detalle_valor_comanda` (`id_pedido_comanda`),
  KEY `fk_impuesto_a_det_valor_comanda` (`id_impuesto`),
  CONSTRAINT `fk_impuesto_a_det_valor_comanda` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`),
  CONSTRAINT `fk_pedido_comanda_a_detalle_valor_comanda` FOREIGN KEY (`id_pedido_comanda`) REFERENCES `rst_pedido_comanda` (`id_pedido_comanda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_detalle_valor_det_comanda`
--

DROP TABLE IF EXISTS `rst_detalle_valor_det_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_detalle_valor_det_comanda` (
  `id_detalle_valor_det_comanda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla rst_detalle_valor_det_comanda',
  `id_impuesto` varchar(4) DEFAULT NULL COMMENT 'Clave del impuesto',
  `id_detalle_comanda` int(11) DEFAULT NULL COMMENT 'Clave del detalle de la comanda',
  `tipo_detalle_valor` char(1) DEFAULT NULL COMMENT 'Tipo de detalle valor, I=Impuesto, D=Descuento, T=Total, S=Subtotal',
  `suprime_impuesto` char(1) DEFAULT NULL COMMENT 'Indica si se debe suprimir el impuesto',
  `valor` decimal(15,4) DEFAULT NULL COMMENT 'Valor',
  `porcentaje_impuesto` decimal(15,4) DEFAULT NULL COMMENT 'Porcentaje del impuesto aplicado',
  `base_imponible` decimal(15,4) DEFAULT NULL COMMENT 'Base imponible del impuesto',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL COMMENT 'Fecha en la que se crea el registro',
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  PRIMARY KEY (`id_detalle_valor_det_comanda`),
  KEY `fk_impuesto_a_detalle_valor_det` (`id_impuesto`),
  KEY `fk_detalle_comanda_a_detalle_valor_det` (`id_detalle_comanda`),
  CONSTRAINT `fk_detalle_comanda_a_detalle_valor_det` FOREIGN KEY (`id_detalle_comanda`) REFERENCES `rst_detalle_comanda` (`id_detalle_comanda`),
  CONSTRAINT `fk_impuesto_a_detalle_valor_det` FOREIGN KEY (`id_impuesto`) REFERENCES `prd_impuesto` (`id_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena los detalles valor de los detalles de la comanda';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_empleado`
--

DROP TABLE IF EXISTS `rst_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_cargo` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `estado_empleado` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_cargo_a_empleado` (`id_tipo_cargo`),
  KEY `fk_persona_a_empleado` (`id_persona`),
  CONSTRAINT `fk_cargo_a_empleado` FOREIGN KEY (`id_tipo_cargo`) REFERENCES `rst_tipo_cargo` (`id_tipo_cargo`),
  CONSTRAINT `fk_persona_a_empleado` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_forma_pago_comanda`
--

DROP TABLE IF EXISTS `rst_forma_pago_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_forma_pago_comanda` (
  `id_forma_pago_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_forma_pago` int(11) DEFAULT NULL,
  `id_pedido_comanda` int(11) DEFAULT NULL,
  `nro_comprobante` varchar(100) DEFAULT NULL,
  `referencia_forma_pago` varchar(100) DEFAULT NULL,
  `porcentaje_forma_pago` decimal(15,4) DEFAULT NULL,
  `valor_forma_pago` decimal(15,4) DEFAULT NULL,
  `estado_forma_pago_comanda` decimal(15,4) DEFAULT NULL,
  `id_moneda_forma_pago` int(11) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago_comanda`),
  KEY `fk_tipo_frm_pago_a_frm_pago_comanda` (`id_tipo_forma_pago`),
  KEY `fk_pedido_a_forma_pago` (`id_pedido_comanda`),
  CONSTRAINT `fk_pedido_a_forma_pago` FOREIGN KEY (`id_pedido_comanda`) REFERENCES `rst_pedido_comanda` (`id_pedido_comanda`),
  CONSTRAINT `fk_tipo_frm_pago_a_frm_pago_comanda` FOREIGN KEY (`id_tipo_forma_pago`) REFERENCES `fac_tipo_forma_pago` (`id_tipo_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_mesa`
--

DROP TABLE IF EXISTS `rst_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_mesa` (
  `id_mesa` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `estado_mesa` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mesa`),
  KEY `fk_empleado_a_mesa` (`id_empleado`),
  KEY `fk_producto_a_mesa` (`id_producto`),
  CONSTRAINT `fk_empleado_a_mesa` FOREIGN KEY (`id_empleado`) REFERENCES `rst_empleado` (`id_empleado`),
  CONSTRAINT `fk_producto_a_mesa` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_mesa_x_producto`
--

DROP TABLE IF EXISTS `rst_mesa_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_mesa_x_producto` (
  `id_mesa_x_producto` int(11) NOT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_producto` varchar(15) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mesa_x_producto`),
  KEY `fk_prd_a_mesa_x_producto` (`id_producto`),
  KEY `fk_mesa_a_mesa_x_producto` (`id_mesa`),
  CONSTRAINT `fk_mesa_a_mesa_x_producto` FOREIGN KEY (`id_mesa`) REFERENCES `rst_mesa` (`id_mesa`),
  CONSTRAINT `fk_prd_a_mesa_x_producto` FOREIGN KEY (`id_producto`) REFERENCES `prd_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_pedido_comanda`
--

DROP TABLE IF EXISTS `rst_pedido_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_pedido_comanda` (
  `id_pedido_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `id_comanda` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `total_comanda` decimal(15,4) DEFAULT NULL,
  `estado_pedido_comanda` char(3) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pedido_comanda`),
  KEY `fk_persona_a_pedido_comanda` (`id_persona`),
  KEY `fk_pedido_x_comanda` (`id_comanda`),
  KEY `fk_factura_a_comanda` (`id_factura`),
  CONSTRAINT `fk_factura_a_comanda` FOREIGN KEY (`id_factura`) REFERENCES `fac_factura` (`id_factura`),
  CONSTRAINT `fk_pedido_x_comanda` FOREIGN KEY (`id_comanda`) REFERENCES `rst_comanda` (`id_comanda`),
  CONSTRAINT `fk_persona_a_pedido_comanda` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rst_tipo_cargo`
--

DROP TABLE IF EXISTS `rst_tipo_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rst_tipo_cargo` (
  `id_tipo_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_cargo` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tipo_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_auditoria`
--

DROP TABLE IF EXISTS `seg_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_auditoria` (
  `id_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `tabla_auditoria` varchar(100) DEFAULT NULL,
  `evento_auditoria` varchar(100) DEFAULT NULL,
  `campos_maestro` text COMMENT 'Campos clave de las tablas que preceden a la auditada',
  `valores_maestro` text COMMENT 'Valores de los campos clave de las tablas que preceden a la auditada',
  `valor_clave_auditoria` varchar(100) DEFAULT NULL,
  `nombre_campo_auditoria` text,
  `valor_anterior_auditoria` text,
  `valor_actual_auditoria` text,
  `usuario_auditoria` varchar(25) DEFAULT NULL,
  `fecha_auditoria` datetime DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5303513 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los movimientos y eventos que se realizan';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_estado_reserva`
--

DROP TABLE IF EXISTS `seg_estado_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_estado_reserva` (
  `id_estado_reserva` char(3) NOT NULL COMMENT 'Clave primaria de la tabla SEG_ESTADO_RESERVA',
  `descripcion_estado_reserva` varchar(100) DEFAULT NULL COMMENT 'Descripción del estado',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estado_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_estado_reserva_x_perfil`
--

DROP TABLE IF EXISTS `seg_estado_reserva_x_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_estado_reserva_x_perfil` (
  `id_estado_reserva_x_perfil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla SEG_ESTADO_RESERVA_X_PERFIL',
  `id_perfil` varchar(4) DEFAULT NULL COMMENT 'Clave primaria de la tabla SEG_PERFIL',
  `id_estado_reserva` char(3) DEFAULT NULL COMMENT 'Clave primaria de la tabla SEG_ESTADO_RESERVA',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estado_reserva_x_perfil`),
  KEY `fk_estado_reserva_a_perfil` (`id_estado_reserva`),
  KEY `fk_perfil_a_estado_reserva` (`id_perfil`),
  CONSTRAINT `fk_estado_reserva_a_perfil` FOREIGN KEY (`id_estado_reserva`) REFERENCES `seg_estado_reserva` (`id_estado_reserva`),
  CONSTRAINT `fk_perfil_a_estado_reserva` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_intento_fallido`
--

DROP TABLE IF EXISTS `seg_intento_fallido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_intento_fallido` (
  `id_intento_fallido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la tabla SEG_INTENTO_FALLIDO',
  `id_usuario_ingresado` varchar(25) DEFAULT NULL COMMENT 'Usuario que se ingresó, puede que esté mal ingresado',
  `nro_error` int(11) DEFAULT NULL COMMENT 'Número del error ',
  `ip_maquina_intento` varchar(100) DEFAULT NULL COMMENT 'IP del proveedor o de la máquina desde donde se intentó ingresar',
  `fecha_hora_intento` datetime DEFAULT NULL COMMENT 'Fecha y hora del intento',
  PRIMARY KEY (`id_intento_fallido`)
) ENGINE=InnoDB AUTO_INCREMENT=1404 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_logeo_usuario`
--

DROP TABLE IF EXISTS `seg_logeo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_logeo_usuario` (
  `id_logeo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_logeo` varchar(25) DEFAULT NULL COMMENT 'Usuario que se conecta',
  `sesion_logeo` varchar(100) DEFAULT NULL,
  `fecha_inicio_logeo` datetime DEFAULT NULL COMMENT 'Fecha completa cuando el usuario entra a la aplicación',
  `fecha_fin_logeo` datetime DEFAULT NULL COMMENT 'Fecha completa cuando el usuario sale correctamente de la aplicación',
  `ip_logeo` varchar(100) DEFAULT NULL COMMENT 'Dirección IP de donde ingreso a la aplicación el usuario',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_logeo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=48880 DEFAULT CHARSET=latin1 COMMENT='Contiene el registro de entrada y salida de los usuarios al ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_modulo`
--

DROP TABLE IF EXISTS `seg_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_modulo` (
  `id_modulo` varchar(4) NOT NULL COMMENT 'Código del módulo del sistema',
  `descripcion_modulo` varchar(100) DEFAULT NULL COMMENT 'Nombre o descripción del módulo del sistema',
  `imagen_modulo` varchar(256) DEFAULT NULL COMMENT 'Imagen identificativa del módulo',
  `direccion_modulo` varchar(256) DEFAULT NULL COMMENT 'Dirección o ruta de la primera pantalla del módulo',
  `orden` decimal(15,0) DEFAULT NULL COMMENT 'Orden de presentación de los módulos',
  `estado_modulo` char(1) DEFAULT 'A',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene los módulos del sistema, según haya contratado el c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_modulo_x_perfil`
--

DROP TABLE IF EXISTS `seg_modulo_x_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_modulo_x_perfil` (
  `id_modulo_x_perfil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del módulo por perfil',
  `id_modulo` varchar(4) DEFAULT NULL COMMENT 'Código del módulo del sistema',
  `id_perfil` varchar(4) DEFAULT NULL COMMENT 'Código del perfil',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_modulo_x_perfil`),
  KEY `fk_modulo_a_mdl_x_prf` (`id_modulo`),
  KEY `fk_prf_a_mdl_x_prf` (`id_perfil`),
  CONSTRAINT `fk_modulo_a_mdl_x_prf` FOREIGN KEY (`id_modulo`) REFERENCES `seg_modulo` (`id_modulo`),
  CONSTRAINT `fk_prf_a_mdl_x_prf` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1 COMMENT='Contiene los módulos que tiene cada perfil';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_objeto`
--

DROP TABLE IF EXISTS `seg_objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_objeto` (
  `id_objeto` int(11) NOT NULL AUTO_INCREMENT,
  `id_modulo` varchar(4) DEFAULT NULL COMMENT 'Código del módulo del sistema',
  `id_opcion_menu` varchar(100) DEFAULT NULL,
  `id_tabla` int(11) DEFAULT NULL COMMENT 'Código de la tabla que maneja el objeto',
  `descripcion_objeto` varchar(100) DEFAULT NULL,
  `tipo_objeto` varchar(4) DEFAULT NULL,
  `nombre_archivo` varchar(100) DEFAULT NULL,
  `titulo_objeto` varchar(256) DEFAULT NULL COMMENT 'Título para identificar qué objeto es',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_objeto`),
  KEY `fk_modulo_a_objeto` (`id_modulo`),
  KEY `fk_opcion_menu_a_objeto` (`id_opcion_menu`),
  CONSTRAINT `fk_modulo_a_objeto` FOREIGN KEY (`id_modulo`) REFERENCES `seg_modulo` (`id_modulo`),
  CONSTRAINT `fk_opcion_menu_a_objeto` FOREIGN KEY (`id_opcion_menu`) REFERENCES `seg_opcion_menu` (`id_opcion_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=1677 DEFAULT CHARSET=latin1 COMMENT='Contiene todos los objetos creados para la aplicación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_opcion_menu`
--

DROP TABLE IF EXISTS `seg_opcion_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_opcion_menu` (
  `id_opcion_menu` varchar(100) NOT NULL,
  `id_modulo` varchar(4) DEFAULT NULL COMMENT 'Código del módulo del sistema',
  `padre_opcion_menu` varchar(100) DEFAULT NULL,
  `descripcion_opcion_menu` varchar(100) DEFAULT NULL COMMENT 'Descripción de la opción del menú',
  `orden_opcion_menu` int(11) DEFAULT NULL COMMENT 'Orden de aparición del menú',
  `texto_menu` varchar(100) DEFAULT NULL COMMENT 'Texto que indica que menu es para el archivo de configuración de idiomas',
  `imagen_menu` varchar(256) DEFAULT NULL COMMENT 'Imagen del menú',
  `direccion_menu` varchar(256) DEFAULT NULL COMMENT 'Ruta o dirección de la pantalla donde va a estar el menú',
  `target_menu` varchar(100) DEFAULT NULL COMMENT 'Donde aparecerá la pantalla que llame el menú',
  `activo_si_no_opcion` char(1) DEFAULT NULL COMMENT 'Se desactiva si el usuario no compro esta opciñon',
  `super_menu` char(1) DEFAULT 'N',
  `objeto_funcion` varchar(256) DEFAULT NULL COMMENT 'Es el nombre de la sentencia que se ejecutará al hacer click en el menú',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_opcion_menu`),
  KEY `fk_modulo_a_opc_menu` (`id_modulo`),
  CONSTRAINT `fk_modulo_a_opc_menu` FOREIGN KEY (`id_modulo`) REFERENCES `seg_modulo` (`id_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene las opciones de los menús';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_parametriza_auditoria`
--

DROP TABLE IF EXISTS `seg_parametriza_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_parametriza_auditoria` (
  `id_parametriza_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_objeto` int(11) DEFAULT NULL COMMENT 'Código de la tabla seg_objeto',
  `id_tabla` int(11) DEFAULT NULL,
  `insercion_parametriza_auditoria` char(1) DEFAULT NULL,
  `actualizacion_parametriza_auditoria` char(1) DEFAULT NULL,
  `borrado_parametriza_auditoria` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_parametriza_auditoria`),
  UNIQUE KEY `idx_no_repetir_tabla` (`id_tabla`),
  KEY `fk_objeto_a_param_audit` (`id_objeto`),
  CONSTRAINT `fk_objeto_a_param_audit` FOREIGN KEY (`id_objeto`) REFERENCES `seg_objeto` (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COMMENT='Almacena el listado de tablas a auditar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_perfil`
--

DROP TABLE IF EXISTS `seg_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_perfil` (
  `id_perfil` varchar(4) NOT NULL COMMENT 'Código del perfil',
  `descripcion_perfil` varchar(100) DEFAULT NULL COMMENT 'Nombre o descripción del perfil',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene todos los perfiles del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_perfil_x_opcion_menu`
--

DROP TABLE IF EXISTS `seg_perfil_x_opcion_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_perfil_x_opcion_menu` (
  `id_prf_x_opc_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del perfil por opción de menú',
  `id_perfil` varchar(4) DEFAULT NULL COMMENT 'Código del perfil',
  `id_opcion_menu` varchar(100) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prf_x_opc_menu`),
  KEY `fk_opc_menu_a_prf` (`id_opcion_menu`),
  KEY `fk_prf_a_opc_menu` (`id_perfil`),
  CONSTRAINT `fk_opc_menu_a_prf` FOREIGN KEY (`id_opcion_menu`) REFERENCES `seg_opcion_menu` (`id_opcion_menu`),
  CONSTRAINT `fk_prf_a_opc_menu` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2170 DEFAULT CHARSET=latin1 COMMENT='Contiene las opciones de menú a las que tiene acceso un perf';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_permiso_especial`
--

DROP TABLE IF EXISTS `seg_permiso_especial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_permiso_especial` (
  `id_permiso_especial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código',
  `descripcion_permiso_especial` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_permiso_especial`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena todos los tipos de permiso especial';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_permiso_especial_x_perfil`
--

DROP TABLE IF EXISTS `seg_permiso_especial_x_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_permiso_especial_x_perfil` (
  `id_permiso_especial_x_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso_especial` int(11) DEFAULT NULL COMMENT 'Código',
  `id_perfil` varchar(4) DEFAULT NULL COMMENT 'Código del perfil',
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_permiso_especial_x_perfil`),
  KEY `fk_perfil_a_permiso_especial` (`id_perfil`),
  KEY `fk_tp_permiso_especial_a_perfil` (`id_permiso_especial`),
  CONSTRAINT `fk_perfil_a_permiso_especial` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id_perfil`),
  CONSTRAINT `fk_tp_permiso_especial_a_perfil` FOREIGN KEY (`id_permiso_especial`) REFERENCES `seg_permiso_especial` (`id_permiso_especial`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_permiso_objeto_x_perfil`
--

DROP TABLE IF EXISTS `seg_permiso_objeto_x_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_permiso_objeto_x_perfil` (
  `id_permiso_objeto_x_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_objeto` int(11) DEFAULT NULL,
  `id_perfil` varchar(4) DEFAULT NULL COMMENT 'Código del perfil',
  `tipo_permiso_objeto_x_perfil` char(1) DEFAULT NULL,
  `id_usuario_crea` varchar(25) DEFAULT NULL,
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_permiso_objeto_x_perfil`),
  KEY `fk_objeto_a_perm_obj_x_prf` (`id_objeto`),
  KEY `fk_perfil_a_permiso_obj_x_prf` (`id_perfil`),
  CONSTRAINT `fk_objeto_a_perm_obj_x_prf` FOREIGN KEY (`id_objeto`) REFERENCES `seg_objeto` (`id_objeto`),
  CONSTRAINT `fk_perfil_a_permiso_obj_x_prf` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7785 DEFAULT CHARSET=latin1 COMMENT='Tabla que almacena los tipos de permiso que tiene sobre un o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seg_usuario`
--

DROP TABLE IF EXISTS `seg_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_usuario` (
  `id_usuario` varchar(25) NOT NULL COMMENT 'Código del usuario',
  `id_persona` int(11) DEFAULT NULL COMMENT 'Código de la persona',
  `id_perfil` varchar(4) DEFAULT NULL COMMENT 'Código del perfil',
  `id_empresa` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRM_EMPRESA',
  `id_operacion` int(11) DEFAULT NULL COMMENT 'Clave primaria de la tabla PRD_OPERACION',
  `clave` varchar(32) DEFAULT NULL COMMENT 'Clave encriptada del usuario contra la que se valida el ingreso a la aplicación',
  `super_usuario` char(1) DEFAULT NULL COMMENT 'Indica si es un SUPER usuario',
  `usuario_corrector` char(1) DEFAULT NULL COMMENT 'Indica si el usuario es corrector de errores',
  `estado_usuario` char(1) DEFAULT NULL,
  `dispara_alerta1` char(1) DEFAULT 'N' COMMENT 'Indica si para este usuario se debe disparar la alerta para que no olvide revisar el itinerario de los productos',
  `ip_validar` varchar(100) DEFAULT NULL COMMENT 'Aquí se coloca la IP que se desea validar al ingresar al sistema en caso de ser necesario',
  `habilita_colores` char(1) DEFAULT 'S' COMMENT 'Indica si se habilitan o no los colores de los calendarios para este usuario',
  `fecha_ultimo_cambio_clave` date DEFAULT NULL COMMENT 'Fecha que indica cuando realizó el usuario el último cambio de su clave',
  `cambia_clave` char(1) DEFAULT 'N' COMMENT 'Indica si el usuario debe cambiar la clave a la entrada del sistema',
  `dispara_alerta2` char(1) DEFAULT 'N' COMMENT 'Indica si para este usuario se debe disparar la alerta para verifique la cantidad en componentes del producto',
  `regenera_componentes` char(1) DEFAULT 'N' COMMENT 'Indica S=si el usuario regenera o N=no los componentes de la reserva',
  `usuario_email` varchar(100) DEFAULT NULL COMMENT 'Usuario de email para conectarse al correo personalizado',
  `password_email` varchar(100) DEFAULT NULL COMMENT 'Clave del email para conectarse al correo personalizado',
  `firma_email` text COMMENT 'Firma HTML para enviar en el correo personalizado',
  `acceso_boton` varchar(100) DEFAULT NULL COMMENT 'Coloca separado por guiones los botones a los que tiene acceso un usuario en el caso del CRM',
  `accede_todo_caso` char(1) DEFAULT 'N' COMMENT 'Indica si este usuario accede a todos los casos S=Si o N=No',
  `cambia_agencia_caso` char(1) DEFAULT 'N' COMMENT 'Indica si puede cambiar de agencia en la ventana de ingeso del caso',
  `nick_empresa_relacionada` varchar(256) DEFAULT NULL COMMENT 'Nick de la empresa relacionada',
  `replica_usuario` char(1) DEFAULT 'S' COMMENT 'Indica si replica o no este usuario a la empresa relacionada',
  `activa_app` char(1) DEFAULT NULL COMMENT 'Indica si se le activa o no al usuario la aplicación de celular',
  `acceso_boton_app` varchar(100) DEFAULT NULL COMMENT 'Coloca separado por comas los botones a los que tiene acceso en la App del CRM',
  `cambia_tipo_caso` char(1) DEFAULT 'N' COMMENT 'Indica si este usuario en particular puede cambiar el tipo de caso S=si o N=no',
  `ejecuta_kardex_compra` char(1) DEFAULT 'N' COMMENT 'Indica si este usuario puede ejecutar el kardex en una compra',
  `desmayoriza` char(1) DEFAULT 'N' COMMENT 'Indica si este usuario tiene permiso para desmayorizar los comprobantes contables',
  `modifica_forma_pago` char(1) DEFAULT 'N' COMMENT 'Indica si este usuario tiene permiso para eliminar y/o modificar formas de pago en cobros/pagos',
  `cambia_reserva_compra` char(1) DEFAULT 'N' COMMENT 'Indica si este usuario puede cambiar el id de la reserva en una compra',
  `acceso_columna` varchar(100) DEFAULT NULL COMMENT 'Coloca separado por comas los códigos de las columnas de componentes para indicar a cuáles tiene acceso',
  `solo_productos_operacion` char(1) DEFAULT 'N' COMMENT 'Indica Si solo ve los productos de la operación asignada',
  `token` varchar(180) DEFAULT NULL COMMENT 'Token para logearse en la app',
  `ver_dash_crm` char(1) DEFAULT 'N' COMMENT 'Indica si a este usuario se le despliega el dashboard del CRM al ingresar al módulo',
  `ver_dash_res` char(1) DEFAULT 'N' COMMENT 'Indica si a este usuario se le despliega el dashboard del CRM al ingresar al módulo',
  `ver_dash_fac` char(1) DEFAULT 'N' COMMENT 'Indica si a este usuario se le despliega el dashboard del CRM al ingresar al módulo',
  `ver_dash_prv` char(1) DEFAULT 'N' COMMENT 'Indica si a este usuario se le despliega el dashboard del CRM al ingresar al módulo',
  `ver_dash_crt` char(1) DEFAULT 'N' COMMENT 'Indica si a este usuario se le despliega el dashboard del CRM al ingresar al módulo',
  `ver_dash_seg` char(1) DEFAULT 'N' COMMENT 'Indica si a este usuario se le despliega el dashboard del CRM al ingresar al módulo',
  `salta_aprobacion` char(1) DEFAULT 'N' COMMENT 'Indica si este usuario puede saltarse la aprobación e ir directamente al pre-cierre',
  `ingresar_rubro_prefactura` char(1) DEFAULT 'N' COMMENT 'Indica SI el usuario puede ingresar rubros en la pre-factura de un caso',
  `generar_prefactura` char(1) DEFAULT 'N' COMMENT 'Indica SI el usuario puede generar la pre-factura automática de un caso',
  `reversar_prefactura` char(1) DEFAULT 'N' COMMENT 'Indica SI el usuario puede reversar la pre-factura automática de un caso',
  `ver_rubro_prefactura` char(1) DEFAULT 'N' COMMENT 'Indica SI el usuario puede solo ver rubros en la pre-factura de un caso',
  `anula_comprobante_contable` char(1) DEFAULT 'N' COMMENT 'Indica SI el usuario puede anular un comprobante contable',
  `correo_respuesta` char(3) DEFAULT 'USR' COMMENT 'Indica si el correo de respuesta es el mismo del USR=usuario en la pantalla actual o el que está configurado en la PER=persona',
  `sobreescribe_importacion` char(1) DEFAULT 'N' COMMENT 'Indica S=si el usuario puede o N=no sobreescribir un documento entero en la importación de proformas o reservas',
  `accede_estado_confirmado` char(1) DEFAULT 'S' COMMENT 'Indica S=si el usuario accede o N=no al estado confirmado en reservas',
  `cambia_usuario_crea` char(1) DEFAULT 'N' COMMENT 'Indica S=si el usuario puedo o N=no cambiar el usuario que crea la reserva',
  `registra_anticipo` char(1) DEFAULT 'N',
  `cambia_impuesto_porcentual` char(1) DEFAULT 'N',
  `id_usuario_crea` varchar(25) DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_crea` datetime DEFAULT NULL,
  `id_usuario_modifica` varchar(25) DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fecha_modifica` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `idx_persona` (`id_persona`),
  KEY `fk_empresa_a_usuario` (`id_empresa`),
  KEY `fk_perfil_a_usuario` (`id_perfil`),
  KEY `fk_persona_a_usuario` (`id_persona`),
  KEY `fk_operacion_a_usuario` (`id_operacion`),
  CONSTRAINT `fk_empresa_a_usuario` FOREIGN KEY (`id_empresa`) REFERENCES `prm_empresa` (`id_empresa`),
  CONSTRAINT `fk_operacion_a_usuario` FOREIGN KEY (`id_operacion`) REFERENCES `prd_operacion` (`id_operacion`),
  CONSTRAINT `fk_perfil_a_usuario` FOREIGN KEY (`id_perfil`) REFERENCES `seg_perfil` (`id_perfil`),
  CONSTRAINT `fk_persona_a_usuario` FOREIGN KEY (`id_persona`) REFERENCES `per_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene el listado de usuarios que pueden acceder al sistem';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_rep_lista_productos`
--

DROP TABLE IF EXISTS `tmp_rep_lista_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_rep_lista_productos` (
  `id_rep_lista_productos` int(11) NOT NULL AUTO_INCREMENT,
  `id_sesion` varchar(100) DEFAULT NULL,
  `id_producto_rep_lista_productos` varchar(15) DEFAULT NULL,
  `nombre_corto_producto` varchar(100) DEFAULT NULL,
  `imprime_producto` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_rep_lista_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla temporal para la ejecución del reporte Listado de Prod';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'gecoecua_ecuadoradventure'
--

--
-- Dumping routines for database 'gecoecua_ecuadoradventure'
--
/*!50003 DROP FUNCTION IF EXISTS `fAbrePeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fAbrePeriodo`(idPeriodoAnterior INT, idPeriodoNuevo INT, idUsuario VARCHAR(15)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE correcto BOOL;
    DECLARE done INT;
    
    SET correcto = TRUE;

    
		INSERT INTO ctb_cuenta(id_periodo,id_tipo_cuenta,nombre_cuenta,descripcion_cuenta,codigo_contable,movimiento,naturaleza,bancos,es_de_retencion,estado_cuenta,id_usuario_crea,fecha_crea)
		SELECT idPeriodoNuevo,
					 c.id_tipo_cuenta,
					 c.nombre_cuenta,
					 c.descripcion_cuenta,
					 c.codigo_contable,
					 c.movimiento,
					 c.naturaleza,
					 c.bancos,
					 c.es_de_retencion,
					 c.estado_cuenta,
					 idUsuario,
					 NOW()
			FROM ctb_cuenta c
		 WHERE c.id_periodo = idPeriodoAnterior
			 AND c.estado_cuenta = 'A';

		
		INSERT INTO ctb_cuenta_general(id_periodo, id_cuenta, id_tipo_cuenta_general)
		SELECT idPeriodoNuevo,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = g.id_cuenta)) AS id_cuenta,
						 g.id_tipo_cuenta_general
				FROM ctb_cuenta_general g
			 WHERE g.id_periodo = idPeriodoAnterior;

		
		INSERT INTO ctb_impuesto_x_utilidad(id_periodo, fraccion_basica,exceso_hasta,imp_fraccion_basica,imp_fraccion_exceso,id_usuario_crea,fecha_crea)
		SELECT idPeriodoNuevo,
					 fraccion_basica,
					 exceso_hasta,
					 imp_fraccion_basica,
					 imp_fraccion_exceso,
					 idUsuario,
					 NOW()
			FROM ctb_impuesto_x_utilidad
		 WHERE id_periodo = idPeriodoAnterior;
		 
		
		INSERT INTO ctb_linea_reporte(id_periodo, id_cuenta, tipo_reporte, linea_reporte)
		SELECT idPeriodoNuevo,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = g.id_cuenta)) AS id_cuenta,
					 g.tipo_reporte,
					 g.linea_reporte																													
			FROM ctb_linea_reporte g
		 WHERE g.id_periodo = idPeriodoAnterior;
		 
		
		INSERT INTO ctb_parametro(id_periodo, id_tipo_parametro, parametro_texto, parametro_entero, parametro_decimal,id_usuario_crea,fecha_crea)
		SELECT idPeriodoNuevo,
					 g.id_tipo_parametro,
					 g.parametro_texto,
					 g.parametro_entero,
					 g.parametro_decimal,
					 idUsuario,
					 NOW()
			FROM ctb_parametro g
		 WHERE g.id_periodo = idPeriodoAnterior;
		 
		
		INSERT INTO fac_cuenta_x_cliente(id_periodo, id_cliente_factura, id_cuenta_fp_noinmediata, id_cuenta_fp_inmediata, id_cuenta_anticipo)
		SELECT idPeriodoNuevo,
					 c.id_cliente_factura,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = c.id_cuenta_fp_noinmediata)) AS id_cuenta_fp_noinmediata,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = c.id_cuenta_fp_inmediata)) AS id_cuenta_fp_inmediata,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = c.id_cuenta_anticipo)) AS id_cuenta_anticipo 
			FROM fac_cuenta_x_cliente c
			WHERE c.id_periodo = idPeriodoAnterior;

		
		INSERT INTO prd_cuenta_x_impuesto(id_periodo, id_impuesto, id_cuenta_venta, id_cuenta_compra)
		SELECT idPeriodoNuevo,
					 id_impuesto,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = cxi.id_cuenta_venta)) AS id_cuenta_venta,
						(SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = cxi.id_cuenta_compra)) AS id_cuenta_compra 
		 FROM prd_cuenta_x_impuesto cxi
		WHERE cxi.id_periodo = idPeriodoAnterior;

		
		INSERT INTO prd_cuenta_x_insumo(id_periodo, id_insumo, id_cuenta_insumo)
		SELECT idPeriodoNuevo,
					 id_insumo,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = cxi.id_cuenta_insumo)) AS id_cuenta_insumo 
		 FROM prd_cuenta_x_insumo cxi
		WHERE id_periodo = idPeriodoAnterior;

		
		INSERT INTO prd_cuenta_x_producto(id_periodo, id_producto, id_cuenta_producto)
		SELECT idPeriodoNuevo,
					 cxp.id_producto,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = cxp.id_cuenta_producto)) AS id_cuenta_producto 
			FROM prd_cuenta_x_producto cxp
		 WHERE cxp.id_periodo = idPeriodoAnterior;

		
		INSERT INTO prv_cuenta_x_proveedor(id_periodo, id_proveedor, id_cuenta_fp_noinmediata, id_cuenta_fp_inmediata, id_cuenta_anticipo)
		SELECT idPeriodoNuevo,
					 cxp.id_proveedor,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = cxp.id_cuenta_fp_noinmediata)) AS id_cuenta_fp_noinmediata,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = cxp.id_cuenta_fp_inmediata)) AS id_cuenta_fp_inmediata,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = cxp.id_cuenta_anticipo)) AS id_cuenta_anticipo 
			FROM prv_cuenta_x_proveedor cxp
		 WHERE cxp.id_periodo = idPeriodoAnterior;
		 
		 
		
		INSERT INTO ctb_tipo_retencion_x_cuenta (id_periodo, id_tipo_retencion, id_cuenta_credito, id_cuenta_retencion, id_usuario_crea, fecha_crea)
		SELECT idPeriodoNuevo,
					 r.id_tipo_retencion,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = r.id_cuenta_credito)) AS cuenta_credito,
					 (SELECT c.id_cuenta 
							FROM ctb_cuenta c 
						 WHERE c.id_periodo = idPeriodoNuevo
							 AND c.codigo_contable = (SELECT t.codigo_contable
																					FROM ctb_cuenta t
																				 WHERE t.id_periodo = idPeriodoAnterior
																					 AND t.id_cuenta = r.id_cuenta_retencion)) AS cuenta_retencion,
					 idUsuario,
					 NOW()					 
		  FROM ctb_tipo_retencion_x_cuenta r
		 WHERE r.id_periodo = idPeriodoAnterior;
		 
		 
		 INSERT INTO ctb_cuenta_x_cuenta_bancaria(id_periodo, id_cuenta_bancaria, id_cuenta, id_usuario_crea, fecha_crea)
		 SELECT idPeriodoNuevo,
						b.id_cuenta_bancaria,
						(SELECT c.id_cuenta 
							 FROM ctb_cuenta c 
						  WHERE c.id_periodo = idPeriodoNuevo
							  AND c.codigo_contable = (SELECT t.codigo_contable
																					 FROM ctb_cuenta t
																				  WHERE t.id_periodo = idPeriodoAnterior
																					  AND t.id_cuenta = b.id_cuenta)) AS cuenta_x_cta_banco,
						idUsuario,
						NOW()
		   FROM ctb_cuenta_x_cuenta_bancaria b
		  WHERE b.id_periodo = idPeriodoAnterior;
		 
		UPDATE ctb_periodo SET estado_periodo = 'A' WHERE id_periodo = idPeriodoNuevo;

    RETURN correcto;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fAnticipoProforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fAnticipoProforma`(idProforma INT(11)) RETURNS decimal(15,6)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE anticipo   DECIMAL(15,6);


	SELECT SUM(a.valor)
		INTO anticipo
		FROM res_reserva r, crt_anticipo a
		WHERE r.id_reserva = a.id_reserva
	 AND r.id_importado_de = idProforma
	 AND a.tipo_anticipo = 'C'
	 AND a.estado_anticipo != 'X'
	 AND a.fecha_anticipo <= DATE(NOW());

  RETURN anticipo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fAnticipoReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fAnticipoReserva`(idReserva INT) RETURNS decimal(15,8)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE totalAnticipo DECIMAL(15,8);

	SELECT SUM(a.valor)
	  INTO totalAnticipo
    FROM crt_anticipo a
   WHERE a.id_reserva = idReserva
     AND a.estado_anticipo != 'X'
     AND a.tipo_anticipo = 'C';

  RETURN totalAnticipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fBorraFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fBorraFactura`(idFactura INT) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  
		
		DELETE FROM rst_forma_pago_comanda WHERE id_pedido_comanda IN (SELECT p.id_pedido_comanda FROM rst_pedido_comanda p WHERE p.id_factura = idFactura);
		DELETE FROM rst_detalle_valor_comanda WHERE id_pedido_comanda IN (SELECT p.id_pedido_comanda FROM rst_pedido_comanda p WHERE p.id_factura = idFactura);
		DELETE FROM rst_pedido_comanda WHERE id_factura = idFactura;

    
    DELETE FROM fac_detalle_valor_x_insumo WHERE id_insumo_x_itinerario_fac IN (SELECT ixi.id_insumo_x_itinerario_fac 
																																									FROM fac_detalle_factura d, fac_itinerario i, fac_insumo_x_itinerario ixi
																																								 WHERE i.id_detalle_factura = d.id_detalle_factura
																																								   AND i.id_itinerario_fac = ixi.id_itinerario_fac
																																									 AND d.id_factura = idFactura);
    DELETE FROM fac_insumo_x_itinerario WHERE id_itinerario_fac IN (SELECT i.id_itinerario_fac 
																																			FROM fac_itinerario i, fac_detalle_factura d 
																																		 WHERE i.id_detalle_factura = d.id_detalle_factura
																																		   AND d.id_factura = idFactura);
	  DELETE FROM fac_itinerario WHERE id_detalle_factura IN (SELECT d.id_detalle_factura FROM fac_detalle_factura d WHERE d.id_factura = idFactura);

	  
    DELETE 
      FROM fac_detalle_valor_x_producto
     WHERE id_detalle_factura IN (SELECT id_detalle_factura
                                    FROM fac_detalle_factura
                                   WHERE id_factura = idFactura);

    DELETE 
      FROM fac_detalle_factura
     WHERE id_factura = idFactura;

    DELETE 
      FROM fac_detalle_valor
     WHERE id_factura = idFactura;

    DELETE 
      FROM fac_forma_pago
     WHERE id_factura = idFactura;

    DELETE 
      FROM fac_factura
     WHERE id_factura = idFactura;

    RETURN TRUE;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fBorraReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fBorraReserva`(pnIdReserva FLOAT, borraCabecera BOOLEAN) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN

    DELETE FROM res_persona_x_reserva_x_producto
     WHERE id_detalle_reserva IN (SELECT prd.id_detalle_reserva
                                       FROM res_detalle_reserva prd
                                      WHERE prd.id_reserva = pnIdReserva);

		DELETE FROM res_idioma_x_itinerario
		 WHERE id_itinerario_res IN
               (SELECT iti.id_itinerario_res
                  FROM res_itinerario iti
                 WHERE iti.id_detalle_reserva IN
                           (SELECT prd.id_detalle_reserva
                              FROM res_detalle_reserva prd
                             WHERE prd.id_reserva = pnIdReserva));

    DELETE FROM res_insumo_x_itinerario
     WHERE id_itinerario_res IN
               (SELECT iti.id_itinerario_res
                  FROM res_itinerario iti
                 WHERE iti.id_detalle_reserva IN
                           (SELECT prd.id_detalle_reserva
                              FROM res_detalle_reserva prd
                             WHERE prd.id_reserva = pnIdReserva));

    DELETE FROM res_itinerario
     WHERE id_detalle_reserva IN (SELECT prd.id_detalle_reserva
                                       FROM res_detalle_reserva prd
                                      WHERE prd.id_reserva = pnIdReserva);

    DELETE FROM res_detalle_comanda
     WHERE id_comanda IN (SELECT id_comanda
                            FROM res_comanda
                           WHERE id_reserva = pnIdReserva);

    DELETE FROM res_comanda
     WHERE id_reserva = pnIdReserva;

    DELETE FROM res_persona_x_reserva_x_producto
     WHERE id_detalle_reserva IN (SELECT prd.id_detalle_reserva
                                       FROM res_detalle_reserva prd
                                      WHERE prd.id_reserva = pnIdReserva);

    DELETE FROM res_detalle_valor_prd
     WHERE id_detalle_reserva IN (SELECT prd.id_detalle_reserva
                                       FROM res_detalle_reserva prd
                                      WHERE prd.id_reserva = pnIdReserva);

    DELETE FROM res_detalle_reserva
     WHERE id_reserva = pnIdReserva;

    
    IF borraCabecera = TRUE THEN
      DELETE FROM crt_anticipo
       WHERE id_reserva = pnIdReserva;

      DELETE FROM res_registro_estado
       WHERE id_reserva = pnIdReserva;

      DELETE FROM res_persona_x_reserva
       WHERE id_reserva = pnIdReserva;

      DELETE FROM res_reserva
       WHERE id_reserva = pnIdReserva;
    END IF;

    RETURN TRUE;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCadenaConfirmaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCadenaConfirmaProveedor`(pnIdReserva INT, pnIdProveedor INT, pnIdInsumo INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcConfirmaciones        TEXT;
    DECLARE vcConfirma         VARCHAR(500);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   CHAR(1);

    DECLARE
      cur1 CURSOR FOR
        SELECT IFNULL(ixi.codigo_confirma_proveedor, '')
					FROM res_detalle_reserva pxr, res_itinerario i, res_insumo_x_itinerario ixi
					WHERE pxr.id_reserva = pnIdReserva
						AND ixi.id_proveedor = pnIdProveedor
						AND ixi.id_insumo = pnIdInsumo
						AND pxr.id_detalle_reserva = i.id_detalle_reserva
						AND i.id_itinerario_res = ixi.id_itinerario_res;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcConfirmaciones   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcConfirma;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = ' | ';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcConfirmaciones   = CONCAT(vcConfirmaciones, vcSeparador, vcConfirma);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcConfirmaciones;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCadenaFormasPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCadenaFormasPago`(idFactura INT(11)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE vcFormasPago   VARCHAR(256);
  DECLARE vcFormaPago    VARCHAR(100);
  DECLARE viDone        INT DEFAULT 0;
  DECLARE viCuenta      INT DEFAULT 0;
  DECLARE vcSeparador   CHAR(1);

	DECLARE
	cur1 CURSOR FOR
		SELECT CONCAT_WS('~', t.descripcion_tipo_forma_pago, IFNULL(fNombrePersona(b.id_persona),''), IFNULL(b.numero_cuenta_bancaria,''), IFNULL(d.nro_cheque,''), IFNULL(d.nro_deposito,''), ROUND(IFNULL(d.valor,0),2))
			FROM fac_forma_pago p, fac_tipo_forma_pago t, crt_detalle_cobro_pago d
			LEFT JOIN ctb_cuenta_bancaria b ON b.id_cuenta_bancaria = d.id_cuenta_bancaria
		 WHERE p.id_tipo_forma_pago = t.id_tipo_forma_pago
		   AND d.id_forma_pago = p.id_forma_pago
			 AND p.id_factura = idFactura;

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
	SET vcFormasPago = '';

	OPEN cur1;

	REPEAT
		FETCH cur1 INTO vcFormaPago;

		SET viCuenta = viCuenta + 1;

		IF NOT viDone
		THEN
			IF viCuenta > 1
			THEN
				SET vcSeparador = '|';
			ELSE
				SET vcSeparador = '';
			END IF;

			SET vcFormasPago = CONCAT(vcFormasPago, vcSeparador, vcFormaPago);
		END IF;
	UNTIL viDone
	END REPEAT;

	CLOSE cur1;

	RETURN vcFormasPago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCadenaImpuestoFac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCadenaImpuestoFac`(idFactura INT(11), porcentaje DECIMAL(15,6)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE vcImpuestos   VARCHAR(256);
    DECLARE vcImpuesto    VARCHAR(100);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   CHAR(1);
    DECLARE
      cur1 CURSOR FOR
        SELECT CONCAT(v.id_impuesto, '~', ROUND(v.valor * (porcentaje / 100),2)) AS valor
					FROM fac_detalle_valor v
				 WHERE id_factura = idFactura
					 AND v.tipo_detalle_valor = 'I'
					 AND v.suprime_impuesto = 'N' ;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcImpuestos   = '';
    OPEN cur1;
    REPEAT
      FETCH cur1 INTO vcImpuesto;
      SET viCuenta   = viCuenta + 1;
      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '|';
        ELSE
          SET vcSeparador   = '';
        END IF;
        SET vcImpuestos   = CONCAT(vcImpuestos, vcSeparador, vcImpuesto);
      END IF;
    UNTIL viDone
    END REPEAT;
    CLOSE cur1;
    RETURN vcImpuestos;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCadenaObservacionInsumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCadenaObservacionInsumo`(pnIdReserva INT, pnIdProveedor INT, pnIdInsumo INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcObservaciones        TEXT;
    DECLARE vcObservacion         VARCHAR(500);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   CHAR(1);

    DECLARE
      cur1 CURSOR FOR
        SELECT IFNULL(ixi.observacion_insumo, '')
					FROM res_detalle_reserva pxr, res_itinerario i, res_insumo_x_itinerario ixi
					WHERE pxr.id_reserva = pnIdReserva
						AND ixi.id_proveedor = pnIdProveedor
						AND ixi.id_insumo = pnIdInsumo
						AND pxr.id_detalle_reserva = i.id_detalle_reserva
						AND i.id_itinerario_res = ixi.id_itinerario_res;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcObservaciones   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcObservacion;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = ' | ';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcObservaciones   = CONCAT(vcObservaciones, vcSeparador, vcObservacion);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcObservaciones;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCadenaRetencionFac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCadenaRetencionFac`(idFactura INT(11)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE idRetencion   INT;
  DECLARE nroRetencion  VARCHAR(100);
  DECLARE vcImpuestos   VARCHAR(256);
	DECLARE vcImpuesto    VARCHAR(100);
	DECLARE viDone        INT DEFAULT 0;
	DECLARE viCuenta      INT DEFAULT 0;
	DECLARE vcSeparador   CHAR(1);
	DECLARE
		cur1 CURSOR FOR
			SELECT r.id_retencion,
						 CONCAT(r.establecimiento_ats,r.punto_emision_ats,r.nro_retencion),
						 CONCAT_WS('~', fObtTipo(d.id_tipo_retencion, 'TRT'),d.base_imponible,d.valor_retencion,t.tipo_retencion)
				FROM ctb_retencion r, ctb_detalle_retencion d, ctb_tipo_retencion t
			 WHERE r.id_retencion = d.id_retencion
			   AND d.id_tipo_retencion = t.id_tipo_retencion
			   AND r.id_factura = idFactura
			   AND r.estado_retencion = 'PRC'
			 ORDER BY t.tipo_retencion;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
	SET vcImpuestos = '';
	SET idRetencion = 0;
	SET nroRetencion = '';
	OPEN cur1;
	REPEAT
		FETCH cur1 INTO idRetencion, nroRetencion, vcImpuesto;
		SET viCuenta = viCuenta + 1;
		IF NOT viDone THEN
			IF viCuenta > 1 THEN
				SET vcSeparador   = '|';
			ELSE
				SET vcSeparador   = '';
			END IF;
			SET vcImpuestos   = CONCAT(vcImpuestos, vcSeparador, vcImpuesto);
		END IF;
	UNTIL viDone
	END REPEAT;
	CLOSE cur1;
	IF idRetencion != 0 THEN
	  SET vcImpuestos = CONCAT(idRetencion,'~',nroRetencion,'|',vcImpuestos);
	END IF;
	RETURN vcImpuestos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCalculaCostoInsumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCalculaCostoInsumos`(pcIdProducto VARCHAR(15), pnNroPax INT, pnCapacidadMin FLOAT, pdFechaIni DATE, pdFechaFin DATE) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
		DECLARE vnCosto DECIMAL(15,4) DEFAULT 0;
		DECLARE vnCalculoUtilidad DECIMAL(15,4) DEFAULT 0;
		DECLARE vnCostoTotal DECIMAL(15,4) DEFAULT 0;
		DECLARE vnImpuesto DECIMAL(15,4) DEFAULT 0;
    
		DECLARE vnPorcImp DECIMAL(15,4);
		DECLARE vnValImp DECIMAL(15,4);
		DECLARE vnCantidadInsumo DECIMAL(15,4);
		DECLARE vnUtilidadXInsumo DECIMAL(15,4);
		DECLARE vnCostoItem DECIMAL(15,4);
		DECLARE vcIndividualGeneral CHAR(1);
		DECLARE vnPorcionXMedida DECIMAL(15,4);
		DECLARE viIdTipoInsumo INT;
		DECLARE viIdInsumo INT;
		DECLARE viDone INT DEFAULT 0;
		DECLARE cur1 CURSOR FOR
		SELECT IFNULL((SELECT SUM(i.cantidad_impuesto)
     									FROM prd_impuesto_x_insumo ixi, prd_impuesto i
     								 WHERE ixi.id_impuesto = i.id_impuesto
											 AND i.tipo_impuesto = 'P'
											 AND ixi.id_insumo = ixti.id_insumo),
     							 0
     			 ) AS porcentaje_impuesto,
     			 IFNULL((SELECT SUM(i.cantidad_impuesto)
     									FROM prd_impuesto_x_insumo ixi, prd_impuesto i
     								 WHERE ixi.id_impuesto = i.id_impuesto
											 AND i.tipo_impuesto = 'V'
											 AND ixi.id_insumo = ixti.id_insumo),
     							 0
     			 ) AS valor_impuesto,
     			 IFNULL(ixti.cantidad_insumo_producto, 0) AS cantidad_insumo_producto,
     			 IFNULL(ixti.utilidad_x_insumo, 0) AS utilidad_x_insumo,
           IF(ixti.id_insumo IS NOT NULL,
									(IFNULL(IF(ixti.tipo_precio='L',
                       	  (SELECT p.precio_insumo
                       	     FROM prd_precio_insumo p
                            WHERE p.id_insumo = ixti.id_insumo
                       	      AND p.id_precio_insumo = ixti.id_precio_insumo), ixti.precio_fijo),
           fObtPrecioInsumo(ixti.id_insumo)) * ixti.factor_precio),
           fObtInsumosProducto(ixti.id_tipo_insumo, pnNroPax, IFNULL(ixti.cantidad_insumo_producto, 0), IFNULL(ixti.utilidad_x_insumo, 0), pdFechaIni, pdFechaFin))  AS precio_fijo,
           IFNULL((SELECT m.individual_general FROM prd_insumo m WHERE m.id_insumo = ixti.id_insumo), 'I') AS individual_general,
           IFNULL((SELECT m.porcion_x_medida FROM prd_insumo m WHERE m.id_insumo = ixti.id_insumo), 1) AS porcion_x_medida,
           ixti.id_tipo_insumo,
           ixti.id_insumo
     	FROM prd_itinerario iti, prd_insumo_x_itinerario ixti
      WHERE iti.id_itinerario = ixti.id_itinerario
     	  AND iti.id_producto = pcIdProducto
     	  AND ixti.tipo_insumo_x_itinerario = 'I';
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone = 1;
		
		OPEN cur1;
			FETCH cur1 INTO vnPorcImp,vnValImp,vnCantidadInsumo,vnUtilidadXInsumo,vnCostoItem,vcIndividualGeneral,vnPorcionXMedida,viIdTipoInsumo,viIdInsumo;
			WHILE viDone = 0 DO
				IF viIdInsumo IS NOT NULL THEN
					SET vnCosto = vnCostoItem / vnPorcionXMedida;
					SET vnImpuesto = (vnCosto * vnPorcImp / 100) + (vnValImp / vnPorcionXMedida);
					SET vnCosto = vnCosto + vnImpuesto;
					IF vnUtilidadXInsumo > 0 THEN
						SET vnCosto = vnCosto / vnUtilidadXInsumo;
					END IF;
					IF vcIndividualGeneral = 'G' THEN
						SET vnCantidadInsumo = 1;
					ELSE
					  IF vnCantidadInsumo = 0 THEN	
							SET vnCantidadInsumo = pnNroPax;
						END IF;
						IF vnCantidadInsumo = 0 THEN	
							SET vnCantidadInsumo = pnCapacidadMin;
						END IF;
					END IF;
					SET vnCosto = vnCosto * vnCantidadInsumo;
					SET vnCostoTotal = vnCostoTotal + vnCosto;
				END IF;
				IF viIdTipoInsumo IS NOT NULL AND viIdInsumo IS NULL THEN
					SET vnCostoTotal = vnCostoTotal + vnCostoItem;
				END IF;
				FETCH cur1 INTO vnPorcImp,vnValImp,vnCantidadInsumo,vnUtilidadXInsumo,vnCostoItem,vcIndividualGeneral,vnPorcionXMedida,viIdTipoInsumo,viIdInsumo;
			END WHILE;
		CLOSE cur1;
		RETURN vnCostoTotal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCalculaPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCalculaPrecio`(pcIdProducto VARCHAR(15), pnNroPax INT, pcSumaImpuestos CHAR(1), pcSumaUtilidad CHAR(1), pdFechaIni DATE, pdFechaFin DATE) RETURNS varchar(15) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    
		DECLARE vcTipoPrecio CHAR(1);
		DECLARE vcIdTipoProducto VARCHAR(15);
		DECLARE vnPrecioFijo DECIMAL(15,4);
		DECLARE vnPorcUtilidad DECIMAL(15,4);
		DECLARE vnCapacidadMin DECIMAL(15,4);
		DECLARE vnPrecio DECIMAL(15,4) DEFAULT 0;
		DECLARE vnCostoProducto DECIMAL(15,4);
		DECLARE vnTotalImpuestos DECIMAL(15,4);
		DECLARE vnComisionFija DECIMAL(15,4);
		DECLARE vcIdPrecioProducto VARCHAR(15);
		
		SELECT p.tipo_precio,
		       IFNULL(p.precio_sin_utilidad,0),
		       IFNULL(p.porcentaje_utilidad,0),
		       IFNULL(p.capacidad_minima,0),
		       IFNULL(p.comision_fija,0)
		  INTO vcTipoPrecio, vnPrecioFijo, vnPorcUtilidad, vnCapacidadMin, vnComisionFija
			FROM prd_producto p
		 WHERE p.id_producto = pcIdProducto;
  	IF vcTipoPrecio = 'F' THEN
			SET vnPrecio = vnPrecioFijo;
		END IF;
		IF vcTipoPrecio = 'T' THEN
			SELECT pxt.precio
			  INTO vnPrecio
				FROM prd_producto_x_precio_producto pxpp, prd_precio_producto pp, prd_precio_x_temporada pxt, prd_temporada t
			 WHERE pxpp.id_producto = pcIdProducto
				 AND t.principal_temporada = 'S'
				 AND pxpp.id_precio_producto = pp.id_precio_producto
				 AND pxt.id_precio_producto = pp.id_precio_producto
				 AND pxt.id_temporada = t.id_temporada
				 AND pnNroPax BETWEEN pxt.pax_ini AND pxt.pax_fin
			LIMIT 0,1;
			IF vnPrecio IS NULL THEN
			  SELECT pxt.precio
					INTO vnPrecio
					FROM prd_producto_x_precio_producto pxpp, prd_precio_producto pp, prd_precio_x_temporada pxt, prd_temporada t
				 WHERE pxpp.id_producto = pcIdProducto
					 AND pxpp.id_precio_producto = pp.id_precio_producto
					 AND pxt.id_precio_producto = pp.id_precio_producto
					 AND pxt.id_temporada = t.id_temporada
					 AND pnNroPax BETWEEN pxt.pax_ini AND pxt.pax_fin
				ORDER BY t.fecha_inicio_temporada DESC
				LIMIT 0,1;
			END IF;
		END IF;
		IF vcTipoPrecio = 'C' THEN
			
			SET vnPrecio = fCalculaCostoInsumos(pcIdProducto, pnNroPax, vnCapacidadMin, pdFechaIni, pdFechaFin);
			SET vnPrecio = vnPrecio / pnNroPax;
		END IF;
		IF pcSumaUtilidad = 'S' AND vnPorcUtilidad > 0 THEN
			SET vnPrecio = vnPrecio + (vnPrecio / vnPorcUtilidad);
		END IF;
		SET vnPrecio = vnPrecio + vnComisionFija;
		IF pcSumaImpuestos = 'S' THEN
			SELECT SUM(IF(i.tipo_impuesto='P',(vnPrecio * i.cantidad_impuesto /100),i.cantidad_impuesto))
				INTO vnTotalImpuestos
				FROM prd_impuesto_x_producto p, prd_impuesto i
			 WHERE p.id_impuesto = i.id_impuesto 
				 AND p.id_producto = pcIdProducto;
			SET vnPrecio = vnPrecio + IFNULL(vnTotalImpuestos,0);
		END IF;
		RETURN ROUND(IFNULL(vnPrecio, 0),2);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCalculaPrecioDirecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCalculaPrecioDirecto`(pcModulo CHAR(3), pnIdDetalle INT) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
	
	DECLARE vcTipoPrecio CHAR(1);
	DECLARE vnIdMotivo DECIMAL(15,4);
	DECLARE vnComisionFija DECIMAL(15,4);
	DECLARE vnCantidad DECIMAL(15,4);
	DECLARE vnPrecio FLOAT;
	DECLARE vnPrecioFijo FLOAT;
	DECLARE vcIdProducto VARCHAR(15);
	DECLARE vnUtilidad DECIMAL(15,4);
	DECLARE vnIdPrecioXTemporada INT;
	DECLARE vnIdProductoXPrecio INT;
	DECLARE vcIdPrecioProducto VARCHAR(15);
	DECLARE vcEsSingleSuplement CHAR(1);
	DECLARE vnIdSingleSuplement INT;
	
	IF pcModulo = 'RES' THEN
		SELECT p.tipo_precio,
		       pxr.id_motivo_ingreso_manual,
		       IFNULL(pxr.comision_fija, 0) AS comision_fija,
		       pxr.cantidad_total,
		       p.id_producto,
		       IFNULL(pxr.porcentaje_utilidad, 0),
		       pxr.id_precio_x_temporada,
		       pxr.id_producto_x_precio_producto,
		       IFNULL(pxr.es_single_suplement, 'N'),
		       pxr.id_detalle_reserva_ss,
		       p.precio_sin_utilidad
		  INTO vcTipoPrecio, vnIdMotivo, vnComisionFija, vnCantidad, vcIdProducto, vnUtilidad, vnIdPrecioXTemporada, vnIdProductoXPrecio, vcEsSingleSuplement, vnIdSingleSuplement, vnPrecioFijo
		  FROM prd_producto p, res_detalle_reserva pxr
		 WHERE pxr.id_detalle_reserva = pnIdDetalle
		   AND p.id_producto = pxr.id_producto;
		
		IF IFNULL(vnIdMotivo,0) = 0 THEN
			
			IF vcTipoPrecio = 'T' THEN
			  IF IFNULL(vnIdPrecioXTemporada, 0) > 0 THEN
			    SELECT pxt.precio
			      INTO vnPrecio
			      FROM prd_precio_x_temporada pxt
			     WHERE pxt.id_precio_x_temporada = vnIdPrecioXTemporada;
			  ELSE
			    IF IFNULL(vnIdProductoXPrecio, 0) > 0 THEN
			      SELECT pp.id_precio_producto
				    INTO vcIdPrecioProducto
				    FROM prd_precio_producto pp, prd_producto_x_precio_producto pxpp
			       WHERE pp.id_precio_producto = pxpp.id_precio_producto
				     AND pxpp.id_producto_x_precio_producto = vnIdProductoXPrecio;
			      SET vnPrecio = fObtPrecioProducto(vcIdPrecioProducto);
			    ELSE
			      SET vnPrecio = fObtPrecioProducto(fObtPrimerIdPrecioProducto(vcIdProducto, 0));
			    END IF;
			  END IF;
			END IF;
			
			IF vcTipoPrecio = 'C' THEN
			  SELECT ROUND(SUM(ixi.costo_real * ixi.cantidad_insumo),2) / vnCantidad
			    INTO vnPrecio
			    FROM res_itinerario i, res_insumo_x_itinerario ixi
			   WHERE i.id_itinerario_res = ixi.id_itinerario_res
			     AND i.id_detalle_reserva = pnIdDetalle;
			END IF;
			
			IF vcEsSingleSuplement = 'S' THEN
			  SELECT IFNULL(dp.porcentaje_utilidad, 0)
			    INTO vnUtilidad
			    FROM res_detalle_reserva dp
			   WHERE dp.id_detalle_reserva = vnIdSingleSuplement;
			END IF;
		END IF;
	END IF;
	
	IF pcModulo = 'FAC' THEN
	  SELECT p.tipo_precio,
					 df.id_motivo_ingreso_manual,
					 IFNULL(df.comision_fija, 0),
					 df.cantidad_total,
					 p.id_producto,
					 IFNULL(df.porcentaje_utilidad, 0),
					 df.id_precio_x_temporada,
					 df.id_producto_x_precio_producto,
					 IFNULL(df.es_single_suplement, 'N'),
					 df.id_detalle_factura_ss,
		       p.precio_sin_utilidad
			INTO vcTipoPrecio, vnIdMotivo, vnComisionFija, vnCantidad, vcIdProducto, vnUtilidad, vnIdPrecioXTemporada, vnIdProductoXPrecio, vcEsSingleSuplement, vnIdSingleSuplement, vnPrecioFijo
			FROM prd_producto p, fac_detalle_factura df
		 WHERE df.id_detalle_factura = pnIdDetalle
			 AND p.id_producto = df.id_producto;
		IF IFNULL(vnIdMotivo,0) = 0 THEN
			
			IF vcTipoPrecio = 'T' THEN
				IF IFNULL(vnIdPrecioXTemporada, 0) > 0 THEN
					SELECT pxt.precio
						INTO vnPrecio
						FROM prd_precio_x_temporada pxt
					 WHERE pxt.id_precio_x_temporada = vnIdPrecioXTemporada;
				ELSE
					IF IFNULL(vnIdProductoXPrecio, 0) > 0 THEN
						SELECT pp.id_precio_producto
							INTO vcIdPrecioProducto
							FROM prd_precio_producto pp, prd_producto_x_precio_producto pxpp
						 WHERE pp.id_precio_producto = pxpp.id_precio_producto
							 AND pxpp.id_producto_x_precio_producto = vnIdProductoXPrecio;
						SET vnPrecio = fObtPrecioProducto(vcIdPrecioProducto);
					ELSE
						SET vnPrecio = fObtPrecioProducto(fObtPrimerIdPrecioProducto(vcIdProducto, 0));
					END IF;
				END IF;
			END IF;
			
			IF vcTipoPrecio = 'C' THEN
			  SELECT ROUND(SUM((IFNULL(v.cantidad_insumo, 0) * v.costo) / vnCantidad), 2)
				INTO vnPrecio
				FROM (SELECT n.id_insumo,
										 n.cantidad_insumo,
										 IF(IFNULL(n.utilidad_x_insumo, 0) > 0,
												(IFNULL(n.costo_real, 0) / n.utilidad_x_insumo),
												 IFNULL(n.costo_real, 0)) AS costo
							 FROM fac_itinerario i, fac_insumo_x_itinerario n
					    WHERE i.id_itinerario_fac = n.id_itinerario_fac
								AND i.id_detalle_factura = pnIdDetalle) v;
			END IF;
			
			IF vcEsSingleSuplement = 'S' THEN
				SELECT IFNULL(dp.porcentaje_utilidad, 0)
				  INTO vnUtilidad
				  FROM fac_detalle_factura dp
				 WHERE dp.id_detalle_factura = vnIdSingleSuplement;
			END IF;
		END IF;
	END IF;
	
	IF pcModulo = 'PRF' THEN
		SELECT p.tipo_precio,
					 df.id_motivo_ingreso_manual,
					 IFNULL(df.comision_fija, 0),
					 df.cantidad_total,
					 p.id_producto,
					 IFNULL(df.porcentaje_utilidad, 0),
					 df.id_precio_x_temporada,
					 df.id_producto_x_precio_producto,
					 IFNULL(df.es_single_suplement, 'N'),
					 df.id_detalle_proforma_ss,
		       p.precio_sin_utilidad
		  INTO vcTipoPrecio, vnIdMotivo, vnComisionFija, vnCantidad, vcIdProducto, vnUtilidad, vnIdPrecioXTemporada, vnIdProductoXPrecio, vcEsSingleSuplement, vnIdSingleSuplement, vnPrecioFijo
			FROM prd_producto p, fac_detalle_proforma df
	   WHERE df.id_detalle_proforma = pnIdDetalle
			 AND p.id_producto = df.id_producto;
	  IF IFNULL(vnIdMotivo,0) = 0 THEN
			
			IF vcTipoPrecio = 'T' THEN
			  IF IFNULL(vnIdPrecioXTemporada, 0) > 0 THEN
					SELECT pxt.precio
						INTO vnPrecio
						FROM prd_precio_x_temporada pxt
					 WHERE pxt.id_precio_x_temporada = vnIdPrecioXTemporada;
				ELSE
					IF IFNULL(vnIdProductoXPrecio, 0) > 0 THEN
						SELECT pp.id_precio_producto
							INTO vcIdPrecioProducto
							FROM prd_precio_producto pp, prd_producto_x_precio_producto pxpp
						 WHERE pp.id_precio_producto = pxpp.id_precio_producto
							 AND pxpp.id_producto_x_precio_producto = vnIdProductoXPrecio;
						SET vnPrecio = fObtPrecioProducto(vcIdPrecioProducto);
					ELSE
						SET vnPrecio = fObtPrecioProducto(fObtPrimerIdPrecioProducto(vcIdProducto, 0));
					END IF;
				END IF;
			END IF;
			
			IF vcTipoPrecio = 'C' OR vcEsSingleSuplement = 'S' THEN
				SELECT ROUND(SUM((IFNULL(v.cantidad_insumo, 0) * v.costo) / vnCantidad), 2)
				INTO vnPrecio
				FROM (SELECT n.id_insumo,
										 n.cantidad_insumo,
										 IF(IFNULL(n.utilidad_x_insumo, 0) > 0,
												(IFNULL(n.costo_real, 0) / n.utilidad_x_insumo),
												 IFNULL(n.costo_real, 0)) AS costo
								FROM fac_itinerario i, fac_insumo_x_itinerario n
							 WHERE i.id_itinerario_fac = n.id_itinerario_fac
								 AND i.id_detalle_proforma = pnIdDetalle) v;
			END IF;
			
			IF vcEsSingleSuplement = 'S' THEN
				SELECT IFNULL(dp.porcentaje_utilidad, 0)
					INTO vnUtilidad
					FROM fac_detalle_proforma dp
				 WHERE dp.id_detalle_proforma = vnIdSingleSuplement;
			END IF;
		END IF;
	END IF;
	IF IFNULL(vnIdMotivo,0) = 0 THEN
		IF vcTipoPrecio = 'F' THEN
			SET vnPrecio = vnPrecioFijo;
		END IF;
		IF vnUtilidad > 0 THEN
			SET vnPrecio = vnPrecio + (vnPrecio * vnUtilidad / 100);
		END IF;
		SET vnPrecio = vnPrecio + vnComisionFija;
	END IF;
	RETURN vnPrecio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCalculaPrecioInsumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCalculaPrecioInsumo`(idInsumo INT, pTipoPrecio CHAR(1), fecha DATE) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE tipoPrecio CHAR(1);
    DECLARE precio FLOAT;
    DECLARE impuestoValor FLOAT;
    DECLARE impuestoPorcentaje FLOAT;
    
    IF pTipoPrecio = '' OR pTipoPrecio IS NULL THEN
      SELECT i.tipo_precio_insumo
        INTO tipoPrecio
				FROM prd_insumo i
			WHERE i.id_insumo = idInsumo;
    ELSE
			SET tipoPrecio = pTipoPrecio;
    END IF;
    
    IF tipoPrecio = 'L' THEN
			SELECT p.precio_insumo
				INTO precio
				FROM prd_precio_insumo p
			 WHERE p.id_insumo = idInsumo
				 AND p.principal_precio_insumo = 'S';
				
			SELECT IFNULL(SUM(s.cantidad_impuesto), 0)
			  INTO impuestoValor
			  FROM prd_impuesto s, prd_impuesto_x_insumo ixi
			 WHERE s.id_impuesto = ixi.id_impuesto
				 AND ixi.id_insumo = idInsumo
				 AND s.tipo_impuesto = 'V';
			
			SELECT SUM(IFNULL(IF(s.tipo_valor = 'R',
													  (SELECT r.porcentaje
														  FROM prd_rango_impuesto r
														 WHERE r.id_impuesto = ixi.id_impuesto
														   AND DATE(NOW()) BETWEEN r.fecha_inicio AND r.fecha_fin),
													  s.cantidad_impuesto),0))
			  INTO impuestoPorcentaje
				FROM prd_impuesto s, prd_impuesto_x_insumo ixi
			 WHERE s.id_impuesto = ixi.id_impuesto
				 AND ixi.id_insumo = idInsumo
				 AND s.tipo_impuesto = 'P';
				
			SET precio = precio + (precio * IFNULL(impuestoPorcentaje, 0) /100) + IFNULL(impuestoValor, 0);
				
		END IF;
		
		IF tipoPrecio = 'I' THEN
		  SET precio = 0;
		END IF;

    RETURN precio;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fCaracteristicasPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fCaracteristicasPersona`(pnIdPersona FLOAT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcCaracteristicas   TEXT;
    DECLARE vcCaracteristica    TEXT;
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   CHAR(1);

    DECLARE
      cur1 CURSOR FOR
        SELECT CONCAT(t.descripcion_tipo_caracteristica,': ',c.descripcion_caracteristica) AS caracteristica
					FROM per_caracteristica c, per_tipo_caracteristica t
				 WHERE c.id_tipo_caracteristica = t.id_tipo_caracteristica
					 AND c.id_persona = pnIdPersona;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcCaracteristicas   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcCaracteristica;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = ';';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcCaracteristicas   = CONCAT(vcCaracteristicas, vcSeparador, vcCaracteristica);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcCaracteristicas;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fClasificaRangoEdad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fClasificaRangoEdad`(edad INT) RETURNS varchar(25) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE rango VARCHAR(25);

	IF edad >= 0 AND edad <= 11 THEN
	  SET rango = '0 - 11';
	ELSEIF edad >= 12 AND edad <= 18 THEN
	  SET rango = '12 - 18';
	ELSEIF edad >= 19 AND edad <= 25 THEN
	  SET rango = '19 - 25';
	ELSEIF edad >= 26 AND edad <= 35 THEN
	  SET rango = '26 - 35';
	ELSEIF edad >= 36 AND edad <= 50 THEN
	  SET rango = '36 - 50';
	ELSEIF edad >= 51 AND edad <= 65 THEN
	  SET rango = '51 - 65';
	ELSEIF edad >= 66 AND edad <= 80 THEN
	  SET rango = '66 - 80';
	ELSEIF edad >= 81 THEN
	  SET rango = '81+';
	ELSEIF edad < 0 THEN
	  SET rango = '<0';
	END IF;

  RETURN rango;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fEliminaComprobanteContable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fEliminaComprobanteContable`(pnIdComprobante INT) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DELETE FROM ctb_lote_envio_sri WHERE id_retencion = (SELECT id_retencion FROM ctb_retencion WHERE id_comprobante = pnIdComprobante);
    DELETE FROM ctb_detalle_retencion WHERE id_det_comprobante IN 
								(SELECT d.id_det_comprobante FROM ctb_det_comprobante d WHERE d.id_comprobante = pnIdComprobante);
		DELETE FROM ctb_retencion WHERE id_comprobante = pnIdComprobante;
		DELETE FROM ctb_archivo_comprobante WHERE id_comprobante = pnIdComprobante;
		DELETE FROM ctb_det_comprobante WHERE id_comprobante = pnIdComprobante;
		DELETE FROM ctb_comprobante WHERE id_comprobante = pnIdComprobante;
		RETURN TRUE;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fEliminaPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fEliminaPersona`(piIdPersona INT) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    
    DELETE FROM seg_usuario WHERE id_persona = piIdPersona;    
    DELETE FROM per_caracteristica WHERE id_persona = piIdPersona;
    DELETE FROM per_direccion WHERE id_persona = piIdPersona;
    DELETE FROM per_ficha_medica WHERE id_persona = piIdPersona;
    DELETE FROM per_identificacion WHERE id_persona = piIdPersona;
    DELETE FROM per_relacion WHERE id_persona = piIdPersona;
    DELETE FROM per_relacion WHERE id_persona2 = piIdPersona;
    DELETE FROM per_telefono WHERE id_persona = piIdPersona;
    DELETE FROM per_persona WHERE id_persona = piIdPersona;
		
    RETURN TRUE;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fEnviaCorreoSioNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fEnviaCorreoSioNo`(idUsuario VARCHAR(15), idAgencia INT, tipoBoton CHAR(1), idEmpresaRelacionada INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE resultado CHAR(1);
    DECLARE sincronizacion CHAR(1);
    DECLARE cuantos INT;
    DECLARE cuantos2 INT;
    DECLARE cuantos3 INT;
    DECLARE tipoEmpresa VARCHAR(4);
     
    SET resultado = 'N';
    
    SELECT IFNULL(activa_sincronizacion,'N')
      INTO sincronizacion
      FROM prm_empresa;
      
    SELECT IFNULL(p.id_tipo_empresa,'XXX')
      INTO tipoEmpresa
      FROM per_persona p, seg_usuario u
     WHERE u.id_usuario = idUsuario
       AND p.id_persona = u.id_persona;
    
    IF tipoEmpresa = 'UBI' THEN
      IF sincronizacion = 'S' THEN
				SELECT COUNT(*)
					INTO cuantos
					FROM crm_tipo_relacion_x_boton t, prm_sincronizacion s
				 WHERE t.tipo_boton = tipoBoton
					 AND s.id_empresa_relacionada = idEmpresaRelacionada
					 AND s.nombre_tabla = 'crm_tipo_relacion_x_boton'
					 AND t.id_tipo_relacion_x_boton = s.id_interno;
				 
				IF cuantos > 0 THEN
					SELECT COUNT(*)
						INTO cuantos2
						FROM seg_usuario u, per_relacion r, crm_tipo_relacion_x_boton t, prm_sincronizacion s
					 WHERE u.id_usuario = idUsuario
						 AND t.tipo_boton = tipoBoton
						 AND s.id_empresa_relacionada = idEmpresaRelacionada
						 AND r.id_persona2 = idAgencia
						 AND s.nombre_tabla = 'crm_tipo_relacion_x_boton'
						 AND u.id_persona = r.id_persona
						 AND r.id_tipo_relacion = t.id_tipo_relacion
						 AND t.id_tipo_relacion_x_boton = s.id_interno;
					IF cuantos2 > 0 THEN
						SET resultado = 'S';
					END IF;
				ELSE
					SELECT COUNT(*)
						INTO cuantos3
						FROM seg_usuario u, per_relacion r
					 WHERE u.id_usuario = idUsuario
						 AND r.id_persona2 = idAgencia
						 AND u.id_persona = r.id_persona;
					IF cuantos3 > 0 THEN
						SET resultado = 'S';
					END IF;
				END IF;
			ELSE
				SELECT COUNT(*)
					INTO cuantos
					FROM crm_tipo_relacion_x_boton t
				 WHERE t.tipo_boton = tipoBoton;
				IF cuantos > 0 THEN
					SELECT COUNT(*)
						INTO cuantos2
						FROM seg_usuario u, per_relacion r, crm_tipo_relacion_x_boton t
					 WHERE u.id_usuario = idUsuario
						 AND t.tipo_boton = tipoBoton
						 AND r.id_persona2 = idAgencia
						 AND u.id_persona = r.id_persona
						 AND r.id_tipo_relacion = t.id_tipo_relacion;
					IF cuantos2 > 0 THEN
						SET resultado = 'S';
					END IF;
				ELSE
					SELECT COUNT(*)
						INTO cuantos3
						FROM seg_usuario u, per_relacion r
					 WHERE u.id_usuario = idUsuario
						 AND r.id_persona2 = idAgencia
						 AND u.id_persona = r.id_persona;
					IF cuantos3 > 0 THEN
						SET resultado = 'S';
					END IF;
				END IF; 
			END IF;
		ELSE
		  SET resultado = 'S';
    END IF;

    RETURN resultado;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fFormaPagoFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fFormaPagoFactura`(pnIdFactura FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcDescripcion   VARCHAR(256);
    DECLARE vcPorcentaje    VARCHAR(50);
    DECLARE vcValor    	    VARCHAR(50);
    DECLARE vcCadena   	    VARCHAR(356);
    DECLARE viDone          INT DEFAULT 0;
    DECLARE viCuenta        INT DEFAULT 0;
    DECLARE vcSeparador     VARCHAR(4);
    
    DECLARE
      cur1 CURSOR FOR
        SELECT t.descripcion_tipo_forma_pago AS descripcion,
	       ROUND(f.porcentaje_forma_pago, 2) AS porcentaje,
	       ROUND(((SELECT v.valor 
			 FROM fac_detalle_valor v
			WHERE v.tipo_detalle_valor = 'T'
			  AND v.id_factura = f.id_factura) * f.porcentaje_forma_pago / 100),2) AS valor
	 FROM fac_forma_pago f, fac_tipo_forma_pago t
	WHERE f.id_factura = pnIdFactura
	  AND f.id_tipo_forma_pago = t.id_tipo_forma_pago;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcCadena   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcDescripcion, vcPorcentaje, vcValor;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1 THEN
          SET vcSeparador   = ' | ';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcCadena   = CONCAT(vcCadena, vcSeparador, vcDescripcion,': ', vcValor);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcCadena;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fGetNewIdProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fGetNewIdProducto`(idTipoProducto VARCHAR(15)) RETURNS varchar(15) CHARSET latin1
BEGIN
  DECLARE ultimoIdProducto VARCHAR(15);
  DECLARE soloNumeros VARCHAR(50);
  DECLARE soloLetras VARCHAR(50);
  DECLARE nuevoCodigo VARCHAR(50);
  DECLARE posicion INT;
  DECLARE largo INT;
  DECLARE nuevoNumero INT;
  
   SELECT MAX(p.id_producto) AS ultimo
     INTO ultimoIdProducto
     FROM prd_producto p
    WHERE p.id_tipo_producto = idTipoProducto; 
    
  IF ultimoIdProducto IS NULL THEN
    SET ultimoIdProducto = CONCAT(idTipoProducto, '0001');
  END IF;

  SET soloNumeros = gecoecua_gecoindex.fExtractNumber(ultimoIdProducto);
  IF LENGTH(soloNumeros) > 0 THEN
    SET posicion = INSTR(ultimoIdProducto, soloNumeros);
    SET soloLetras = SUBSTR(ultimoIdProducto,1,posicion-1);
    SET largo = LENGTH(soloNumeros);
    SET nuevoNumero = CAST(soloNumeros AS UNSIGNED) + 1;
    SET nuevoCodigo = CONCAT(soloLetras, LPAD(nuevoNumero,largo,'0'));
  ELSE
    SET nuevoCodigo = '';
  END IF;

  RETURN nuevoCodigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreClienteFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreClienteFactura`(pnIdCliente FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcRazonSocial   VARCHAR(256);

    SELECT IFNULL(p.nombre_comercial,p.razon_social)
      INTO vcRazonSocial
      FROM per_persona p, fac_cliente_factura cf
     WHERE p.id_persona = cf.id_persona
			 AND cf.id_cliente_factura = pnIdCliente;

    RETURN vcRazonSocial;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreCuenta`(pnIdCuenta INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNombreCuenta   VARCHAR(256);

    SELECT CONCAT(codigo_contable, ' ', nombre_cuenta)
      INTO vcNombreCuenta
      FROM ctb_cuenta
     WHERE id_cuenta = pnIdCuenta;

    RETURN vcNombreCuenta;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreEmpleado`(idEmpleado FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE razonSocial   VARCHAR(256);
	SELECT TRIM(IFNULL(p.nombre_comercial, p.razon_social))
		INTO razonSocial
		FROM per_persona p, rst_empleado r
	 WHERE p.id_persona = r.id_persona 
	   AND r.id_empleado = idEmpleado;
	RETURN razonSocial;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreInsumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreInsumo`(pnIdInsumo INTEGER) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNombreInsumo   VARCHAR(256);

    SELECT REPLACE(REPLACE(i.descripcion_insumo, '\r\n', ' '), '\n', ' ')
      INTO vcNombreInsumo
      FROM prd_insumo i
     WHERE i.id_insumo = pnIdInsumo;

    RETURN vcNombreInsumo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombrePersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombrePersona`(pnIdPersona FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcRazonSocial   VARCHAR(256);

    SELECT IFNULL(TRIM(nombre_comercial),TRIM(razon_social))
      INTO vcRazonSocial
      FROM per_persona
     WHERE id_persona = pnIdPersona;

    RETURN vcRazonSocial;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombrePrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombrePrecioProducto`(idPrecioProducto VARCHAR(15), idProductoXPrecio INT) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE nombrePrecioProducto VARCHAR(100);

	IF idPrecioProducto IS NOT NULL THEN
	  SELECT descripcion_precio_producto
	    INTO nombrePrecioProducto
	    FROM prd_precio_producto
	   WHERE id_precio_producto = idPrecioProducto;
	ELSEIF idProductoXPrecio IS NOT NULL THEN
	  SELECT b.descripcion_precio_producto
	    INTO nombrePrecioProducto
			FROM prd_producto_x_precio_producto a, prd_precio_producto b
		 WHERE a.id_producto_x_precio_producto = idProductoXPrecio
			 AND a.id_precio_producto = b.id_precio_producto;
	ELSE
	  SET nombrePrecioProducto = '';
	END IF;

  RETURN nombrePrecioProducto;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreProducto`(pnIdProducto VARCHAR(15)) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNombreProducto  TEXT;

    SELECT p.nombre_corto
      INTO vcNombreProducto
      FROM prd_producto p
     WHERE p.id_producto = pnIdProducto;

    RETURN vcNombreProducto;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreProveedor`(pnIdProveedor FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcRazonSocial   VARCHAR(256);

    SELECT TRIM(IFNULL(p.nombre_comercial, p.razon_social))
      INTO vcRazonSocial
      FROM per_persona p, prv_proveedor r
     WHERE p.id_persona = r.id_persona AND r.id_proveedor = pnIdProveedor;

    RETURN vcRazonSocial;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombresPaxReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombresPaxReserva`(pnIdReserva INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcPaxs        TEXT;
    DECLARE vcPax         VARCHAR(500);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   CHAR(1);

    DECLARE
      cur1 CURSOR FOR
        SELECT fNombrePersona(pxr.id_persona) AS nombrepax
					FROM res_persona_x_reserva pxr
				 WHERE pxr.id_reserva = pnIdReserva;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcPaxs   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcPax;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '|';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcPaxs   = CONCAT(vcPaxs, vcSeparador, vcPax);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcPaxs;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreTemporada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreTemporada`(idTemporada INT, idPrecioXTemporada INT) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE nombreTemporada VARCHAR(100);

	IF idTemporada IS NOT NULL THEN
	  SELECT descripcion_temporada
	    INTO nombreTemporada
	    FROM prd_temporada
	   WHERE id_temporada = idTemporada;
	ELSEIF idPrecioXTemporada IS NOT NULL THEN
	  SELECT b.descripcion_temporada
	    INTO nombreTemporada
			FROM prd_precio_x_temporada a, prd_temporada b
		 WHERE a.id_precio_x_temporada = idPrecioXTemporada
			 AND a.id_temporada = b.id_temporada;
	ELSE
	  SET nombreTemporada = '';
	END IF;

  RETURN nombreTemporada;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNombreUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNombreUsuario`(pcIdUsuario VARCHAR(50)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNombre   VARCHAR(256);

    SELECT p.razon_social
      INTO vcNombre
      FROM seg_usuario u, per_persona p
     WHERE u.id_persona = p.id_persona AND u.id_usuario = pcIdUsuario;


    RETURN vcNombre;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fNotaCreditoUsada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fNotaCreditoUsada`(idNotaCredito INT) RETURNS char(1) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE usada CHAR(1);
    DECLARE otra INT;
		
    SELECT n.id_nota_credito
      INTO otra
		  FROM res_nota_credito n
		 WHERE n.id_nota_credito_origen = idNotaCredito;
		
		IF otra IS NULL THEN
		  SET usada = 'N';
		ELSE
		  SET usada = 'S';
		END IF;
    
		RETURN usada;	
	
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtAgenciaXReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtAgenciaXReserva`(pnIdReserva INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcAgencia   VARCHAR(256);

    SELECT REPLACE(codigo_agencia, ' ','_') AS codigo_agencia
      INTO vcAgencia
      FROM res_reserva
     WHERE id_reserva = pnIdReserva;

    RETURN vcAgencia;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtArchivoXml` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtArchivoXml`(id INT, tipo CHAR(3), extension CHAR(3)) RETURNS varchar(21) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE archivo VARCHAR(21);
  IF tipo = 'RET' THEN
    SELECT CONCAT('RT', r.establecimiento_ats, r.punto_emision_ats, LPAD(r.nro_retencion,9,'0'), '.', extension)
     INTO archivo
     FROM ctb_retencion r
    WHERE r.id_compra = id;
  END IF;
  IF tipo = 'FAC' THEN
    SELECT CONCAT('FV', f.establecimiento_ats, f.punto_emision_ats, LPAD(f.nro_factura,9,'0'), '.', extension)
      INTO archivo
      FROM fac_factura f
     WHERE f.id_factura = id;
  END IF;
  IF tipo = 'NC' THEN
    SELECT CONCAT('NC', f.establecimiento_ats, f.punto_emision_ats, LPAD(f.nro_nota_credito,9,'0'), '.', extension) AS xml
      INTO archivo
      FROM fac_nota_credito f
     WHERE f.id_nota_credito = id;
  END IF;
  RETURN archivo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtBddClienteCourier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtBddClienteCourier`(pnIdEnvio FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcBddClienteCourier   VARCHAR(256);

    SELECT i.bdd_empresa_integracion
      INTO vcBddClienteCourier
      FROM cou_envio v,
           cou_cliente c,
           gecoecua_gecoindex.int_empresa e,
           gecoecua_gecoindex.int_relacion r,
           gecoecua_gecoindex.int_empresa i
     WHERE     v.id_cliente_courier = c.id_cliente_courier
           AND c.int_id_empresa_integracion = r.int_id_empresa_integracion
           AND e.id_empresa_integracion = r.id_empresa_integracion
           AND i.id_empresa_integracion = r.int_id_empresa_integracion
           AND v.estado_envio != 'S'
           AND v.id_envio = pnIdEnvio;

    RETURN vcBddClienteCourier;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtBddEmpresaRelacionada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtBddEmpresaRelacionada`(pnIdEmpresaRelacionada INT) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcBdd VARCHAR(100);

    SELECT n.nombre_bdd
      INTO vcBdd
			FROM prm_empresa_relacionada e, gecoecua_gecoindex.adm_empresa_nick n
		 WHERE e.id_empresa_relacionada = pnIdEmpresaRelacionada
			 AND e.nick_empresa_relacionada = n.nick;

    RETURN vcBdd;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtCiudad`(pnIdPersona FLOAT) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE ciudad   VARCHAR(100);

    SELECT c.descripcion_ciudad
      INTO ciudad
      FROM per_ciudad c INNER JOIN per_direccion d
      ON c.id_ciudad = d.id_ciudad_direccion
     WHERE d.id_persona = pnIdPersona
     AND d.principal_direccion = 'S';

    RETURN ciudad;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtCiudadCompleta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtCiudadCompleta`(idCiudad INT) RETURNS varchar(512) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE ciudad  VARCHAR(512);
	
	SELECT CONCAT_WS(' - ',IFNULL(c.descripcion_ciudad,''),IFNULL(p.descripcion_provincia,''),IFNULL(s.descripcion_pais,''))
	  INTO ciudad
    FROM per_ciudad c, per_provincia p, per_pais s
   WHERE c.id_ciudad = idCiudad
     AND s.id_pais = p.id_pais AND c.id_provincia = p.id_provincia;
		
	RETURN ciudad;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtClasificadorInsumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtClasificadorInsumo`(idInsumo INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE codigo INT;

    SELECT t.id_super_tipo_insumo
      INTO codigo
      FROM prd_insumo i, prd_tipo_insumo t
     WHERE i.id_insumo = idInsumo
       AND i.id_tipo_insumo = t.id_tipo_insumo;

    RETURN codigo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtClaveAcceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtClaveAcceso`(pcIdentificacion VARCHAR(15), pnIdDocumento INT, pnTipoAmbiente INT, pnTipoEmision INT, pcTipoDoc VARCHAR(3)) RETURNS varchar(50) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcClave VARCHAR(50);
    DECLARE vcMulti VARCHAR(50) DEFAULT '765432765432765432765432765432765432765432765432';
    DECLARE vcChr CHAR(1);
    DECLARE vcMul CHAR(1);
    DECLARE vnRes INT;
    DECLARE vnSuma INT DEFAULT 0;
    DECLARE vnContador INT DEFAULT 1;
    DECLARE vnSecuencial INT;
		
		IF pcTipoDoc = 'FAC' THEN
			SELECT CONCAT(DATE_FORMAT(f.fecha_generacion, '%d%m%Y'),
										 '01',
										 pcIdentificacion,
										 pnTipoAmbiente,
										 LPAD(f.establecimiento_ats, 3,'0'),
										 LPAD(f.punto_emision_ats, 3, '0'),
										 LPAD(TRIM(f.nro_factura), 9, '0'),
										 LPAD(f.id_factura, 8, '0'),
										 pnTipoEmision)
				INTO vcClave
				FROM fac_factura f
			 WHERE f.id_factura = pnIdDocumento;
		END IF;
		IF pcTipoDoc = 'NC' THEN
			SELECT CONCAT(DATE_FORMAT(f.fecha_generacion, '%d%m%Y'),
										 '04',
										 pcIdentificacion,
										 pnTipoAmbiente,
										 LPAD(f.establecimiento_ats, 3,'0'),
										 LPAD(f.punto_emision_ats, 3, '0'),
										 LPAD(TRIM(f.nro_nota_credito), 9, '0'),
										 LPAD(f.id_nota_credito, 8, '0'),
										 pnTipoEmision)
				INTO vcClave
				FROM fac_nota_credito f
			 WHERE f.id_nota_credito = pnIdDocumento;
		END IF;
		IF pcTipoDoc = 'RET' THEN
			SELECT CONCAT(DATE_FORMAT(r.fecha_generacion, '%d%m%Y'),
										 '07',
										 pcIdentificacion,
										 pnTipoAmbiente,
										 LPAD(r.establecimiento_ats, 3,'0'),
										 LPAD(r.punto_emision_ats, 3, '0'),
										 LPAD(TRIM(r.nro_retencion), 9, '0'),
										 LPAD(r.id_retencion, 8, '0'),
										 pnTipoEmision)
				INTO vcClave
				FROM ctb_retencion r
			 WHERE r.id_retencion = pnIdDocumento;
		END IF;
		IF pcTipoDoc = 'LOT' THEN
		  SELECT secuencial_inicial
		    INTO vnSecuencial
		    FROM ctb_secuencial
		   WHERE tipo_secuencial = 'L';
		  SELECT CONCAT(DATE_FORMAT(NOW(), '%d%m%Y'),
										 '00',
										 pcIdentificacion,
										 pnTipoAmbiente,
										 LPAD(e.establecimiento_ats, 3,'0'),
										 LPAD(e.punto_emision_ats, 3, '0'),
										 LPAD(vnSecuencial, 9, '0'),
										 LPAD(vnSecuencial, 8, '0'),
										 pnTipoEmision)
				INTO vcClave
				FROM prm_empresa e;		
		END IF;
		
		WHILE vnContador < 49 DO
		  SET vcChr = SUBSTR(vcClave, vnContador, 1);
		  SET vcMul = SUBSTR(vcMulti, vnContador, 1);
		  SET vnRes = vcChr * vcMul;
		  SET vnSuma = vnSuma + vnRes;
		  SET vnContador = vnContador + 1;
		END WHILE;
		
		SET vnRes = 11 - MOD(vnSuma, 11);
		
		IF vnRes = 11 THEN
		  SET vnRes = 0;
		END IF;
		IF vnRes = 10 THEN
		  SET vnRes = 1;
		END IF;

		SET vcClave = CONCAT(vcClave, vnRes);

    RETURN vcClave;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtClaveAccesoExterna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtClaveAccesoExterna`(pnIdProveedor INT, pcFecha DATE, pcEstablecimiento VARCHAR(5), pcPtoEmision VARCHAR(5), pcNroDocumento VARCHAR(15), pcIdDocumento VARCHAR(15)) RETURNS varchar(50) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcClave VARCHAR(50);
    DECLARE vcIdentificacion VARCHAR(50);
    DECLARE vcMulti VARCHAR(50) DEFAULT '765432765432765432765432765432765432765432765432';
    DECLARE vcChr CHAR(1);
    DECLARE vcMul CHAR(1);
    DECLARE vnRes INT;
    DECLARE vnSuma INT DEFAULT 0;
    DECLARE vnContador INT DEFAULT 1;
    
		SET vcIdentificacion = fObtIdentificacionPrincipal(pnIdProveedor, 'PRV');
		SET vcClave = CONCAT(DATE_FORMAT(pcFecha, '%d%m%Y'),'01',vcIdentificacion,'1',LPAD(pcEstablecimiento,3,'0'),LPAD(pcPtoEmision,3,'0'),LPAD(pcNroDocumento,9,'0'),LPAD(pcIdDocumento,8,'0'),'1');
		
		WHILE vnContador < 49 DO
		  SET vcChr = SUBSTR(vcClave, vnContador, 1);
		  SET vcMul = SUBSTR(vcMulti, vnContador, 1);
		  SET vnRes = vcChr * vcMul;
		  SET vnSuma = vnSuma + vnRes;
		  SET vnContador = vnContador + 1;
		END WHILE;
		
		SET vnRes = 11 - MOD(vnSuma, 11);
		
		IF vnRes = 11 THEN
		  SET vnRes = 0;
		END IF;
		IF vnRes = 10 THEN
		  SET vnRes = 1;
		END IF;

		SET vcClave = CONCAT(vcClave, vnRes);

    RETURN vcClave;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtComprasPagoMultiple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtComprasPagoMultiple`(idPago INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE compras   VARCHAR(256);
    DECLARE compra    VARCHAR(15);
    DECLARE done        INT DEFAULT 0;
    DECLARE cuenta      INT DEFAULT 0;

    DECLARE
      cur1 CURSOR FOR
        SELECT m.id_compra
          FROM crt_multiple_cobro_pago m
         WHERE m.id_cobro_pago = idPago;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done   = 1;
    SET compras   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO compra;

      SET cuenta   = cuenta + 1;

      IF NOT done
      THEN
        SET compras = CONCAT(compras, compra, '-');
      END IF;
    UNTIL done
    END REPEAT;

    CLOSE cur1;

    SET compras = SUBSTR(compras, 1, LENGTH(compras)-1);

    RETURN compras;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtConfigFormCta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtConfigFormCta`(pnIdCuenta INT) RETURNS varchar(500) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcConfiguracion   VARCHAR(500);
    DECLARE vcCampo    				VARCHAR(15);
    DECLARE vcTipoReporte			VARCHAR(15);
    DECLARE vcCadena1					VARCHAR(100);
    DECLARE vcCadena2					VARCHAR(100);
    DECLARE vcCadena3					VARCHAR(100);
    DECLARE viDone        		INT DEFAULT 0;
    DECLARE viCuenta1      		INT DEFAULT 0;
    DECLARE viCuenta2      		INT DEFAULT 0;
    DECLARE viCuenta3      		INT DEFAULT 0;
    DECLARE vcSeparador   		CHAR(1);

    DECLARE
      cur1 CURSOR FOR
        SELECT l.tipo_reporte, l.linea_reporte
					FROM ctb_linea_reporte l
				 WHERE l.id_cuenta = pnIdCuenta
				ORDER BY l.tipo_reporte;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcConfiguracion = '';
    SET vcCadena1 = '';
    SET vcCadena2 = '';
    SET vcCadena3 = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcTipoReporte, vcCampo;
      IF NOT viDone THEN
				IF vcTipoReporte = '101' THEN
					SET viCuenta1 = viCuenta1 + 1;
					IF viCuenta1 > 1 THEN
						SET vcSeparador   = ',';
					ELSE
						SET vcSeparador   = '';
					END IF;
					SET vcCadena1 = CONCAT(vcCadena1, vcSeparador, vcCampo);
				END IF;
				IF vcTipoReporte = '103' THEN
					SET viCuenta2 = viCuenta2 + 1;
					IF viCuenta2 > 1 THEN
						SET vcSeparador   = ',';
					ELSE
						SET vcSeparador   = '';
					END IF;
					SET vcCadena2 = CONCAT(vcCadena2, vcSeparador, vcCampo);
				END IF;
				IF vcTipoReporte = '104' THEN
					SET viCuenta3 = viCuenta3 + 1;
					IF viCuenta3 > 1 THEN
						SET vcSeparador   = ',';
					ELSE
						SET vcSeparador   = '';
					END IF;
					SET vcCadena3 = CONCAT(vcCadena3, vcSeparador, vcCampo);
				END IF;
      END IF;
    UNTIL viDone
    END REPEAT;
    CLOSE cur1;
    
		IF vcCadena1 != '' THEN
			SET vcConfiguracion = CONCAT('F101: ', vcCadena1, '; ');
		END IF;
		IF vcCadena2 != '' THEN
			SET vcConfiguracion = CONCAT(vcConfiguracion, 'F103: ', vcCadena2, '; ');
		END IF;
		IF vcCadena3 != '' THEN
			SET vcConfiguracion = CONCAT(vcConfiguracion, 'F104: ', vcCadena3, ';');
		END IF;
		
    RETURN vcConfiguracion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtCorreo`(id INT, tipo CHAR(3)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE correo VARCHAR(256);
  
  IF tipo = 'PRV' THEN
		SELECT p.correo_electronico 
			INTO correo
			FROM per_persona p, prv_proveedor u
		 WHERE p.id_persona = u.id_persona
			 AND u.id_proveedor = id;
  END IF;
  IF tipo = 'PER' THEN
    SELECT p.correo_electronico 
			INTO correo
			FROM per_persona p
		 WHERE p.id_persona = id;
  END IF;
  
  RETURN correo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtCorreoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtCorreoUsuario`(idUsuario VARCHAR(100)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE correo VARCHAR(256);

    SELECT p.correo_electronico
      INTO correo
			FROM per_persona p, seg_usuario u 
		 WHERE p.id_persona = u.id_persona
			 AND u.id_usuario = idUsuario;

    RETURN correo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDatoIdiomaXItinerario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDatoIdiomaXItinerario`(modulo CHAR(3), idItinerario INT, tipo CHAR(3), idioma CHAR(2)) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE dato TEXT;

    IF modulo = 'PRD' THEN
      SELECT IF(tipo='DSC',IFNULL(descripcion_itinerario,''),
               IF(tipo='ORI',IFNULL(origen,''),
                 IF(tipo='DST',IFNULL(destino,''),
                   IF(tipo='ACT',IFNULL(actividad,''),
                     IF(tipo='DUR',IFNULL(duracion_itinerario,''),
                       IF(tipo='OBS',IFNULL(observaciones,''),''))))))
        INTO dato
        FROM prd_idioma_x_itinerario
       WHERE id_itinerario = idItinerario
         AND id_idioma = idioma;
    ELSEIF modulo = 'RES' THEN
      SELECT IF(tipo='DSC',IFNULL(descripcion_itinerario,''),
               IF(tipo='ORI',IFNULL(origen,''),
                 IF(tipo='DST',IFNULL(destino,''),
                   IF(tipo='ACT',IFNULL(actividad,''),
                     IF(tipo='DUR',IFNULL(duracion_itinerario,''),
                       IF(tipo='OBS',IFNULL(observaciones,''),''))))))
        INTO dato
        FROM res_idioma_x_itinerario
       WHERE id_itinerario_res = idItinerario
         AND id_idioma = idioma;
    ELSEIF modulo = 'PRF' OR modulo = 'FAC' THEN
      SELECT IF(tipo='DSC',IFNULL(descripcion_itinerario,''),
               IF(tipo='ORI',IFNULL(origen,''),
                 IF(tipo='DST',IFNULL(destino,''),
                   IF(tipo='ACT',IFNULL(actividad,''),
                     IF(tipo='DUR',IFNULL(duracion_itinerario,''),
                       IF(tipo='OBS',IFNULL(observaciones,''),''))))))
        INTO dato
        FROM fac_idioma_x_itinerario
       WHERE id_itinerario_fac = idItinerario
         AND id_idioma = idioma;
    END IF;

    RETURN dato;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDatosAnticipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDatosAnticipo`(idAnticipo INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE datos VARCHAR(256);

	SELECT CONCAT('ANTICIPO Id.:',a.id_anticipo,' de ', ROUND(a.valor,2), ' fecha ', a.fecha_anticipo)
	  INTO datos
    FROM crt_anticipo a
   WHERE a.id_anticipo = idAnticipo;

  RETURN datos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDatosProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDatosProducto`(idProducto VARCHAR(15), idTipoProducto VARCHAR(15), tipoPrecio CHAR(1), nroPax INT, cantidad INT, tipoResultado INT, idAgencia INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE resultado TEXT;
  DECLARE tipoOperacion VARCHAR(4);
  DECLARE impPorc DECIMAL(15,4);
  DECLARE porcIVA DECIMAL(15,4);
  DECLARE impValor DECIMAL(15,4);
  DECLARE totalImpPorc DECIMAL(15,4);
  DECLARE totalImpValor DECIMAL(15,4);
  DECLARE totalImpNeto DECIMAL(15,4);
  DECLARE totalIVA DECIMAL(15,4);
  DECLARE factorIncrementoZona DECIMAL(15,4);
  DECLARE totalOtrosImp DECIMAL(15,4);
  DECLARE precioTotal DECIMAL(15,4);
  DECLARE maxDiaItinerario INT;
  DECLARE idProductoXPrecio INT;
  DECLARE idPrecioProducto VARCHAR(15);
  DECLARE nombrePrecioProducto VARCHAR(100);
  DECLARE precio DECIMAL(15,4);
  DECLARE precioAux DECIMAL(15,4);
  DECLARE idPrecioXTemporada INT;
  DECLARE nombreTemporada VARCHAR(100);
	
	SELECT IFNULL(SUM(i.cantidad_impuesto),0)
	  INTO impPorc
    FROM prd_impuesto_x_producto d, prd_impuesto i
   WHERE d.id_impuesto = i.id_impuesto
     AND d.id_producto = idProducto
     AND i.tipo_impuesto = 'P';

  SELECT IFNULL(SUM(i.cantidad_impuesto),0)
    INTO totalImpValor
    FROM prd_impuesto_x_producto d, prd_impuesto i
   WHERE d.id_impuesto = i.id_impuesto
     AND d.id_producto = idProducto
     AND i.tipo_impuesto = 'V';

  IF tipoPrecio = 'T' THEN
    SELECT pxpp.id_producto_x_precio_producto,
           pxpp.id_precio_producto,
           IFNULL((SELECT pp.descripcion_precio_producto
                     FROM prd_precio_producto pp
                    WHERE pp.id_precio_producto = pxpp.id_precio_producto), '') AS descripcion_precio_producto,
           IFNULL(fObtPrecioProducto(pxpp.id_precio_producto),0) AS precio_producto,
           IFNULL(fObtIdPrecioXTemporadaPrecioProducto(pxpp.id_precio_producto),0) AS precioXTemporada,
           IFNULL(fObtNomTemporadaPrecioXTemporada(fObtIdPrecioXTemporadaPrecioProducto(pxpp.id_precio_producto)),'') AS nombreTemporada
      INTO idProductoXPrecio, idPrecioProducto, nombrePrecioProducto, precio, idPrecioXTemporada, nombreTemporada
      FROM prd_producto_x_precio_producto pxpp
     WHERE pxpp.id_producto = idProducto
    LIMIT 0,1;
  ELSE
    SET idProductoXPrecio = 0;
    SET idPrecioProducto = '';
    SET nombrePrecioProducto = '';
    SET idPrecioXTemporada = 0;
    SET nombreTemporada = '';
    SELECT fCalculaPrecio(idProducto, nroPax, 'N', 'S', NULL, NULL)
      INTO precio;
  END IF;
	
	IF tipoResultado = 1 THEN
	  SELECT e.id_tipo_operacion
			INTO tipoOperacion
			FROM prd_tipo_producto d,
					 prd_unidad_estrategica u,
					 prm_tipo_operacion_x_empresa e
		 WHERE d.id_tipo_producto = idTipoProducto
			 AND d.id_unidad_estrategica = u.id_unidad_estrategica
			 AND u.id_tipo_operacion_x_empresa = e.id_tipo_operacion_x_empresa;
		
		SELECT MAX(i.dia_itinerario)
			INTO maxDiaItinerario
			FROM prd_itinerario i
		 WHERE i.id_producto = idProducto;

	  SET resultado = CONCAT_WS('~', tipoOperacion, impPorc, impValor, maxDiaItinerario, idProductoXPrecio, idPrecioProducto, nombrePrecioProducto, precio, idPrecioXTemporada, nombreTemporada);
  END IF;
  	
	IF tipoResultado = 2 THEN
	  SET totalImpPorc = (precio * impPorc /100);
	  SET totalImpNeto = totalImpPorc + totalImpValor;
	  SET precioTotal = precio * cantidad;
	  SET resultado = CONCAT_WS('~', precio, totalImpPorc, totalImpValor, totalImpNeto, precioTotal);
	END IF;
	
	IF tipoResultado = 3 THEN
	  SELECT IFNULL(z.porcentaje_zona,0)
	    INTO factorIncrementoZona
			FROM per_persona p, per_zona z
		 WHERE p.id_zona = z.id_zona
			 AND p.id_persona = idAgencia;
		SET factorIncrementoZona = IFNULL(factorIncrementoZona, 0);
		SET precioAux = precio + (precio * factorIncrementoZona /100);
	  SELECT ((precioAux * cantidad) * i.cantidad_impuesto / 100), i.cantidad_impuesto
	    INTO totalIVA, porcIVA
			FROM prd_impuesto i, prd_impuesto_x_producto ixp
		 WHERE i.id_impuesto = ixp.id_impuesto
			 AND i.tipo_ats = 'IVA'
			 AND ixp.id_producto = idProducto;
		SET totalIVA = IFNULL(totalIVA, 0);
		SELECT ((precioAux * cantidad) * SUM(i.cantidad_impuesto) / 100), SUM(i.cantidad_impuesto)
	    INTO totalImpPorc, impPorc
			FROM prd_impuesto i, prd_impuesto_x_producto ixp
		 WHERE i.id_impuesto = ixp.id_impuesto
			 AND i.tipo_ats != 'IVA'
			 AND i.tipo_impuesto = 'P'
			 AND ixp.id_producto = idProducto;
		SET totalImpPorc = IFNULL(totalImpPorc, 0);
		SELECT (cantidad * SUM(i.cantidad_impuesto)), SUM(i.cantidad_impuesto)
	    INTO totalImpValor, impValor
			FROM prd_impuesto i, prd_impuesto_x_producto ixp
		 WHERE i.id_impuesto = ixp.id_impuesto
			 AND i.tipo_impuesto = 'V'
			 AND ixp.id_producto = idProducto;
		SET totalImpValor = IFNULL(totalImpValor, 0);
		SET totalOtrosImp =  IFNULL(totalImpPorc,0) + IFNULL(totalImpValor,0);
		SET precioTotal = (precioAux * cantidad) + totalIVA + totalOtrosImp;
		SET resultado = CONCAT_WS('~', factorIncrementoZona, precioAux, totalIVA, totalOtrosImp, precioTotal, porcIVA, impPorc, impValor);
	END IF;

  RETURN resultado;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDescripcionIdioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDescripcionIdioma`(pnIdIdioma VARCHAR(2)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE pcIdioma VARCHAR(100);

	SELECT descripcion_idioma
	  INTO pcIdioma
	  FROM prm_idioma
	 WHERE id_idioma = pnIdIdioma;

    RETURN pcIdioma;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDescripcionLugar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDescripcionLugar`(idLugar INT, texto varchar(100)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE descripcion   VARCHAR(100);

    SELECT CONCAT(IFNULL(texto,''), ' ', descripcion_lugar)
      INTO descripcion
      FROM res_lugar
     WHERE id_lugar = idLugar;

    RETURN descripcion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDescripcionVuelo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDescripcionVuelo`(idVuelo INT, texto varchar(100)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE descripcion   VARCHAR(100);

    SELECT CONCAT(IFNULL(texto,''), ' ', descripcion_vuelo)
      INTO descripcion
      FROM res_vuelo
     WHERE id_vuelo = idVuelo;

    RETURN descripcion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDetalleCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDetalleCompra`(pnIdCompra INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcInsumos   TEXT;
    DECLARE vcInsumo    VARCHAR(256);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   CHAR(1);

    DECLARE
      cur1 CURSOR FOR
        SELECT fNombreInsumo(d.id_insumo) AS nominsumo
          FROM prv_detalle_compra d
         WHERE d.id_compra = pnIdCompra;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcInsumos   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcInsumo;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '/';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcInsumos   = CONCAT(vcInsumos, vcSeparador, vcInsumo);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcInsumos;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDetalleValorXModulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDetalleValorXModulo`(modulo CHAR(3), tipo CHAR(3), id INT, tipoDetalleValor VARCHAR(3), idImpuesto VARCHAR(4)) RETURNS decimal(15,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE valorDet DECIMAL(15,4);
    
    IF modulo = 'RES' THEN
      IF tipo = 'CAB' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM res_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_reserva = id
             AND v.v.tipo_detalle_valor = 'I'
             AND suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM res_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_reserva = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM res_detalle_valor  v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_reserva = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
					  SELECT valor
							INTO valorDet
							FROM res_detalle_valor 
						 WHERE id_reserva = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM res_detalle_valor
           WHERE id_reserva = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      ELSEIF tipo = 'DET' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM res_detalle_valor_prd v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_reserva = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(valor)
            INTO valorDet
            FROM res_detalle_valor_prd v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_reserva = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto  != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
					IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM res_detalle_valor_prd v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_detalle_reserva = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM res_detalle_valor_prd
						 WHERE id_detalle_reserva = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
          
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM res_detalle_valor_prd
           WHERE id_detalle_reserva = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      ELSEIF tipo = 'INS' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM res_detalle_valor_x_insumo v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_insumo_x_itinerario_res = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM res_detalle_valor_x_insumo v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_insumo_x_itinerario_res = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM res_detalle_valor_x_insumo v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_insumo_x_itinerario_res = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM res_detalle_valor_x_insumo
						 WHERE id_insumo_x_itinerario_res = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM res_detalle_valor_x_insumo
           WHERE id_insumo_x_itinerario_res = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      END IF;
    ELSEIF modulo = 'PRF' THEN
      IF tipo = 'CAB' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_proforma = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_proforma = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor v, prd_impuesto i
						 WHERE v.id_impuesto = i.id_impuesto
							AND v.id_proforma = id
							AND v.tipo_detalle_valor = 'I'
							AND v.suprime_impuesto = 'N'
							AND IFNULL(i.tipo_ats, '') = idImpuesto;
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor
						 WHERE id_proforma = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor
           WHERE id_proforma = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      ELSEIF tipo = 'DET' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_producto v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_proforma = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_producto v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_proforma = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor_x_producto v, prd_impuesto i
						 WHERE v.id_impuesto = i.id_impuesto
               AND v.id_detalle_proforma = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor_x_producto
						 WHERE id_detalle_proforma = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;						
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor_x_producto
           WHERE id_detalle_proforma = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      ELSEIF tipo = 'INS' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_insumo v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_insumo_x_itinerario_fac = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_insumo v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_insumo_x_itinerario_fac = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor_x_insumo v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_insumo_x_itinerario_fac = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor_x_insumo
						 WHERE id_insumo_x_itinerario_fac = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;					
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor_x_insumo
           WHERE id_insumo_x_itinerario_fac = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      END IF;
    ELSEIF modulo = 'FAC' THEN
      IF tipo = 'CAB' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_factura = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_factura = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_factura = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor
						 WHERE id_factura = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor
           WHERE id_factura = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      ELSEIF tipo = 'DET' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_producto v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_factura = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_producto v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_factura = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
           IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor_x_producto v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_detalle_factura = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor_x_producto
						 WHERE id_detalle_factura = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor_x_producto
           WHERE id_detalle_factura = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      ELSEIF tipo = 'INS' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_insumo v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_insumo_x_itinerario_fac = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_insumo v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_insumo_x_itinerario_fac = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor_x_insumo v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_insumo_x_itinerario_fac = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor_x_insumo
						 WHERE id_insumo_x_itinerario_fac = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor_x_insumo
           WHERE id_insumo_x_itinerario_fac = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      END IF;
    ELSEIF modulo = 'NC' THEN
      IF tipo = 'CAB' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_nota_credito = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_nota_credito = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_nota_credito = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor
						 WHERE id_nota_credito = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;					
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor
           WHERE id_nota_credito = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
			ELSEIF tipo = 'DET' THEN
				
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_producto v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_nota_credito = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM fac_detalle_valor_x_producto v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_nota_credito = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM fac_detalle_valor_x_producto v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_detalle_nota_credito = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM fac_detalle_valor_x_producto
						 WHERE id_detalle_nota_credito = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM fac_detalle_valor_x_producto
           WHERE id_detalle_nota_credito = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      END IF;
    ELSEIF modulo = 'PRV' THEN
      IF tipo = 'CAB' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM prv_detalle_valor_compra v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_compra = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM prv_detalle_valor_compra v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_compra = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
					IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM prv_detalle_valor_compra v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_compra = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM prv_detalle_valor_compra
						 WHERE id_compra = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;					
        
        ELSE
          SELECT valor
            INTO valorDet
            FROM prv_detalle_valor_compra
           WHERE id_compra = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      ELSEIF tipo = 'DET' THEN
        
        IF tipoDetalleValor = 'OTI' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM prv_detalle_valor_compra_x_item v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_compra = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'OTX' THEN
          SELECT SUM(v.valor)
            INTO valorDet
            FROM prv_detalle_valor_compra_x_item v, prd_impuesto i
           WHERE v.id_impuesto = i.id_impuesto
             AND v.id_detalle_compra = id
             AND v.tipo_detalle_valor = 'I'
             AND v.suprime_impuesto = 'N'
             AND v.id_impuesto  != 'SRV'
             AND IFNULL(i.tipo_ats, '') != 'IVA';
        
        ELSEIF tipoDetalleValor = 'I' AND idImpuesto IS NOT NULL THEN
          IF idImpuesto = 'IVA' THEN
						SELECT SUM(v.valor)
							INTO valorDet
							FROM prv_detalle_valor_compra_x_item v, prd_impuesto i
             WHERE v.id_impuesto = i.id_impuesto
               AND v.id_detalle_compra = id
							 AND v.tipo_detalle_valor = 'I'
							 AND v.suprime_impuesto = 'N'
							 AND IFNULL(i.tipo_ats, '') = 'IVA';
					ELSE
						SELECT valor
							INTO valorDet
							FROM prv_detalle_valor_compra_x_item
						 WHERE id_detalle_compra = id
							 AND tipo_detalle_valor = 'I'
							 AND suprime_impuesto = 'N'
							 AND id_impuesto = idImpuesto;
					END IF;
        ELSE
          
          SELECT valor
            INTO valorDet
            FROM prv_detalle_valor_compra_x_item
           WHERE id_detalle_compra = id
             AND tipo_detalle_valor = tipoDetalleValor;
        END IF;
      END IF;
    END IF;

    RETURN IFNULL(valorDet, 0);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDetValorFac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDetValorFac`(idFactura INT(11), porcentaje DECIMAL(15,6), pcTipo VARCHAR(4)) RETURNS decimal(15,6)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE valor DECIMAL(15,6);

	IF pcTipo = 'SUBT' THEN
		SELECT v.valor * porcentaje / 100
			INTO valor
			FROM fac_detalle_valor v
		 WHERE v.tipo_detalle_valor = 'S'
			 AND v.id_factura = idFactura;
	END IF;
	IF pcTipo = 'DESC' THEN
		SELECT v.valor * porcentaje / 100
			INTO valor
			FROM fac_detalle_valor v
		 WHERE v.tipo_detalle_valor = 'D'
			 AND v.id_factura = idFactura;
	END IF;
	IF pcTipo = 'ODES' THEN
		SELECT v.valor * porcentaje / 100
			INTO valor
			FROM fac_detalle_valor v
		 WHERE v.tipo_detalle_valor = 'F'
			 AND v.id_factura = idFactura;
	END IF;
	IF pcTipo = 'TOTL' THEN
		SELECT v.valor * porcentaje / 100
			INTO valor
			FROM fac_detalle_valor v
		 WHERE v.tipo_detalle_valor = 'T'
			 AND v.id_factura = idFactura;
	END IF;
	IF pcTipo = 'SIMP' THEN
		SELECT SUM(v.valor) * porcentaje / 100
			INTO valor
			FROM fac_detalle_valor v
		 WHERE v.tipo_detalle_valor = 'I'
			 AND v.id_factura = idFactura
			 AND v.suprime_impuesto = 'N';
	END IF;
	IF pcTipo = 'IVA' THEN
	  SELECT SUM(v.valor) * porcentaje / 100
			INTO valor
			FROM fac_detalle_valor v, prd_impuesto i
		 WHERE v.tipo_detalle_valor = 'I'
			 AND v.id_factura = idFactura
			 AND i.id_impuesto = v.id_impuesto
			 AND i.codigo_impuesto_retencion = 2
			 AND v.suprime_impuesto = 'N';
	END IF;
	IF pcTipo = 'OTRI' THEN
	  SELECT SUM(v.valor) * porcentaje / 100
			INTO valor
			FROM fac_detalle_valor v, prd_impuesto i
		 WHERE v.tipo_detalle_valor = 'I'
			 AND v.id_factura = idFactura
			 AND i.id_impuesto = v.id_impuesto
			 AND i.codigo_impuesto_retencion != 2
			 AND v.suprime_impuesto = 'N';
	END IF;

  RETURN valor;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDiaMaxItinerario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDiaMaxItinerario`(modulo CHAR(3), idDetalle INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE maxDia INT;

  IF modulo = 'RES' THEN
    SELECT MAX(dia_itinerario)
      INTO maxDia
      FROM res_itinerario
     WHERE id_detalle_reserva = idDetalle;
  ELSEIF modulo = 'PRF' THEN
    SELECT MAX(dia_itinerario)
      INTO maxDia
      FROM fac_itinerario
     WHERE id_detalle_proforma = idDetalle;
  ELSEIF modulo = 'FAC' THEN
    SELECT MAX(dia_itinerario)
      INTO maxDia
      FROM fac_itinerario
     WHERE id_detalle_factura = idDetalle;
	END IF;
  RETURN maxDia;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtDireccionPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtDireccionPrincipal`(pnId INT, pcTipo CHAR(3)) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcDireccion TEXT;
    
    IF pcTipo = 'PER' THEN
      SELECT CONCAT(IFNULL((SELECT CONCAT(c.descripcion_ciudad,', ') FROM per_ciudad c WHERE c.id_ciudad = d.id_ciudad_direccion),''),
               IF(d.sector IS NULL, '', CONCAT(d.sector, ', ')),
               IF(d.calle_principal IS NULL, '', d.calle_principal),
               IF(d.nro_casa_o_edificio IS NULL,'',CONCAT(' ', d.nro_casa_o_edificio)),
               IF(d.codigo_numerico IS NULL,'',CONCAT('-', d.codigo_numerico)),
               IF(d.calle_secundaria IS NULL,'',CONCAT(' y ', d.calle_secundaria)),
               IF(d.nombre_edificio IS NULL,'',CONCAT(' ', d.nombre_edificio)),
               IF(d.nro_departamento IS NULL,'',CONCAT(' ', d.nro_departamento)),
               IF(d.dato_adicional IS NULL,'',CONCAT(' ', d.dato_adicional))) AS descripcion_completa
        INTO vcDireccion
        FROM per_direccion d
       WHERE d.id_persona = pnId
         AND d.principal_direccion = 'S';
    END IF;
    IF pcTipo = 'PRV' THEN
      SELECT CONCAT(IFNULL((SELECT CONCAT(c.descripcion_ciudad,', ') FROM per_ciudad c WHERE c.id_ciudad = d.id_ciudad_direccion),''),
               IF(d.sector IS NULL, '', CONCAT(d.sector, ', ')),
               IF(d.calle_principal IS NULL, '', d.calle_principal),
               IF(d.nro_casa_o_edificio IS NULL,'',CONCAT(' ', d.nro_casa_o_edificio)),
               IF(d.codigo_numerico IS NULL,'',CONCAT('-', d.codigo_numerico)),
               IF(d.calle_secundaria IS NULL,'',CONCAT(' y ', d.calle_secundaria)),
               IF(d.nombre_edificio IS NULL,'',CONCAT(' ', d.nombre_edificio)),
               IF(d.nro_departamento IS NULL,'',CONCAT(' ', d.nro_departamento)),
               IF(d.dato_adicional IS NULL,'',CONCAT(' ', d.dato_adicional))) AS descripcion_completa
        INTO vcDireccion
        FROM per_direccion d, prv_proveedor p
       WHERE p.id_proveedor = pnId
         AND d.id_persona = p.id_persona
         AND d.principal_direccion = 'S';
    END IF;
    IF pcTipo = 'CLI' THEN
      SELECT CONCAT(IFNULL((SELECT CONCAT(c.descripcion_ciudad,', ') FROM per_ciudad c WHERE c.id_ciudad = d.id_ciudad_direccion),''),
               IF(d.sector IS NULL, '', CONCAT(d.sector, ', ')),
               IF(d.calle_principal IS NULL, '', d.calle_principal),
               IF(d.nro_casa_o_edificio IS NULL,'',CONCAT(' ', d.nro_casa_o_edificio)),
               IF(d.codigo_numerico IS NULL,'',CONCAT('-', d.codigo_numerico)),
               IF(d.calle_secundaria IS NULL,'',CONCAT(' y ', d.calle_secundaria)),
               IF(d.nombre_edificio IS NULL,'',CONCAT(' ', d.nombre_edificio)),
               IF(d.nro_departamento IS NULL,'',CONCAT(' ', d.nro_departamento)),
               IF(d.dato_adicional IS NULL,'',CONCAT(' ', d.dato_adicional))) AS descripcion_completa
        INTO vcDireccion
        FROM per_direccion d, fac_cliente_factura c
       WHERE c.id_cliente_factura = pnId
         AND d.id_persona = c.id_persona
         AND d.principal_direccion = 'S';
    END IF; 

    RETURN vcDireccion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtEstadoConciliacionBancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtEstadoConciliacionBancaria`(pnIdConciliacion INT, pnIdDetConciliacion INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE estadoConciliacion CHAR(3);

    IF pnIdConciliacion IS NOT NULL THEN
      SELECT estado_conciliacion_bancaria
        INTO estadoConciliacion
        FROM ctb_conciliacion_bancaria
       WHERE id_conciliacion_bancaria = pnIdConciliacion;
    END IF;
    
    IF pnIdDetConciliacion IS NOT NULL THEN
      SELECT c.estado_conciliacion_bancaria
        INTO estadoConciliacion
        FROM ctb_conciliacion_bancaria c
       WHERE c.id_conciliacion_bancaria IN (SELECT d.id_conciliacion_bancaria
																							FROM ctb_det_conciliacion_bancaria d
																						 WHERE d.id_conciliacion_bancaria = c.id_conciliacion_bancaria
																						   AND d.id_det_conciliacion_bancaria = pnIdDetConciliacion);
    END IF;

    RETURN estadoConciliacion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtEstadoStockInsumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtEstadoStockInsumos`(idDetalleFactura INT) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE cantidadSaldo DECIMAL(15,4);
    DECLARE done          INT DEFAULT 0;
    DECLARE stockOk			  BOOLEAN;
    DECLARE cur1 CURSOR FOR
        SELECT IFNULL((SELECT a.cantidad_saldo
												 FROM inv_kardex a 
											  WHERE a.id_insumo = ixi.id_insumo 
												  AND a.fecha_crea = (SELECT MAX(b.fecha_crea)
																								FROM inv_kardex b
																							 WHERE b.id_insumo = a.id_insumo)),0) AS cantidad_saldo
					FROM fac_itinerario i, fac_insumo_x_itinerario ixi
				 WHERE i.id_itinerario_fac = ixi.id_itinerario_fac
					 AND i.id_detalle_factura = idDetalleFactura;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
		SET stockOk = TRUE;
		
    OPEN cur1;
			REPEAT
				FETCH cur1 INTO cantidadSaldo;
				IF NOT done THEN
					IF cantidadSaldo <= 0 THEN
						SET stockOk = FALSE;
					END IF;
				END IF;
			UNTIL done
			END REPEAT;
    CLOSE cur1;
    
    RETURN stockOk;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtEstadoTpProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtEstadoTpProducto`(pnIdProducto VARCHAR(15)) RETURNS char(1) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcEstado   CHAR(1);

    SELECT t.estado_tipo_producto
      INTO vcEstado
      FROM prd_producto p, prd_tipo_producto t
     WHERE p.id_tipo_producto = t.id_tipo_producto
           AND p.id_producto = pnIdProducto;

    RETURN vcEstado;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtFechaFinalizaReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtFechaFinalizaReserva`(pnIdReserva INTEGER) RETURNS date
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vdFecha   DATE;

    SELECT DATE(MAX(pxr.fecha_fin)) AS fecha
      INTO vdFecha
      FROM res_detalle_reserva pxr
     WHERE pxr.id_reserva = pnIdReserva;

    RETURN vdFecha;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtFechaIniciaReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtFechaIniciaReserva`(pnIdReserva INTEGER) RETURNS date
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vdFecha   DATE;

    SELECT DATE(MIN(d.fecha_inicio)) AS fecha
      INTO vdFecha
      FROM res_detalle_reserva d
     WHERE d.id_reserva = pnIdReserva;

    RETURN vdFecha;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtFechaTimeLimit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtFechaTimeLimit`(pnIdReserva INTEGER) RETURNS date
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vdFecha   DATE;

    SELECT DATE_SUB(DATE(MIN(pxr.fecha_inicio)),
                    INTERVAL IFNULL(p.dias_time_limit, (SELECT e.dias_time_limit FROM prm_empresa e WHERE e.principal_empresa = 'S')) DAY)
			INTO vdFecha
			FROM res_reserva r, per_persona p, res_detalle_reserva pxr
		 WHERE pxr.id_reserva = pnIdReserva
			 AND r.id_reserva = pxr.id_reserva
			 AND r.id_persona = p.id_persona;

    RETURN vdFecha;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtFormaPagoFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtFormaPagoFactura`(pnIdFactura INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcFormas   VARCHAR(156);
    DECLARE vcForma    VARCHAR(100);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   CHAR(1);

    DECLARE
      cur1 CURSOR FOR
        SELECT CONCAT(t.descripcion_tipo_forma_pago, ' - ', ROUND(f.porcentaje_forma_pago,2), '%') AS formapago
					FROM fac_forma_pago f, fac_tipo_forma_pago t
				 WHERE f.id_factura = pnIdFactura
					 AND t.id_tipo_forma_pago = f.id_tipo_forma_pago;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcFormas   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcForma;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '|';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcFormas = CONCAT(vcFormas, vcSeparador, vcForma);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcFormas;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtFormasPagoCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtFormasPagoCompra`(pnIdCompra INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcFormasPagoCompra   VARCHAR(256);
    DECLARE vcFormasPago         VARCHAR(100);
    DECLARE viDone               INT DEFAULT 0;
    DECLARE viCuenta             INT DEFAULT 0;
    DECLARE vcSeparador          VARCHAR(4);

    DECLARE
      cur1 CURSOR FOR

        SELECT t.descripcion_tipo_forma_pago_compra AS tipo
	        FROM prv_forma_pago_compra f, prv_tipo_forma_pago_compra t
         WHERE f.id_compra = pnIdCompra
           AND f.id_tipo_forma_pago_compra = t.id_tipo_forma_pago_compra;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcFormasPagoCompra   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcFormasPago;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '; ';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcFormasPagoCompra   = CONCAT(vcFormasPagoCompra, vcSeparador, vcFormasPago);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcFormasPagoCompra;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdCabecera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdCabecera`(modulo VARCHAR(3), tipo VARCHAR(3), codigo INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE idCabecera INT;
    
    IF modulo = 'RES' THEN
			IF tipo = 'ITI' THEN
			  SELECT d.id_reserva
					INTO idCabecera
					FROM res_detalle_reserva d, res_itinerario i
				 WHERE d.id_detalle_reserva = i.id_detalle_reserva
				   AND i.id_itinerario_res = codigo
				LIMIT 0,1;
			END IF;
    END IF;
    
    IF modulo = 'PRF' THEN
			IF tipo = 'ITI' THEN
			  SELECT d.id_proforma
					INTO idCabecera
					FROM fac_detalle_proforma d, fac_itinerario i
				 WHERE d.id_detalle_proforma = i.id_detalle_proforma
				   AND i.id_itinerario_fac = codigo
				LIMIT 0,1;
			END IF;
    END IF;
    
    IF modulo = 'FAC' THEN
			IF tipo = 'ITI' THEN
			  SELECT d.id_factura
					INTO idCabecera
					FROM fac_detalle_factura d, fac_itinerario i
				 WHERE d.id_detalle_factura = i.id_detalle_factura
				   AND i.id_itinerario_fac = codigo
				LIMIT 0,1;
			END IF;
    END IF;
    RETURN idCabecera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdCompraXRet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdCompraXRet`(idRetencion INT(11)) RETURNS varchar(15) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE idCompra VARCHAR(15);

	SELECT c.id_origen
	INTO idCompra
		FROM ctb_comprobante c
		INNER JOIN ctb_retencion r ON c.id_comprobante = r.id_comprobante
		WHERE c.tipo_origen = 'CMAU'
		AND r.id_retencion = idRetencion;

    RETURN idCompra;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdComprobanteXCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdComprobanteXCompra`(idCompra INT(11)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE idComprobante INT(11);


	SELECT m.id_comprobante
	  INTO idComprobante
		FROM ctb_comprobante m
	 WHERE m.tipo_origen = 'CMAU'
		 AND m.id_origen = idCompra;

  RETURN idComprobante;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdCuenta`(pcTipo VARCHAR(4), piIdPeriodo INT, pcCodigo VARCHAR(20), pcEfectivoCredito CHAR(1), pcEsCajaChica CHAR(1), idCentroCosto INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE viIdCuenta INT;
  DECLARE vcTipoCuenta VARCHAR(4);
   
   IF pcTipo = 'IINV' THEN
     SELECT cxi.id_cuenta_insumo
       INTO viIdCuenta
       FROM prd_cuenta_x_insumo cxi
      WHERE cxi.id_insumo = pcCodigo
        AND cxi.id_periodo = piIdPeriodo;
     IF viIdCuenta IS NULL THEN
       SELECT g.id_cuenta
         INTO viIdCuenta
         FROM ctb_cuenta_general g 
        WHERE g.id_periodo = piIdPeriodo 
          AND g.id_tipo_cuenta_general = pcTipo;
     END IF;
   END IF;
   
   IF pcTipo = 'CTIV' THEN
     SELECT cxi.id_cuenta_venta
       INTO viIdCuenta
       FROM prd_cuenta_x_impuesto cxi 
      WHERE cxi.id_impuesto = pcCodigo 
        AND cxi.id_periodo = piIdPeriodo;
   END IF;
   
   IF pcTipo = 'CTIC' THEN
     SELECT cxi.id_cuenta_compra
       INTO viIdCuenta
       FROM prd_cuenta_x_impuesto cxi 
      WHERE cxi.id_impuesto = pcCodigo 
        AND cxi.id_periodo = piIdPeriodo;
   END IF;
   
   IF pcTipo = 'PRV' THEN
     IF pcEsCajaChica = 'S' THEN
       SELECT b.id_cuenta
         INTO viIdCuenta
         FROM ctb_centro_costo c, ctb_caja_chica cc, ctb_cuenta_x_caja_chica b
        WHERE c.id_centro_costo = idCentroCosto
          AND c.id_centro_costo = cc.id_centro_costo
          AND b.id_caja_chica = cc.id_caja_chica
          AND b.id_periodo = piIdPeriodo;
		 ELSE
		   SELECT IF(pcEfectivoCredito='E',cxp.id_cuenta_fp_inmediata,cxp.id_cuenta_fp_noinmediata)
				 INTO viIdCuenta
				 FROM prv_cuenta_x_proveedor cxp
				WHERE cxp.id_proveedor = pcCodigo
					AND cxp.id_periodo = piIdPeriodo;
			 IF viIdCuenta IS NULL THEN
				 SELECT g.id_cuenta 
					 INTO viIdCuenta
					 FROM ctb_cuenta_general g 
					WHERE g.id_periodo = piIdPeriodo 
						AND g.id_tipo_cuenta_general = IF(pcEfectivoCredito='E','PRV1','PROV');
			 END IF;
     END IF;
   END IF;
   
   IF pcTipo = 'CLI' THEN
     SELECT IF(pcEfectivoCredito='E',cxc.id_cuenta_fp_inmediata,cxc.id_cuenta_fp_noinmediata)
       INTO viIdCuenta
       FROM fac_cuenta_x_cliente cxc 
      WHERE cxc.id_cliente_factura = pcCodigo
        AND cxc.id_periodo = piIdPeriodo;
     IF viIdCuenta IS NULL THEN
			 SELECT g.id_cuenta 
				 INTO viIdCuenta
				 FROM ctb_cuenta_general g 
				WHERE g.id_periodo = piIdPeriodo 
					AND g.id_tipo_cuenta_general = IF(pcEfectivoCredito='E','CLI1','CLIE');
		 END IF;
   END IF;
   
   IF pcTipo = 'PVN' THEN
     SELECT cxp.id_cuenta_producto 
			 INTO viIdCuenta
       FROM prd_cuenta_x_producto cxp
      WHERE cxp.id_producto = pcCodigo
        AND cxp.id_periodo = piIdPeriodo;
     IF viIdCuenta IS NULL THEN
			 SELECT g.id_cuenta 
         INTO viIdCuenta
         FROM ctb_cuenta_general g 
        WHERE g.id_periodo = piIdPeriodo 
          AND g.id_tipo_cuenta_general = 'PROD';
		 END IF;
   END IF;
       
  RETURN viIdCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdCuentaXPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdCuentaXPeriodo`(pcId VARCHAR(50), pnIdPeriodo INT, pcTipo VARCHAR(3)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE vnIdCuenta INT;

  CASE pcTipo
		WHEN 'IMC' THEN
			SELECT cxi.id_cuenta_compra
				INTO vnIdCuenta
				FROM prd_cuenta_x_impuesto cxi
			 WHERE cxi.id_impuesto = pcId
				 AND cxi.id_periodo = pnIdPeriodo;
		WHEN 'IMV' THEN
			SELECT cxi.id_cuenta_venta
				INTO vnIdCuenta
				FROM prd_cuenta_x_impuesto cxi
			 WHERE cxi.id_impuesto = pcId
				 AND cxi.id_periodo = pnIdPeriodo;
		WHEN 'PRD' THEN
			SELECT cxp.id_cuenta_producto
				INTO vnIdCuenta
				FROM prd_cuenta_x_producto cxp
			 WHERE cxp.id_producto = pcId
				 AND cxp.id_periodo = pnIdPeriodo;
  END CASE;

  RETURN vnIdCuenta;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdEmpresaRelacionadaPin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdEmpresaRelacionadaPin`(pnPin INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnId INT;

    SELECT e.id_empresa_relacionada
      INTO vnId
			FROM gecoecua_gecoindex.adm_empresa_nick n, prm_empresa_relacionada e
		 WHERE n.nick = e.nick_empresa_relacionada
			 AND n.pin_empresarial = pnPin;

    RETURN vnId;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdentificacionPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdentificacionPrincipal`(pnId INT, pcTipo CHAR(3)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcIdentificacion VARCHAR(100);
    
    IF pcTipo = 'PER' THEN
      SELECT t.descripcion_identificacion
        INTO vcIdentificacion
        FROM per_identificacion t
       WHERE t.id_persona = pnId
         AND t.principal_identificacion = 'S';
    END IF;
    IF pcTipo = 'PRV' THEN
      SELECT t.descripcion_identificacion
        INTO vcIdentificacion
        FROM per_identificacion t, prv_proveedor p
       WHERE p.id_proveedor = pnId
         AND t.id_persona = p.id_persona
         AND t.principal_identificacion = 'S';
    END IF;
    IF pcTipo = 'CLI' THEN
      SELECT t.descripcion_identificacion
        INTO vcIdentificacion
        FROM per_identificacion t, fac_cliente_factura c
       WHERE c.id_cliente_factura = pnId
         AND t.id_persona = c.id_persona
         AND t.principal_identificacion = 'S';
    END IF; 

    RETURN vcIdentificacion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdInternoSincronizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdInternoSincronizacion`(idEmpresaRelacionada INT, nombreTabla VARCHAR(256), idExterno VARCHAR(15)) RETURNS varchar(15) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE idInterno VARCHAR(15);

    SELECT s.id_interno
      INTO idInterno
			FROM prm_sincronizacion s
		 WHERE s.id_empresa_relacionada = idEmpresaRelacionada
			 AND s.nombre_tabla = nombreTabla
			 AND s.id_externo = idExterno;

    RETURN idInterno;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdOperacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdOperacion`(pnIdProducto VARCHAR(15)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnIdOperacion   INTEGER;

    SELECT u.id_operacion
      INTO vnIdOperacion
      FROM prd_producto p,
           prd_tipo_producto t,
           prd_unidad_estrategica u
     WHERE     p.id_tipo_producto = t.id_tipo_producto
           AND t.id_unidad_estrategica = u.id_unidad_estrategica
           AND p.id_producto = pnIdProducto;

    RETURN vnIdOperacion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdPersona`(pcId VARCHAR(15), pcTipo CHAR(1)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnIdPersona   FLOAT;

    
    IF pcTipo = 'U'
    THEN
      SELECT u.id_persona
        INTO vnIdPersona
        FROM seg_usuario u
       WHERE u.id_usuario = pcId;
    END IF;

    RETURN vnIdPersona;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdPrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdPrecioProducto`(idProductoXPrecioProducto INT) RETURNS varchar(15) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE idPrecioProducto VARCHAR(15);

	SELECT p.id_precio_producto
	  INTO idPrecioProducto
    FROM prd_producto_x_precio_producto p
   WHERE p.id_producto_x_precio_producto = idProductoXPrecioProducto;

  RETURN idPrecioProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdPrecioXTemporadaPrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdPrecioXTemporadaPrecioProducto`(pcIdPrecioProducto VARCHAR(15)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE	vnIdTemporada INT;
  SELECT pxt.id_precio_x_temporada
		INTO vnIdTemporada
		FROM prd_precio_producto pp, prd_temporada t, prd_precio_x_temporada pxt
	 WHERE pp.id_precio_producto = pxt.id_precio_producto
		 AND t.id_temporada = pxt.id_temporada
		 AND t.principal_temporada = 'S'
		 AND pp.estado_precio_producto = 'A'
		 AND pp.id_precio_producto = pcIdPrecioProducto
  LIMIT 0,1;
	RETURN vnIdTemporada; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdReservaXIdItinerario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdReservaXIdItinerario`(idItinerario INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE idReserva INT;

    SELECT d.id_reserva
      INTO idReserva
		  FROM res_detalle_reserva d, res_itinerario i
		 WHERE d.id_detalle_reserva = i.id_detalle_reserva 
		   AND i.id_itinerario_res = idItinerario;

    RETURN idReserva;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdTpProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdTpProducto`(pcIdProducto VARCHAR(15)) RETURNS varchar(15) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcIdTpProducto   VARCHAR(15);

    SELECT p.id_tipo_producto
      INTO vcIdTpProducto
      FROM prd_producto p
     WHERE p.id_producto = pcIdProducto;

    RETURN vcIdTpProducto;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtIdUnidadEstrategica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtIdUnidadEstrategica`(idProducto VARCHAR(15)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE idUnidadEstrategica INT;

	SELECT u.id_unidad_estrategica
	  INTO idUnidadEstrategica
		FROM prd_producto p, prd_tipo_producto t, prd_unidad_estrategica u
	 WHERE p.id_producto = idProducto
		 AND p.id_tipo_producto = t.id_tipo_producto
		 AND t.id_unidad_estrategica = u.id_unidad_estrategica;

  RETURN idUnidadEstrategica;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtInsumosProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtInsumosProducto`(pnIdTipoInsumo INT, pnNroPax INT, pnCantidad FLOAT, pnUtilidad FLOAT, pdFechaIni DATE, pdFechaFin DATE) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE vnCosto DECIMAL(15,4) DEFAULT 0;
	DECLARE vnCostoTotal FLOAT DEFAULT 0;
	DECLARE vnImpuesto DECIMAL(15,4) DEFAULT 0;
	DECLARE viDone INT DEFAULT 0;
	
	DECLARE vnPorcImp DECIMAL(15,4);
	DECLARE vnValImp DECIMAL(15,4);
	DECLARE vnCantidadInsumo DECIMAL(15,4);
	DECLARE vnCostoItem DECIMAL(15,4);
	DECLARE vcIndividualGeneral CHAR(1);
	DECLARE vnPorcionXMedida DECIMAL(15,4);
	
	DECLARE cur1 CURSOR FOR
		SELECT IFNULL((SELECT SUM(i.cantidad_impuesto)
     									FROM prd_impuesto_x_insumo ixi, prd_impuesto i
     								 WHERE ixi.id_impuesto = i.id_impuesto
											 AND i.tipo_impuesto = 'P'
											 AND ixi.id_insumo = m.id_insumo),
     							 0
     			 ) AS porcentaje_impuesto,
     			 IFNULL((SELECT SUM(i.cantidad_impuesto)
     									FROM prd_impuesto_x_insumo ixi, prd_impuesto i
     								 WHERE ixi.id_impuesto = i.id_impuesto
											 AND i.tipo_impuesto = 'V'
											 AND ixi.id_insumo = m.id_insumo),
     							 0
     			 ) AS valor_impuesto,
           IFNULL(p.precio_insumo,0) AS precio_fijo,
           IFNULL(m.individual_general, 'I') AS individual_general,
           IFNULL(m.porcion_x_medida, 1) AS porcion_x_medida
     	FROM prd_insumo m, prd_precio_insumo p
      WHERE m.id_tipo_insumo = pnIdTipoInsumo
				AND m.id_insumo = p.id_insumo
				AND (((p.fecha_inicio_vigencia BETWEEN pdFechaIni AND pdFechaFin) 
							OR(p.fecha_fin_vigencia BETWEEN pdFechaIni AND pdFechaFin))
							OR((pdFechaIni BETWEEN p.fecha_inicio_vigencia AND p.fecha_fin_vigencia)
							OR(pdFechaIni BETWEEN p.fecha_inicio_vigencia AND p.fecha_fin_vigencia)))
        AND pnNroPax BETWEEN p.pax_ini AND p.pax_fin;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone = 1;
	
	OPEN cur1;
		FETCH cur1 INTO vnPorcImp,vnValImp,vnCostoItem,vcIndividualGeneral,vnPorcionXMedida;
		WHILE viDone = 0 DO			
			SET vnCosto = vnCostoItem / vnPorcionXMedida;
			SET vnImpuesto = (vnCosto * vnPorcImp / 100) + (vnValImp / vnPorcionXMedida);
			SET vnCosto = vnCosto + vnImpuesto;
			IF IFNULL(pnUtilidad,0) > 0 THEN
			  SET vnCosto = vnCosto / pnUtilidad;
			END IF;
			IF vcIndividualGeneral = 'G' THEN
			  SET vnCantidadInsumo = 1;
			ELSE
				IF IFNULL(pnCantidad,0) = 0 THEN
					SET vnCantidadInsumo = pnNroPax;
				ELSE
					SET vnCantidadInsumo = pnCantidad;
				END IF;
			END IF;
			SET vnCosto = vnCosto * vnCantidadInsumo;
			SET vnCostoTotal = vnCostoTotal + vnCosto;			
			FETCH cur1 INTO vnPorcImp,vnValImp,vnCostoItem,vcIndividualGeneral,vnPorcionXMedida;
		END WHILE;
	CLOSE cur1;
	RETURN IFNULL(vnCostoTotal,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtMilPorciento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtMilPorciento`(idConcepto VARCHAR(15)) RETURNS char(1) CHARSET latin1
BEGIN
  DECLARE milPorciento CHAR(1);

  SELECT IFNULL(mil_porciento, 'N')
    INTO milPorciento
    FROM ctb_concepto_retencion
   WHERE id_concepto_retencion = idConcepto;

  RETURN milPorciento;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtMonedaPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtMonedaPrincipal`() RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnIdMoneda   INTEGER;

    SELECT m.id_moneda
      INTO vnIdMoneda
      FROM prm_moneda m
     WHERE m.principal_moneda = 'S';

    RETURN vnIdMoneda;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtMotivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtMotivo`(pnIdMotivo INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcMotivo   VARCHAR(256);

    SELECT TRIM(descripcion_motivo)
      INTO vcMotivo
      FROM prm_motivo
     WHERE id_motivo = pnIdMotivo;

    RETURN vcMotivo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtMotivosNoAplicaCaso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtMotivosNoAplicaCaso`(idCaso INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE motivos   TEXT;
    DECLARE motivo    TEXT;
    DECLARE done      INT DEFAULT 0;
    DECLARE contador  INT DEFAULT 0;
    DECLARE separador VARCHAR(10);

    DECLARE
      cur CURSOR FOR
        SELECT o.descripcion_motivo_no_aprueba_caso
					FROM crm_caso_x_motivo_no_aplica m, crm_motivo_no_aprueba_caso o
				 WHERE m.id_caso = idCaso
					 AND m.id_motivo_no_aprueba_caso = o.id_motivo_no_aprueba_caso;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
    SET motivos   = '';

    OPEN cur;

    REPEAT
      FETCH cur INTO motivo;

      SET contador = contador + 1;

      IF NOT done
      THEN
        IF contador > 1
        THEN
          SET separador   = ' | ';
        ELSE
          SET separador   = '';
        END IF;

        SET motivos = CONCAT(motivos, separador, contador, ': ', motivo);
      END IF;
    UNTIL done
    END REPEAT;

    CLOSE cur;

    RETURN motivos;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtMotivoUltimoEstadoReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtMotivoUltimoEstadoReserva`(idReserva INT) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE motivo VARCHAR(100);

    SELECT CONCAT(m.descripcion_motivo, ' ', IFNULL(g.observacion_registro_estado,'')) AS motivo
      INTO motivo
      FROM res_registro_estado g, prm_motivo m
     WHERE g.id_reserva = idReserva
       AND g.id_motivo = m.id_motivo
       AND g.id_registro_estado = (SELECT MAX(e.id_registro_estado) FROM res_registro_estado e WHERE e.id_reserva = idReserva);

    RETURN motivo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNickUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNickUsuario`(pcIdUsuario VARCHAR(25)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNick VARCHAR(256);

    SELECT IFNULL(nick_empresa_relacionada,'')
      INTO vcNick
			FROM seg_usuario
		 WHERE id_usuario = pcIdUsuario;

    RETURN vcNick;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNombreBDD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNombreBDD`() RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcBdd   VARCHAR(100);

    SELECT nombre_base_datos
      INTO vcBdd
      FROM prm_empresa
     WHERE id_empresa = 1;

    RETURN vcBdd;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNombreClasificador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNombreClasificador`(idSuperTipo INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE nombre VARCHAR(256);

    SELECT descripcion_super_tipo_insumo
      INTO nombre
      FROM prd_super_tipo_insumo
     WHERE id_super_tipo_insumo = idSuperTipo;

    RETURN nombre;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNombreComercialPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNombreComercialPersona`(pnIdPersona INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE nombreComercial VARCHAR(256);

    SELECT TRIM(nombre_comercial)
      INTO nombreComercial
      FROM per_persona
     WHERE id_persona = pnIdPersona;

    RETURN nombreComercial;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNombreEmpresaRelacionada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNombreEmpresaRelacionada`(pnIdEmpresaRelacionada INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNombreEmpresa VARCHAR(256);

    SELECT n.nombre_empresa
      INTO vcNombreEmpresa
			FROM prm_empresa_relacionada e, gecoecua_gecoindex.adm_empresa_nick n
		 WHERE e.id_empresa_relacionada = pnIdEmpresaRelacionada
			 AND e.nick_empresa_relacionada = n.nick;

    RETURN vcNombreEmpresa;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNombreImpuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNombreImpuesto`(idImpuesto VARCHAR(15)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE nombreImpuesto VARCHAR(256);

    SELECT i.descripcion_impuesto
      INTO nombreImpuesto
			FROM prd_impuesto i
		 WHERE i.id_impuesto = idImpuesto;

    RETURN nombreImpuesto;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNombreModulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNombreModulo`(idModulo VARCHAR(4)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE nombre VARCHAR(100);

    SELECT descripcion_modulo
      INTO nombre
      FROM seg_modulo
     WHERE id_modulo = idModulo;

    RETURN nombre;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNombrePrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNombrePrecioProducto`(pcIdPrecioProducto VARCHAR(15)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE	vcNombrePrecioProducto VARCHAR(100);
  SELECT descripcion_precio_producto
    INTO vcNombrePrecioProducto
		FROM prd_precio_producto
	 WHERE id_precio_producto = pcIdPrecioProducto;
	RETURN vcNombrePrecioProducto; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNomTemporadaPrecioXTemporada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNomTemporadaPrecioXTemporada`(pcIdPrecioXTemporada INT) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE	vcTemporada VARCHAR(100);
  SELECT t.descripcion_temporada
		INTO vcTemporada
		FROM prd_precio_x_temporada pxt, prd_temporada t
	 WHERE t.id_temporada = pxt.id_temporada
	   AND pxt.id_precio_x_temporada = pcIdPrecioXTemporada;
	RETURN vcTemporada; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNroDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNroDetalle`(modulo CHAR(3), idDetalle INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE nroPax INT;

    IF modulo = 'RES' THEN
      SELECT nro_pax
        INTO nroPax
        FROM res_detalle_reserva
       WHERE id_detalle_reserva = idDetalle;
    ELSEIF modulo = 'PRF' THEN
      SELECT nro_pax
        INTO nroPax
        FROM fac_detalle_proforma
       WHERE id_detalle_proforma = idDetalle;
    ELSEIF modulo = 'FAC' THEN
      SELECT nro_pax
        INTO nroPax
        FROM fac_detalle_factura
       WHERE id_detalle_factura = idDetalle;
    END IF;

    RETURN nroPax;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNroOcurrencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNroOcurrencias`(pcCadena TEXT, pcSeparador CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE viNroOcurrencias INTEGER;
		DECLARE vbContinua BIT;
		DECLARE viPosicion INTEGER;
		DECLARE vcCadena TEXT;
		
		SET vbContinua = 0;
		SET vcCadena = pcCadena;
		SET viNroOcurrencias = 0;
		
		WHILE vbContinua = 0 DO
			SET viPosicion = INSTR(vcCadena, pcSeparador);			
			IF viPosicion > 0 THEN
			  SET viPosicion = viPosicion + 1;
				SET vcCadena = SUBSTRING(vcCadena, viPosicion);
				SET viNroOcurrencias = viNroOcurrencias + 1;
			ELSE
				SET vbContinua = 1;
			END IF;
		END WHILE;

    RETURN viNroOcurrencias;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtNroTransacciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtNroTransacciones`(idCuenta INT, idPeriodo INT, codContable VARCHAR(15), movimiento CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE nroTransacciones INT;
		
		IF movimiento = 'S' THEN
			SELECT COUNT(*)
				INTO nroTransacciones
				FROM ctb_det_comprobante d 
			 WHERE d.id_periodo = idPeriodo
				 AND d.id_cuenta = idCuenta;
		ELSE
		  SELECT COUNT(*)
				INTO nroTransacciones
				FROM ctb_det_comprobante d, ctb_cuenta c
			 WHERE d.id_cuenta = c.id_cuenta
			   AND d.id_periodo = idPeriodo
				 AND c.codigo_contable LIKE CONCAT(codContable, '%');
		END IF;

    RETURN nroTransacciones;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtOtrosTelefonos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtOtrosTelefonos`(pnIdPersona INT(11)) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTelefonos   TEXT;
    DECLARE vcTelefono    VARCHAR(100);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   VARCHAR(4);

    DECLARE
      cur1 CURSOR FOR
        SELECT t.descripcion_telefono AS telefono
          FROM per_tipo_telefono d, per_telefono t
         WHERE d.id_tipo_telefono = t.id_tipo_telefono
           AND t.id_persona = pnIdPersona
           AND t.principal_telefono = 'N';

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcTelefonos   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcTelefono;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = ' / ';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcTelefonos   = CONCAT(vcTelefonos, vcSeparador, vcTelefono);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcTelefonos;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPerfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPerfil`(pnIdPerfil VARCHAR(4)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcPerfil   VARCHAR(100);
    SELECT TRIM(descripcion_perfil)
      INTO vcPerfil
      FROM seg_perfil
     WHERE id_perfil = pnIdPerfil;
    RETURN vcPerfil;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPermisosVentana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPermisosVentana`(pnIdOpcionMenu VARCHAR(50), pcIdUsuario VARCHAR(100)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcPermisos   VARCHAR(256);
    DECLARE vcPermiso    VARCHAR(15);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;

    DECLARE
      cur1 CURSOR FOR
        SELECT CONCAT(o.descripcion_objeto, ':', p.tipo_permiso_objeto_x_perfil) AS permiso
					FROM seg_objeto o, seg_permiso_objeto_x_perfil p, seg_usuario u
				 WHERE o.id_opcion_menu = pnIdOpcionMenu
					 AND o.id_objeto = p.id_objeto
					 AND p.id_perfil = u.id_perfil
					 AND u.id_usuario = pcIdUsuario;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcPermisos   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcPermiso;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        SET vcPermisos = CONCAT(vcPermisos, '|', vcPermiso);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcPermisos;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPersonaEs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPersonaEs`(idPersona INT, tipo CHAR(3)) RETURNS char(1) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE personaEs1 INT;
    DECLARE personaEs2 INT;
    DECLARE personaEs3 INT;
    DECLARE personaEs4 INT;
    DECLARE personaEs5 INT;

    SELECT (SELECT COUNT(*) FROM prv_proveedor v WHERE v.id_persona = p.id_persona),
           (SELECT COUNT(*) FROM res_persona_x_reserva pxr WHERE pxr.id_persona = p.id_persona),
           (SELECT COUNT(*) FROM fac_proforma f WHERE f.id_persona = p.id_persona),
           (SELECT COUNT(*) FROM res_reserva r WHERE r.id_persona = p.id_persona),
           (SELECT COUNT(*) FROM seg_usuario u WHERE u.id_persona = p.id_persona)
      INTO personaEs1, personaEs2, personaEs3, personaEs4, personaEs5
      FROM per_persona p
     WHERE p.id_persona = idPersona;
    
    IF(tipo = 'PRV' AND personaEs1 > 0) THEN
      RETURN 'S';
    END IF;
    IF(tipo = 'PAX' AND personaEs2 > 0) THEN
      RETURN 'S';
    END IF;
    IF(tipo = 'PRF' AND personaEs3 > 0) THEN
      RETURN 'S';
    END IF;
    IF(tipo = 'RES' AND personaEs4 > 0) THEN
      RETURN 'S';
    END IF;
    IF(tipo = 'USR' AND personaEs5 > 0) THEN
      RETURN 'S';
    END IF;

    RETURN 'N';
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPersonaRelacionPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPersonaRelacionPrincipal`(pnIdPersona FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcRazonSocial   VARCHAR(256);

    SELECT fNombrePersona(r.id_persona2) nombre
      INTO vcRazonSocial
      FROM per_relacion r
     WHERE r.id_persona = pnIdPersona AND r.principal_relacion = 'S';

    RETURN vcRazonSocial;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPorcentajeDevolucion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPorcentajeDevolucion`(pnIdReserva FLOAT) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnPorcentaje   FLOAT;

    SELECT e.porcentaje_devolucion_anticipo
      INTO vnPorcentaje
      FROM res_registro_estado e
     WHERE e.id_reserva = pnIdReserva
			 AND e.id_registro_estado = (SELECT MAX(g.id_registro_estado)
																		 FROM res_registro_estado g
																		WHERE g.id_reserva = pnIdReserva);

    IF vnPorcentaje IS NULL
    THEN
      SET vnPorcentaje   = 0;
    END IF;

    RETURN vnPorcentaje;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPorcentajeImpuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPorcentajeImpuesto`(idImpuesto VARCHAR(4), fecha DATE) RETURNS decimal(15,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE porcentaje DECIMAL(15,4);
    DECLARE tipoValor CHAR(1);

    SELECT tipo_valor, cantidad_impuesto
      INTO tipoValor, porcentaje
      FROM prd_impuesto
     WHERE id_impuesto = idImpuesto;
    
    IF tipoValor = 'R' THEN
      SELECT r.porcentaje
        INTO porcentaje
			  FROM prd_rango_impuesto r
			 WHERE r.id_impuesto = idImpuesto
			   AND fecha BETWEEN r.fecha_inicio AND r.fecha_fin;
    END IF;

    RETURN IFNULL(porcentaje, 0);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPorcentajeXCobrarPagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPorcentajeXCobrarPagar`(tipo CHAR(3), idFactura INT, idCompra INT, idCobroPago INT) RETURNS decimal(15,8)
BEGIN
  DECLARE porcentaje DECIMAL (15, 8);
  DECLARE porcentaje1 DECIMAL (15, 8);
  DECLARE porcentaje2 DECIMAL (15, 8);

  IF tipo = 'P' THEN
    SELECT SUM(f.porcentaje_forma_pago)
      INTO porcentaje1
      FROM prv_forma_pago_compra f, prv_tipo_forma_pago_compra t
     WHERE f.id_compra = idCompra
       AND f.id_tipo_forma_pago_compra = t.id_tipo_forma_pago_compra
       AND t.efectivo_credito != 'E'
       AND f.id_forma_pago_compra IN (SELECT d.id_forma_pago_compra FROM crt_detalle_cobro_pago d WHERE d.id_cobro_pago != idCobroPago);

    SELECT SUM(f.porcentaje_forma_pago)
      INTO porcentaje2
      FROM prv_forma_pago_compra f, prv_tipo_forma_pago_compra t
     WHERE f.id_compra = idCompra
       AND f.id_tipo_forma_pago_compra = t.id_tipo_forma_pago_compra
       AND t.efectivo_credito = 'E';
  ELSE
    SELECT SUM(f.porcentaje_forma_pago)
      INTO porcentaje1
      FROM fac_forma_pago f, fac_tipo_forma_pago t
     WHERE f.id_factura = idFactura
       AND f.id_tipo_forma_pago = t.id_tipo_forma_pago
       AND t.efectivo_credito != 'E'
       AND f.id_forma_pago IN (SELECT d.id_forma_pago FROM crt_detalle_cobro_pago d WHERE d.id_cobro_pago != idCobroPago);

    SELECT SUM(f.porcentaje_forma_pago)
      INTO porcentaje2
      FROM fac_forma_pago f, fac_tipo_forma_pago t
     WHERE f.id_factura = idFactura
       AND f.id_tipo_forma_pago = t.id_tipo_forma_pago
       AND t.efectivo_credito = 'E';
  END IF;
  
  SET porcentaje = IFNULL(porcentaje1, 0) - IFNULL(porcentaje2, 0);
  
  IF porcentaje != 100 THEN
    SET porcentaje = 100 - porcentaje;
  END IF;
  
  RETURN porcentaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrecioInsumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrecioInsumo`(pnIdInsumo INTEGER) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnPrecio   FLOAT;

    SELECT IFNULL(IF (m.tipo_precio_insumo = 'L',
                       (SELECT p.precio_insumo
                          FROM prd_precio_insumo p
                         WHERE p.id_insumo = m.id_insumo
                               AND p.principal_precio_insumo = 'S'),
                       m.costo_promedio
                   ),
                   0
           )
      INTO vnPrecio
      FROM prd_insumo m
     WHERE m.id_insumo = pnIdInsumo;

    RETURN vnPrecio;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrecioInsumoXFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrecioInsumoXFecha`(idInsumo INT, fecha DATE) RETURNS decimal(15,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE precio DECIMAL(15,4);

    SELECT p.precio_insumo 
      INTO precio
		  FROM prd_precio_insumo p
		 WHERE p.id_insumo = idInsumo
		   AND fecha BETWEEN p.fecha_inicio_vigencia AND p.fecha_fin_vigencia;

    RETURN precio;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrecioInsumoXItinerario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrecioInsumoXItinerario`(pcModulo CHAR(3), pnIdInsumo INT, pnIdDetalle INT, pcTipoPrecio CHAR(1), pnIdPrecioInsumo INT, pnPrecioFijo DECIMAL(15,4), pnFactor DECIMAL(15,4)) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE	vnPrecio FLOAT;
  DECLARE	vnPrecio2 FLOAT;
  DECLARE vnIdTipoInsumo INT;
  DECLARE	vnPrecioLista FLOAT;
  DECLARE	vcEsSingleSuplement CHAR(1);

  IF pcModulo = 'RES' THEN
		SELECT d.es_single_suplement
		  INTO vcEsSingleSuplement
			FROM res_detalle_reserva d
		 WHERE d.id_detalle_reserva = pnIdDetalle;
  END IF;

  IF pcModulo = 'FAC' THEN
		SELECT pxr.es_single_suplement
			INTO vcEsSingleSuplement
			FROM fac_detalle_factura pxr
		 WHERE pxr.id_detalle_factura = pnIdDetalle;
  END IF;

  IF pcModulo = 'PRF' THEN
		SELECT pxr.es_single_suplement
			INTO vcEsSingleSuplement
			FROM fac_detalle_proforma pxr
		 WHERE pxr.id_detalle_proforma = pnIdDetalle;
  END IF;

  SELECT m.id_tipo_insumo,
           IFNULL((SELECT p.precio_insumo
										 FROM prd_precio_insumo p
									  WHERE p.id_insumo = m.id_insumo
										  AND p.id_precio_insumo = pnIdPrecioInsumo),
									 IFNULL((SELECT p.precio_insumo
                          FROM prd_precio_insumo p
                         WHERE p.id_insumo = m.id_insumo
                               AND p.principal_precio_insumo = 'S'),
                               m.costo_promedio))
		INTO vnIdTipoInsumo, vnPrecioLista
		FROM prd_insumo m
   WHERE m.id_insumo = pnIdInsumo;

  IF pcTipoPrecio = 'L' THEN
	  SET vnPrecio = vnPrecioLista;
	ELSE
		SET vnPrecio = pnPrecioFijo;
	END IF;

	IF vcEsSingleSuplement = 'S' THEN
	  SELECT IFNULL(pri.precio_insumo, 0)
	    INTO vnPrecio2
		  FROM prd_insumo i, prd_precio_insumo pri
		 WHERE i.id_insumo = pri.id_insumo
		   AND i.id_tipo_insumo = vnIdTipoInsumo
		   AND pri.pax_ini = 2;
		IF vnPrecio2 > 0 THEN
		  SET vnPrecio = vnPrecio - vnPrecio2;
		END IF;
	END IF;

	SET vnPrecio = vnPrecio * pnFactor;

	RETURN vnPrecio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrecioMasImpXProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrecioMasImpXProducto`(pnIdPrdXPrecioPrd VARCHAR(15), pcIdProducto VARCHAR(15)) RETURNS decimal(10,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnPrecio  DECIMAL(10,4);
    DECLARE vnImpuestoPor  DECIMAL(10,4);
    DECLARE vnImpuestoVal  DECIMAL(10,4);

		SELECT IFNULL(SUM(i.cantidad_impuesto),0)
		  INTO vnImpuestoVal
			FROM prd_impuesto i, prd_impuesto_x_producto ixp
		 WHERE i.id_impuesto = ixp.id_impuesto
			 AND ixp.id_producto = pcIdProducto
			 AND i.tipo_impuesto = 'V';

		SELECT IFNULL(SUM(i.cantidad_impuesto),0)
		  INTO vnImpuestoPor
			FROM prd_impuesto i, prd_impuesto_x_producto ixp
		 WHERE i.id_impuesto = ixp.id_impuesto
			 AND ixp.id_producto = pcIdProducto
			 AND i.tipo_impuesto = 'P';

		SELECT pxt.precio + vnImpuestoVal + (pxt.precio * vnImpuestoPor / 100)
		  INTO vnPrecio
		  FROM prd_precio_x_temporada pxt, prd_temporada t
		 WHERE pxt.id_precio_producto = pnIdPrdXPrecioPrd
			 AND pxt.id_temporada = t.id_temporada
			 AND t.principal_temporada = 'S';

    RETURN vnPrecio;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrecioProducto`(pcIdPrecioProducto VARCHAR(15)) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE	vnPrecioProducto FLOAT;
	SELECT pxt.precio
		INTO vnPrecioProducto
		FROM prd_precio_producto pp, prd_temporada t, prd_precio_x_temporada pxt
	 WHERE t.principal_temporada = 'S'
		 AND pp.id_precio_producto = pxt.id_precio_producto
		 AND t.id_temporada = pxt.id_temporada
		 AND pp.estado_precio_producto = 'A'
		 AND pp.id_precio_producto = pcIdPrecioProducto
	LIMIT 0,1;
	
	IF IFNULL(vnPrecioProducto, 0) = 0 THEN
	  SELECT pxt.precio
			INTO vnPrecioProducto
			FROM prd_precio_producto pp, prd_temporada t, prd_precio_x_temporada pxt
		 WHERE pp.id_precio_producto = pxt.id_precio_producto
			 AND t.id_temporada = pxt.id_temporada
			 AND pp.estado_precio_producto = 'A'
			 AND pp.id_precio_producto = pcIdPrecioProducto
		LIMIT 0,1;
	END IF;
		
	RETURN vnPrecioProducto; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrecioXPrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrecioXPrecioProducto`(idPrecioProducto VARCHAR(15)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE precios   VARCHAR(256);
    DECLARE precio    VARCHAR(100);
    DECLARE done      INT DEFAULT 0;
    DECLARE cont      INT DEFAULT 0;
    DECLARE separador VARCHAR(4);

    DECLARE cur CURSOR FOR
			SELECT CONCAT(IFNULL(pxt.pax_ini,0),' - ',IFNULL(pxt.pax_fin,0),': ', ROUND(IFNULL(pxt.precio,0), 2))
				FROM prd_precio_x_temporada pxt, prd_temporada t
			 WHERE pxt.id_temporada = t.id_temporada
				 AND t.principal_temporada = 'S'
				 AND pxt.id_precio_producto = idPrecioProducto;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
    
    SET precios = '';

    OPEN cur;
    REPEAT
      FETCH cur INTO precio;
      SET cont = cont + 1;
      IF NOT done THEN
        IF cont > 1 THEN
          SET separador   = '| ';
        ELSE
          SET separador   = '';
        END IF;
        SET precios = CONCAT(precios, separador, precio);
      END IF;
    UNTIL done
    END REPEAT;
    CLOSE cur;

    RETURN precios;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrecioXPrecioXTemporada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrecioXPrecioXTemporada`(pcIdProducto VARCHAR(15), pcIdPrecioProducto VARCHAR(15), pcIdPrecioXTemporada INT) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE	vnPrecio FLOAT;
  SELECT pxt.precio
		INTO vnPrecio
		FROM prd_producto_x_precio_producto pxpp, prd_precio_producto pp, prd_temporada t, prd_precio_x_temporada pxt
	 WHERE pxpp.id_precio_producto = pp.id_precio_producto
		 AND pp.id_precio_producto = pxt.id_precio_producto
		 AND t.id_temporada = pxt.id_temporada
		 AND pp.estado_precio_producto = 'A'
		 AND pxt.id_producto = pcIdProducto
		 AND pp.id_precio_producto = pcIdPrecioProducto
		 AND pxt.id_precio_x_temporada = pcIdPrecioXTemporada;
	RETURN vnPrecio; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtPrimerIdPrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtPrimerIdPrecioProducto`(pcIdProducto VARCHAR(15), pnNroPax INT) RETURNS varchar(15) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE	vcIdPrecioProducto VARCHAR(15);
	
	IF pnNroPax > 0
	THEN
		SELECT pxpp.id_precio_producto AS codigo
			INTO vcIdPrecioProducto
			FROM prd_temporada m, prd_precio_x_temporada r, prd_precio_producto pp, prd_producto_x_precio_producto pxpp
		 WHERE m.principal_temporada = 'S'
		   AND m.id_temporada = r.id_temporada
			 AND pp.id_precio_producto = pxpp.id_precio_producto
			 AND r.id_precio_producto = pxpp.id_precio_producto
			 AND pxpp.id_producto = pcIdProducto
			 AND pnNroPax BETWEEN r.pax_ini AND r.pax_fin
		LIMIT 0, 1;
  END IF;
  
  IF IFNULL(vcIdPrecioProducto,'') = ''
  THEN
		SELECT pxpp.id_precio_producto AS codigo
			INTO vcIdPrecioProducto
			FROM prd_temporada m, prd_precio_x_temporada r, prd_producto_x_precio_producto pxpp
		 WHERE m.id_temporada = r.id_temporada
			 AND r.id_precio_producto = pxpp.id_precio_producto
			 AND pxpp.id_producto = pcIdProducto 
		LIMIT 0, 1;	 
	END IF;
	RETURN vcIdPrecioProducto; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtProductosReservados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtProductosReservados`(pnIdReserva INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcProducto  VARCHAR(256);
    DECLARE vcProductosReservados  TEXT;
    DECLARE vcSeparador   CHAR(1);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;

    DECLARE
      cur1 CURSOR FOR
        SELECT CONCAT(fNombreProducto(pxr.id_producto),' (',DATE_FORMAT(pxr.fecha_inicio,'%d/%m/%Y'),' - ', DATE_FORMAT(pxr.fecha_fin,'%d/%m/%Y'),')') AS texto
					FROM res_detalle_reserva pxr
				 WHERE pxr.id_reserva = pnIdReserva;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcProductosReservados   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcProducto;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '|';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcProductosReservados   = CONCAT(vcProductosReservados, vcSeparador, vcProducto);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcProductosReservados;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtProvincia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtProvincia`(pnIdPersona FLOAT) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE provincia   VARCHAR(100);

    SELECT pr.descripcion_provincia
      INTO provincia
      FROM per_provincia pr INNER JOIN per_ciudad c
      ON pr.id_provincia = c.id_provincia
      INNER JOIN per_direccion d ON c.id_ciudad = d.id_ciudad_direccion
     WHERE d.id_persona = pnIdPersona
     AND d.principal_direccion = 'S';

    RETURN provincia;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtRazonSocialPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtRazonSocialPersona`(pnIdPersona INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcRazonSocial   VARCHAR(256);

    SELECT TRIM(razon_social)
      INTO vcRazonSocial
      FROM per_persona
     WHERE id_persona = pnIdPersona;

    RETURN vcRazonSocial;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtRetencionCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtRetencionCompra`(idCompra INT(11)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE idRetencion INT(11);


	SELECT r.id_retencion
	  INTO idRetencion
		FROM prv_compra c, ctb_comprobante m, ctb_retencion r
	 WHERE c.id_compra = m.id_origen
		 AND m.tipo_origen = 'CMAU'
		 AND m.id_comprobante = r.id_comprobante
		 AND c.id_compra = idCompra;

  RETURN idRetencion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtRubrosCaso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtRubrosCaso`(pnIdCaso INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcRubros TEXT;
    DECLARE vcRubro    TEXT;
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   VARCHAR(10);

    DECLARE
      cur1 CURSOR FOR
        SELECT CONCAT_WS(' | ',a.descripcion_area, t.descripcion_tipo_caso_recurrente, r.descripcion_caso_recurrente, IFNULL(d.observacion_detalle_caso,'')) AS caso_r
					FROM crm_detalle_caso d, crm_area a, crm_caso_recurrente r, crm_tipo_caso_recurrente t
				 WHERE d.id_caso = pnIdCaso
					 AND d.id_area = a.id_area
					 AND d.id_caso_recurrente = r.id_caso_recurrente
					 AND t.id_tipo_caso_recurrente = r.id_tipo_caso_recurrente;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcRubros   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcRubro;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '\n';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcRubros = CONCAT(vcRubros, vcSeparador, viCuenta, '.', vcRubro);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcRubros;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtSaldoCantidadKardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtSaldoCantidadKardex`(idInsumo INT(11), idKardex  INT(11), cantidadKardex DECIMAL(15,8), signoKardex CHAR(1)) RETURNS decimal(15,8)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE saldo DECIMAL(15,8);
  DECLARE saldo1 DECIMAL(15,8);

	SELECT IFNULL(SUM(k.cantidad_kardex * IF(k.signo_kardex='-',-1,1)),0)
	  INTO saldo1
    FROM inv_kardex k
   WHERE k.id_insumo = idInsumo
     AND k.id_kardex < idKardex;
     
   IF signoKardex = '+' THEN
     SET saldo = saldo1 + cantidadKardex;
   ELSE
     SET saldo = saldo1 - cantidadKardex;
   END IF;

  RETURN saldo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtSaldoConciliar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtSaldoConciliar`(idCuenta INT, idPeriodo INT, fecha DATE, idConciliacion INT) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE saldo1 FLOAT;
    DECLARE saldo2 FLOAT;
    DECLARE saldo FLOAT;
    
    SELECT IFNULL(SUM(IFNULL(d.debe,0) - IFNULL(d.haber, 0)), 0) AS saldo
      INTO saldo1
			FROM ctb_det_comprobante d, ctb_det_conciliacion_bancaria c
		 WHERE d.id_det_conciliacion_bancaria = c.id_det_conciliacion_bancaria
			 AND c.id_conciliacion_bancaria = idConciliacion;
    
    SELECT IFNULL(SUM(IF(tipo_documento='NDEB',(valor*-1),valor)), 0)
      INTO saldo2
			FROM ctb_det_conciliacion_bancaria
		 WHERE id_conciliacion_bancaria = idConciliacion;
		
		SET saldo = saldo1 - IFNULL(saldo2, 0);
		
    RETURN saldo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtSaldoFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtSaldoFinal`(idConciliacion INT, saldoEstCta FLOAT, fechaInicio DATE, fechaFin DATE) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE saldo1 FLOAT;
    DECLARE saldo2 FLOAT;
    DECLARE saldo FLOAT;
    
    
    SELECT SUM(valor)
      INTO saldo1
		  FROM crt_detalle_cobro_pago
		 WHERE id_conciliacion_bancaria = idConciliacion;
			 
		
		SELECT SUM(valor)
		  INTO saldo2
			FROM ctb_deposito_transito
		 WHERE id_conciliacion_bancaria = idConciliacion;
		
		SET saldo = IFNULL(saldoEstCta, 0) +  IFNULL(saldo1, 0) + IFNULL(saldo2, 0);
		
    RETURN saldo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtSaldoGrupoCuentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtSaldoGrupoCuentas`(periodo INT, codigoContable VARCHAR(100), fechaInicio DATE, fechaFin DATE, tipoBeneficiario CHAR(1), idPersona VARCHAR(10)) RETURNS decimal(15,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE saldo DECIMAL(15,4);
	
	IF tipoBeneficiario != '' AND idPersona != '' THEN
		SELECT IFNULL(SUM(IFNULL(d.debe, 0) - IFNULL(d.haber, 0)),0)
			INTO saldo
		  FROM ctb_comprobante m, ctb_det_comprobante d
		 WHERE m.fecha_generacion BETWEEN fechaInicio AND fechaFin
			 AND m.id_comprobante = d.id_comprobante
			 AND m.estado_comprobante = 'M'
			 AND m.tipo_beneficiario = tipoBeneficiario
			 AND m.id_persona = idPersona
			 AND d.id_cuenta IN (SELECT t.id_cuenta
														 FROM ctb_cuenta t
													  WHERE t.id_periodo = periodo
														  AND t.codigo_contable LIKE CONCAT(codigoContable, '%'));
	ELSE	
		SELECT IFNULL(SUM(IFNULL(d.debe, 0) - IFNULL(d.haber, 0)),0)
			INTO saldo
		  FROM ctb_comprobante m, ctb_det_comprobante d
		 WHERE m.fecha_generacion BETWEEN fechaInicio AND fechaFin
			 AND m.id_comprobante = d.id_comprobante
			 AND m.estado_comprobante = 'M'
			 AND d.id_cuenta IN (SELECT t.id_cuenta
														 FROM ctb_cuenta t
													  WHERE t.id_periodo = periodo
														  AND t.codigo_contable LIKE CONCAT(codigoContable, '%'));
   END IF;

   RETURN saldo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtSaldoMayor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtSaldoMayor`(idCuenta INT, idPeriodo INT, fecha DATE) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE saldo FLOAT;

    SELECT IFNULL(SUM(IFNULL(d.debe,0)),0) - IFNULL(SUM(IFNULL(d.haber,0)),0)
      INTO saldo
			FROM ctb_cuenta c, ctb_comprobante p, ctb_det_comprobante d
		 WHERE p.id_periodo = idPeriodo
		   AND c.id_cuenta = idCuenta
			 AND p.fecha_generacion <= fecha
			 AND p.id_comprobante = d.id_comprobante
			 AND c.id_cuenta = d.id_cuenta
			 AND p.estado_comprobante = 'M';

    RETURN saldo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTelefono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTelefono`(pnIdPersona FLOAT, tipo CHAR(4)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE telefono   VARCHAR(100);

    SELECT t.descripcion_telefono
      INTO telefono
      FROM per_telefono t
     WHERE t.id_persona = pnIdPersona
     AND t.id_tipo_telefono = tipo;

    RETURN telefono;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTelefonoPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTelefonoPrincipal`(pnId INT, pcTipo CHAR(3)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTelefono VARCHAR(100);
    
    IF pcTipo = 'PER' THEN
      SELECT t.descripcion_telefono
        INTO vcTelefono
        FROM per_telefono t
       WHERE t.id_persona = pnId
         AND t.principal_telefono = 'S';
    END IF;
    IF pcTipo = 'PRV' THEN
      SELECT t.descripcion_telefono
        INTO vcTelefono
        FROM per_telefono t, prv_proveedor p
       WHERE p.id_proveedor = pnId
         AND t.id_persona = p.id_persona
         AND t.principal_telefono = 'S';
    END IF;
    IF pcTipo = 'CLI' THEN
      SELECT t.descripcion_telefono
        INTO vcTelefono
        FROM per_telefono t, fac_cliente_factura c
       WHERE c.id_cliente_factura = pnId
         AND t.id_persona = c.id_persona
         AND t.principal_telefono = 'S';
    END IF; 

    RETURN vcTelefono;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTextoPorcentajeImpuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTextoPorcentajeImpuesto`(idImpuesto VARCHAR(15), porcentajeAplicado DECIMAL(15,4)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE textoPorcentaje VARCHAR(100);

	SELECT IF(i.tipo_impuesto='P',CONCAT(ROUND(porcentajeAplicado,0),'%'),ROUND(porcentajeAplicado,2))
	  INTO textoPorcentaje
		FROM prd_impuesto i
	 WHERE i.id_impuesto = idImpuesto;

  RETURN textoPorcentaje;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipo`(id VARCHAR(50), tipo VARCHAR(3)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE dato VARCHAR(256);

		CASE tipo
		  WHEN 'TL' THEN SELECT t.descripcion_tipo_telefono INTO dato FROM per_tipo_telefono t WHERE t.id_tipo_telefono = id;
			WHEN 'ID' THEN SELECT t.descripcion_tipo_identificacion INTO dato FROM per_tipo_identificacion t WHERE t.id_tipo_identificacion = id;
			WHEN 'PS' THEN SELECT p.descripcion_pais INTO dato FROM per_pais p WHERE p.id_pais = id;
			WHEN 'TR' THEN SELECT r.descripcion_tipo_relacion INTO dato FROM per_tipo_relacion r WHERE r.id_tipo_relacion = id;
			WHEN 'CR' THEN SELECT t.descripcion_tipo_caracteristica INTO dato FROM per_tipo_caracteristica t WHERE t.id_tipo_caracteristica = id;
			WHEN 'FM' THEN SELECT t.descripcion_tipo_ficha_medica INTO dato FROM per_tipo_ficha_medica t WHERE t.id_tipo_ficha_medica = id;
			WHEN 'OP' THEN SELECT t.descripcion_operacion INTO dato FROM prd_operacion t WHERE t.id_operacion = id;
			WHEN 'TO' THEN SELECT o.descripcion_tipo_operacion INTO dato FROM prm_tipo_operacion_x_empresa t, prm_tipo_operacion o WHERE t.id_tipo_operacion = o.id_tipo_operacion AND t.id_tipo_operacion_x_empresa = id;
			WHEN 'TI' THEN SELECT t.descripcion_tipo_insumo INTO dato FROM prd_tipo_insumo t WHERE t.id_tipo_insumo = id;
			WHEN 'PR' THEN SELECT CONCAT(p.descripcion_pais, '-', r.descripcion_provincia) AS descripcion INTO dato FROM per_pais p, per_provincia r WHERE p.id_pais = r.id_pais AND r.id_provincia = id;
			WHEN 'MT' THEN SELECT m.descripcion_tipo_motivo INTO dato FROM prm_tipo_motivo m WHERE m.id_tipo_motivo = id;
			WHEN 'TP' THEN SELECT o.descripcion_tipo_operacion INTO dato FROM prm_tipo_operacion o WHERE o.id_tipo_operacion = id;
			WHEN 'UE' THEN SELECT u.descripcion_unidad_estrategica INTO dato FROM prd_unidad_estrategica u WHERE u.id_unidad_estrategica = id;
			WHEN 'SP' THEN SELECT s.descripcion_super_tipo_insumo INTO dato FROM prd_super_tipo_insumo s WHERE s.id_super_tipo_insumo = id;
			WHEN 'RI' THEN SELECT s.descripcion_tipo_forma_pago_sri INTO dato FROM fac_tipo_forma_pago_sri s WHERE s.id_tipo_forma_pago_sri = id;
			WHEN 'NC' THEN SELECT n.descripcion_nacionalidad INTO dato FROM per_nacionalidad n WHERE n.id_nacionalidad = id;
			WHEN 'TE' THEN SELECT t.descripcion_tipo_empresa INTO dato FROM per_tipo_empresa t WHERE t.id_tipo_empresa = id;
			WHEN 'DE' THEN SELECT t.descripcion_denominacion INTO dato FROM per_denominacion t WHERE t.id_denominacion = id;
			WHEN 'PM' THEN SELECT c.descripcion_motivo INTO dato FROM prm_motivo c WHERE c.id_motivo = id;
			WHEN 'TIA' THEN SELECT t.descripcion_tipo_identificacion_sri INTO dato FROM prm_tipo_identificacion_sri t WHERE t.id_tipo_identificacion_sri = id;
			WHEN 'TIS' THEN SELECT t.descripcion_tipo_impuesto_sri INTO dato FROM prm_tipo_impuesto_sri t WHERE t.id_tipo_impuesto_sri = id;
			WHEN 'CPS' THEN SELECT c.descripcion_codigo_porcentaje_sri INTO dato FROM prm_codigo_porcentaje_sri c WHERE c.id_codigo_porcentaje_sri = id;
			WHEN 'CIR' THEN SELECT c.descripcion_cod_impuesto_retencion_sri INTO dato FROM prm_cod_impuesto_retencion_sri c WHERE c.id_cod_impuesto_retencion_sri = id;
			WHEN 'INS' THEN SELECT i.descripcion_insumo INTO dato FROM prd_insumo i WHERE i.id_insumo = id;
			WHEN 'TPP' THEN SELECT t.descripcion_tipo_producto INTO dato FROM prd_tipo_producto t WHERE t.id_tipo_producto = id;
			WHEN 'TPR' THEN SELECT t.descripcion_tipo_parametro INTO dato FROM ctb_tipo_parametro t WHERE t.id_tipo_parametro = id;
			WHEN 'TDT' THEN SELECT t.tipo_dato INTO dato FROM ctb_tipo_parametro t WHERE t.id_tipo_parametro = id;
			WHEN 'IMP' THEN SELECT i.descripcion_impuesto INTO dato FROM prd_impuesto i WHERE i.id_impuesto = id;
			WHEN 'TRT' THEN SELECT t.descripcion_tipo_retencion INTO dato FROM ctb_tipo_retencion t WHERE t.id_tipo_retencion = id;
			WHEN 'RAC' THEN SELECT pxt.tarifa_rac INTO dato FROM prd_precio_x_temporada pxt, prd_temporada t WHERE pxt.id_precio_producto = id AND pxt.id_temporada = t.id_temporada AND t.principal_temporada = 'S';
			WHEN 'FCO' THEN SELECT c.descripcion_tipo_forma_pago_compra INTO dato FROM prv_tipo_forma_pago_compra c WHERE c.id_tipo_forma_pago_compra = id;
			WHEN 'CRT' THEN SELECT CONCAT(c.id_concepto_retencion,' - ',c.descripcion_concepto_retencion,' (',ROUND(c.porcentaje,2),'%)') INTO dato FROM ctb_concepto_retencion c WHERE c.id_concepto_retencion = id;
			WHEN 'CRI' THEN SELECT c.descripcion_codigo_retencion_iva INTO dato FROM ctb_codigo_retencion_iva c WHERE c.id_codigo_retencion_iva = id;
			WHEN 'ITP' THEN SELECT c.descripcion_tipo_presentacion INTO dato FROM inv_tipo_presentacion c WHERE c.id_tipo_presentacion = id;
			WHEN 'IUE' THEN SELECT c.descripcion_ubicacion_existencia INTO dato FROM inv_ubicacion_existencia c WHERE c.id_ubicacion_existencia = id;
			WHEN 'CNT' THEN SELECT c.descripcion_cuenta INTO dato FROM ctb_cuenta c WHERE c.id_cuenta = id;
			WHEN 'FPG' THEN SELECT c.descripcion_tipo_forma_pago INTO dato FROM fac_tipo_forma_pago c WHERE c.id_tipo_forma_pago = id;
			WHEN 'CTC' THEN SELECT c.descripcion_tipo_cuenta INTO dato FROM ctb_tipo_cuenta c WHERE c.id_tipo_cuenta = id;
			WHEN 'GTH' THEN SELECT c.descripcion_tipo_habitacion INTO dato FROM res_tipo_habitacion c WHERE c.id_tipo_habitacion = id;
			WHEN 'RTR' THEN SELECT c.descripcion_tipo_reserva INTO dato FROM res_tipo_reserva c WHERE c.id_tipo_reserva = id;
			WHEN 'TEX' THEN SELECT c.descripcion_tipo_experiencia INTO dato FROM res_tipo_experiencia c WHERE c.id_tipo_experiencia = id;
			WHEN 'ROR' THEN SELECT c.descripcion_origen_reserva INTO dato FROM res_origen_reserva c WHERE c.id_origen_reserva = id;
			WHEN 'UME' THEN SELECT o.descripcion_unidad_medida INTO dato FROM inv_unidad_medida o WHERE o.id_unidad_medida = id;
			WHEN 'ZON' THEN SELECT z.descripcion_zona INTO dato FROM per_zona z WHERE z.id_zona = id;
		END CASE;
    
    RETURN dato;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipoATSIdentificacionPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipoATSIdentificacionPrincipal`(idPersona INTEGER, tipo CHAR(3)) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE tipo1 VARCHAR(3);
  DECLARE tipo2 VARCHAR(3);

	SELECT t.tipo_identificacion_ats, t.id_tipo_identificacion_especial
	  INTO tipo1, tipo2
		FROM per_identificacion i, per_tipo_identificacion t
	 WHERE i.id_persona = idPersona
		 AND i.id_tipo_identificacion = t.id_tipo_identificacion
		 AND i.principal_identificacion = 'S';

  IF tipo = 'CLI' THEN
	  RETURN tipo1;
	ELSE
	  RETURN tipo2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipoDetValorOrden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipoDetValorOrden`(tipo CHAR(1)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE orden INT;

  IF tipo = 'I' THEN
    SET orden = 4;
  ELSEIF tipo = 'D' THEN
    SET orden = 5;
  ELSEIF tipo = 'F' THEN
    SET orden = 2;
  ELSEIF tipo = 'A' THEN
    SET orden = 7;
  ELSEIF tipo = 'S' THEN
    SET orden = 3;
  ELSEIF tipo = 'T' THEN
    SET orden = 6;
  ELSEIF tipo = 'R' THEN
    SET orden = 9;
  ELSEIF tipo = 'B' THEN
    SET orden = 1;
  ELSE
    SET orden = 9;
  END IF;

  RETURN orden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipoEmpresaRelacionada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipoEmpresaRelacionada`(pnIdEmpresaRelacionada INT) RETURNS char(3) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTipo CHAR(3);

    SELECT IF(e.tipo_empresa_relacionada='CLI','PRV','CLI') AS tipo_empresa_actual
      INTO vcTipo
			FROM prm_empresa_relacionada e
		 WHERE e.id_empresa_relacionada = pnIdEmpresaRelacionada;

    RETURN vcTipo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipoIdentificacionPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipoIdentificacionPrincipal`(pnId INT, pcTipo CHAR(3)) RETURNS varchar(100) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTipo VARCHAR(100);

    IF pcTipo = 'PER' THEN
      SELECT t.descripcion_tipo_identificacion
        INTO vcTipo
        FROM per_tipo_identificacion t
        INNER JOIN per_identificacion i
        ON t.id_tipo_identificacion = i.id_tipo_identificacion
       WHERE i.id_persona = pnId
         AND i.principal_identificacion = 'S';
    END IF;
    RETURN vcTipo;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipoImpuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipoImpuesto`(pcIdImpuesto VARCHAR(4)) RETURNS varchar(4) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTipoImpuesto   VARCHAR(15);

    SELECT m.tipo_impuesto
      INTO vcTipoImpuesto
      FROM prd_impuesto m
     WHERE m.id_impuesto = pcIdImpuesto;

    RETURN vcTipoImpuesto;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipoOperacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipoOperacion`(pnIdProducto VARCHAR(15)) RETURNS varchar(15) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTipoOperacion   VARCHAR(15);

    SELECT tpo.id_tipo_operacion
      INTO vcTipoOperacion
      FROM prd_producto p,
           prd_tipo_producto t,
           prd_unidad_estrategica u,
           prm_tipo_operacion_x_empresa tpoxe,
           prm_tipo_operacion tpo
     WHERE p.id_tipo_producto = t.id_tipo_producto
           AND t.id_unidad_estrategica = u.id_unidad_estrategica
           AND u.id_tipo_operacion_x_empresa =
                tpoxe.id_tipo_operacion_x_empresa
           AND tpoxe.id_tipo_operacion = tpo.id_tipo_operacion
           AND p.id_producto = pnIdProducto;

    RETURN vcTipoOperacion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTipoPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTipoPersona`(pnIdPersona FLOAT) RETURNS char(1) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTipoPersona   CHAR(1);

    SELECT id_tipo_persona
      INTO vcTipoPersona
      FROM per_persona
     WHERE id_persona = pnIdPersona;

    RETURN vcTipoPersona;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTotalComprasXPagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTotalComprasXPagar`(idCompra INT, idPago INT) RETURNS decimal(15,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE totalCompra NUMERIC(15, 4);
    DECLARE totalPago NUMERIC(15, 4);
    DECLARE totalPagoUnico NUMERIC(15, 4);
    DECLARE totalPagoMultiple NUMERIC(15, 4);
    DECLARE valorRetencion NUMERIC(15, 4);
    DECLARE totalEfectivo NUMERIC(15, 4);

    IF idPago IS NOT NULL THEN
			SELECT IFNULL(SUM(d.valor), 0)
			  INTO totalPagoUnico
			  FROM crt_cobro_pago c, crt_detalle_cobro_pago d
			 WHERE c.id_cobro_pago = d.id_cobro_pago
				 AND c.id_compra = idCompra
				 AND c.estado_cobro_pago = 'R'
				 AND c.id_cobro_pago != idPago;

			 SELECT IFNULL(SUM(m.valor),0)
			  INTO totalPagoMultiple
				 FROM crt_cobro_pago c, crt_multiple_cobro_pago m
			  WHERE m.id_compra = idCompra
				  AND c.id_cobro_pago = m.id_cobro_pago
				  AND c.estado_cobro_pago = 'R'
				  AND c.id_cobro_pago != idPago;

			SET totalPago = totalPagoUnico + totalPagoMultiple;
		ELSE
			SELECT IFNULL(SUM(d.valor), 0)
			  INTO totalPagoUnico
			  FROM crt_cobro_pago c, crt_detalle_cobro_pago d
			 WHERE c.id_cobro_pago = d.id_cobro_pago
				 AND c.id_compra = idCompra
				 AND c.estado_cobro_pago = 'R';

			 SELECT IFNULL(SUM(m.valor),0)
			  INTO totalPagoMultiple
				 FROM crt_cobro_pago c, crt_multiple_cobro_pago m
			  WHERE m.id_compra = idCompra
				  AND c.id_cobro_pago = m.id_cobro_pago
				  AND c.estado_cobro_pago = 'R';

			SET totalPago = totalPagoUnico + totalPagoMultiple;
		END IF;

		SELECT IFNULL(SUM(d.valor_retencion),0)
		  INTO valorRetencion
			FROM ctb_retencion r, ctb_detalle_retencion d
		 WHERE r.id_compra = idCompra
			 AND r.id_retencion = d.id_retencion;

		SELECT IFNULL(ROUND(SUM(v.valor * p.porcentaje_forma_pago /100), 2), 0)
		  INTO totalEfectivo
      FROM prv_compra c, prv_detalle_valor_compra v, prv_forma_pago_compra p, prv_tipo_forma_pago_compra t
     WHERE c.id_compra = idCompra
       AND c.id_compra = v.id_compra
       AND c.id_compra = p.id_compra
       AND p.id_tipo_forma_pago_compra = t.id_tipo_forma_pago_compra
       AND v.tipo_detalle_valor = 'T'
       AND t.requiere_cobro = 'N';

		SELECT v.valor - IFNULL(totalPago,0) - IFNULL(valorRetencion,0) - IFNULL(totalEfectivo,0)
		  INTO totalCompra
			FROM prv_compra c, prv_detalle_valor_compra v
		 WHERE c.id_compra = idCompra
			 AND v.id_compra = c.id_compra
			 AND v.tipo_detalle_valor = 'T';

    RETURN totalCompra;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTotalFacturaXCobrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTotalFacturaXCobrar`(idFactura INT, idCobro INT) RETURNS decimal(15,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE totalFactura NUMERIC(15, 4);
    DECLARE totalCobro NUMERIC(15, 4);
    DECLARE totalRetencion NUMERIC(15, 4);
    DECLARE totalEfectivo NUMERIC(15, 4);

    IF idCobro IS NOT NULL THEN
			SELECT IFNULL(SUM(d.valor), 0)
				INTO totalCobro
				FROM crt_cobro_pago c, crt_detalle_cobro_pago d
			 WHERE c.id_cobro_pago = d.id_cobro_pago
				 AND c.id_factura = idFactura
				 AND c.estado_cobro_pago = 'R'
				 AND c.id_cobro_pago != idCobro;
		ELSE
			SELECT IFNULL(SUM(d.valor), 0)
				INTO totalCobro
				FROM crt_cobro_pago c, crt_detalle_cobro_pago d
			 WHERE c.id_cobro_pago = d.id_cobro_pago
				 AND c.id_factura = idFactura
				 AND c.estado_cobro_pago = 'R';
		END IF;

		SELECT IFNULL(ROUND(SUM(v.valor * p.porcentaje_forma_pago /100), 2), 0)
		  INTO totalEfectivo
      FROM fac_factura f, fac_detalle_valor v, fac_forma_pago p, fac_tipo_forma_pago t
     WHERE f.id_factura = idFactura
       AND f.id_factura = v.id_factura
       AND f.id_factura = p.id_factura
       AND p.id_tipo_forma_pago = t.id_tipo_forma_pago
       AND v.tipo_detalle_valor = 'T'
       AND t.requiere_cobro = 'N';

    SELECT IFNULL(SUM(d.valor_retencion),0)
      INTO totalRetencion
      FROM ctb_retencion r, ctb_detalle_retencion d
     WHERE r.id_factura = idFactura
       AND r.id_retencion = d.id_retencion;

    SELECT v.valor - IFNULL(totalCobro,0) - IFNULL(totalRetencion,0) - IFNULL(totalEfectivo,0)
      INTO totalFactura
      FROM fac_factura f, fac_detalle_valor v
     WHERE f.id_factura = idFactura
       AND f.id_factura = v.id_factura
       AND v.tipo_detalle_valor = 'T';

    RETURN totalFactura;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTotalImpuestoInsumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTotalImpuestoInsumo`(idInsumo INTEGER, precio FLOAT, fecha DATE) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE totalImpuesto FLOAT;

    SELECT SUM(IF(s.tipo_impuesto = 'P',
						   (IF(s.tipo_valor = 'R', IFNULL(r.porcentaje,0), IFNULL(s.cantidad_impuesto,0)) / 100 * precio),
						    IFNULL(s.cantidad_impuesto,0))) AS total_impuesto
			INTO totalImpuesto			    
		  FROM prd_impuesto_x_insumo m, prd_impuesto s 
		  LEFT JOIN prd_rango_impuesto r 
		    ON r.id_impuesto = s.id_impuesto 
		   AND fecha BETWEEN r.fecha_inicio AND r.fecha_fin
		 WHERE m.id_impuesto = s.id_impuesto 
		   AND m.id_insumo = idInsumo;
     
    IF totalImpuesto = '' OR totalImpuesto = NULL THEN
      SET totalImpuesto = 0;
    END IF;

    RETURN totalImpuesto;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtTotalPorcentajeInsXIti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtTotalPorcentajeInsXIti`(modulo CHAR(3), idInsXIti INT) RETURNS decimal(15,4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(15,4);
		IF modulo = 'RES' THEN
			SELECT SUM(m.cantidad_impuesto)
				INTO total
				FROM res_detalle_valor_x_insumo ixi, prd_impuesto m
			 WHERE ixi.id_insumo_x_itinerario_res = idInsXIti
			   AND ixi.id_impuesto = m.id_impuesto
			   AND ixi.suprime_impuesto = 'N'
			   AND m.tipo_impuesto = 'P';
		ELSE
			SELECT SUM(m.cantidad_impuesto)
				INTO total
				FROM fac_detalle_valor_x_insumo ixi, prd_impuesto m
			 WHERE ixi.id_insumo_x_itinerario_fac = idInsXIti
			   AND ixi.id_impuesto = m.id_impuesto
			   AND ixi.suprime_impuesto = 'N'
			   AND m.tipo_impuesto = 'P';
		END IF;

    RETURN total;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtUsuarioSupervisorAgencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtUsuarioSupervisorAgencia`(pnIdAgencia INT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNombreSupervisor VARCHAR(256);

    SELECT fNombrePersona(r.id_persona2)
      INTO vcNombreSupervisor
			FROM per_relacion r, per_tipo_relacion t
		 WHERE r.id_tipo_relacion = t.id_tipo_relacion_inversa
		   AND t.tipo_interno = 'S'
			 AND r.id_persona = pnIdAgencia
		LIMIT 0, 1;

    RETURN vcNombreSupervisor;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtValorPendienteCobroPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtValorPendienteCobroPago`(tipo CHAR(1), idCompra INT, idFactura INT) RETURNS decimal(16,8)
BEGIN
  DECLARE valor DECIMAL(16,8);

  IF tipo = 'P' THEN
    SELECT fObtTotalComprasXPagar(idCompra, NULL)
      INTO valor;
  ELSE
    SELECT fObtTotalFacturaXCobrar(idFactura, NULL)
      INTO valor;
  END IF;

  RETURN valor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtValorRetencion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtValorRetencion`(tipo CHAR(1), idOrigen INT) RETURNS float
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE valorRetencion NUMERIC(15, 4);
    
		IF tipo = 'C' THEN
      SELECT IFNULL(SUM(d.valor_retencion),0)
        INTO valorRetencion
        FROM ctb_comprobante c, ctb_retencion r, ctb_detalle_retencion d
       WHERE c.tipo_origen = 'CMAU'
         AND c.id_origen = idOrigen
         AND c.id_comprobante = r.id_comprobante
         AND r.id_retencion = d.id_retencion;
		END IF;
		
		IF tipo = 'V' THEN
      SELECT IFNULL(SUM(d.valor_retencion),0)
        INTO valorRetencion
        FROM ctb_comprobante c, ctb_retencion r, ctb_detalle_retencion d
       WHERE c.tipo_origen = 'FCAU'
         AND c.id_origen = idOrigen
         AND c.id_comprobante = r.id_comprobante
         AND r.id_retencion = d.id_retencion;
		END IF;
		
		IF valorRetencion IS NULL THEN
		   SET valorRetencion = 0;
		END IF;
		
    RETURN valorRetencion;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fObtValorTotalXCobrarPagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fObtValorTotalXCobrarPagar`(tipo CHAR(3), idFactura INT, idCompra INT) RETURNS decimal(15,8)
BEGIN
  DECLARE total DECIMAL (15, 8);
  DECLARE total1 DECIMAL (15, 8);
  DECLARE total2 DECIMAL (15, 8);
  DECLARE retencion DECIMAL (15, 8);
  DECLARE porcentaje DECIMAL (15, 8);

  IF tipo = 'P' THEN
     SELECT IFNULL(SUM(f.porcentaje_forma_pago), 0)
      INTO porcentaje
      FROM prv_forma_pago_compra f, prv_tipo_forma_pago_compra t
     WHERE f.id_compra = idCompra
       AND f.id_tipo_forma_pago_compra = t.id_tipo_forma_pago_compra
       AND t.efectivo_credito = 'E';

    IF porcentaje != 100 THEN
      SET porcentaje = 100 - IFNULL(porcentaje, 0);
    END IF;

    SELECT (v.valor * porcentaje / 100)
      INTO total1
      FROM prv_detalle_valor_compra v
     WHERE v.id_compra = idCompra
       AND v.tipo_detalle_valor = 'T';

    SELECT IFNULL(SUM(d.valor_retencion), 0)
      INTO retencion
      FROM ctb_retencion r, ctb_detalle_retencion d
     WHERE r.id_retencion = d.id_retencion
       AND r.id_compra = idCompra;
  ELSE
    SELECT IFNULL(SUM(f.porcentaje_forma_pago), 0)
      INTO porcentaje
      FROM fac_forma_pago f, fac_tipo_forma_pago t
     WHERE f.id_factura = idFactura
       AND f.id_tipo_forma_pago = t.id_tipo_forma_pago
       AND t.efectivo_credito = 'E';

    IF porcentaje != 100 THEN
      SET porcentaje = 100 - IFNULL(porcentaje, 0);
    END IF;

    SELECT (v.valor * porcentaje / 100)
      INTO total1
      FROM fac_detalle_valor v
     WHERE v.id_factura = idFactura
       AND v.tipo_detalle_valor = 'T';

    SELECT IFNULL(SUM(d.valor_retencion),0)
      INTO retencion
      FROM ctb_retencion r, ctb_detalle_retencion d
     WHERE r.id_factura = idFactura
       AND r.id_retencion = d.id_retencion;
  END IF;

  SET total2 = IFNULL(total1, 0) - IFNULL(retencion, 0);
  SET total = total2 * 100 / porcentaje;

  RETURN total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fPersonasReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fPersonasReserva`(pnIdReserva FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcNombres   VARCHAR(256);
    DECLARE vcNombre    VARCHAR(15);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   VARCHAR(6);

    DECLARE
      cur1 CURSOR FOR
        SELECT fNombrePersona(pxr.id_persona) AS nombre
	FROM res_persona_x_reserva pxr
	WHERE pxr.id_reserva = pnIdReserva;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcNombres   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcNombre;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '<br>';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcNombres   = CONCAT(vcNombres, vcSeparador, vcNombre);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcNombres;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fRelacionesPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fRelacionesPersona`(pnIdPersona INT) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcRelaciones  TEXT;
    DECLARE vcRelacion    VARCHAR(512);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   VARCHAR(10);

    DECLARE
      cur1 CURSOR FOR
        SELECT CONCAT(fNombrePersona(r.id_persona2), ' - ', t.descripcion_tipo_relacion) AS relacion
          FROM per_tipo_relacion t, per_relacion r
         WHERE t.id_tipo_relacion = r.id_tipo_relacion
           AND r.id_persona = pnIdPersona
           AND r.id_persona2 IS NOT NULL;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcRelaciones   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcRelacion;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '<br/>';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcRelaciones   = CONCAT(vcRelaciones, vcSeparador, vcRelacion);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcRelaciones;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fRetornaElemento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fRetornaElemento`(pcCadena TEXT, pcSeparador CHAR(1), piPosicionElemento INTEGER) RETURNS text CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE viNroOcurrencias INTEGER;
		DECLARE vcElemento TEXT;
		DECLARE vbContinua BIT;
		DECLARE viPosicionIni INTEGER;
		DECLARE viPosicionFin INTEGER;
		DECLARE vcCadena TEXT;
		
		SET vbContinua = 0;
		SET vcCadena = pcCadena;
		SET viPosicionIni = 0;
		SET viPosicionFin = 0;
		SET viNroOcurrencias = 0;
		
		WHILE vbContinua = 0 DO
			SET viNroOcurrencias = viNroOcurrencias + 1;
			SET viPosicionFin = INSTR(vcCadena, pcSeparador);
			IF viPosicionFin > 0 THEN
				IF viNroOcurrencias = piPosicionElemento THEN
					SET vcElemento = SUBSTRING(vcCadena, 1, viPosicionFin - 1);
					SET vbContinua = 1;
				END IF;
				SET vcCadena = SUBSTRING(vcCadena, viPosicionFin + 1);
			ELSE
				SET vbContinua = 1;
				IF viNroOcurrencias = piPosicionElemento THEN
					SET vcElemento = SUBSTRING(vcCadena, 1);
				END IF;
			END IF;
		END WHILE;

    RETURN vcElemento;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fRevisaFechaReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fRevisaFechaReserva`(pcIdProducto VARCHAR(15), pnIdDetReserva INT, pdFechaInicio DATETIME, pdFechaFin DATETIME, pnIdFactura INT) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vnIdDetReserva INT;
    DECLARE vnIdReserva INT;
    DECLARE vnIdImportadoDe INT;

    SELECT r.id_reserva, pxr.id_detalle_reserva
      INTO vnIdReserva, vnIdDetReserva
			FROM res_reserva r, res_detalle_reserva pxr, prd_producto p
		 WHERE r.id_reserva = pxr.id_reserva
			 AND r.estado_reserva != 'XXX'
			 AND pxr.id_producto = pcIdProducto
			 AND pxr.id_detalle_reserva != pnIdDetReserva
			 AND p.id_producto = pxr.id_producto
			 AND p.bloquea_horario = 'S'
			 AND (pxr.fecha_inicio BETWEEN pdFechaInicio AND pdFechaFin
						OR pxr.fecha_fin BETWEEN pdFechaInicio AND pdFechaFin
						OR pdFechaInicio BETWEEN pxr.fecha_inicio AND pxr.fecha_fin
						OR pdFechaFin BETWEEN pxr.fecha_inicio AND pxr.fecha_fin);

		IF vnIdDetReserva IS NOT NULL AND pnIdFactura IS NOT NULL THEN
		  SELECT f.id_importado_de
		    INTO vnIdImportadoDe
		    FROM fac_factura f
		   WHERE f.id_factura = pnIdFactura;

			 IF vnIdImportadoDe = vnIdReserva THEN
			   SET vnIdDetReserva = NULL;
			 END IF;
		END IF;

    RETURN vnIdDetReserva;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fTelefonosPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fTelefonosPersona`(pnIdPersona FLOAT) RETURNS varchar(256) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE vcTelefonos   VARCHAR(256);
    DECLARE vcTelefono    VARCHAR(100);
    DECLARE viDone        INT DEFAULT 0;
    DECLARE viCuenta      INT DEFAULT 0;
    DECLARE vcSeparador   VARCHAR(4);

    DECLARE
      cur1 CURSOR FOR
        SELECT t.descripcion_telefono AS telefono
          FROM per_tipo_telefono d, per_telefono t
         WHERE d.id_tipo_telefono = t.id_tipo_telefono
           AND t.id_persona = pnIdPersona;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET viDone   = 1;
    SET vcTelefonos   = '';

    OPEN cur1;

    REPEAT
      FETCH cur1 INTO vcTelefono;

      SET viCuenta   = viCuenta + 1;

      IF NOT viDone
      THEN
        IF viCuenta > 1
        THEN
          SET vcSeparador   = '; ';
        ELSE
          SET vcSeparador   = '';
        END IF;

        SET vcTelefonos   = CONCAT(vcTelefonos, vcSeparador, vcTelefono);
      END IF;
    UNTIL viDone
    END REPEAT;

    CLOSE cur1;

    RETURN vcTelefonos;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fTotalImpuestoXInsumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fTotalImpuestoXInsumo`(idInsumo INT, tipoImpuesto CHAR(1)) RETURNS decimal(15,8)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(15,8);

    SELECT SUM(s.cantidad_impuesto)
      INTO total
      FROM prd_impuesto_x_insumo ixi, prd_impuesto s
     WHERE ixi.id_insumo = idInsumo
       AND ixi.id_impuesto = s.id_impuesto
       AND s.tipo_impuesto = tipoImpuesto;

    RETURN total;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fUsuarioClave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fUsuarioClave`(pcUsuario VARCHAR(25), pcClave VARCHAR(32), pcIP VARCHAR(100)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE vnResultado INT;
	DECLARE vcEstado CHAR(1);
	DECLARE vcIP VARCHAR(100);
	
	SELECT estado_usuario, IFNULL(ip_validar, pcIP)
		INTO vcEstado, vcIP
		FROM seg_usuario
	 WHERE id_usuario = pcUsuario
	   AND clave = MD5(pcClave);
	
	
	IF IFNULL(vcEstado,'') = '' THEN
		SET vnResultado = 0;
	ELSE
		
		IF vcEstado = 'A' THEN
			SET vnResultado = 1;
			
			IF vcIP != pcIP THEN
			  SET vnResultado = 4;
			END IF;
		ELSE
			
			SET vnResultado = 2;
		END IF;
	END IF;
	RETURN vnResultado;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fVerificaAccedeModulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fVerificaAccedeModulo`(idUsuario VARCHAR(25), idModulo VARCHAR(3)) RETURNS varchar(1) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE accede VARCHAR(1);

    SELECT 'S'
      INTO accede
			FROM seg_usuario u, seg_modulo_x_perfil mxp
		 WHERE u.id_perfil = mxp.id_perfil
			 AND u.id_usuario = idUsuario
			 AND mxp.id_modulo = idModulo;
			 
		IF accede = NULL THEN
		  SET accede = 'N';
		END IF;

    RETURN accede;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fZip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fZip`(pnIdPais FLOAT) RETURNS varchar(4) CHARSET latin1
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE zip   VARCHAR(4);

    SELECT n.codigo_area
      INTO zip
      FROM per_pais n
     WHERE n.id_pais = pnIdPais;

    RETURN zip;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `snake_to_camel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `snake_to_camel`(snake TEXT) RETURNS text CHARSET latin1
    DETERMINISTIC
BEGIN
    DECLARE result TEXT DEFAULT '';
    DECLARE i INT DEFAULT 1;
    DECLARE len INT;
    DECLARE c CHAR(1);
    DECLARE upper_next BOOLEAN DEFAULT FALSE;

    SET len = CHAR_LENGTH(snake);

    WHILE i <= len DO
        SET c = SUBSTRING(snake, i, 1);

        IF c = '_' THEN
            SET upper_next = TRUE;
        ELSE
            IF upper_next THEN
                SET result = CONCAT(result, UPPER(c));
                SET upper_next = FALSE;
            ELSE
                SET result = CONCAT(result, LOWER(c));
            END IF;
        END IF;

        SET i = i + 1;
    END WHILE;

    RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crear_persona_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crear_persona_proveedor`(
    IN  p_razonSocial          VARCHAR(256),
    IN  p_nombreComercial      VARCHAR(256),
    IN  p_tipoPersona          CHAR(1),
    IN  p_email                VARCHAR(256),
    IN  p_tipoIdentificacion   VARCHAR(4),
    IN  p_identificacion       VARCHAR(100),
    IN  p_telefono              VARCHAR(100),
    IN  p_direccion             TEXT,
    IN  p_usuario               VARCHAR(25),
    OUT p_idProveedor           INT
)
BEGIN
    DECLARE v_idPersona INT;
    DECLARE v_tipoIdentificacionIns CHAR(1);
    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_idProveedor = NULL;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Verificar el tipo de identificacición
    CASE p_tipoIdentificacion
        WHEN '04' THEN
            SET v_tipoIdentificacionIns = 'R';
        WHEN '05' THEN
            SET v_tipoIdentificacionIns = 'C';
        WHEN '06' THEN
            SET v_tipoIdentificacionIns = 'P';
        ELSE
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Tipo de identificación no válido';
    END CASE;

    -- PERSONA
    INSERT INTO per_persona (
        razon_social,
        nombre_comercial,
        estado_persona,
        tipo_persona,
        correo_electronico,
        es_entidad_financiera,
        id_usuario_crea,
        fecha_crea
    )
    VALUES (
        p_razonSocial,
        p_nombreComercial,
        'A',
        p_tipoPersona,
        p_email,
        'N',
        p_usuario,
        CURRENT_TIMESTAMP()
    );

    SET v_idPersona = LAST_INSERT_ID();

    -- IDENTIFICACIÓN
    INSERT INTO per_identificacion (
        id_persona,
        id_tipo_identificacion,
        descripcion_identificacion,
        principal_identificacion,
        id_usuario_crea,
        fecha_crea
    )
    VALUES (
        v_idPersona,
        v_tipoIdentificacionIns,
        p_identificacion,
        'D',
        p_usuario,
        CURRENT_TIMESTAMP()
    );

    -- TELÉFONO
    INSERT INTO per_telefono (
        id_persona,
        id_tipo_telefono,
        descripcion_telefono,
        principal_telefono,
        id_usuario_crea,
        fecha_crea
    )
    VALUES (
        v_idPersona,
        'D',
        p_telefono,
        'S',
        p_usuario,
        CURRENT_TIMESTAMP()
    );

    -- DIRECCIÓN
    INSERT INTO per_direccion (
        id_tipo_direccion,
        id_persona,
        id_ciudad_direccion,
        dato_adicional,
        principal_direccion,
        id_usuario_crea,
        fecha_crea
    )
    VALUES (
        'D',
        v_idPersona,
        1,
        p_direccion,
        'S',
        p_usuario,
        CURRENT_TIMESTAMP()
    );

    -- PROVEEDOR
    INSERT INTO prv_proveedor (
        id_persona,
        estado_proveedor,
        es_interno,
        tipo_identificacion_ats,
        id_usuario_crea,
        fecha_crea
    )
    VALUES (
        v_idPersona,
        'A',
        'N',
        p_tipoIdentificacion,
        p_usuario,
        CURRENT_TIMESTAMP()
    );

    -- ID generado del proveedor
    SET p_idProveedor = LAST_INSERT_ID();

		-- COMITA CAMBIOS
    COMMIT;

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

-- Dump completed on 2026-10-07  9:01:29
