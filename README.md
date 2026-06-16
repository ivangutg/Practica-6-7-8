# Tienda de electrodomésticos
# Tienda de reparación de electrodomésticos

## 👥 Integrantes
* Gutiérrez Gómez Iván
* Manjarrez Vázquez Ángel Ian
* Márquez Romero David
* Sosa Jiménez Arturo

## 📝 Descripción del dominio del problema
Este proyecto consiste en el diseño e implementación de una base de datos relacional robusta para gestionar la operación integral de una cadena de talleres dedicada a la reparación, mantenimiento y venta de servicios relacionados con electrodomésticos.

El sistema permite automatizar, controlar y dar seguimiento a los siguientes procesos clave:
* **Gestión de Clientes y Equipos:** Registro detallado de clientes (particulares, empresas e instituciones) y el catálogo histórico de los electrodomésticos que ingresan a servicio.
* **Órdenes de Servicio y Diagnósticos:** Trazabilidad completa del ciclo de vida de una reparación. Abarca desde la recepción del equipo y asignación de técnicos, pasando por la emisión y autorización de diagnósticos, hasta la entrega final del equipo.
* **Control de Inventario y Proveedores:** Administración centralizada del stock de refacciones, registro de proveedores y automatización de la actualización del inventario mediante *triggers* cada vez que se utilizan piezas en una orden.
* **Administración de Sucursales y Personal:** Control operativo del personal técnico y administrativo, roles, asignaciones de trabajo y evaluación de la productividad por cada taller de la cadena.
* **Finanzas y Garantías:** Seguimiento de pagos (anticipos y liquidaciones), proyecciones de ingresos y control estricto sobre la vigencia de las garantías aplicadas a los servicios entregados.

## 📊 Modelos de la Base de Datos

### Diagrama Entidad-Relación Extendido (EER)
<img src="URL_DE_TU_IMAGEN_EER" alt="Diagrama Entidad-Relación Extendido (EER)" width="800"/>

### Modelo Relacional
<img src="URL_DE_TU_IMAGEN_RELACIONAL" alt="Modelo Relacional" width="800"/>

## ⚙️ Instrucciones de Instalación y Ejecución

### Requisitos Previos
* Sistema Gestor de Bases de Datos **MySQL** (se recomienda versión 8.0 o superior).
* Una interfaz gráfica de administración como MySQL Workbench, DBeaver, o acceso a la línea de comandos de MySQL.

### Pasos para la Configuración

Para garantizar la integridad referencial y el correcto funcionamiento de los disparadores (*triggers*) y vistas, los scripts deben ejecutarse estrictamente en el siguiente orden:

**1. Creación del Esquema (`01_esquema_taller.sql`)**
Este script inicializa la base de datos `tallerelectrodomestico`. Construye todas las tablas con sus llaves primarias, foráneas y restricciones (*constraints*). Además, configura las vistas analíticas, funciones de validación (como formatos de RFC/CURP) y los *triggers* de automatización y bitácora.
```sql
-- Desde línea de comandos o ejecutando el archivo en tu IDE:
SOURCE /ruta/a/tu/archivo/01_esquema_taller.sql;
```

**2. Población de Datos (`02_estado.sql`)**
Una vez creada la arquitectura, este script inserta un conjunto robusto de datos de prueba simulando el estado operativo real de los talleres. Poblará los catálogos de direcciones, roles, refacciones, así como el historial transaccional de órdenes de servicio, diagnósticos y pagos en diferentes estados operativos.
```sql
SOURCE /ruta/a/tu/archivo/02_estado.sql;
```

**3. Ejecución de Consultas y Reportes (`03_consultas.sql`)**
Finalmente, este script contiene 20 consultas analíticas avanzadas listas para validar la efectividad de la base de datos. Sirve para extraer reportes gerenciales como: cálculo de rentabilidad neta, proyecciones de riesgo financiero por garantías, análisis de cuellos de botella en el taller y auditoría de modificaciones.
```sql
SOURCE /ruta/a/tu/archivo/03_consultas.sql;
```
