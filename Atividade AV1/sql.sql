CREATE DATABASE AV1;

USE AV1;

show tables;

CREATE TABLE Fornecedor (
fcodigo int auto_increment primary key not null,
fnome varchar(50) not null,
fstatus int not null,
cidade varchar(30) not null
);

CREATE TABLE Peca (
pcodigo int auto_increment primary key not null,
pnome varchar(50) not null,
cor varchar(50),
peso int,
cidade varchar(30)
);

CREATE TABLE Instituicao (
icodigo int auto_increment primary key not null,
nome varchar(50) not null
);

CREATE TABLE Projeto (
prcod int auto_increment primary key not null,
prnome varchar(50) not null,
cidade varchar(30) not null
);

create table Fornecimento (
ffor int auto_increment primary key not null,
pcod int,
fcod int,
foreign key (pcod) references Peca (pcod),
foreign key (fcod) references Fornecedor (fcod)
);


ALTER TABLE Fornecedor
change column fcodigo fcod int auto_increment not null;

ALTER TABLE Peca
change column pcodigo pcod int auto_increment not null;

-- ALTER TABLE FORNECEDOR --
	-- ADD CONSTRAINT FCODIGO
	-- FOREIGN KEY (FCOD) REFERENCES CIDADE
    
select * from Peca;

insert into fornecedor value (1, 'REDRAGON', '1', 1);

alter table Fornecedor
add fone char(50);
