-- ------------------------------------------------------------------------------------- --
-- ---------------------------------------- DDL ---------------------------------------- --
-- ----------------------------- DATA DEFINITION LANGUAGE ------------------------------ --
-- -------------------------- LENGUAJE DE DEFINICIÓN DE DATOS -------------------------- --
-- ------------------------------------------------------------------------------------- --
-- 01. Mostrar BBDDs:.................... SHOW DATABASES __								 --
-- 02. Usar BBDD: ....................... USE __										 --
-- 03. Eliminar BBDD: ................... DROP DATABASE __								 --
-- 04. Mostrar Tablas: .................. SHOW TABLES __								 --
-- 05. Mostrar Creación Tabla: .......... SHOW CREATE TABLE __							 --
-- 06. Eliminar Restricción: ............ ALTER TABLE __ DROP CONSTRAINT __				 --


-- 07. Eliminar Tabla: .................. DROP TABLE __									 --
-- 08. Crear Tabla: ..................... CREATE TABLE __ ( __ , __ )					 --
-- 09. Renombrar Tabla: ................. RENAME TABLE __ TO __							 --
-- 10. Crear LlavePrimaria: ............. CREATE TABLE __ ( __ , __ )					 --

-- 06. Mostar Columnas: ................. SHOW COLUMNS FROM __							 --
-- 07. Agrear Columna: .................. ALTER TABLE __ ADD __ __						 --
-- 08. Renombrar Columna: ............... ALTER TABLE __ CHANGE __ __					 --
-- 09. Eliminar Columna: ................ ALTER TABLE __ DROP __	 					 --
-- 10. Agregar ValorxDefecto Columna: ... ALTER TABLE __ ALTER __ SET DEFAULT __		 --
-- 11. Eliminar ValorxDefecto Columna: .. ALTER TABLE __ ALTER __ DROP DEFAULT			 --
-- ------------------------------------------------------------------------------------- --
-- EN CONSOLA: XAMPP / SHELL / cd mysql/bin / mysql -h localhost -u root -p / ENTER		 --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 01. SHOW DATATABLES __ : ------------------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
SHOW DATABASES;
-- ------------------------------------------------------------------------------------- --
-- 02. USE __ : ------------------------------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
USE BBDD_VENTAS;
-- ------------------------------------------------------------------------------------- --
-- 03. DROP DATABASE __ : -------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DROP DATABASE BBDD_VENTAS;
-- ------------------------------------------------------------------------------------- --
-- 04. SHOW TABLES __ : ---------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW TABLES;
-- ------------------------------------------------------------------------------------- --
-- 05. SHOW CREATE TABLE __ : ---------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW CREATE TABLE ROLES;
-- ------------------------------------------------------------------------------------- --
-- 06. ALTER TABLE __ DROP CONSTRAINT __ : --------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP CONSTRAINT fk_usuarios_roles;
ALTER TABLE MENSAJES DROP CONSTRAINT fk_mensajes_usuarios;
-- ------------------------------------------------------------------------------------- --
-- 07. DROP TABLE __ : ----------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DROP TABLE USUARIOS;
-- ------------------------------------------------------------------------------------- --
-- 08. CREATE TABLE __ ( __ , __ ) : --------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE USUARIOS (
  codigo_rol INT NOT NULL,
  codigo_user VARCHAR(10) NOT NULL,
  identificacion_user INT NOT NULL,
  nombres_user VARCHAR(50) NOT NULL,
  apellidos_user VARCHAR(50) NOT NULL
);
-- ------------------------------------------------------------------------------------- --
-- 09. RENAME TABLE __ TO __ : --------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
RENAME TABLE USUARIOS TO PERSONAS;
RENAME TABLE PERSONAS TO USUARIOS;
-- ------------------------------------------------------------------------------------- --
-- 10. ALTER TABLE __ ADD PRIMARY KEY (__): -------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ADD PRIMARY KEY (codigo_user);




-- ------------------------------------------------------------------------------------- --
-- 06. SHOW COLUMNS FROM __ : ---------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW COLUMNS FROM PEDIDOS;
-- ------------------------------------------------------------------------------------- --
-- 07. ALTER TABLE __ ADD __ __ : ------------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ADD correo_usuario VARCHAR(100);
-- ------------------------------------------------------------------------------------- --
-- 08. ALTER TABLE __ CHANGE __ __ : --------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE MENSAJES CHANGE correo_usuario usuario_correo DATE;
ALTER TABLE MENSAJES CHANGE usuario_correo correo_usuario VARCHAR(100);
-- ------------------------------------------------------------------------------------- --
-- 09. ALTER TABLE __ DROP __ : -------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP correo_usuario;
-- ------------------------------------------------------------------------------------- --
-- 10. ALTER TABLE __ ALTER __ SET DEFAULT __ :	---------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ALTER codigo_rol SET DEFAULT 2;
-- ------------------------------------------------------------------------------------- --
-- 11. ALTER TABLE __ ALTER __ DROP DEFAULT : ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ALTER codigo_rol DROP DEFAULT;


-- ------------------------------------------------------------------------------------- --
-- 00. Eliminar Llave Primaria
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP PRIMARY KEY;

-- ------------------------------------------------------------------------------------- --
-- 00. Eliminar Índice
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP INDEX ind_usuarios_roles;


-- ------------------------------------------------------------------------------------- --
-- 00. Agregar ENGINE = InnoDB a una Tabla;
-- ------------------------------------------------------------------------------------- --
ALTER TABLE mybbdd.mitabla engine = InnoDB

-- ------------------------------------------------------------------------------------- --
-- 00. Eliminar restricción CONSTRAINT e índice KEY de productos_pedidos con pedidos
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP PRIMARY KEY codigo_user;



## Eliminar restricción CONSTRAINT e índice KEY de productos_pedidos con productos
-- ------------------------------------------------------------------------------------- --
ALTER TABLE productos_pedidos DROP CONSTRAINT fk_productos_pedidos_productos;
ALTER TABLE productos_pedidos DROP KEY fk_productos_pedidos_productos;
-- ------------------------------------------------------------------------------------- --




-- ------------------------------------------------------------------------------------- --
-- 00. Eliminar Restricción: CONSTRAINT e índice KEY de pedidos con clientes
-- ------------------------------------------------------------------------------------- --
ALTER TABLE CREDENCIALES CONSTRAINT fk_pedidos_clientes;
ALTER TABLE pedidos DROP KEY fk_pedidos_clientes;
-- ------------------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
-- 00. Eliminar Indice: ALTER TABLE __ DROP INDEX __ ;
-- ------------------------------------------------------------------------------------- --
ALTER TABLE PRODUCTOS DROP INDEX ind_productos_categorias;
-- ------------------------------------------------------------------------------------- --




-- ------------------------------------------------------------------------------------- --
-- CREAR UN ÍNDICE EN UNA TABLA (CREATE, INDEX, ON) (PERMITE DUPLICADOS)
-- ------------------------------------------------------------------------------------- --
CREATE INDEX indice_empresa ON clientes (empresa);
-- ------------------------------------------------------------------------------------- --


-- ------------------------------------------------------------------------------------- --
-- CREAR UN ÍNDICE EN UNA TABLA (CREATE, INDEX, ON) (NO PERMITE DUPLICADOS)
-- ------------------------------------------------------------------------------------- --
CREATE UNIQUE INDEX indice_empresa ON clientes (empresa);
-- ------------------------------------------------------------------------------------- --


-- ------------------------------------------------------------------------------------- --
-- CREAR UN ÍNDICE EN UNA TABLA (CREATE, INDEX, ON) (MULTICAMPO)
-- ------------------------------------------------------------------------------------- --
CREATE UNIQUE INDEX indice_empresa ON clientes (empresa, poblacion);
-- ------------------------------------------------------------------------------------- --




-- ------------------------------------------------------------------------------------- --
-- ELIMINAR REGISTROS DE UNA TABLA (TRUNCATE)
-- ------------------------------------------------------------------------------------- --
## Eliminar todos los registros de una tabla
-- ------------------------------------------------------------------------------------- --
TRUNCATE clientes;
TRUNCATE pedidos;
TRUNCATE productos;
TRUNCATE productos_pedidos;
-- ------------------------------------------------------------------------------------- --


-- ------------------------------------------------------------------------------------- --
-- AGREGAR RESTRICCIONES E ÍNDICES (ALTER TABLE, ADD)
-- ------------------------------------------------------------------------------------- --
## Agregar índice y restricción entre la tabla pedidos y clientes
-- ------------------------------------------------------------------------------------- --
ALTER TABLE pedidos
ADD KEY fk_pedidos_clientes (codigo_cliente),
ADD CONSTRAINT fk_pedidos_clientes 
FOREIGN KEY (codigo_cliente)
REFERENCES clientes (codigo_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE;
-- ------------------------------------------------------------------------------------- --
## Agregar índice y restricción entre la tabla productos_pedidos y pedidos
-- ------------------------------------------------------------------------------------- --
ALTER TABLE productos_pedidos
ADD KEY fk_productos_pedidos_pedidos (numero_pedido),
ADD CONSTRAINT fk_productos_pedidos_pedidos
FOREIGN KEY (numero_pedido)
REFERENCES pedidos (numero_pedido)
ON DELETE CASCADE
ON UPDATE CASCADE;
-- ------------------------------------------------------------------------------------- --
## Agregar índice y restricción entre la tabla productos_pedidos y productos
-- ------------------------------------------------------------------------------------- --
ALTER TABLE productos_pedidos
ADD KEY fk_productos_pedidos_productos (codigo_articulo),
ADD CONSTRAINT fk_productos_pedidos_productos
FOREIGN KEY (codigo_articulo)
REFERENCES productos (codigo_articulo)
ON DELETE CASCADE
ON UPDATE CASCADE;
-- ------------------------------------------------------------------------------------- --
