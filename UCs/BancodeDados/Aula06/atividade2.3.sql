/*================================ATIVIDADE 5================================*/
create database clinica
default character set utf8
default collate utf8_general_ci;

use clinica;

create table pacientes(
id int not null auto_increment,
nome varchar(100) not null,
nascimento date,
sexo enum('m','f','o'),
peso decimal(6,2),
altura decimal(3,2),
cidade varchar(50),
nacionalidade varchar(50) default 'Brasileiro',
primary key (id)
) default charset = utf8;

desc pacientes;

insert into pacientes
(id, nome, nascimento, sexo, peso, altura, cidade, nacionalidade)
values
(default, 'João Silva', '1990-05-12', 'M', 78.50, 1.78, 'São Paulo', 'Brasileira'),
(default, 'Maria Santos', '1985-08-23', 'F', 65.20, 1.65, 'Guarulhos', 'Brasileira'),
(default, 'Carlos Oliveira', '1992-03-17', 'M', 82.30, 1.82, 'Santo André', 'Brasileira'),
(default, 'Ana Souza', '1998-11-05', 'F', 58.70, 1.62, 'Osasco', 'Brasileira'),
(default, 'Pedro Costa', '1987-07-28', 'M', 90.10, 1.85, 'Campinas', 'Brasileira'),
(default, 'Juliana Lima', '1995-01-14', 'F', 62.40, 1.68, 'Santos', 'Brasileira'),
(default, 'Rafael Almeida', '1991-09-30', 'M', 75.80, 1.75, 'São Bernardo do Campo', 'Brasileira'),
(default, 'Camila Ferreira', '2000-04-19', 'F', 55.60, 1.60, 'Mogi das Cruzes', 'Brasileira'),
(default, 'Bruno Rodrigues', '1989-12-08', 'M', 85.90, 1.80, 'Jundiaí', 'Brasileira'),
(default, 'Larissa Martins', '1997-06-21', 'F', 68.30, 1.70, 'São Paulo', 'Brasileira');

select * from pacientes;

alter table pacientes
add column email varchar(100) after nome;

alter table pacientes
modify column email varchar(80);

alter table pacientes
change column email contato varchar(80);

alter table pacientes
add column telefone varchar(100) after contato;

alter table pacientes
add column cpf int first;

alter table pacientes
drop column cpf;

select * from pacientes;

update pacientes
set peso = '70.50'
where id = 2;

update pacientes
set cidade = 'São Paulo'
where id = 4;

update pacientes
set nacionalidade = 'Portuguesa'
where id = 6;

update pacientes
set telefone = '11937284894'
where id = 3;

update pacientes
set nacionalidade = 'Chinesa', cidade = 'São Paulo'
where id = 5;

select * from pacientes;

delete from pacientes
where id = 10;

delete from pacientes
where id = 8;

select * from pacientes;

/*
•	Qual comando foi utilizado para excluir registros? 
R:Comando DELETE
•	Qual é a diferença entre DELETE e DROP TABLE? 
R: DELETE remove registros, o comando DROP TABLE remove completamente a tabela.
*/

TRUNCATE TABLE pacientes;

select * from pacientes;

insert into pacientes
(id, nome, contato, telefone, nascimento, sexo, peso, altura, cidade, nacionalidade)
values
(default, 'João Silva', 'joao@gmail.com', '11234542334', '1990-05-12', 'M', 78.50, 1.78, 'São Paulo', 'Brasileira');

select * from pacientes;

/*
Explique o que aconteceu com o AUTO_INCREMENT.
R: Foi preenchido com o número 1, automaticamente
*/

create table medicos(
id_medico int not null auto_increment,
nome varchar(100) not null,
especialidade varchar(100),
telefone varchar(15),
cidade varchar(50),
salario decimal(8,2),
primary key (id_medico)
) default charset = utf8;

insert into medicos
(id_medico, nome, especialidade, telefone, cidade, salario)
values
(default, 'Dr. Ricardo Mendes', 'Cardiologia', '11987654321', 'São Paulo', 12500.00),
(default, 'Dra. Fernanda Alves', 'Pediatria', '11976543210', 'Guarulhos', 10800.00),
(default, 'Dr. Marcelo Costa', 'Ortopedia', '11965432109', 'Santo André', 13200.00),
(default, 'Dra. Juliana Martins', 'Dermatologia', '11954321098', 'Osasco', 11800.00),
(default, 'Dr. Gustavo Oliveira', 'Neurologia', '11943210987', 'Campinas', 14500.00),
(default, 'Dra. Camila Souza', 'Ginecologia', '11932109876', 'Santos', 11200.00),
(default, 'Dr. Rafael Almeida', 'Clínica Geral', '11921098765', 'São Bernardo do Campo', 9500.00),
(default, 'Dra. Beatriz Ferreira', 'Oftalmologia', '11910987654', 'Mogi das Cruzes', 12100.00);

select * from medicos;

update medicos
set salario = '13500.00'
where id_medico = 1;

update medicos
set salario = '11200.00'
where id_medico = 2;

update medicos
set especialidade = 'Neurologia'
where id_medico = 1;

update medicos
set especialidade = 'Dermatologia'
where id_medico = 2;

delete from medicos
where id_medico = 8;

delete from medicos
where id_medico = 7;