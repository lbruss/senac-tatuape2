# Filtrando e Ordenando Registros

**Ideia principal**

Aprendi a **consultar registros de uma tabela de forma mais específica**.

Até agora, eu já conseguia fazer:

```sql
SELECT * FROM cursos;
```

Isso mostra **todos os registros e todas as colunas**.

Agora comecei a controlar melhor o resultado da consulta, podendo:

* ordenar registros;
* escolher quais colunas quero visualizar;
* filtrar registros;
* trabalhar com intervalos;
* procurar valores específicos;
* combinar condições;
* procurar palavras ou partes de palavras;
* utilizar operadores lógicos;
* utilizar padrões com `LIKE`.

Esse processo é chamado de **consulta** ou **Query**.

---

# Query

Uma **Query** é uma consulta feita ao banco de dados para pedir alguma informação.

É como fazer uma pergunta ao banco:

> "Quais cursos existem?"

```sql
SELECT * FROM cursos;
```

Ou uma pergunta mais específica:

> "Quais cursos são de 2028?"

```sql
SELECT * FROM cursos
WHERE ano = 2028;
```

Ou ainda:

> "Quais cursos de 2028 possuem quais cargas horárias?"

```sql
SELECT nome, carga
FROM cursos
WHERE ano = 2028;
```

Portanto, uma Query é basicamente uma forma de **pedir ao banco exatamente a informação que eu preciso**.

---

# Ordenando os registros com ORDER BY

O comando:

```sql
ORDER BY
```

serve para **organizar os resultados da consulta**.

---

## Ordem crescente

```sql
SELECT * FROM cursos
ORDER BY nome;
```

Nesse caso, os cursos serão organizados pelo campo `nome`.

Por padrão, o MySQL utiliza a ordem **crescente**.

Para textos, normalmente será:

```
A
B
C
D
...
Z
```

Para números:

```
1
2
3
4
5
...
```

---

## Ordem decrescente

Para inverter a ordem:

```sql
SELECT * FROM cursos
ORDER BY nome DESC;
```

`DESC` significa **descending**, ou seja, descendente/decrescente.

O resultado ficará aproximadamente:

```
Z
Y
X
...
C
B
A
```

---

## ASC e DESC

Também posso escrever explicitamente:

```sql
ORDER BY nome ASC;
```

`ASC` significa **ascending**, ou seja, crescente.

Portanto:

| Comando              | Ordem                |
| -------------------- | -------------------- |
| `ORDER BY nome ASC`  | Crescente            |
| `ORDER BY nome DESC` | Decrescente          |
| `ORDER BY nome`      | Crescente por padrão |

---

## Escolhendo quais colunas visualizar

Eu não preciso mostrar todas as colunas.

- **Por exemplo:**

```sql
SELECT nome, carga, ano
FROM cursos
ORDER BY nome;
```

Aqui estou pedindo somente:

* `nome`;
* `carga`;
* `ano`.

A coluna `idcurso`, por exemplo, não aparecerá no resultado.

---

# `SELECT *` x `SELECT coluna`

**Todas as colunas**

```sql
SELECT * FROM cursos;
```

O `*` significa:

> "Quero todas as colunas."

**Apenas algumas colunas**

```sql
SELECT nome, carga
FROM cursos;
```

Significa:

> "Quero somente `nome` e `carga`."

---

# Filtrando com WHERE

O comando:

```sql
WHERE
```

é utilizado para **filtrar os registros**.

> Por exemplo:

```sql
SELECT * FROM cursos
WHERE ano = 2028
ORDER BY nome;
```

Aqui estou dizendo:

> "Mostre os cursos cujo ano seja 2028 e organize os resultados pelo nome."

---

## Entendendo a Query por partes

```sql
SELECT * FROM cursos
WHERE ano = 2028
ORDER BY nome;
```

**`SELECT *`**

Quero todas as colunas.

**`FROM cursos`**

Os dados devem ser procurados na tabela `cursos`.

**`WHERE ano = 2028`**

Quero somente registros cujo ano seja `2028`.

**`ORDER BY nome`**

Depois de filtrar, organize o resultado pelo nome.

---

# Filtrando e escolhendo colunas

Também posso combinar `WHERE` com a seleção de colunas:

```sql
SELECT nome, carga
FROM cursos
WHERE ano = 2028
ORDER BY nome;
```

Agora o resultado mostrará somente:

```
nome
carga
```

e somente os cursos de:

```
2028
```

ordenados pelo nome.

---

# Operadores de comparação

No `WHERE`, posso utilizar vários operadores.

| Operador | Significado    |
| -------- | -------------- |
| `=`      | Igual          |
| `>`      | Maior que      |
| `<`      | Menor que      |
| `>=`     | Maior ou igual |
| `<=`     | Menor ou igual |
| `<>`     | Diferente de   |

---

- **Exemplos**

**Igual**

```sql
WHERE ano = 2028
```

Ano exatamente igual a 2028.

**Maior que**

```sql
WHERE carga > 24
```

Carga maior que 24.

**Menor que**

```sql
WHERE carga < 24
```

Carga menor que 24.

**Maior ou igual**

```sql
WHERE carga >= 24
```

Carga de 24 ou mais.

**Menor ou igual**

```sql
WHERE carga <= 24
```

Carga de 24 ou menos.

**Diferente**

```sql
WHERE ano <> 2028
```

Todos os registros cujo ano seja diferente de 2028.

---

# BETWEEN — Trabalhando com intervalo

Quando quero procurar valores dentro de um intervalo, posso utilizar:

```sql
BETWEEN
```

- **Exemplo:**

```sql
SELECT * FROM cursos
WHERE totalaulas BETWEEN 20 AND 30
ORDER BY nome;
```

Isso significa:

> "Mostre os cursos que possuem entre 20 e 30 aulas."

O `BETWEEN` inclui os limites.

Ou seja:

```
20 ≤ totalaulas ≤ 30
```

Então tanto `20` quanto `30` podem aparecer.

---

# IN — Procurando valores específicos

Também posso procurar vários valores específicos utilizando:

```sql
IN
```

- **Exemplo:**

```sql
SELECT nome, carga
FROM cursos
WHERE carga IN (16, 24)
ORDER BY nome;
```

Isso significa:

> "Mostre os cursos cuja carga seja 16 ou 24."

É como fazer:

```sql
WHERE carga = 16 OR carga = 24
```

Porém `IN` deixa a consulta mais organizada quando existem vários valores.

---

# Operadores lógicos

Também posso combinar condições utilizando operadores lógicos.

Os principais são:

* `AND`
* `OR`
* `NOT`

---

**AND**

`AND` significa **E**.

As duas condições precisam ser verdadeiras.

```sql
SELECT nome, carga, totalaulas
FROM cursos
WHERE carga > 24
AND totalaulas < 16
ORDER BY nome;
```

Estou procurando cursos que:

```
carga > 24
```

**E**

```
totalaulas < 16
```

As duas condições precisam ser atendidas pelo mesmo registro.

---

**OR**

`OR` significa **OU**.

```sql
SELECT nome, carga, totalaulas
FROM cursos
WHERE carga > 24
OR totalaulas < 16
ORDER BY nome;
```

Agora basta uma das condições ser verdadeira.

O curso será mostrado se:

```
carga > 24
```

**OU**

```
totalaulas < 16
```

---

**AND x OR**

Uma forma simples de memorizar:

**AND**

> "Precisa cumprir os dois requisitos."

**OR**

> "Pode cumprir qualquer um dos requisitos."

---

# Procurando um nome específico

Posso procurar um valor exato:

```sql
SELECT * FROM cursos
WHERE nome = 'Algoritmos';
```

Aqui o MySQL procurará um registro cujo nome seja exatamente:

```
Algoritmos
```

---

# LIKE — Procurando padrões

Quando não quero procurar um valor exatamente igual, posso utilizar:

```sql
LIKE
```

O `LIKE` é utilizado principalmente para **pesquisar textos através de padrões**.

Ele fica ainda mais poderoso quando combinado com:

```
%
_
```

Esses são chamados de **caracteres curinga** (*wildcards*).

---

# O símbolo `%`

O símbolo:

```
%
```

representa **zero ou mais caracteres**.

Por exemplo:

```sql
SELECT * FROM cursos
WHERE nome LIKE 'E%';
```

Significa:

> "O nome deve começar com `E`."

Pode encontrar:

```
Excel Essencial
Excel Avançado I
Excel Avançado II
```

porque todos começam com `E`.

---

# Procurando pela última letra

```sql
SELECT * FROM cursos
WHERE nome LIKE '%E';
```

Agora o `%` está no começo.

Isso significa:

> "Pode existir qualquer quantidade de caracteres antes, mas o nome precisa terminar com `E`."

- **Por exemplo:**

```
...E
```

---

# Procurando uma letra em qualquer posição

```sql
SELECT * FROM cursos
WHERE nome LIKE '%E%';
```

Agora o `E` pode aparecer em qualquer posição.

O padrão significa:

```
qualquer coisa + E + qualquer coisa
```

Então pode encontrar palavras como:

```
Excel
Desenvolvedor
PHP
```

desde que tenham `E` no texto.

---

# Procurando palavras que NÃO possuem determinada letra

Podemos utilizar `NOT LIKE`:

```sql
SELECT * FROM cursos
WHERE nome NOT LIKE '%E%';
```

Isso significa:

> "Mostre os cursos cujo nome não contém a letra `E`."

---

# Procurando duas letras em posições específicas

```sql
SELECT * FROM cursos
WHERE nome LIKE 'E%L%';
```

Aqui estou procurando um nome que:

1. comece com `E`;
2. depois tenha qualquer quantidade de caracteres;
3. depois tenha `L`;
4. depois possa ter qualquer quantidade de caracteres.

Representação:

```
E + qualquer coisa + L + qualquer coisa
```

---

# O símbolo `_`

Além do `%`, existe:

```
_
```

O sublinhado representa **exatamente um caractere**.

Essa é uma diferença muito importante:

| Símbolo | Significado             |
| ------- | ----------------------- |
| `%`     | Zero ou mais caracteres |
| `_`     | Exatamente um caractere |

---

# Combinando `%` e `_`

- **Exemplo:**

```sql
SELECT * FROM cursos
WHERE nome LIKE 'C%_';
```

Aqui:

```
C
```

precisa estar no começo.

Depois:

```
%
```

permite qualquer quantidade de caracteres.

E no final:

```
_
```

exige pelo menos **um caractere** naquela posição.

---

# Outro exemplo com `LIKE`

```sql
SELECT * FROM cursos
WHERE nome LIKE 'php%p_';
```

O padrão procura um nome que:

* comece com `php`;
* depois tenha zero ou mais caracteres;
* depois tenha `p`;
* depois tenha exatamente mais um caractere.

É importante observar que o `LIKE` trabalha com **padrões**, e não com uma simples comparação.

---

# Dois caracteres entre letras

```sql
SELECT * FROM cursos
WHERE nome LIKE 'P__T%';
```

Aqui temos:

```
P __ T %
```

O primeiro caractere precisa ser:

```
P
```

Depois temos:

```
__
```

Cada `_` representa exatamente um caractere.

Portanto, existem **dois caracteres entre `P` e `T`**.

Depois do `T`:

```
%
```

permite qualquer quantidade de caracteres.

---

# Procurando uma palavra em qualquer posição

```sql
SELECT * FROM cursos
WHERE nome LIKE '%silva%';
```

Aqui estou procurando `silva` em qualquer parte do texto.

Pode ser:

```
Silva
```

ou:

```
João Silva
```

ou:

```
Silva Desenvolvimento Web
```

dependendo dos dados existentes.

O padrão:

```
%silva%
```

significa:

```
qualquer coisa + silva + qualquer coisa
```

---

# Tabela de padrões do LIKE

| Query            | O que procura                                               |
| ---------------- | ----------------------------------------------------------- |
| `LIKE 'E%'`      | Começa com E                                                |
| `LIKE '%E'`      | Termina com E                                               |
| `LIKE '%E%'`     | Contém E em qualquer posição                                |
| `NOT LIKE '%E%'` | Não contém E                                                |
| `LIKE 'E%L%'`    | Começa com E e possui L depois                              |
| `LIKE 'C%_'`     | Começa com C e termina com exatamente um caractere após `%` |
| `LIKE 'P__T%'`   | Começa com P, possui dois caracteres e depois T             |
| `LIKE '%silva%'` | Contém "silva" em qualquer posição                          |

---

# `%` x `_`

Essa diferença é uma das coisas mais importantes desta aula.

Imagine:

```
%
```

como uma **caixa que pode receber qualquer quantidade de caracteres**.

Já:

```
_
```

é como um **espaço reservado para apenas um caractere**.

`%`

```
%
```

Pode representar:

```
nada
A
ABC
ABCDEFG
```

`_`

```
_
```

Representa somente:

```
A
```

um único caractere.

---

# Estrutura geral de uma consulta

Uma Query pode juntar várias dessas ferramentas:

```sql
SELECT colunas
FROM tabela
WHERE condição
ORDER BY coluna;
```

- **Por exemplo:**

```sql
SELECT nome, carga
FROM cursos
WHERE ano = 2028
ORDER BY nome;
```

Podemos interpretar como uma sequência:

```
SELECT
↓
O que quero ver?

FROM
↓
De onde vou pegar?

WHERE
↓
Quais registros quero?

ORDER BY
↓
Como quero organizar o resultado?
```

Essa estrutura é extremamente importante para entender SQL.

---

# Exemplo completo

Imagine que eu queira:

> "Mostrar o nome e a carga dos cursos de 2028, somente aqueles com carga maior que 24, organizados alfabeticamente."

A Query seria:

```sql
SELECT nome, carga
FROM cursos
WHERE ano = 2028
AND carga > 24
ORDER BY nome;
```

Aqui estou combinando:

* `SELECT` → escolhe as colunas;
* `FROM` → escolhe a tabela;
* `WHERE` → filtra;
* `AND` → adiciona outra condição;
* `ORDER BY` → organiza o resultado.

---

## Ordem lógica de uma consulta

Uma forma de pensar em uma Query é:

```
                 BANCO DE DADOS
                       ↓
                    TABELA
                       ↓
                     FROM
                       ↓
                  WHERE
               ┌───────┴───────┐
             FILTRO       CONDIÇÕES
                       ↓
                    SELECT
                       ↓
                 COLUNAS DESEJADAS
                       ↓
                  ORDER BY
                       ↓
                RESULTADO FINAL
```

Na escrita da Query, normalmente usamos:

```sql
SELECT
FROM
WHERE
ORDER BY
```

Mas conceitualmente estou dizendo:

> **De onde pegar → quais registros considerar → quais informações mostrar → como organizar.**

---

**Uma observação importante sobre textos**

Quando comparo um texto diretamente, utilizo aspas simples:

```sql
WHERE nome = 'Algoritmos';
```

Enquanto números normalmente são escritos sem aspas:

```sql
WHERE ano = 2028;
```

Embora o MySQL possa fazer algumas conversões automaticamente, é uma boa prática manter os tipos corretamente.

---

# Principais comandos desta aula

| Comando/Operador | Função                                         |
| ---------------- | ---------------------------------------------- |
| `SELECT`         | Escolhe os dados que serão exibidos            |
| `FROM`           | Indica a tabela consultada                     |
| `WHERE`          | Filtra registros                               |
| `ORDER BY`       | Ordena o resultado                             |
| `ASC`            | Ordem crescente                                |
| `DESC`           | Ordem decrescente                              |
| `=`              | Igual                                          |
| `>`              | Maior que                                      |
| `<`              | Menor que                                      |
| `>=`             | Maior ou igual                                 |
| `<=`             | Menor ou igual                                 |
| `<>`             | Diferente                                      |
| `BETWEEN`        | Procura dentro de um intervalo                 |
| `IN`             | Procura valores específicos                    |
| `AND`            | Todas as condições precisam ser verdadeiras    |
| `OR`             | Pelo menos uma condição precisa ser verdadeira |
| `LIKE`           | Procura padrões em textos                      |
| `NOT LIKE`       | Exclui textos que correspondem ao padrão       |
| `%`              | Zero ou mais caracteres                        |
| `_`              | Exatamente um caractere                        |

---

# O que é preciso memorizar

A estrutura:

```sql
SELECT ...
FROM ...
WHERE ...
ORDER BY ...;
```

é uma das bases das consultas SQL.

E preciso lembrar principalmente:

```
SELECT → o que quero ver
FROM → de onde vem
WHERE → o que quero filtrar
ORDER BY → como quero organizar
```

Além disso:

```
% → qualquer quantidade de caracteres
_ → exatamente um caractere
```

---

# Resumo final

Nesta aula aprendi a transformar consultas simples em consultas mais específicas. Utilizei `ORDER BY` para organizar registros em ordem crescente ou decrescente e aprendi que `SELECT` pode mostrar somente as colunas que realmente preciso. Com `WHERE`, consigo filtrar registros utilizando operadores como `=`, `>`, `<`, `>=`, `<=` e `<>`. Também aprendi `BETWEEN` para intervalos, `IN` para valores específicos e `AND`/`OR` para combinar condições. Por fim, conheci o `LIKE`, que permite pesquisar padrões em textos utilizando `%` e `_`, tornando as consultas muito mais flexíveis.

---

**Resumo Relâmpago**

1. **Query** é uma consulta feita ao banco de dados para obter informações.
2. `SELECT` define quais colunas quero visualizar.
3. `FROM` informa de qual tabela os dados serão retirados.
4. `WHERE` filtra os registros de acordo com uma condição.
5. `ORDER BY` organiza o resultado; `ASC` é crescente e `DESC` é decrescente.
6. `BETWEEN` pesquisa valores dentro de um intervalo, incluindo os limites.
7. `IN` permite procurar vários valores específicos.
8. `AND` exige que todas as condições sejam verdadeiras; `OR` permite qualquer uma.
9. `LIKE` pesquisa padrões em textos; `NOT LIKE` faz o contrário.
10. No `LIKE`, `%` representa zero ou mais caracteres e `_` representa exatamente um caractere.
