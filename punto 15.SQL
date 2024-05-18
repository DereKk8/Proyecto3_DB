Elabore un disparador que al momento de ingresar o actualizar un producto, 
verifique que el precio de venta de un producto sea superior un 10% del 
precio del “proveedor”

CREATE OR REPLACE TRIGGER verificar_precio_venta
BEFORE INSERT OR UPDATE ON PRODUCTOS
FOR EACH ROW
BEGIN
    IF :NEW.PRECIOVENTA <= :NEW.PRECIOPROVEEDOR * 1.1 THEN
        RAISE_APPLICATION_ERROR(-20000,'El precio de venta invalido.');
    END IF;
END;

INSERT INTO PRODUCTOS (CODIGOPRODUCTO, NOMBRE, GAMA, DIMENSIONES, PROVEEDOR, DESCRIPCION, CANTIDADENSTOCK, PRECIOVENTA, PRECIOPROVEEDOR)
VALUES ('P001', 'Producto 1', 'Ornamentales', '10x10', 'Proveedor 1', 'Descripción 1', 100, 94, 85);

UPDATE PRODUCTOS 
SET PRECIOVENTA = 90
WHERE CODIGOPRODUCTO = 'P001';
