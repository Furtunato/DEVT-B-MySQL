create database Reserva;

use Reserva;

CREATE TABLE cliente (
    cod_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf_cliente VARCHAR(14) NOT NULL,
    endereco VARCHAR(100),
    celular VARCHAR(19) NOT NULL
);

CREATE TABLE fornecedor1 (
    cod_fornecedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_fornecedor VARCHAR(100) NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    celular VARCHAR(19) NOT NULL,
    cnpj VARCHAR(18) NOT NULL
);

CREATE TABLE equipamento (
    cod_equipamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_equipamento VARCHAR(100) NOT NULL,
    valor DECIMAL(5 , 2 ) NOT NULL,
    qtde INT,
    descricao VARCHAR(300)
);

create table reserva (
data_reserva datetime,
qtde int,
status_reserva varchar(40),
observacoes varchar(150),
cod_reserva int auto_increment primary key not null
);

CREATE TABLE funcionario (
    nome_funcionario VARCHAR(100),
    cargo VARCHAR(70),
    sexo VARCHAR(1),
    idade INT,
    cod_funcionario INT AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE tem (
    FOREIGN KEY (cod_equipamento)
        REFERENCES equipamento (cod_equipamento),
    FOREIGN KEY (cod_fornecedor1)
        REFERENCES fornecedor1 (cod_fornecedor1),
    cod_equipamento INT,
    cod_fornecedor1 INT,
    cod_tem INT AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE querem (
    FOREIGN KEY (cod_equipamento)
        REFERENCES equipamento (cod_equipamento),
    FOREIGN KEY (cod_cliente)
        REFERENCES cliente (cod_cliente),
    cod_equipamento INT,
    cod_cliente INT,
    cod_querem INT AUTO_INCREMENT PRIMARY KEY NOT NULL
);

CREATE TABLE fazem (
    FOREIGN KEY (cod_cliente)
        REFERENCES cliente (cod_cliente),
    FOREIGN KEY (cod_reserva)
        REFERENCES reserva (cod_reserva),
    cod_cliente INT,
    cod_reserva INT,
    cod_fazem INT AUTO_INCREMENT PRIMARY KEY NOT NULL
);

