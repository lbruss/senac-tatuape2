select * from estudantes;

/*1*/
select profissao, count(*) from estudantes
group by profissao;-

/*2a*/
select * from estudantes
where nascimento > '2000-01-01';

/*2b*/
select sexo, count(*) from estudantes
where nascimento > '2000-01-01'
group by sexo;

/*3*/
select nacionalidade, count(*) from estudantes
where nacionalidade <> 'Brasileiro' and nacionalidade <> 'Brasileira'
group by nacionalidade;

/*4a*/
select avg(altura) from estudantes;

/*4b*/
select * from estudantes
where peso > 80;

/*4c*/
select altura, count(*) from estudantes
where peso > 80
group by altura;

/*4d*/
select altura, count(*) from estudantes
where peso > 80 and altura > (select avg(altura) from estudantes)
group by altura;

/*6*/
select carga, count(*) from cursos
group by carga
having count(*) >= 2;

/*7*/
select ano, avg(carga) from cursos
group by ano;

/*8*/
select ano, count(*) from cursos
group by ano
having count(*) > 15;

/*9*/
select nome, carga from cursos
where carga > (select avg(carga) from cursos);

/*10*/
select ano, sum(totalaulas) from cursos
group by ano;

/*11*/
select profissao, count(*) from estudantes
group by profissao
having count(*) > 1;

/*12*/
select sexo, avg(altura) from estudantes
group by sexo;

/*13*/
select nome, totalaulas from cursos
where totalaulas > (select avg(totalaulas) from cursos);

/*14*/
select ano, avg(carga) from cursos
group by ano
having avg(carga) > (select avg(carga) from cursos);