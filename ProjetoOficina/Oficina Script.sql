CREATE DATABASE OficinaMecanica;
USE OficinaMecanica;


CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(250) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Automoveis (
    id_automoveis INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    placa CHAR(8) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT,
    cor VARCHAR(30),
    tipo VARCHAR(30),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome_mecanico VARCHAR(250) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    data_admissao DATE
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    valor_mao_obra DECIMAL(10,2),
    tempo_estimado INT
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    descricao_peca VARCHAR(50) NOT NULL,
    valor_unitario DECIMAL(10,2),
    quantidade_estoque INT DEFAULT 0
);

CREATE TABLE Os (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_automoveis INT NOT NULL,
    status_os CHAR(12) NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    valor_total DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (id_automoveis) REFERENCES Automoveis(id_automoveis)
);

CREATE TABLE Gera (
    id_gera INT PRIMARY KEY AUTO_INCREMENT,
    id_automoveis INT NOT NULL,
    id_os INT NOT NULL,
    FOREIGN KEY (id_automoveis) REFERENCES Automoveis(id_automoveis),
    FOREIGN KEY (id_os) REFERENCES Os(id_os)
);

CREATE TABLE Executa (
    id_executa INT PRIMARY KEY AUTO_INCREMENT,
    id_mecanico INT NOT NULL,
    id_os INT NOT NULL,
    funcao VARCHAR(50),
    horas_trabalhadas DECIMAL(5,2),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico),
    FOREIGN KEY (id_os) REFERENCES Os(id_os)
);

CREATE TABLE Inclui (
    id_inclui INT PRIMARY KEY AUTO_INCREMENT,
    id_servico INT NOT NULL,
    id_os INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico),
    FOREIGN KEY (id_os) REFERENCES Os(id_os)
);

CREATE TABLE Utiliza (
    id_utiliza INT PRIMARY KEY AUTO_INCREMENT,
    id_peca INT NOT NULL,
    id_os INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca),
    FOREIGN KEY (id_os) REFERENCES Os(id_os)
);


SHOW columns from cliente;
