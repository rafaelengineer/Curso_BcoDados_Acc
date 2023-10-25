-- Create the schema
CREATE SCHEMA db_atividade2_clientes;

-- Use the schema
USE db_atividade2_clientes;

-- Create the Fisica table
CREATE TABLE Fisica (
    cod_Cliente INT NOT NULL,
    Tipo VARCHAR(10) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Nome VARCHAR(255),
    CPF VARCHAR(15),
    RG VARCHAR(15),
    PRIMARY KEY (cod_Cliente)
);

-- Create the Juridica table
CREATE TABLE Juridica (
    cod_Cliente INT NOT NULL,
    Tipo VARCHAR(10) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Nome VARCHAR(255),
    CNPJ VARCHAR(20),
    IE VARCHAR(20),
    PRIMARY KEY (cod_Cliente)
);

-- Insert data into the Fisica table
INSERT INTO Fisica (cod_Cliente, Tipo, Endereco, Telefone, Nome, CPF, RG)
VALUES
(1, 'Fisica', 'Rua dos Blocos, 0', '5188745698', 'Joana Mendes Oliveira', '245548265898', '5218796385'),
(3, 'Fisica', 'Rua Nabulco Morais, 245', '5130258962', 'Roberto Rogério Lopes', '25014539878', '9852347563');

-- Insert data into the Juridica table
INSERT INTO Juridica (cod_Cliente, Tipo, Endereco, Telefone, Nome, CNPJ, IE)
VALUES
(2, 'Juridica', 'Rua David Carabarro 75 - Centro, Novo Hamburgo - RS', '5130660405', 'Escolas e faculdades QI - Novo Hamburgo', '93332182601105', '00212248814');
