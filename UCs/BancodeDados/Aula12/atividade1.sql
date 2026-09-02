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

/*ATIVIDADE 4*/

		