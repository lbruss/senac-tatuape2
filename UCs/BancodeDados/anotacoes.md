# Modelo Relacional e Relacionamentos em Banco de Dados

Nesta parte comecei a entender como **as tabelas de um banco de dados se relacionam entre si**.

Até agora, eu estava trabalhando principalmente com a criação das tabelas e manipulação dos dados. Agora o foco passa a ser entender **a estrutura do banco como um todo**, incluindo entidades, relacionamentos, cardinalidade, chaves estrangeiras e transações.

---

# Modelo Relacional

O **modelo relacional** é uma forma de organizar os dados em um banco utilizando **tabelas relacionadas entre si**.

Uma tabela normalmente representa uma **entidade** ou um conjunto de entidades do sistema.

Por exemplo, no banco que criei:

```
ESTUDANTES
CURSOS
```

Eu tenho duas entidades principais:

* `estudantes` → informações dos estudantes;
* `cursos` → informações dos cursos.

Cada tabela possui **colunas**, que representam os atributos, e **linhas**, que representam os registros.

- **Exemplo**

```
ESTUDANTES

id | nome | nascimento | profissão
---|------|-------------|-----------
1  | Bruss | 2007-05-29 | ...
2  | João  | 2007-07-10 | ...
```

Aqui:

* `estudantes` → entidade/tabela;
* `id`, `nome`, `nascimento`, `profissão` → atributos;
* cada linha → uma ocorrência/registro;
* cada registro também pode ser chamado de **tupla** no modelo relacional.

> **Importante:** tecnicamente, uma tabela representa uma relação no modelo relacional; "entidade" é um conceito do modelo conceitual/DER. Na prática das aulas, é comum falar que uma tabela representa uma entidade.

---

# As linguagens do SQL

O SQL pode ser dividido em categorias de acordo com o tipo de operação realizada.

**DDL — Data Definition Language**

**Linguagem de Definição de Dados.**

É utilizada para criar e modificar a **estrutura** do banco de dados.

- **Exemplos:**

```sql
CREATE DATABASE cadastro;
```

Cria um banco.

```sql
CREATE TABLE estudantes (...);
```

Cria uma tabela.

```sql
ALTER TABLE estudantes ...;
```

Modifica a estrutura da tabela.

```sql
DROP TABLE estudantes;
```

Exclui uma tabela.

**Resumindo:**

> **DDL = estrutura do banco.**

---

**DML — Data Manipulation Language**

**Linguagem de Manipulação de Dados.**

É utilizada para trabalhar com os **dados que estão dentro das tabelas**.

- **Exemplos:**

```sql
INSERT INTO estudantes (...);
```

Insere registros.

```sql
UPDATE estudantes
SET nome = 'Bruss'
WHERE id = 1;
```

Atualiza registros.

```sql
DELETE FROM estudantes
WHERE id = 1;
```

Exclui registros.

**Resumindo:**

> **DML = manipulação dos dados.**

---

**DQL — Data Query Language**

**Linguagem de Consulta de Dados.**

É utilizada para **consultar informações** no banco.

O principal comando é:

```sql
SELECT
```

- **Exemplo:**

```sql
SELECT * FROM estudantes;
```

Isso significa:

> "Mostre todos os registros da tabela `estudantes`."

Também posso utilizar:

```sql
SELECT nome, profissão
FROM estudantes
WHERE sexo = 'f';
```

Aqui estou fazendo uma consulta mais específica.

**Resumindo:**

> **DQL = consultar dados.**

---

**DCL — Data Control Language**

**Linguagem de Controle de Dados.**

É relacionada ao **controle de acesso e permissões** do banco.

Alguns comandos:

```sql
GRANT
REVOKE
```

- `GRANT`

Concede permissões.

- `REVOKE`

Remove permissões.

Por exemplo, um administrador pode permitir que determinado usuário consulte uma tabela, mas não possa alterá-la.

**Resumindo:**

> **DCL = permissões e controle de acesso.**

---

**DTL — Data Transaction Language**

Também é chamada em muitos materiais de **TCL — Transaction Control Language**.

É utilizada para controlar **transações**.

Uma transação é um conjunto de operações que deve ser tratado como uma unidade.

Os comandos mais conhecidos são:

```sql
COMMIT
ROLLBACK
```

**COMMIT**

Confirma definitivamente as alterações.

**ROLLBACK**

Desfaz alterações que ainda não foram confirmadas.

- **Exemplo conceitual:**

```
Começo da transação
       ↓
Alterações
       ↓
Tudo certo?
   ↙       ↘
 SIM       NÃO
 ↓          ↓
COMMIT    ROLLBACK
 ↓          ↓
Confirma   Desfaz
```

---

# Resumo das categorias

| Categoria   | Significado                                   | Principal finalidade |
| ----------- | --------------------------------------------- | -------------------- |
| **DDL**     | Data Definition Language                      | Estrutura            |
| **DML**     | Data Manipulation Language                    | Manipulação          |
| **DQL**     | Data Query Language                           | Consulta             |
| **DCL**     | Data Control Language                         | Permissões           |
| **DTL/TCL** | Data Transaction/Transaction Control Language | Transações           |

Uma forma fácil de memorizar:

```
DDL  → estrutura
DML  → dados
DQL  → consulta
DCL  → controle
DTL  → transação
```

---

# DER — Diagrama Entidade-Relacionamento

**DER** significa:

> **Diagrama Entidade-Relacionamento**

Ele é uma representação visual do banco de dados.

Em vez de enxergar apenas o código SQL, eu consigo visualizar:

* entidades;
* atributos;
* relacionamentos;
* chaves;
* cardinalidades.

É como se fosse uma **planta do banco de dados**.

Antes de construir uma casa, eu faço a planta.

Da mesma forma, antes ou durante a construção de um banco, posso utilizar o DER para visualizar como as informações estarão organizadas.

---

## Visualizando o DER no MySQL Workbench

No MySQL Workbench posso gerar um diagrama a partir de um banco já existente.

O caminho é:

```
Database
   ↓
Reverse Engineer
   ↓
Next
   ↓
Escolher a conexão
   ↓
Next
   ↓
Selecionar o banco
   ↓
Next
   ↓
Next
   ↓
Finish
```

O Workbench analisa a estrutura existente do banco e gera uma representação visual.

Esse processo é chamado de **engenharia reversa (Reverse Engineering)** porque estou fazendo o caminho:

```
Banco existente
      ↓
Estrutura
      ↓
Diagrama
```

Em vez de:

```
Diagrama
      ↓
Estrutura
      ↓
Banco
```

---

### O problema do nosso banco

Eu tenho:

```
ESTUDANTES
```

e:

```
CURSOS
```

Mas existe um problema.

Eu sei quem são os estudantes:

```
Bruss
João
Douglas
...
```

E sei quais são os cursos:

```
Algoritmos
Excel
PHP
...
```

Mas o banco ainda não sabe:

> **Qual estudante está fazendo qual curso?**

- **Por exemplo:**

```
Bruss → Algoritmos
João → Excel
Douglas → PHP
```

Essa informação representa um **relacionamento** entre as tabelas.

---

# Relacionamento

Um relacionamento indica como duas entidades estão associadas.

- **Por exemplo:**

```
ESTUDANTE ───── CURSO
```

Podemos interpretar:

> Um estudante participa de um curso.

Mas precisamos descobrir **quantos cursos um estudante pode fazer** e **quantos estudantes podem fazer um curso**.

É aí que entra a **cardinalidade**.

---

# Cardinalidade

A **cardinalidade** indica quantas ocorrências de uma entidade podem estar relacionadas com ocorrências de outra entidade.

- **Por exemplo:**

```
1
```

significa **um**.

```
N
```

significa **muitos**.

Também podemos encontrar:

```
0
```

representando nenhuma ocorrência.

Por isso, posso encontrar relacionamentos como:

```
1 : 1
1 : N
N : N
```

---

## Relacionamento 1 : 1

Significa:

> **Um para um.**

Uma ocorrência de uma entidade está relacionada com apenas uma ocorrência da outra.

- **Exemplo:**

```
PESSOA ───── DOCUMENTO
   1            1
```

Uma pessoa pode possuir um determinado registro de documento, e esse registro pertence a uma pessoa.

Nesse tipo de relacionamento, dependendo da regra de negócio, pode fazer sentido manter as informações em uma única tabela.

Mas **não é obrigatório juntar as tabelas**. A decisão depende do modelo e das regras do sistema.

---

## Relacionamento 1 : N

Significa:

> **Um para muitos.**

Uma ocorrência de uma tabela pode estar relacionada a várias ocorrências de outra tabela.

- **Exemplo:**

```text
CLIENTE ───── PEDIDO
   1            N
```

Um cliente pode fazer vários pedidos.

Mas cada pedido pertence a um cliente.

Visualmente:

```
Cliente 1
   ├── Pedido 1
   ├── Pedido 2
   ├── Pedido 3
   └── Pedido 4
```

Esse é um dos relacionamentos mais comuns em bancos de dados.

---

# Chave estrangeira no relacionamento 1 : N

Aqui entra a **Foreign Key (FK)**, ou **chave estrangeira**.

Imagine:

```
CLIENTE
id_cliente
nome
```

e:

```
PEDIDO
id_pedido
data
```

A chave primária do lado `1`:

```
CLIENTE.id_cliente
```

é levada para o lado `N`:

```
PEDIDO.id_cliente
```

Então:

```
CLIENTE
---------
id_cliente ← PK
nome
```

```
PEDIDO
---------
id_pedido ← PK
data
id_cliente ← FK
```

Agora cada pedido consegue indicar **qual cliente fez aquele pedido**.

---

# Chave primária e chave estrangeira

**Primary Key — PK**

A **chave primária** identifica unicamente um registro dentro da própria tabela.

- **Exemplo:**

```sql
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
```

Cada estudante possui um `id` diferente.

---

**Foreign Key — FK**

A **chave estrangeira** é um campo utilizado para criar uma relação com outra tabela.

- **Exemplo:**

```
estudantes
id
nome
```

```
matriculas
id
id_estudante
```

Nesse caso:

```
matriculas.id_estudante
```

pode referenciar:

```
estudantes.id
```

> **Regra importante**

A coluna da FK deve ser compatível com a coluna referenciada, principalmente em tipo e atributos relevantes.

- **Por exemplo:**

```
estudantes.id
INT
```

e:

```
matriculas.id_estudante
INT
```

Além disso, a FK normalmente referencia uma **PK** ou outra chave que tenha uma restrição de unicidade adequada.

---

## Relacionamento N : N

Agora chegamos ao caso mais interessante.

**N : N = muitos para muitos.**

- **No meu exemplo:**

```
ESTUDANTES
      N
      │
      │
      N
    CURSOS
```

Isso significa:

> Um estudante pode fazer vários cursos.

E:

> Um curso pode ter vários estudantes.

- **Por exemplo:**

```
Bruss
 ├── Algoritmos
 ├── Excel
 └── PHP
```

Enquanto:

```
Algoritmos
 ├── Bruss
 ├── João
 └── Douglas
```

Portanto:

```
Estudante → vários cursos
Curso → vários estudantes
```

---

## O problema do N : N

No modelo relacional, não é recomendado representar diretamente esse relacionamento N:N apenas colocando uma FK de um lado no outro.

A solução é criar uma **terceira tabela**.

Essa tabela representa o relacionamento.

- **Por exemplo:**

```
ESTUDANTES
     │
     │ 1
     │
     N
MATRICULAS
     N
     │
     │ 1
     │
   CURSOS
```

Agora o N:N foi transformado em dois relacionamentos 1:N.

---

## Tabela associativa

A tabela criada para representar o relacionamento pode ser chamada de:

```
matriculas
```

Ela pode possuir:

```
id
id_estudante
id_curso
```

- **Por exemplo:**

| id | id_estudante | id_curso |
| -: | -----------: | -------: |
|  1 |            1 |        1 |
|  2 |            1 |        2 |
|  3 |            2 |        1 |
|  4 |            3 |        3 |

Podemos interpretar:

```
Estudante 1 → Curso 1
Estudante 1 → Curso 2
Estudante 2 → Curso 1
Estudante 3 → Curso 3
```

Isso resolve o relacionamento N:N.

---

**Por que o N:N vira duas relações 1:N?**

Antes:

```
ESTUDANTES N : N CURSOS
```

Depois:

```
ESTUDANTES 1 : N MATRICULAS N : 1 CURSOS
```

Ou, olhando individualmente:

```
ESTUDANTES 1 : N MATRICULAS
```

e:

```
CURSOS 1 : N MATRICULAS
```

Portanto, o relacionamento N:N é **resolvido por uma entidade associativa**.

Essa é uma das ideias mais importantes desta parte.

---

# A tabela de relacionamento também pode possuir atributos

A tabela associativa não serve apenas para guardar as duas chaves.

Ela pode possuir informações próprias do relacionamento.

- **Por exemplo:**

```
MATRICULAS
----------------
id
id_estudante
id_curso
data_matricula
status
nota
```

Isso é importante porque:

> `data_matricula`, `status` e `nota` não são necessariamente atributos do estudante ou do curso. Eles são atributos da **relação entre estudante e curso**.

- **Por exemplo:**

```
Bruss → Algoritmos
```

pode ter:

```
data_matricula = 2026-08-26
nota = 8.5
status = 'Ativo'
```

---

# Resumindo as regras de relacionamento

**1 : 1**

```
Tabela A 1 ───── 1 Tabela B
```

Existe uma relação de um para um.

A chave estrangeira pode ser colocada em um dos lados, conforme as regras do sistema.

---

**1 : N**

```
Tabela A 1 ───── N Tabela B
```

A PK do lado `1` é colocada como FK no lado `N`.

```
A
PK
 ↓
B
FK
```

---

**N : N**

```
Tabela A N ───── N Tabela B
```

Crio uma terceira tabela:

```
Tabela A 1 ───── N Tabela Associativa N ───── 1 Tabela B
```

As duas chaves estrangeiras ficam na tabela associativa.

---

# Tuplas

No modelo relacional, uma **tupla** corresponde a uma linha/registro da relação.

- **Por exemplo:**

```text
id | nome | profissão
---|------|-----------
1  | Bruss | Desenvolvedor
```

Essa linha representa uma tupla.

Uma tabela pode possuir:

```
0 tuplas
1 tupla
10 tuplas
1000 tuplas
...
```

As tuplas podem estar relacionadas a outras tuplas através das chaves.

---

# InnoDB

O **InnoDB** é um mecanismo de armazenamento (*storage engine*) do MySQL.

Ele é importante porque oferece recursos como:

* transações;
* `COMMIT`;
* `ROLLBACK`;
* controle de concorrência;
* recuperação após falhas;
* **chaves estrangeiras**.

Por isso, quando estou trabalhando com relacionamentos e integridade referencial, o InnoDB é especialmente importante.

- **Exemplo:**

```sql
CREATE TABLE cursos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;
```

---

# Integridade referencial

Quando utilizo uma chave estrangeira, o banco pode garantir que os relacionamentos sejam válidos.

- **Por exemplo:**

```
estudantes
id = 1
```

e:

```
matriculas
id_estudante = 1
```

Isso é válido porque o estudante `1` existe.

Mas se eu tentar:

```
id_estudante = 999
```

e o estudante `999` não existir, o banco pode impedir essa operação, dependendo das restrições configuradas.

Isso é chamado de **integridade referencial**.

A ideia é evitar registros "órfãos".

---

# ACID

**ACID** reúne quatro propriedades fundamentais das transações em bancos de dados:

```
A → Atomicity
C → Consistency
I → Isolation
D → Durability
```

Em português:

```
A → Atomicidade
C → Consistência
I → Isolamento
D → Durabilidade
```

---

## A — Atomicidade

**Atomicidade** significa:

> A transação acontece por completo ou não acontece.

Imagine uma transferência bancária:

```
Conta A → -R$100
Conta B → +R$100
```

Não pode acontecer apenas a primeira operação.

Se o dinheiro for retirado da conta A, mas não chegar à conta B, teremos um problema.

Então as duas operações devem ser tratadas como uma única transação.

```
Tudo certo
   ↓
COMMIT
   ↓
Confirma tudo
```

Se houver erro:

```
Erro
 ↓
ROLLBACK
 ↓
Desfaz a transação
```

---

## C — Consistência

A transação deve levar o banco de um **estado válido para outro estado válido**.

As regras e restrições do banco devem continuar sendo respeitadas.

- **Por exemplo:**

Se uma coluna possui:

```sql
PRIMARY KEY
```

não posso terminar uma transação criando duas linhas com a mesma chave primária.

A consistência protege as **regras de integridade do banco**.

---

## I — Isolamento

**Isolamento** significa que transações executadas simultaneamente não devem interferir indevidamente umas nas outras.

Imagine duas pessoas acessando e alterando os mesmos dados ao mesmo tempo.

O banco precisa controlar essas operações para evitar resultados inconsistentes.

O MySQL/InnoDB utiliza mecanismos de controle de concorrência e níveis de isolamento para lidar com esse problema.

---

## D — Durabilidade

Depois que uma transação foi confirmada com:

```sql
COMMIT;
```

as alterações devem permanecer gravadas mesmo se ocorrer uma falha posteriormente.

- **Por exemplo:**

```
INSERT
   ↓
COMMIT
   ↓
Dados confirmados
   ↓
Servidor reinicia
   ↓
Dados continuam existindo
```

Essa é a ideia da durabilidade.

---

> Analogia do ACID

Posso imaginar uma compra em uma loja:

**Atomicidade**

A compra inteira acontece ou é cancelada.

**Consistência**

O estoque, pagamento e pedido devem continuar obedecendo às regras.

**Isolamento**

Duas compras simultâneas não devem causar conflito incorreto no estoque.

**Durabilidade**

Depois de confirmar a compra, ela continua registrada mesmo se o sistema reiniciar.

---

# Visão geral

Agora consigo enxergar o banco de dados em vários níveis:

```
BANCO DE DADOS
      │
      ├── Tabelas
      │      │
      │      ├── Colunas → atributos
      │      │
      │      └── Linhas → tuplas/registros
      │
      ├── Chaves
      │      ├── PK → identifica
      │      └── FK → relaciona
      │
      └── Relacionamentos
             │
             ├── 1 : 1
             ├── 1 : N
             └── N : N
                    ↓
              tabela associativa
```

E o DER serve para representar visualmente essa estrutura.

---

**Resumo Relâmpago**

1. **Modelo relacional** organiza dados em tabelas relacionadas.
2. **DDL** define e modifica a estrutura do banco.
3. **DML** insere, altera e exclui dados.
4. **DQL** consulta dados, principalmente com `SELECT`.
5. **DCL** controla permissões de acesso.
6. **DTL/TCL** controla transações, usando comandos como `COMMIT` e `ROLLBACK`.
7. **DER** representa visualmente entidades, atributos e relacionamentos.
8. **Cardinalidade** indica quantas ocorrências podem participar de um relacionamento.
9. `1:N` usa a PK do lado 1 como FK no lado N; `N:N` precisa de uma tabela associativa.
10. **ACID** significa Atomicidade, Consistência, Isolamento e Durabilidade — propriedades fundamentais das transações.
