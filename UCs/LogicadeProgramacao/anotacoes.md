# Lógica de Programação — Exercícios Práticos com Estruturas Condicionais, Vetores e Laços de Repetição

# 🎯 Ideia Principal

Nesta aula foram desenvolvidos algoritmos que unem praticamente todos os conceitos estudados até agora:

* Entrada e saída de dados;
* Variáveis;
* Operadores aritméticos;
* Operadores relacionais;
* Estruturas condicionais (`SE...SENÃO`);
* Estruturas de repetição (`PARA`);
* Vetores.

O objetivo foi resolver problemas reais, mostrando que um algoritmo normalmente utiliza vários conceitos ao mesmo tempo.

---

# 1️⃣ Resolver uma Equação do 2º Grau (Fórmula de Bhaskara)

## O que é uma Equação do 2º Grau?

Uma equação do segundo grau possui a seguinte forma:

```text
ax² + bx + c = 0
```

Onde:

* **a** → coeficiente do termo quadrático.
* **b** → coeficiente do termo linear.
* **c** → termo independente (constante).

Exemplo:

```text
2x² + 5x - 3 = 0
```

---

## Importante

Para ser realmente uma equação do segundo grau:

```text
a ≠ 0
```

Se:

```text
a = 0
```

a equação deixa de ser de segundo grau e passa a ser uma equação de primeiro grau.

Por isso o algoritmo faz essa validação antes de qualquer cálculo.

---

# O que é Delta (Δ)?

Antes de calcular as raízes, precisamos descobrir o valor de **Delta (Δ)**.

A fórmula é:

```text
Δ = b² - 4ac
```

O valor de Delta determina quantas raízes reais a equação possui.

---

## Situações possíveis

### Δ < 0

Não existem raízes reais.

---

### Δ = 0

Existe apenas uma raiz real.

---

### Δ > 0

Existem duas raízes reais diferentes.

---

## Código

```portugol
algoritmo "Equacao do 2 Grau"

var

a, b, c, delta, x1, x2: real

inicio

// Entrada de dados

escreval("Algoritmo para Calcular a Equação do 2º Grau")
escreval("ax² + bx + c = 0")
escreval("")

escreval("Digite o valor de a:")
leia(a)

escreval("Digite o valor de b:")
leia(b)

escreval("Digite o valor de c:")
leia(c)

// Verifica se realmente é uma equação do 2º grau

se (a = 0) entao

   escreval("O valor de 'a' não pode ser zero.")

senao

   delta <- (b * b) - (4 * a * c)

   se (delta < 0) entao

      escreval("Delta = ", delta:0:2)
      escreval("Não existem raízes reais.")

   senao

      se (delta = 0) entao

         x1 <- (-b) / (2 * a)

         escreval("Delta = 0")
         escreval("Raiz única: ", x1:0:2)

      senao

         x1 <- (-b + raizq(delta)) / (2 * a)
         x2 <- (-b - raizq(delta)) / (2 * a)

         escreval("Delta = ", delta:0:2)
         escreval("x1 = ", x1:0:2)
         escreval("x2 = ", x2:0:2)

      fimse

   fimse

fimse

fimalgoritmo
```

---

# Explicação Linha por Linha

## Entrada

```portugol
leia(a)
leia(b)
leia(c)
```

Recebe os três coeficientes da equação.

---

## Verificação

```portugol
se (a = 0)
```

Verifica se realmente é uma equação do segundo grau.

---

## Cálculo de Delta

```portugol
delta <- (b * b) - (4 * a * c)
```

É aplicada exatamente a fórmula matemática de Bhaskara.

---

## Raiz Quadrada

```portugol
raizq(delta)
```

A função `raizq()` calcula a raiz quadrada de um número.

Exemplo:

```text
raizq(25)

Resultado:

5
```

---

## Formatação

```portugol
delta:0:2
```

Significa:

Mostrar duas casas decimais.

Exemplo:

```text
5,33
```

---

# Exemplo

Equação:

```text
x² - 5x + 6 = 0
```

Delta:

```text
25 - 24

=

1
```

Raízes:

```text
x1 = 3

x2 = 2
```

---

# 2️⃣ Verificar se um Número é Par ou Ímpar

## Conceito

Um número é considerado par quando sua divisão por 2 possui resto igual a zero.

Para isso utiliza-se o operador:

```text
%
```

No VisualG também pode ser escrito como `mod`.

Ele retorna o resto da divisão inteira.

Exemplos:

```text
10 % 2 = 0

11 % 2 = 1

18 % 2 = 0

25 % 2 = 1
```

---

## Código

```portugol
algoritmo "Par ou Impar"

var

numero: inteiro

inicio

escreval("Digite um número:")
leia(numero)

se (numero % 2 = 0) entao

   escreval("O número ", numero, " é PAR")

senao

   escreval("O número ", numero, " é ÍMPAR")

fimse

fimalgoritmo
```

---

## Observação

Nas anotações originais, a mensagem do bloco `senao` estava escrita como **"é par"**. O correto é **"é ímpar"**, pois o bloco `senao` é executado quando o resto da divisão por 2 é diferente de zero.

---

# 3️⃣ Encontrar o Maior e o Menor Valor de um Vetor

## Objetivo

Ler dez números e mostrar:

* todos os números digitados;
* maior valor;
* menor valor;
* posição do maior;
* posição do menor.

---

## Código

```portugol
algoritmo "Maior e Menor"

var

valores: vetor[1..10] de inteiro
i, maior, menor, posMaior, posMenor: inteiro

inicio

// Leitura dos valores

para i de 1 ate 10 faca

   escreval("Digite o ", i, "º número")
   leia(valores[i])

fimpara

// Inicialização

maior <- valores[1]
menor <- valores[1]

posMaior <- 1
posMenor <- 1

// Procura maior e menor

para i de 1 ate 10 faca

   se (valores[i] > maior) entao

      maior <- valores[i]
      posMaior <- i

   fimse

   se (valores[i] < menor) entao

      menor <- valores[i]
      posMenor <- i

   fimse

fimpara

// Exibe todos os elementos

escreval("Elementos do vetor:")

para i de 1 ate 10 faca

   escreval(valores[i])

fimpara

escreval("")
escreval("Maior valor: ", maior, " na posição ", posMaior)
escreval("Menor valor: ", menor, " na posição ", posMenor)

fimalgoritmo
```

---

# Como o algoritmo funciona?

Primeiro, todos os valores são armazenados no vetor.

Depois, considera-se inicialmente que:

```text
Primeiro número = Maior

Primeiro número = Menor
```

Em seguida, o algoritmo percorre novamente o vetor comparando cada elemento.

Sempre que encontra um número maior:

```text
Atualiza o maior.
```

Sempre que encontra um número menor:

```text
Atualiza o menor.
```

No final teremos os extremos do vetor.

Essa técnica é muito utilizada em processamento de listas, estatísticas e bancos de dados.

---

# 4️⃣ Cálculo do Fatorial

## O que é Fatorial?

O fatorial de um número é o produto dele por todos os seus antecessores positivos até 1.

Representação:

```text
5!
```

Lê-se:

```text
Cinco fatorial.
```

---

## Exemplo

```text
5!

=

5 × 4 × 3 × 2 × 1

=

120
```

Outro exemplo:

```text
4!

=

4 × 3 × 2 × 1

=

24
```

---

## Código

```portugol
algoritmo "Fatorial"

var

num, i, fatorial: inteiro

inicio

escreval("Digite um número inteiro positivo:")
leia(num)

// Validação

se (num < 0) entao

   escreval("Erro: não existe fatorial de número negativo.")

senao

   fatorial <- 1

   para i de 1 ate num faca

      fatorial <- fatorial * i

   fimpara

   escreval("O fatorial de ", num, " é: ", fatorial)

fimse

fimalgoritmo
```

---

## Explicação

### Inicialização

```portugol
fatorial <- 1
```

Começamos com 1 porque ele é o elemento neutro da multiplicação.

Se começássemos com zero:

```text
0 × qualquer número = 0
```

Todo o resultado seria incorreto.

---

### Multiplicação acumulativa

```portugol
fatorial <- fatorial * i
```

Exemplo para:

```text
5!
```

Passo a passo:

```text
1 × 1 = 1

1 × 2 = 2

2 × 3 = 6

6 × 4 = 24

24 × 5 = 120
```

Resultado final:

```text
120
```

---

## Curiosidade

Matematicamente:

```text
0! = 1
```

Por isso, a validação ideal é impedir apenas números **negativos** (`num < 0`). O valor **0** possui fatorial definido e igual a **1**.

---

# 🧠 Conceito Fundamental

Nesta aula foi possível integrar diversos conceitos da lógica de programação em algoritmos mais completos. Foram utilizadas estruturas condicionais para validar dados e tomar decisões, laços de repetição para automatizar cálculos e vetores para armazenar conjuntos de informações. Também foram aplicados conceitos matemáticos importantes, como a Fórmula de Bhaskara, o operador módulo (`%`) e o cálculo de fatorial, mostrando como a programação pode resolver problemas matemáticos e do cotidiano de forma eficiente.

---

# ✅ Em Resumo

Nesta aula desenvolvi algoritmos para resolver equações do segundo grau, identificar números pares e ímpares, localizar o maior e o menor elemento de um vetor e calcular o fatorial de um número. Esses exercícios consolidaram o uso conjunto de estruturas condicionais, vetores, laços de repetição e operações matemáticas, tornando os algoritmos mais completos e próximos de aplicações reais.

# ⚡ Resumo Relâmpago (10 linhas)

1. A equação do 2º grau possui a forma `ax² + bx + c = 0`, com `a ≠ 0`.
2. O valor de Delta (`Δ = b² - 4ac`) determina a quantidade de raízes reais.
3. A função `raizq()` calcula a raiz quadrada no VisualG.
4. O operador `%` (ou `mod`) retorna o resto da divisão inteira.
5. Um número é par quando `numero % 2 = 0`; caso contrário, é ímpar.
6. Vetores permitem armazenar vários valores e percorrê-los com laços de repetição.
7. Para encontrar o maior e o menor valor, compara-se cada elemento do vetor com os valores atuais.
8. O fatorial é a multiplicação do número por todos os inteiros positivos até 1.
9. O valor de `0!` é igual a `1`, enquanto números negativos não possuem fatorial definido.
10. Esses exercícios demonstram como combinar matemática e programação para resolver problemas de forma estruturada.
