CREATE DATABASE Cursos;

USE Cursos;

CREATE TABLE Aluno (
    id_aluno int auto_increment primary key,
    dt_nasc datetime,
    nome_aluno varchar(255),
    email varchar(255) not null
);

CREATE TABLE Cursos (
    id_cursos int auto_increment primary key,
    carga_horaria int,
    titulo varchar(255),
    descricao varchar(255),
    status char(7)
);

CREATE TABLE inscricoes_avaliacoes (
    id_inscricoes int auto_increment primary key,
    dt_inscricao datetime,
    aluno_id int,
    curso_id int,
    id_avaliacao int,
    comentario varchar(255),
    nota decimal(7,2),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id_cursos)
);


CREATE TABLE fazem (
    id_fazem int auto_increment primary key,
    id_aluno int,
    id_inscricao int,
    FOREIGN KEY(id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY(id_inscricao) REFERENCES inscricoes_avaliacoes(id_inscricoes)
);

CREATE TABLE tem (
    id_tem int auto_increment primary key,
    id_inscricao int,
    id_cursos int,
    FOREIGN KEY(id_inscricao) REFERENCES inscricoes_avaliacoes(id_inscricoes),
    FOREIGN KEY(id_cursos) REFERENCES Cursos(id_cursos)
);

-- Parte 3 — Inserção de Dados
INSERT INTO Aluno (dt_nasc, nome_aluno, email) VALUES
('2000-05-15', 'João Silva', 'joao.silva@email.com'),
('1999-08-22', 'Maria Santos', 'maria.santos@email.com'),
('2001-03-10', 'Pedro Oliveira', 'pedro.oliveira@email.com'),
('1998-11-05', 'Ana Costa', 'ana.costa@email.com'),
('2002-07-18', 'Carlos Souza', 'carlos.souza@email.com');

INSERT INTO Cursos (carga_horaria, titulo, descricao, status) VALUES
(40, 'Programação em Python', 'Curso introdutório de Python', 'ativo'),
(60, 'Banco de Dados SQL', 'Fundamentos de SQL e modelagem', 'ativo'),
(35, 'Web Design', 'Design e desenvolvimento web', 'inativo'),
(50, 'Java Básico', 'Programação orientada a objetos com Java', 'ativo'),
(45, 'Análise de Dados', 'Introdução à análise de dados', 'ativo');

INSERT INTO inscricoes_avaliacoes (dt_inscricao, aluno_id, curso_id, id_avaliacao, comentario, nota) VALUES
('2024-01-10', 1, 1, 1, 'Excelente curso!', 9.5),
('2024-01-12', 2, 2, 2, 'Conteúdo muito bom', 8.7),
('2024-01-15', 3, 1, 3, 'Aprendi bastante', 9.0),
('2024-01-18', 4, 4, 4, NULL, NULL),
('2024-01-20', 5, 5, 5, NULL, NULL);

INSERT INTO fazem (id_aluno, id_inscricao) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO tem (id_inscricao, id_cursos) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 4),
(5, 5);

SELECT * FROM ALUNO;

-- Parte 4 — Atualização de Dados
UPDATE Aluno SET email = 'joao.novo@email.com' WHERE id_aluno = 1;
UPDATE Cursos SET carga_horaria = 50 WHERE id_cursos = 1;
UPDATE Aluno SET nome_aluno = 'João da Silva' WHERE id_aluno = 1;
UPDATE Cursos SET status = 'ativo' WHERE id_cursos = 3;
UPDATE inscricoes_avaliacoes SET nota = 8.5 WHERE id_inscricoes = 1;

-- Parte 5 — Exclusão de Dados
DELETE FROM inscricoes_avaliacoes WHERE id_inscricoes = 5;
DELETE FROM Cursos WHERE id_cursos = 5;

DELETE FROM Aluno WHERE id_aluno = 5;
DELETE FROM inscricoes_avaliacoes WHERE curso_id = 4;

-- Parte 6 — Consultas com Critérios e Agrupamentos
SELECT * FROM Aluno;
SELECT nome_aluno, email FROM Aluno;
SELECT * FROM Cursos WHERE carga_horaria > 40;
SELECT * FROM Cursos WHERE status = 'inativo';
SELECT * FROM Aluno WHERE dt_nasc > '2000-01-01';
SELECT * FROM inscricoes_avaliacoes WHERE nota > 9.0;
SELECT COUNT(*) FROM Cursos;
SELECT * FROM Cursos ORDER BY carga_horaria DESC LIMIT 2;

-- Parte 7 — Desafios Extras