/*================================ATIVIDADE 1================================*/
create database loja
default character set utf8
default collate utf8_general_ci;

use loja;

create table produtos(
id int not null auto_increment,
nome varchar(50) not null,
categoria varchar(50),
preco decimal(5,2),
estoque int unsigned,
origem varchar(30) default 'Nacional',
primary key (id)
) default charset = utf8;

INSERT INTO produtos
(id, nome, categoria, preco, estoque, origem)
VALUES
(default,'Chocolate','Doces','10.00','50','Estados Unidos'),
(default,'Arroz','Cereais','10.00','120',default),
(default,'Coxinha','Frios','25.00','300',default),
(default,'Feijão','Grãos','10.00','400',default),
(default,'Banana','Frutas','15.50','750',default);

alter table produtos
add column descricao varchar(50) after nome;

alter table produtos
modify column descricao varchar(150);

alter table produtos
change column descricao detalhes varchar(150);

alter table produtos
add column codigo_barras int first;

alter table produtos
drop column codigo_barras;

select * from produtos;
desc produtos;

alter table produtos
modify column preco decimal(8,2);

update produtos
set preco = '1499.90'
where id = 3;

update produtos
set categoria = 'Eletrônicos'
where id = 2;

update produtos
set estoque = '50'
where id = 4;

delete from produtos
where id = 5;

select * from produtos;
desc produtos;

truncate table produtos;

INSERT INTO produtos
(id, nome, detalhes, categoria, preco, estoque, origem)
VALUES
(default,'Chocolate','É um chocolate bom :)','Doces','10.00','50','USA');

/*Explique, com suas palavras, a diferença entre:
o	DELETE
R:Remove os registros

o	TRUNCATE
R:Remove TODOS os registros das tabela mas mantém a tabela

o	DROP TABLE
R:Remove completamente a tabela, tabela morreu, nunca mais você recupera ela
*/

create table if not exists clientes(
id int not null auto_increment,
nome varchar(50) not null,
email varchar(100) not null,
cidade varchar(50),
idade int unsigned,
nacionalidade varchar(30) default 'Brasileiro',
primary key (id)
) default charset = utf8;

desc clientes;

INSERT INTO clientes
(id, nome, email, cidade, idade, nacionalidade)
VALUES
(default,'Jorge','jorgesilva@gmail.com','Xique_Xique','23',default),
(default,'Adrade','silvaodrade@gmail.com','São Paulo','32',default),
(default,'Ruan','ruanderson@gmail.com','Guarulhos','37',default),
(default,'Maria','mariandrade@gmail.com','Valinhos','20',default),
(default,'Vivian','vivane@gmail.com','Sertãozinho','57',default);

select * from clientes;
desc clientes;

drop database loja;

create database loja
default character set utf8
default collate utf8_general_ci;

use loja;

select * from clientes;
desc clientes;
select * from produtos;
desc produtos;

delete from clientes
where id = 20;


































/*================================ATIVIDADE 2================================*/
create database petshop
default character set utf8
default collate utf8_general_ci;

use petshop;

create table clientes(
id_cliente int not null auto_increment,
nome varchar(50) not null,
telefone varchar(15),
cidade varchar(50),
estado varchar(50),
primary key (id_cliente)
) default charset = utf8;

INSERT INTO clientes
(id_cliente, nome, telefone, cidade, estado)
VALUES
(default, 'Jorge', '251695392912', 'São Paulo', 'SP'),
(default, 'Mariana', '11987654321', 'São Paulo', 'SP'),
(default, 'Carlos', '11976543210', 'Santo André', 'SP'),
(default, 'Ana', '11965432109', 'São Bernardo do Campo', 'SP'),
(default, 'Lucas', '11954321098', 'Guarulhos', 'SP'),
(default, 'Juliana', '11943210987', 'Osasco', 'SP'),
(default, 'Rafael', '11932109876', 'Mogi das Cruzes', 'SP'),
(default, 'Camila', '11921098765', 'São Paulo', 'SP'),
(default, 'Fernando', '11910987654', 'Santos', 'SP'),
(default, 'Beatriz', '11999887766', 'São Paulo', 'SP'),
(default, 'Gabriel', '11988776655', 'Campinas', 'SP'),
(default, 'Larissa', '11977665544', 'Jundiaí', 'SP'),
(default, 'Pedro', '11966554433', 'São Paulo', 'SP'),
(default, 'Amanda', '11955443322', 'Guarulhos', 'SP'),
(default, 'Bruno', '11944332211', 'Osasco', 'SP'),
(default, 'Isabela', '11933221100', 'Santo André', 'SP'),
(default, 'Diego', '11922110099', 'São Paulo', 'SP'),
(default, 'Letícia', '11911009988', 'São Bernardo do Campo', 'SP'),
(default, 'Matheus', '11990088776', 'Mogi das Cruzes', 'SP'),
(default, 'Carolina', '11980077665', 'Campinas', 'SP');

alter table clientes
add column email varchar(80);

alter table clientes
change column email contato varchar(80);

update clientes
set telefone = '11125121238'
where id_cliente = 3;

delete from clientes
where id_cliente = 20;

select * from clientes;
desc clientes;

/*DESAFIO*/
/*1*/
alter table clientes
add column nascimento date;

/*DESAFIO*/
/*4*/
alter table clientes
rename to clientespet;




create table animais(
id_animal int not null auto_increment,
nome varchar(50) not null,
especie varchar(15),
idade int unsigned,
peso decimal(5,2),
primary key (id_animal)
) default charset = utf8;

INSERT INTO animais
(id_animal, nome, especie, idade, peso)
VALUES
(default, 'Billy', 'cachorro', '5', '30.00'),
(default, 'Thor', 'cachorro', '3', '25.50'),
(default, 'Luna', 'gato', '2', '4.20'),
(default, 'Mel', 'cachorro', '6', '18.75'),
(default, 'Nina', 'gato', '4', '3.80'),
(default, 'Max', 'cachorro', '7', '32.40'),
(default, 'Pipoca', 'coelho', '2', '2.10'),
(default, 'Bob', 'cachorro', '1', '12.30'),
(default, 'Mimi', 'gato', '5', '5.00'),
(default, 'Rex', 'cachorro', '8', '28.60');

alter table animais
add column cor varchar(20);

update animais
set peso = '32.60'
where id_animal = 3;

update animais
set peso = '23.20'
where id_animal = 4;

delete from animais
where id_animal = 10;

select * from animais;
desc animais;

/*DESAFIO*/
/*3*/
alter table animais
drop column peso;















create table servicos(
id_servico int not null auto_increment,
nome varchar(50) not null,
preco decimal(8,2),
duracao varchar(100),
categoria varchar(50),
primary key (id_servico)
) default charset = utf8;

INSERT INTO servicos
(id_servico, nome, preco, duracao, categoria)
VALUES
(default, 'Banho', 50.00, 60, 'Higiene'),
(default, 'Tosa', 70.00, 90, 'Higiene'),
(default, 'Banho e Tosa', 110.00, 120, 'Higiene'),
(default, 'Consulta Veterinária', 150.00, 60, 'Veterinário'),
(default, 'Corte de Unhas', 30.00, 30, 'Estética'),
(default, 'Limpeza de Ouvidos', 40.00, 30, 'Higiene');

alter table servicos
add column ativo enum('Sim','Não') default 'Sim';

update servicos
set preco = '100.00'
where id_servico = 3;

update servicos
set preco = '130.00'
where id_servico = 4;

delete from servicos
where id_servico = 6;

select * from servicos;
desc servicos;

truncate table servicos;

INSERT INTO servicos
(id_servico, nome, preco, duracao, categoria)
VALUES
(default, 'Escova', 20.00, 60, 'Higiene');

/*DESAFIO*/
/*2*/
alter table servicos
modify column preco int unsigned;
