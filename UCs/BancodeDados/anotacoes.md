# 📚 Banco de Dados — Biblioteca: Chaves Estrangeiras e Relacionamentos

Nesta atividade, pratiquei **chaves estrangeiras** no banco `biblioteca`. Primeiro, relacionei **livros** com **autores** e, depois, criei uma tabela própria para **categorias** e substituí a categoria armazenada diretamente em `livros` por uma referência à nova tabela.

---

# 1. 🗄️ Selecionando o banco

```sql
use biblioteca;
```

O comando `USE` define qual banco de dados será utilizado pelos próximos comandos.

Neste caso:

```text
biblioteca
```

passa a ser o banco ativo.

Isso é importante porque comandos como `CREATE TABLE`, `ALTER TABLE`, `INSERT` etc. serão executados dentro desse banco.

---

# 2. ✍️ Criando a tabela `autores`

```sql
create table autores(
    id_autor int not null auto_increment,
    nome varchar(100) not null,
    nacionalidade varchar(50),
    data_nascimento date,
    primary key (id_autor)
) default charset = utf8;
```

Essa tabela representa a entidade **Autor**.

## Estrutura

| Campo             | Tipo           | Função                 |
| ----------------- | -------------- | ---------------------- |
| `id_autor`        | `INT`          | Identificador do autor |
| `nome`            | `VARCHAR(100)` | Nome do autor          |
| `nacionalidade`   | `VARCHAR(50)`  | Nacionalidade          |
| `data_nascimento` | `DATE`         | Data de nascimento     |

### `id_autor`

```sql
id_autor int not null auto_increment
```

* `INT` → número inteiro.
* `NOT NULL` → não pode ficar vazio.
* `AUTO_INCREMENT` → o MySQL gera automaticamente o próximo número.

E:

```sql
primary key (id_autor)
```

define `id_autor` como **chave primária**.

Assim, cada autor possui um identificador único.

---

# 3. 🔍 Verificando a tabela

```sql
desc autores;
```

`DESC` é uma forma abreviada de `DESCRIBE`.

Ele mostra a **estrutura da tabela**, incluindo:

* campos;
* tipos;
* possibilidade de `NULL`;
* chaves;
* valores padrão;
* outras propriedades.

Já:

```sql
select * from autores;
```

mostra os **registros** existentes.

---

# 4. ➕ Inserindo os autores

```sql
insert into autores
(id_autor, nome, nacionalidade, data_nascimento)
values
(default, 'J.K. Rowling', 'Britânica', '1965-07-31'),
(default, 'Dan Brown', 'Americana', '1964-06-22'),
(default, 'Markus Zusak', 'Australiana', '1975-06-23'),
(default, 'Stephenie Meyer', 'Americana', '1973-12-24'),
(default, 'Suzanne Collins', 'Americana', '1962-08-10'),
(default, 'Rick Riordan', 'Americana', '1964-06-05'),
(default, 'Patrick Rothfuss', 'Americana', '1973-06-06'),
(default, 'John Green', 'Americana', '1977-08-24'),
(default, 'R.J. Palacio', 'Americana', '1963-07-13'),
(default, 'Carlos Ruiz Zafón', 'Espanhola', '1964-09-25');
```

Como `id_autor` é `AUTO_INCREMENT`, usamos:

```sql
default
```

para deixar o MySQL gerar os IDs.

O resultado será semelhante a:

| id_autor | nome              | nacionalidade |
| -------: | ----------------- | ------------- |
|        1 | J.K. Rowling      | Britânica     |
|        2 | Dan Brown         | Americana     |
|        3 | Markus Zusak      | Australiana   |
|      ... | ...               | ...           |
|       10 | Carlos Ruiz Zafón | Espanhola     |

Esses IDs serão importantes posteriormente para criar o relacionamento com `livros`.

---

# 5. 🔗 Adicionando o autor à tabela `livros`

Agora a tabela `livros` precisa ter uma coluna capaz de guardar **qual autor escreveu cada livro**.

```sql
alter table livros
add column id_autor int;
```

### `ALTER TABLE`

O comando:

```sql
alter table
```

modifica a **estrutura de uma tabela que já existe**.

### `ADD COLUMN`

```sql
add column id_autor int;
```

adiciona uma nova coluna chamada `id_autor`.

Inicialmente, ela é apenas uma coluna `INT`.

Ainda falta dizer ao banco que ela será uma **chave estrangeira**.

---

# 6. 🔑 Criando a chave estrangeira

```sql
alter table livros
add foreign key (id_autor)
references autores(id_autor);
```

Aqui acontece o relacionamento.

Estamos dizendo:

> O valor de `livros.id_autor` deve fazer referência a um valor existente em `autores.id_autor`.

Visualmente:

```text
AUTORES
┌─────────────┐
│ id_autor PK │
│ nome        │
│ ...         │
└──────┬──────┘
       │
       │ 1
       │
       │ N
┌──────▼──────┐
│   LIVROS    │
├─────────────┤
│ id_livro PK │
│ titulo      │
│ ...         │
│ id_autor FK │
└─────────────┘
```

Isso representa:

> **Um autor pode ter vários livros.**

Enquanto cada livro, nesse modelo, referencia um autor.

Portanto:

```text
AUTORES 1 ───── N LIVROS
```

---

# 7. 📚 Inserindo livros com seus autores

Agora podemos cadastrar livros já indicando seus autores:

```sql
INSERT INTO livros
(id_livro, titulo, editora, categoria, paginas, preco, estoque, lingua, ano, disponivel, id_autor)
VALUES
(default, 'Inferno', 'Arqueiro', 'Suspense', 448, 54.90, 14, 'Português', 2013, default, 2),
(default, 'O Mar de Monstros', 'Intrínseca', 'Fantasia', 304, 42.90, 16, 'Português', 2006, default, 6),
(default, 'O Teorema Katherine', 'Intrínseca', 'Romance', 304, 39.90, 10, 'Português', 2006, default, 8);
```

O ponto importante está no último valor de cada registro:

```text
2
6
8
```

Esses números são os IDs dos autores.

Por exemplo:

```text
Inferno → id_autor = 2
```

E o autor com ID 2 é:

```text
Dan Brown
```

Portanto, temos:

```text
Dan Brown
    ↓
Inferno
```

Da mesma maneira:

```text
Rick Riordan
    ↓
O Mar de Monstros
```

e:

```text
John Green
    ↓
O Teorema Katherine
```

---

# 8. 🔗 Criando uma tabela própria para categorias

Na segunda parte da atividade, foi feita uma melhoria na estrutura do banco.

Em vez de guardar diretamente o texto:

```text
categoria = "Fantasia"
```

dentro de `livros`, foi criada uma entidade própria:

```text
categoria
```

```sql
create table categoria(
    id_categoria int not null auto_increment,
    nome varchar(100) not null,
    descricao text,
    primary key (id_categoria)
) default charset = utf8;
```

Agora temos uma tabela específica para armazenar as categorias.

---

# 9. 🏷️ Estrutura da tabela `categoria`

```text
categoria
├── id_categoria
├── nome
└── descricao
```

### `id_categoria`

```sql
id_categoria int not null auto_increment
```

É o identificador único da categoria.

### `nome`

```sql
nome varchar(100) not null
```

Armazena o nome:

```text
Fantasia
Suspense
Drama
Romance
...
```

### `descricao`

```sql
descricao text
```

Permite armazenar uma descrição maior sobre a categoria.

---

# 10. ➕ Inserindo as categorias

```sql
insert into categoria
(id_categoria, nome, descricao)
values
(default, 'Fantasia', 'Livros que apresentam elementos mágicos, mundos imaginários e criaturas fantásticas.'),
(default, 'Suspense', 'Livros que apresentam mistério, tensão e situações que prendem a atenção do leitor.'),
(default, 'Drama', 'Livros que abordam conflitos emocionais, sociais ou pessoais dos personagens.'),
(default, 'Romance', 'Livros que têm relacionamentos amorosos e questões afetivas como parte importante da história.'),
(default, 'Ficção Científica', 'Livros que exploram ciência, tecnologia, futuro e conceitos científicos imaginários ou especulativos.'),
(default, 'Distopia', 'Livros que apresentam sociedades fictícias marcadas por controle, desigualdade ou condições sociais negativas.');
```

O `AUTO_INCREMENT` gera automaticamente:

```text
1 → Fantasia
2 → Suspense
3 → Drama
4 → Romance
5 → Ficção Científica
6 → Distopia
```

---

# 11. 🔄 Alterando a tabela `livros`

Agora precisamos substituir o campo antigo `categoria`.

Primeiro adicionamos a nova coluna:

```sql
alter table livros
add column id_categoria int;
```

Agora `livros` passa a ter:

```text
id_categoria
```

Essa coluna armazenará o ID da categoria.

---

# 12. 🗑️ Removendo a coluna antiga

```sql
alter table livros
drop column categoria;
```

A coluna:

```text
categoria
```

é removida da tabela `livros`.

Antes:

```text
livros
├── id_livro
├── titulo
├── categoria
├── preco
└── ...
```

Depois:

```text
livros
├── id_livro
├── titulo
├── id_categoria
├── preco
└── ...
```

Agora `livros` não guarda mais o nome da categoria diretamente.

Guarda apenas sua referência.

---

# 13. 🔐 Criando a chave estrangeira da categoria

```sql
alter table livros
add constraint fk_livros_categorias
foreign key (id_categoria)
references categoria(id_categoria);
```

Aqui foi usado:

```sql
add constraint
```

para criar uma **restrição** com um nome específico.

O nome escolhido foi:

```text
fk_livros_categorias
```

`fk` é uma abreviação bastante utilizada para **Foreign Key**.

A relação criada é:

```text
categoria.id_categoria
          ↑
          │
          │
livros.id_categoria
```

Ou, visualmente:

```text
CATEGORIA
┌─────────────────┐
│ id_categoria PK │
│ nome            │
│ descricao       │
└────────┬────────┘
         │
         │ 1
         │
         │ N
┌────────▼────────┐
│     LIVROS      │
├─────────────────┤
│ id_livro PK     │
│ titulo          │
│ ...             │
│ id_categoria FK │
└─────────────────┘
```

Portanto:

> Uma categoria pode estar associada a vários livros.

---

# 14. 🧠 O que mudou no banco?

Antes tínhamos algo parecido com:

```text
livros
┌──────────────────────┐
│ titulo               │
│ categoria            │
├──────────────────────┤
│ Inferno              │
│ Suspense             │
│ O Mar de Monstros    │
│ Fantasia             │
└──────────────────────┘
```

A categoria era armazenada diretamente como texto.

Agora temos:

```text
categoria
┌────┬───────────────┐
│ id │ nome          │
├────┼───────────────┤
│ 1  │ Fantasia      │
│ 2  │ Suspense      │
│ 3  │ Drama         │
│ 4  │ Romance       │
└────┴───────────────┘
```

E:

```text
livros
┌───────────────┬──────────────┐
│ titulo        │ id_categoria │
├───────────────┼──────────────┤
│ Inferno       │ 2            │
│ O Mar...      │ 1            │
└───────────────┴──────────────┘
```

Assim:

```text
livros.id_categoria = 2
             ↓
categoria.id_categoria = 2
             ↓
categoria.nome = "Suspense"
```

Esse modelo evita repetir informações e facilita a manutenção do banco.

---

# 15. 🧩 Estrutura final do relacionamento

Ao final dessa atividade, temos pelo menos três entidades relacionadas:

```text
                    ┌──────────────┐
                    │   AUTORES    │
                    ├──────────────┤
                    │ id_autor PK  │
                    │ nome         │
                    │ ...          │
                    └──────┬───────┘
                           │
                           │ 1:N
                           ▼
                    ┌──────────────┐
                    │    LIVROS    │
                    ├──────────────┤
                    │ id_livro PK  │
                    │ titulo       │
                    │ id_autor FK  │
                    │ id_categoria │
                    │ ...          │
                    └──────┬───────┘
                           │
                           │ N:1
                           ▼
                    ┌──────────────┐
                    │  CATEGORIA   │
                    ├──────────────┤
                    │ id_categoria │
                    │ nome         │
                    │ descricao    │
                    └──────────────┘
```

A ideia fundamental é:

```text
AUTORES ───────< LIVROS >─────── CATEGORIA
```

Um autor pode escrever vários livros, e uma categoria pode classificar vários livros.

---

# ⚠️ Um detalhe importante sobre a atividade

Depois de criar:

```sql
id_categoria
```

e remover:

```sql
categoria
```

os livros que já existiam precisam receber seus respectivos `id_categoria` para que a relação fique completa.

Por exemplo:

```sql
update livros
set id_categoria = 2
where titulo = 'Inferno';
```

Aqui:

```text
2 = Suspense
```

Então `Inferno` passa a apontar para a categoria `Suspense`.

Da mesma forma, os demais livros podem receber seus IDs correspondentes.

---

# 🔗 O que aprendemos com essa atividade?

Essa atividade junta vários conceitos que já vimos:

### `CREATE TABLE`

Cria uma tabela.

### `ALTER TABLE`

Modifica a estrutura de uma tabela existente.

### `ADD COLUMN`

Adiciona uma coluna.

### `DROP COLUMN`

Remove uma coluna.

### `PRIMARY KEY`

Identifica exclusivamente cada registro.

### `FOREIGN KEY`

Cria uma ligação entre tabelas.

### `REFERENCES`

Indica qual tabela e qual coluna são referenciadas.

### `CONSTRAINT`

Permite definir uma restrição e dar um nome a ela.

### `AUTO_INCREMENT`

Gera IDs automaticamente.

### `JOIN`

Posteriormente, podemos usar `JOIN` para transformar os IDs novamente em informações úteis, como:

```text
Livro → Autor → Categoria
```

---

# ⚡ Resumo Relâmpago — 10 linhas

1. Criei a tabela `autores` para armazenar os autores.
2. `id_autor` é a chave primária de `autores`.
3. Adicionei `id_autor` à tabela `livros`.
4. Transformei `livros.id_autor` em chave estrangeira.
5. Assim, **um autor pode ter vários livros**.
6. Criei a tabela `categoria` para organizar as categorias.
7. Adicionei `id_categoria` à tabela `livros`.
8. Removi a antiga coluna textual `categoria`.
9. `livros.id_categoria` referencia `categoria.id_categoria`.
10. O banco agora está mais organizado e preparado para relacionamentos entre entidades.

## 🚀 Resumo final

O principal aprendizado dessa atividade é entender que **uma chave estrangeira conecta tabelas**.

Em vez de repetir informações:

```text
Livro → "Suspense"
Livro → "Suspense"
Livro → "Suspense"
```

podemos armazenar uma referência:

```text
Livro → id_categoria = 2
                  ↓
          Categoria → Suspense
```

Da mesma forma:

```text
Livro → id_autor = 2
                 ↓
          Autor → Dan Brown
```

Ou seja, **as tabelas armazenam as informações separadamente e as chaves estrangeiras permitem relacioná-las**. Isso é fundamental para construir bancos de dados relacionais bem estruturados.
