CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL
);
