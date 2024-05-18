Elabore un disparador que verifique al momento de realizar los pedidos, el 
inventario no quede vacío

CREATE OR REPLACE TRIGGER verificar_inventario
BEFORE INSERT ON DETALLEPEDIDOS
FOR EACH ROW
DECLARE
    cantidad_disponible NUMBER;
BEGIN
    SELECT CANTIDADENSTOCK INTO cantidad_disponible
    FROM PRODUCTOS
    WHERE CODIGOPRODUCTO = :NEW.CODIGOPRODUCTO;
    
    IF cantidad_disponible IS NULL OR cantidad_disponible < :NEW.CANTIDAD THEN
        RAISE_APPLICATION_ERROR(-20001, 'No hay suficiente cantidad disponible en el inventario');
    END IF;
END;

INSERT INTO DETALLEPEDIDOS (CODIGOPEDIDO, CODIGOPRODUCTO, CANTIDAD, PRECIOUNIDAD, NUMEROLINEA) 
VALUES (1, 'OR-247', 10, 100, 1);

SELECT * FROM DATALLEPEDIDOS;
