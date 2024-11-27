-- Inserindo dados na tabela vendas
INSERT INTO vendas (produto_id, quantidade, data_venda)
VALUES 
    (101, 5, '2024-11-25'),
    (102, 3, '2024-11-25'),
    (103, 8, '2024-11-26'),
    (101, 7, '2024-11-26'),
    (102, 4, '2024-11-27'),
    (103, 6, '2024-11-27'),
    (104, 2, '2024-11-27');
SELECT * FROM vendas;
