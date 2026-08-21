# Banco de Dados (MySQL) — DISTINCT e Funções de Agregação

# 🎯 Ideia principal

Nesta aula aprendi a **resumir informações do banco de dados** em vez de simplesmente mostrar todos os registros.

Até agora, eu estava principalmente consultando registros individuais:

```sql
SELECT * FROM cursos;
```

Agora aprendi a fazer perguntas mais gerais ao banco, como:

* Quais valores existem sem repetição?
* Quantos cursos existem?
* Quantos cursos possuem determinada característica?
* Qual é a maior carga horária?
* Qual é a menor quantidade de aulas?
* Qual é a soma das cargas horárias?
* Qual é a média?

Para isso, vou utilizar principalmente:

```text
DISTINCT
COUNT()
MAX()
MIN()
SUM()
AVG()
```

Essas funções são chamadas de **funções de agregação**, porque pegam vários registros e produzem um **resultado resumido**.

---

# 1. DISTINCT — Removendo valores repetidos

Para trazer valores sem repetição:

```sql
SELECT DISTINCT carga
FROM cursos
ORDER BY carga;
```

> ⚠️ Na anotação original, `ORDER BY nacionalidade` não corresponde à coluna selecionada. Como estamos buscando as cargas sem repetição, o mais coerente é ordenar por `carga`.

---

## O que o DISTINCT faz?

Imagine que a tabela tenha:

| nome             | carga |
| ---------------- | ----: |
| Algoritmos       |    40 |
| Excel Essencial  |    40 |
| Excel Avançado I |    24 |
| PHP com MySQL    |    40 |
| Front-end I      |    60 |

Se eu fizer:

```sql
SELECT carga FROM cursos;
```

o resultado poderá ser:

```text
40
40
24
40
60
```

Existem valores repetidos.

Agora:

```sql
SELECT DISTINCT carga
FROM cursos;
```

retorna:

```text
24
40
60
```

O `DISTINCT` elimina as repetições do resultado.

---

# 🧠 Analogia

Imagine que eu tenha uma lista de compras:

```text
Arroz
Feijão
Arroz
Café
Café
Café
```

Se eu quiser saber **quais produtos diferentes existem**, não preciso ver o arroz três vezes e o café três vezes.

O resultado seria:

```text
Arroz
Feijão
Café
```

É exatamente essa ideia do `DISTINCT`.

---

# 2. COUNT() — Contando registros

Agora comecei a utilizar funções de agregação.

A primeira é:

```sql
COUNT()
```

Ela serve para **contar**.

Exemplo:

```sql
SELECT COUNT(*)
FROM cursos;
```

Isso retorna a quantidade de registros existentes na tabela `cursos`.

---

# O que significa COUNT(*)?

O `*` significa que quero considerar **todas as linhas**.

Então:

```sql
SELECT COUNT(*)
FROM cursos;
```

pode ser interpretado como:

> "Quantos registros existem na tabela `cursos`?"

Se houver 9 cursos:

```text
9
```

será o resultado.

---

# 3. COUNT() com WHERE

Posso combinar `COUNT()` com filtros.

```sql
SELECT COUNT(*)
FROM cursos
WHERE carga > 40;
```

Agora a pergunta é:

> "Quantos cursos possuem carga maior que 40 horas?"

O banco primeiro aplica:

```sql
WHERE carga > 40
```

e depois conta os registros encontrados.

---

# 🧩 Como o banco pensa nessa consulta?

```sql
SELECT COUNT(*)
FROM cursos
WHERE carga > 40;
```

Podemos imaginar:

```text
Todos os cursos
      ↓
Filtrar carga > 40
      ↓
Cursos que sobraram
      ↓
COUNT(*)
      ↓
Quantidade
```

Essa lógica de **filtrar primeiro e agregar depois** é muito importante.

---

# 4. COUNT(nome)

Também posso utilizar uma coluna dentro do `COUNT()`:

```sql
SELECT COUNT(nome)
FROM cursos
WHERE carga >= 60;
```

Isso conta quantos registros possuem `nome` preenchido dentro do conjunto que atende:

```sql
carga >= 60
```

Como `nome` foi definido como:

```sql
nome VARCHAR(50) NOT NULL
```

nesse caso, `COUNT(nome)` e `COUNT(*)` produzirão o mesmo resultado.

---

# COUNT(*) x COUNT(coluna)

Existe uma diferença importante.

### `COUNT(*)`

Conta as linhas.

```sql
COUNT(*)
```

### `COUNT(coluna)`

Conta os valores **não nulos** daquela coluna.

Por exemplo:

```sql
SELECT COUNT(nome)
FROM cursos;
```

contará somente registros em que `nome` não seja `NULL`.

---

# ⚠️ Uma diferença importante

Se uma tabela tivesse:

| id | nome       |
| -: | ---------- |
|  1 | Algoritmos |
|  2 | Excel      |
|  3 | NULL       |

Então:

```sql
COUNT(*)
```

retornaria:

```text
3
```

Mas:

```sql
COUNT(nome)
```

retornaria:

```text
2
```

porque o terceiro registro possui `nome = NULL`.

---

# 5. Contando estudantes brasileiros

Também posso utilizar `COUNT()` em outra tabela:

```sql
SELECT COUNT(*)
FROM estudantes
WHERE nacionalidade = 'Brasileiro';
```

Essa consulta responde:

> "Quantos estudantes possuem nacionalidade igual a Brasileiro?"

---

# 6. MAX() — Encontrando o maior valor

Outra função de agregação é:

```sql
MAX()
```

Ela retorna o **maior valor** encontrado.

Exemplo:

```sql
SELECT MAX(carga)
FROM cursos;
```

Isso responde:

> "Qual é a maior carga horária entre os cursos?"

Se as cargas forem:

```text
24
40
40
60
72
```

o resultado será:

```text
72
```

---

# 7. MAX() com filtro

Também posso restringir a pesquisa:

```sql
SELECT MAX(totalaulas)
FROM cursos
WHERE ano = 2026;
```

Agora estou perguntando:

> "Entre os cursos de 2026, qual possui a maior quantidade de aulas?"

O `WHERE` limita os registros para 2026.

Depois o `MAX()` procura o maior valor de `totalaulas`.

---

# 8. Ver os cursos de 2026 ordenados pelas aulas

Também posso simplesmente visualizar os cursos:

```sql
SELECT *
FROM cursos
WHERE ano = 2026
ORDER BY totalaulas;
```

Nesse caso, não estou obtendo apenas o maior valor.

Estou vendo **todos os cursos de 2026**, organizados pela quantidade de aulas.

Por padrão:

```sql
ORDER BY totalaulas
```

é crescente.

Se quiser do maior para o menor:

```sql
SELECT *
FROM cursos
WHERE ano = 2026
ORDER BY totalaulas DESC;
```

---

# 9. MIN() — Encontrando o menor valor

Se `MAX()` encontra o maior, `MIN()` encontra o menor.

```sql
SELECT MIN(totalaulas)
FROM cursos
WHERE ano = 2026;
```

Essa consulta responde:

> "Qual é a menor quantidade de aulas entre os cursos de 2026?"

---

# MAX() x MIN()

| Função  | Retorna     |
| ------- | ----------- |
| `MAX()` | Maior valor |
| `MIN()` | Menor valor |

Exemplo:

```text
24
40
40
60
72
```

```sql
MAX(carga)
```

→ `72`

```sql
MIN(carga)
```

→ `24`

---

# 10. SUM() — Somando valores

A função:

```sql
SUM()
```

serve para **somar os valores de uma coluna**.

Exemplo:

```sql
SELECT SUM(carga)
FROM cursos;
```

Isso soma todas as cargas horárias dos cursos.

Imagine:

```text
40 + 40 + 24 + 24 + 72
```

O banco calcula automaticamente o resultado.

---

# 11. SUM() com WHERE

Também posso fazer uma soma específica:

```sql
SELECT SUM(carga)
FROM cursos
WHERE ano = 2027;
```

Agora estou perguntando:

> "Qual é a soma das cargas horárias de todos os cursos de 2027?"

O processo é:

```text
Todos os cursos
      ↓
Selecionar somente ano = 2027
      ↓
Pegar a coluna carga
      ↓
Somar os valores
      ↓
Resultado
```

---

# 12. AVG() — Calculando a média

A função:

```sql
AVG()
```

calcula a **média aritmética** dos valores.

Exemplo:

```sql
SELECT AVG(carga)
FROM cursos;
```

Se tivermos:

```text
40
40
24
60
```

a média será:

```text
(40 + 40 + 24 + 60) / 4
```

Resultado:

```text
41
```

O MySQL realiza esse cálculo automaticamente.

---

# 13. AVG() com filtro

Também posso calcular uma média somente de determinados registros.

```sql
SELECT AVG(totalaulas)
FROM cursos
WHERE ano = 2028;
```

Essa consulta responde:

> "Qual é a média da quantidade de aulas dos cursos de 2028?"

---

# 🧠 As cinco principais funções de agregação

Nesta aula, as principais funções foram:

```text
COUNT()
MAX()
MIN()
SUM()
AVG()
```

Uma forma simples de memorizar:

| Função    | Pergunta          |
| --------- | ----------------- |
| `COUNT()` | **Quantos?**      |
| `MAX()`   | **Qual o maior?** |
| `MIN()`   | **Qual o menor?** |
| `SUM()`   | **Qual o total?** |
| `AVG()`   | **Qual a média?** |

---

# 14. DISTINCT x funções de agregação

É importante não confundir os dois.

## DISTINCT

Remove valores repetidos do resultado:

```sql
SELECT DISTINCT carga
FROM cursos;
```

Resultado:

```text
24
40
60
72
```

---

## COUNT()

Conta:

```sql
SELECT COUNT(*)
FROM cursos;
```

Resultado:

```text
9
```

Ou seja:

* `DISTINCT` → **quais valores diferentes existem?**
* `COUNT` → **quantos registros existem?**

---

# 15. WHERE + funções de agregação

Uma característica importante é que posso combinar filtros com praticamente todas essas funções.

### COUNT

```sql
SELECT COUNT(*)
FROM cursos
WHERE carga > 40;
```

### MAX

```sql
SELECT MAX(carga)
FROM cursos
WHERE ano = 2026;
```

### MIN

```sql
SELECT MIN(carga)
FROM cursos
WHERE ano = 2026;
```

### SUM

```sql
SELECT SUM(carga)
FROM cursos
WHERE ano = 2027;
```

### AVG

```sql
SELECT AVG(carga)
FROM cursos
WHERE ano = 2028;
```

A lógica é sempre parecida:

```text
Tabela
 ↓
WHERE
 ↓
Registros filtrados
 ↓
Função de agregação
 ↓
Resultado
```

---

# 16. Uma diferença importante: resultado resumido x registros

Veja:

```sql
SELECT *
FROM cursos
WHERE ano = 2026
ORDER BY totalaulas;
```

Essa consulta retorna **várias linhas**.

Ela mostra os cursos encontrados.

Já:

```sql
SELECT MAX(totalaulas)
FROM cursos
WHERE ano = 2026;
```

retorna apenas **um valor**.

Ela não mostra qual curso possui esse valor, apenas informa qual é o maior número de aulas.

Isso é importante.

Se eu quiser descobrir **qual curso possui a maior quantidade de aulas**, `MAX()` sozinho não é suficiente. Ele me dá o número máximo, não necessariamente os dados completos do curso.

---

# 🧠 Analogia

Imagine uma sala com vários alunos.

### `COUNT()`

> "Quantos alunos existem?"

### `MAX()`

> "Qual foi a maior nota?"

### `MIN()`

> "Qual foi a menor nota?"

### `SUM()`

> "Qual é a soma de todas as notas?"

### `AVG()`

> "Qual é a média das notas?"

### `DISTINCT`

> "Quais notas diferentes apareceram, sem repetir?"

Essa é exatamente a função dessas operações no banco.

---

# 📌 Principais consultas da aula

## Valores sem repetição

```sql
SELECT DISTINCT carga
FROM cursos
ORDER BY carga;
```

## Quantidade de cursos

```sql
SELECT COUNT(*)
FROM cursos;
```

## Quantidade com filtro

```sql
SELECT COUNT(*)
FROM cursos
WHERE carga > 40;
```

## Quantidade de estudantes brasileiros

```sql
SELECT COUNT(*)
FROM estudantes
WHERE nacionalidade = 'Brasileiro';
```

## Maior carga

```sql
SELECT MAX(carga)
FROM cursos;
```

## Maior quantidade de aulas em 2026

```sql
SELECT MAX(totalaulas)
FROM cursos
WHERE ano = 2026;
```

## Menor quantidade de aulas em 2026

```sql
SELECT MIN(totalaulas)
FROM cursos
WHERE ano = 2026;
```

## Soma das cargas

```sql
SELECT SUM(carga)
FROM cursos;
```

## Soma das cargas de 2027

```sql
SELECT SUM(carga)
FROM cursos
WHERE ano = 2027;
```

## Média das cargas

```sql
SELECT AVG(carga)
FROM cursos;
```

## Média das aulas de 2028

```sql
SELECT AVG(totalaulas)
FROM cursos
WHERE ano = 2028;
```

---

# 💡 Um detalhe importante sobre AVG()

Dependendo dos valores, o resultado de `AVG()` pode possuir casas decimais.

Por exemplo:

```text
20
30
40
```

A média é:

```text
30
```

Mas:

```text
20
30
41
```

resulta em:

```text
30,333...
```

O MySQL pode apresentar várias casas decimais dependendo do tipo dos dados e da forma como o resultado é exibido.

Se posteriormente eu quiser controlar a quantidade de casas decimais, posso utilizar funções como `ROUND()`.

---

# 🔥 Resumo conceitual

Até aqui, as consultas começaram a ficar muito mais poderosas.

Antes:

```sql
SELECT * FROM cursos;
```

> "Mostre tudo."

Agora posso perguntar coisas muito mais específicas:

```sql
SELECT COUNT(*)
FROM cursos
WHERE ano = 2026;
```

> "Quantos cursos existem em 2026?"

Ou:

```sql
SELECT MAX(carga)
FROM cursos
WHERE ano = 2026;
```

> "Qual é a maior carga horária dos cursos de 2026?"

Ou:

```sql
SELECT AVG(carga)
FROM cursos
WHERE ano = 2028;
```

> "Qual é a média da carga horária dos cursos de 2028?"

É justamente aí que o banco de dados começa a deixar de ser apenas um lugar para **guardar informações** e passa a ser uma ferramenta para **analisar informações**.

---

**Resumo Relâmpago**

1. `DISTINCT` remove valores repetidos do resultado.
2. `COUNT()` conta registros ou valores não nulos de uma coluna.
3. `COUNT(*)` conta as linhas da consulta.
4. `MAX()` retorna o maior valor encontrado.
5. `MIN()` retorna o menor valor encontrado.
6. `SUM()` soma os valores de uma coluna.
7. `AVG()` calcula a média dos valores.
8. `WHERE` pode ser utilizado antes da agregação para filtrar os registros analisados.
9. Funções de agregação normalmente retornam um resultado resumido, e não todos os registros.
10. `DISTINCT`, `COUNT`, `MAX`, `MIN`, `SUM` e `AVG` permitem transformar dados armazenados em informações úteis para análise.
