CREATE OR REPLACE PROCEDURE FORMA_PAGO(
P_METODOPAGO VARCHAR2, P_CLIENTE NUMBER)
IS 
AUX NUMBER :=0;
BEGIN
SELECT COUNT(*) INTO AUX
FROM PAGOS
WHERE CODIGOCLIENTE= P_CLIENTE;

IF AUX >0 THEN
INSERT INTO PAGOS (CODIGOCLIENTE, FORMAPAGO) VALUES (P_CLIENTE, P_CLIENTE);
COMMIT;
END IF;
END;
