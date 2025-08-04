create database Pizzaria;

use Pizzaria;

create table Cliente (
id_cliente int
);

create table Funcionario (
id_funcionario int,
dt_inicio int,
salario int,
nome varchar(30)
);

create table Pizza (
id_pizza int,
sabores varchar(30),
preco int,
ingredientes varchar(70)
);

create table Adm (
id_adm int,
nome varchar(30),
salario int,
cargo varchar(30)
);

drop table Cliente;

create table Cliente (
id_cliente int,
nome varchar(70),
telefone int,
endereco varchar(60)
);

