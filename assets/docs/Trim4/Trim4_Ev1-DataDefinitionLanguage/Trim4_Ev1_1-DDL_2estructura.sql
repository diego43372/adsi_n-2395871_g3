-- -----------------------------------------------------
-- ESTRUCTURA BBDD: BBDD_VENTAS
-- -----------------------------------------------------
CREATE SCHEMA bbdd_ventas DEFAULT CHARACTER SET utf8 ;
USE bbdd_ventas ;

-- -----------------------------------------------------
-- TABLA: ROLES
-- -----------------------------------------------------
CREATE TABLE ROLES (
  codigo_rol INT NOT NULL AUTO_INCREMENT,
  nombre_rol VARCHAR(50) NOT NULL,
  PRIMARY KEY (codigo_rol)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- TABLA USUARIOS
-- -----------------------------------------------------
CREATE TABLE USUARIOS (
  codigo_rol INT NOT NULL,
  codigo_user VARCHAR(10) NOT NULL,
  nombres_user VARCHAR(50) NOT NULL,
  apellidos_user VARCHAR(50) NOT NULL,
  correo_user VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo_user),
  INDEX ind_usuarios_roles (codigo_rol ASC) INVISIBLE,
  UNIQUE INDEX uq_correo_user (correo_user ASC) INVISIBLE,
  CONSTRAINT fk_usuarios_roles
    FOREIGN KEY (codigo_rol)
    REFERENCES ROLES (codigo_rol)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`CREDENCIALES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`CREDENCIALES` (
  `codigo_user` VARCHAR(10) NOT NULL,
  `identificacion_user` INT NOT NULL,
  `pass_user` VARCHAR(150) NOT NULL,
  `estado_user` TINYINT NOT NULL,
  INDEX `ind_credenciales_usuarios` (`codigo_user` ASC) INVISIBLE,
  PRIMARY KEY (`codigo_user`),
  UNIQUE INDEX `uq_identificacion_user` (`identificacion_user` ASC) INVISIBLE,
  CONSTRAINT `fk_credenciales_usuarios`
    FOREIGN KEY (`codigo_user`)
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
  INDEX `ind_mensajes_usuarios` (`codigo_user` ASC) INVISIBLE,
  CONSTRAINT `fk_mensajes_usuarios`
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
  INDEX `ind_productos_categorias` (`codigo_categoria` ASC) INVISIBLE,
  CONSTRAINT `fk_productos_categorias`
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
  PRIMARY KEY (`codigo_pedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`LISTA_PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`LISTA_PRODUCTOS` (
  `codigo_pedido` VARCHAR(10) NOT NULL,
  `codigo_producto` VARCHAR(10) NOT NULL,
  `cantidad_productos` INT NOT NULL,
  INDEX `ind_lista_productos_pedidos` (`codigo_pedido` ASC) INVISIBLE,
  INDEX `ind_lista_productos_productos` (`codigo_producto` ASC) INVISIBLE,
  CONSTRAINT `fk_lista_productos_pedidos`
    FOREIGN KEY (`codigo_pedido`)
    REFERENCES `bbdd_ventas`.`PEDIDOS` (`codigo_pedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lista_productos_productos`
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
  `direccion_user` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo_customer`),
  INDEX `ind_clientes_credenciales` (`codigo_customer` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_credenciales`
    FOREIGN KEY (`codigo_customer`)
    REFERENCES `bbdd_ventas`.`CREDENCIALES` (`codigo_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`VENDEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`VENDEDORES` (
  `codigo_seller` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`codigo_seller`),
  INDEX `ind_vendedores_credenciales` (`codigo_seller` ASC) VISIBLE,
  CONSTRAINT `fk_vendedores_credenciales`
    FOREIGN KEY (`codigo_seller`)
    REFERENCES `bbdd_ventas`.`CREDENCIALES` (`codigo_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bbdd_ventas`.`USUARIOS_PEDIDOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbdd_ventas`.`USUARIOS_PEDIDOS` (
  `codigo_customer` VARCHAR(10) NOT NULL,
  `codigo_seller` VARCHAR(10) NOT NULL,
  `codigo_pedido` VARCHAR(10) NOT NULL,
  INDEX `ind_credenciales_pedidos_cliente` (`codigo_customer` ASC) INVISIBLE,
  INDEX `ind_credenciales_pedidos_vendedor` (`codigo_seller` ASC) INVISIBLE,
  INDEX `ind_credenciales_pedidos_pedido` (`codigo_pedido` ASC) VISIBLE,
  UNIQUE INDEX `codigo_pedido_UNIQUE` (`codigo_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_credenciales_pedidos_cliente`
    FOREIGN KEY (`codigo_customer`)
    REFERENCES `bbdd_ventas`.`CLIENTES` (`codigo_customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_credenciales_pedidos_seller`
    FOREIGN KEY (`codigo_seller`)
    REFERENCES `bbdd_ventas`.`VENDEDORES` (`codigo_seller`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_credenciales_pedidos_pedido`
    FOREIGN KEY (`codigo_pedido`)
    REFERENCES `bbdd_ventas`.`PEDIDOS` (`codigo_pedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- ESTRUCTURA BBDD: BBDD_VENTAS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS bbdd_ventas DEFAULT CHARACTER SET utf8;
USE bbdd_ventas;

-- -----------------------------------------------------
-- TABLA: ROLES
-- -----------------------------------------------------
CREATE TABLE ROLES (
  codigo_rol INT NOT NULL AUTO_INCREMENT,
  nombre_rol VARCHAR(50) NOT NULL,
  PRIMARY KEY (codigo_rol)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: USUARIOS
-- -----------------------------------------------------
CREATE TABLE USUARIOS (
  codigo_rol INT NOT NULL,
  codigo_user VARCHAR(10) NOT NULL,  
  nombres_user VARCHAR(50) NOT NULL,
  apellidos_user VARCHAR(50) NOT NULL,
  correo_user VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo_user),  
  UNIQUE INDEX uq_correo_user (correo_user ASC),
  INDEX ind_usuarios_roles (codigo_rol ASC),
  CONSTRAINT fk_usuarios_roles
    FOREIGN KEY (codigo_rol)
    REFERENCES ROLES (codigo_rol)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: CREDENCIALES
-- -----------------------------------------------------
CREATE TABLE CREDENCIALES (
  codigo_user VARCHAR(10) NOT NULL,
  identificacion_user INT NOT NULL,  
  pass_user VARCHAR(150) NOT NULL,
  PRIMARY KEY (codigo_user),
  UNIQUE INDEX uq_identificacion_user (identificacion_user ASC),
  INDEX ind_credenciales_usuarios (codigo_user ASC),
  CONSTRAINT chk_evitarPersona 
  CHECK (codigo_user NOT LIKE '%person%'),
  CONSTRAINT fk_credenciales_usuarios
    FOREIGN KEY (codigo_user)
    REFERENCES USUARIOS (codigo_user)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: MENSAJES
-- -----------------------------------------------------
CREATE TABLE MENSAJES (
  codigo_user VARCHAR(10) NOT NULL,
  fecha_mensaje DATE NOT NULL,
  asunto_mensaje VARCHAR(50) NOT NULL,
  descripcion_mensaje VARCHAR(300) NOT NULL,
  INDEX ind_mensajes_usuarios (codigo_user ASC),
  CONSTRAINT fk_mensajes_usuarios
    FOREIGN KEY (codigo_user)
    REFERENCES USUARIOS (codigo_user)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: CATEGORÍAS
-- -----------------------------------------------------
CREATE TABLE CATEGORIAS (
  codigo_categoria INT NOT NULL AUTO_INCREMENT,
  nombre_categoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (codigo_categoria)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: PRODUCTOS
-- -----------------------------------------------------
CREATE TABLE PRODUCTOS (
  codigo_categoria INT NOT NULL,
  codigo_producto VARCHAR(10) NOT NULL,
  nombre_producto VARCHAR(50) NOT NULL,
  precio_producto DECIMAL(10,2) NOT NULL,
  unidad_producto DECIMAL(5,2) NOT NULL,
  medida_producto VARCHAR(20) NOT NULL,
  PRIMARY KEY (codigo_producto),
  INDEX ind_productos_categorias (codigo_categoria ASC),
  CONSTRAINT fk_productos_categorias
    FOREIGN KEY (codigo_categoria)
    REFERENCES CATEGORIAS (codigo_categoria)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: PEDIDOS
-- -----------------------------------------------------
CREATE TABLE PEDIDOS (
  codigo_pedido VARCHAR(10) NOT NULL,
  fecha_pedido DATE NOT NULL,
  total_pl_pedido DECIMAL(10,2) NOT NULL,
  iva_pedido DECIMAL(10,2) NOT NULL,
  total_pr_pedido DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (codigo_pedido))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: LISTA_PRODUCTOS
-- -----------------------------------------------------
CREATE TABLE LISTA_PRODUCTOS (
  codigo_pedido VARCHAR(10) NOT NULL,
  codigo_producto VARCHAR(10) NOT NULL,
  cantidad_productos INT NOT NULL,
  INDEX ind_lista_productos_pedidos (codigo_pedido ASC),
  INDEX ind_lista_productos_productos (codigo_producto ASC),
  CONSTRAINT fk_lista_productos_pedidos
    FOREIGN KEY (codigo_pedido)
    REFERENCES PEDIDOS (codigo_pedido)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_lista_productos_productos
    FOREIGN KEY (codigo_producto)
    REFERENCES PRODUCTOS (codigo_producto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA: CREDENCIALES_PEDIDOS
-- -----------------------------------------------------
CREATE TABLE CREDENCIALES_PEDIDOS (
  codigo_user VARCHAR(10) NOT NULL,
  codigo_pedido VARCHAR(10) NOT NULL,
  INDEX ind_credenciales_pedidos_credenciales (codigo_user ASC),
  INDEX ind_credenciales_pedidos_pedidos (codigo_pedido ASC),
  CONSTRAINT fk_credenciales_pedidos_credenciales
    FOREIGN KEY (codigo_user)
    REFERENCES CREDENCIALES (codigo_user)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_credenciales_pedidos_pedidos
    FOREIGN KEY (codigo_pedido)
    REFERENCES PEDIDOS (codigo_pedido)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------