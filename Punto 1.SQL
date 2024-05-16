 create or replace procedure actualizacion_valor_producto(p_codigoproducto VARCHAR2, P_PRECIONUEVO NUMBER) AS
 BEGIN
 UPDATE PRODUCTOS
 SET PRECIOVENTA= P_PRECIONUEVO
 WHERE CODIGOPRODUCTO =P_CODIGOPRODUCTO;
 COMMIT;
 END actualizacion_valor_producto;
