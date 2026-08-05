# Estruturas de Dados: Vetores e Matrizes

**Ideia Principal**

**Estruturas de Dados**, mais especificamente **Vetores** e uma introdução às **Matrizes**.

Até agora, sempre que era necessário armazenar vários valores, eu criava várias variáveis diferentes.

- **Exemplo:**

```
media1
media2
media3
media4
media5
...
```

Esse método funciona, mas rapidamente deixa o algoritmo grande e difícil de manter.

Para resolver esse problema existem os **vetores**, que permitem armazenar vários valores do mesmo tipo utilizando apenas um único nome de variável.

---

**O que são Estruturas de Dados?**

Estruturas de dados são formas organizadas de armazenar informações na memória do computador.

Elas facilitam:

* organizar dados;
* acessar informações rapidamente;
* reduzir a quantidade de variáveis;
* tornar os algoritmos mais simples e organizados.

Existem diversos tipos de estruturas de dados, sendo as primeiras estudadas:

* Vetores (uma dimensão);
* Matrizes (duas dimensões).

---

# Vetor

Um **vetor** é uma variável capaz de armazenar **vários valores do mesmo tipo**.

Ao invés de criar várias variáveis diferentes:

```
nota1
nota2
nota3
nota4
```

podemos criar apenas:

```
nota[]
```

Cada posição desse vetor armazenará um valor diferente.

---

> Analogia

Imagine um armário com várias gavetas.

O armário inteiro possui apenas um nome:

```
ARMÁRIO
```

Mas cada gaveta possui um número.

```
ARMÁRIO[0]

ARMÁRIO[1]

ARMÁRIO[2]

ARMÁRIO[3]
```

Cada gaveta guarda uma informação diferente.

É exatamente assim que um vetor funciona.

---

**Índices do Vetor**

Uma característica muito importante do VisualG é que o índice do vetor **começa em 0**.

- **Exemplo:**

```
vetor[0]

vetor[1]

vetor[2]

vetor[3]
```

Embora existam quatro posições, elas são numeradas de **0 até 3**.

Isso acontece porque o índice representa o deslocamento da primeira posição da memória.

Essa característica também está presente em linguagens como:

* C
* C++
* Java
* JavaScript
* Python
* C#

Por isso é importante se acostumar desde o início.

---

## Declarando um Vetor

- **Exemplo:**

```portugol
vet: vetor[0..2] de inteiro
```

Vamos entender essa declaração.

```
vet
```

É o nome do vetor.

---

```
vetor
```

Indica que essa variável será um vetor.

---

```
[0..2]
```

Define os índices.

Nesse caso teremos:

```
vet[0]

vet[1]

vet[2]
```

Ou seja, três posições.

---

```
de inteiro
```

Todos os elementos armazenados serão do tipo inteiro.

---

# Exemplo — Vetor Simples

**Objetivo**

Ler três números e mostrá-los na tela.

---

**Código**

```portugol
algoritmo "Vetor"

var

vet: vetor[0..2] de inteiro

inicio

escreva("Digite um número: ")
leia(vet[0])

escreva("Digite um número: ")
leia(vet[1])

escreva("Digite um número: ")
leia(vet[2])

escreval("")
escreval("Os números digitados foram: ",
          vet[0], " ",
          vet[1], " ",
          vet[2])

fimalgoritmo
```

---

**Explicação Linha por Linha**

Primeira leitura:

```portugol
leia(vet[0])
```

O primeiro número será armazenado na posição 0.

---

Depois:

```portugol
leia(vet[1])
```

Vai para a segunda posição.

---

Depois:

```portugol
leia(vet[2])
```

Vai para a terceira posição.

---

Na impressão:

```portugol
vet[0]

vet[1]

vet[2]
```

Cada posição do vetor é exibida.

---

**Problema desse algoritmo**

Embora utilize vetor, ainda estamos acessando cada posição manualmente.

Quando o vetor possuir:

```
100 posições
```

isso se torna inviável.

Por isso utilizamos estruturas de repetição.

---

# Vetor Utilizando `PARA`

**Objetivo**

Cadastrar cinco colaboradores.

---

**Código**

```portugol
algoritmo "Colaboradores"

var

nome: vetor[0..4] de caractere
i: inteiro

inicio

para i de 0 ate 4 faca

   escreva("Digite o nome do colaborador: ")
   leia(nome[i])

fimpara

escreval("")

para i de 0 ate 4 faca

   escreval("O nome dos nossos novos colaboradores é: ", nome[i])

fimpara

fimalgoritmo
```

---

**Como funciona?**

Na primeira repetição:

```
i = 0
```

O programa lê:

```
nome[0]
```

Depois:

```
i = 1
```

Lê:

```
nome[1]
```

E assim sucessivamente até:

```
nome[4]
```

O mesmo acontece na impressão.

Isso elimina a necessidade de escrever:

```
nome1

nome2

nome3

nome4

nome5
```

---

# Exemplo Sem Vetor

Imagine calcular a média de oito alunos.

Seria necessário criar:

```text
media1

media2

media3

media4

media5

media6

media7

media8
```

Depois ler uma por uma.

Depois somar uma por uma.

O algoritmo fica muito grande e difícil de manter.

---

# Média da Turma Utilizando Vetor

**Objetivo**

Calcular a média de oito alunos utilizando apenas um vetor.

---

**Código**

```portugol
algoritmo "Media da Turma"

var

md: vetor[0..7] de real
soma, media: real
i: inteiro

inicio

escreval("Digite a média da turma:")
escreval("")

soma <- 0

para i de 0 ate 7 faca

   leia(md[i])

   soma <- soma + md[i]

fimpara

media <- soma / 8

escreval("")
escreval("A média da turma é de: ", media)

fimalgoritmo
```

---

- **Explicação**

**Inicialização**

```portugol
soma <- 0
```

A variável `soma` começa com zero para acumular todas as notas.

---

**Leitura**

```portugol
leia(md[i])
```

Cada nota é armazenada em uma posição diferente do vetor.

---

**Acumulador**

```portugol
soma <- soma + md[i]
```

Essa linha adiciona a nota atual ao total acumulado.

- **Exemplo:**

```
Primeira nota = 8

soma = 0 + 8 = 8

Segunda nota = 7

soma = 8 + 7 = 15

Terceira nota = 9

soma = 15 + 9 = 24
```

Esse tipo de variável é chamado de **acumulador**, pois vai acumulando os valores ao longo do laço.

---

**Média**

Depois que todas as notas forem somadas:

```portugol
media <- soma / 8
```

Obtém-se a média da turma.

---

# Somar Cinco Números - Feito por mim

**Objetivo**

Ler cinco números, exibi-los e mostrar a soma.

---

**Código**

```portugol
algoritmo "Soma"

var

numero: vetor[0..4] de real
i: inteiro
soma: real

inicio

soma <- 0

para i de 0 ate 4 faca

   escreva("Digite o número ", i, ": ")
   leia(numero[i])

   soma <- soma + numero[i]

fimpara

escreval("")
escreval("Números digitados:")

para i de 0 ate 4 faca

   escreval(numero[i])

fimpara

escreval("")
escreval("Soma dos números = ", soma)

fimalgoritmo
```

---

- **Explicação**

O primeiro `PARA` serve para:

* ler os números;
* armazená-los;
* somá-los.

O segundo `PARA` apenas percorre novamente o vetor para exibir os valores digitados.

É comum utilizar vários laços sobre o mesmo vetor, cada um com um objetivo diferente.

---

# Cadastro de Países - Feito por mim

**Objetivo**

Cadastrar cinco países e depois exibir todos os nomes.

---

**Código**

```portugol
algoritmo "Paises"

var

nomePais: vetor[0..4] de caractere
i: inteiro

inicio

para i de 0 ate 4 faca

   escreval("Digite o nome de um país:")
   leia(nomePais[i])

fimpara

escreval("")

para i de 0 ate 4 faca

   escreval("O nome dos países é: ", nomePais[i])

fimpara

fimalgoritmo
```

---

**Como funciona?**

Primeiro laço:

```
Ler os cinco países.
```

Segundo laço:

```
Mostrar todos os países armazenados.
```

Os dados permanecem armazenados no vetor até o fim da execução do algoritmo.

---

# Matrizes

Além dos vetores, existe outra estrutura muito utilizada: a **matriz**.

Enquanto um vetor possui apenas **uma dimensão**, a matriz possui **duas dimensões**: linhas e colunas.

Visualmente:

```
      Colunas

       0     1     2

0    [ ]   [ ]   [ ]

1    [ ]   [ ]   [ ]

2    [ ]   [ ]   [ ]

↑
Linhas
```

Uma matriz pode ser imaginada como uma planilha do Excel, onde cada célula é identificada por uma linha e uma coluna.

- **Exemplo:**

```
matriz[2][1]
```

Significa:

* linha 2;
* coluna 1.

As matrizes são muito utilizadas para representar tabelas, calendários, mapas, jogos, imagens e planilhas.

Nesta aula, o foco principal foi compreender o funcionamento dos vetores, que servem como base para entender matrizes posteriormente.

---

**Conceito Fundamental**

Vetores são estruturas de dados que permitem armazenar diversos valores do mesmo tipo utilizando uma única variável indexada. Eles tornam os algoritmos menores, mais organizados e mais fáceis de manter. Quando combinados com estruturas de repetição, permitem processar grandes quantidades de dados com poucas linhas de código, sendo fundamentais em praticamente todas as linguagens de programação.

---

# Em Resumo

Nesta aula aprendi o conceito de vetores, entendendo que eles permitem armazenar vários valores utilizando uma única variável indexada. Também aprendi que, no VisualG, a indexação começa em zero e que os vetores normalmente são percorridos utilizando estruturas de repetição, como o `PARA`. Desenvolvi algoritmos para armazenar números, nomes, notas e países, percebendo como essa estrutura reduz a quantidade de código e facilita a manipulação de grandes conjuntos de dados. Além disso, tive uma introdução ao conceito de matrizes, que expandem a ideia dos vetores para duas dimensões.

**Resumo Relâmpago**

1. Estruturas de dados organizam informações na memória do computador.
2. Um vetor armazena vários valores do mesmo tipo em uma única variável.
3. No VisualG, a indexação do vetor normalmente começa em `0`.
4. Cada posição do vetor é acessada pelo índice, como `vet[0]` e `vet[1]`.
5. Vetores reduzem a quantidade de variáveis e deixam o código mais organizado.
6. O comando `PARA` é a forma mais comum de percorrer um vetor.
7. Um acumulador, como `soma <- soma + vetor[i]`, permite somar todos os elementos.
8. É possível armazenar números, textos e outros tipos de dados em vetores.
9. Matrizes são estruturas bidimensionais, organizadas em linhas e colunas.
10. Vetores e matrizes são fundamentais para desenvolver programas eficientes e escaláveis.
