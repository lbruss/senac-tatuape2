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
status_emprestimo varchar(20) default 'Devolvido',
primary key(id_emprestimo)
) default charset = utf8;

insert into emprestimo
(id_emprestimo, id_leitor, id_livro, data_emprestimo, data_devolucao, status_emprestimo)
values
(default, 1, 1,  '2026-08-01', '2026-08-10', default),
(default, 2, 5,  '2026-08-03', '2026-08-12', default),
(default, 3, 8,  '2026-08-05', null, 'Emprestado'),
(default, 4, 12, '2026-08-07', '2026-08-15', default),
(default, 5, 15, '2026-08-10', null, 'Emprestado'),
(default, 6, 17, '2026-08-12', '2026-08-20', default),
(default, 7, 19, '2026-08-15', null, 'Emprestado'),
(default, 8, 20, '2026-08-17', '2026-08-25', default),
(default, 1, 21, '2026-08-20', null, 'Emprestado'),
(default, 2, 22, '2026-08-22', '2026-08-30', default),
(default, 3, 23, '2026-08-24', null, 'Emprestado'),
(default, 4, 2,  '2026-08-26', '2026-09-01', default),
(default, 5, 6,  '2026-08-28', null, 'Emprestado'),
(default, 6, 10, '2026-08-30', '2026-09-03', default),
(default, 7, 14, '2026-09-01', null, 'Emprestado');

select * from emprestimo;
desc emprestimo;

select * from leitores;
select * from autores;
select * from categoria;
select * from editora;
select * from livros;
select * from emprestimo;

/*ATIVIDADE 9*/
/*a*/
select leitores.nome_leitor, livros.titulo, emprestimo.data_emprestimo, emprestimo.data_devolucao, emprestimo.status_emprestimo
from emprestimo
join leitores
on emprestimo.id_leitor = leitores.id_leitor
join livros
on emprestimo.id_livro = livros.id_livro;

/*b*/
select livros.titulo, emprestimo.status_emprestimo
from emprestimo
join livros
on emprestimo.id_livro = livros.id_livro
where emprestimo.status_emprestimo = 'Emprestado';

/*c*/
select leitores.nome_leitor, livros.titulo, emprestimo.data_emprestimo, emprestimo.data_devolucao, emprestimo.status_emprestimo
from emprestimo
join leitores
on emprestimo.id_leitor = leitores.id_leitor
join livros
on emprestimo.id_livro = livros.id_livro
where leitores.nome_leitor = 'Lucas Almeida';

/*d*/
select livros.titulo from emprestimo
join livros
on emprestimo.id_livro = livros.id_livro
group by livros.titulo;

/*e*/
select leitores.nome_leitor
from emprestimo
join leitores
on emprestimo.id_leitor = leitores.id_leitor
group by leitores.nome_leitor;

/*f*/
select leitores.nome_leitor, livros.titulo, autores.nome
from emprestimo
join leitores
on emprestimo.id_leitor = leitores.id_leitor
join livros
on emprestimo.id_livro = livros.id_livro
join autores
on livros.id_autor = autores.id_autor;

/*ATIVIDADE 10*/
/*a*/
select autores.nome, livros.titulo from autores
left join livros
on autores.id_autor = livros.id_autor;

/*b*/
insert into autores
(id_autor, nome, nacionalidade, data_nascimento)
values
(default, 'Neil Gaiman', 'Britânica', '1960-11-10');

select autores.nome, livros.titulo from autores
left join livros
on autores.id_autor = livros.id_autor;

/*c*/
select livros.titulo, leitores.nome_leitor, emprestimo.status_emprestimo
from livros
left join emprestimo
on livros.id_livro = emprestimo.id_livro
left join leitores
on emprestimo.id_leitor = leitores.id_leitor;

/*Resposta da pergunta
O left join faz isso porque sua regra principal é nunca descartar nenhum registro da tabela da esquerda.
*/

/*ATIVIDADE 11*/
/*a*/
select autores.nome as autor, count(livros.id_livro) as total_livros
from autores
left join livros on autores.id_autor = livros.id_autor
group by autores.id_autor, autores.nome;

/*b*/
select categoria.nome as categoria, count(livros.id_livro) as total_livros
from categoria
left join livros on categoria.id_categoria = livros.id_categoria
group by categoria.id_categoria, categoria.nome;

/*c*/
select editora.nome as editora, count(livros.id_livro) as total_livros
from editora
left join livros
on editora.id_editora = livros.id_editora
group by editora.id_editora, editora.nome;

/*d*/
select leitores.nome_leitor, count(emprestimo.id_emprestimo) as total_emprestimos
from leitores
left join emprestimo
on leitores.id_leitor = emprestimo.id_leitor
group by leitores.id_leitor, leitores.nome_leitor;

/*DESAFIO*/
select autores.nome AS autor, count(livros.id_livro) as total_livros
from autores
join livros
on autores.id_autor = livros.id_autor
group by autores.id_autor, autores.nome
having count(livros.id_livro) > 1;

/*ATIVIDADE 12*/
/*a*/
update autores
set nome = 'J. K. Rowling'
where id_autor = 1;

/*b*/
update autores
set nacionalidade = 'Britânico'
where id_autor = 1;

/*c*/
update livros
set id_categoria = 5
where id_livro = 1;

/*d*/
update livros
set id_editora = 3
where id_livro = 1;

/*e*/
update livros
set estoque = 30
where id_livro = 1;

/*f*/
update emprestimo
set status_emprestimo = default, data_devolucao = '2026-09-11'
where id_emprestimo = 3;

/*ATIVIDADE 13*/

select leitores.nome_leitor, livros.titulo, autores.nome, categoria.nome as categoria, editora.nome as editora, livros.preco, emprestimo.data_emprestimo, emprestimo.data_devolucao, emprestimo.status_emprestimo
from emprestimo
inner join leitores
on emprestimo.id_leitor = leitores.id_leitor
inner join livros
on emprestimo.id_livro = livros.id_livro
inner join autores
on livros.id_autor = autores.id_autor
inner join categoria
on livros.id_categoria = categoria.id_categoria
inner join editora
on livros.id_editora = editora.id_editora
where emprestimo.status_emprestimo = 'Emprestado'
order by emprestimo.data_emprestimo desc;
