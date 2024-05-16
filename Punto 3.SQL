create or replace procedure insertar_informacion_pedido(p_codigopedido number, p_codigoproducto VARCHAR2, p_cantidad number, p_preciounidad number, p_numerolinea number) AS
 BEGIN
 INSERT INTO DETALLEPEDIDOS (CODIGOPEDIDO, CODIGOPRODUCTO, CANTIDAD, PRECIOUNIDAD, NUMEROLINEA) VALUES (p_codigopedido, p_codigoproducto, p_cantidad, p_preciounidad, p_numerolinea);
 COMMIT;
 END;
