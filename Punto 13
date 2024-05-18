Elaborar un procedimiento almacenado que permita actualizar el valor de 
todos los pedidos a partir del procedimiento anterior

CREATE OR REPLACE PROCEDURE ACTUALIZAR_VALOR_TODOS_PEDIDOS
IS
BEGIN
    FOR pedido IN (SELECT CODIGOPEDIDO FROM PEDIDOS) LOOP
        BEGIN
            ACTUALIZAR_VALOR_TOTAL_PEDIDO(pedido.CODIGOPEDIDO);
        END;
    END LOOP;
END ACTUALIZAR_VALOR_TODOS_PEDIDOS;

UPDATE PEDIDOS
SET VALORTOTAL = 0;

SELECT * FROM PEDIDOS;

EXEC actualizar_valor_todos_pedidos;
