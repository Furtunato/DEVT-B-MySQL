create database exemplo3;

use exemplo3;

create table clientes (
cod_cliente int auto_increment primary key not null,
nome_cliente varchar(100) not null,
cpf_cliente varchar(14) not null,
endereco varchar(100) not null,
estado char(2) default 'SP',
celular varchar(19) not null
);

create table produtos1 (
cod_produto int auto_increment primary key not null,
nome_produto varchar(100) not null,
valor decimal (5,2) not null,
qtde int,
descricao varchar(300)
);

create table fornecedores (
cnpj varchar(18) not null,
nome_fornecedor varchar(100) not null,
celular varchar(100) not null,
endereco varchar(300) not null,
cod_fornecedor int auto_increment primary key not null
);

create table tem (
cod_tem int auto_increment primary key not null,
cod_fornecedor int,
cod_produto int,
foreign key (cod_produto) references produtos1 (cod_produto),
foreign key (cod_fornecedor) references fornecedores (cod_fornecedor)
);


-- Para visualizar a tabela
select * from clientes;

-- Remoção de tabelas
drop tables clientes;
-- Remoção de banco de dados
drop  database exemplo3;


-- Alterações de campos
alter table clientes
add sexo char(1);

alter table clientes
drop column sexo;

alter table clientes
rename to pessoa_fisica;

alter table pessoa_fisica
change cpf_cliente cpfp varchar(18);

alter table pessoa_fisica
modify column nome_cliente varchar(150);

alter table pessoa_fisica
modify column estado char(2) default 'MG';



alter table pessoa_fisica
add cidade char(50);

alter table produtos1
modify column valor decimal(7,2);

alter table fornecedores
add estado char(2) default 'SP';

alter table fornecedores
add cidade char(50);

alter table fornecedores
modify column estado char(2) default 'SP';