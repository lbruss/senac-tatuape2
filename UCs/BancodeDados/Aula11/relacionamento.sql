/*n-para-um*/
alter table estudantes
add column cursoprefere int;

desc estudantes;

alter table estudantes
add foreign key (cursoprefere)
references cursos(idcurso);

update estudantes set cursoprefere = 1
where id = 20;

select * from estudantes;

update estudantes set cursoprefere = 2
where id = 5;

select * from estudantes;

delete from cursos
where idcurso = 2;

delete from cursos
where idcurso = 30;

select * from cursos;

select nome, cursoprefere from estudantes;
select idcurso, nome, ano from cursos;

select estudantes.nome, estudantes.cursoprefere, cursos.idcurso, cursos.nome, cursos.ano
from estudantes
join cursos
on cursos.idcurso = estudantes.cursoprefere;

select estudantes.nome, cursos.nome, cursos.ano
from estudantes
join cursos
on cursos.idcurso = estudantes.cursoprefere;

/*Apelidos para tabelas*/

select e.nome, c.nome, c.ano
from estudantes as e
join cursos as c
on c.idcurso = e.cursoprefere
order by e.nome;
/*=====================*/

select e.nome, c.nome, c.ano
from estudantes as e
left join cursos as c
on c.idcurso = e.cursoprefere
order by e.nome;

select e.nome, c.nome, c.ano
from estudantes as e
left outer join cursos as c
on c.idcurso = e.cursoprefere
order by e.nome;

select e.nome, c.nome, c.ano
from estudantes as e
right join cursos as c
on c.idcurso = e.cursoprefere
order by e.nome;

select e.nome, c.nome, c.ano
from estudantes as e
right outer join cursos as c
on c.idcurso = e.cursoprefere
order by e.nome;

drop database cadastro;