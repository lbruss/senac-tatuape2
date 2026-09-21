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
select * from pedidos;

insert into pedidos
(id_pedido, pizza, tamanho, categoria, quantidade, preco, data_pedido, statusp, idCliente)
values
(default, 'Calabresa', 'Grande', 'Salgada', 1, 45.00, '2026-09-15', 'Entregue', 1),
(default, 'Mussarela', 'Média', 'Salgada', 2, 38.00, '2026-09-15', 'Entregue', 2),
(default, 'Frango com Catupiry', 'Grande', 'Especial', 1, 52.00, '2026-09-16', 'Entregue', 3),
(default, 'Chocolate com Morango', 'Broto', 'Doce', 1, 32.00, '2026-09-16', 'Entregue', 1),
(default, 'Quatro Queijos', 'Grande', 'Salgada', 1, 48.00, '2026-09-17', 'Entregue', 4),
(default, 'Portuguesa', 'Grande', 'Salgada', 1, 46.00, '2026-09-17', 'Entregue', 5),
(default, 'Marguerita', 'Média', 'Vegetariana', 1, 40.00, '2026-09-18', 'Entregue', 6),
(default, 'Calabresa', 'Grande', 'Salgada', 2, 45.00, '2026-09-18', 'Entregue', 2),
(default, 'Romeu e Julieta', 'Broto', 'Doce', 1, 30.00, '2026-09-19', 'Entregue', 7),
(default, 'Pepperoni', 'Grande', 'Especial', 1, 55.00, '2026-09-19', 'Entregue', 8),
(default, 'Atum com Cebola', 'Grande', 'Salgada', 1, 44.00, '2026-09-20', 'Entregue', 3),
(default, 'Frango com Catupiry', 'Média', 'Especial', 1, 48.00, '2026-09-20', 'Entregue', 6),
(default, 'Mussarela', 'Grande', 'Salgada', 1, 42.00, '2026-09-21', 'A caminho', 9),
(default, 'Calabresa', 'Família', 'Salgada', 1, 58.00, '2026-09-21', 'Em preparo', 10),
(default, 'Banana com Canela', 'Média', 'Doce', 1, 35.00, '2026-09-21', 'Em preparo', 1);

select * from pedidos;

select * from clientes
order by nome;

select * from clientes
where cidade = 'São Paulo';

select * from pedidos
where statusp = 'Entregue'
order by data_pedido;

select pizza, tamanho, categoria, quantidade, preco
from pedidos
where categoria = 'Especial';

update pedidos
set statusp = 'Pendente'
where id_pedido = 1;

select * from pedidos;

select clientes.nome, clientes.telefone, pedidos.pizza, pedidos.tamanho, pedidos.quantidade, pedidos.preco, pedidos.statusp
from clientes
inner join pedidos
on pedidos.idCliente = clientes.idCliente;

select clientes.nome, count(pedidos.id_pedido) as quantidade_pedidos
from clientes
inner join pedidos
on clientes.idCliente = pedidos.idCliente
group by clientes.nome;

select sum(quantidade) as total_pizzas_pedidas
from pedidos;
