/*18/09/2026*/
create database pizzaria
default character set utf8
default collate utf8_general_ci;

use pizzaria;

create table clientes(
idCliente int not null auto_increment,
nome varchar(100) not null,
telefone varchar(20) not null,
email varchar(100),
cidade varchar(50) not null,
idade int,
primary key(idCliente)
) default charset = utf8;

desc clientes;

insert into clientes
(idCliente, nome, telefone, email, cidade, idade)
values
(default, 'Carlos Eduardo Silva', '(11) 98765-1111', 'carlos.silva@email.com', 'São Paulo', 28),
(default, 'Mariana Oliveira', '(11) 98765-2222', 'mariana.o@email.com', 'São Paulo', 34),
(default, 'Lucas Rodrigues', '(11) 98765-3333', 'lucas.rod@email.com', 'Santo André', 22),
(default, 'Fernanda Costa', '(11) 98765-4444', 'fe.costa@email.com', 'São Bernardo do Campo', 45),
(default, 'Rafael Santos', '(11) 98765-5555', 'rafael.santos@email.com', 'São Caetano do Sul', 19),
(default, 'Beatriz Lima', '(11) 98765-6666', 'beatriz.lima@email.com', 'São Paulo', 31),
(default, 'Thiago Almeida', '(11) 98765-7777', 'thiago.a@email.com', 'Osasco', 27),
(default, 'Juliana Pereira', '(11) 98765-8888', 'juliana.p@email.com', 'Guarulhos', 39),
(default, 'Gabriel Souza', '(11) 98765-9999', 'gabriel.souza@email.com', 'São Paulo', 25),
(default, 'Amanda Carvalho', '(11) 98765-0000', 'amanda.c@email.com', 'Campinas', 52);

create table pedidos(
id_pedido int not null auto_increment,
pizza varchar(100) not null,
tamanho varchar(20) not null,
categoria varchar(50),
quantidade int not null,
preco decimal(10,2) not null,
data_pedido date,
statusp varchar(20),
idCliente int not null,
foreign key (idCliente) references clientes(idCliente),
primary key(id_pedido)
) default charset = utf8;

desc pedidos;

