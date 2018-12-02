CREATE DATABASE empresa;
USE empresa;

CREATE TABLE funcionarios(
    id_fun INT AUTO_INCREMENT,
    nome_fun VARCHAR(MAX),
    dnasc_fun DATE,
    salario_fun DECIMAL(10,2),
    foto_fun VARCHAR(MAX),

   PRIMARY KEY(id_fun)
);