CREATE OR REPLACE TRIGGER DESCONTAR
BEFORE INSERT ON PRODUCTOS FOR EACH ROW
DECLARE
BEGIN
UPDATE productos
SET cantidadenstock = cantidadenstock -:new.cantidadenstock
where codigoproducto = :new.codigoproducto;
end;
