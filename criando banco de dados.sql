-- No PostgreSQL, você cria um banco de dados com o seguinte comando:
-- CREATE DATABASE ESCOLA;
--Para usar o banco de dados recém-criado: \c ESCOLA -- Conecta ao banco de dados "ESCOLA"

--Criando a tabela ALUNO com os atributos especificados
CREATE TABLE ALUNO (
    ID SERIAL PRIMARY KEY, -- Gera automaticamente valores para a chave primária
    NOME VARCHAR(100),
    EMAIL VARCHAR(100),
    ENDERECO VARCHAR(200)
);

 -- Inserindo registros na tabela
INSERT INTO ALUNO (NOME, EMAIL, ENDERECO)
VALUES 
('João Silva', 'joao.silva@email.com', 'Rua A, 123, São Paulo'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Avenida B, 456, Rio de Janeiro');

SELECT * FROM ALUNO;

