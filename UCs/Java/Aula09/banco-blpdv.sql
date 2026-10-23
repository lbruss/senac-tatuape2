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
