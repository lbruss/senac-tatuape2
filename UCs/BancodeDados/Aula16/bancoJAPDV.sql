create database japdv
default character set utf8
default collate utf8_general_ci;

use japdv;

create table fornecedores(
idFornecedor int not null auto_increment,
nome varchar(100) not null,
fone varchar(50),
email varchar(100),
primary key(idFornecedor)
) default charset = utf8;

insert into fornecedores
(idFornecedor, nome, fone, email)
values
(default, 'Tech Supplies LTDA', '(11) 987654321', 'contato@techsupplies.com.br'),
(default, 'Distribuidora Silva S/A', '(21) 34567890', 'vendas@distribuidorasilva.com'),
(default, 'Comércio de Embalagens Brasil', '(31) 991234567', 'atendimento@embalagensbrasil.com.br');

select * from fornecedores
order by nome;

create table produtos(
idProduto int not null auto_increment,
codigoBarras varchar(100) unique,
descricao text not null,
categoria varchar(100),
precoCusto decimal(8,2) not null,
precoVenda decimal(8,2) not null,
quantidade int not null,
estoqueMinimo int not null,
idFornecedor int,
foreign key (idFornecedor) references fornecedores(idFornecedor),
primary key(idProduto)
) default charset = utf8;

insert into produtos
(idProduto, codigoBarras, descricao, categoria, precoCusto, precoVenda, quantidade, estoqueMinimo, idFornecedor)
values
(default, '7891234567890', 'Mouse Sem Fio óptico', 'Periféricos', 25.00, 49.90, 20, 5, 1),
(default, '7891234567891', 'Teclado Mecânico RGB', 'Periféricos', 110.00, 199.90, 12, 3, 1),
(default, '7891234567892', 'Suporte Ergonomico para Notebook', 'Acessórios', 35.00, 69.90, 15, 4, 2),
(default, '7891234567893', 'Cabo HDMI 2.0 2 Metros', 'Cabos', 12.00, 29.90, 50, 10, 2),
(default, '7891234567894', 'Caixa de Papelão 30x30x30 (10 Unid)', 'Embalagens', 18.00, 35.00, 100, 20, 3),
(default, '7891234567895', 'Fita Adesiva Transparente 45mm x 45m', 'Embalagens', 4.50, 12.00, 80, 15, 3);

select * from produtos;

select produtos.idProduto, produtos.descricao, produtos.categoria, produtos.precoVenda, produtos.quantidade, produtos.estoqueMinimo, fornecedores.nome as fornecedor
from produtos
inner join fornecedores
on fornecedores.idFornecedor = produtos.idFornecedor;









desc fornecedores;
desc produtos;

drop table produtos;