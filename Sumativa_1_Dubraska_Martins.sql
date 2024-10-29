-- CREACION DE TABLA

-- Tabla Clientes
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    fecha_registro DATE,
    email VARCHAR2(100),
    telefono VARCHAR2(20)
);

-- Tabla Productos
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    nombre_producto VARCHAR2(100),
    categoria VARCHAR2(50),
    precio NUMBER(10, 2),
    stock NUMBER
);

-- Tabla Ventas
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    product_id NUMBER,
    cantidad NUMBER,
    fecha_venta DATE,
    total_venta NUMBER(10, 2),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tabla Personal de Ventas
CREATE TABLE sales_staff (
    staff_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    email VARCHAR2(100),
    telefono VARCHAR2(20)
);

-- POBLAR TABLAS

-- Poblar la tabla Clientes
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono) VALUES (1, 'Ana', 'Pérez', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'ana.perez@email.com', '123456789');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono) VALUES (2, 'Carlos', 'Martínez', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'carlos.martinez@email.com', '987654321');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono) VALUES (3, 'Laura', 'Gómez', TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'laura.gomez@email.com', '456789123');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono) VALUES (4, 'Luis', 'Hernández', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'luis.hernandez@email.com', '789123456');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono) VALUES (5, 'María', 'López', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'maria.lopez@email.com', '321654987');

-- Poblar la tabla Productos
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (1, 'Laptop Dell XPS', 'Computadoras', 1200.00, 10);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (2, 'Smartphone Samsung Galaxy', 'Celulares', 800.00, 15);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (3, 'Monitor LG 4K', 'Monitores', 400.00, 8);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (4, 'Teclado Mecánico Logitech', 'Accesorios', 150.00, 20);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (5, 'Tablet Apple iPad', 'Tablets', 600.00, 12);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (6, 'Auriculares', 'Accesorios', 50.00, 20);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (7, 'Altavoces', 'Audio', 150.00, 15);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (8, 'Asus Laptop', 'Computadoras', 1200.00, 8);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (9, 'Apple iPhone', 'Celulares', 999.99, 25);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock) VALUES (10, 'Adaptador USB', 'Accesorios', 15.00, 30);


-- Poblar la tabla Ventas
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta) VALUES (1, 1, 1, 1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 1200.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta) VALUES (2, 2, 2, 1, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 800.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta) VALUES (3, 3, 3, 2, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 800.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta) VALUES (4, 4, 4, 3, TO_DATE('2024-04-18', 'YYYY-MM-DD'), 450.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta) VALUES (5, 5, 5, 1, TO_DATE('2024-05-25', 'YYYY-MM-DD'), 600.00);

-- Poblar la tabla Personal de Ventas
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono) VALUES (1, 'Pedro', 'Ramírez', 'pedro.ramirez@email.com', '789456123');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono) VALUES (2, 'Sara', 'Jiménez', 'sara.jimenez@email.com', '654789321');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono) VALUES (3, 'Raúl', 'Díaz', 'raul.diaz@email.com', '123789456');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono) VALUES (4, 'Lucía', 'Fernández', 'lucia.fernandez@email.com', '321987654');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono) VALUES (5, 'Juan', 'Ortiz', 'juan.ortiz@email.com', '987321654');

---CONSULTA DE BASE
SELECT
    c.nombre || ' ' || c.apellido AS "Nombre Completo",
    c.email AS "Correo Electrónico",
    s.fecha_venta AS "Fecha de Venta",
    p.nombre_producto AS "Producto Vendido",
    s.cantidad AS "Cantidad Vendida",
    s.total_venta AS "Total Venta"
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
ORDER BY s.fecha_venta DESC;


---incremento y filtrar ---

SELECT 
    ROUND(precio+(precio*0.15), 1) AS "Precio Incrementado en 15%", -- Incremento del 15% redondeado a 1 decimal
    precio AS "Precio Original", -- Precio original del producto
    nombre_producto AS "Nombre del Producto", -- Nombre del producto
    stock AS "Stock Actual" -- Stock actual del producto
FROM products
WHERE nombre_producto LIKE '%A%' -- Filtra productos cuyo nombre termina en 'A'
    AND stock > 10 -- Filtra productos con más de 10 unidades en stock
ORDER BY "Precio Incrementado en 15%" ASC; -- Ordena por el precio incrementado de forma ascendente





SELECT 
    nombre || ' ' || apellido AS "Nombre Completo",
    email AS "Correo Electrónico",
    SUBSTR(nombre, 1, 4) || LENGTH(email) || SUBSTR(apellido, -3) AS "Contraseña"
FROM 
    sales_staff
ORDER BY 
    apellido DESC, 
    nombre ASC;



SELECT 
    nombre_producto, 
    precio, 
    stock 
FROM products;

