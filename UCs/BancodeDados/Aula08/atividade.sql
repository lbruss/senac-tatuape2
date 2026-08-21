select * from estudantes;





select nome from estudantes
where nacionalidade = 'Brasileira'
order by nome;

select * from estudantes
where nascimento between '1998-01-01' and '2000-12-31'
order by nascimento;

select nome, profissao, sexo from estudantes
where profissao = 'Empresário'
order by nome;

select nome, sexo, nacionalidade from estudantes
where nome like 'A%' and sexo = 'f' and nacionalidade = 'Brasileira';

select nome, nacionalidade, sexo, peso from estudantes
where sexo = 'm' and peso < 80 and nacionalidade not like 'brasileiro';





select max(altura) from estudantes 
where sexo = 'm' and nacionalidade = 'Brasileiro';

select avg(peso) from estudantes;

select avg(peso) from estudantes
where sexo = 'f';

select min(peso) from estudantes 
where sexo = 'f' and nacionalidade not like 'Brasileira' and nascimento between '1998-01-01' and '2000-12-31';

select count(altura) from estudantes
where sexo = 'f' and altura > 1.60;





select max(peso) from estudantes 
where sexo = 'm' and nacionalidade not like 'Brasileiro';

select avg(altura) from estudantes
where sexo = 'f' and nacionalidade = 'Brasileira';

select count(profissao) from estudantes
where nacionalidade like 'Br%' and profissao like 'Prof%';

select min(carga) from cursos
where ano = 2025;

select sum(carga) from cursos
where ano = 2028;
