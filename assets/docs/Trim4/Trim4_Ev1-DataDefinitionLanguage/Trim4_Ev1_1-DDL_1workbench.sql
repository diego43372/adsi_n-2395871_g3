-- MySQL Script generated by MySQL Workbench
-- Mon Sep  5 10:15:55 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bbdd_ventas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bbdd_ventas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bbdd_ventas` DEFAULT CHARACTER SET utf8 ;
USE `bbdd_ventas` ;

-- -----------------------------------------------------
-- Table `bbdd_ventas`.`ROLES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`ROLES` (
  `codigo_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre_rol` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codigo_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`USUARIOS` (
  `codigo_rol` INT NOT NULL,
  `codigo_user` VARCHAR(10) NOT NULL,
  `nombres_user` VARCHAR(50) NOT NULL,
  `apellidos_user` VARCHAR(50) NOT NULL,
  `correo_user` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo_user`),
  INDEX `ind_usuario_rol` (`codigo_rol` ASC) INVISIBLE,
  UNIQUE INDEX `uq_correo_user` (`correo_user` ASC) INVISIBLE,
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`codigo_rol`)
    REFERENCES `bbdd_ventas`.`ROLES` (`codigo_rol`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`CREDENCIALES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`CREDENCIALES` (
  `codigo_cred` VARCHAR(10) NOT NULL,
  `identificacion_cred` INT NOT NULL,
  `fecha_ingreso_cred` DATE NOT NULL,
  `ciudad_cred` VARCHAR(50) NOT NULL,
  `direccion_cred` VARCHAR(100) NOT NULL,
  `pass_cred` VARCHAR(150) NOT NULL,
  `estado_cred` TINYINT NOT NULL,
  INDEX `ind_credencial_usuario` (`codigo_cred` ASC) INVISIBLE,
  PRIMARY KEY (`codigo_cred`),
  UNIQUE INDEX `uq_identificacion_cred` (`identificacion_cred` ASC) INVISIBLE,
  CONSTRAINT `fk_credencial_usuario`
    FOREIGN KEY (`codigo_cred`)
    REFERENCES `bbdd_ventas`.`USUARIOS` (`codigo_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`MENSAJES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`MENSAJES` (
  `codigo_user` VARCHAR(10) NOT NULL,
  `fecha_mensaje` DATE NOT NULL,
  `asunto_mensaje` VARCHAR(50) NOT NULL,
  `descripcion_mensaje` VARCHAR(300) NOT NULL,
  INDEX `ind_mensaje_usuario` (`codigo_user` ASC) INVISIBLE,
  CONSTRAINT `fk_mensaje_usuario`
    FOREIGN KEY (`codigo_user`)
    REFERENCES `bbdd_ventas`.`USUARIOS` (`codigo_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`CATEGORIAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`CATEGORIAS` (
  `codigo_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codigo_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`PRODUCTOS` (
  `codigo_categoria` INT NOT NULL,
  `codigo_producto` VARCHAR(10) NOT NULL,
  `nombre_producto` VARCHAR(50) NOT NULL,
  `precio_producto` DECIMAL(10,2) NOT NULL,
  `unidad_producto` DECIMAL(5,2) NOT NULL,
  `medida_producto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`codigo_producto`),
  INDEX `ind_producto_categoria` (`codigo_categoria` ASC) INVISIBLE,
  CONSTRAINT `fk_producto_categoria`
    FOREIGN KEY (`codigo_categoria`)
    REFERENCES `bbdd_ventas`.`CATEGORIAS` (`codigo_categoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`PEDIDOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`PEDIDOS` (
  `codigo_pedido` VARCHAR(10) NOT NULL,
  `fecha_pedido` DATE NOT NULL,
  `direccion_pedido` VARCHAR(100) NOT NULL,
  `total_pl_pedido` DECIMAL(10,2) NOT NULL,
  `iva_pedido` DECIMAL(10,2) NOT NULL,
  `total_pr_pedido` DECIMAL(10,2) NOT NULL,
  `estado_pedido` TINYINT NOT NULL,
  PRIMARY KEY (`codigo_pedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`LISTA_PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`LISTA_PRODUCTOS` (
  `codigo_pedido` VARCHAR(10) NOT NULL,
  `codigo_producto` VARCHAR(10) NOT NULL,
  `cantidad_productos` INT NOT NULL,
  INDEX `ind_lista_productos_pedido` (`codigo_pedido` ASC) INVISIBLE,
  INDEX `ind_lista_producto_producto` (`codigo_producto` ASC) INVISIBLE,
  CONSTRAINT `fk_lista_productos_pedido`
    FOREIGN KEY (`codigo_pedido`)
    REFERENCES `bbdd_ventas`.`PEDIDOS` (`codigo_pedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lista_productos_producto`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `bbdd_ventas`.`PRODUCTOS` (`codigo_producto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`CLIENTES` (
  `codigo_customer` VARCHAR(10) NOT NULL,
  `edad_customer` INT NOT NULL,
  PRIMARY KEY (`codigo_customer`),
  INDEX `ind_cliente_credencial` (`codigo_customer` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_credencial`
    FOREIGN KEY (`codigo_customer`)
    REFERENCES `bbdd_ventas`.`CREDENCIALES` (`codigo_cred`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`VENDEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`VENDEDORES` (
  `codigo_seller` VARCHAR(10) NOT NULL,
  `salario_seller` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`codigo_seller`),
  INDEX `ind_vendedor_credencial` (`codigo_seller` ASC) INVISIBLE,
  CONSTRAINT `fk_vendedor_credencial`
    FOREIGN KEY (`codigo_seller`)
    REFERENCES `bbdd_ventas`.`CREDENCIALES` (`codigo_cred`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`CREDENCIALES_PEDIDOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`CREDENCIALES_PEDIDOS` (
  `codigo_cred` VARCHAR(10) NOT NULL,
  `codigo_pedido` VARCHAR(10) NOT NULL,
  INDEX `ind_credencial_pedido_cliente` (`codigo_cred` ASC) INVISIBLE,
  INDEX `ind_credencial_pedido_vendedor` (`codigo_cred` ASC) INVISIBLE,
  INDEX `ind_credencial_pedido_pedido` (`codigo_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_credencial_pedido_cliente`
    FOREIGN KEY (`codigo_cred`)
    REFERENCES `bbdd_ventas`.`CLIENTES` (`codigo_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_credencial_pedido_vendedor`
    FOREIGN KEY (`codigo_cred`)
    REFERENCES `bbdd_ventas`.`VENDEDORES` (`codigo_seller`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_credencial_pedido_pedido`
    FOREIGN KEY (`codigo_pedido`)
    REFERENCES `bbdd_ventas`.`PEDIDOS` (`codigo_pedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
