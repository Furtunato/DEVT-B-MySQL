CREATE DATABASE Livraria;
USE Livraria;

-- Tabela Autores
CREATE TABLE Autores (
    ID_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nacionalidade VARCHAR(150),
    data_nasc_autor DATE
);

-- Tabela Editoras
CREATE TABLE Editoras (
    ID_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(150) NOT NULL,
    endereco VARCHAR(150),
    contato VARCHAR(150),
    telefone VARCHAR(20),
    cidade VARCHAR(150),
    cnpj VARCHAR(20) UNIQUE
);

-- Tabela Clientes
CREATE TABLE Clientes (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(150) NOT NULL,
    cpf VARCHAR(25) UNIQUE NOT NULL,
    email VARCHAR(150),
    telefone VARCHAR(20),
    data_nasc_cliente DATE
);

-- Tabela Livros
CREATE TABLE Livros (
    ID_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(150),
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT DEFAULT 0,
    ID_autor INT,    
    ID_editora INT,
    FOREIGN KEY (ID_autor) REFERENCES Autores(ID_autor),
    FOREIGN KEY (ID_editora) REFERENCES Editoras(ID_editora)
);

-- Tabela Vendas (aqui cada venda está ligada a 1 cliente e 1 livro)
CREATE TABLE Vendas (
    ID_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    ID_cliente INT,
    ID_livro INT,
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
    FOREIGN KEY (ID_livro) REFERENCES Livros(ID_livro)
);



------ Insert ------
-- Autores
INSERT INTO Autores (nome, nacionalidade, data_nasc_autor)
VALUES
('J. K. Rowling', 'Britânica', '1965-07-31'),
('George R. R. Martin', 'Americano', '1948-09-20'),
('Machado de Assis', 'Brasileiro', '1839-06-21');

-- Editoras
INSERT INTO Editoras (nome_editora, endereco, contato, telefone, cidade, cnpj)
VALUES
('Rocco', 'Rua das Letras, 123', 'Ana Souza', '21999990000', 'Rio de Janeiro', '12.345.678/0001-99'),
('Leya', 'Av. Paulista, 500', 'Carlos Silva', '1133334444', 'São Paulo', '98.765.432/0001-11'),
('Companhia das Letras', 'Rua Augusta, 2500', 'Fernanda Lima', '1132323232', 'São Paulo', '11.222.333/0001-44');

-- Clientes
INSERT INTO Clientes (nome_cliente, cpf, email, telefone, data_nasc_cliente)
VALUES
('Maria Silva', '123.456.789-00', 'maria@email.com', '21988887777', '1990-05-12'),
('João Pereira', '987.654.321-00', 'joao@email.com', '21911112222', '1985-11-03'),
('Ana Costa', '456.789.123-55', 'ana@email.com', '11955554444', '2000-02-28');

-- Livros
INSERT INTO Livros (titulo, genero, preco, quantidade, ID_autor, ID_editora)
VALUES
('Harry Potter e a Pedra Filosofal', 'Fantasia', 59.90, 100, 1, 1),
('Harry Potter e a Câmara Secreta', 'Fantasia', 65.00, 80, 1, 1),
('A Guerra dos Tronos', 'Fantasia', 89.90, 50, 2, 2),
('Dom Casmurro', 'Romance', 39.90, 60, 3, 3);

-- Vendas (1 cliente comprando 1 livro por vez)
INSERT INTO Vendas (data_venda, valor_total, ID_cliente, ID_livro)
VALUES
('2025-09-20', 59.90, 1, 1), 
('2025-09-21', 89.90, 2, 3), 
('2025-09-22', 39.90, 3, 4);

-- CONSULTA POR CAMPOS
SELECT TITULO FROM LIVROS;

SELECT AUTORES FROM GENERO;

-- CONSULTA POR DATA COM CONDIÇÃO
SELECT TITULO, GENERO FROM LIVROS WHERE QUANTIDADE > 5;

-- CONSULTA POR LIMITE DE RESULTADO
SELECT TITULO FROM LIVROS LIMIT 5;

-- FUNÇÕES AGREGADAS
SELECT COUNT(*) AS TOTAL_LIVROS FROM LIVROS;

SELECT SUM(PRECO) AS TOTAL_LIVROS FROM LIVROS;

SELECT AVG(PRECO) AS TOTAL_LIVROS FROM LIVROS;

-- AGRUPAMENTOS COM GROUP BY
SELECT AUTORES, COUNT(*) AS QUANTIDADE FROM LIVRO GROUP BY AUTORES;


-- USO DE AND OR OR
SELECT TITULO, PRECO FROM LIVROS
WHERE TITULO = "HARRY" AND PRECO > 30;

-- CONDIÇÕES EXTRAS COM GROUP BY, HAVING E ORDER BY
SELECT ID_LIVRO, count(*) AS TOTAL_LIVROS FROM LIVROS GROUP BY ID_AUTOR HAVING TOTAL_LIVROS > 5 ORDER BY TOTAL_LIVROS DESC;

-- USO DO LIKE
SELECT TITULO FROM LIVROS
WHERE TITULO LIKE '%HARRY%';

-- USO DO LIKE COM INICIO POR LETRAS
SELECT TITULO FROM LIVROS
WHERE TITULO LIKE 'H%';

-- USO DO LIKE COM TERMINO POR LETRAS
SELECT TITULO FROM LIVROS
WHERE TITULO LIKE '%RY';

-- USO DO LIKE POR QUANTIDADE DE LETRAS
SELECT TITULO FROM LIVROS
WHERE TITULO LIKE '%H___Y%';

INSERT INTO Autores (nome, nacionalidade, data_nasc_autor)
VALUES
('Clarice Lispector', 'Brasileira', '1920-12-10'),
('Stephen King', 'Americano', '1947-09-21'),
('Agatha Christie', 'Britânica', '1890-09-15'),
('José Saramago', 'Português', '1922-11-16'),
('Jorge Amado', 'Brasileiro', '1912-08-10'),
('Neil Gaiman', 'Britânico', '1960-11-10'),
('Isabel Allende', 'Chilena', '1942-08-02');

INSERT INTO Editoras (nome_editora, endereco, contato, telefone, cidade, cnpj)
VALUES
('Intrínseca', 'Rua dos Livros, 200', 'Mariana Torres', '2133334444', 'Rio de Janeiro', '22.111.333/0001-66'),
('Record', 'Av. Brasil, 1000', 'Paulo Mendes', '1199998888', 'São Paulo', '44.555.666/0001-77'),
('Globo Livros', 'Rua Imprensa, 90', 'Ricardo Lemos', '2132154321', 'Rio de Janeiro', '33.222.111/0001-88'),
('Arqueiro', 'Rua Espada, 300', 'Lucas Freitas', '1188889999', 'São Paulo', '55.666.777/0001-99'),
('Editora 34', 'Rua Cultura, 800', 'Tatiane Rocha', '1122223333', 'São Paulo', '77.888.999/0001-00'),
('Zahar', 'Rua Saber, 75', 'Beatriz Luz', '2134343434', 'Rio de Janeiro', '88.999.000/0001-11'),
('Nova Fronteira', 'Av. Central, 1200', 'Fábio Gomes', '1130303030', 'Rio de Janeiro', '99.000.111/0001-22');
	
INSERT INTO Clientes (nome_cliente, cpf, email, telefone, data_nasc_cliente)
VALUES
('Carlos Mendes', '321.654.987-00', 'carlos@email.com', '11999998888', '1992-07-15'),
('Fernanda Rocha', '789.123.456-77', 'fernanda@email.com', '21977776666', '1988-03-30'),
('Luiz Henrique', '159.753.486-22', 'luiz@email.com', '11933332222', '1975-01-09'),
('Patrícia Gomes', '741.852.963-11', 'patricia@email.com', '21922221111', '1999-12-25'),
('Bruno Almeida', '852.963.741-55', 'bruno@email.com', '11988889999', '1995-06-18'),
('Juliana Freitas', '369.258.147-00', 'juliana@email.com', '21912344321', '1983-10-05'),
('Ricardo Silva', '111.222.333-44', 'ricardo@email.com', '11944445555', '2001-04-14');

INSERT INTO Livros (titulo, genero, preco, quantidade, ID_autor, ID_editora)
VALUES
('Carrie, a Estranha', 'Terror', 45.00, 30, 5, 4),
('O Alquimista', 'Ficção', 39.90, 70, 8, 5),
('Cem Anos de Solidão', 'Realismo Mágico', 69.90, 40, 10, 6),
('O Assassinato no Expresso Oriente', 'Mistério', 42.00, 35, 7, 7),
('A Hora da Estrela', 'Drama', 29.90, 50, 4, 3),
('Capitães da Areia', 'Romance', 34.90, 25, 6, 2);

INSERT INTO Vendas (data_venda, valor_total, ID_cliente, ID_livro)
VALUES
('2025-09-23', 45.00, 4, 5),
('2025-09-24', 39.90, 5, 6),
('2025-09-25', 69.90, 6, 7),
('2025-09-26', 42.00, 7, 8),
('2025-09-27', 29.90, 8, 9),
('2025-09-28', 34.90, 9, 10),
('2025-09-29', 65.00, 10, 2);

select titulo from livros;

SELECT TITULO FROM LIVROS
WHERE TITULO LIKE 'A%' AND PRECO > 100;


