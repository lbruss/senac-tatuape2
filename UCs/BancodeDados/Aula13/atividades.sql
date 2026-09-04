/*ATIVIDADE 1*/
use biblioteca;

create table autores(
id_autor int not null auto_increment,
nome varchar(100) not null,
nacionalidade varchar(50),
data_nascimento date,
primary key (id_autor)
) default charset = utf8;

desc autores;
select * from autores;

insert into autores
(id_autor, nome, nacionalidade, data_nascimento)
values
(default, 'J.K. Rowling', 'Britânica', '1965-07-31'),
(default, 'Dan Brown', 'Americana', '1964-06-22'),
(default, 'Markus Zusak', 'Australiana', '1975-06-23'),
(default, 'Stephenie Meyer', 'Americana', '1973-12-24'),
(default, 'Suzanne Collins', 'Americana', '1962-08-10'),
(default, 'Rick Riordan', 'Americana', '1964-06-05'),
(default, 'Patrick Rothfuss', 'Americana', '1973-06-06'),
(default, 'John Green', 'Americana', '1977-08-24'),
(default, 'R.J. Palacio', 'Americana', '1963-07-13'),
(default, 'Carlos Ruiz Zafón', 'Espanhola', '1964-09-25');

select * from autores;

/*ATIVIDADE 2*/
alter table livros
add column id_autor int;

select * from livros;

alter table livros
add foreign key (id_autor)
references autores(id_autor);

select * from livros;

INSERT INTO livros
(id_livro, titulo, editora, categoria, paginas, preco, estoque, lingua, ano, disponivel, id_autor)
VALUES
(default, 'Inferno', 'Arqueiro', 'Suspense', 448, 54.90, 14, 'Português', 2013, default, 2),
(default, 'O Mar de Monstros', 'Intrínseca', 'Fantasia', 304, 42.90, 16, 'Português', 2006, default, 6),
(default, 'O Teorema Katherine', 'Intrínseca', 'Romance', 304, 39.90, 10, 'Português', 2006, default, 8);

select * from livros;
desc livros;

/*ATIVIDADE 3*/
create table categoria(
id_categoria int not null auto_increment,
nome varchar(100) not null,
descricao text,
primary key (id_categoria)
) default charset = utf8;

desc categoria;

insert into categoria
(id_categoria, nome, descricao)
values
(default, 'Fantasia', 'Livros que apresentam elementos mágicos, mundos imaginários e criaturas fantásticas.'),
(default, 'Suspense', 'Livros que apresentam mistério, tensão e situações que prendem a atenção do leitor.'),
(default, 'Drama', 'Livros que abordam conflitos emocionais, sociais ou pessoais dos personagens.'),
(default, 'Romance', 'Livros que têm relacionamentos amorosos e questões afetivas como parte importante da história.'),
(default, 'Ficção Científica', 'Livros que exploram ciência, tecnologia, futuro e conceitos científicos imaginários ou especulativos.'),
(default, 'Distopia', 'Livros que apresentam sociedades fictícias marcadas por controle, desigualdade ou condições sociais negativas.');

alter table livros
add column id_categoria int;

alter table livros
drop column categoria;

alter table livros
add constraint fk_livros_categorias
foreign key (id_categoria)
references categoria(id_categoria);

select * from livros;
select * from categoria;

/*ATIVIADE 4*/
create table editora(
id_editora int not null auto_increment,
nome varchar(100) not null,
cidade varchar(100),
pais varchar(50),
primary key (id_editora)
) default charset = utf8;

desc editora;

alter table livros
drop column editora;

insert into editora
(id_editora, nome, cidade, pais)
values
(default, 'Rocco', 'Rio de Janeiro', 'Brasil'),
(default, 'Intrínseca', 'Rio de Janeiro', 'Brasil'),
(default, 'Arqueiro', 'São Paulo', 'Brasil'),
(default, 'Sextante', 'Rio de Janeiro', 'Brasil'),
(default, 'Suma', 'São Paulo', 'Brasil');

alter table livros
add column id_editora int;

alter table livros
add constraint fk_livros_editora
foreign key (id_editora)
references editora(id_editora);

select * from autores;
select * from categoria;
select * from editora;
select * from livros;

/*ATIVIDADE 5*/

/*1*/
select livros.titulo, autores.nome from livros
inner join autores
on livros.id_autor = autores.id_autor;

/*2*/
select livros.titulo, autores.nome, autores.nacionalidade from livros
inner join autores
on livros.id_autor = autores.id_autor;

/*3*/
select livros.titulo, categoria.nome from livros
inner join categoria
on livros.id_categoria = categoria.id_categoria;

/*4*/
/*select livros.titulo, livros.id_editora from livros;*/

select livros.titulo, editora.nome as editora from livros
inner join editora
on livros.id_editora = editora.id_editora;

/*5*/
select livros.titulo, autores.nome as autor, categoria.nome as categoria, editora.nome as editora
from livros
inner join autores
on livros.id_autor = autores.id_autor
inner join categoria
on livros.id_categoria = categoria.id_categoria
inner join editora
on livros.id_editora = editora.id_editora;

/*6*/
select livros.titulo, autores.nome as autores, editora.nome as editora, livros.preco from livros
inner join autores
on livros.id_autor = autores.id_autor
inner join editora
on livros.id_editora = editora.id_editora
order by livros.preco desc;

/*ATIVIDADE 6*/
/*a*/
select livros.titulo, autores.nome from livros
join autores
on livros.id_autor = autores.id_autor
where autores.nome = 'J.K. Rowling';

/*b*/
select livros.titulo, categoria.nome from livros
join categoria
on livros.id_categoria = categoria.id_categoria
where categoria.nome = 'Suspense';

/*c*/
select livros.titulo, editora.nome from livros
join editora
on livros.id_editora = editora.id_editora
where editora.nome = 'Sextante';

/*d*/
select livros.titulo, livros.preco, autores.nome as autor, editora.nome as editores
from livros
inner join autores
on livros.id_autor = autores.id_autor
inner join editora
on livros.id_editora = editora.id_editora
where livros.preco >= '50.00';

/*e*/
select livros.titulo, livros.estoque, autores.nome as autor, editora.nome as editores
from livros
inner join autores
on livros.id_autor = autores.id_autor
inner join editora
on livros.id_editora = editora.id_editora
where livros.estoque >= '10';

/*ATIVIDADE 7*/
create table leitores(
id_leitor int not null auto_increment,
nome_leitor varchar(100),
email varchar(100),
telefone varchar(20),
primary key(id_leitor)
) default charset = utf8;

insert into leitores
(id_leitor, nome_leitor, email, telefone)
values
(default, 'Lucas Almeida', 'lucas.almeida@email.com', '11987654321'),
(default, 'Mariana Santos', 'mariana.santos@email.com', '11976543210'),
(default, 'Gabriel Oliveira', 'gabriel.oliveira@email.com', '11965432109'),
(default, 'Beatriz Souza', 'beatriz.souza@email.com', '11954321098'),
(default, 'Rafael Costa', 'rafael.costa@email.com', '11943210987'),
(default, 'Ana Carolina Lima', 'ana.lima@email.com', '11932109876'),
(default, 'Pedro Henrique Silva', 'pedro.silva@email.com', '11921098765'),
(default, 'Juliana Ferreira', 'juliana.ferreira@email.com', '11910987654');

select * from leitores;
desc leitores;

/*ATIVIDADE 8*/
create table emprestimo(
id_emprestimo int not null auto_increment,
id_leitor int,
id_livro int,
foreign key (id_leitor) references leitores(id_leitor),
foreign key (id_livro) references livros(id_livro),
data_emprestimo date,
data_devolucao date,
status_emprestimo varchar(20),
primary key(id_emprestimo)
) default charset = utf8;

insert into emprestimos
(id_emprestimo, id_leitor, id_livro, data_emprestimo, data_devolucao, status_emprestimo)
VALUES
(default, 1, 16, '2026-08-01', '2026-08-10', 'Devolvido'),
(default, 2, 17, '2026-08-03', '2026-08-12', 'Devolvido'),
(default, 3, 18, '2026-08-05', NULL, 'Emprestado'),
(default, 4, 19, '2026-08-07', '2026-08-15', 'Devolvido'),
(default, 5, 20, '2026-08-10', NULL, 'Emprestado'),
(default, 6, 21, '2026-08-12', '2026-08-20', 'Devolvido'),
(default, 7, 22, '2026-08-15', NULL, 'Emprestado'),
(default, 8, 23, '2026-08-17', '2026-08-25', 'Devolvido'),
(default, 1, 24, '2026-08-20', NULL, 'Emprestado'),
(default, 2, 25, '2026-08-22', '2026-08-30', 'Devolvido'),
(default, 3, 26, '2026-08-24', NULL, 'Emprestado'),
(default, 4, 27, '2026-08-26', '2026-09-01', 'Devolvido'),
(default, 5, 28, '2026-08-28', NULL, 'Emprestado'),
(default, 6, 29, '2026-08-30', '2026-09-03', 'Devolvido'),
(default, 7, 30, '2026-09-01', NULL, 'Emprestado');

select * from emprestimos;
desc emprestimos;

select * from leitores;
select * from autores;
select * from categoria;
select * from editora;
select * from livros;
select * from emprestimo;

