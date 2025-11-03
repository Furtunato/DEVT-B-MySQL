-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Aluno (
id_aluno int auto_increment primary key PRIMARY KEY,
dt_nasc datatime,
nome_aluno char(255),
email varchar(255) not null
)

CREATE TABLE Cursos (
id_cursos int auto_increment primary key PRIMARY KEY,
carga_horaria int,
titulo varchar(255),
descricao varchar(255),
status char(7)
)

CREATE TABLE inscricoes+avaliacoes (
id_inscricoes int auto_increment primary key,
dt_inscricao datetime,
aluno_id int ,
curso_id int,
id_avaliacao int auto_increment primary key,
comentario varchar(255),
inscricao_id int,
nota decimal(7,2),
id_contem int auto_increment primary key,
PRIMARY KEY(id_inscricoes,id_avaliacao,id_contem)
)

CREATE TABLE fazem (
id_fazem int auto_increment primary key PRIMARY KEY,
id_aluno int auto_increment primary key,
id_inscricoes int auto_increment primary key,
FOREIGN KEY(id_aluno) REFERENCES Aluno (id_aluno),
FOREIGN KEY(/*erro: ??*/) REFERENCES inscricoes+avaliacoes (id_inscricoes,id_avaliacao,id_contem)
)

CREATE TABLE tem (
id_tem int auto_increment primary key PRIMARY KEY,
id_inscricoes int auto_increment primary key,
id_cursos int auto_increment primary key,
FOREIGN KEY(/*erro: ??*/) REFERENCES inscricoes+avaliacoes (id_inscricoes,id_avaliacao,id_contem),
FOREIGN KEY(id_cursos) REFERENCES Cursos (id_cursos)
)

