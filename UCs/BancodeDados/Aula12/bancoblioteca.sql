/*================================ATIVIDADE 3================================*/
create database biblioteca
default character set utf8
default collate utf8_general_ci;

use biblioteca;

create table livros(
id_livro int not null auto_increment,
titulo varchar(100) not null,
autor varchar(100),
categoria varchar(50),
paginas int unsigned,
preco decimal(5,2),
idioma varchar(50) default 'Português',
ano year,
primary key (id_livro)
) default charset = utf8;

desc livros;

insert into livros
(id_livro, titulo, autor, categoria, paginas, preco, idioma, ano)
values
(default, 'Dom Casmurro', 'Machado de Assis', 'Romance', 256, 39.90, 'Português', 1999),
(default, 'O Cortiço', 'Aluísio Azevedo', 'Romance', 208, 34.90, 'Português', 1990),
(default, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Romance', 224, 42.90, 'Português', 1981),
(default, 'A Hora da Estrela', 'Clarice Lispector', 'Romance', 96, 29.90, 'Português', 1977),
(default, 'Capitães da Areia', 'Jorge Amado', 'Romance', 280, 44.90, 'Português', 1937),
(default, 'Vidas Secas', 'Graciliano Ramos', 'Drama', 176, 36.90, 'Português', 1938),
(default, 'Grande Sertão: Veredas', 'Guimarães Rosa', 'Romance', 624, 59.90, 'Português', 1956),
(default, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Infantil', 96, 24.90, 'Português', 1943),
(default, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Fantasia', 264, 49.90, 'Português', 1997),
(default, 'O Hobbit', 'J.R.R. Tolkien', 'Fantasia', 336, 54.90, 'Português', 1937),
(default, '1984', 'George Orwell', 'Ficção Científica', 328, 45.90, 'Português', 1949),
(default, 'A Revolução dos Bichos', 'George Orwell', 'Sátira', 152, 32.90, 'Português', 1945),
(default, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'Fantasia', 1216, 89.90, 'Português', 1954),
(default, 'It: A Coisa', 'Stephen King', 'Terror', 1104, 79.90, 'Português', 1986),
(default, 'Orgulho e Preconceito', 'Jane Austen', 'Romance', 424, 39.90, 'Português', 1913);

select * from livros;

alter table livros
add column editora varchar(60) after autor;

alter table livros
add column estoque int unsigned after preco;

alter table livros
change column idioma lingua varchar(50) default 'Português';

select * from livros;

insert into livros
(id_livro, titulo, autor, editora, categoria, paginas, preco, estoque, lingua, ano)
values
(default, 'Harry Potter e o Cálice de Fogo', 'J.K. Rowling', 'Rocco', 'Fantasia', 583, 59.90, 15, 'Português', 2000),
(default, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 'Fantasia', 400, 44.90, 20, 'Português', 2005),
(default, 'Crepúsculo', 'Stephenie Meyer', 'Intrínseca', 'Romance', 416, 39.90, 18, 'Português', 2005),
(default, 'O Código Da Vinci', 'Dan Brown', 'Sextante', 'Suspense', 560, 54.90, 12, 'Português', 2003),
(default, 'A Culpa é das Estrelas', 'John Green', 'Intrínseca', 'Romance', 288, 34.90, 25, 'Português', 2012);

update livros
set preco = '89.90'
where id_livro = 3;

update livros
set estoque = '30'
where id_livro = 5;

update livros
set editora = 'Rocco'
where id_livro = 7;

update livros
set preco = '40.99', estoque = '3000'
where id_livro = 8;

select * from livros;

delete from livros
where id_livro = 4;

delete from livros
where id_livro = 9;

delete from livros
where id_livro = 1;

select * from livros;

alter table livros
modify column titulo varchar(150);

alter table livros
modify column categoria varchar(50);

alter table livros
add column disponivel enum('Sim','Não') default 'Sim';

desc livros;
select * from livros;

truncate table livros;

insert into livros
(id_livro, titulo, autor, editora, categoria, paginas, preco, estoque, lingua, ano, disponivel)
values
(default, 'Harry Potter e o Cálice de Fogo', 'J.K. Rowling', 'Rocco', 'Fantasia', 583, 59.90, 15, 'Português', 2000, default),
(default, 'Harry Potter e a Ordem da Fênix', 'J.K. Rowling', 'Rocco', 'Fantasia', 703, 69.90, 12, 'Português', 2003, default),
(default, 'Harry Potter e o Enigma do Príncipe', 'J.K. Rowling', 'Rocco', 'Fantasia', 471, 64.90, 10, 'Português', 2005, default),
(default, 'Harry Potter e as Relíquias da Morte', 'J.K. Rowling', 'Rocco', 'Fantasia', 551, 69.90, 8, 'Português', 2007, default),
(default, 'O Código Da Vinci', 'Dan Brown', 'Arqueiro', 'Suspense', 432, 49.90, 20, 'Português', 2003, default),
(default, 'Anjos e Demônios', 'Dan Brown', 'Arqueiro', 'Suspense', 464, 54.90, 18, 'Português', 2000, default),
(default, 'A Menina que Roubava Livros', 'Markus Zusak', 'Intrínseca', 'Drama', 480, 59.90, 14, 'Português', 2005, default),
(default, 'Crepúsculo', 'Stephenie Meyer', 'Intrínseca', 'Romance', 416, 44.90, 16, 'Português', 2005, default),
(default, 'Lua Nova', 'Stephenie Meyer', 'Intrínseca', 'Romance', 480, 44.90, 13, 'Português', 2006, default),
(default, 'Eclipse', 'Stephenie Meyer', 'Intrínseca', 'Romance', 576, 49.90, 11, 'Português', 2007, default),
(default, 'A Hospedeira', 'Stephenie Meyer', 'Intrínseca', 'Ficção Científica', 560, 54.90, 9, 'Português', 2008, default),
(default, 'Jogos Vorazes', 'Suzanne Collins', 'Rocco', 'Distopia', 400, 49.90, 17, 'Português', 2008, default),
(default, 'Em Chamas', 'Suzanne Collins', 'Rocco', 'Distopia', 416, 49.90, 15, 'Português', 2009, default),
(default, 'A Esperança', 'Suzanne Collins', 'Rocco', 'Distopia', 424, 52.90, 12, 'Português', 2010, default),
(default, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 'Fantasia', 400, 44.90, 20, 'Português', 2005, default),
(default, 'O Nome do Vento', 'Patrick Rothfuss', 'Arqueiro', 'Fantasia', 656, 69.90, 7, 'Português', 2007, default),
(default, 'A Culpa é das Estrelas', 'John Green', 'Intrínseca', 'Romance', 288, 39.90, 22, 'Português', 2012, default),
(default, 'Extraordinário', 'R.J. Palacio', 'Intrínseca', 'Drama', 320, 42.90, 19, 'Português', 2012, default),
(default, 'O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', 'Fantasia', 336, 49.90, 10, 'Português', 2000, default),
(default, 'A Sombra do Vento', 'Carlos Ruiz Zafón', 'Suma', 'Mistério', 464, 54.90, 8, 'Português', 2001, default);
