create database blpdv
default character set utf8
default collate utf8_general_ci;

use blpdv;

create table fornecedores(
idFornecedor int auto_increment,
nome varchar(50) not null,
fone varchar(20) not null,
email varchar(50),
site varchar(100),
primary key (idFornecedor)
) default charset = utf8;

create table produtos (
idProduto int auto_increment,
codigoBarras varchar(20) unique,
descricao varchar(100) not null,
categoria varchar(50) not null,
precoCusto decimal(10, 2) not null,
precoVenda decimal(10, 2) not null,
quantidade int not null default 0,
estoqueMinimo int not null default 0,
idFornecedor int not null,
primary key (idProduto),
constraint fk_produtos_fornecedores
foreign key(idFornecedor)
references fornecedores(idFornecedor)
) default charset = utf8;

select * from fornecedores;
select * from produtos;