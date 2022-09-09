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
/* 2.2.1. INNER JOIN : ............... INNER JOIN                                        */
/* 2.2.2. LEFT JOIN : ................ LEFT JOIN                                         */
/* 2.2.2. RIGHT JOIN : ............... RIGHT JOIN                                        */
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
--         : --------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------
-- ## - Inner Join: Solo la información común entre las tablas: clientes y 
-- pedidos. Clientes de Madrid que SÍ han hecho pedidos
-- ----------------------------------------------------------------------------
SELECT * FROM clientes INNER JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = 'MADRID' ORDER BY clientes.codigo_cliente

## Empresas que han hecho pedidos
-- -------------------------------------------------------------------------------------
SELECT empresa FROM clientes INNER JOIN pedidos
ON clientes.codigo_cliente = pedidos.codigo_cliente
-- -------------------------------------------------------------------------------------
## Empresas que han hecho pedidos sin repeticiones
-- -------------------------------------------------------------------------------------
SELECT DISTINCT empresa FROM clientes INNER JOIN pedidos
ON clientes.codigo_cliente = pedidos.codigo_cliente
-- -------------------------------------------------------------------------------------
## Clientes de Madrid que han hecho pedidos
-- -------------------------------------------------------------------------------------
SELECT * FROM clientes INNER JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = 'ÁVILA' ORDER BY clientes.codigo_cliente
-- -------------------------------------------------------------------------------------
## Campos comunes de clientes y pedidos codigo_cliente, empresa, pobalción, fecha_pedido 
-- de la tabla clientes que sean de Madrid y que han hecho pedidos
-- -------------------------------------------------------------------------------------
SELECT clientes.codigo_cliente, empresa, poblacion, fecha_pedido  
FROM clientes INNER JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = 'MADRID' ORDER BY clientes.codigo_cliente
-- -------------------------------------------------------------------------------------
## Campos comunes codigo_cliente, poblacion, direccion, numero_pedido y forma_pago de 
-- pedidos donde clientes y pedidos estén relacionados
-- -------------------------------------------------------------------------------------
SELECT clientes.codigo_cliente, poblacion, direccion, numero_pedido, 
pedidos.codigo_cliente, forma_pago FROM clientes INNER JOIN pedidos
ON clientes.codigo_cliente = pedidos.codigo_cliente
-- -------------------------------------------------------------------------------------
## Campos comunes codigo_cliente, poblacion, direccion, numero_pedido y forma_pago de 
-- pedidos donde clientes y pedidos estén relacionados; además, filtre por la población
-- de Madrid y los ordene de menor a mayor
-- -------------------------------------------------------------------------------------
SELECT clientes.codigo_cliente, poblacion, direccion, 
numero_pedido, forma_pago FROM clientes INNER JOIN pedidos
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = "MADRID" ORDER BY clientes.codigo_cliente

-- ----------------------------------------------------------------------------
-- ## - Inner Join: Ver el codigo_cliente, poblacion, direccion, numero_pedido
-- de la tabla clientes y codigo_cliente, forma_pago de la tabla pedidos donde
-- clientes y pedidos estén relacionados
-- ----------------------------------------------------------------------------
SELECT clientes.codigo_cliente, poblacion, direccion, numero_pedido, 
pedidos.codigo_cliente, forma_pago FROM clientes INNER JOIN pedidos
ON clientes.codigo_cliente = pedidos.codigo_cliente
-- ----------------------------------------------------------------------------
-- ## - Left Join: Ver el codigo_cliente, poblacion, direccion, numero_pedido
-- de la tabla clientes y codigo_cliente, forma_pago de la tabla pedidos donde
-- clientes y pedidos estén relacionados. Además, filtre solo los de Madrid y
-- los ordene de menor a mayor
-- ----------------------------------------------------------------------------
SELECT clientes.codigo_cliente, poblacion, direccion, numero_pedido, 
pedidos.codigo_cliente, forma_pago FROM clientes INNER JOIN pedidos
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = "MADRID" ORDER BY clientes.codigo_cliente

-- ------------------------------------------------------------------------------------- --
-- 2.2.2. Unión Interna. --------------------------------------------------------------- --
--        LEFT JOIN : ------------------------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --

-- ----------------------------------------------------------------------------
-- ## - Left Join: La información de la tabla de la izquierda (clientes) y 
-- y la información común entre las tablas: clientes y pedidos.
-- Todos los clientes de Madrid y que además hayan hecho pedidos
-- ----------------------------------------------------------------------------
SELECT * FROM clientes LEFT JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = 'MADRID' ORDER BY clientes.codigo_cliente

## Todos los clientes de Madrid y que además hayan hecho pedidos
-- -------------------------------------------------------------------------------------
SELECT * FROM clientes LEFT JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = 'MADRID' ORDER BY clientes.codigo_cliente
-- -------------------------------------------------------------------------------------
## Todos los clientes de Madrid y que no hayan hecho pedidos
-- -------------------------------------------------------------------------------------
SELECT * FROM clientes LEFT JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = 'MADRID' AND pedidos.codigo_cliente IS NULL
ORDER BY clientes.codigo_cliente

-- ----------------------------------------------------------------------------
-- ## - Todos los clientes de Madrid y que no hayan hecho pedidos
-- ----------------------------------------------------------------------------
SELECT * FROM clientes LEFT JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
WHERE poblacion = 'MADRID' AND pedidos.codigo_cliente IS NULL
ORDER BY clientes.codigo_cliente


-- ------------------------------------------------------------------------------------- --
-- 2.2.3. Unión Interna. --------------------------------------------------------------- --
--        RIGHT JOIN : ----------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
## Todos pedidos que se hayan hecho, así no tengan clientes asociados (OJO)
-- -------------------------------------------------------------------------------------
SELECT * FROM clientes RIGHT JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
ORDER BY clientes.codigo_cliente

-- ----------------------------------------------------------------------------
-- ## - Right Join: La información de la tabla de la derecha (pedidos) y 
-- y la información común entre las tablas: clientes y pedidos
-- Todos pedidos que se hayan hecho, así no tengan clientes asociados (OJO)
-- ----------------------------------------------------------------------------
SELECT * FROM clientes RIGHT JOIN pedidos 
ON clientes.codigo_cliente = pedidos.codigo_cliente
ORDER BY clientes.codigo_cliente


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