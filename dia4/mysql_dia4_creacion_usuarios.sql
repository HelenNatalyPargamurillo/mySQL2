
use mysql4_dia4;
-- usuario cliente

CREATE USER 'cliente'@'%' IDENTIFIED BY 'cliente2024';
GRANT SELECT ON mysql4_dia4 TO 'cliente'@'%';
GRANT SELECT ON mysql4_dia4 TO 'cliente'@'%';
SHOW GRANTS FOR 'cliente'@'%';

CREATE USER 'Software'@'%' IDENTIFIED BY 'cliente2024';


CREATE USER 'Android'@'%' IDENTIFIED BY 'cliente2024';
-- uduario empleado
CREATE USER 'empleado'@'%' IDENTIFIED BY 'empleado2024';
GRANT SELECT, INSERT, UPDATE, DELETE ON mysql4_dia4 TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON mysql4_dia4.empleado TO 'empleado'@'%';
GRANT SELECT ON mysql4_dia4.cliente TO 'empleado'@'%';
GRANT SELECT ON mysql4_dia4.vehiculo TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON  mysql4_dia4 TO 'empleado'@'%';

-- usuario administrador
CREATE USER 'administrador'@'%' IDENTIFIED BY 'admin2024';
GRANT SELECT, INSERT, UPDATE, DELETE ON mysql4_dia4.* TO 'administrador'@'%';


-- consultas empleado
SELECT * FROM mysql4_dia4.sucursal;
SELECT * FROM mysql4_dia4.empleado;
SELECT * FROM mysql4_dia4.cliente;
SELECT * FROM mysql4_dia4.vehiculo;
SELECT * FROM mysql4_dia4.alquiler;


-- consultas administrador

SELECT * FROM mysql4_dia4.sucursal;
SELECT * FROM mysql4_dia4.empleado;
SELECT * FROM mysql4_dia4.cliente;
SELECT * FROM mysql4_dia4.vehiculo;
SELECT * FROM mysql4_dia4.alquiler;


-- consultas cliente

-- Consulta para ver información de vehículos disponibles
SELECT * FROM .vehiculo1;

-- Consulta para ver historial de alquileres realizados
SELECT * FROM mysql4_dia4.alquiler;