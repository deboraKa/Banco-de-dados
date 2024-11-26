CREATE OR REPLACE PROCEDURE relatorio_vendas_por_dia()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Exibir o relatório no console do PostgreSQL
    RAISE NOTICE 'Relatório de Vendas por Dia:';

    -- Consultar e mostrar os dados no console
    PERFORM
        data_venda,
        SUM(quantidade) AS total_produtos_vendidos
    FROM vendas
    GROUP BY data_venda
    ORDER BY data_venda;
END;
$$;

CALL relatorio_vendas_por_dia();

CREATE OR REPLACE FUNCTION relatorio_vendas_por_dia()
RETURNS TABLE(data_venda DATE, total_produtos_vendidos INT)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        data_venda,
        SUM(quantidade) AS total_produtos_vendidos
    FROM vendas
    GROUP BY data_venda
    ORDER BY data_venda;
END;
$$;


