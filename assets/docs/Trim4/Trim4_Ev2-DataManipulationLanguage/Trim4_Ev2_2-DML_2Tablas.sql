/* ************************************************************************************* */
/* ---------------------------------------- DML ---------------------------------------- */
/* ---------------------------- DATA MANIPULATION LANGUAGE ----------------------------- */
/* ------------------------- LENGUAJE DE MANIPULACIÓN DE DATOS ------------------------- */
/* -------------------------------- MULTITABLA / UNIÓN --------------------------------- */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* ------------------------------------------------------------------------------------- */
/* 1. CONSULTAS DE ACCIÓN [Inicio]                                                       */
/* 1.1. Crear una Tabla con Otra : ... CREATE TABLE __ SELECT __ FROM __ WHERE __ = __   */
/* 1.2. Insertar Datos Anexados : .... INSERT INTO __ SELECT __ FROM __                  */
/* 2. CONSULTAS DE SELECCIÓN                                                             */
/* 2.1. Unión Externa : .............. UNION, UNION ALL                                  */
/* 2.1.1. UNION : .................... SELECT __ FROM __ UNION SELECT __ FROM __         */
/* 2.1.2. UNION ALL : ................ SELECT __ FROM __ UNION ALL SELECT __ FROM __     */
/* 2.2. Unión Interna : .............. INNER JOIN, LEFT JOIN, RIGHT JOIN                 */
/* 2.2.1. INNER JOIN : ............... SELECT __ FROM __ INNER JOIN __ ON __.__ = __.__  */
/* 2.2.1.1. Con Repeticiones : ....... INNER JOIN                                        */
/* 2.2.1.2. Sin Repeticiones : ....... DISTINCT                                          */
/* 2.2.1.3. Condicionada : ........... WHERE, OPERADORES, ORDER BY                       */
/* 2.2.2. LEFT JOIN : ................ SELECT __ FROM __ LEFT JOIN __ ON __.__ = __.__   */
/* 2.2.2. RIGHT JOIN : ............... SELECT __ FROM __ RIGHT JOIN __ ON __.__ = __.__  */
/* 2.3. Subconsultas : ............... IN, NOT IN                                        */
/* 2.3.1. Escalonada : ............... IN, NOT IN                                        */
/* 2.3.2. Lista : .................... IN, NOT IN                                        */
/* 2.3.2. Correlacionada : ........... IN, NOT IN                                        */
/* 3. CONSULTAS DE ACCIÓN [Final]                                                        */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* EN CONSOLA: XAMPP / SHELL / cd mysql/bin / mysql -h localhost -u root -p / ENTER      */
/* ************************************************************************************* */



/* ************************************************************************************* */
/* ------------------------------ 1. CONSULTAS DE ACCIÓN ------------------------------- */
/* -------------------------------------- INICIO --------------------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 1.1. Crear una Tabla a partir de Otra. ---------------------------------------------- --
--      CREATE TABLE __ SELECT __ FROM __ WHERE __ = __ : ------------------------------ --
-- ------------------------------------------------------------------------------------- --
CREATE TABLE PEDIDOS_BOGOTA SELECT * FROM PEDIDOS
WHERE ciudad_pedido = 'Bogotá';

-- -------------------------------------------
DELETE FROM PEDIDOS 
WHERE ciudad_pedido = 'Bogotá';

-- ------------------------------------------------------------------------------------- --
-- 1.2. Datos Anexados. ---------------------------------------------------------------- --
--      INSERT INTO __ SELECT __ FROM __ : --------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
INSERT INTO PEDIDOS SELECT * FROM PEDIDOS_BOGOTA;


/* ************************************************************************************* */
/* ----------------------------- 2. CONSULTAS DE SELECCIÓN ----------------------------- */
/* -------------------------- EXTERNA, INTERNA Y SUBCONSULTAS -------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 2.1. Unión Externa. ----------------------------------------------------------------- --
--      UNION, UNION ALL : ------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.1.1. UNION. ----------------------------------------------------------------------- --
--        SELECT __ FROM __ UNION SELECT __ FROM __ : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS UNION 
SELECT * FROM PRODUCTOS_NUEVOS;

SELECT * FROM PRODUCTOS WHERE codigo_categoria = 2 UNION 
SELECT * FROM PRODUCTOS_NUEVOS WHERE codCat = 2;

SELECT * FROM PRODUCTOS WHERE precio_producto > 5000 UNION 
SELECT * FROM PRODUCTOS_NUEVOS WHERE codCat = 4 AND artPrec > 5000;

SELECT codigo_categoria, nombre_producto, precio_producto 
FROM PRODUCTOS WHERE precio_producto > 5000 UNION 
SELECT codCat, artNom, artPrec 
FROM PRODUCTOS_NUEVOS WHERE codCat = 4 AND artPrec > 5000;

-- ------------------------------------------------------------------------------------- --
-- 2.1.2. UNION ALL. ------------------------------------------------------------------- --
--        SELECT __ FROM __ UNION ALL SELECT __ FROM __ : ------------------------------ --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS UNION ALL
SELECT * FROM PRODUCTOS_NUEVOS;


-- ------------------------------------------------------------------------------------- --
-- 2.2. Unión Interna. ----------------------------------------------------------------- --
--      INNER JOIN, LEFT JOIN, RIGHT JOIN : -------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.2.1. INNER JOIN. ------------------------------------------------------------------ --
--        SELECT __ FROM __ INNER JOIN __ ON __.__ = __.__ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM CLIENTES INNER JOIN PEDIDOS
ON clientes.codigo_customer = pedidos.codigo_customer;

SELECT * FROM CREDENCIALES 
INNER JOIN CLIENTES
ON credenciales.codigo_cred = clientes.codigo_customer
INNER JOIN PEDIDOS
ON clientes.codigo_customer = pedidos.codigo_customer;

SELECT * FROM USUARIOS
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred 
INNER JOIN CLIENTES
ON credenciales.codigo_cred = clientes.codigo_customer
INNER JOIN PEDIDOS
ON clientes.codigo_customer = pedidos.codigo_customer;

SELECT * FROM USUARIOS 
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred
INNER JOIN PEDIDOS
ON credenciales.codigo_cred = pedidos.codigo_customer;

-- ------------------------------------------------------------------------------------- --
-- 2.2.1.1. Con repeticiones. ---------------------------------------------------------- --
--          SELECT __ FROM __ INNER JOIN __ ON __.__ = __.__ : ------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_pedido, codigo_user, nombres_user, apellidos_user, correo_user,
identificacion_cred, fecha_pedido, ciudad_pedido, total_pr_pedido, estado_pedido
FROM USUARIOS 
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred
INNER JOIN PEDIDOS
ON credenciales.codigo_cred = pedidos.codigo_customer;

-- ------------------------------------------------------------------------------------- --
-- 2.2.1.2. Sin repeticiones. ---------------------------------------------------------- --
--          SELECT DISTINCT __ FROM __ INNER JOIN __ ON __.__ = __.__ : ---------------- --
-- ------------------------------------------------------------------------------------- --
SELECT DISTINCT codigo_user
FROM USUARIOS 
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred
INNER JOIN PEDIDOS
ON credenciales.codigo_cred = pedidos.codigo_customer;


-- ------------------------------------------------------------------------------------- --
-- 2.2.1.2. Condicionada. -------------------------------------------------------------- --
--          WHERE, OPERADORES, ORDER BY : ---------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_pedido, codigo_user, nombres_user, apellidos_user, correo_user,
identificacion_cred, fecha_pedido, ciudad_pedido, total_pr_pedido, estado_pedido
FROM USUARIOS 
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred
INNER JOIN PEDIDOS
ON credenciales.codigo_cred = pedidos.codigo_customer
WHERE estado_pedido = "entregado" OR estado_pedido = "enviado"
ORDER BY total_pr_pedido DESC;

SELECT codigo_pedido, codigo_user, nombres_user, apellidos_user, correo_user,
identificacion_cred, fecha_pedido, ciudad_pedido, total_pr_pedido, estado_pedido
FROM USUARIOS 
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred
INNER JOIN PEDIDOS
ON credenciales.codigo_cred = pedidos.codigo_customer
WHERE ciudad_pedido = "Medellín" AND estado_pedido = "entregado"
ORDER BY total_pr_pedido DESC;

SELECT pedidos.codigo_pedido, codigo_customer, productos.codigo_producto, 
nombre_producto, precio_producto, cantidad_productos, 
(precio_producto * cantidad_productos) AS total_parcial,
ROUND((precio_producto * cantidad_productos) * 0.19, 2) AS iva,
(precio_producto * cantidad_productos) + 
ROUND((precio_producto * cantidad_productos) * 0.19, 2) AS total,
total_pr_pedido AS total_pagar
FROM PEDIDOS
INNER JOIN LISTA_PRODUCTOS
ON pedidos.codigo_pedido = lista_productos.codigo_pedido
INNER JOIN PRODUCTOS
ON lista_productos.codigo_producto = productos.codigo_producto
WHERE pedidos.codigo_pedido = 'pedido-4';

-- ------------------------------------------------------------------------------------- --
-- 2.2.2. LEFT JOIN. ------------------------------------------------------------------- --
--        SELECT __ FROM __ LEFT JOIN __ ON __.__ = __.__ : ---------------------------- --
-- ------------------------------------------------------------------------------------- --

SELECT codigo_pedido, codigo_user, nombres_user, apellidos_user, correo_user,
identificacion_cred, fecha_pedido, ciudad_pedido, total_pr_pedido, estado_pedido
FROM USUARIOS
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred 
INNER JOIN CLIENTES
ON credenciales.codigo_cred = clientes.codigo_customer
LEFT JOIN PEDIDOS
ON clientes.codigo_customer = pedidos.codigo_customer;

SELECT codigo_pedido, codigo_user, nombres_user, 
apellidos_user, correo_user, identificacion_cred
FROM USUARIOS
INNER JOIN CREDENCIALES
ON usuarios.codigo_user = credenciales.codigo_cred 
INNER JOIN CLIENTES
ON credenciales.codigo_cred = clientes.codigo_customer
LEFT JOIN PEDIDOS
ON clientes.codigo_customer = pedidos.codigo_customer
WHERE codigo_pedido IS NULL;

-- ------------------------------------------------------------------------------------- --
-- 2.2.3. RIGHT JOIN. ------------------------------------------------------------------ --
--        SELECT __ FROM __ RIGHT JOIN __ ON __.__ = __.__ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM CLIENTES
RIGHT JOIN PEDIDOS
ON clientes.codigo_customer = pedidos.codigo_customer;

-- NOTA: Esta consulta no Funciona, ya que cada pedido tiene asociado un cliente. No 
--       puede existir pedidos sin clientes
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.3. Subconsulta Correlacionada. ---------------------------------------------------- --
--      IN, NOT IN : ------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
## Nombre y precio de aquellos artículos de los que se han pedido más de 20 unidades
-- -------------------------------------------------------------------------------------
SELECT nombre_articulo, precio FROM productos WHERE codigo_articulo IN 
(SELECT codigo_articulo FROM productos_pedidos WHERE unidades > 20)
-- -------------------------------------------------------------------------------------
## Nombre y precio de aquellos artículos de los que se han pedido más de 20 unidades con
-- INNER JOIN
-- -------------------------------------------------------------------------------------
SELECT nombre_articulo, precio FROM productos INNER JOIN productos_pedidos 
ON productos.codigo_articulo = productos_pedidos.codigo_articulo
WHERE unidades > 20
-- -------------------------------------------------------------------------------------
## Nombre y precio de aquellos artículos de los que no se han pedido más de 20 unidades
-- -------------------------------------------------------------------------------------
SELECT nombre_articulo, precio FROM productos WHERE codigo_articulo NOT IN 
(SELECT codigo_articulo FROM productos_pedidos WHERE unidades > 20)
-- -------------------------------------------------------------------------------------
## Clientes que no han pagado con tarjeta o no han realizado pedidos
-- -------------------------------------------------------------------------------------
SELECT empresa, poblacion FROM clientes WHERE codigo_cliente NOT IN
(SELECT codigo_cliente FROM pedidos WHERE forma_pago = 'TARJETA')
-- -------------------------------------------------------------------------------------


/* ************************************************************************************* */
/* ------------------------------ 3. CONSULTAS DE ACCIÓN ------------------------------- */
/* --------------------------------------- FINAL --------------------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 3.1. Eliminar Datos de una Tabla Relacionada. --------------------------------------- --
--       : ----------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DELETE clientes FROM clientes LEFT JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE pedidos.codigo_cliente IS NULL;