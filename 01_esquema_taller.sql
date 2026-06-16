SET NAMES 'UTF8';
DROP DATABASE IF EXISTS tallerelectrodomestico;
CREATE DATABASE IF NOT EXISTS tallerelectrodomestico DEFAULT CHARACTER SET 'UTF8';
USE tallerelectrodomestico;

create table Direccion(
	id_direccion INT PRIMARY KEY NOT null,
	calle VARCHAR(50) not null,
    num_exterior VARCHAR(10) not null,
    num_interior VARCHAR(10),
    colonia VARCHAR(50)not null,
    codigo_postal VARCHAR(5) not null,
    entidad_federativa VARCHAR(50) not null
);


CREATE TABLE Cliente (
    rfc_curp VARCHAR(18) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    ap_paterno VARCHAR(50) NOT NULL,
    ap_materno VARCHAR(50),
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(50) NOT NULL,
 	id_direccion int NOT NULL,
    tipo_cliente ENUM('Particular', 'Empresa', 'Institución') NOT null,
    FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion) ON UPDATE CASCADE ON DELETE restrict,
    UNIQUE KEY uk_correo_cliente (correo),
    unique key uk_telefono_cliente(telefono),
    unique key uk_nombre_completo(nombre,ap_paterno,ap_materno)
);

CREATE TABLE Rol (
    id_rol INT PRIMARY KEY NOT NULL,
    nombre_rol VARCHAR(15) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE Proveedor (
    rfc VARCHAR(18) PRIMARY KEY,
    razon_social VARCHAR(50) NOT NULL,
    contacto_principal VARCHAR(50) NOT NULL,
    paterno_contacto VARCHAR(50) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(50)NOT NULL,
	id_direccion int not null,
    tipo_refacciones VARCHAR(50) NOT null,
    FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion) ON UPDATE CASCADE ON DELETE restrict,
    UNIQUE KEY uk_correo_proveedor (correo)
);

CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    tipo_servicio ENUM('REG', 'CDR', 'MAP', 'LMP', 'INS', 'RES') NOT NULL,
    costo_base DECIMAL(10, 2) NOT NULL,
    tiempo_estimado_hrs int,
    CONSTRAINT chk_costo_servicio CHECK (costo_base > 0)
);

CREATE TABLE Sucursal (
    id_sucursal INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
	id_direccion int not null,
    telefono VARCHAR(10) NOT NULL,
    hora_apertura TIME NOT NULL,
    hora_cierre TIME NOT NULL,
    estado_operativo ENUM('Activa', 'Inactiva', 'En mantenimiento') NOT null default 'Activa' ,
    rfc_responsable VARCHAR(18),
    FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion) ON UPDATE CASCADE ON DELETE restrict,
    UNIQUE KEY uk_correo_sucursal (correo),
    constraint chk_hora check (timestampdiff(hour,hora_apertura,hora_cierre)>0)
);

CREATE TABLE Empleado (
    rfc VARCHAR(18) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ap_paterno VARCHAR(50) NOT NULL,
    ap_materno VARCHAR(50),
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    especialidad VARCHAR(30),
    fecha_contratacion DATE NOT NULL,
    estado_laboral ENUM('Activo', 'Inactivo', 'Suspendido') NOT null default 'Activo',
    id_sucursal INT NOT NULL,
    id_rol INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol) ON UPDATE CASCADE ON DELETE restrict,
    UNIQUE KEY uk_correo_empleado (correo),
    unique key uk_telefono_empleado(telefono),
    unique key uk_nombre_completo(nombre,ap_paterno,ap_materno),
    index idx_estado_laboral (estado_laboral),
    index idx_especialidad (especialidad),
    index idx_id_sucursal_estado (id_sucursal,estado_laboral),
    index idx_sucursal_rol (id_sucursal,id_rol)
);


CREATE TABLE Electrodomestico (
    num_serie VARCHAR(50) PRIMARY KEY,
    tipo_equipo VARCHAR(50) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    anio_fabricacion INT,
    descripcion_fisica TEXT NOT NULL,
    rfc_curp_cliente VARCHAR(18) NOT NULL,
    FOREIGN KEY (rfc_curp_cliente) REFERENCES Cliente(rfc_curp) ON UPDATE CASCADE ON DELETE restrict,
    constraint chk_anio check(anio_fabricacion>=1950 and anio_fabricacion<=year(sysdate()))
);

CREATE TABLE Refaccion (
    clave VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    marca_compatible VARCHAR(100),
    inventario INT DEFAULT 0,
    costo_unitario DECIMAL(10, 2),
    precio_venta DECIMAL(10, 2),
    constraint chk_costo check 	(costo_unitario>0),
    constraint chk_precio check (precio_venta>0 and precio_venta>costo_unitario),
    constraint chk_inventario check(inventario>=0),
    index idx_inventario (inventario),
    index idx_nombre (nombre)
);

CREATE TABLE Orden_de_Servicio (
    folio VARCHAR(20) PRIMARY KEY NOT NULL,
    fecha_recepcion DATE NOT NULL,
    descripcion_falla VARCHAR(255) NOT NULL,
    estado ENUM('RCB', 'DGN', 'REP', 'LST', 'ENT', 'CAN') NOT NULL,
    prioridad ENUM('Alta', 'Media', 'Baja') NOT NULL,
    rfc_curp_cliente VARCHAR(18) NOT NULL,
    id_sucursal INT NOT NULL,
    num_serie  VARCHAR(50) NOT NULL,
    FOREIGN KEY (rfc_curp_cliente) REFERENCES Cliente(rfc_curp) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (num_serie ) REFERENCES Electrodomestico(num_serie ) ON UPDATE CASCADE ON DELETE restrict,
    index idx_prioridad (prioridad),
    index idx_fecha_rep (fecha_recepcion),
    index idx_estado_prioridad (estado,prioridad),
    index idx_id_estado (id_sucursal,estado),
    index idx_cliente_estado (rfc_curp_cliente,estado)
    
);

CREATE TABLE Diagnostico (
    id_diagnostico INT PRIMARY KEY,
    fecha DATE NOT NULL,
    descripcion_problema TEXT NOT NULL,
    causa_probable VARCHAR(50) NOT NULL,
    recomendacion VARCHAR(255) NOT NULL,
    costo_estimado DECIMAL(10, 2) NOT NULL,
    autorizado BOOLEAN NOT null default false,
    folio_orden VARCHAR(20) NOT NULL,
    FOREIGN KEY (folio_orden) REFERENCES Orden_de_Servicio(folio) ON UPDATE CASCADE ON DELETE cascade,
    constraint chk_costo_diagnostico check (costo_estimado>=0)
);

CREATE TABLE Pago (
    folio_pago VARCHAR(20) PRIMARY KEY,
    fecha DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    metodo_pago ENUM('EFC', 'DEB', 'CRD', 'TRN') NOT NULL,
    estado_pago ENUM('Pendiente', 'Completado', 'Cancelado') NOT null default 'Pendiente',
    folio_orden VARCHAR(20) NOT NULL,
    FOREIGN KEY (folio_orden) REFERENCES Orden_de_Servicio(folio) ON UPDATE CASCADE ON DELETE restrict,
    constraint chk_monto check (monto>0),
    index idx_estado (estado_pago),
    index idx_fecha (fecha),
    index idx_fecha_estado (fecha,estado_pago)
);

CREATE TABLE Garantia (
    id_garantia INT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    condiciones TEXT,
    estado ENUM('VIG', 'VEN', 'APL', 'CAN') NOT NULL,
    folio_orden VARCHAR(20) NOT NULL,
    FOREIGN KEY (folio_orden) REFERENCES Orden_de_Servicio(folio) ON UPDATE CASCADE ON DELETE cascade,
    constraint chk_fecha check (datediff(fecha_vencimiento,fecha_inicio)>0),
    index idx_estado(estado),
    index idx_fecha_v (fecha_vencimiento),
    index idx_estado_fecha_v (estado,fecha_vencimiento)
);

CREATE TABLE Asignacion_tecnico (
    id_asignacion INT PRIMARY KEY,
    fecha_asignacion DATE NOT NULL,
    actividad VARCHAR(255),
    estado_participacion ENUM('ASG', 'EPC', 'COM', 'CAN') NOT NULL,
    rfc_empleado VARCHAR(18) NOT NULL,
    folio_orden VARCHAR(20) NOT NULL,
    FOREIGN KEY (rfc_empleado) REFERENCES Empleado(rfc) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (folio_orden) REFERENCES Orden_de_Servicio(folio) ON UPDATE CASCADE ON DELETE cascade,
    index idx_empleado_estado (rfc_empleado,estado_participacion),
    index idx_folio_estado (folio_orden,estado_participacion)
);

CREATE TABLE Uso_refaccion (
    id_uso INT PRIMARY KEY,
    cantidad INT NOT NULL,
    costo_aplicado DECIMAL(10, 2) NOT NULL,
    observaciones VARCHAR(255) NOT NULL,
    folio_orden VARCHAR(20) NOT NULL,
    clave_refaccion VARCHAR(10) NOT NULL,
    FOREIGN KEY (folio_orden) REFERENCES Orden_de_Servicio(folio) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (clave_refaccion) REFERENCES Refaccion(clave) ON UPDATE CASCADE ON DELETE RESTRICT,
    constraint chk_cantidad_urefaccion CHECK (cantidad > 0),
    index idx_folio_clave (folio_orden, clave_refaccion)
);

CREATE TABLE Bitacora (
    id_bitacora INT PRIMARY key AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    operacion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    entidad_afectada VARCHAR(100),
    descripcion VARCHAR(255),
    folio_orden VARCHAR(20),
    rfc_empleado VARCHAR(18) NULL,
    FOREIGN KEY (folio_orden) REFERENCES Orden_de_Servicio(folio) ON UPDATE CASCADE ON DELETE cascade,
    FOREIGN KEY (rfc_empleado) REFERENCES Empleado(rfc) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Rel_Orden_Servicio (
    id INT PRIMARY KEY auto_increment,
    id_servicio INT NOT NULL,
    cantidad INT NOT NULL,
    folio_orden VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (folio_orden) REFERENCES Orden_de_Servicio(folio) ON UPDATE CASCADE ON DELETE cascade,
    constraint chk_cantidad_rel_oreden check (cantidad>0) 
);

CREATE TABLE Proveedor_refaccion (
    id INT PRIMARY KEY,
    clave_refaccion VARCHAR(10) NOT NULL,
    cantidad INT NOT NULL,
    rfc_proveedor VARCHAR(18) NOT NULL,
    FOREIGN KEY (clave_refaccion) REFERENCES Refaccion(clave) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (rfc_proveedor) REFERENCES Proveedor(rfc) ON UPDATE CASCADE ON DELETE restrict,
    constraint chk_cantidad_proveedor_refaccion check (cantidad>0)
);

-- Trigger 1: Verificar inventario al usar refacción
DELIMITER //
DROP TRIGGER IF EXISTS bi_uso_refaccion //
CREATE TRIGGER bi_uso_refaccion
BEFORE INSERT ON Uso_refaccion
FOR EACH ROW
BEGIN
    DECLARE stock INT;
    SELECT inventario INTO stock 
    FROM Refaccion 
    WHERE clave = NEW.clave_refaccion;
    
    IF stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Inventario insuficiente para la refacción solicitada';
    ELSE
        UPDATE Refaccion 
        SET inventario = inventario - NEW.cantidad
        WHERE clave = NEW.clave_refaccion;
    END IF;
END //
DELIMITER ;


-- Trigger 2: Verificar estado del empleado al asignar
DELIMITER //
DROP TRIGGER IF EXISTS bi_asignacion_tecnico //
CREATE TRIGGER bi_asignacion_tecnico
BEFORE INSERT ON Asignacion_tecnico
FOR EACH ROW
BEGIN
    DECLARE estado_emp VARCHAR(20);
    SELECT estado_laboral INTO estado_emp
    FROM Empleado
    WHERE rfc = NEW.rfc_empleado;

    IF estado_emp <> 'Activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado no está activo y no puede ser asignado';
    END IF;
END //
DELIMITER ;

-- Trigger 3: Verificar que la orden no esté cancelada al crear pago
DELIMITER //
DROP TRIGGER IF EXISTS bi_pago //
CREATE TRIGGER bi_pago
BEFORE INSERT ON Pago
FOR EACH ROW
BEGIN
    DECLARE estado_orden VARCHAR(10);
    SELECT estado INTO estado_orden
    FROM Orden_de_Servicio
    WHERE folio = NEW.folio_orden;

    IF estado_orden = 'CAN' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede registrar un pago en una orden cancelada';
    END IF;
END //
DELIMITER ;

-- Triggers Bitacora
-- Trigger 1: Cambio de estado en Orden_de_Servicio
DELIMITER //
DROP TRIGGER IF EXISTS au_orden_servicio //
CREATE TRIGGER au_orden_servicio
AFTER UPDATE ON Orden_de_Servicio
FOR EACH ROW
BEGIN
    DECLARE rfc_tec VARCHAR(18);

    IF OLD.estado <> NEW.estado THEN
        SELECT rfc_empleado INTO rfc_tec
        FROM Asignacion_tecnico
        WHERE folio_orden = NEW.folio
        AND estado_participacion = 'EPC'
        LIMIT 1;

        INSERT INTO Bitacora(fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado)
        VALUES(
            NOW(),
            'UPDATE',
            'Orden_de_Servicio',
            CONCAT('Estado cambió de ', OLD.estado, ' a ', NEW.estado),
            NEW.folio,
            rfc_tec
        );
    END IF;
END //
DELIMITER ;


-- Trigger 2: Nuevo pago registrado
DELIMITER //
DROP TRIGGER IF EXISTS ai_pago //
CREATE TRIGGER ai_pago
AFTER INSERT ON Pago
FOR EACH ROW
BEGIN
    DECLARE rfc_tec VARCHAR(18);

    SELECT rfc_empleado INTO rfc_tec
    FROM Asignacion_tecnico
    WHERE folio_orden = NEW.folio_orden
    AND estado_participacion = 'EPC'
    LIMIT 1;

    INSERT INTO Bitacora(fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado)
    VALUES(
        NOW(),
        'INSERT',
        'Pago',
        CONCAT('Pago registrado por $', NEW.monto, ' mediante ', NEW.metodo_pago),
        NEW.folio_orden,
        rfc_tec
    );
END //
DELIMITER ;


-- Trigger 3: Nuevo diagnóstico registrado
DELIMITER //
DROP TRIGGER IF EXISTS ai_diagnostico //
CREATE TRIGGER ai_diagnostico
AFTER INSERT ON Diagnostico
FOR EACH ROW
BEGIN
    DECLARE rfc_tec VARCHAR(18);

    SELECT rfc_empleado INTO rfc_tec
    FROM Asignacion_tecnico
    WHERE folio_orden = NEW.folio_orden
    AND estado_participacion = 'EPC'
    LIMIT 1;

    INSERT INTO Bitacora(fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado)
    VALUES(
        NOW(),
        'INSERT',
        'Diagnostico',
        CONCAT('Diagnóstico registrado. Costo estimado: $', NEW.costo_estimado, 
               '. Autorizado: ', IF(NEW.autorizado, 'Sí', 'No')),
        NEW.folio_orden,
        rfc_tec
    );
END //
DELIMITER ;

-- Triggers al borrar
-- Trigger 1: Borrado de Orden_de_Servicio
DELIMITER //
DROP TRIGGER IF EXISTS bd_orden_servicio //
CREATE TRIGGER bd_orden_servicio
BEFORE DELETE ON Orden_de_Servicio
FOR EACH ROW
BEGIN
    INSERT INTO Bitacora(fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado)
    VALUES(
        NOW(),
        'DELETE',
        'Orden_de_Servicio',
        CONCAT('Orden eliminada. Estado al momento: ', OLD.estado, 
               '. Cliente: ', OLD.rfc_curp_cliente),
        OLD.folio,
        NULL
    );
END //
DELIMITER ;


-- Trigger 2: Borrado de Pago
DELIMITER //
DROP TRIGGER IF EXISTS bd_pago //
CREATE TRIGGER bd_pago
BEFORE DELETE ON Pago
FOR EACH ROW
BEGIN
    INSERT INTO Bitacora(fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado)
    VALUES(
        NOW(),
        'DELETE',
        'Pago',
        CONCAT('Pago eliminado. Monto: $', OLD.monto,
               '. Método: ', OLD.metodo_pago,
               '. Estado del pago: ', OLD.estado_pago),
        OLD.folio_orden,
        NULL
    );
END //
DELIMITER ;


-- Trigger 3: Borrado de Empleado
DELIMITER //
DROP TRIGGER IF EXISTS bd_empleado //
CREATE TRIGGER bd_empleado
BEFORE DELETE ON Empleado
FOR EACH ROW
BEGIN
    -- Verificar si tiene asignaciones activas
    IF EXISTS (
        SELECT 1 FROM Asignacion_tecnico 
        WHERE rfc_empleado = OLD.rfc 
        AND estado_participacion IN ('ASG', 'EPC')
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un empleado con asignaciones activas';
    END IF;

    INSERT INTO Bitacora(fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado)
    VALUES(
        NOW(),
        'DELETE',
        'Empleado',
        CONCAT('Empleado eliminado. RFC: ', OLD.rfc,
               '. Nombre: ', OLD.nombre, ' ', OLD.ap_paterno,
               '. Estado laboral: ', OLD.estado_laboral),
        NULL,
        OLD.rfc
    );
END //
DELIMITER ;


-- Trigger 4: Borrado de Sucursal
DELIMITER //
DROP TRIGGER IF EXISTS bd_sucursal //
CREATE TRIGGER bd_sucursal
BEFORE DELETE ON Sucursal
FOR EACH ROW
BEGIN
    -- Verificar si tiene órdenes activas
    IF EXISTS (
        SELECT 1 FROM Orden_de_Servicio 
        WHERE id_sucursal = OLD.id_sucursal 
        AND estado NOT IN ('ENT', 'CAN')
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar una sucursal con órdenes activas';
    END IF;

    INSERT INTO Bitacora(fecha_hora, operacion, entidad_afectada, descripcion, folio_orden, rfc_empleado)
    VALUES(
        NOW(),
        'DELETE',
        'Sucursal',
        CONCAT('Sucursal eliminada. Nombre: ', OLD.nombre,
               '. Estado operativo: ', OLD.estado_operativo),
        NULL,
        NULL
    );
END //
DELIMITER ;

-- Trigers de automatizacion
-- Trigger 1: Diagnóstico autorizado ->  avanzar orden a REP

DELIMITER //
DROP TRIGGER IF EXISTS au_diagnostico_autorizado //
CREATE TRIGGER au_diagnostico_autorizado
AFTER UPDATE ON Diagnostico
FOR EACH ROW
BEGIN
    IF OLD.autorizado = FALSE AND NEW.autorizado = TRUE THEN
        UPDATE Orden_de_Servicio
        SET estado = 'REP'
        WHERE folio = NEW.folio_orden
        AND estado = 'DGN';
    END IF;
END //
DELIMITER ;


-- Trigger 2: Orden entregada -> cerrar asignaciones activas
DELIMITER //
DROP TRIGGER IF EXISTS au_orden_entregada //
CREATE TRIGGER au_orden_entregada
AFTER UPDATE ON Orden_de_Servicio
FOR EACH ROW
BEGIN
    IF OLD.estado <> 'ENT' AND NEW.estado = 'ENT' THEN
        UPDATE Asignacion_tecnico
        SET estado_participacion = 'COM'
        WHERE folio_orden = NEW.folio
        AND estado_participacion IN ('ASG', 'EPC');
    END IF;
END //
DELIMITER ;


-- Trigger 3: Borrado de uso de refacción -> restaurar inventario
DELIMITER //
DROP TRIGGER IF EXISTS bd_uso_refaccion //
CREATE TRIGGER bd_uso_refaccion
BEFORE DELETE ON Uso_refaccion
FOR EACH ROW
BEGIN
    UPDATE Refaccion
    SET inventario = inventario + OLD.cantidad
    WHERE clave = OLD.clave_refaccion;
END //
DELIMITER ;


-- Trigger 4: Orden cancelada -> cancelar asignaciones y pagos pendientes
DELIMITER //
DROP TRIGGER IF EXISTS au_orden_cancelada //
CREATE TRIGGER au_orden_cancelada
AFTER UPDATE ON Orden_de_Servicio
FOR EACH ROW
BEGIN
    IF OLD.estado <> 'CAN' AND NEW.estado = 'CAN' THEN

        UPDATE Asignacion_tecnico
        SET estado_participacion = 'CAN'
        WHERE folio_orden = NEW.folio
        AND estado_participacion IN ('ASG', 'EPC');

        UPDATE Pago
        SET estado_pago = 'Cancelado'
        WHERE folio_orden = NEW.folio
        AND estado_pago = 'Pendiente';

    END IF;
END //
DELIMITER ;

-- Trigger para el rfc/curp

-- Validar rfc

DELIMITER //
DROP FUNCTION IF EXISTS fn_validar_rfc //
CREATE FUNCTION fn_validar_rfc(rfc VARCHAR(13))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    IF rfc REGEXP '^[A-Z]{3,4}[0-9]{6}[A-Z0-9]{3}$' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

-- Validar curp

DELIMITER //
DROP FUNCTION IF EXISTS fn_validar_curp //
CREATE FUNCTION fn_validar_curp(curp VARCHAR(18))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE valido BOOLEAN DEFAULT FALSE;

    -- Validar longitud exacta de 18 caracteres
    IF LENGTH(curp) <> 18 THEN
        RETURN FALSE;
    END IF;

    -- Validar formato con expresión regular
    IF curp REGEXP '^[A-Z]{4}[0-9]{6}[HM][A-Z]{2}[A-Z]{3}[0-9A-Z][0-9]$' THEN
        SET valido = TRUE;
    END IF;

    RETURN valido;
END //
DELIMITER ;

-- Función auxiliar para decidir qué validar en Cliente

DELIMITER //
DROP FUNCTION IF EXISTS fn_validar_rfc_curp //
CREATE FUNCTION fn_validar_rfc_curp(rfc_curp VARCHAR(18))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    IF LENGTH(rfc_curp) = 13 THEN
        RETURN fn_validar_rfc(rfc_curp);
    ELSEIF LENGTH(rfc_curp) = 18 THEN
        RETURN fn_validar_curp(rfc_curp);
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;


-- Trigger 1: Validar RFC/CURP al insertar cliente
DELIMITER //
DROP TRIGGER IF EXISTS bi_cliente_rfc //
CREATE TRIGGER bi_cliente_rfc
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    IF fn_validar_rfc_curp(NEW.rfc_curp) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El RFC o CURP del cliente no tiene un formato válido';
    END IF;
END //
DELIMITER ;


-- Trigger 2: Validar RFC/CURP al actualizar cliente
DELIMITER //
DROP TRIGGER IF EXISTS bu_cliente_rfc //
CREATE TRIGGER bu_cliente_rfc
BEFORE UPDATE ON Cliente
FOR EACH ROW
BEGIN
    IF OLD.rfc_curp <> NEW.rfc_curp THEN
        IF fn_validar_rfc_curp(NEW.rfc_curp) = FALSE THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El RFC o CURP del cliente no tiene un formato válido';
        END IF;
    END IF;
END //
DELIMITER ;


-- Trigger 3: Validar RFC al insertar empleado
DELIMITER //
DROP TRIGGER IF EXISTS bi_empleado_rfc //
CREATE TRIGGER bi_empleado_rfc
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    IF fn_validar_rfc(NEW.rfc) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El RFC del empleado no tiene un formato válido';
    END IF;
END //
DELIMITER ;


-- Trigger 4: Validar RFC al actualizar empleado
DELIMITER //
DROP TRIGGER IF EXISTS bu_empleado_rfc //
CREATE TRIGGER bu_empleado_rfc
BEFORE UPDATE ON Empleado
FOR EACH ROW
BEGIN
    IF OLD.rfc <> NEW.rfc THEN
        IF fn_validar_rfc(NEW.rfc) = FALSE THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El RFC del empleado no tiene un formato válido';
        END IF;
    END IF;
END //
DELIMITER ;


-- Trigger 5: Validar RFC al insertar proveedor
DELIMITER //
DROP TRIGGER IF EXISTS bi_proveedor_rfc //
CREATE TRIGGER bi_proveedor_rfc
BEFORE INSERT ON Proveedor
FOR EACH ROW
BEGIN
    IF fn_validar_rfc(NEW.rfc) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El RFC del proveedor no tiene un formato válido';
    END IF;
END //
DELIMITER ;


-- Trigger 6: Validar RFC al actualizar proveedor

DELIMITER //
DROP TRIGGER IF EXISTS bu_proveedor_rfc //
CREATE TRIGGER bu_proveedor_rfc
BEFORE UPDATE ON Proveedor
FOR EACH ROW
BEGIN
    IF OLD.rfc <> NEW.rfc THEN
        IF fn_validar_rfc(NEW.rfc) = FALSE THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El RFC del proveedor no tiene un formato válido';
        END IF;
    END IF;
END //
DELIMITER ;

-- Triggers para la evaluacion de un solo responsable

-- Trigger 1: Validar responsable al insertar sucursal
DELIMITER //
DROP TRIGGER IF EXISTS bi_sucursal_responsable //
CREATE TRIGGER bi_sucursal_responsable
BEFORE INSERT ON Sucursal
FOR EACH ROW
BEGIN
    DECLARE estado_emp VARCHAR(20);
    DECLARE sucursal_emp INT;

    IF NEW.rfc_responsable IS NOT NULL THEN

        SELECT estado_laboral, id_sucursal 
        INTO estado_emp, sucursal_emp
        FROM Empleado
        WHERE rfc = NEW.rfc_responsable;

        -- Verificar que el empleado exista
        IF estado_emp IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El empleado asignado como responsable no existe';
        END IF;

        -- Verificar que el empleado esté activo
        IF estado_emp <> 'Activo' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El responsable debe tener estado laboral Activo';
        END IF;

    END IF;
END //
DELIMITER ;


-- Trigger 2: Validar responsable al actualizar sucursal
DELIMITER //
DROP TRIGGER IF EXISTS bu_sucursal_responsable //
CREATE TRIGGER bu_sucursal_responsable
BEFORE UPDATE ON Sucursal
FOR EACH ROW
BEGIN
    DECLARE estado_emp VARCHAR(20);
    DECLARE sucursal_emp INT;

    IF NEW.rfc_responsable IS NOT NULL AND 
       (OLD.rfc_responsable IS NULL OR OLD.rfc_responsable <> NEW.rfc_responsable) THEN

        SELECT estado_laboral, id_sucursal
        INTO estado_emp, sucursal_emp
        FROM Empleado
        WHERE rfc = NEW.rfc_responsable;

        -- Verificar que el empleado exista
        IF estado_emp IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El empleado asignado como responsable no existe';
        END IF;

        -- Verificar que el empleado esté activo
        IF estado_emp <> 'Activo' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El responsable debe tener estado laboral Activo';
        END IF;

        -- Verificar que el empleado pertenezca a esa sucursal
        IF sucursal_emp <> NEW.id_sucursal THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El responsable debe pertenecer a la misma sucursal';
        END IF;

    END IF;
END //
DELIMITER ;


-- Trigger 3: Proteger borrado de empleado responsable
DELIMITER //
DROP TRIGGER IF EXISTS bd_empleado_responsable //
CREATE TRIGGER bd_empleado_responsable
BEFORE DELETE ON Empleado
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Sucursal
        WHERE rfc_responsable = OLD.rfc
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un empleado que es responsable de una sucursal';
    END IF;
END //
DELIMITER ;

-- Vista 1: Órdenes por cliente
DROP VIEW IF EXISTS v_ordenes_por_cliente;
CREATE VIEW v_ordenes_por_cliente AS
SELECT
    c.rfc_curp,
    CONCAT(c.nombre, ' ', c.ap_paterno, ' ', IFNULL(c.ap_materno, '')) AS nombre_completo,
    c.telefono,
    c.correo,
    c.tipo_cliente,
    os.folio,
    os.fecha_recepcion,
    os.descripcion_falla,
    os.estado,
    os.prioridad,
    e.tipo_equipo,
    e.marca,
    e.modelo,
    e.num_serie,
    s.nombre AS sucursal
FROM Cliente c
INNER JOIN Orden_de_Servicio os ON c.rfc_curp = os.rfc_curp_cliente
INNER JOIN Electrodomestico e ON os.num_serie = e.num_serie
INNER JOIN Sucursal s ON os.id_sucursal = s.id_sucursal;


-- Vista 2: Reparaciones por técnico
DROP VIEW IF EXISTS v_reparaciones_por_tecnico;
CREATE VIEW v_reparaciones_por_tecnico AS
SELECT
    em.rfc,
    CONCAT(em.nombre, ' ', em.ap_paterno, ' ', IFNULL(em.ap_materno, '')) AS nombre_tecnico,
    em.especialidad,
    s.nombre AS sucursal,
    os.folio,
    os.fecha_recepcion,
    os.estado AS estado_orden,
    os.prioridad,
    at.fecha_asignacion,
    at.actividad,
    at.estado_participacion,
    e.tipo_equipo,
    e.marca,
    e.modelo
FROM Empleado em
INNER JOIN Asignacion_tecnico at ON em.rfc = at.rfc_empleado
INNER JOIN Orden_de_Servicio os ON at.folio_orden = os.folio
INNER JOIN Electrodomestico e ON os.num_serie = e.num_serie
INNER JOIN Sucursal s ON em.id_sucursal = s.id_sucursal;


-- Vista 3: Pagos por sucursal
DROP VIEW IF EXISTS v_pagos_por_sucursal;
CREATE VIEW v_pagos_por_sucursal AS
SELECT
    s.id_sucursal,
    s.nombre AS sucursal,
    p.folio_pago,
    p.fecha,
    p.monto,
    p.metodo_pago,
    p.estado_pago,
    os.folio AS folio_orden,
    os.estado AS estado_orden,
    CONCAT(c.nombre, ' ', c.ap_paterno) AS cliente
FROM Sucursal s
INNER JOIN Orden_de_Servicio os ON s.id_sucursal = os.id_sucursal
INNER JOIN Pago p ON os.folio = p.folio_orden
INNER JOIN Cliente c ON os.rfc_curp_cliente = c.rfc_curp;


-- Vista 4: Uso de refacciones
DROP VIEW IF EXISTS v_uso_refacciones;
CREATE VIEW v_uso_refacciones AS
SELECT
    r.clave,
    r.nombre AS refaccion,
    r.marca_compatible,
    r.inventario AS inventario_actual,
    ur.folio_orden,
    ur.cantidad,
    ur.costo_aplicado,
    ur.observaciones,
    os.estado AS estado_orden,
    os.fecha_recepcion,
    s.nombre AS sucursal,
    CONCAT(c.nombre, ' ', c.ap_paterno) AS cliente
FROM Refaccion r
INNER JOIN Uso_refaccion ur ON r.clave = ur.clave_refaccion
INNER JOIN Orden_de_Servicio os ON ur.folio_orden = os.folio
INNER JOIN Sucursal s ON os.id_sucursal = s.id_sucursal
INNER JOIN Cliente c ON os.rfc_curp_cliente = c.rfc_curp;


-- Vista 5: Órdenes pendientes
DROP VIEW IF EXISTS v_ordenes_pendientes;
CREATE VIEW v_ordenes_pendientes AS
SELECT
    os.folio,
    os.fecha_recepcion,
    DATEDIFF(CURDATE(), os.fecha_recepcion) AS dias_en_taller,
    os.descripcion_falla,
    os.estado,
    os.prioridad,
    s.nombre AS sucursal,
    CONCAT(c.nombre, ' ', c.ap_paterno) AS cliente,
    c.telefono AS telefono_cliente,
    e.tipo_equipo,
    e.marca,
    e.modelo,
    d.costo_estimado,
    d.autorizado AS diagnostico_autorizado
FROM Orden_de_Servicio os
INNER JOIN Sucursal s ON os.id_sucursal = s.id_sucursal
INNER JOIN Cliente c ON os.rfc_curp_cliente = c.rfc_curp
INNER JOIN Electrodomestico e ON os.num_serie = e.num_serie
LEFT JOIN Diagnostico d ON os.folio = d.folio_orden
WHERE os.estado NOT IN ('ENT', 'CAN')
ORDER BY 
    FIELD(os.prioridad, 'Alta', 'Media', 'Baja'),
    os.fecha_recepcion ASC;


-- Vista 6: Garantías vigentes
DROP VIEW IF EXISTS v_garantias_vigentes;
CREATE VIEW v_garantias_vigentes AS
SELECT
    g.id_garantia,
    g.fecha_inicio,
    g.fecha_vencimiento,
    DATEDIFF(g.fecha_vencimiento, CURDATE()) AS dias_restantes,
    g.condiciones,
    g.estado,
    os.folio AS folio_orden,
    os.estado AS estado_orden,
    CONCAT(c.nombre, ' ', c.ap_paterno) AS cliente,
    c.telefono AS telefono_cliente,
    e.tipo_equipo,
    e.marca,
    e.modelo,
    e.num_serie,
    s.nombre AS sucursal
FROM Garantia g
INNER JOIN Orden_de_Servicio os ON g.folio_orden = os.folio
INNER JOIN Cliente c ON os.rfc_curp_cliente = c.rfc_curp
INNER JOIN Electrodomestico e ON os.num_serie = e.num_serie
INNER JOIN Sucursal s ON os.id_sucursal = s.id_sucursal
WHERE g.estado = 'VIG'
AND g.fecha_vencimiento >= CURDATE();


-- Vista 7: Productividad por taller
DROP VIEW IF EXISTS v_productividad_taller;
CREATE VIEW v_productividad_taller AS
SELECT
    s.id_sucursal,
    s.nombre AS sucursal,
    s.estado_operativo,
    -- Contamos el universo único de órdenes de la sucursal
    COUNT(DISTINCT os.folio) AS total_ordenes,
    
    -- Usamos COUNT DISTINCT evaluando el folio solo cuando cumple el estado
    COUNT(DISTINCT CASE WHEN os.estado = 'ENT' THEN os.folio END) AS ordenes_completadas,
    COUNT(DISTINCT CASE WHEN os.estado = 'CAN' THEN os.folio END) AS ordenes_canceladas,
    COUNT(DISTINCT CASE WHEN os.estado NOT IN ('ENT','CAN') THEN os.folio END) AS ordenes_activas,
    
    -- Total de técnicos únicos asignados a la sucursal
    COUNT(DISTINCT em.rfc) AS total_tecnicos,
    
    -- Financieros (utilizando condiciones basadas en filas para evitar sumas duplicadas)
    IFNULL(SUM(DISTINCT CASE WHEN p.estado_pago = 'Completado' THEN p.monto END), 0) AS ingresos_totales,
    IFNULL(AVG(DISTINCT CASE WHEN p.estado_pago = 'Completado' THEN p.monto END), 0) AS ticket_promedio,
    IFNULL(SUM(DISTINCT CASE WHEN p.estado_pago = 'Pendiente' THEN p.monto END), 0) AS monto_pendiente
FROM Sucursal s
LEFT JOIN Orden_de_Servicio os ON s.id_sucursal = os.id_sucursal
LEFT JOIN Pago p ON os.folio = p.folio_orden
LEFT JOIN Empleado em ON s.id_sucursal = em.id_sucursal
GROUP BY s.id_sucursal, s.nombre, s.estado_operativo;
