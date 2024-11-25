-- Criando a função que será chamada pelo trigger
CREATE OR REPLACE FUNCTION AtualizaTotalFuncionarios()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Departamentos
    SET TotalFuncionarios = TotalFuncionarios + 1
    WHERE DepartamentoID = NEW.DepartamentoID;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

Select * from departamentos
-- Criando o trigger
CREATE TRIGGER AtualizaTotalFuncionariosTrigger
AFTER INSERT ON Funcionarios
FOR EACH ROW
EXECUTE FUNCTION AtualizaTotalFuncionarios();

-- Selecionando todos os funcionários
SELECT * FROM Funcionarios;

-- Selecionando todos os departamentos
SELECT * FROM Departamentos;

-- Selecionando funcionários de um departamento específico
SELECT * FROM Funcionarios WHERE DepartamentoID = 1;

-- Contando o número de funcionários em cada departamento
SELECT DepartamentoID, COUNT(*) as TotalFuncionarios
FROM Funcionarios
GROUP BY DepartamentoID;
