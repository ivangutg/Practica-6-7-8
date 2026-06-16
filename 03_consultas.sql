-- Equipo: Drop Database
-- 1. Rentabilidad neta por Orden de Servicio completada
-- Objetivo: Calcular la ganancia neta (utilidad bruta) de las reparaciones finalizadas, restando el costo de las refacciones utilizadas al total de pagos recibidos por el cliente.

SELECT 
    os.folio,
    e.tipo_equipo,
    e.marca,
    IFNULL(SUM(DISTINCT p.monto), 0) AS ingresos_totales,
    IFNULL((SELECT SUM(costo_aplicado) FROM Uso_refaccion WHERE folio_orden = os.folio), 0) AS costos_refacciones,
    (IFNULL(SUM(DISTINCT p.monto), 0) - IFNULL((SELECT SUM(costo_aplicado) FROM Uso_refaccion WHERE folio_orden = os.folio), 0)) AS ganancia_neta
FROM Orden_de_Servicio os
INNER JOIN Electrodomestico e ON os.num_serie = e.num_serie
LEFT JOIN Pago p ON os.folio = p.folio_orden AND p.estado_pago = 'Completado'
WHERE os.estado = 'ENT'
GROUP BY os.folio, e.tipo_equipo, e.marca
ORDER BY ganancia_neta DESC;

-- Equipo: Drop Database
-- 2. Conciliación de productividades y pagos pendientes por Sucursal (Uso de Vista)
-- Objetivo: Explotar la vista v_productividad_taller cruzándola con la tabla de direcciones para emitir un reporte gerencial sobre qué sucursales tienen mayor deuda pendiente y su tasa de cierre.

SELECT 
    v.sucursal,
    d.entidad_federativa,
    v.ordenes_activas,
    v.ordenes_completadas,
    ROUND((v.ordenes_completadas / NULLIF(v.total_ordenes, 0)) * 100, 2) AS porcentaje_efectividad,
    v.ingresos_totales,
    v.monto_pendiente
FROM v_productividad_taller v
JOIN Sucursal s ON v.id_sucursal = s.id_sucursal
JOIN Direccion d ON s.id_direccion = d.id_direccion
WHERE v.estado_operativo = 'Activa'
ORDER BY v.monto_pendiente DESC;

-- Equipo: Drop Database
-- 3. Clientes VIP (Top Spenders) y su volumen de equipos
-- Objetivo: Identificar a los 5 clientes que mayor ingreso han generado al taller, mostrando también cuántos equipos distintos han llevado a reparar.

SELECT 
    c.rfc_curp,
    CONCAT(c.nombre, ' ', c.ap_paterno) AS cliente,
    c.tipo_cliente,
    COUNT(DISTINCT os.num_serie) AS equipos_reparados,
    SUM(p.monto) AS total_pagado
FROM Cliente c
JOIN Orden_de_Servicio os ON c.rfc_curp = os.rfc_curp_cliente
JOIN Pago p ON os.folio = p.folio_orden
WHERE p.estado_pago = 'Completado'
GROUP BY c.rfc_curp, cliente, c.tipo_cliente
ORDER BY total_pagado DESC
LIMIT 5;

-- Equipo: Drop Database
-- 4. Ingresos proyectados vs. reales por mes
-- Objetivo: Analizar la diferencia entre lo que se estimó cobrar (según diagnósticos autorizados) frente a lo que realmente ha ingresado en caja por mes.

SELECT 
    resumen_ordenes.mes_operacion,
    resumen_ordenes.total_ordenes,
    resumen_ordenes.ingreso_proyectado_diagnosticos,
    IFNULL(resumen_pagos.ingresos_caja_reales, 0) AS ingresos_caja_reales
FROM (
    -- Subconsulta 1: Agrupamos y sumamos las órdenes y diagnósticos por mes
    SELECT 
        DATE_FORMAT(os.fecha_recepcion, '%Y-%m') AS mes_operacion,
        COUNT(os.folio) AS total_ordenes,
        SUM(d.costo_estimado) AS ingreso_proyectado_diagnosticos
    FROM Orden_de_Servicio os
    INNER JOIN Diagnostico d ON os.folio = d.folio_orden
    WHERE d.autorizado = TRUE
    GROUP BY DATE_FORMAT(os.fecha_recepcion, '%Y-%m')
) resumen_ordenes
LEFT JOIN (
    -- Subconsulta 2: Agrupamos y sumamos los pagos reales por mes
    SELECT 
        DATE_FORMAT(fecha, '%Y-%m') AS mes_pago,
        SUM(monto) AS ingresos_caja_reales
    FROM Pago
    WHERE estado_pago = 'Completado'
    GROUP BY DATE_FORMAT(fecha, '%Y-%m')
) resumen_pagos ON resumen_ordenes.mes_operacion = resumen_pagos.mes_pago
ORDER BY resumen_ordenes.mes_operacion ASC;

-- Equipo: Drop Database
-- 5. Análisis de cuellos de botella en el taller (Órdenes rezagadas)
-- Objetivo: Encontrar órdenes que llevan más de 7 días en el taller sin ser entregadas ('ENT') o canceladas ('CAN'), mostrando al técnico responsable actualmente.

SELECT 
    os.folio,
    os.fecha_recepcion,
    DATEDIFF(CURDATE(), os.fecha_recepcion) AS dias_transcurridos,
    os.estado,
    CONCAT(em.nombre, ' ', em.ap_paterno) AS tecnico_asignado,
    at.estado_participacion
FROM Orden_de_Servicio os
LEFT JOIN Asignacion_tecnico at ON os.folio = at.folio_orden AND at.estado_participacion IN ('ASG', 'EPC')
LEFT JOIN Empleado em ON at.rfc_empleado = em.rfc
WHERE os.estado NOT IN ('ENT', 'CAN') 
  AND DATEDIFF(CURDATE(), os.fecha_recepcion) > 7
ORDER BY dias_transcurridos DESC;

-- Equipo: Drop Database
-- 6. Directorio Unificado de Contactos del Sistema
-- Objetivo: Consolidar un directorio de contacto general integrando a Clientes, Empleados y Proveedores en un solo listado estructurado para campañas masivas de comunicación.

SELECT nombre AS nombre_contacto, telefono, correo, 'Cliente' AS tipo_entidad 
FROM Cliente
UNION
SELECT CONCAT(nombre, ' ', ap_paterno), telefono, correo, 'Empleado' AS tipo_entidad 
FROM Empleado WHERE estado_laboral = 'Activo'
UNION
SELECT contacto_principal, telefono, correo, 'Proveedor' AS tipo_entidad 
FROM Proveedor
ORDER BY tipo_entidad, nombre_contacto;

-- Equipo: Drop Database
-- 7. Historial cronológico unificado de una Orden de Servicio
-- Objetivo: Rastrear toda la línea de vida de un equipo específico (ej. 'ORD-031') fusionando eventos de creación, diagnóstico y pagos en una sola línea temporal.

SELECT fecha_recepcion AS fecha_evento, 'Recepción de Equipo' AS evento, descripcion_falla AS detalle 
FROM Orden_de_Servicio WHERE folio = 'ORD-031'
UNION
SELECT fecha AS fecha_evento, 'Diagnóstico Emitido' AS evento, recomendacion AS detalle 
FROM Diagnostico WHERE folio_orden = 'ORD-031'
UNION
SELECT fecha AS fecha_evento, CONCAT('Pago ', estado_pago) AS evento, CONCAT('Monto: $', monto) AS detalle 
-- Si se quiere buscar otra orden se cambia en el where de folio orden
FROM Pago WHERE folio_orden = 'ORD-031'
ORDER BY fecha_evento ASC;

-- Equipo: Drop Database
-- 8. Proyección de Riesgo Financiero: Ingresos Libres vs Ingresos Condicionados (Uso de Vistas, JOIN y UNION)
-- Objetivo: Calcular cuánto del dinero que ya cobró el taller está "libre de riesgo" y cuánto está "condicionado". 
--           El ingreso condicionado es aquel que proviene de equipos que actualmente tienen una garantía vigente; es decir, dinero que ya está en caja, 
--           pero que representa un pasivo potencial si el equipo falla y el taller debe absorber el costo de una segunda reparación.

-- Parte 1: Dinero libre de riesgo (equipos cobrados SIN garantía vigente)
SELECT 
    vp.sucursal,
    'Ingreso Libre de Riesgo' AS categoria_financiera,
    COUNT(DISTINCT vp.folio_orden) AS cantidad_ordenes,
    IFNULL(SUM(vp.monto), 0) AS monto_total
FROM v_pagos_por_sucursal vp
LEFT JOIN v_garantias_vigentes vg ON vp.folio_orden = vg.folio_orden
WHERE vp.estado_pago = 'Completado' AND vg.id_garantia IS NULL
GROUP BY vp.sucursal
UNION
-- Parte 2: Dinero condicionado (equipos cobrados CON garantía vigente)
SELECT 
    vp.sucursal,
    'Ingreso Condicionado (Garantía Activa)' AS categoria_financiera,
    COUNT(DISTINCT vp.folio_orden) AS cantidad_ordenes,
    IFNULL(SUM(vp.monto), 0) AS monto_total
FROM v_pagos_por_sucursal vp
INNER JOIN v_garantias_vigentes vg ON vp.folio_orden = vg.folio_orden
WHERE vp.estado_pago = 'Completado'
GROUP BY vp.sucursal
ORDER BY sucursal, categoria_financiera;

-- Equipo: Drop Database
-- 9. Alerta de reabastecimiento y proyección de costos de inventario
-- Objetivo: Identificar refacciones que están por agotarse (menos de 20 unidades) y calcular cuánto costaría reabastecer 50 unidades de cada una al proveedor principal.

SELECT 
    r.clave,
    r.nombre AS refaccion,
    r.inventario AS stock_actual,
    p.razon_social AS proveedor_sugerido,
    r.costo_unitario,
    (50 - r.inventario) * r.costo_unitario AS costo_estimado_reabastecimiento
FROM Refaccion r
LEFT JOIN Proveedor_refaccion pr ON r.clave = pr.clave_refaccion
LEFT JOIN Proveedor p ON pr.rfc_proveedor = p.rfc
WHERE r.inventario < 20
ORDER BY stock_actual ASC;

-- Equipo: Drop Database
-- 10. Las refacciones más críticas por tipo de electrodoméstico
-- Objetivo: Analizar qué piezas se cambian con mayor frecuencia dependiendo de si es Lavadora, Refrigerador, etc., para optimizar las compras de almacén.

SELECT 
    e.tipo_equipo,
    r.nombre AS refaccion,
    COUNT(ur.id_uso) AS frecuencia_de_uso,
    SUM(ur.cantidad) AS unidades_totales_consumidas
FROM Uso_refaccion ur
JOIN Orden_de_Servicio os ON ur.folio_orden = os.folio
JOIN Electrodomestico e ON os.num_serie = e.num_serie
JOIN Refaccion r ON ur.clave_refaccion = r.clave
GROUP BY e.tipo_equipo, r.nombre
ORDER BY e.tipo_equipo, frecuencia_de_uso DESC;

-- Equipo: Drop Database
-- 11. Análisis de dependencia de proveedores
-- Objetivo: Determinar el valor total del inventario que depende de cada proveedor, útil para negociar mejores precios o volumen.

SELECT 
    p.razon_social,
    COUNT(DISTINCT pr.clave_refaccion) AS tipos_refacciones_suministradas,
    SUM(r.inventario * r.costo_unitario) AS valor_actual_inventario_proveedor
FROM Proveedor p
JOIN Proveedor_refaccion pr ON p.rfc = pr.rfc_proveedor
JOIN Refaccion r ON pr.clave_refaccion = r.clave
GROUP BY p.razon_social
ORDER BY valor_actual_inventario_proveedor DESC;

-- Equipo: Drop Database
-- 12. Carga de trabajo y eficacia de los Técnicos
-- Objetivo: Contar en cuántas órdenes distintas ha participado cada técnico y clasificar su esfuerzo entre tareas "En progreso" y "Completadas".

SELECT 
    em.rfc,
    CONCAT(em.nombre, ' ', em.ap_paterno) AS tecnico,
    em.especialidad,
    SUM(CASE WHEN at.estado_participacion IN ('ASG', 'EPC') THEN 1 ELSE 0 END) AS reparaciones_activas,
    SUM(CASE WHEN at.estado_participacion = 'COM' THEN 1 ELSE 0 END) AS reparaciones_finalizadas,
    COUNT(at.id_asignacion) AS total_intervenciones
FROM Empleado em
JOIN Asignacion_tecnico at ON em.rfc = at.rfc_empleado
WHERE em.estado_laboral = 'Activo'
GROUP BY em.rfc, tecnico, em.especialidad
ORDER BY reparaciones_activas DESC, reparaciones_finalizadas DESC;

-- Equipo: Drop Database
-- 13. Matriz de fallas por Marca y Tipo de Servicio 
-- Objetivo: Determinar cuáles son las reparaciones más comunes ('LMP', 'CDR', 'RES') de acuerdo a la marca del electrodoméstico (ej. Samsung, Mabe).

SELECT 
    e.marca,
    s.tipo_servicio,
    COUNT(ros.id) AS cantidad_servicios,
    SUM(s.costo_base) AS total_costo_base_facturado
FROM Rel_Orden_Servicio ros
JOIN Servicio s ON ros.id_servicio = s.id_servicio
JOIN Orden_de_Servicio os ON ros.folio_orden = os.folio
JOIN Electrodomestico e ON os.num_serie = e.num_serie
GROUP BY e.marca, s.tipo_servicio
ORDER BY e.marca, cantidad_servicios DESC;

-- Equipo: Drop Database
-- 14. Tasa de conversión de Diagnósticos (Autorizados vs. Rechazados)
-- Objetivo: Analizar de todos los diagnósticos emitidos, qué porcentaje es aprobado por los clientes, agrupado por sucursal.

SELECT 
    s.nombre AS sucursal,
    COUNT(d.id_diagnostico) AS total_diagnosticos,
    SUM(CASE WHEN d.autorizado = TRUE THEN 1 ELSE 0 END) AS autorizados,
    SUM(CASE WHEN d.autorizado = FALSE THEN 1 ELSE 0 END) AS no_autorizados,
    ROUND((SUM(CASE WHEN d.autorizado = TRUE THEN 1 ELSE 0 END) / COUNT(d.id_diagnostico)) * 100, 2) AS porcentaje_conversion
FROM Diagnostico d
JOIN Orden_de_Servicio os ON d.folio_orden = os.folio
JOIN Sucursal s ON os.id_sucursal = s.id_sucursal
GROUP BY s.nombre
ORDER BY porcentaje_conversion DESC;

-- Equipo: Drop Database
-- 15. Garantías por vencer con información de contacto
-- Objetivo: Explorar la vista v_garantias_vigentes para obtener a los clientes cuyas garantías expiran en los próximos 90 días 
--           y usarlo para campañas de extensión de servicio o encuestas de calidad.

SELECT 
    v.folio_orden,
    v.cliente,
    v.telefono_cliente,
    v.tipo_equipo,
    v.condiciones,
    v.fecha_vencimiento,
    v.dias_restantes
FROM v_garantias_vigentes v
WHERE v.dias_restantes <= 90
ORDER BY v.dias_restantes ASC;

-- Equipo: Drop Database
-- 16. Distribución geográfica de las reparaciones
-- Objetivo: Conocer desde qué entidades federativas y municipios provienen la mayor cantidad de clientes que ingresan órdenes de servicio.

SELECT 
    d.entidad_federativa,
    d.colonia,
    COUNT(DISTINCT c.rfc_curp) AS cantidad_clientes,
    COUNT(os.folio) AS ordenes_generadas
FROM Cliente c
JOIN Direccion d ON c.id_direccion = d.id_direccion
JOIN Orden_de_Servicio os ON c.rfc_curp = os.rfc_curp_cliente
GROUP BY d.entidad_federativa, d.colonia
ORDER BY ordenes_generadas DESC;

-- Equipo: Drop Database
-- 17. Promedio de antigüedad de equipos dañados por marca
-- Objetivo: Calcular la edad promedio (año actual - año de fabricación) de los equipos que entran a reparación, útil para entender la obsolescencia.

SELECT 
    marca,
    tipo_equipo,
    COUNT(num_serie) AS equipos_recibidos,
    ROUND(AVG(YEAR(CURDATE()) - anio_fabricacion), 1) AS edad_promedio_anios
FROM Electrodomestico
GROUP BY marca, tipo_equipo
HAVING equipos_recibidos > 1
ORDER BY edad_promedio_anios DESC;

-- Equipo: Drop Database
-- 18. Análisis de pérdida por Órdenes Canceladas (Subconsulta)
-- Objetivo: Cuantificar el dinero que el taller "dejó de ganar" basándose en el costo estimado de los diagnósticos de aquellas órdenes que fueron finalmente canceladas.

SELECT 
    os.folio,
    os.fecha_recepcion,
    CONCAT(c.nombre, ' ', c.ap_paterno) AS cliente,
    d.causa_probable,
    d.costo_estimado AS perdida_potencial
FROM Orden_de_Servicio os
JOIN Cliente c ON os.rfc_curp_cliente = c.rfc_curp
JOIN Diagnostico d ON os.folio = d.folio_orden
WHERE os.estado = 'CAN'
ORDER BY perdida_potencial DESC;

-- Equipo: Drop Database
-- 19. Reporte de auditoría de modificaciones de sistema
-- Objetivo: Listar los últimos 10 movimientos de eliminación (DELETE) o actualizaciones críticas (UPDATE) realizados en el sistema, mostrando qué empleado (si aplica) generó la acción.

SELECT 
    b.fecha_hora,
    b.operacion,
    b.entidad_afectada,
    b.descripcion,
    b.folio_orden,
    IFNULL(CONCAT(e.nombre, ' ', e.ap_paterno), 'Sistema/Automático') AS usuario_responsable
FROM Bitacora b
LEFT JOIN Empleado e ON b.rfc_empleado = e.rfc
WHERE b.operacion IN ('UPDATE', 'DELETE')
ORDER BY b.fecha_hora DESC
LIMIT 10;

-- Equipo: Drop Database
-- 20. Ticket promedio pagado vs. Costo Base de Servicios
-- Objetivo: Determinar si los servicios aplicados justifican el monto total de pagos recibidos. Explotando v_pagos_por_sucursal contra el desglose de los servicios cobrados.

SELECT 
    vp.folio_orden,
    vp.sucursal,
    vp.cliente,
    SUM(vp.monto) AS total_cobrado,
    (SELECT SUM(s.costo_base * ros.cantidad) 
     FROM Rel_Orden_Servicio ros 
     INNER JOIN Servicio s ON ros.id_servicio = s.id_servicio 
     WHERE ros.folio_orden = vp.folio_orden) AS costo_base_servicios_aplicados
FROM v_pagos_por_sucursal vp
WHERE vp.estado_pago = 'Completado'
GROUP BY vp.folio_orden, vp.sucursal, vp.cliente
ORDER BY total_cobrado DESC;