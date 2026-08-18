/*--------------------*/
/* DESAFIO BANCO DE DADOS - VENDAS */
/*--------------------*/

create database vendas;
use vendas;

create table produtos(
codigoProduto int not null auto_increment,
nomeProduto varchar(50) not null,
precoProduto decimal(10,2) not null,
primary key (codigoProduto)
);

describe produtos;

insert into produtos
(codigoProduto, nomeProduto, precoProduto)
values
(default,'Arroz','23.50'),
(default,'Feijão','50.00'),
(default,'Salgadinho','12.00'),
(default,'Café','70.00'),
(default,'Chocolate','40.00'),
(default,'Picanha','100.99'),
(default,'Frango','32.40'),
(default,'Chiclete','10.50'),
(default,'Sorvete','49.99'),
(default,'Refrigerante','20.78');

select * from produtos;