/* ************************************************************************************* */
/* ---------------------------------------- DDL ---------------------------------------- */
/* ----------------------------- DATA DEFINITION LANGUAGE ------------------------------ */
/* -------------------------- LENGUAJE DE DEFINICIÓN DE DATOS -------------------------- */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* ------------------------------------------------------------------------------------- */
/* 01. Mostrar BBDDs:...................... SHOW DATABASES __                            */
/* 02. Usar BBDD: ......................... USE __                                       */
/* 03. Eliminar BBDD: ..................... DROP DATABASE __                             */
/* 04. Mostrar Tablas: .................... SHOW TABLES __                               */
/* 05. Mostrar Creación Tabla: ............ SHOW CREATE TABLE __                         */
/* 06. Eliminar Restricción: .............. ALTER TABLE __ DROP CONSTRAINT __            */
/* 07. Limpiar Registros: ................. TRUNCATE __                                  */
/* 08. Eliminar Índice: ................... ALTER TABLE __ DROP INDEX __                 */
/* 09. Eliminar Llave Primaria: ........... ALTER TABLE __ DROP PRIMARY KEY              */
/* 10. Mostar Columnas: ................... SHOW COLUMNS FROM __                         */
/* 11. Agregar Columna: ................... ALTER TABLE __ ADD __ __                     */
/* 12. Renombrar Columna: ................. ALTER TABLE __ CHANGE __ __                  */
/* 13. Eliminar Columna: .................. ALTER TABLE __ DROP __                       */
/* 14. Agregar Valor x Defecto Columna: ... ALTER TABLE __ ALTER __ SET DEFAULT __       */
/* 15. Eliminar Valor x Defecto Columna: .. ALTER TABLE __ ALTER __ DROP DEFAULT         */
/* 16. Eliminar Tabla: .................... DROP TABLE __                                */
/* 17. Crear Tabla: ....................... CREATE TABLE __ ( __ , __ )                  */
/* 18. Renombrar Tabla: ................... RENAME TABLE __ TO __                        */
/* 19. Crear Llave Primaria: .............. ALTER TABLE __ ADD PRIMARY KEY ( __ )        */
/* 20. Crear Índice Campo: ................ CREATE INDEX __ ON __ ( __ )                 */
/* 21. Crear Índice Multicampo: ........... CREATE INDEX _ ON _ ( __ , __ )              */
/* 22. Crear Índice Único: ................ CREATE UNIQUE INDEX __ ON __ ( __ )          */
/* 23. Crear Restricción: ................. ALTER TABLE __ ADD CONSTRAINT __             */
/*     FOREIGN KEY ( __ ) REFERENCES __ ( __ ) ON DELETE CASCADE ON UPDATE CASCADE       */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* EN CONSOLA: XAMPP / SHELL / cd mysql/bin / mysql -h localhost -u root -p / ENTER      */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 01. SHOW DATATABLES __ : Mostrar BBDDs ---------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW DATABASES;
-- ------------------------------------------------------------------------------------- --
-- 02. USE __ : Usar BBDD -------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
USE BBDD_VENTAS;
-- ------------------------------------------------------------------------------------- --
-- 03. DROP DATABASE __ : Eliminar BBDD ------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
DROP DATABASE BBDD_VENTAS;
-- ------------------------------------------------------------------------------------- --
-- 04. SHOW TABLES __ : Mostrar Tablas ------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW TABLES;
-- ------------------------------------------------------------------------------------- --
-- 05. SHOW CREATE TABLE __ : Mostrar Creación Tabla ----------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW CREATE TABLE USUARIOS;
SHOW CREATE TABLE CREDENCIALES;
SHOW CREATE TABLE MENSAJES;
-- ------------------------------------------------------------------------------------- --
-- 06. ALTER TABLE __ DROP CONSTRAINT __ : Eliminar Restricción ------------------------ --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP CONSTRAINT fk_usuarios_roles;
ALTER TABLE CREDENCIALES DROP CONSTRAINT fk_credenciales_usuarios;
ALTER TABLE MENSAJES DROP CONSTRAINT fk_mensajes_usuarios;
-- ------------------------------------------------------------------------------------- --
-- 07. Limpiar Registros: TRUNCATE __ : Limpiar Registros ------------------------------ --
-- ------------------------------------------------------------------------------------- --
TRUNCATE USUARIOS;
-- ------------------------------------------------------------------------------------- --
-- 08. ALTER TABLE __ DROP INDEX __ : Eliminar Índice ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP INDEX ind_usuarios_roles;
ALTER TABLE USUARIOS DROP INDEX uq_identificacion_user;
-- ------------------------------------------------------------------------------------- --
-- 09. ALTER TABLE __ DROP PRIMARY KEY : Eliminar Llave Primaria ----------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP PRIMARY KEY;
ALTER TABLE CREDENCIALES DROP PRIMARY KEY;
-- ------------------------------------------------------------------------------------- --
-- 10. SHOW COLUMNS FROM __ : Mostar Columnas ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
SHOW COLUMNS FROM USUARIOS;
-- ------------------------------------------------------------------------------------- --
-- 11. ALTER TABLE __ ADD __ __ : Agregar Columna -------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ADD correo_usuario VARCHAR(100);
-- ------------------------------------------------------------------------------------- --
-- 12. ALTER TABLE __ CHANGE __ __ : Renombrar Columna --------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS CHANGE correo_usuario usuario_correo DATE;
ALTER TABLE USUARIOS CHANGE usuario_correo correo_usuario VARCHAR(100);
-- ------------------------------------------------------------------------------------- --
-- 13. ALTER TABLE __ DROP __ : Eliminar Columna --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP correo_usuario;
-- ------------------------------------------------------------------------------------- --
-- 14. ALTER TABLE __ ALTER __ SET DEFAULT __ :	Agregar Valor x Defecto Columna -------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ALTER codigo_rol SET DEFAULT 2;
-- ------------------------------------------------------------------------------------- --
-- 15. ALTER TABLE __ ALTER __ DROP DEFAULT : Eliminar Valor x Defecto Columna --------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ALTER codigo_rol DROP DEFAULT;
-- ------------------------------------------------------------------------------------- --
-- 16. DROP TABLE __ : Eliminar Tabla -------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DROP TABLE USUARIOS;
-- ------------------------------------------------------------------------------------- --
-- 17. CREATE TABLE __ ( __ , __ ) : Crear Tabla --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE USUARIOS (
  codigo_rol INT NOT NULL,
  codigo_user VARCHAR(10) NOT NULL,
  identificacion_user INT NOT NULL,
  nombres_user VARCHAR(50) NOT NULL,
  apellidos_user VARCHAR(50) NOT NULL
);
-- ------------------------------------------------------------------------------------- --
-- 18. RENAME TABLE __ TO __ : Renombrar Tabla ----------------------------------------- --
-- ------------------------------------------------------------------------------------- --
RENAME TABLE USUARIOS TO PERSONAS;
RENAME TABLE PERSONAS TO USUARIOS;
-- ------------------------------------------------------------------------------------- --
-- 19. ALTER TABLE __ ADD PRIMARY KEY ( __ ) : Crear Llave Primaria -------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ADD PRIMARY KEY (codigo_user);
ALTER TABLE CREDENCIALES ADD PRIMARY KEY (codigo_user);
-- ------------------------------------------------------------------------------------- --
-- 20. CREATE INDEX __ ON __ ( __ ) : Crear Índice Campo ------------------------------- --
-- ------------------------------------------------------------------------------------- --
CREATE INDEX ind_usuarios_roles ON USUARIOS (codigo_rol);
-- ------------------------------------------------------------------------------------- --
-- 21. CREATE INDEX _ ON _ ( __ , __ ) : Crear Índice Multicampo ----------------------- -- 
-- ------------------------------------------------------------------------------------- --
CREATE INDEX ind_codigo_user_correo_user ON CREDENCIALES (codigo_user, correo_user);
-- ------------------------------------------------------------------------------------- --
-- 22. CREATE UNIQUE INDEX __ ON __ ( __ ) : Crear Índice Único ------------------------ --
-- ------------------------------------------------------------------------------------- --
CREATE UNIQUE INDEX uq_identificacion_user ON USUARIOS (identificacion_user);
-- ------------------------------------------------------------------------------------- --
-- 23. ALTER TABLE __ ADD CONSTRAINT __ FOREIGN KEY ( __ ) REFERENCES __ ( __ ) -------- --
-- ON DELETE CASCADE ON UPDATE CASCADE : Crear Restricción ----------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ADD 
CONSTRAINT fk_usuarios_roles 
	FOREIGN KEY (codigo_rol)
	REFERENCES ROLES (codigo_rol)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
ALTER TABLE CREDENCIALES ADD 
CONSTRAINT fk_credenciales_usuarios 
	FOREIGN KEY (codigo_user)
	REFERENCES USUARIOS (codigo_user)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
ALTER TABLE MENSAJES ADD 
CONSTRAINT fk_mensajes_usuarios 
	FOREIGN KEY (codigo_user)
	REFERENCES USUARIOS (codigo_user)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-- ------------------------------------------------------------------------------------- --