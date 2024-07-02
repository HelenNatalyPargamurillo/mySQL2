
--Trigger para Actualizar la Disponibilidad de Vehículos

use mysql4_dia4;
DELIMITER //

CREATE TRIGGER actualizar_disponibilidad_vehiculo
AFTER INSERT ON Alquiler
FOR EACH ROW
BEGIN
  UPDATE Vehiculos
  SET disponibilidad = 'No'
  WHERE placa = NEW.vehiculo_placa;
END;

//

DELIMITER ;
