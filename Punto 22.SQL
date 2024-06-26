CREATE OR REPLACE TRIGGER ALERTA
AFTER INSERT ON PAGOS FOR EACH ROW
DECLARE 
CANTIDADP NUMBER;
CREDITO NUMBER;
CODIGO NUMBER;
BEGIN
SELECT CANTIDAD INTO CANTIDADP
FROM PAGOS
WHERE CODIGOCLIENTE =:NEW.CODIGOCLIENTE;

SELECT CODIGOEMPLEADOREPVENTAS INTO CODIGO
FROM CLIENTES
WHERE CODIGOCLIENTE =:NEW.CODIGOCLIENTE;

SELECT LIMITECREDITO INTO CREDITO
FROM CLIENTES
WHERE CODIGOCLIENTE = NEW.CODIGOCLIENTE;

IF CANTIDADP > CREDITO THEN
 INSERT INTO NOTIFICACIONES (DESTINATARIO, MENSAJE) VALUES (CODIGO, 'Ha superado el limite de credito');

END IF;
END;
/
