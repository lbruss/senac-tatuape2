create database cadastro; /*criar banco*/

use cadastro;/*selecionar o banco*/

create table pessoas( /*criar tabela*/
nome varchar(30),
idade int(11),
sexo char(1),
peso float,
altura float,
nacionalidade varchar(30)
);

describe pessoas;/*estrutura da tabela*/

drop table pessoas; /*apaga tabela*/

drop database cadastro; /*apaga todo o banco*/

/*-------------------------------------------*/

/*Melhorando o Banco de Dados*/
create database cadastro
default character set utf8
default collate utf8_general_ci;

use cadastro;

create table pessoas(
id int not null auto_increment,
nome varchar(50) not null,
nascimento date,
sexo enum('f','m','o'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(30) default 'Brasileiro',
primary key (id)
) default charset = utf8;

describe pessoas;

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Bruss','2007-05-29','m','70.00','1.65','Boliviano');

select * from pessoas;

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
('1','Bruss','2007-05-29','m','70.00','1.65','Boliviano');


insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default,'Bruss','2007-05-29','m','70.00','1.65','Boliviano');

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default,'Bruss','2007-05-29','m','70.00','1.65','Boliviano'),
(default,'Jorge','2008-03-24','m','65.00','1.87',default),
(default,'Ana','2013-03-24','f','40.00','1.45',default),
(default,'Ruan','2007-09-13','m','80.00','1.75',Marroquino),
(default,'Daniel Vieira','2006-10-29','o','58.00','1.78',Espanhol),
(default,'Wellington','2008-03-24','m','72.00','1.71',default);



















/*Alterar a estrutura da tabela*/
use cadastro;

create table pessoas(
id int not null auto_increment,
nome varchar(50) not null,
nascimento date,
sexo enum('f','m','o'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(30) default 'Brasileiro',
primary key (id)
) default charset = utf8;

alter table pessoas
add column profissao varchar(20);

describe pessoas;

select * from pessoas;

/*Mudar a coluna de lugar*/
alter table pessoas
drop column profissao;

alter table pessoas
add column profissao varchar(20) after nome;

desc pessoas;


/*Mudar a coluna para primeiro*/
alter table pessoas
add column codigo int first;

alter table pessoas
drop column codigo;


/*Mudar o tipo*/
alter table pessoas
modify column profissao varchar(30) not null default '';

/*Mudar o tipo caso truncar, ou se tiver ja dados*/
alter table pessoas
modify column profissao varchar(30) not null default '';

/*Mudar o nome da coluna da tabela*/
alter table pessoas
change column profissao prof varchar(30) not null default '';

desc pessoas;

/*Mudar o nome da tabela*/
alter table estudates
rename to estudantes;

desc estudantes;

select * from estudantes;
