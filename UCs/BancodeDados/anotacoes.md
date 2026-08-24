# GROUP BY e HAVING

Até agora eu já sabia filtrar registros com `WHERE` e fazer cálculos com funções como `COUNT()`, `AVG()`, `MAX()`, `MIN()` e `SUM()`.

Agora o `GROUP BY` permite responder perguntas como:

> "Quais registros possuem o mesmo valor e quantos existem em cada grupo?"

---

# GROUP BY — Agrupando registros

O comando básico é:

```sql
SELECT carga
FROM cursos
GROUP BY carga;
```

O `GROUP BY` agrupa os registros que possuem o mesmo valor na coluna indicada.

Se eu tiver:

| curso      | carga |
| ---------- | ----: |
| Algoritmos |    40 |
| Excel      |    40 |
| PHP        |    24 |
| Front-end  |    60 |
| JavaScript |    40 |
| MySQL      |    24 |

Ao executar:

```sql
SELECT carga
FROM cursos
GROUP BY carga;
```

o resultado será algo parecido com:

| carga |
| ----: |
|    24 |
|    40 |
|    60 |

Ou seja, os valores iguais foram colocados no mesmo grupo.

---

# GROUP BY x DISTINCT

Nesse exemplo, existe uma semelhança importante:

```sql
SELECT DISTINCT carga
FROM cursos;
```

e:

```sql
SELECT carga
FROM cursos
GROUP BY carga;
```

podem produzir os mesmos valores.

Mas a finalidade do `GROUP BY` é mais ampla.

O `GROUP BY` é especialmente útil quando eu quero **fazer cálculos sobre cada grupo**.

- **Por exemplo:**

```sql
SELECT carga, COUNT(*)
FROM cursos
GROUP BY carga;
```

Agora consigo descobrir quantos cursos existem em cada carga horária.

---

# GROUP BY + COUNT()

```sql
SELECT carga, COUNT(*)
FROM cursos
GROUP BY carga;
```

Essa consulta faz duas coisas:

**`carga`**

Define os grupos.

**`COUNT(*)`**

Conta quantos registros existem dentro de cada grupo.

- **Por exemplo:**

| carga | COUNT(*) |
| ----: | -------: |
|    24 |        2 |
|    40 |        4 |
|    60 |        2 |
|    72 |        1 |

Isso significa:

* Existem 2 cursos com 24 horas.
* Existem 4 cursos com 40 horas.
* Existem 2 cursos com 60 horas.
* Existe 1 curso com 72 horas.

---

**Deixando o resultado organizado com ORDER BY**

Posso ordenar o resultado:

```sql
SELECT carga, COUNT(*)
FROM cursos
GROUP BY carga
ORDER BY carga;
```

O resultado será organizado pela carga horária, do menor para o maior.

Também posso usar:

```sql
ORDER BY carga DESC;
```

para mostrar do maior para o menor.

---

# GROUP BY com WHERE

Também posso filtrar os registros **antes de agrupá-los**.

- **Exemplo:**

```sql
SELECT carga, totalaulas
FROM cursos
WHERE totalaulas = 8
GROUP BY carga
ORDER BY carga;
```

Aqui o processo é:

```
Todos os cursos
      ↓
WHERE totalaulas = 8
      ↓
Somente cursos com 8 aulas
      ↓
GROUP BY carga
      ↓
Agrupa pela carga
      ↓
ORDER BY carga
      ↓
Organiza o resultado
```

---

# HAVING — Filtrando grupos

Agora entra uma diferença muito importante:

* `WHERE` → filtra **registros**
* `HAVING` → filtra **grupos**

- **Exemplo:**

```sql
SELECT carga, COUNT(*)
FROM cursos
GROUP BY carga
HAVING COUNT(carga) >= 30
ORDER BY carga;
```

Aqui existe um problema lógico: se `COUNT(carga)` estiver contando a quantidade de cursos em cada carga, exigir `>= 30` significa procurar grupos com **30 ou mais cursos**, o que provavelmente não corresponde aos dados dessa tabela.

A sintaxe está correta, mas a condição provavelmente não produzirá resultados com a quantidade de cursos que tenho.

Um exemplo mais adequado seria:

```sql
SELECT carga, COUNT(*)
FROM cursos
GROUP BY carga
HAVING COUNT(*) >= 2
ORDER BY carga;
```

Isso significa:

> "Agrupe os cursos pela carga e mostre somente as cargas que possuem pelo menos 2 cursos."

---

# WHERE x HAVING

Essa é uma das diferenças mais importantes desta aula.

**WHERE**

Filtra os registros **antes do agrupamento**.

```sql
SELECT ano, COUNT(*)
FROM cursos
WHERE carga >= 40
GROUP BY ano;
```

Podemos interpretar:

> "Pegue somente cursos com carga maior ou igual a 40 e depois agrupe esses cursos por ano."

---

**HAVING**

Filtra os grupos **depois do agrupamento**.

```sql
SELECT ano, COUNT(*)
FROM cursos
GROUP BY ano
HAVING ano > 2026;
```

Aqui:

```
GROUP BY
   ↓
Cria os grupos por ano
   ↓
HAVING
   ↓
Mantém somente os grupos cujo ano > 2026
```

---

# GROUP BY + HAVING + ORDER BY

- **Um exemplo completo:**

```sql
SELECT ano, COUNT(*)
FROM cursos
GROUP BY ano
HAVING ano > 2026
ORDER BY ano;
```

Cada parte possui uma função:

```
SELECT
↓
O que quero visualizar

FROM
↓
De onde vêm os dados

GROUP BY
↓
Como os dados serão agrupados

HAVING
↓
Quais grupos permanecem

ORDER BY
↓
Como o resultado será organizado
```

---

# WHERE + GROUP BY + HAVING

Posso usar os dois tipos de filtro na mesma consulta:

```sql
SELECT ano, COUNT(*)
FROM cursos
WHERE carga >= 40
GROUP BY ano
HAVING ano > 2026
ORDER BY ano;
```

Aqui acontece uma sequência muito importante:

```
1. FROM
   ↓
2. WHERE
   ↓
3. GROUP BY
   ↓
4. HAVING
   ↓
5. SELECT
   ↓
6. ORDER BY
```

De forma simplificada:

> Primeiro filtro os registros → depois agrupo → depois filtro os grupos → finalmente organizo o resultado.

---

# Usando AVG() junto com GROUP BY

Agora posso combinar `GROUP BY` com `AVG()`.

- **Por exemplo:**

```sql
SELECT AVG(carga)
FROM cursos;
```

Essa consulta calcula a média da carga horária de todos os cursos.

No meu exemplo, o resultado é aproximadamente:

```
42,38
```

Mas posso fazer análises mais específicas utilizando agrupamento.

---

## Subconsulta — Usando AVG() dentro de outra consulta

Uma consulta interessante é:

```sql
SELECT ano, carga, COUNT(*)
FROM cursos
WHERE ano > 2026
GROUP BY carga
HAVING carga > (SELECT AVG(carga) FROM cursos);
```

Aqui aparece um conceito novo:

# Subconsulta

Uma **subconsulta** é uma consulta dentro de outra consulta.

Neste trecho:

```sql
(SELECT AVG(carga) FROM cursos)
```

o MySQL executa primeiro essa consulta:

```sql
SELECT AVG(carga)
FROM cursos;
```

Ela produz aproximadamente:

```
42,38
```

Então a consulta principal passa a funcionar como se fosse:

```sql
HAVING carga > 42.38
```

Ou seja:

> "Mostre os grupos cuja carga seja maior que a média geral dos cursos."

---

**Por que usar uma subconsulta?**

Eu poderia escrever diretamente:

```sql
HAVING carga > 42.38
```

Mas existe um problema.

Se eu adicionar novos cursos ou alterar as cargas existentes, a média pode mudar.

- **Por exemplo, hoje:**

```
Média = 42,38
```

Amanhã, depois de adicionar vários cursos:

```
Média = 45,20
```

Se eu deixei:

```sql
HAVING carga > 42.38
```

o valor continuará sendo `42.38`.

Já com:

```sql
HAVING carga > (SELECT AVG(carga) FROM cursos)
```

o banco **calcula novamente a média sempre que a consulta for executada**.

Isso torna a consulta dinâmica.

---

**Entendendo a subconsulta por partes**

A consulta:

```sql
SELECT ano, carga, COUNT(*)
FROM cursos
WHERE ano > 2026
GROUP BY carga
HAVING carga > (SELECT AVG(carga) FROM cursos);
```

pode ser desmontada assim.

**FROM**

```sql
FROM cursos
```

Estou trabalhando com a tabela `cursos`.

---

**WHERE**

```sql
WHERE ano > 2026
```

Seleciono somente cursos posteriores a 2026.

---

**GROUP BY**

```sql
GROUP BY carga
```

Agrupo os registros pela carga horária.

---

**Subconsulta**

```sql
(SELECT AVG(carga) FROM cursos)
```

Calculo a média geral da carga horária.

---

**HAVING**

```sql
HAVING carga > (SELECT AVG(carga) FROM cursos)
```

Mantenho somente os grupos cuja carga seja maior que a média.

---

**COUNT(*)**

```sql
COUNT(*)
```

Conto quantos registros existem em cada grupo.

---

**Um detalhe importante nessa última consulta**

Existe uma questão conceitual na combinação:

```sql
WHERE ano > 2026
GROUP BY carga
HAVING carga > (SELECT AVG(carga) FROM cursos)
```

A média da subconsulta é calculada sobre **todos os cursos**, porque ela não possui:

```sql
WHERE ano > 2026
```

Portanto, estou comparando:

> **cargas dos cursos de 2027+**
> contra
> **média de todos os cursos**

Isso pode ser exatamente o que eu quero.

Se eu quisesse comparar os cursos de 2027+ apenas contra a **média dos cursos de 2027+**, precisaria colocar o mesmo filtro dentro da subconsulta:

```sql
SELECT ano, carga, COUNT(*)
FROM cursos
WHERE ano > 2026
GROUP BY carga
HAVING carga > (
    SELECT AVG(carga)
    FROM cursos
    WHERE ano > 2026
);
```

Essa diferença é importante porque muda completamente o significado da análise.

---

# O papel de cada comando

Agora tenho uma visão mais completa:

| Comando    | Função                       |
| ---------- | ---------------------------- |
| `WHERE`    | Filtra registros             |
| `GROUP BY` | Agrupa registros semelhantes |
| `HAVING`   | Filtra os grupos             |
| `ORDER BY` | Ordena o resultado           |
| `COUNT()`  | Conta                        |
| `SUM()`    | Soma                         |
| `AVG()`    | Calcula média                |
| `MAX()`    | Encontra o maior             |
| `MIN()`    | Encontra o menor             |
| `DISTINCT` | Remove repetições            |

---

## WHERE e HAVING — diferença essencial

Essa diferença vale muito a pena memorizar:

```
WHERE
 ↓
Filtra registros
 ↓
GROUP BY
 ↓
Cria grupos
 ↓
HAVING
 ↓
Filtra grupos
```

- **Exemplo:**

```sql
SELECT ano, COUNT(*)
FROM cursos
WHERE carga >= 40
GROUP BY ano
HAVING COUNT(*) >= 2
ORDER BY ano;
```

Tradução:

> "Pegue somente cursos com pelo menos 40 horas, agrupe-os por ano, mantenha somente os anos que possuem pelo menos 2 cursos e organize os anos em ordem crescente."

---

# GROUP BY não é apenas para COUNT()

Posso utilizar várias funções de agregação:

**Contar**

```sql
SELECT carga, COUNT(*)
FROM cursos
GROUP BY carga;
```

**Média**

```sql
SELECT ano, AVG(carga)
FROM cursos
GROUP BY ano;
```

**Soma**

```sql
SELECT ano, SUM(carga)
FROM cursos
GROUP BY ano;
```

**Maior valor**

```sql
SELECT ano, MAX(carga)
FROM cursos
GROUP BY ano;
```

**Menor valor**

```sql
SELECT ano, MIN(carga)
FROM cursos
GROUP BY ano;
```

O `GROUP BY` determina **quais grupos serão analisados**, enquanto a função de agregação determina **o que será calculado dentro de cada grupo**.

---

**Analogia para memorizar**

Imagine uma escola com várias turmas.

Eu posso dizer:

> "Separe os alunos por turma."

Isso é:

```sql
GROUP BY turma
```

Depois:

> "Conte quantos alunos existem em cada turma."

Isso é:

```sql
COUNT(*)
```

Depois:

> "Mostre somente as turmas que possuem mais de 30 alunos."

Isso é:

```sql
HAVING COUNT(*) > 30
```

A lógica fica:

```
Alunos
  ↓
Separar por turma
  ↓
GROUP BY
  ↓
Contar alunos de cada turma
  ↓
COUNT()
  ↓
Eliminar turmas com poucos alunos
  ↓
HAVING
```

---

**Resumo Relâmpago**

1. `GROUP BY` serve para **agrupar registros que possuem valores iguais**.
2. Ele fica especialmente útil quando combinado com funções como `COUNT()`, `SUM()` e `AVG()`.
3. `COUNT(*)` pode mostrar quantos registros existem em cada grupo.
4. `WHERE` filtra os registros **antes** do agrupamento.
5. `HAVING` filtra os grupos **depois** do `GROUP BY`.
6. `ORDER BY` organiza o resultado final.
7. `GROUP BY carga` cria grupos de cursos com a mesma carga horária.
8. `HAVING COUNT(*) >= 2` pode manter somente grupos que possuem pelo menos dois registros.
9. Uma subconsulta é uma consulta colocada dentro de outra consulta.
10. `HAVING carga > (SELECT AVG(carga) FROM cursos)` compara cada grupo com uma média calculada dinamicamente pelo banco.
