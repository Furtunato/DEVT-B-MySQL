-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Livros (
titulo varchar(100) not null,
autor varchar(100) not null,
genero varchar(100) not null,
preco decimal (7,2),
quantidade varchar(100) not null,
cod_livro int auto_increment primary key not null PRIMARY KEY
)

CREATE TABLE Autores (
nome_autor varchar(100) not null,
cod_autor int auto_increment primary key not null PRIMARY KEY,
nacionalidade varchar(100),
dt_nascimento datetime
)

CREATE TABLE Editores (
cod_editora int auto_increment primary key not null PRIMARY KEY,
endereco varchar(100) not null,
telefone varchar(100) not null,
nome_editora varchar(100) not null,
cnpj varchar(30) not null,
contato varchar(100) not null,
cidade varchar(2) not null
)

CREATE TABLE Clientes (
nome_cliente varchar(100) not null,
dt_nascimento datetime not null,
cpf varchar(100),
telefone varchar(20) not null,
email varchar(100) not null,
cod_clientes int auto_increment primary key not null PRIMARY KEY
)

CREATE TABLE Contem (
cod_contem int auto_increment primary key not null PRIMARY KEY,
cod_autor int auto_increment primary key not null,
cod_editora int auto_increment primary key not null,
FOREIGN KEY(cod_autor) REFERENCES Autores (cod_autor),
FOREIGN KEY(cod_editora) REFERENCES Editores (cod_editora)
)

CREATE TABLE Venda (
cod_vendas ,
data_venda datetime not null,
titulo Texto(1),
cod_clientes Texto(1),
quantidade varchar(100) not null,
valor_total decimal (7,2) not null,
cod_livro int auto_increment primary key not null,
cod_clientes int auto_increment primary key not null,
PRIMARY KEY(cod_vendas,titulo,cod_clientes),
FOREIGN KEY(cod_livro) REFERENCES Livros (cod_livro)
)

