/*================================ATIVIDADE 4================================*/
create database restaurante
default character set utf8
default collate utf8_general_ci;

use restaurante;

create table pratos(
id_prato int not null auto_increment,
nome varchar(100) not null,
categoria varchar(50),
preco decimal(5,2),
tamanho enum('Pequeno','Médio','Grande'),
ingredientes text,
nacionalidade varchar(50) default 'Brasileira',
primary key (id_prato)
) default charset = utf8;

desc pratos;

insert into pratos
(id_prato, nome, categoria, preco, tamanho, ingredientes, nacionalidade)
values
(default, 'Feijoada', 'Prato Principal', 39.90, 'Grande', 'Feijão preto, carne seca, linguiça e bacon', 'Brasileira'),
(default, 'Strogonoff de Frango', 'Prato Principal', 32.90, 'Médio', 'Frango, creme de leite, molho de tomate e champignon', 'Brasileira'),
(default, 'Lasanha à Bolonhesa', 'Massas', 42.90, 'Grande', 'Massa, carne moída, molho de tomate e queijo', 'Italiana'),
(default, 'Pizza Margherita', 'Pizza', 45.90, 'Grande', 'Molho de tomate, mussarela, tomate e manjericão', 'Italiana'),
(default, 'Sushi', 'Comida Japonesa', 49.90, 'Médio', 'Arroz, salmão, alga e cream cheese', 'Japonesa'),
(default, 'Yakisoba', 'Comida Japonesa', 37.90, 'Grande', 'Macarrão, frango, legumes e molho shoyu', 'Japonesa'),
(default, 'Hambúrguer Artesanal', 'Lanches', 34.90, 'Médio', 'Pão, carne bovina, queijo, alface e tomate', 'Americana'),
(default, 'Tacos', 'Comida Mexicana', 36.90, 'Médio', 'Tortilha, carne, queijo, tomate e alface', 'Mexicana'),
(default, 'Risoto de Camarão', 'Prato Principal', 52.90, 'Grande', 'Arroz arbóreo, camarão, queijo parmesão e vinho branco', 'Italiana'),
(default, 'Bife à Parmegiana', 'Prato Principal', 47.90, 'Grande', 'Bife, molho de tomate, queijo e presunto', 'Brasileira'),
(default, 'Pad Thai', 'Massas', 41.90, 'Médio', 'Macarrão de arroz, camarão, amendoim e legumes', 'Tailandesa'),
(default, 'Curry de Frango', 'Prato Principal', 38.90, 'Médio', 'Frango, curry, leite de coco e legumes', 'Indiana');

select * from pratos;

alter table pratos
add column calorias decimal(6,2) after preco;

alter table pratos
modify column calorias int unsigned;

alter table pratos
add column observacao varchar(2) after ingredientes;

alter table pratos
modify column observacao varchar(100);

alter table pratos
modify column observacao varchar(150);

alter table pratos
change column observacao detalhes varchar(150);

select * from pratos;

update pratos
set preco = '34.60'
where id_prato = 2;

update pratos
set categoria = 'Prato principal'
where id_prato = 5;

update pratos
set calorias = '3060'
where id_prato = 7;

update pratos
set calorias = '3060'
where id_prato = 7;

update pratos
set preco = '40.99', calorias = '3000'
where id_prato = 8;

select * from pratos;

delete from pratos
where id_prato = 3;

delete from pratos
where id_prato = 6;


create table clientes(
id_cliente int not null auto_increment,
nome varchar(100) not null,
telefone varchar(15),
cidade varchar(50),
nascimento date,
nacionalidade varchar(50) default 'Brasileiro',
primary key (id_cliente)
) default charset = utf8;

desc clientes;

insert into clientes
(id_cliente, nome, telefone, cidade, nascimento, nacionalidade)
values
(default, 'João Silva', '11987654321', 'São Paulo', '1998-05-12', 'Brasileira'),
(default, 'Maria Santos', '11976543210', 'Guarulhos', '2000-08-23', 'Brasileira'),
(default, 'Carlos Oliveira', '11965432109', 'Santo André', '1995-03-17', 'Brasileira'),
(default, 'Ana Souza', '11954321098', 'Osasco', '2001-11-05', 'Brasileira'),
(default, 'Pedro Costa', '11943210987', 'São Bernardo do Campo', '1997-07-28', 'Brasileira'),
(default, 'Juliana Lima', '11932109876', 'Mogi das Cruzes', '1999-01-14', 'Brasileira'),
(default, 'Rafael Almeida', '11921098765', 'Campinas', '1996-09-30', 'Brasileira'),
(default, 'Camila Ferreira', '11910987654', 'Santos', '2002-04-19', 'Brasileira'),
(default, 'Bruno Rodrigues', '11999887766', 'São Paulo', '1994-12-08', 'Brasileira'),
(default, 'Larissa Martins', '11988776655', 'Jundiaí', '2000-06-21', 'Brasileira');

select * from clientes;

update clientes
set telefone = '119871237432'
where id_cliente = 1;

update clientes
set cidade = 'Rio de Janeiro'
where id_cliente = 1;

update clientes
set cidade = 'Campinas'
where id_cliente = 2;

update clientes
set cidade = 'Guarulhos'
where id_cliente = 3;

delete from clientes
where id_cliente = 4;

delete from clientes
where id_cliente = 8;

select * from pratos;
select * from clientes;

/*DESAFIO*/
/*1*/
alter table pratos
add column nota int unsigned after ingredientes;

/*DESAFIO*/
/*2*/
alter table pratos
modify column detalhes varchar(300);

/*DESAFIO*/
/*3*/
alter table pratos
change column nota avaliado int unsigned;

/*DESAFIO*/
/*4*/
alter table pratos
drop column avaliado;

/*DESAFIO*/
/*5*/
alter table clientes
rename to pessoas;

DESC pratos;
DESC pessoas;

SELECT * FROM pratos;
SELECT * FROM pessoas;

/*DESAFIO*/
/*6*/

create table funcionarios(
id_funcionario int not null auto_increment,
nome varchar(100) not null,
cargo varchar(50),
salario decimal(8,2),
data_admissao date,
cidade varchar(50),
primary key (id_funcionario)
) default charset = utf8;

insert into funcionarios
(id_funcionario, nome, cargo, salario, data_admissao, cidade)
values
(default, 'Carlos Almeida', 'Analista de Sistemas', 4500.00, '2022-03-15', 'São Paulo'),
(default, 'Mariana Souza', 'Desenvolvedora', 5200.00, '2021-07-20', 'Guarulhos'),
(default, 'Rafael Oliveira', 'Administrador de Redes', 4800.00, '2023-01-10', 'Santo André'),
(default, 'Juliana Santos', 'Analista de Suporte', 3200.00, '2022-11-05', 'Osasco'),
(default, 'Bruno Costa', 'Técnico em Informática', 3500.00, '2024-02-12', 'São Paulo'),
(default, 'Camila Ferreira', 'Gerente de TI', 7500.00, '2020-08-18', 'Campinas'),
(default, 'Lucas Martins', 'Desenvolvedor Web', 5000.00, '2023-06-22', 'São Bernardo do Campo'),
(default, 'Ana Rodrigues', 'Analista de Banco de Dados', 5800.00, '2021-10-04', 'Mogi das Cruzes'),
(default, 'Fernando Lima', 'Técnico de Redes', 3800.00, '2024-01-29', 'Santos'),
(default, 'Beatriz Carvalho', 'Estagiária de TI', 1800.00, '2025-03-03', 'Jundiaí');

update funcionarios
set nome = 'Bruss Loza'
where id_funcionario = 1;

update funcionarios
set salario = '7500.00'
where id_funcionario = 1;

delete from funcionarios
where id_funcionario = 6;

select * from funcionarios;