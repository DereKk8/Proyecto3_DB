CREATE OR REPLACE TRIGGER empleadoNoPropioJefe 
BEFORE INSERT OR UPDATE ON EMPLEADOS
FOR EACH ROW

BEGIN
    IF : NEW.codigoempleado = : NEW.codigojefe THEN
        RAISE_APPLICATION_ERROR(-20001, 'Un empleado no puede ser su propio jefe');
    END IF;
END;
/
