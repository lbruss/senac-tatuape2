# Relacionamento Muitos-para-Muitos (N:N)

Nesta etapa, vou trabalhar com o relacionamento entre as tabelas **`estudantes`**, **`cursos`** e a tabela intermediária **`prefere`**.

O objetivo é entender como relacionar vários estudantes a vários cursos usando **chaves estrangeiras**, **JOINs** e uma **tabela associativa**.

---

**Relembrando o relacionamento N:N**

Temos duas entidades principais:

* **Estudantes**
* **Cursos**

Um estudante pode estar relacionado a vários cursos.

- **Por exemplo:**

> Bruss pode fazer Algoritmos, Banco de Dados e JavaScript.

Ao mesmo tempo, um curso pode ter vários estudantes:

> O curso de Algoritmos pode ter Bruss, Ana, Carlos, João etc.

Portanto:

```
ESTUDANTE N ───── N CURSO
```

Isso é um relacionamento:

> **Muitos-para-Muitos (N:N)**

O problema é que não podemos simplesmente colocar uma chave estrangeira em apenas uma das duas tabelas para representar corretamente todos esses relacionamentos.

Por isso, criamos uma **terceira tabela**.

---

## Tabela intermediária `prefere`

A tabela `prefere` funciona como uma espécie de **ponte** entre estudantes e cursos.

Ela terá:

* o ID do estudante;
* o ID do curso;
* a data do relacionamento;
* seu próprio identificador.

```sql
create table prefere(
    idpref int auto_increment primary key,
    datas date,
    idest int,
    idcurso int,
    foreign key (idest) references estudantes(id),
    foreign key (idcurso) references cursos(idcurso)
) default charset = utf8;
```

**Destrinchando**

**`create table prefere`**

Cria uma nova tabela chamada `prefere`.

Essa tabela não representa exatamente uma pessoa ou um curso.

Ela representa **o relacionamento entre eles**.

---

**`idpref int auto_increment primary key`**

```sql
idpref int auto_increment primary key
```

Cria o identificador da própria tabela.

* `idpref` → nome da coluna.
* `int` → número inteiro.
* `auto_increment` → o MySQL gera automaticamente o próximo número.
* `primary key` → identifica exclusivamente cada registro.

- **Por exemplo:**

| idpref | idest | idcurso |
| -----: | ----: | ------: |
|      1 |     1 |       2 |
|      2 |     2 |       5 |
|      3 |     3 |      10 |

---

**`datas date`**

```sql
datas date
```

Armazena a data em que o relacionamento foi registrado.

- **Exemplo:**

```
2026-08-31
```

O tipo `DATE` representa uma data no formato:

```
AAAA-MM-DD
```

---

**`idest int`**

```sql
idest int
```

Armazena o ID do estudante.

Esse valor será relacionado à coluna:

```
estudantes.id
```

---

**`idcurso int`**

```sql
idcurso int
```

Armazena o ID do curso.

Esse valor será relacionado à coluna:

```
cursos.idcurso
```

---

##  Chaves estrangeiras

Agora aparecem duas partes muito importantes:

```sql
foreign key (idest) references estudantes(id),
foreign key (idcurso) references cursos(idcurso)
```

**Primeira chave estrangeira**

```sql
foreign key (idest) references estudantes(id)
```

Significa:

> O valor colocado em `prefere.idest` precisa corresponder a um ID existente em `estudantes.id`.

- **Por exemplo:**

```
idest = 1
```

significa que estamos falando do estudante cujo:

```
estudantes.id = 1
```

---

**Segunda chave estrangeira**

```sql
foreign key (idcurso) references cursos(idcurso)
```

Significa:

> O valor colocado em `prefere.idcurso` precisa corresponder a um curso existente em `cursos.idcurso`.

Assim conseguimos ligar:

```
estudante → prefere → curso
```

---

# Visualizando a estrutura

Podemos imaginar:

```
┌──────────────┐
│  estudantes  │
├──────────────┤
│ id           │
│ nome         │
│ ...          │
└──────┬───────┘
       │
       │ 1
       │
       │ N
┌──────▼───────┐
│    prefere   │
├──────────────┤
│ idpref       │
│ datas        │
│ idest        │
│ idcurso      │
└──────┬───────┘
       │
       │ N
       │
       │ 1
┌──────▼───────┐
│    cursos    │
├──────────────┤
│ idcurso      │
│ nome         │
│ ...          │
└──────────────┘
```

O relacionamento original:

```
N : N
```

foi transformado em:

```t
1 : N       N : 1
```

Isso é exatamente o que fazemos com um relacionamento muitos-para-muitos em um banco relacional.

---

# Inserindo relacionamentos

Agora podemos preencher a tabela `prefere`:

```sql
insert into prefere
(idpref, datas, idest, idcurso)
values
(default, '2026-08-31', 1, 2),
(default, '2026-08-28', 2, 5),
(default, '2026-08-25', 3, 10),
(default, '2026-08-24', 4, 25);
```

Aqui estamos criando **quatro relacionamentos**.

Podemos interpretar:

| idpref | data       | estudante | curso |
| -----: | ---------- | --------: | ----: |
|      1 | 2026-08-31 |         1 |     2 |
|      2 | 2026-08-28 |         2 |     5 |
|      3 | 2026-08-25 |         3 |    10 |
|      4 | 2026-08-24 |         4 |    25 |

O importante é perceber que `prefere` não guarda o nome do estudante nem o nome do curso.

Ela guarda os **IDs**.

Isso evita ficar repetindo informações.

---

# Consultando estudantes + `prefere`

Podemos juntar `estudantes` com `prefere`:

```sql
select * from estudantes
join prefere
on estudantes.id = prefere.idest;
```

**O que está acontecendo?**

**`select *`**

```sql
select *
```

Pede todas as colunas selecionadas pelas tabelas envolvidas.

**`from estudantes`**

```sql
from estudantes
```

Define `estudantes` como a tabela principal da consulta.

**`join prefere`**

```sql
join prefere
```

Diz:

> Quero juntar a tabela `estudantes` com a tabela `prefere`.

**`on`**

```sql
on estudantes.id = prefere.idest;
```

Define **como as tabelas serão relacionadas**.

Estamos dizendo:

```
estudantes.id
       =
prefere.idest
```

---

# Consultando cursos + `prefere`

Podemos fazer a mesma coisa com cursos:

```sql
select * from cursos
join prefere
on cursos.idcurso = prefere.idcurso;
```

Agora o relacionamento é:

```
cursos.idcurso
       =
prefere.idcurso
```

Assim descobrimos quais cursos estão relacionados aos registros da tabela `prefere`.

---

# Selecionando somente as informações necessárias

Não precisamos sempre utilizar:

```sql
select *
```

Podemos escolher exatamente o que queremos visualizar.

```sql
select e.nome, e.id, p.idest, p.datas
from estudantes as e
join prefere as p
on e.id = p.idest;
```

Aqui usamos **apelidos para as tabelas**.

---

# Apelidos com `AS`

```sql
from estudantes as e
```

Significa:

> Durante essa consulta, posso chamar `estudantes` simplesmente de `e`.

E:

```sql
join prefere as p
```

significa:

> Durante essa consulta, posso chamar `prefere` de `p`.

Assim:

```sql
e.nome
```

é:

```
estudantes.nome
```

E:

```sql
p.datas
```

é:

```
prefere.datas
```

Isso deixa consultas grandes muito mais fáceis de escrever e ler.

---

# Juntando as três tabelas

Agora chegamos à parte mais importante.

Queremos descobrir:

> **Qual estudante está relacionado a qual curso?**

Temos três tabelas:

```
estudantes
     ↓
   prefere
     ↓
   cursos
```

Então fazemos:

```sql
select * from estudantes
join prefere
on estudantes.id = prefere.idest
join cursos
on cursos.idcurso = prefere.idcurso
order by estudantes.nome;
```

**Destrinchando**

Primeiro:

```sql
from estudantes
```

Começamos pela tabela dos estudantes.

Depois:

```sql
join prefere
on estudantes.id = prefere.idest
```

Encontramos os relacionamentos daquele estudante.

Depois:

```sql
join cursos
on cursos.idcurso = prefere.idcurso
```

Encontramos o curso correspondente.

Por fim:

```sql
order by estudantes.nome;
```

Organizamos o resultado pelo nome do estudante.

---

## Consulta mais limpa

Em vez de mostrar todas as colunas:

```sql
select *
```

podemos mostrar somente aquilo que interessa:

```sql
select estudantes.nome, cursos.nome
from estudantes
join prefere
on estudantes.id = prefere.idest
join cursos
on cursos.idcurso = prefere.idcurso
order by estudantes.nome;
```

O resultado será conceitualmente parecido com:

| Estudante                   | Curso                                |
| --------------------------- | ------------------------------------ |
| Ana Beatriz Almeida Souza   | Excel Essencial                      |
| Carlos Eduardo Pereira Lima | Formação Excel do Básico ao Avançado |
| ...                         | ...                                  |

Agora o banco não está mostrando apenas IDs.

Ele está **cruzando as informações das três tabelas** para produzir uma informação útil.

---

# A ideia mais importante do `JOIN`

É importante entender o `JOIN` como uma operação de **ligação entre informações**.

Imagine três fichas:

```text
Ficha do estudante
        ↓
"ID 5"
        ↓
Ficha de relacionamento
        ↓
"ID do curso 10"
        ↓
Ficha do curso
        ↓
"PHP Básico"
```

O banco percorre essas relações e consegue responder:

> O estudante de ID 5 está relacionado ao curso de ID 10, cujo nome é PHP Básico.

Ou seja, o banco **não precisa repetir o nome do curso dentro da tabela de estudantes**.

Ele guarda apenas a referência.

---

**DER desse relacionamento**

Depois de criar as três tabelas, podemos visualizar o relacionamento no **DER — Diagrama Entidade-Relacionamento** do MySQL Workbench.

A estrutura será aproximadamente:

```
ESTUDANTES
    │
    │ 1
    │
    │ N
PREFERE
    │
    │ N
    │
    │ 1
CURSOS
```

O relacionamento original:

```
ESTUDANTES N : N CURSOS
```

foi dividido:

```
ESTUDANTES 1 : N PREFERE
```

e:

```
PREFERE N : 1 CURSOS
```

Essa transformação permite representar corretamente um relacionamento N:N dentro do modelo relacional.

---

## Resumo das chaves

Neste exemplo temos:

**Tabela `estudantes`**

```sql
id
```

é a **chave primária**.

---

**Tabela `cursos`**

```sql
idcurso
```

é a **chave primária**.

---

**Tabela `prefere`**

```sql
idpref
```

é a **chave primária**.

E:

```sql
idest
```

é uma **chave estrangeira** para:

```sql
estudantes(id)
```

Enquanto:

```sql
idcurso
```

é uma **chave estrangeira** para:

```sql
cursos(idcurso)
```

Portanto:

```
prefere.idest
      ↓
estudantes.id
```

e:

```
prefere.idcurso
      ↓
cursos.idcurso
```

---

**Por que não colocar tudo em `estudantes`**

Imagine que fizéssemos:

```
estudantes

id | nome | curso
```

O problema apareceria quando um estudante fizesse vários cursos.

Teríamos algo como:

```
1 | Bruss | Algoritmos, MySQL, JavaScript
```

Isso não representa bem um modelo relacional.

Ou poderíamos repetir o estudante:

```
1 | Bruss | Algoritmos
1 | Bruss | MySQL
1 | Bruss | JavaScript
```

Agora estamos repetindo dados do estudante.

A tabela intermediária resolve isso:

```
estudantes
1 | Bruss

prefere
1 | 1 | 2
2 | 1 | 5
3 | 1 | 10

cursos
2 | Excel Essencial
5 | Formação Excel...
10 | PHP Básico
```

O estudante aparece **uma vez** e seus relacionamentos ficam registrados separadamente.

---

# Conceito de normalização

Essa organização está relacionada à ideia de **normalização de bancos de dados**.

A normalização busca, entre outras coisas:

* reduzir repetição de dados;
* evitar inconsistências;
* organizar as informações;
* separar entidades diferentes;
* facilitar alterações;
* manter os relacionamentos através de chaves.

Por exemplo, se o nome de um curso mudar, não precisamos alterar o nome em dezenas de registros de estudantes.

Alteramos apenas:

```
cursos.nome
```

Os relacionamentos continuam apontando para o mesmo `idcurso`.

---

# Consulta final recomendada

Para visualizar os estudantes e os cursos relacionados, uma consulta bem organizada seria:

```sql
select
    estudantes.nome,
    cursos.nome
from estudantes
join prefere
    on estudantes.id = prefere.idest
join cursos
    on cursos.idcurso = prefere.idcurso
order by estudantes.nome;
```

**Linha por linha**

```sql
select
```

Define quais informações queremos mostrar.

```sql
estudantes.nome,
```

Mostra o nome do estudante.

```sql
cursos.nome
```

Mostra o nome do curso.

```sql
from estudantes
```

Começa a consulta pela tabela `estudantes`.

```sql
join prefere
```

Junta os relacionamentos registrados na tabela intermediária.

```sql
on estudantes.id = prefere.idest
```

Liga o estudante ao seu registro na tabela `prefere`.

```sql
join cursos
```

Depois junta a tabela de cursos.

```sql
on cursos.idcurso = prefere.idcurso
```

Liga o relacionamento ao curso correspondente.

```sql
order by estudantes.nome;
```

Ordena o resultado pelo nome do estudante.

---

**Resumo Relâmpago**

1. **N:N** significa muitos-para-muitos.
2. Um estudante pode estar relacionado a vários cursos.
3. Um curso pode estar relacionado a vários estudantes.
4. Para representar N:N, criamos uma **tabela intermediária**.
5. Neste exemplo, a tabela intermediária é `prefere`.
6. `idest` é chave estrangeira para `estudantes.id`.
7. `idcurso` é chave estrangeira para `cursos.idcurso`.
8. O `JOIN` combina informações relacionadas entre tabelas.
9. `ON` determina quais colunas serão usadas para fazer a ligação.
10. Três tabelas permitem transformar N:N em dois relacionamentos **1:N**.
