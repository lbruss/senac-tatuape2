# Banco de Dados (MySQL) — Chave Primária, AUTO_INCREMENT e Inserção de Registros

# 🎯 Ideia principal

Nesta aula corrigi um problema importante da tabela **pessoas**: a ausência de uma **Chave Primária (Primary Key)**.

Aprendi a criar um campo identificador chamado **id**, configurá-lo como **AUTO_INCREMENT**, inserir registros automaticamente e cadastrar vários dados utilizando um único comando `INSERT`.

Também criei um novo banco de dados chamado **vendas**, contendo uma tabela de produtos.

---

# Revisando o problema da tabela anterior

Na tabela criada anteriormente existia um problema:

Duas pessoas poderiam ser cadastradas várias vezes sem nenhuma forma de diferenciá-las.

Exemplo:

| Nome  | Nascimento |
| ----- | ---------- |
| Bruss | 29/05/2007 |
| Bruss | 29/05/2007 |

Como os dados são iguais, o banco não sabe qual registro é qual.

Em sistemas reais isso gera diversos problemas.

Por isso existe a **Chave Primária**.

---

# O que é uma Chave Primária?

A **Primary Key (PK)** é um campo que identifica cada registro de forma única.

Ela possui duas características principais:

* não pode possuir valores repetidos;
* não pode possuir valores nulos (`NULL`).

Cada linha da tabela terá um identificador exclusivo.

---

## Analogia

Imagine uma sala de aula.

Mesmo que existam dois alunos chamados João, cada um possui um **RA (Registro Acadêmico)** diferente.

O banco de dados funciona da mesma forma.

O nome pode repetir.

O identificador nunca.

---

# Apagando a tabela antiga

Como a tabela foi criada sem uma Chave Primária, o primeiro passo é removê-la.

```sql
DROP TABLE pessoas;
```

## Explicação

### DROP TABLE

Remove completamente uma tabela do banco de dados.

⚠️ Todos os registros armazenados nela serão apagados.

Por isso esse comando deve ser utilizado com cuidado.

---

# Criando uma tabela corretamente

Agora a tabela será recriada com um identificador único.

```sql
CREATE TABLE pessoas (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    sexo ENUM('f','m','o'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(30) DEFAULT 'Brasileiro',
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;
```

---

# Explicação linha por linha

## id INT

Cria uma coluna chamada **id**.

Ela armazenará apenas números inteiros.

---

## NOT NULL

Impede que o campo fique vazio.

Todo registro obrigatoriamente terá um valor.

---

## AUTO_INCREMENT

Esse recurso faz com que o MySQL gere automaticamente um novo número para cada registro inserido.

### Exemplo

Primeira pessoa:

```text
id = 1
```

Segunda:

```text
id = 2
```

Terceira:

```text
id = 3
```

E assim sucessivamente.

O desenvolvedor não precisa controlar essa numeração manualmente.

---

## PRIMARY KEY (id)

Define que o campo **id** será a Chave Primária da tabela.

Isso garante que:

* nenhum ID será repetido;
* cada registro poderá ser identificado individualmente.

---

# Verificando a estrutura

Depois de criar a tabela:

```sql
DESCRIBE pessoas;
```

ou

```sql
DESC pessoas;
```

Esse comando mostra:

* nome das colunas;
* tipo dos dados;
* se aceitam valores nulos;
* qual é a Chave Primária;
* outras características da tabela.

É muito útil para conferir se a estrutura foi criada corretamente.

---

# Inserindo um registro informando o ID

Primeiro exemplo:

```sql
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(1, 'Bruss', '2007-05-29', 'm', 70.00, 1.65, 'Brasileiro');
```

Depois:

```sql
SELECT * FROM pessoas;
```

O MySQL exibirá todos os registros da tabela.

---

# Por que informar o ID manualmente não é o ideal?

Mesmo utilizando `AUTO_INCREMENT`, ainda é possível informar um número manualmente.

Porém isso não é recomendado.

Imagine que eu escolha um número já existente.

O banco retornará um erro informando que a Chave Primária está duplicada.

Além disso, o objetivo do `AUTO_INCREMENT` é justamente gerar esse número automaticamente.

---

# Utilizando DEFAULT

O correto é utilizar:

```sql
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT, 'Bruss', '2007-05-29', 'm', 70.00, 1.65, 'Brasileiro');
```

## O que significa DEFAULT?

Quando utilizo `DEFAULT` na coluna `id`, estou dizendo ao MySQL:

> "Utilize o valor padrão definido para essa coluna."

Como ela possui `AUTO_INCREMENT`, o próprio banco gera o próximo número disponível.

Essa é a forma mais utilizada em sistemas profissionais.

---

# Consultando os registros

Depois da inserção:

```sql
SELECT * FROM pessoas;
```

O resultado será semelhante a:

| id | nome  | nascimento |
| -: | ----- | ---------- |
|  1 | Bruss | 2007-05-29 |

Caso eu insira outra pessoa utilizando `DEFAULT`, o próximo ID será:

```text
2
```

Depois:

```text
3
```

E assim por diante.

> **Observação:** Na anotação original aparece que o ID seria um "número aleatório". Na verdade, com `AUTO_INCREMENT`, o MySQL gera um número **sequencial**, normalmente 1, 2, 3, 4... (salvo situações específicas, como exclusões ou alterações da sequência).

---

# Inserindo vários registros ao mesmo tempo

Uma grande vantagem do SQL é permitir inserir diversos registros utilizando apenas um comando.

A sintaxe correta é:

```sql
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT, 'Bruss',   '2007-05-29', 'm', 70.00, 1.65, 'Brasileiro'),
(DEFAULT, 'João',    '2007-07-10', 'm', 78.00, 1.73, DEFAULT),
(DEFAULT, 'Douglas', '2003-09-17', 'm', 70.00, 1.35, DEFAULT),
(DEFAULT, 'Cleiton', '2001-05-13', 'm', 64.00, 1.85, DEFAULT),
(DEFAULT, 'Jones',   '2009-02-19', 'm', 69.00, 1.76, 'Espanhol'),
(DEFAULT, 'Lucas',   '2006-02-20', 'm', 86.00, 1.95, 'Estadunidense');
```

### Correções importantes

Na anotação original havia alguns erros de sintaxe, como:

* aspas não fechadas;
* `DEFAULT` escrito entre aspas (`'default'`);
* valores textuais sem aspas de fechamento.

O código acima representa a forma correta de inserção.

---

# Consultando os dados

Após inserir os registros:

```sql
SELECT * FROM pessoas;
```

O banco exibirá todos os cadastros armazenados.

---

# Fluxo completo de criação do banco

## 1. Criar o banco

```sql
CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

---

## 2. Selecionar o banco

```sql
USE cadastro;
```

---

## 3. Criar a tabela

```sql
CREATE TABLE pessoas (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    sexo ENUM('f','m','o'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(30) DEFAULT 'Brasileiro',
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;
```

---

## 4. Conferir a estrutura

```sql
DESCRIBE pessoas;
```

---

## 5. Inserir registros

```sql
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT, 'Bruss', '2007-05-29', 'm', 70.00, 1.65, 'Brasileiro');
```

---

## 6. Consultar os dados

```sql
SELECT * FROM pessoas;
```

---

# Projeto Prático — Banco de Dados de Vendas

Depois dos exercícios anteriores, foi criado um novo banco de dados para armazenar produtos.

---

# Criando o banco

```sql
CREATE DATABASE vendas
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

Depois:

```sql
USE vendas;
```

---

# Criando a tabela de produtos

```sql
CREATE TABLE produtos (
    codigoProduto INT NOT NULL AUTO_INCREMENT,
    nomeProduto VARCHAR(50) NOT NULL,
    precoProduto DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (codigoProduto)
) DEFAULT CHARSET=utf8;
```

## Explicação

### codigoProduto

Identificador único do produto.

---

### AUTO_INCREMENT

Cada novo produto recebe automaticamente um código exclusivo.

---

### nomeProduto

Armazena o nome do produto.

---

### precoProduto

Armazena o preço do produto com duas casas decimais.

Foi utilizado `DECIMAL(10,2)` porque é o tipo mais indicado para valores monetários, evitando problemas de precisão que podem ocorrer com `FLOAT`.

---

# Conferindo a estrutura

```sql
DESCRIBE produtos;
```

---

# Inserindo produtos

```sql
INSERT INTO produtos
(codigoProduto, nomeProduto, precoProduto)
VALUES
(DEFAULT, 'Arroz', 23.50),
(DEFAULT, 'Feijão', 50.00),
(DEFAULT, 'Salgadinho', 12.00),
(DEFAULT, 'Café', 70.00),
(DEFAULT, 'Chocolate', 40.00),
(DEFAULT, 'Picanha', 100.99),
(DEFAULT, 'Frango', 32.40),
(DEFAULT, 'Chiclete', 10.50),
(DEFAULT, 'Sorvete', 49.99),
(DEFAULT, 'Refrigerante', 20.78);
```

> **Observação:** Os valores numéricos não precisam estar entre aspas. O MySQL até pode convertê-los automaticamente, mas a prática recomendada é armazená-los como números.

---

# Consultando os produtos

```sql
SELECT * FROM produtos;
```

Esse comando exibirá todos os produtos cadastrados juntamente com seus códigos e preços.

---

# 💡 Dicas importantes

* Toda tabela deve possuir uma **Chave Primária**.
* Sempre utilize `AUTO_INCREMENT` quando precisar gerar identificadores automaticamente.
* Prefira `DEFAULT` em vez de informar manualmente o valor da chave primária.
* Utilize `DECIMAL` para armazenar preços e outros valores monetários.
* Antes de inserir grandes quantidades de dados, confira a estrutura da tabela com `DESCRIBE`.

---

# ✅ Em resumo

Nesta aula aprendi a criar tabelas utilizando uma **Chave Primária** com `AUTO_INCREMENT`, garantindo que cada registro tenha um identificador único. Também compreendi a diferença entre informar o ID manualmente e utilizar `DEFAULT`, que permite ao MySQL gerar o próximo valor automaticamente. Além disso, aprendi a inserir vários registros em um único comando `INSERT`, consultar os dados com `SELECT` e desenvolvi um segundo projeto criando um banco de dados de vendas para armazenar produtos.

---

# ⚡ Resumo Relâmpago — 10 linhas

1. A Chave Primária identifica cada registro de forma única.
2. `AUTO_INCREMENT` gera automaticamente um novo ID para cada registro.
3. `PRIMARY KEY (id)` impede IDs duplicados.
4. `DESCRIBE` mostra a estrutura da tabela.
5. `DEFAULT` permite que o MySQL gere automaticamente o valor do ID.
6. `INSERT INTO` pode inserir um ou vários registros de uma só vez.
7. `SELECT * FROM` exibe todos os registros da tabela.
8. `DECIMAL` é o tipo ideal para armazenar preços.
9. O banco **vendas** foi criado para armazenar produtos com código, nome e preço.
10. Utilizar uma estrutura correta desde o início evita erros e facilita o desenvolvimento de sistemas maiores.
