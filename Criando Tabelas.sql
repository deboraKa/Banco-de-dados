-- Criando a tabela Departamentos
CREATE TABLE Departamentos (
    DepartamentoID SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Localizacao VARCHAR(100),
    TotalFuncionarios INT DEFAULT 0
);

select * from departamentos

-- Criando a tabela Funcionarios
CREATE TABLE Funcionarios (
    FuncionarioID SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Idade INT,
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);
