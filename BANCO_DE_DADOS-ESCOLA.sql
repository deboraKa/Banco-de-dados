Drop TABLE ALUNO
CREATE TABLE ALUNO (
    ID_ALUNO SERIAL PRIMARY KEY,    -- Chave primária
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) UNIQUE NOT NULL
);

SELECT * FROM ALUNO

CREATE TABLE CURSO (
    ID_CURSO SERIAL PRIMARY KEY,    -- Chave primária
    NOME_CURSO VARCHAR(100) NOT NULL
);

SELECT * from CURSO
CREATE TABLE MATRICULA (
    ID_MATRICULA SERIAL PRIMARY KEY,  -- Chave primária
    ID_ALUNO INT NOT NULL,            -- Chave estrangeira para ALUNO
    ID_CURSO INT NOT NULL,            -- Chave estrangeira para CURSO
    DATA_MATRICULA DATE NOT NULL,
    FOREIGN KEY (ID_ALUNO) REFERENCES ALUNO(ID_ALUNO),
    FOREIGN KEY (ID_CURSO) REFERENCES CURSO(ID_CURSO)
);
SELECT * FROM MATRICULA

INSERT INTO ALUNO (NOME, EMAIL)
VALUES
('João Silva', 'joao.silva@email.com'),
('Maria Oliveira', 'maria.oliveira@email.com'),
('Carlos Andrade', 'carlos.andrade@email.com');

SELECT * FROM ALUNO

INSERT INTO CURSO (NOME_CURSO)
VALUES
('Matemática'),
('História'),
('Geografia');

SELECT * FROM CURSO

INSERT INTO MATRICULA (ID_ALUNO, ID_CURSO, DATA_MATRICULA)
VALUES
(1, 1, '2024-01-10'), -- João matriculado em Matemática
(2, 2, '2024-02-15'), -- Maria matriculada em História
(3, 3, '2024-03-20'), -- Carlos matriculado em Geografia
(1, 2, '2024-04-01'); -- João também matriculado em História

SELECT * From MATRICULA
 -- **** INSERINDO MAIS DADOS NAS TABELAS ****
INSERT INTO ALUNO (NOME, EMAIL)
VALUES
('Fernanda Costa', 'fernanda.costa@email.com'),
('Luiz Souza', 'luiz.souza@email.com'),
('Ana Beatriz', 'ana.beatriz@email.com'),
('Pedro Rocha', 'pedro.rocha@email.com'),
('Carolina Dias', 'carolina.dias@email.com');


INSERT INTO CURSO (NOME_CURSO)
VALUES
('Biologia'),
('Física'),
('Química'),
('Literatura'),
('Inglês');

INSERT INTO MATRICULA (ID_ALUNO, ID_CURSO, DATA_MATRICULA)
VALUES
(4, 1, '2024-01-15'), -- Pedro matriculado em Matemática
(5, 3, '2024-02-20'), -- Carolina matriculada em Geografia
(6, 4, '2024-03-05'), -- Luiz matriculado em História
(7, 5, '2024-04-10'), -- Ana Beatriz matriculada em Biologia
(8, 6, '2024-05-25'), -- Pedro matriculado em Física
(2, 2, '2024-02-15'), -- Maria matriculada novamente em História
(9, 7, '2024-06-01'), -- Fernanda matriculada em Química
(1, 8, '2024-07-12'), -- João matriculado em Literatura
(10, 9, '2024-07-20'); -- Carolina matriculada em Inglês

ALTER TABLE ALUNO ALTER COLUMN ID_ALUNO SET DATA TYPE SERIAL;
ALTER TABLE CURSO ALTER COLUMN ID_CURSO SET DATA TYPE SERIAL;
ALTER TABLE MATRICULA ALTER COLUMN ID_MATRICULA SET DATA TYPE SERIAL;



--Realizar consultas com JOINS
-- Listar alunos com seus cursos (INNER JOIN
SELECT A.NOME AS Aluno, C.NOME_CURSO AS Curso, M.DATA_MATRICULA
FROM MATRICULA M
INNER JOIN ALUNO A ON M.ID_ALUNO = A.ID_ALUNO
INNER JOIN CURSO C ON M.ID_CURSO = C.ID_CURSO;


-- Listar todos os alunos, mesmo aqueles sem matrícula (LEFT JOIN)
SELECT A.NOME AS Aluno, C.NOME_CURSO AS Curso
FROM ALUNO A
LEFT JOIN MATRICULA M ON A.ID_ALUNO = M.ID_ALUNO
LEFT JOIN CURSO C ON M.ID_CURSO = C.ID_CURSO;


Listar cursos com o número de alunos matriculados (GROUP BY)

SELECT C.NOME_CURSO, COUNT(M.ID_ALUNO) AS Num_Alunos
FROM CURSO C
LEFT JOIN MATRICULA M ON C.ID_CURSO = M.ID_CURSO
GROUP BY C.ID_CURSO, C.NOME_CURSO;

--Listar alunos e seus e-mails com matrículas feitas após 01/03/2024
SELECT A.NOME, A.EMAIL, C.NOME_CURSO, M.DATA_MATRICULA
FROM MATRICULA M
INNER JOIN ALUNO A ON M.ID_ALUNO = A.ID_ALUNO
INNER JOIN CURSO C ON M.ID_CURSO = C.ID_CURSO
WHERE M.DATA_MATRICULA > '2024-03-01';

SELECT * FROM MATRICULA WHERE DATA_MATRICULA > '2024-03-01';
