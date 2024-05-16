
create or replace procedure actualizacion_inventario_producto(p_codigoproducto VARCHAR2, p_nuevacantidad NUMBER) AS
 BEGIN
 UPDATE PRODUCTOS
 SET CANTIDADENSTOCK= P_NUEVACANTIDAD
 WHERE CODIGOPRODUCTO =P_CODIGOPRODUCTO;
 COMMIT;
 END actualizacion_inventario_producto;
 
 
