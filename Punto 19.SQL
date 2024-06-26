CREATE OR REPLACE TRIGGER CANT_DISPONIBLE
BEFORE INSERT OR UPDATE ON PRODUCTOS FOR EACH ROW
DECLARE 
CODIGO VARCHAR2(15 BYTE);
CANT NUMBER;
STOCK NUMBER;
BEGIN
SELECT CODIGOPRODUCTO INTO CODIGO
FROM DETALLEPEDIDOS;

SELECT CANTIDAD INTO CANT
FROM DETALLEPEDIDOS
WHERE CODIGOPRODUCTO = CODIGO;

SELECT CANTIDADENSTOCK INTO STOCK
FROM PRODUCTOS
WHERE CODIGOPRODUCTO= CODIGO;

IF CANT > STOCK THEN
RAISE_APPLICATION_ERROR(-20000,'No hay suficientes unidades en stock');
 END IF;

END;
