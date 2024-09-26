-- Cambiar al esquema adecuado
SET search_path TO admin;

-- Insertar roles
INSERT INTO roles (role_name) VALUES ('CLIENT'), ('INVENTORY');

-- Insertar permisos
INSERT INTO permissions (name) VALUES ('CREATE_PRODUCT'), ('UPDATE_PRODUCT'), ('DELETE_PRODUCT');

-- Insertar usuarios
INSERT INTO usuarios (name, username, email, password, nit, is_enabled, sucursal, update)
VALUES 
('Juan Pérez', 'juanp', 'juan@example.com', 'password123', 123456789, true, 'Sucursal A', true),
('Ana López', 'anal', 'ana@example.com', 'password456', 987654321, true, 'Sucursal B', true);

-- Insertar relaciones de usuario y roles
INSERT INTO user_roles (user_id, role_id) VALUES 
(1, 1),  -- Juan Pérez es CLIENT
(2, 1),  -- Ana López es CLIENT
(1, 2);  -- Juan Pérez es INVENTORY

-- Cambiar al esquema de bodega
SET search_path TO bodega;

-- Insertar productos
INSERT INTO productos (cantidad, nombre, precio, sucursal) VALUES 
(100, 'Videojuego A', 59.99, 'Sucursal A'),
(200, 'Videojuego B', 49.99, 'Sucursal B'),
(50, 'Videojuego C', 39.99, 'Sucursal A');

-- Cambiar al esquema de cajero
SET search_path TO cajero;

-- Insertar ventas
INSERT INTO ventas (numero_factura, nit, tot_descuentos, totsin_descuentos, cajero, cliente)
VALUES 
(1, 123456789, 0, 59.99, 1, 1),  -- Venta 1
(2, 987654321, 0, 49.99, 2, 2);  -- Venta 2

-- Insertar detalles de venta
INSERT INTO detalles_venta (venta_id, producto_id, cantidad, precio_unitario) VALUES 
(1, 1, 1, 59.99),  -- Detalle de la venta 1
(2, 2, 1, 49.99);  -- Detalle de la venta 2

-- Insertar facturas
INSERT INTO factura (venta_id, cliente_id, monto_total, sucursal) VALUES 
(1, 1, 59.99, 'Sucursal A'),
(2, 2, 49.99, 'Sucursal B');

-- Cambiar al esquema de inventario
SET search_path TO inventario;

-- Insertar estantería
INSERT INTO estanteria (pasillo, cantidad, producto_id) VALUES 
(1, 10, 1),  -- Estante con 10 unidades del producto A
(2, 5, 2);   -- Estante con 5 unidades del producto B

-- Cambiar al esquema admin
SET search_path TO admin;

-- Insertar categorías de tarjeta
INSERT INTO categorias_tarjeta (tipo_tarjeta, puntos, gasto_minimo) VALUES 
('Común', 0, 0),
('Oro', 1000, 100.00),
('Platino', 2000, 500.00),
('Diamante', 5000, 1000.00);

-- Insertar clientes de tarjeta
INSERT INTO clientes_tarjeta (id_cliente, id_tarjeta, puntos_acumulados, gasto_total) VALUES 
(1, 1, 0, 0.00),  -- Juan Pérez
(2, 2, 0, 0.00);  -- Ana López

-- Insertar historial de compras
INSERT INTO historial_compras (id_cliente, monto_gastado, fecha_compra) VALUES 
(1, 59.99, CURRENT_DATE),  -- Compra de Juan Pérez
(2, 49.99, CURRENT_DATE);  -- Compra de Ana López

