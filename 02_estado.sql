use tallerelectrodomestico;
-- 1. direcciones
insert into Direccion (id_direccion, calle, num_exterior, num_interior, colonia, codigo_postal, entidad_federativa) values
(1, 'Calle 1', '10', null, 'Centro', '01000', 'CDMX'),
(2, 'Av. Juárez', '22', '3A', 'Juárez', '02000', 'CDMX'),
(3, 'Calle Industrial', '100', null, 'Industrial', '03000', 'EdoMex'),
(4, 'Av. Universidad', '450', 'PB', 'Universidad', '04000', 'CDMX'),
(5, 'Calle Roble', '8', null, 'Robles', '05000', 'CDMX'),
(6, 'Av. Insurgentes', '777', '202', 'Nápoles', '06000', 'CDMX'),
(7, 'Calle Sol', '15', null, 'Sol', '07000', 'EdoMex'),
(8, 'Av. Lomas', '333', '502', 'Lomas', '08000', 'CDMX'),
(9, 'Calle Luna', '27', 'A', 'Luna', '09000', 'CDMX'),
(10, 'Av. Central', '101', null, 'Central', '10000', 'EdoMex'),
(11, 'Calle Pino', '44', null, 'Pinos', '11000', 'CDMX'),
(12, 'Av. México', '202', '301', 'Mexicali', '12000', 'CDMX'),
(13, 'Calle Nogal', '60', null, 'Nogales', '13000', 'EdoMex'),
(14, 'Av. Bosques', '999', 'Int C', 'Bosques', '14000', 'CDMX'),
(15, 'Calle Olivo', '77', null, 'Olivares', '15000', 'CDMX'),
(16, 'Av. Principal', '123', null, 'Centro', '01000', 'CDMX'),
(17, 'Calle Industrial', '45', 'B', 'Industrial', '02000', 'CDMX'),
(18, 'Av. Tecnológico', '789', null, 'Tecnológico', '03000', 'EdoMex'),
(19, 'Calle 5 de Mayo', '321', 'Int 1', 'Centro', '04000', 'CDMX'),
(20, 'Av. Reforma', '654', null, 'Reforma', '05000', 'CDMX'),
(21, 'Av. Aragón', '101', null, 'Aragón', '57000', 'EdoMex'),
(22, 'Av. Presidente Masaryk', '250', 'Piso 1', 'Polanco', '11550', 'CDMX'),
(23, 'Calzada del Hueso', '1234', null, 'Tultitlán Centro', '54900', 'EdoMex'),
(24, 'Av. Central', '456', 'Local B', 'San Rafael', '53000', 'EdoMex'),
(25, 'Av. Revolución', '3000', null, 'Villas de Coacalco', '55700', 'EdoMex');

-- 2. roles

insert into Rol (id_rol, nombre_rol, descripcion) values
(1, 'Encargado', 'Es el responsable de la sucursal, supervisa las operaciones'),
(2, 'Técnico', 'Realiza diagnósticos y reparaciones'),
(3, 'Recepción', 'Recibe electrodomésticos y genera las órdenes de servicio');

-- 3. servicios

insert into Servicio (id_servicio, descripcion, tipo_servicio, costo_base, tiempo_estimado_hrs) values
(1, 'Revisión general del equipo', 'REG', 350.00, 1),
(2, 'Cambio de refacción', 'CDR', 250.00, 2),
(3, 'Mantenimiento preventivo', 'MAP', 450.00, 2),
(4, 'Limpieza profunda', 'LMP', 300.00, 1),
(5, 'Instalación de electrodoméstico', 'INS', 500.00, 3),
(6, 'Reparación especializada de tarjeta', 'RES', 800.00, 4),
(7, 'Revisión de sistema de refrigeración', 'REG', 250.00, 3),
(8, 'Cambio de motor principal', 'CDR', 500.00, 6);

-- 4. proveedores

INSERT INTO Proveedor (rfc, razon_social, contacto_principal, paterno_contacto, telefono, correo, id_direccion, tipo_refacciones) VALUES
('RLO850101XY1', 'Refacciones López S.A. de C.V.', 'Carlos', 'López', '5512345678', 'ventascontacto@gmail.com', 16, 'Motores, resistencias'),
('EME900512MK2', 'ElectroPartes México', 'María', 'González', '5577777777', 'contactoahora28@gmail.com', 17, 'Tarjetas, sensores'),
('SSR050820LL3', 'Servirefacciones SA', 'Juan', 'Martínez', '5599977733', 'juangoku777@gmail.com', 18, 'Compresores, ventiladores'),
('MRE151110ZA4', 'Mega Refacciones', 'Laura', 'Ramírez', '5554667800', 'laurita21@gmail.com', 19, 'Filtros, bandas'),
('DTE200315PP5', 'Distribuidora Técnica', 'Roberto', 'Sánchez', '5532908520', 'robertoelpro@gmail.com', 20, 'Termostatos, cables');

-- 5. clientes

insert into Cliente (rfc_curp, nombre, ap_paterno, ap_materno, telefono, correo, id_direccion, tipo_cliente) values
('CUPJ800101HDF', 'Juan', 'Pérez', 'García', '5512345678', 'juan.perez@gmail.com', 1, 'Particular'),
('CAMJ850202MEX', 'María', 'López', 'Hernández', '5523456789', 'maria.lopez@gmail.com', 2, 'Particular'),
('CARG900303HDF', 'Roberto', 'Gómez', 'Díaz', '5534567890', 'roberto.gomez@gmail.com', 3, 'Empresa'),
('CALE880404MEX', 'Laura', 'Fernández', 'Mendoza', '5545678901', 'laura.fernandez@gmail.com', 4, 'Particular'),
('CAMS950505HDF', 'Sofía', 'Martínez', 'Ruiz', '5556789012', 'sofia.martinez@gmail.com', 5, 'Particular'),
('CABJ780606MEX', 'Javier', 'Sánchez', 'Cruz', '5567890123', 'javier.sanchez@gmail.com', 6, 'Institución'),
('CAGD920707HDF', 'Daniel', 'Ramírez', 'Torres', '5578901234', 'daniel.ramirez@gmail.com', 7, 'Particular'),
('CALF880808MEX', 'Fernanda', 'Castro', 'Núñez', '5589012345', 'fernanda.castro@gmail.com', 8, 'Empresa'),
('CALE890909HDF', 'Eduardo', 'Rojas', 'Jiménez', '5590123456', 'eduardo.rojas@gmail.com', 9, 'Particular'),
('CASM901010MEX', 'Mónica', 'Mendoza', 'Vega', '5501234567', 'monica.mendoza@gmail.com', 10, 'Particular'),
('CABA801111HDF', 'Alejandro', 'Herrera', 'Flores', '5512345670', 'alejandro.herrera@gmail.com', 11, 'Particular'),
('CARP751212MEX', 'Patricia', 'Silva', 'Ríos', '5523456780', 'patricia.silva@gmail.com', 12, 'Particular'),
('CAGR961313HDF', 'Gerardo', 'Ortega', 'Molina', '5534567895', 'gerardo.ortega@gmail.com', 13, 'Empresa'),
('CAMS971414MEX', 'Silvia', 'Cervantes', 'Luna', '5545678900', 'silvia.cervantes@gmail.com', 14, 'Particular'),
('CAML981515HDF', 'Luis', 'Medina', 'Paredes', '5556789000', 'luis.medina@gmail.com', 15, 'Particular');

-- 6. sucursales

insert into Sucursal (id_sucursal, nombre, correo, id_direccion, telefono, hora_apertura, hora_cierre, estado_operativo, rfc_responsable) values
(1, 'Talleres Aragón', 'aragontaller999@gmail.com', 21, '5551230001', '09:00:00', '18:00:00', 'Activa', null),
(2, 'Talleres Polanco', 'polancotaller111@gmail.com', 22, '5551230002', '10:00:00', '19:00:00', 'Activa', null),
(3, 'Talleres Tultitlán', 'tultitlantaller222@gmail.com', 23, '5551230003', '09:00:00', '20:00:00', 'Activa', null),
(4, 'Talleres Naucalpan', 'naucalpan@gmail.com', 24, '5551230004', '08:00:00', '17:00:00', 'Activa', null),
(5, 'Talleres Coacalco', 'coacalco@gmail.com', 25, '5551230005', '09:00:00', '18:00:00', 'Activa', null);

-- 7. empleados

insert into Empleado (rfc, nombre, ap_paterno, ap_materno, telefono, correo, especialidad, fecha_contratacion, estado_laboral, id_sucursal, id_rol) values
('PETJ850101HDF', 'Jorge', 'Pérez', 'Torres', '5511110001', 'jorge.perez@gmail.com', 'Línea blanca', '2020-01-10', 'Activo', 1, 1),
('ROMJ860202MEX', 'Mario', 'Romero', 'Juárez', '5511110002', 'mario.romero@gmail.com', 'Refrigeración', '2019-03-15', 'Activo', 1, 2),
('LUCE870303HDF', 'Carlos', 'Luna', 'Cruz', '5511110003', 'carlos.luna@gmail.com', 'Electrónica', '2021-05-20', 'Activo', 1, 2),
('SANC880404MEX', 'Luis', 'Sánchez', 'Mora', '5511110004', 'luis.sanchez@gmail.com', 'Línea blanca', '2020-07-10', 'Activo', 2, 1),
('GOME890505HDF', 'Ana', 'Gómez', 'López', '5511110005', 'ana.gomez@gmail.com', 'Refrigeración', '2021-09-01', 'Activo', 2, 2),
('RODR900606MEX', 'Pedro', 'Rodríguez', 'Ramos', '5511110006', 'pedro.rodriguez@gmail.com', 'Electrónica', '2018-11-15', 'Activo', 3, 1),
('MART910707HDF', 'Sergio', 'Martínez', 'Herrera', '5511110007', 'sergio.martinez@gmail.com', 'Línea blanca', '2022-01-10', 'Activo', 3, 2),
('FERN920808MEX', 'Laura', 'Fernández', 'Vega', '5511110008', 'laura.fernandez@gmail.com', 'Refrigeración', '2019-06-20', 'Activo', 4, 1),
('JIME930909HDF', 'Roberto', 'Jiménez', 'Solís', '5511110009', 'roberto.jimenez@gmail.com', 'Electrónica', '2020-08-25', 'Activo', 4, 2),
('DIAZ941010MEX', 'Carmen', 'Díaz', 'Ríos', '5511110010', 'carmen.diaz@gmail.com', 'Línea blanca', '2021-04-14', 'Activo', 5, 1),
('RECP001101HDF', 'Claudia', 'Recepción', 'García', '5511110011', 'claudia.recepcion@gmail.com', 'Atención al cliente', '2022-08-15', 'Activo', 1, 3),
('RECP002102MEX', 'Ernesto', 'Recepción', 'López', '5511110012', 'ernesto.recepcion@gmail.com', 'Atención al cliente', '2021-07-01', 'Activo', 3, 3);

-- 8. electrodomésticos

insert into Electrodomestico (num_serie, tipo_equipo, marca, modelo, anio_fabricacion, descripcion_fisica, rfc_curp_cliente) values
('SN001', 'Lavadora', 'Whirlpool', 'W100', 2018, 'Color blanco, rayones en la tapa', 'CUPJ800101HDF'),
('SN002', 'Refrigerador', 'LG', 'GR-300', 2020, 'Color gris, golpe en la puerta izquierda', 'CAMJ850202MEX'),
('SN003', 'Microondas', 'Samsung', 'ME-20', 2019, 'Color negro, teclado gastado', 'CARG900303HDF'),
('SN004', 'Lavadora', 'Mabe', 'L600', 2017, 'Color blanca, con manchas de óxido', 'CALE880404MEX'),
('SN005', 'Refrigerador', 'Frigidaire', 'FR-450', 2021, 'Color acero inoxidable, como nuevo', 'CAMS950505HDF'),
('SN006', 'Secadora', 'Whirlpool', 'S200', 2016, 'Color blanca, no calienta', 'CABJ780606MEX'),
('SN007', 'Lavadora', 'Samsung', 'L500', 2022, 'Color gris, tapa con golpe', 'CAGD920707HDF'),
('SN008', 'Refrigerador', 'Mabe', 'REF-100', 2015, 'Color blanco, con ruido extraño', 'CALF880808MEX'),
('SN009', 'Microondas', 'LG', 'MH-25', 2020, 'Color negro, no prende', 'CALE890909HDF'),
('SN010', 'Lavadora', 'Frigidaire', 'LW-300', 2019, 'Color blanca, no desagua', 'CASM901010MEX'),
('SN011', 'Refrigerador', 'Whirlpool', 'W500', 2018, 'Color gris, fuga de gas', 'CABA801111HDF'),
('SN012', 'Secadora', 'Mabe', 'SD-100', 2020, 'Color blanca, no gira', 'CARP751212MEX'),
('SN013', 'Lavadora', 'LG', 'LW-700', 2017, 'Color blanca, no centrifuga', 'CAGR961313HDF'),
('SN014', 'Microondas', 'Samsung', 'ME-35', 2019, 'Color negro, chispas internas', 'CAMS971414MEX'),
('SN015', 'Refrigerador', 'LG', 'GR-500', 2022, 'Color acero inoxidable, sin luz interior', 'CAML981515HDF'),
('SN016', 'Lavadora', 'Mabe', 'L900', 2021, 'Color gris, fuga de agua', 'CUPJ800101HDF');

-- 9. refacciones (existencia → inventario)

insert into Refaccion (clave, nombre, descripcion, marca_compatible, inventario, costo_unitario, precio_venta) values
('RES001', 'Resistencia para lavadora', 'Resistencia 1800W para lavadoras Whirlpool/Mabe', 'Whirlpool, Mabe', 50, 180.00, 320.00),
('MOT002', 'Motor para lavadora', 'Motor 1/2 HP universal', 'Whirlpool, LG, Mabe', 20, 850.00, 1200.00),
('TAR003', 'Tarjeta de control', 'Tarjeta para refrigerador LG', 'LG', 15, 450.00, 750.00),
('SEN004', 'Sensor de temperatura', 'Sensor NTC para refrigerador', 'Frigidaire, LG', 100, 45.00, 120.00),
('COM005', 'Compresor para refrigerador', 'Compresor 1/4 HP', 'Frigidaire, Whirlpool', 10, 1200.00, 1800.00),
('VEN006', 'Ventilador', 'Ventilador para refrigerador', 'LG, Samsung', 30, 120.00, 250.00),
('FIL007', 'Filtro de agua', 'Filtro para refrigerador', 'Whirlpool, Mabe', 40, 150.00, 280.00),
('BAN008', 'Banda para secadora', 'Banda para secadora Whirlpool/Mabe', 'Whirlpool, Mabe', 60, 80.00, 180.00),
('TER009', 'Termostato', 'Termostato para lavadora/secadora', 'Universal', 70, 95.00, 190.00),
('CAB010', 'Cable eléctrico', 'Cable con clavija 1.5m', 'Universal', 200, 25.00, 70.00);

-- 10. proveedor_refaccion

-- 10. proveedor_refaccion (CORREGIDO)
INSERT INTO Proveedor_refaccion (id, clave_refaccion, cantidad, rfc_proveedor) VALUES
(1, 'RES001', 20, 'RLO850101XY1'),
(2, 'MOT002', 10, 'RLO850101XY1'),
(3, 'TAR003', 8, 'EME900512MK2'),
(4, 'SEN004', 30, 'EME900512MK2'),
(5, 'COM005', 5, 'SSR050820LL3'),
(6, 'VEN006', 15, 'SSR050820LL3'),
(7, 'FIL007', 15, 'MRE151110ZA4'),
(8, 'BAN008', 25, 'MRE151110ZA4'),
(9, 'TER009', 20, 'DTE200315PP5'),
(10, 'CAB010', 50, 'DTE200315PP5');

-- 11. órdenes de servicio

insert into Orden_de_Servicio (folio, fecha_recepcion, descripcion_falla, estado, prioridad, rfc_curp_cliente, id_sucursal, num_serie) values
('ORD-001', '2026-01-10', 'No centrifuga, hace ruido extraño', 'DGN', 'Alta', 'CUPJ800101HDF', 1, 'SN001'),
('ORD-002', '2026-01-15', 'No enfría', 'DGN', 'Alta', 'CAMJ850202MEX', 1, 'SN002'),
('ORD-003', '2026-01-18', 'No calienta', 'DGN', 'Media', 'CARG900303HDF', 2, 'SN003'),
('ORD-004', '2026-01-20', 'Fuga de agua', 'DGN', 'Baja', 'CALE880404MEX', 2, 'SN004'),
('ORD-005', '2026-01-22', 'Ruido en compresor', 'DGN', 'Alta', 'CAMS950505HDF', 3, 'SN005'),
('ORD-006', '2026-01-25', 'No gira el tambor', 'DGN', 'Media', 'CABJ780606MEX', 3, 'SN006'),
('ORD-007', '2026-01-28', 'No enciende', 'DGN', 'Alta', 'CAGD920707HDF', 4, 'SN007'),
('ORD-008', '2026-02-01', 'Ruido constante', 'DGN', 'Media', 'CALF880808MEX', 4, 'SN008'),
('ORD-009', '2026-02-05', 'No funciona el display', 'RCB', 'Baja', 'CALE890909HDF', 5, 'SN009'),
('ORD-010', '2026-02-08', 'No desagua', 'DGN', 'Alta', 'CASM901010MEX', 5, 'SN010'),
('ORD-011', '2026-02-10', 'Fuga de gas refrigerante', 'DGN', 'Alta', 'CABA801111HDF', 1, 'SN011'),
('ORD-012', '2026-02-12', 'No gira, banda rota', 'DGN', 'Media', 'CARP751212MEX', 2, 'SN012'),
('ORD-013', '2026-02-15', 'No centrifuga', 'DGN', 'Media', 'CAGR961313HDF', 3, 'SN013'),
('ORD-014', '2026-02-18', 'Chispas al encender', 'RCB', 'Alta', 'CAMS971414MEX', 4, 'SN014'),
('ORD-015', '2026-02-20', 'No enfría correctamente', 'DGN', 'Media', 'CAML981515HDF', 5, 'SN015'),
('ORD-016', '2026-02-22', 'Fuga de agua durante lavado', 'DGN', 'Media', 'CUPJ800101HDF', 1, 'SN016');

-- 12. diagnósticos

insert into Diagnostico (id_diagnostico, fecha, descripcion_problema, causa_probable, recomendacion, costo_estimado, autorizado, folio_orden) values
(1, '2026-01-11', 'Resistencia quemada', 'Sobrecalentamiento', 'Cambiar resistencia', 350.00, true, 'ORD-001'),
(2, '2026-01-16', 'Compresor con baja eficiencia', 'Desgaste normal', 'Cambiar compresor', 1800.00, true, 'ORD-002'),
(3, '2026-01-19', 'Magnetrón dañado', 'Uso excesivo', 'Cambiar magnetrón', 1200.00, false, 'ORD-003'),
(4, '2026-01-21', 'Manguera de desagüe rota', 'Obstrucción y presión', 'Cambiar manguera', 250.00, true, 'ORD-004'),
(5, '2026-01-23', 'Compresor ruidoso', 'Falta de lubricación', 'Revisar y lubricar', 500.00, true, 'ORD-005'),
(6, '2026-01-26', 'Banda rota', 'Desgaste', 'Cambiar banda', 200.00, true, 'ORD-006'),
(7, '2026-01-29', 'Tarjeta de control dañada', 'Sobretensión', 'Reemplazar tarjeta', 750.00, true, 'ORD-007'),
(8, '2026-02-02', 'Ventilador obstruido', 'Acumulación de polvo', 'Limpieza y lubricación', 300.00, true, 'ORD-008'),
(9, '2026-02-06', 'Display sin alimentación', 'Cable suelto', 'Revisar conexiones', 150.00, true, 'ORD-009'),
(10, '2026-02-09', 'Bomba de desagüe dañada', 'Obstrucción', 'Cambiar bomba', 450.00, true, 'ORD-010'),
(11, '2026-02-11', 'Fuga en sistema refrigerante', 'Corrosión en tubería', 'Soldar y recargar gas', 1500.00, true, 'ORD-011'),
(12, '2026-02-13', 'Banda desgastada', 'Uso normal', 'Cambiar banda', 180.00, true, 'ORD-012'),
(13, '2026-02-16', 'Motor de centrifugado débil', 'Escobillas desgastadas', 'Cambiar escobillas', 380.00, true, 'ORD-013'),
(14, '2026-02-19', 'Corto en tarjeta de potencia', 'Humedad', 'Reemplazar tarjeta', 680.00, true, 'ORD-014'),
(15, '2026-02-21', 'Falta de gas refrigerante', 'Microfuga', 'Recargar gas y detectar fuga', 1200.00, true, 'ORD-015'),
(16, '2026-02-23', 'Manguera de entrada rota', 'Presión de agua alta', 'Cambiar manguera', 200.00, true, 'ORD-016');

-- 13. relación orden

insert into Rel_Orden_Servicio (id_servicio, cantidad, folio_orden) values
(1, 1, 'ORD-001'),
(2, 1, 'ORD-001'),
(3, 1, 'ORD-002'),
(4, 1, 'ORD-003'),
(1, 1, 'ORD-004'),
(5, 1, 'ORD-005'),
(2, 1, 'ORD-006'),
(6, 1, 'ORD-007'),
(3, 1, 'ORD-008'),
(1, 1, 'ORD-009'),
(2, 1, 'ORD-010'),
(6, 1, 'ORD-011'),
(2, 1, 'ORD-012'),
(2, 1, 'ORD-013'),
(6, 1, 'ORD-014'),
(5, 1, 'ORD-015'),
(1, 1, 'ORD-016');

-- 14. asignación de técnicos

insert into Asignacion_tecnico (id_asignacion, fecha_asignacion, actividad, estado_participacion, rfc_empleado, folio_orden) values
(1, '2026-01-11', 'Revisión y cambio de resistencia', 'COM', 'ROMJ860202MEX', 'ORD-001'),
(2, '2026-01-16', 'Revisión del sistema de refrigeración', 'EPC', 'LUCE870303HDF', 'ORD-002'),
(3, '2026-01-19', 'Diagnóstico del microondas', 'ASG', 'GOME890505HDF', 'ORD-003'),
(4, '2026-01-21', 'Revisión de fugas', 'COM', 'GOME890505HDF', 'ORD-004'),
(5, '2026-01-23', 'Inspección del compresor', 'EPC', 'MART910707HDF', 'ORD-005'),
(6, '2026-01-26', 'Cambio de banda', 'COM', 'MART910707HDF', 'ORD-006'),
(7, '2026-01-29', 'Reemplazo de tarjeta', 'COM', 'JIME930909HDF', 'ORD-007'),
(8, '2026-02-02', 'Limpieza de ventilador', 'COM', 'JIME930909HDF', 'ORD-008'),
(9, '2026-02-06', 'Revisión de conexiones', 'EPC', 'ROMJ860202MEX', 'ORD-009'),
(10, '2026-02-09', 'Cambio de bomba', 'EPC', 'LUCE870303HDF', 'ORD-010'),
(11, '2026-02-11', 'Reparación de fuga de gas', 'ASG', 'GOME890505HDF', 'ORD-011'),
(12, '2026-02-13', 'Cambio de banda', 'COM', 'MART910707HDF', 'ORD-012'),
(13, '2026-02-16', 'Cambio de escobillas', 'EPC', 'MART910707HDF', 'ORD-013'),
(14, '2026-02-19', 'Reemplazo de tarjeta', 'ASG', 'JIME930909HDF', 'ORD-014'),
(15, '2026-02-21', 'Recarga de gas', 'ASG', 'ROMJ860202MEX', 'ORD-015'),
(16, '2026-02-23', 'Cambio de manguera', 'ASG', 'LUCE870303HDF', 'ORD-016');

-- 15. uso de refacciones

insert into Uso_refaccion (id_uso, cantidad, costo_aplicado, observaciones, folio_orden, clave_refaccion) values
(1, 1, 320.00, 'Resistencia nueva instalada', 'ORD-001', 'RES001'),
(2, 1, 1800.00, 'Compresor nuevo', 'ORD-002', 'COM005'),
(3, 1, 120.00, 'Sensor instalado', 'ORD-003', 'SEN004'),
(4, 1, 70.00, 'Cable nuevo', 'ORD-004', 'CAB010'),
(5, 1, 1200.00, 'Motor de reemplazo', 'ORD-005', 'MOT002'),
(6, 1, 180.00, 'Banda nueva', 'ORD-006', 'BAN008'),
(7, 1, 750.00, 'Tarjeta de control nueva', 'ORD-007', 'TAR003'),
(8, 1, 250.00, 'Ventilador nuevo', 'ORD-008', 'VEN006'),
(9, 2, 140.00, 'Dos cables eléctricos', 'ORD-009', 'CAB010'),
(10, 1, 450.00, 'Tarjeta de potencia', 'ORD-010', 'TAR003'),
(11, 1, 1200.00, 'Compresor nuevo', 'ORD-011', 'COM005'),
(12, 1, 180.00, 'Banda para secadora', 'ORD-012', 'BAN008'),
(13, 2, 380.00, 'Dos resistencias', 'ORD-013', 'RES001'),
(14, 1, 750.00, 'Tarjeta nueva', 'ORD-014', 'TAR003'),
(15, 1, 280.00, 'Filtro de agua', 'ORD-015', 'FIL007'),
(16, 1, 70.00, 'Cable para conexión', 'ORD-016', 'CAB010');

-- 16. pagos

insert into Pago (folio_pago, fecha, monto, metodo_pago, estado_pago, folio_orden) values
('PAG-001', '2026-01-15', 670.00, 'EFC', 'Completado', 'ORD-001'),
('PAG-002', '2026-01-20', 1800.00, 'DEB', 'Completado', 'ORD-002'),
('PAG-003', '2026-01-25', 450.00, 'CRD', 'Pendiente', 'ORD-003'),
('PAG-004', '2026-01-28', 320.00, 'EFC', 'Completado', 'ORD-004'),
('PAG-005', '2026-01-30', 1700.00, 'TRN', 'Completado', 'ORD-005'),
('PAG-006', '2026-02-01', 380.00, 'EFC', 'Completado', 'ORD-006'),
('PAG-007', '2026-02-05', 800.00, 'DEB', 'Completado', 'ORD-007'),
('PAG-008', '2026-02-08', 550.00, 'CRD', 'Pendiente', 'ORD-008'),
('PAG-009', '2026-02-10', 300.00, 'EFC', 'Completado', 'ORD-009'),
('PAG-010', '2026-02-12', 900.00, 'TRN', 'Completado', 'ORD-010'),
('PAG-011', '2026-02-15', 1500.00, 'DEB', 'Pendiente', 'ORD-011'),
('PAG-012', '2026-02-17', 380.00, 'EFC', 'Completado', 'ORD-012'),
('PAG-013', '2026-02-20', 760.00, 'CRD', 'Completado', 'ORD-013'),
('PAG-014', '2026-02-22', 1430.00, 'EFC', 'Completado', 'ORD-014'),
('PAG-015', '2026-02-25', 1480.00, 'TRN', 'Pendiente', 'ORD-015'),
('PAG-016', '2026-02-27', 270.00, 'EFC', 'Completado', 'ORD-016');

-- 17. garantías

insert into Garantia (id_garantia, fecha_inicio, fecha_vencimiento, condiciones, estado, folio_orden) values
(1, '2026-01-25', '2026-07-25', 'Garantía de 6 meses en resistencia y mano de obra', 'VIG', 'ORD-001'),
(2, '2026-02-05', '2027-02-05', 'Garantía de 1 año en compresor nuevo', 'VIG', 'ORD-002'),
(3, '2026-02-10', '2026-08-10', 'Garantía de 6 meses en motor instalado', 'VIG', 'ORD-005'),
(4, '2026-02-01', '2026-08-01', 'Garantía de 6 meses en banda', 'VIG', 'ORD-006'),
(5, '2026-02-05', '2026-08-05', 'Garantía de 6 meses en tarjeta de control', 'VIG', 'ORD-007'),
(6, '2026-02-20', '2026-08-20', 'Garantía de 6 meses en compresor y gas', 'VIG', 'ORD-011'),
(7, '2026-02-17', '2026-05-17', 'Garantía de 3 meses en banda', 'VIG', 'ORD-012'),
(8, '2026-02-22', '2026-08-22', 'Garantía de 6 meses en tarjeta', 'VIG', 'ORD-014');

-- 18. bitácora

insert into Bitacora (fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado) values
('2026-01-10 10:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Whirlpool, folio ORD-001', 'ORD-001', null),
('2026-01-11 09:30:00', 'INSERT', 'Diagnostico', 'Diagnóstico completado para ORD-001', 'ORD-001', null),
('2026-01-15 14:00:00', 'UPDATE', 'Orden_de_Servicio', 'Estado cambiado a REP para ORD-001', 'ORD-001', null),
('2026-01-25 16:00:00', 'UPDATE', 'Orden_de_Servicio', 'Estado cambiado a ENT, equipo entregado', 'ORD-001', null),
('2026-01-15 11:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador LG, folio ORD-002', 'ORD-002', null),
('2026-01-20 13:00:00', 'INSERT', 'Pago', 'Pago PAG-002 registrado por $1,800', 'ORD-002', null),
('2026-01-18 09:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de microondas Samsung, folio ORD-003', 'ORD-003', null),
('2026-01-19 10:00:00', 'INSERT', 'Diagnostico', 'Diagnóstico: magnetrón dañado, cliente no autorizó', 'ORD-003', null),
('2026-01-20 09:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Mabe con fuga, ORD-004', 'ORD-004', null),
('2026-01-22 10:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador Frigidaire, ORD-005', 'ORD-005', null),
('2026-01-30 17:00:00', 'UPDATE', 'Pago', 'Pago PAG-005 registrado por $1,700', 'ORD-005', null),
('2026-01-25 11:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de secadora Whirlpool, ORD-006', 'ORD-006', null),
('2026-01-28 09:30:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Samsung, ORD-007', 'ORD-007', null),
('2026-02-01 10:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador Mabe, ORD-008', 'ORD-008', null),
('2026-02-05 10:30:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de microondas LG, ORD-009', 'ORD-009', null),
('2026-02-08 11:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Frigidaire, ORD-010', 'ORD-010', null),
('2026-02-10 09:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador Whirlpool, ORD-011', 'ORD-011', null),
('2026-02-12 10:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de secadora Mabe, ORD-012', 'ORD-012', null),
('2026-02-15 09:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora LG, ORD-013', 'ORD-013', null),
('2026-02-18 10:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de microondas Samsung, ORD-014', 'ORD-014', null),
('2026-02-20 09:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador LG, ORD-015', 'ORD-015', null),
('2026-02-22 10:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Mabe, ORD-016', 'ORD-016', null),
('2026-02-22 15:00:00', 'UPDATE', 'Orden_de_Servicio', 'Estado cambiado a REP para ORD-016', 'ORD-016', null);


--  DATOS VARIADOS PARA TALLER ELECTRODOMÉSTICO
-- DIRECCIONES ADICIONALES (IDs 26-35)
INSERT INTO Direccion (id_direccion, calle, num_exterior, num_interior, colonia, codigo_postal, entidad_federativa) VALUES
(26, 'Calle Gardenia',   '88',  null,    'Jardines del Sur',    '16050', 'CDMX'),
(27, 'Av. Peñuelas',     '310', 'PB-A',  'Peñuelas',            '76148', 'Querétaro'),
(28, 'Blvd. Tlalpan',    '55',  '7',     'Pedregal de Carrasco', '04700', 'CDMX'),
(29, 'Calle Ciprés',     '12',  null,    'Los Cipreses',        '54830', 'EdoMex'),
(30, 'Av. Las Torres',   '421', '3B',    'Torres de Satélite',  '53100', 'EdoMex'),
(31, 'Calle Magnolia',   '7',   null,    'Jardines',            '09230', 'CDMX'),
(32, 'Av. Periférico',   '900', 'Local3','San Pedro Mártir',    '14650', 'CDMX'),
(33, 'Calle Sauce',      '66',  'Int 2', 'Los Sauces',          '55340', 'EdoMex'),
(34, 'Av. Hidalgo',      '200', null,    'Centro Histórico',    '06300', 'CDMX'),
(35, 'Paseo del Moral',  '140', 'Desp 5','Jardines del Moral',  '37160', 'Guanajuato');


-- CLIENTES ADICIONALES (6 nuevos: mix de tipos y RFC/CURP)

INSERT INTO Cliente (rfc_curp, nombre, ap_paterno, ap_materno, telefono, correo, id_direccion, tipo_cliente) VALUES
-- RFCs de empresa (13 chars)
('MEGR780312FJ7', 'Miguel',    'Espinoza', 'Gutiérrez', '5561110001', 'miguel.espinoza@empresa.com',   26, 'Empresa'),
('NOLB900615KA2', 'Beatriz',   'Nolasco',  'Barrera',   '5561110002', 'beatriz.nolasco@gmail.com',     27, 'Particular'),
-- CURPs (18 chars)
('VARE850720HDFLNL05',  'Ernesto',   'Vargas',    'Reyes',     '5561110003', 'ernesto.vargas@gmail.com',      28, 'Particular'),
('GOCM920314MDFNRR04',  'Marisol',   'Goche',     'Cruz',      '5561110004', 'marisol.goche@hotmail.com',     29, 'Institución'),
-- RFCs empresa/institución
('HOLS011101NN8', 'Servicios',  'Holcim',   'México',    '5561110005', 'servicios.holcim@corp.com',     30, 'Institución'),
('PATV830921KQ3', 'Valentina',  'Pacheco',  'Torres',    '5561110006', 'valentina.pacheco@gmail.com',   31, 'Particular');


-- EMPLEADOS ADICIONALES 
-- Sucursal 2: Polanco (id=2), Sucursal 5: Coacalco (id=5)

INSERT INTO Empleado (rfc, nombre, ap_paterno, ap_materno, telefono, correo, especialidad, fecha_contratacion, estado_laboral, id_sucursal, id_rol) VALUES
('ESPV910322HDF', 'Víctor',    'Espinoza', 'Ponce',   '5522220001', 'victor.espinoza@taller.com',  'Electrónica',   '2023-02-01', 'Activo',    2, 2),
('CRMN880714MEX', 'Natalia',   'Cruz',     'Montes',  '5522220002', 'natalia.cruz@taller.com',     'Línea blanca',  '2022-11-15', 'Activo',    5, 2),
('LOPF970504HDF', 'Felipe',    'López',    'Fuentes', '5522220003', 'felipe.lopez@taller.com',     'Refrigeración', '2024-01-10', 'Activo',    3, 2),
('RIVA850830MEX', 'Sandra',    'Rivas',    'Aguirre', '5522220004', 'sandra.rivas@taller.com',     'Atención al cliente','2023-06-20','Activo', 5, 3),
-- Empleado Inactivo (para verificar que bi_asignacion_tecnico lo bloquea — NO lo asignamos)
('BARM760215HDF', 'Marcos',    'Barrera',  'Montes',  '5522220005', 'marcos.barrera@taller.com',   'Línea blanca',  '2018-04-01', 'Inactivo',  4, 2);

-- ELECTRODOMÉSTICOS ADICIONALES (variedad de equipos y marcas)
INSERT INTO Electrodomestico (num_serie, tipo_equipo, marca, modelo, anio_fabricacion, descripcion_fisica, rfc_curp_cliente) VALUES
('SN017', 'Lavavajillas',   'Bosch',      'SMS25A',   2021, 'Color acero, sin rayones',                'MEGR780312FJ7'),
('SN018', 'Lavadora',       'Whirlpool',  'W200',     2019, 'Color blanco, tapa agrietada',            'NOLB900615KA2'),
('SN019', 'Refrigerador',   'Samsung',    'RT38K',    2022, 'Color negro, puerta superior dañada',     'VARE850720HDFLNL05'),
('SN020', 'Microondas',     'Panasonic',  'NN-E28',   2018, 'Color blanco, display apagado',           'GOCM920314MDFNRR04'),
('SN021', 'Secadora',       'LG',         'DLE3500',  2020, 'Color gris, sin ruido notable',           'HOLS011101NN8'),
('SN022', 'Lavadora',       'Mabe',       'LMA4160',  2023, 'Color blanco, detergente atascado',       'PATV830921KQ3'),
('SN023', 'Refrigerador',   'Whirlpool',  'WRM56K',   2017, 'Color blanco, congelador no enfría',      'MEGR780312FJ7'),
('SN024', 'Horno de Gas',   'Mabe',       'EM7610',   2016, 'Color negro, quemador central no pende',  'NOLB900615KA2'),
('SN025', 'Lavavajillas',   'LG',         'D1452MF',  2022, 'Color acero, bisagra floja',              'VARE850720HDFLNL05'),
('SN026', 'Lavadora',       'Samsung',    'WF18T',    2024, 'Color blanco, nueva, error E4',           'GOCM920314MDFNRR04'),
('SN027', 'Refrigerador',   'Frigidaire', 'FFHN2750', 2020, 'Color acero, dispensador sin agua',       'CALE880404MEX'),
('SN028', 'Secadora',       'Whirlpool',  'WED5000',  2019, 'Color blanco, hace ruido al girar',       'CUPJ800101HDF');

-- ÓRDENES DE SERVICIO ADICIONALES
-- Variedad de estados: RCB, DGN, REP, LST, ENT, CAN
INSERT INTO Orden_de_Servicio (folio, fecha_recepcion, descripcion_falla, estado, prioridad, rfc_curp_cliente, id_sucursal, num_serie) VALUES
-- Estado RCB (Recibidas, sin diagnóstico aún)
('ORD-017', '2026-03-05', 'No drena el agua al terminar el ciclo',             'RCB', 'Alta',  'MEGR780312FJ7',      1, 'SN017'),
('ORD-018', '2026-03-07', 'Vibra excesivamente durante el centrifugado',       'RCB', 'Media', 'NOLB900615KA2',      2, 'SN018'),
-- Estado DGN (En diagnóstico)
('ORD-019', '2026-03-10', 'No enciende el panel de control',                   'DGN', 'Alta',  'VARE850720HDFLNL05', 3, 'SN019'),
('ORD-020', '2026-03-12', 'Chispas al abrir la puerta',                        'DGN', 'Alta',  'GOCM920314MDFNRR04', 4, 'SN020'),
('ORD-021', '2026-03-14', 'Tambor no gira aunque arranca',                     'DGN', 'Media', 'HOLS011101NN8',      5, 'SN021'),
-- Estado REP (En reparación — diagnóstico autorizado)
('ORD-022', '2026-03-01', 'Fuga de agua por la manguera trasera',              'REP', 'Media', 'PATV830921KQ3',      1, 'SN022'),
('ORD-023', '2026-03-03', 'No congela, ventilador parado',                     'REP', 'Alta',  'MEGR780312FJ7',      2, 'SN023'),
('ORD-024', '2026-02-28', 'Quemador central sin flama',                        'REP', 'Baja',  'NOLB900615KA2',      3, 'SN024'),
-- Estado LST (Listo para entrega)
('ORD-025', '2026-02-20', 'Bisagra de puerta rota',                            'LST', 'Baja',  'VARE850720HDFLNL05', 4, 'SN025'),
('ORD-026', '2026-02-25', 'Error E4 persistente en pantalla',                  'LST', 'Alta',  'GOCM920314MDFNRR04', 5, 'SN026'),
-- Estado ENT (Entregados al cliente)
('ORD-027', '2026-02-10', 'Dispensador de agua sin flujo',                     'ENT', 'Media', 'CALE880404MEX',      1, 'SN027'),
('ORD-028', '2026-02-14', 'Ruido metálico al centrifugar',                     'ENT', 'Alta',  'CUPJ800101HDF',      2, 'SN028'),
-- Estado CAN (Canceladas — presupuesto no autorizado o sin contacto)
('ORD-029', '2026-03-01', 'No calienta, cliente canceló por presupuesto alto', 'CAN', 'Baja',  'PATV830921KQ3',      3, 'SN021'),
('ORD-030', '2026-03-08', 'Pantalla rota, cliente sin respuesta',              'CAN', 'Media', 'HOLS011101NN8',      4, 'SN020');

-- DIAGNÓSTICOS
-- Regla clave: 
--   - Si autorizado=TRUE y estado de orden es DGN → el trigger 
--     au_diagnostico_autorizado cambia la orden a REP automáticamente.
--   - Para ORD-022/023/024 (ya en REP) el diagnóstico fue 
--     autorizado antes; se inserta con autorizado=TRUE y la orden
--     ya está en REP (el trigger no dispara en INSERT, sino en UPDATE).
--   - Para ORD-019/020/021 (DGN) usamos autorizado=FALSE para que 
--     permanezcan en DGN. Si quisieras que pasen a REP, cámbialo a TRUE.
--   - ORD-025/026 (LST): diagnóstico autorizado, ya reparadas.
--   - ORD-027/028 (ENT): diagnóstico autorizado, entregadas.
--   - ORD-029/030 (CAN): diagnóstico no autorizado (canceladas).

INSERT INTO Diagnostico (id_diagnostico, fecha, descripcion_problema, causa_probable, recomendacion, costo_estimado, autorizado, folio_orden) VALUES
-- DGN - no autorizados aún
(17, '2026-03-11', 'Bomba de drenaje bloqueada con residuos',    'Acumulación de sarro',          'Desbloquear y limpiar bomba',              400.00,  FALSE, 'ORD-019'),
(18, '2026-03-13', 'Magnetrón con arco eléctrico',               'Humedad interna',               'Reemplazar magnetrón y guía de ondas',     950.00,  FALSE, 'ORD-020'),
(19, '2026-03-15', 'Correa de transmisión partida',              'Desgaste por uso',              'Cambiar correa y revisar poleas',          220.00,  FALSE, 'ORD-021'),
-- REP - autorizados (orden ya en REP, INSERT no dispara trigger de cambio)
(20, '2026-03-02', 'Manguera de entrada perforada',              'Presión de agua excesiva',      'Cambiar manguera y regulador de presión',  310.00,  TRUE,  'ORD-022'),
(21, '2026-03-04', 'Ventilador del evaporador bloqueado',        'Hielo acumulado',               'Descongelar, limpiar y revisar termostato',780.00,  TRUE,  'ORD-023'),
(22, '2026-03-01', 'Electroválvula del quemador defectuosa',     'Desgaste del sello interno',    'Reemplazar electroválvula',                520.00,  TRUE,  'ORD-024'),
-- LST - autorizados y reparados
(23, '2026-02-21', 'Bisagra de puerta partida por sobrecarga',   'Uso incorrecto',                'Cambiar bisagra y ajuste de puerta',       280.00,  TRUE,  'ORD-025'),
(24, '2026-02-26', 'Sensor de nivel de agua descalibrado',       'Golpe externo',                 'Reemplazar sensor de nivel',               340.00,  TRUE,  'ORD-026'),
-- ENT - autorizados, equipo entregado
(25, '2026-02-11', 'Filtro de dispensador obstruido con cal',    'Agua con alta dureza',          'Limpiar y cambiar filtro, instalar suavizador',350.00,TRUE,'ORD-027'),
(26, '2026-02-15', 'Rodamiento de tambor desgastado',            'Ciclos de uso intenso',         'Cambiar rodamiento y correa',              620.00,  TRUE,  'ORD-028'),
-- CAN - no autorizados, canceladas
(27, '2026-03-02', 'Resistencia calefactora quemada',            'Sobrecalentamiento reiterado',  'Cambiar resistencia y termostato',         680.00,  FALSE, 'ORD-029'),
(28, '2026-03-09', 'Pantalla LCD fracturada internamente',       'Golpe en traslado',             'Reemplazar módulo de pantalla completo',  1100.00,  FALSE, 'ORD-030');

-- ASIGNACIONES DE TÉCNICOS
-- Reglas:
--   - Solo empleados con estado_laboral='Activo'
--   - Órdenes ENT (027,028): asignaciones en COM (trigger au_orden_entregada)
--   - Órdenes CAN (029,030): asignaciones en CAN (trigger au_orden_cancelada)
--   - Órdenes LST (025,026): asignaciones COM (trabajo terminado)
--   - Órdenes REP (022,023,024): asignaciones EPC (en proceso)
--   - Órdenes DGN (019,020,021): asignaciones ASG o EPC
--   - Órdenes RCB (017,018): sin asignación o ASG reciente
-- Técnicos activos disponibles:
--   Sucursal 1: ROMJ860202MEX, LUCE870303HDF
--   Sucursal 2: GOME890505HDF, ESPV910322HDF
--   Sucursal 3: MART910707HDF, LOPF970504HDF
--   Sucursal 4: JIME930909HDF
--   Sucursal 5: DIAZ941010MEX, CRMN880714MEX
INSERT INTO Asignacion_tecnico (id_asignacion, fecha_asignacion, actividad, estado_participacion, rfc_empleado, folio_orden) VALUES
-- RCB: solo asignación inicial
(17, '2026-03-05', 'Recepción y revisión preliminar del lavavajillas',     'ASG', 'ROMJ860202MEX', 'ORD-017'),
(18, '2026-03-07', 'Recepción e inspección de vibración',                  'ASG', 'ESPV910322HDF', 'ORD-018'),
-- DGN: en proceso de diagnóstico
(19, '2026-03-10', 'Diagnóstico del panel de control del refrigerador',    'EPC', 'LOPF970504HDF', 'ORD-019'),
(20, '2026-03-12', 'Diagnóstico de arco eléctrico en microondas',          'EPC', 'JIME930909HDF', 'ORD-020'),
(21, '2026-03-14', 'Diagnóstico de transmisión en secadora',               'EPC', 'CRMN880714MEX', 'ORD-021'),
-- REP: en ejecución
(22, '2026-03-02', 'Sustitución de manguera y regulador de presión',       'EPC', 'LUCE870303HDF', 'ORD-022'),
(23, '2026-03-04', 'Descongelamiento y reparación del ventilador',         'EPC', 'GOME890505HDF', 'ORD-023'),
(24, '2026-03-01', 'Cambio de electroválvula del quemador',                'EPC', 'MART910707HDF', 'ORD-024'),
-- LST: trabajo completado, esperando al cliente
(25, '2026-02-21', 'Cambio de bisagra de puerta del lavavajillas',         'COM', 'JIME930909HDF', 'ORD-025'),
(26, '2026-02-26', 'Reemplazo del sensor de nivel de agua',                'COM', 'DIAZ941010MEX', 'ORD-026'),
-- ENT: entregados (COM por trigger au_orden_entregada)
(27, '2026-02-11', 'Limpieza y cambio de filtro del dispensador',          'COM', 'ROMJ860202MEX', 'ORD-027'),
(28, '2026-02-15', 'Cambio de rodamiento y correa del tambor',             'COM', 'ESPV910322HDF', 'ORD-028'),
-- CAN: canceladas (CAN por trigger au_orden_cancelada)
(29, '2026-03-01', 'Diagnóstico inicial — orden cancelada',                'CAN', 'LOPF970504HDF', 'ORD-029'),
(30, '2026-03-08', 'Diagnóstico inicial — orden cancelada',                'CAN', 'CRMN880714MEX', 'ORD-030');

-- RELACIÓN ORDEN-SERVICIO (servicios aplicados por orden)
INSERT INTO Rel_Orden_Servicio (id_servicio, cantidad, folio_orden) VALUES
(1, 1, 'ORD-017'), -- Revisión general
(3, 1, 'ORD-018'), -- Mantenimiento preventivo
(1, 1, 'ORD-019'), -- Revisión general
(4, 1, 'ORD-019'), -- Limpieza profunda
(6, 1, 'ORD-020'), -- Reparación especializada
(2, 1, 'ORD-021'), -- Cambio de refacción
(2, 1, 'ORD-022'), -- Cambio de refacción
(7, 1, 'ORD-023'), -- Revisión sistema refrigeración
(1, 1, 'ORD-023'),
(1, 1, 'ORD-024'),
(4, 1, 'ORD-025'), -- Limpieza profunda
(2, 1, 'ORD-025'),
(2, 1, 'ORD-026'), -- Cambio de refacción
(4, 1, 'ORD-027'), -- Limpieza profunda
(2, 1, 'ORD-027'),
(8, 1, 'ORD-028'), -- Cambio de motor principal
(1, 1, 'ORD-029'), -- Revisión general (cancelada)
(6, 1, 'ORD-030'); -- Reparación especializada (cancelada)

-- USO DE REFACCIONES
-- Inventario disponible tras estado_taller.sql:
--   RES001=47, MOT002=19, TAR003=12, SEN004=99, COM005=8,
--   VEN006=29, FIL007=39, BAN008=58, TER009=70, CAB010=196
-- Solo órdenes REP, LST, ENT usan refacciones.
-- CAN y RCB/DGN no consumen inventario.
INSERT INTO Uso_refaccion (id_uso, cantidad, costo_aplicado, observaciones, folio_orden, clave_refaccion) VALUES
-- ORD-022 (REP): manguera → usamos cable como sustituto de manguera no en catálogo
(17, 1,   70.00, 'Cable de conexión para bypass provisional',        'ORD-022', 'CAB010'),
-- ORD-022: sensor de temperatura para verificar presión
(18, 1,  120.00, 'Sensor instalado en entrada de agua',              'ORD-022', 'SEN004'),
-- ORD-023 (REP): ventilador de evaporador + termostato
(19, 1,  250.00, 'Ventilador nuevo instalado en evaporador',         'ORD-023', 'VEN006'),
(20, 1,  190.00, 'Termostato de descongelamiento reemplazado',       'ORD-023', 'TER009'),
-- ORD-024 (REP): cable eléctrico para electroválvula
(21, 2,  140.00, 'Cables para reconexión de electroválvula',         'ORD-024', 'CAB010'),
-- ORD-025 (LST): sin refacción de catálogo (bisagra no está en inventario)
-- ORD-026 (LST): sensor de temperatura para sensor de nivel
(22, 1,  120.00, 'Sensor de nivel reemplazado con SEN004 compatible','ORD-026', 'SEN004'),
-- ORD-027 (ENT): filtro de agua
(23, 1,  280.00, 'Filtro de agua instalado, flujo restaurado',       'ORD-027', 'FIL007'),
-- ORD-028 (ENT): banda + resistencia para rodamiento
(24, 1,  180.00, 'Banda de transmisión nueva',                       'ORD-028', 'BAN008'),
(25, 1,  320.00, 'Resistencia de calefacción de apoyo sustituida',   'ORD-028', 'RES001');

-- PAGOS
-- Regla bi_pago: no pagar órdenes en estado CAN
-- Pagamos REP, LST, ENT (y DGN que ya tienen depósito)
-- ORD-029/030 (CAN) → sin pago
INSERT INTO Pago (folio_pago, fecha, monto, metodo_pago, estado_pago, folio_orden) VALUES
-- Anticipos en órdenes en progreso
('PAG-017', '2026-03-05', 200.00, 'EFC', 'Completado', 'ORD-017'), -- anticipo recepción
('PAG-018', '2026-03-07', 150.00, 'TRN', 'Completado', 'ORD-018'), -- anticipo
-- Pagos parciales (DGN aún en diagnóstico — anticipo diagnóstico)
('PAG-019', '2026-03-11', 400.00, 'DEB', 'Pendiente',  'ORD-019'),
('PAG-020', '2026-03-13', 950.00, 'CRD', 'Pendiente',  'ORD-020'),
('PAG-021', '2026-03-15', 220.00, 'EFC', 'Pendiente',  'ORD-021'),
-- Pagos en reparación (anticipos)
('PAG-022', '2026-03-03', 310.00, 'TRN', 'Completado', 'ORD-022'),
('PAG-023', '2026-03-05', 780.00, 'DEB', 'Pendiente',  'ORD-023'),
('PAG-024', '2026-03-02', 520.00, 'EFC', 'Completado', 'ORD-024'),
-- Pagos listos para entrega (completos)
('PAG-025', '2026-02-24', 280.00, 'CRD', 'Completado', 'ORD-025'),
('PAG-026', '2026-02-28', 340.00, 'TRN', 'Completado', 'ORD-026'),
-- Pagos de equipos ya entregados (completos)
('PAG-027', '2026-02-18', 350.00, 'EFC', 'Completado', 'ORD-027'),
('PAG-028', '2026-02-20', 620.00, 'DEB', 'Completado', 'ORD-028');

-- GARANTÍAS
-- Solo para órdenes ENT y LST con reparaciones completadas
INSERT INTO Garantia (id_garantia, fecha_inicio, fecha_vencimiento, condiciones, estado, folio_orden) VALUES
(9,  '2026-02-18', '2026-08-18', 'Garantía 6 meses en filtro y limpieza de dispensador',        'VIG', 'ORD-027'),
(10, '2026-02-20', '2027-02-20', 'Garantía 1 año en rodamiento y banda del tambor',             'VIG', 'ORD-028'),
(11, '2026-02-24', '2026-08-24', 'Garantía 6 meses en bisagra y ajuste de puerta',              'VIG', 'ORD-025'),
(12, '2026-02-28', '2026-11-28', 'Garantía 9 meses en sensor de nivel',                         'VIG', 'ORD-026');

-- BITÁCORA MANUAL (eventos adicionales de contexto)
-- Los triggers au_orden_servicio, ai_pago, ai_diagnostico 
-- generan sus propias entradas; aquí solo registros de recepción
-- y eventos administrativos que los triggers no cubren.
INSERT INTO Bitacora (fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado) VALUES
('2026-03-05 08:45:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavavajillas Bosch — ORD-017',              'ORD-017', 'RECP001101HDF'),
('2026-03-07 09:10:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Whirlpool — ORD-018',              'ORD-018', 'RECP001101HDF'),
('2026-03-10 09:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador Samsung — ORD-019',            'ORD-019', 'RECP002102MEX'),
('2026-03-12 10:15:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de microondas Panasonic — ORD-020',            'ORD-020', 'RECP002102MEX'),
('2026-03-14 08:30:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de secadora LG — ORD-021',                     'ORD-021', NULL),
('2026-03-01 11:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Mabe — ORD-022',                   'ORD-022', 'RECP001101HDF'),
('2026-03-03 09:30:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador Whirlpool — ORD-023',          'ORD-023', 'RECP001101HDF'),
('2026-02-28 10:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de horno de gas Mabe — ORD-024',               'ORD-024', 'RECP002102MEX'),
('2026-02-20 09:45:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavavajillas LG — ORD-025',                 'ORD-025', NULL),
('2026-02-25 10:30:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de lavadora Samsung — ORD-026',                'ORD-026', NULL),
('2026-02-10 08:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de refrigerador Frigidaire — ORD-027',         'ORD-027', 'RECP001101HDF'),
('2026-02-14 09:15:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de secadora Whirlpool — ORD-028',              'ORD-028', 'RECP001101HDF'),
('2026-03-01 14:00:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de secadora LG — ORD-029 (cancelada luego)',   'ORD-029', 'RECP002102MEX'),
('2026-03-08 11:45:00', 'INSERT', 'Orden_de_Servicio', 'Recepción de microondas Panasonic — ORD-030 (cancelada)','ORD-030', 'RECP002102MEX'),
('2026-02-18 16:00:00', 'UPDATE', 'Orden_de_Servicio', 'Estado cambiado a ENT — equipo entregado ORD-027',       'ORD-027', 'RECP001101HDF'),
('2026-02-20 15:30:00', 'UPDATE', 'Orden_de_Servicio', 'Estado cambiado a ENT — equipo entregado ORD-028',       'ORD-028', 'RECP001101HDF'),
('2026-03-03 13:00:00', 'UPDATE', 'Orden_de_Servicio', 'Estado cancelado por cliente — ORD-029',                 'ORD-029', NULL),
('2026-03-10 10:00:00', 'UPDATE', 'Orden_de_Servicio', 'Estado cancelado sin contacto — ORD-030',                'ORD-030', NULL);

-- PROVEEDOR_REFACCION ADICIONALES
INSERT INTO Proveedor_refaccion (id, clave_refaccion, cantidad, rfc_proveedor) VALUES
(11, 'TER009', 30, 'DTE200315PP5'),
(12, 'VEN006', 20, 'SSR050820LL3'),
(13, 'SEN004', 25, 'EME900512MK2'),
(14, 'BAN008', 15, 'MRE151110ZA4'),
(15, 'FIL007', 20, 'MRE151110ZA4');

--  DATOS NUEVOS + FLUJOS DE ACTUALIZACIÓN DE ESTADOS
--  Contiene:
--    A) INSERTs: nuevos clientes, equipos y órdenes en estado RCB
--    B) UPDATEs: transiciones de estado paso a paso
--       · 3 ciclos completos RCB→DGN→REP→LST→ENT
--       · 3 cancelaciones en distintas etapas (RCB, DGN, REP)
--
--  Inventario disponible al inicio de este archivo:
--    RES001=46  MOT002=19  TAR003=12  SEN004=97
--    COM005=8   VEN006=28  FIL007=38  BAN008=57
--    TER009=69  CAB010=193

-- SECCIÓN A: INSERTS — todos los registros en estado inicial

-- A1. Direcciones (36-43)
INSERT INTO Direccion (id_direccion, calle, num_exterior, num_interior, colonia, codigo_postal, entidad_federativa) VALUES
(36, 'Av. Aztecas',        '88',  null,   'Ajusco',             '14300', 'CDMX'),
(37, 'Calle Fresno',       '22',  'Int 3','Fraccionamiento Sur', '54740', 'EdoMex'),
(38, 'Blvd. Puerto Aéreo', '400', null,   'Aviación Civil',     '15620', 'CDMX'),
(39, 'Av. Zaragoza',       '950', '2B',   'Jardín Balbuena',    '15900', 'CDMX'),
(40, 'Calle Olmo',         '33',  null,   'Arboledas',          '55900', 'EdoMex'),
(41, 'Av. Centenario',     '710', 'PB',   'Lomas de Plateros',  '01480', 'CDMX'),
(42, 'Calle Violeta',      '15',  null,   'Floresta',           '57750', 'EdoMex'),
(43, 'Paseo de la Palma',  '320', 'Dep 4','Palmitas',           '76000', 'Querétaro');

-- A2. Clientes nuevos (variedad: Particular, Empresa, Institución)
-- RFC: [A-Z]{3,4}[0-9]{6}[A-Z0-9]{3}   CURP: [A-Z]{4}[0-9]{6}[HM][A-Z]{2}[A-Z]{3}[0-9A-Z][0-9]
INSERT INTO Cliente (rfc_curp, nombre, ap_paterno, ap_materno, telefono, correo, id_direccion, tipo_cliente) VALUES
('ROHL920810KP1', 'Hugo',      'Ríos',      'Leal',      '5571110001', 'hugo.rios@outlook.com',         36, 'Particular'),
('FUEC870430DF2', 'Carolina',  'Fuentes',   'Escobedo',  '5571110002', 'carolina.fuentes@gmail.com',    37, 'Particular'),
('TECK011201AB3', 'TecnoFix',  'Servicios', 'SA',        '5571110003', 'contacto@tecnofix.com.mx',      38, 'Empresa'),
('ZAMV950115QR4', 'Verónica',  'Zamora',    'Valencia',  '5571110004', 'veronica.zamora@hotmail.com',   39, 'Particular'),
('OSOP881220CD5', 'Pablo',     'Osorio',    'Peña',      '5571110005', 'pablo.osorio@empresa.net',      40, 'Empresa'),
('LUNT001005EF6', 'Lucía',     'Luna',      'Torres',    '5571110006', 'lucia.luna@gmail.com',          41, 'Particular'),
-- CURP
('RIBJ990320HDFVRL08', 'Joel',  'Rivas',    'Bernal',    '5571110007', 'joel.rivas@gmail.com',          42, 'Particular'),
('SEAM030714MDFNRN01', 'Mireya','Serna',    'Amaro',     '5571110008', 'mireya.serna@institucional.mx', 43, 'Institución');

-- A3. Electrodomésticos nuevos (variedad de tipos, marcas y años)
INSERT INTO Electrodomestico (num_serie, tipo_equipo, marca, modelo, anio_fabricacion, descripcion_fisica, rfc_curp_cliente) VALUES
-- Ciclo completo A: lavadora (ORD-031)
('SN029', 'Lavadora',       'LG',        'WM3400',   2021, 'Color blanco, puerta con fuga',                'ROHL920810KP1'),
-- Ciclo completo B: refrigerador doble puerta (ORD-032)
('SN030', 'Refrigerador',   'Samsung',   'RF28T',    2022, 'Color negro mate, no hace hielo',              'FUEC870430DF2'),
-- Ciclo completo C: horno de microondas comercial (ORD-033)
('SN031', 'Microondas',     'Panasonic', 'NE-1880',  2020, 'Color gris, uso comercial, turntable roto',    'TECK011201AB3'),
-- Cancelación en RCB (ORD-034)
('SN032', 'Secadora',       'Whirlpool', 'WED7500',  2019, 'Color blanco, no calienta bien',               'ZAMV950115QR4'),
-- Cancelación en DGN (ORD-035)
('SN033', 'Lavavajillas',   'Bosch',     'SMS46N',   2020, 'Color acero, no termina el ciclo',             'OSOP881220CD5'),
-- Cancelación en REP (ORD-036)
('SN034', 'Refrigerador',   'Mabe',      'RME360',   2018, 'Color blanco, fuga de gas severa',             'LUNT001005EF6'),
-- Equipos extra para diversificar reportes
('SN035', 'Aire Acondicionado','LG',     'LW8016',   2022, 'Color blanco, split de 1 ton, no enfría',      'RIBJ990320HDFVRL08'),
('SN036', 'Aire Acondicionado','Carrier','42XQB018', 2021, 'Color blanco, unidad exterior ruidosa',        'SEAM030714MDFNRN01'),
('SN037', 'Lavadora',       'Samsung',   'WF45T',    2023, 'Color gris, error UE constante',               'ROHL920810KP1'),
('SN038', 'Refrigerador',   'LG',        'LRFXS26',  2024, 'Color acero, dispensador sin función',        'FUEC870430DF2');

-- A4. Órdenes de servicio — todas inician en RCB
INSERT INTO Orden_de_Servicio (folio, fecha_recepcion, descripcion_falla, estado, prioridad, rfc_curp_cliente, id_sucursal, num_serie) VALUES
-- === CICLOS COMPLETOS (llegarán a ENT) ===
('ORD-031', '2026-04-01', 'Fuga de agua por empaque de puerta deteriorado',        'RCB', 'Alta',  'ROHL920810KP1',      1, 'SN029'),
('ORD-032', '2026-04-02', 'No produce hielo, ventilador hace ruido',               'RCB', 'Media', 'FUEC870430DF2',      2, 'SN030'),
('ORD-033', '2026-04-03', 'Plato giratorio no gira, calentamiento irregular',      'RCB', 'Baja',  'TECK011201AB3',      3, 'SN031'),
-- === CANCELACIÓN EN RCB (cliente no se presenta) ===
('ORD-034', '2026-04-04', 'No calienta, posible resistencia quemada',              'RCB', 'Media', 'ZAMV950115QR4',      4, 'SN032'),
-- === CANCELACIÓN EN DGN (cliente rechaza presupuesto) ===
('ORD-035', '2026-04-05', 'Ciclo de lavado se interrumpe a mitad',                 'RCB', 'Baja',  'OSOP881220CD5',      5, 'SN033'),
-- === CANCELACIÓN EN REP (refacción descontinuada) ===
('ORD-036', '2026-04-06', 'Fuga severa de gas refrigerante R-22',                  'RCB', 'Alta',  'LUNT001005EF6',      1, 'SN034'),
-- === ÓRDENES EXTRA (diversidad en reportes) ===
('ORD-037', '2026-04-07', 'No enfría, compresor sin arrancar',                     'RCB', 'Alta',  'RIBJ990320HDFVRL08', 2, 'SN035'),
('ORD-038', '2026-04-08', 'Unidad exterior vibra y hace ruido metálico',           'RCB', 'Media', 'SEAM030714MDFNRN01', 3, 'SN036'),
('ORD-039', '2026-04-09', 'Error UE por desbalance, no centrifuga',                'RCB', 'Baja',  'ROHL920810KP1',      4, 'SN037'),
('ORD-040', '2026-04-10', 'Dispensador de agua y hielo sin respuesta',             'RCB', 'Media', 'FUEC870430DF2',      5, 'SN038');

-- A5. Asignaciones iniciales (estado ASG — recién asignados)
INSERT INTO Asignacion_tecnico (id_asignacion, fecha_asignacion, actividad, estado_participacion, rfc_empleado, folio_orden) VALUES
(31, '2026-04-01', 'Inspección inicial de lavadora LG',                    'ASG', 'ROMJ860202MEX',  'ORD-031'),
(32, '2026-04-02', 'Inspección inicial de refrigerador Samsung',           'ASG', 'GOME890505HDF',  'ORD-032'),
(33, '2026-04-03', 'Inspección inicial de microondas Panasonic comercial', 'ASG', 'LOPF970504HDF',  'ORD-033'),
(34, '2026-04-04', 'Inspección inicial de secadora Whirlpool',             'ASG', 'JIME930909HDF',  'ORD-034'),
(35, '2026-04-05', 'Inspección inicial de lavavajillas Bosch',             'ASG', 'CRMN880714MEX',  'ORD-035'),
(36, '2026-04-06', 'Inspección inicial de refrigerador Mabe fuga gas',     'ASG', 'LUCE870303HDF',  'ORD-036'),
(37, '2026-04-07', 'Inspección inicial de aire acondicionado LG',          'ASG', 'ESPV910322HDF',  'ORD-037'),
(38, '2026-04-08', 'Inspección inicial de aire acondicionado Carrier',     'ASG', 'MART910707HDF',  'ORD-038'),
(39, '2026-04-09', 'Inspección inicial de lavadora Samsung error UE',      'ASG', 'DIAZ941010MEX',  'ORD-039'),
(40, '2026-04-10', 'Inspección inicial de refrigerador LG dispensador',    'ASG', 'RIVA850830MEX',  'ORD-040');

-- SECCIÓN B: UPDATES — transiciones de estado
-- Cada bloque simula un día de trabajo en el taller

-- B1. DÍA 2 (2026-04-03): Técnicos pasan a EPC y emiten diagnósticos
--     Órdenes ORD-031..036 pasan de RCB → DGN

-- Avanzar órdenes a DGN
UPDATE Orden_de_Servicio SET estado = 'DGN' WHERE folio IN ('ORD-031','ORD-032','ORD-033','ORD-034','ORD-035','ORD-036');

-- Técnicos pasan a en proceso
UPDATE Asignacion_tecnico SET estado_participacion = 'EPC' WHERE id_asignacion IN (31,32,33,34,35,36);

-- Insertar diagnósticos (autorizado=FALSE por ahora — pendiente de aprobación del cliente)
INSERT INTO Diagnostico (id_diagnostico, fecha, descripcion_problema, causa_probable, recomendacion, costo_estimado, autorizado, folio_orden) VALUES
(29, '2026-04-03', 'Empaque de puerta poroso y deformado',           'Desgaste por uso y temperatura',  'Cambiar empaque y revisar bisagras',         350.00, FALSE, 'ORD-031'),
(30, '2026-04-03', 'Motor del ventilador del evaporador bloqueado',  'Acumulación de hielo por falla en descongelador', 'Cambiar ventilador y termostato de descongelado', 690.00, FALSE, 'ORD-032'),
(31, '2026-04-03', 'Motor del plato giratorio quemado',              'Desgaste por carga excesiva',     'Reemplazar motor y acoplador del plato',     420.00, FALSE, 'ORD-033'),
(32, '2026-04-03', 'Resistencia calefactora abierta (sin continuidad)','Ciclos largos a alta temperatura','Cambiar resistencia y termostato de seguridad',580.00, FALSE, 'ORD-034'),
(33, '2026-04-03', 'Bomba de circulación con devanado quemado',      'Sobrecarga por sarro acumulado',  'Cambiar bomba de circulación',               760.00, FALSE, 'ORD-035'),
(34, '2026-04-03', 'Fuga en tubería de cobre del evaporador',        'Corrosión acelerada por R-22',    'Reparar fuga, purgar y recargar gas R-22',  1950.00, FALSE, 'ORD-036');

-- B2. DÍA 3 (2026-04-05): Clientes responden
--     · ORD-031, ORD-032, ORD-033 → autorizan → trigger los pasa a REP
--     · ORD-034 → cliente NO se presenta → se CANCELA desde RCB*
--       (*ya está en DGN; la cancelamos ahora)
--     · ORD-035 → cliente rechaza presupuesto → CANCELA desde DGN
--     · ORD-036 → autoriza pero luego surgirá problema en REP

-- Autorizar diagnósticos de ORD-031, 032, 033, 036
-- El trigger au_diagnostico_autorizado cambia automáticamente la orden de DGN a REP
UPDATE Diagnostico SET autorizado = TRUE WHERE id_diagnostico IN (29, 30, 31, 34);

-- Cancelar ORD-034 (cliente no localizable tras diagnóstico)
-- El trigger au_orden_cancelada cancelará la asignación automáticamente
UPDATE Orden_de_Servicio SET estado = 'CAN' WHERE folio = 'ORD-034';

-- Cancelar ORD-035 (presupuesto no autorizado)
-- El trigger au_orden_cancelada cancelará la asignación automáticamente
UPDATE Orden_de_Servicio SET estado = 'CAN' WHERE folio = 'ORD-035';

-- B3. DÍA 4-6 (2026-04-07 al 09): Reparaciones en curso
--     ORD-031, 032, 033, 036 están en REP
--     Se usan refacciones y se registran pagos anticipados

-- Uso de refacciones para ORD-031 (empaque → usamos TER009 como termostato de apoyo)
INSERT INTO Uso_refaccion (id_uso, cantidad, costo_aplicado, observaciones, folio_orden, clave_refaccion) VALUES
(26, 1, 190.00, 'Termostato de puerta instalado junto con empaque',    'ORD-031', 'TER009'),
(27, 1,  70.00, 'Cable eléctrico para reconexión de sensor',           'ORD-031', 'CAB010');

-- Uso de refacciones para ORD-032 (ventilador + termostato de descongelado)
INSERT INTO Uso_refaccion (id_uso, cantidad, costo_aplicado, observaciones, folio_orden, clave_refaccion) VALUES
(28, 1, 250.00, 'Ventilador de evaporador nuevo',                      'ORD-032', 'VEN006'),
(29, 1, 190.00, 'Termostato de descongelado reemplazado',              'ORD-032', 'TER009');

-- Uso de refacciones para ORD-033 (sensor de temperatura como repuesto de acoplador)
INSERT INTO Uso_refaccion (id_uso, cantidad, costo_aplicado, observaciones, folio_orden, clave_refaccion) VALUES
(30, 1, 120.00, 'Sensor de temperatura para control de giro',          'ORD-033', 'SEN004'),
(31, 2,  140.00,'Cables para reconexión del motor del plato',          'ORD-033', 'CAB010');

-- Pagos anticipados (no canceladas, no CAN)
INSERT INTO Pago (folio_pago, fecha, monto, metodo_pago, estado_pago, folio_orden) VALUES
('PAG-029', '2026-04-05', 350.00, 'EFC', 'Completado', 'ORD-031'),
('PAG-030', '2026-04-05', 400.00, 'TRN', 'Completado', 'ORD-032'),
('PAG-031', '2026-04-05', 200.00, 'DEB', 'Completado', 'ORD-033'),
('PAG-032', '2026-04-07', 500.00, 'CRD', 'Pendiente',  'ORD-036');

-- B4. DÍA 7 (2026-04-10): ORD-036 se CANCELA en plena reparación
--     Motivo: refacción descontinuada, cliente no quiere alternativa
--     El trigger au_orden_cancelada:
--       · Cancela asignaciones activas (ASG/EPC)
--       · Pone en Cancelado los pagos Pendiente (PAG-032)
UPDATE Orden_de_Servicio SET estado = 'CAN' WHERE folio = 'ORD-036';

-- B5. DÍA 8-9 (2026-04-11 al 12): Reparaciones ORD-031, 032, 033 terminan
--     Técnicos marcan la orden como LST (lista para entrega)
UPDATE Orden_de_Servicio SET estado = 'LST' WHERE folio IN ('ORD-031','ORD-032','ORD-033');

-- Saldo final de pagos al marcar LST
INSERT INTO Pago (folio_pago, fecha, monto, metodo_pago, estado_pago, folio_orden) VALUES
('PAG-033', '2026-04-11', 260.00, 'EFC', 'Completado', 'ORD-031'), -- saldo tras anticipo
('PAG-034', '2026-04-12', 490.00, 'DEB', 'Completado', 'ORD-032'), -- saldo tras anticipo
('PAG-035', '2026-04-12', 370.00, 'TRN', 'Completado', 'ORD-033'); -- saldo completo

-- B6. DÍA 10-11 (2026-04-14 al 15): Clientes recogen sus equipos
--     ORD-031, 032, 033 pasan a ENT
--     El trigger au_orden_entregada pone asignaciones en COM
UPDATE Orden_de_Servicio SET estado = 'ENT' WHERE folio = 'ORD-031';
UPDATE Orden_de_Servicio SET estado = 'ENT' WHERE folio = 'ORD-032';
UPDATE Orden_de_Servicio SET estado = 'ENT' WHERE folio = 'ORD-033';

-- B7. Garantías para las órdenes entregadas
INSERT INTO Garantia (id_garantia, fecha_inicio, fecha_vencimiento, condiciones, estado, folio_orden) VALUES
(13, '2026-04-14', '2026-10-14', 'Garantía 6 meses en empaque y termostato de puerta',          'VIG', 'ORD-031'),
(14, '2026-04-14', '2027-04-14', 'Garantía 1 año en ventilador de evaporador y termostato',     'VIG', 'ORD-032'),
(15, '2026-04-15', '2026-07-15', 'Garantía 3 meses en motor de plato y sensor de control',      'VIG', 'ORD-033');

-- B8. AVANCES PARCIALES de órdenes extra (ORD-037..040)
--     Para que las vistas y reportes muestren todos los estados
--     simultaneamente al momento de consultar

-- ORD-037 y ORD-038: avanzan a DGN con diagnóstico sin autorizar
UPDATE Orden_de_Servicio SET estado = 'DGN' WHERE folio IN ('ORD-037','ORD-038');
UPDATE Asignacion_tecnico SET estado_participacion = 'EPC' WHERE id_asignacion IN (37,38);

INSERT INTO Diagnostico (id_diagnostico, fecha, descripcion_problema, causa_probable, recomendacion, costo_estimado, autorizado, folio_orden) VALUES
(35, '2026-04-09', 'Compresor sin arranque por capacitor abierto',       'Capacitor de arranque defectuoso', 'Cambiar capacitor y verificar compresor',    480.00, FALSE, 'ORD-037'),
(36, '2026-04-10', 'Ventilador del condensador desbalanceado',           'Aspa rota por objeto extraño',     'Cambiar aspa y balancear ventilador',        320.00, FALSE, 'ORD-038');

-- ORD-037 recibe autorización → trigger lo manda a REP
UPDATE Diagnostico SET autorizado = TRUE WHERE id_diagnostico = 35;

-- ORD-039 y ORD-040: se quedan en RCB (recién llegadas, sin técnico aún)
-- Sus asignaciones siguen en ASG

-- RELACIÓN ORDEN-SERVICIO para las nuevas órdenes
INSERT INTO Rel_Orden_Servicio (id_servicio, cantidad, folio_orden) VALUES
(1, 1, 'ORD-031'), -- Revisión general
(2, 1, 'ORD-031'), -- Cambio de refacción
(7, 1, 'ORD-032'), -- Revisión refrigeración
(2, 1, 'ORD-032'), -- Cambio de refacción
(6, 1, 'ORD-033'), -- Reparación especializada
(2, 1, 'ORD-033'),
(1, 1, 'ORD-034'), -- (cancelada en DGN)
(1, 1, 'ORD-035'), -- (cancelada en DGN)
(7, 1, 'ORD-036'), -- (cancelada en REP)
(5, 1, 'ORD-037'), -- Instalación
(3, 1, 'ORD-037'), -- Mantenimiento preventivo
(3, 1, 'ORD-038'),
(1, 1, 'ORD-039'),
(1, 1, 'ORD-040'),
(2, 1, 'ORD-040');