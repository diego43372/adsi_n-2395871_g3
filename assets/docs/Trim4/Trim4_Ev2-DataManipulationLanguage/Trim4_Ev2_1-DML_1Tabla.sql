
/* ************************************************************************************* */
/* ---------------------------------------- DML ---------------------------------------- */
/* ---------------------------- DATA MANIPULATION LANGUAGE ----------------------------- */
/* ------------------------- LENGUAJE DE MANIPULACIÓN DE DATOS ------------------------- */
/* ------------------------------------- UNA TABLA ------------------------------------- */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* ------------------------------------------------------------------------------------- */
/* 1. CONSULTAS DE ACCIÓN : ........... INSERT INTO, UPDATE, DELETE                      */
/* 1.1. Crear o Registrar : ........... INSERT INTO __ VALUES ( __ , __ )                */
/* 1.1.1. Datos Correctos : ........... INSERT INTO __ VALUES ( __ , __ )                */
/* 1.1.2. Datos Incorrectos : ......... INSERT INTO __ VALUES ( __ , __ )                */
/* 1.2. Actualizar : .................. UPDATE __ SET __ = __ WHERE __ = __              */
/* 1.3. Eliminar : .................... DELETE FROM __ WHERE __ = __                     */
/* 2. CONSULTAS DE SELECCIÓN : ........ SELECT                                           */
/* 2.1. Generales : ................... SELECT * FROM __                                 */
/* 2.2. Específicas : ................. SELECT __ , __ FROM __                           */
/* 2.3. Con Criterios : ............... SELECT __ , __ FROM __ WHERE __ = __             */
/* 2.4. Con Operadores Lógicos : ...... OR, AND, NOT                                     */
/* 2.4.1. OR (O) : .................... SELECT __ , __ FROM __ WHERE __ = __ OR __ = __  */                                */
/* 2.4.2. AND (Y) : ................... SELECT __ , __ FROM __ WHERE __ = __ AND __ = __ */                                */
/* 2.4.3. NOT (NO) : ...... ........... SELECT __ , __ FROM __ WHERE __ NOT IN ( __ )    */                                */
/* 2.5. Con Operadores Comparación : .. <>, <, <=, >, >=, LIKE, BEETWEEN, IN, ANY, ALL   */
/* 2.5.1. <> (Diferente) : ............ SELECT __ , __ FROM __ WHERE __ <> __            */
/* 2.5.2. <  (Menor que) : ............ SELECT __ , __ FROM __ WHERE __ <  __            */
/* 2.5.3. >  (Mayor que) : ............ SELECT __ , __ FROM __ WHERE __ >  __            */
/* 2.5.4. <= (Menor o igual) : ........ SELECT __ , __ FROM __ WHERE __ <=  __           */
/* 2.5.5. >= (Mayor o igual) : ........ SELECT __ , __ FROM __ WHERE __ >=  __           */
/* 2.5.6. LIKE ( % , _ ) : ............ SELECT __ , __ FROM __ WHERE __ LIKE '_%'        */
/* 2.5.7. BETWEEN () : ................                                                  */
/* 2.5.8. IN () : .....................                                                  */
/* 2.5.9. ANY () : ....................                                                  */
/* 2.5.10. ALL () : ...................                                                  */
/* 2.6. Ordenadas por un campo : ...... ORDER BY, ASC, DESC                              */
/* 2.7. Ordenadas por varios campos : . ORDER BY, ASC, DESC                              */
/* 2.8. Calculadas : .................. SUM(), AVG(), COUNT(), MAX(), MIN (),            */
/*                                      GROUP BY, AS (ALIAS), HAVING (POR WHERE),        */
/*                   DATE_FORMAT(NOW(),'%Y-%m-%d') AS __ , DATEDIFF(NOW(), __ )          */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* EN CONSOLA: XAMPP / SHELL / cd mysql/bin / mysql -h localhost -u root -p / ENTER      */
/* ************************************************************************************* */


/* ************************************************************************************* */
/* ------------------------------ 1. CONSULTAS DE ACCIÓN ------------------------------- */
/* ---------------------------- INSERT INTO, UPDATE, DELETE ---------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 1.1. Crear o Registrar. ------------------------------------------------------------- --
--      INSERT INTO __ VALUES ( __ , __ ) : -------------------------------------------- -- 
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 1.1.1. Datos Correctos -------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
INSERT INTO ROLES VALUES 
(null, 'admin'),
(null, 'user'),
(null, 'customer'),
(null, 'seller');

INSERT INTO USUARIOS VALUES 
(1, 'admin-1', 'Albeiro', 'Ramos', 'profealbeiro2020@gmail.com'),
(3, 'customer-1', 'Marinita', 'García', 'marinita@gmail.com'),
(4, 'seller-1', 'Jesús', 'Briceño', 'jesus@gmail.com'),
(2, 'person-1', 'Ezequiel', 'Pantoja', 'ezequiel@gmail.com'),
(2, 'person-2', 'Camilo', 'Céspedes', 'camilo@gmail.com'),
(3, 'customer-2', 'Jorge', 'Campos', 'jorge@gmail.com'),
(1, 'admin-2', 'Pepito', 'Perez', 'pepito@gmail.com');

INSERT INTO MENSAJES VALUES
('person-1', '2022-08-15', 'Solicitud de Información', 'Quisiera saber sobre... '),
('seller-1', '2022-08-27', 'Reunión Vendedores', 'El próximo fin de semana...'),
('person-2', '2022-08-27', 'Productos a crédito', 'Qué papeles piden para...'),
('admin-1', '2022-08-31', 'Mantenimiento Sistema', 'Se informa a los usuarios...'),
('customer-1', '2022-09-01', 'No tengo el producto', 'Aun no llega el producto'),
('customer-1', '2022-10-02', 'Devolución Dinero', 'Aun no llega el producto');

INSERT INTO CREDENCIALES VALUES
('admin-1', 123456, "2022-06-11", 'Bogotá', 'Av Siempre Viva', sha1('12345'), 1),
('customer-1', 456789, "2022-07-12", 'Cali', 'Calle 3 con 4', sha1('12345'), 0),
('seller-1', 987654, "2022-08-13", 'Bogotá', 'Carrera 5 con 7', sha1('12345'), 1),
('customer-2', 654321, "2022-08-28", 'Medellín', 'Tv 8 con 15', sha1('12345'), 0);

INSERT INTO CATEGORIAS VALUES 
(null, 'Mercado'),
(null, 'Alimentos'),
(null, 'Bebidas'),
(null, 'Aseo');

INSERT INTO PRODUCTOS VALUES 
(1, 'prod-1', 'Papa', 950.03, 1, 'libra'),
(1, 'prod-2', 'Zanahoria', 630.33, 1, 'libra'),
(1, 'prod-3', 'Tomate', 750.55, 1, 'libra'),
(2, 'prod-4', 'Arroz', 2500.00, 500, 'gramos'),
(2, 'prod-5', 'aceite', 10500.00, 1, 'litro'),
(2, 'prod-6', 'Lentejas', 3500.00, 1000, 'gramos'),
(3, 'prod-7', 'Agua', 3000.00, 1.5, 'litro'),
(3, 'prod-8', 'Gaseosa', 3500.00, 2.5, 'litro'),
(3, 'prod-9', 'Cerveza', 2500.00, 1, 'botella'),
(4, 'prod-10', 'Jabón Baño', 1200.00, 285, 'gramos'),
(4, 'prod-11', 'Jabón Ropa', 12000.00, 1000, 'gramos'),
(4, 'prod-12', 'Shampoo', 18500.00, 750, 'mililitros');

-- ------------------------------------------------------------------------------------- --
-- 1.1.2. Datos Incorrectos ------------------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
INSERT INTO USUARIOS VALUES 
(5, 'customer-3', 'Alejandra', 'Martínez', 'alejandra@gmail.com');

INSERT INTO USUARIOS VALUES 
(3, 'customer-1', 'Wilson', 'Cifuentes', 'wilson@gmail.com');

INSERT INTO USUARIOS VALUES 
(3, 'seller-1', 'Wilson', 'Cifuentes', 'wilson@gmail.com');

INSERT INTO MENSAJES VALUES
('person-3', '2022-08-15', 'Solicitud de Información', 'Quisiera saber sobre... ');

INSERT INTO CREDENCIALES VALUES
('admin-1', 123456, 'Av Siempre Viva', sha1('12345'), 1),
('customer-1', 456789, 'Calle 3 con 4', sha1('12345'), 0),
('seller-1', 987654, 'Carrera 5 con 7', sha1('12345'), 1),
('customer-2', 654321, 'Tv 8 con 15', sha1('12345'), 0);

INSERT INTO CREDENCIALES VALUES 
('admin-1', 666555, 'Av Matamoros', sha1('45678'), 1);

INSERT INTO CREDENCIALES VALUES 
('admin-2', 666555, 'Av Matamoros', sha1('45678'), 1);

INSERT INTO CREDENCIALES VALUES
('admin-2', 123456, 'Carrera 2 con 15', sha1('12345'), 1);

INSERT INTO CREDENCIALES VALUES 
('person-1', 444555, 'Calle 2 con 3', sha1('12345'), 1);

-- ------------------------------------------------------------------------------------- --
-- 1.2. Actualizar. -------------------------------------------------------------------- --
--      UPDATE __ SET __ = __ WHERE __ = __ : ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
UPDATE ROLES SET 
nombre_rol = 'person'
WHERE codigo_rol = 2;

-- ------------------------------------------------------------------------------------- --
-- 1.3. Eliminar. ---------------------------------------------------------------------- --
--      DELETE FROM __ WHERE __ = __ : ------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DELETE FROM USUARIOS 
WHERE codigo_user = 'admin-2';


/* ************************************************************************************* */
/* ----------------------------- 1. CONSULTAS DE SELECCIÓN ----------------------------- */
/* --------------------------------------- SELECT -------------------------------------- */
/* ************************************************************************************* */

-- ------------------------------------------------------------------------------------- --
-- 2.1. Consultas Generales. ----------------------------------------------------------- --
--      SELECT * FROM __ : ------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM USUARIOS;

-- ------------------------------------------------------------------------------------- --
-- 2.2. Consultas Específicas. --------------------------------------------------------- --
--      SELECT __ , __ FROM __ : ------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_user, correo_user, codigo_rol FROM USUARIOS;

-- ------------------------------------------------------------------------------------- --
-- 2.3. Consultas con Criterios. ------------------------------------------------------- --
--      SELECT __ , __ FROM __ WHERE __ = __ : ----------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_rol, codigo_user, correo_user FROM USUARIOS
WHERE codigo_rol = 3;

-- ------------------------------------------------------------------------------------- --
-- 2.4. Consultas con Operadores Lógicos. ---------------------------------------------- --
--      OR, AND, NOT : ----------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.4.1. Consultas con el Operador Lógico OR (O). ------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ OR __ = __ : ---------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_rol, codigo_user, correo_user FROM USUARIOS 
WHERE codigo_rol = 2 OR codigo_rol = 3;

-- ------------------------------------------------------------------------------------- --
-- 2.4.2. Consultas con el Operador Lógico AND (Y). ------------------------------------ --
--        SELECT __ , __ FROM __ WHERE __ = __ AND __ = __ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_cred, ciudad_cred FROM CREDENCIALES 
WHERE ciudad_cred = 'Bogotá' AND estado_cred = 1;

-- ------------------------------------------------------------------------------------- --
-- 2.4.3. Consultas con el Operador Lógico NOT (NO). ----------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ AND __ = __ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_cred, ciudad_cred FROM CREDENCIALES 
WHERE ciudad_cred NOT IN ('Bogotá');

-- ------------------------------------------------------------------------------------- --
-- 2.5. Consultas con Operadores de Comparación. --------------------------------------- --
--      <>, <, <=, >, >=, LIKE, BEETWEEN, IN, ANY, ALL : ------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- ------------------------------------------------------------------------------------- --
-- 2.5.1. Consultas con el Operador de Comparación <> (Diferente). --------------------- --
--        SELECT __ , __ FROM __ WHERE __ <> __ : -------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS WHERE precio_producto <> 3500;

-- ------------------------------------------------------------------------------------- --
-- 2.5.2. Consultas con el Operador de Comparación < (Menor que). ---------------------- --
--        SELECT __ , __ FROM __ WHERE __ < __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS WHERE precio_producto < 3500;

-- ------------------------------------------------------------------------------------- --
-- 2.5.3. Consultas con el Operador de Comparación < (Mayor que). ---------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS WHERE precio_producto > 3500;

-- ------------------------------------------------------------------------------------- --
-- 2.5.4. Consultas con el Operador de Comparación <= (Menor o Igual). ----------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS WHERE precio_producto <= 3500;

-- ------------------------------------------------------------------------------------- --
-- 2.5.5. Consultas con el Operador de Comparación <= (Mayor o Igual). ----------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS WHERE precio_producto >= 3500;

-- ------------------------------------------------------------------------------------- --
-- 2.5.6. Consultas con el Operador de Comparación LIKE. ------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ LIKE '_%' : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM PRODUCTOS WHERE nombre_producto LIKE 'j%';
SELECT * FROM PRODUCTOS WHERE nombre_producto LIKE '_a%';


-- ------------------------------------------------------------------------------------- --
-- 2.5.7. Consultas con el Operador de Comparación BETWEEN. ---------------------------- --
--        SELECT __ , __ FROM __ WHERE __ LIKE '_%' : ---------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM CREDENCIALES 
WHERE fecha_ingreso_cred BETWEEN '2022-08-01' AND '2022-08-31';

SELECT * FROM CREDENCIALES 
WHERE fecha_ingreso_cred >= '2022-08-01' AND fecha <= '2022-08-31';

/* 2.5.8. IN () : .....................                                                  */
/* 2.5.9. ANY () : ....................                                                  */
/* 2.5.10. ALL () : ...................                                                  */



-- -------------------------------------------------------------------------------------
-- CONSULTAS ORDENADAS POR UNO O VARIOS CAMPOS: ORDER BY, ASC, DESC
-- -------------------------------------------------------------------------------------
-- ## - Seleccione todos los campos de la tabla productos donde la sección sea igual a 
--      'CERÁMICA' y 'DEPORTES' y que lo ordene por la sección (Ascendente)
-- -------------------------------------------------------------------------------------
SELECT * FROM productos 
WHERE seccion = 'CERÁMICA' OR seccion = 'DEPORTES' 
ORDER BY seccion ASC;
-- -------------------------------------------------------------------------------------
-- ## - Seleccione todos los campos de la tabla productos donde la sección sea igual a 
--      'CERÁMICA' y 'DEPORTES' y que lo ordene por la sección (Descendente)
-- -------------------------------------------------------------------------------------
SELECT * FROM productos 
WHERE seccion = 'CERÁMICA' OR seccion = 'DEPORTES' 
ORDER BY seccion DESC;
-- -------------------------------------------------------------------------------------
-- ## - Seleccione todos los campos de la tabla productos donde la sección sea igual a 
--      'CERÁMICA' y 'DEPORTES' y que lo ordene por el precio
-- -------------------------------------------------------------------------------------
SELECT * FROM productos 
WHERE seccion = 'CERÁMICA' OR seccion = 'DEPORTES' 
ORDER BY precio;




-- -------------------------------------------------------------------------------------
-- ## - Seleccione todos los campos de la tabla productos donde la sección sea igual a 
--      'CERÁMICA' y 'DEPORTES', después lo ordene por sección y luego por precio
-- -------------------------------------------------------------------------------------
SELECT * FROM productos 
WHERE seccion = 'CERÁMICA'OR seccion = 'DEPORTES' 
ORDER BY seccion, precio;
-- -------------------------------------------------------------------------------------
-- ## - Seleccione todos los campos de la tabla productos donde la sección sea igual a 
--      'CERÁMICA' y 'DEPORTES', después lo ordene por sección y país de origen
-- -------------------------------------------------------------------------------------
SELECT * FROM productos 
WHERE seccion = 'CERÁMICA' OR seccion = 'DEPORTES' 
ORDER BY seccion, pais_origen;








-- -------------------------------------------------------------------------------------
-- CONSULTAS CALCULADAS: SUM(), AVG(), COUNT(), MAX(), MIN (), 
-- GROUP BY, AS (ALIAS), HAVING (POR WHERE), 
-- DATE_FORMAT(NOW(),'%Y-%m-%d') AS alias, DATEDIFF(NOW(),fecha)
-- -------------------------------------------------------------------------------------
-- ## - Seleccione la sección (agrupación) y sume los precios (cálculo) de la tabla 
--      productos y lo agrupe por la sección
-- -------------------------------------------------------------------------------------
SELECT seccion, SUM(precio) FROM productos GROUP BY seccion;
-- -------------------------------------------------------------------------------------
-- ## - Seleccione la sección (agrupación) y sume los precios (cálculo) de la tabla 
--      productos, lo agrupe por la sección y los ordene por precio
-- -------------------------------------------------------------------------------------
SELECT seccion, SUM(precio) AS sum_articulos FROM productos 
GROUP BY seccion ORDER BY sum_articulos;
-- -------------------------------------------------------------------------------------
-- ## - Seleccione la sección (agrupación) y calcule la media de los precios (cálculo) 
--      de la tabla productos, lo agrupe por la sección DEPORTES y CONFECCIÓN y los 
--      ordene por la media de los artículos
-- -------------------------------------------------------------------------------------
SELECT seccion, AVG(precio) AS media_articulos FROM productos 
GROUP BY seccion HAVING seccion = 'DEPORTES' OR seccion = 'CONFECCIÓN' 
ORDER BY media_articulos;
-- -------------------------------------------------------------------------------------
-- ## - Seleccione la población (agrupación) y cuente de los clientes (cálculo) de la 
--      tabla clientes, lo agrupe por la población y los ordene descendentemente por 
--      la cantidad de clientes
-- -------------------------------------------------------------------------------------
SELECT poblacion, COUNT(codigo_cliente) AS num_cliente FROM clientes 
GROUP BY poblacion ORDER BY num_cliente DESC
-- -------------------------------------------------------------------------------------
-- ## - Seleccione la seccion (agrupación) y calcule el precio más alto (cálculo) de 
--      productos, donde la sección sea CONFECCIÓN y los ordene por sección
-- -------------------------------------------------------------------------------------
SELECT seccion, MAX(precio) AS precio_alto FROM productos 
WHERE seccion = 'CONFECCIÓN' GROUP BY seccion
-- -------------------------------------------------------------------------------------
-- ## - Seleccione el articulo, seccion y precio de la tabla productos y cree un campo 
--      calculado del precio más el IVA
-- -------------------------------------------------------------------------------------
SELECT nombre_articulo, seccion, precio, precio*1.19 FROM productos
-- -------------------------------------------------------------------------------------
-- ## - Seleccione el articulo, seccion y precio de la tabla productos y cree un campo 
--      calculado del precio más el IVA, llame el nuevo campo como precio_con_iva
-- -------------------------------------------------------------------------------------
SELECT nombre_articulo, seccion, precio, precio*1.19 AS precio_con_iva 
FROM productos
-- -------------------------------------------------------------------------------------
-- ## - Seleccione el articulo, seccion y precio de la tabla productos y cree un campo 
--      calculado del precio más el IVA, redondee a dos decimales y llame el nuevo 
--      campo como precio_con_iva
-- -------------------------------------------------------------------------------------
SELECT nombre_articulo, seccion, precio, ROUND(precio*1.19,2) AS precio_con_iva 
FROM productos
-- -------------------------------------------------------------------------------------
-- ## - Seleccione el articulo, seccion, precio y fecha de la tabla productos, cree un
--      campo calculado de la diferencia de días entre la fecha almacenada y la fecha 
--      actual, agrupelo por la sección DEPORTES
-- -------------------------------------------------------------------------------------
SELECT nombre_articulo, seccion, precio, fecha, 
DATE_FORMAT(NOW(),'%Y-%m-%d') AS dia_de_hoy, DATEDIFF(NOW(),fecha) AS diferencia_dias 
FROM productos WHERE seccion = 'DEPORTES';