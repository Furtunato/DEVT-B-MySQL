create database biblioteca1;
use biblioteca1;
select database();

create table livro (
codigo int not null,
nome varchar(50),
autor varchar(40) not null,
ano int not null,
primary key (codigo)
);

create table clientes (
codigo int not null,
nome_cliente varchar(100) not null,
telefone int not null,
primary key (codigo)
);

select * from livro;

alter table livro
add lstatus char(30);

alter table clientes
add email char(30) not null;

insert into livro (codigo, nome, autor, ano, lstatus)
values (04, "Star Wars", 'George Lucas', 1977, 'Disponivel'), (03, 'Cem Anos de Solidão', 'Gabriel García Márquez', 1967, 'indisponivel');

insert into clientes (codigo, nome_cliente, telefone, email)
values (01, 'Rodrigo', 999999999, 'rodrigo@gmail.com'), (02, 'Gilberto', 999999991, 'gilberto@gmail.com'), (03, 'Lucas', 999999992, 'lucas@gmail.com');

-- Esvaziando tabela
DELETE FROM livro;

TRUNCATE TABLE clientes;
