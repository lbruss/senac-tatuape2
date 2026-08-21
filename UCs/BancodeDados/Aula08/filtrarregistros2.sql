/*Filtrar Registros*/
use cadastro;
select * from cursos;
select * from estudantes;

select * from cursos
order by nome;

select * from cursos
order by nome desc;

select nome, carga, ano from cursos
order by nome;

select nome, ano from cursos
order by ano;

select * from cursos
where ano = 2028
order by nome;

select nome, carga from cursos
where ano = 2028
order by nome;

select nome, descricao, totalaulas from cursos
where ano = 2025 /*>=, <=, >, <, <>*/
order by nome;

select nome, carga from cursos
where carga >= 40
order by nome;

select nome, carga, totalaulas from cursos
where carga <= 24
order by nome;

select * from cursos
where totalaulas between 16 and 30
order by nome;

select nome, carga from cursos
where carga in (16,24)
order by nome;

select nome, carga, totalaulas from cursos
where carga > 24 and totalaulas < 16
order by nome;

select nome, carga, totalaulas from cursos
where carga > 24 or totalaulas < 16
order by nome;

select * from cursos
where nome = 'Algoritmos';

select * from cursos
where nome like 'E%';

select * from cursos
where nome like '%E';

select * from cursos
where nome like '-%E%';

select * from cursos
where nome not like '%E%';

select * from cursos
where nome like 'E%L%';

select * from cursos
where nome like 'C%_';

select * from cursos
where nome like 'ph%p_';

select * from cursos
where nome like 'p__T%';

select * from estudantes
where nome like '%silva%';








select * from cursos;

select distinct carga from cursos
order by carga;

select distinct nacionalidade from estudantes
order by nacionalidade;

select count(*) from cursos;

select * from cursos
where carga > 40
order by carga;

select count(*) from cursos
where carga > 40;

select count(*) from estudantes
where nacionalidade > 'Brasileiro';

select max(carga) from cursos;

select max(totalaulas) from cursos
where ano = '2026';

select * from cursos
where ano = 2026
order by totalaulas;

select min(totalaulas) from cursos
where ano = 2026;

select min(totalaulas) from cursos;

select sum(carga) from cursos;

select sum(carga) from cursos
where ano = 2027;

select avg(carga) from cursos;

select avg(totalaulas) from cursos
where ano = 2028;

