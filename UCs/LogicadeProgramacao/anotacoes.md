# Lógica de Programação — Pesquisa, Números Aleatórios, Números Pares e Soma de Vetores

## 🎯 Ideia Principal

Nesta etapa, estou praticando **estruturas de dados junto com estruturas de repetição e condições**.

Os algoritmos trabalham com quatro situações diferentes:

1. 🔎 Pesquisar um nome dentro de um vetor.
2. 🎲 Gerar números aleatórios e localizar um número específico.
3. 🔢 Percorrer uma matriz, identificar números pares e armazená-los em outro vetor.
4. ➕ Somar os elementos de dois vetores e verificar se ambas as somas são iguais a 30.

Esses exercícios são importantes porque começam a mostrar uma característica essencial da programação: **não basta armazenar dados; preciso conseguir pesquisar, filtrar, contar, acumular e tomar decisões com eles.**

---

# 1. 🔎 Algoritmo para Encontrar um Nome

## Objetivo

Neste algoritmo, crio um vetor capaz de armazenar **5 nomes**.

Depois:

* Digito os 5 nomes;
* Escolho um nome para pesquisar;
* O programa percorre o vetor;
* Se encontrar o nome, mostra sua posição;
* Se não encontrar, informa que o nome não foi localizado;
* No final, pergunta se quero fazer outra pesquisa.

## Código

```portugol
algoritmo "Encontrar Nome"

var
   a: vetor[1..5] de caractere
   nome, resp: caractere
   aux, achei: inteiro

inicio

   para aux de 1 ate 5 passo 1 faca
      escreva(aux, " Informe um nome: ")
      leia(a[aux])
   fimpara

   repita

      achei <- 0

      escreval("Informe um nome para ser pesquisado")
      leia(nome)

      para aux de 1 ate 5 passo 1 faca

         se (a[aux] = nome) entao

            escreva("Nome encontrado: ", a[aux], " na posição ", aux)
            achei <- 1

         fimse

      fimpara

      se (achei <> 1) entao
         escreva("Não foi encontrado nenhum nome na pesquisa")
      fimse

      escreval("Deseja fazer outra pesquisa? S/N")
      leia(resp)

   ate resp <> "s"

fimalgoritmo
```

---

## 🔍 Entendendo o vetor

```portugol
a: vetor[1..5] de caractere
```

Crio um vetor chamado `a`, que possui cinco posições:

```text
a[1]
a[2]
a[3]
a[4]
a[5]
```

Cada posição armazenará um nome.

Por exemplo:

```text
a[1] = "João"
a[2] = "Maria"
a[3] = "Carlos"
a[4] = "Ana"
a[5] = "Pedro"
```

---

## 🔄 Cadastrando os nomes

```portugol
para aux de 1 ate 5 passo 1 faca
```

O `PARA` faz o contador `aux` percorrer:

```text
1 → 2 → 3 → 4 → 5
```

E:

```portugol
leia(a[aux])
```

significa que o nome digitado será armazenado na posição correspondente.

Quando `aux = 1`:

```portugol
leia(a[1])
```

Quando `aux = 2`:

```portugol
leia(a[2])
```

E assim por diante.

---

## 🔎 Procurando o nome

A pesquisa acontece dentro de:

```portugol
repita
```

Isso permite que eu faça várias pesquisas sem precisar reiniciar o programa.

A variável:

```portugol
achei <- 0
```

é um **indicador**.

Ela funciona como uma pequena "bandeira":

```text
0 → nome ainda não encontrado
1 → nome encontrado
```

Depois o programa percorre novamente o vetor:

```portugol
para aux de 1 ate 5 passo 1 faca
```

E compara:

```portugol
se (a[aux] = nome) entao
```

Se encontrar:

```portugol
achei <- 1
```

Isso informa ao programa que a pesquisa encontrou o nome.

---

## ❗ Operador `<>`

No final:

```portugol
se (achei <> 1) entao
```

`<>` significa **diferente de**.

Portanto:

```text
achei <> 1
```

significa:

> "achei é diferente de 1?"

Se for verdadeiro, significa que o nome não foi encontrado.

---

# 2. 🎲 Algoritmo para Sortear Números

## Objetivo

Agora crio um vetor com **30 números aleatórios**.

Depois o usuário informa um número que deseja pesquisar.

O programa mostra:

* As posições onde o número apareceu;
* Quantas vezes ele apareceu.

## Código

```portugol
algoritmo "Pesquisar Números Sorteados"

var
   numeros: vetor[1..30] de inteiro
   i, chave, vezes: inteiro

inicio

   vezes <- 0

   para i de 1 ate 30 faca
      numeros[i] <- RandI(15) + 1
   fimpara

   escreva("Digite um número a ser localizado: ")
   leia(chave)

   escreva()
   escreva("O número ", chave, " aparece nas seguintes posições:")
   escreva()

   para i de 1 ate 30 faca

      se (numeros[i] = chave) entao

         vezes <- vezes + 1

         escreval("[", numeros[i], "] posição => ", i)

      fimse

   fimpara

   escreva()
   escreval("O número ", chave, " apareceu => ", vezes, " vez(es)")
   escreva()

fimalgoritmo
```

---

## 🎰 `RandI(15) + 1`

Essa parte:

```portugol
numeros[i] <- RandI(15) + 1
```

gera números aleatórios.

O `RandI(15)` gera um número inteiro aleatório dentro do intervalo utilizado pelo Visualg, e o `+ 1` desloca o resultado para que os números utilizados fiquem entre **1 e 15**.

Assim, cada uma das 30 posições recebe um número aleatório.

Por exemplo:

```text
4  12  7  4  15
2  9   4  11 3
...
```

---

## 🔑 Variável `chave`

```portugol
chave: inteiro
```

A `chave` representa o número que estou procurando.

Se eu digitar:

```text
4
```

o programa procura:

```text
numeros[i] = 4
```

em todas as 30 posições.

---

## 🔢 Contando ocorrências

Sempre que encontra o número:

```portugol
vezes <- vezes + 1
```

O contador aumenta.

Por exemplo:

```text
vezes = 0
```

Primeiro `4` encontrado:

```text
vezes = 1
```

Segundo `4`:

```text
vezes = 2
```

Terceiro:

```text
vezes = 3
```

No final, sei quantas vezes o número apareceu.

---

# 3. 🔢 Algoritmo para Listar Números Pares

## Objetivo

Agora utilizo uma **matriz 3 × 3** para receber 9 números.

Depois verifico quais deles são pares.

Os números pares encontrados são armazenados em um segundo vetor.

---

## Código

```portugol
algoritmo "Listar Números Pares"

var
   numero: vetor[1..3, 1..3] de inteiro
   par: vetor[1..9] de inteiro
   i, j, vezes: inteiro

inicio

   vezes <- 0

   para i de 1 ate 3 faca

      para j de 1 ate 3 faca

         escreval("Digite um número:")
         leia(numero[i,j])

      fimpara

   fimpara

   para i de 1 ate 3 faca

      para j de 1 ate 3 faca

         se (numero[i,j] % 2 = 0) entao

            vezes <- vezes + 1
            par[vezes] <- numero[i,j]

         fimse

      fimpara

   fimpara

   escreval("A quantidade de pares: ", vezes)
   escreval("Pares digitados:")

   para i de 1 ate vezes faca
      escreval(par[i])
   fimpara

fimalgoritmo
```

---

# 4. 🧮 Como funciona a matriz?

```portugol
numero: vetor[1..3, 1..3] de inteiro
```

Isso cria uma matriz de:

```text
3 linhas × 3 colunas = 9 posições
```

Visualmente:

```text
        Colunas
       1   2   3

Linha 1 [ ] [ ] [ ]
Linha 2 [ ] [ ] [ ]
Linha 3 [ ] [ ] [ ]
```

Cada posição é identificada por dois índices:

```text
numero[linha,coluna]
```

Por exemplo:

```text
numero[1,1]
numero[1,2]
numero[1,3]

numero[2,1]
numero[2,2]
numero[2,3]

numero[3,1]
numero[3,2]
numero[3,3]
```

---

# 5. 🔄 Dois `PARA` para percorrer a matriz

Aqui aparecem dois laços:

```portugol
para i de 1 ate 3 faca

   para j de 1 ate 3 faca

      ...

   fimpara

fimpara
```

O `i` controla as **linhas**.

O `j` controla as **colunas**.

É como percorrer uma tabela:

```text
i = linha
j = coluna
```

O programa passa por todas as 9 posições.

---

# 6. 🟢 Como identificar números pares?

A condição é:

```portugol
se (numero[i,j] % 2 = 0) entao
```

O operador `%` calcula o **resto da divisão**.

Exemplo:

```text
10 % 2 = 0 → par
8 % 2 = 0  → par
7 % 2 = 1  → ímpar
5 % 2 = 1  → ímpar
```

Portanto:

```text
Resto 0 → PAR
Resto diferente de 0 → ÍMPAR
```

---

# 7. 📦 Armazenando somente os pares

Quando encontro um número par:

```portugol
vezes <- vezes + 1
par[vezes] <- numero[i,j]
```

Essas duas linhas trabalham juntas.

Primeiro:

```portugol
vezes <- vezes + 1
```

aumenta a quantidade de pares encontrados.

Depois:

```portugol
par[vezes] <- numero[i,j]
```

coloca o número par na próxima posição disponível do vetor.

### Exemplo

Se encontro:

```text
8
```

faço:

```text
vezes = 1
par[1] = 8
```

Depois encontro:

```text
4
```

faço:

```text
vezes = 2
par[2] = 4
```

Depois:

```text
10
```

resulta em:

```text
vezes = 3
par[3] = 10
```

No final:

```text
par = [8, 4, 10]
```

---

# 8. ➕ Algoritmo para Somar Dois Vetores

## Objetivo

Agora trabalho com dois vetores de cinco posições.

O programa:

1. Recebe os valores do primeiro vetor;
2. Calcula sua soma;
3. Recebe os valores do segundo vetor;
4. Calcula sua soma;
5. Verifica se **as duas somas são exatamente 30**.

---

## Código

```portugol
algoritmo "Soma dos Vetores"

var
   vetor1: vetor[1..5] de inteiro
   vetor2: vetor[1..5] de inteiro
   i, soma1, soma2: inteiro

inicio

   soma1 <- 0
   soma2 <- 0

   escreval("Digite os valores do primeiro vetor:")

   para i de 1 ate 5 faca

      escreva("Digite o ", i, "º valor: ")
      leia(vetor1[i])

      soma1 <- soma1 + vetor1[i]

   fimpara

   escreval()

   escreval("Digite os valores do segundo vetor:")

   para i de 1 ate 5 faca

      escreva("Digite o ", i, "º valor: ")
      leia(vetor2[i])

      soma2 <- soma2 + vetor2[i]

   fimpara

   escreval()

   escreval("Soma do primeiro vetor: ", soma1)
   escreval("Soma do segundo vetor: ", soma2)

   se (soma1 = 30) e (soma2 = 30) entao

      escreval("Os dois vetores possuem soma igual a 30.")

   senao

      escreval("A soma de um ou dos dois vetores não é igual a 30.")

   fimse

fimalgoritmo
```

---

# 9. 🧠 Acumuladores

Aqui aparecem:

```portugol
soma1 <- 0
soma2 <- 0
```

Essas variáveis são **acumuladores**.

Depois:

```portugol
soma1 <- soma1 + vetor1[i]
```

significa:

> Pegue o valor que já está em `soma1` e acrescente o novo elemento do vetor.

Imagine:

```text
soma1 = 0
```

Primeiro valor:

```text
5
```

Então:

```text
0 + 5 = 5
```

Segundo valor:

```text
10
```

Agora:

```text
5 + 10 = 15
```

Terceiro:

```text
15 + 3 = 18
```

E assim por diante.

---

# 10. 🔗 Operador lógico `E`

A condição final é:

```portugol
se (soma1 = 30) e (soma2 = 30) entao
```

O `E` exige que **as duas condições sejam verdadeiras**.

### Caso 1

```text
soma1 = 30
soma2 = 30
```

Resultado:

```text
VERDADEIRO E VERDADEIRO
```

✅ Os dois vetores possuem soma 30.

### Caso 2

```text
soma1 = 30
soma2 = 25
```

Resultado:

```text
VERDADEIRO E FALSO
```

❌ A condição inteira é falsa.

### Caso 3

```text
soma1 = 20
soma2 = 25
```

Resultado:

```text
FALSO E FALSO
```

❌ Também é falsa.

---

# 🔗 Ligação entre os quatro exercícios

Esses algoritmos estão começando a juntar vários conceitos que aprendi anteriormente.

```text
                 ESTRUTURAS DE DADOS
                         │
              ┌──────────┴──────────┐
              │                     │
            Vetor                 Matriz
              │                     │
       ┌──────┼──────┐              │
       │      │      │              │
    Pesquisa Contagem Soma       Filtragem
       │      │      │              │
       └──────┴──────┴──────────────┘
                         │
                    Condições
                         │
                  Tomada de decisão
```

O ponto importante é que um algoritmo pode combinar várias estruturas.

Por exemplo:

```text
Matriz
  ↓
PARA
  ↓
SE
  ↓
Verificar par
  ↓
Contador
  ↓
Vetor
```

---

# 🧠 Conceitos que estou consolidando

## 1. Vetor

Armazena vários valores do mesmo tipo em posições diferentes.

```portugol
vetor[1..5] de inteiro
```

---

## 2. Matriz

É uma estrutura com mais de uma dimensão.

```portugol
vetor[1..3,1..3] de inteiro
```

Posso pensar nela como uma **tabela**.

---

## 3. Contador

É uma variável usada para contar ocorrências.

```portugol
vezes <- vezes + 1
```

---

## 4. Acumulador

É uma variável usada para acumular valores.

```portugol
soma <- soma + valor
```

---

## 5. Indicador

É uma variável utilizada para representar um estado.

No algoritmo de pesquisa:

```portugol
achei <- 0
```

e:

```portugol
achei <- 1
```

representam:

```text
0 → não encontrou
1 → encontrou
```

---

## 6. Pesquisa sequencial

O algoritmo de nomes realiza uma **pesquisa sequencial**.

Ele começa na primeira posição e verifica uma por uma:

```text
posição 1
   ↓
posição 2
   ↓
posição 3
   ↓
posição 4
   ↓
posição 5
```

É uma das formas mais básicas de pesquisa em estruturas de dados.

---

# ⚡ Resumo Relâmpago — 10 linhas

1. Um vetor permite armazenar vários valores do mesmo tipo.
2. Uma matriz permite organizar valores em linhas e colunas.
3. A pesquisa de nomes percorre o vetor procurando uma correspondência.
4. A variável `achei` funciona como indicador de encontrado/não encontrado.
5. `<>` significa **diferente de**.
6. `RandI()` permite trabalhar com números inteiros aleatórios.
7. O operador `%` retorna o resto de uma divisão.
8. `vezes` funciona como contador de ocorrências.
9. `soma1` e `soma2` são acumuladores.
10. O operador `E` só produz verdadeiro quando **todas as condições** envolvidas são verdadeiras.
