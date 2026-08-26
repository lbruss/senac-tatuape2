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