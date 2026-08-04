# Lógica de Programação — Estruturas de Controle de Repetição (Laços de Repetição)

# 🎯 Ideia Principal

Nesta aula comecei a estudar as **estruturas de repetição**, também chamadas de **laços de repetição** ou **loops**.

Essas estruturas permitem que um mesmo bloco de código seja executado várias vezes, sem que seja necessário escrever as mesmas instruções repetidamente.

Imagine que seja necessário imprimir uma mensagem **100 vezes**.

Sem uma estrutura de repetição, seria preciso escrever:

```text
escreval("Olá")
escreval("Olá")
escreval("Olá")
...
100 vezes
```

Isso seria trabalhoso e pouco eficiente.

Com um laço de repetição basta escrever:

```text
Repita 100 vezes
    escreval("Olá")
```

O computador faz o restante automaticamente.

---

# O que são Estruturas de Repetição?

São estruturas utilizadas quando uma determinada tarefa precisa ser executada diversas vezes.

O programa continuará repetindo as instruções **até que uma condição de parada seja satisfeita**.

Essas estruturas são muito utilizadas em situações como:

* Cadastro de vários clientes.
* Leitura de notas de alunos.
* Impressão de listas.
* Tabuadas.
* Jogos.
* Sistemas bancários.
* Inteligência Artificial.
* Processamento de grandes quantidades de dados.

Sem os laços de repetição, praticamente qualquer programa moderno seria muito mais complexo.

---

# Variável Contador

Durante uma repetição, normalmente é necessário saber **quantas vezes o laço já foi executado**.

Para isso utiliza-se uma **variável contador**.

Os nomes mais utilizados são:

```text
i

ou

j
```

Esses nomes são uma convenção entre programadores.

Nada impede utilizar outro nome, mas `i` e `j` são os mais comuns por serem curtos e amplamente reconhecidos.

Exemplo:

```portugol
i <- 1
```

A cada repetição:

```portugol
i <- i + 1
```

Assim o contador vai aumentando:

```text
1

2

3

4

5
```

---

# Principais Estruturas de Repetição

No VisualG existem três estruturas principais:

## `PARA...FAÇA` (`for`)

Utilizada quando já sabemos quantas vezes a repetição ocorrerá.

---

## `ENQUANTO...FAÇA` (`while`)

Utilizada quando a repetição depende de uma condição.

Primeiro verifica a condição.

Depois executa o código.

---

## `REPITA...ATÉ` (`do...while`)

Executa o código primeiro.

Depois verifica a condição de parada.

Isso garante que o bloco será executado pelo menos uma vez.

---

# 1️⃣ Estrutura `PARA...FAÇA` (`for`)

## Quando utilizar?

Quando já sabemos exatamente quantas vezes uma ação será repetida.

Exemplos:

* Mostrar os números de 1 até 100.
* Ler as notas de 30 alunos.
* Imprimir uma mensagem 10 vezes.

---

## Código

```portugol
algoritmo "Para"

var

x, z, i: inteiro

inicio

escreval("Algoritmo para repetir uma ação 5 vezes")
escreval("Para cada ação, digite um número inteiro")
escreval("")
escreval("Digite um valor inteiro")

para i de 1 ate 5 faca

   leia(x)

   z <- x * 3

   escreval("O valor digitado ", x,
             " multiplicado por 3 é: ", z)

fimpara

fimalgoritmo
```

---

## Explicação Linha por Linha

### O contador

```portugol
para i de 1 ate 5 faca
```

Significa:

```text
Comece com i = 1

Execute o código

Depois aumente automaticamente para:

2

3

4

5

Quando passar de 5, o laço termina.
```

Não é necessário escrever:

```portugol
i <- i + 1
```

O próprio comando `PARA` faz isso automaticamente.

---

### Leitura

```portugol
leia(x)
```

A cada repetição o usuário informa um novo número.

---

### Processamento

```portugol
z <- x * 3
```

Multiplica o número informado por 3.

---

### Saída

```portugol
escreval(...)
```

Mostra o resultado da multiplicação.

---

## Exemplo

Entradas:

```text
2

5

8

10

12
```

Saídas:

```text
6

15

24

30

36
```

---

# 2️⃣ Estrutura `ENQUANTO...FAÇA` (`while`)

## Como funciona?

O `ENQUANTO` verifica a condição **antes** de executar o bloco.

Se a condição for falsa logo no início, o laço não será executado nenhuma vez.

---

## Código

```portugol
algoritmo "Enquanto"

var

x, z, i: inteiro

inicio

escreval("Algoritmo para repetir uma ação 5 vezes")
escreval("Para cada ação, digite um número inteiro")
escreval("")
escreval("Digite um valor inteiro")

leia(x)

i <- 1

enquanto (i <= 5) faca

   z <- x * 3

   escreval(z)

   i <- i + 1

fimenquanto

fimalgoritmo
```

---

## O que acontece?

O número é digitado apenas uma vez.

Exemplo:

```text
x = 8
```

Depois o algoritmo faz:

```text
8 × 3 = 24
```

Cinco vezes.

Resultado:

```text
24

24

24

24

24
```

---

## O contador

Aqui o contador precisa ser atualizado manualmente.

```portugol
i <- i + 1
```

Se essa linha fosse esquecida, a condição:

```text
i <= 5
```

Nunca deixaria de ser verdadeira.

O programa entraria em um **laço infinito**, executando o mesmo bloco sem parar.

---

# 3️⃣ Outro Exemplo com `ENQUANTO`

Agora a leitura do número foi colocada **dentro do laço**.

## Código

```portugol
algoritmo "Enquanto"

var

x, z, i: inteiro

inicio

i <- 1

enquanto (i <= 5) faca

   leia(x)

   z <- x * 3

   escreval(z)

   i <- i + 1

fimenquanto

fimalgoritmo
```

---

## Diferença para o exemplo anterior

No primeiro exemplo:

```text
O número é digitado apenas uma vez.
```

No segundo:

```text
O usuário informa um número diferente a cada repetição.
```

Exemplo:

```text
2

4

6

8

10
```

Resultados:

```text
6

12

18

24

30
```

Essa pequena mudança altera completamente o comportamento do algoritmo.

---

# 4️⃣ Estrutura `REPITA...ATÉ` (`do...while`)

## Como funciona?

Diferentemente do `ENQUANTO`, o `REPITA` executa o bloco primeiro.

Somente depois verifica a condição de parada.

Por isso ele sempre executa pelo menos uma vez.

---

## Código

```portugol
algoritmo "Repita"

var

x, z, i: inteiro

inicio

i <- 1

repita

   leia(x)

   z <- x * 3

   escreval(z)

   i <- i + 1

ate (i > 5)

fimalgoritmo
```

---

## Explicação

O algoritmo executa:

```text
1ª repetição

↓

Verifica

↓

2ª repetição

↓

Verifica

↓

...

↓

Quando i for maior que 5

↓

Encerra
```

A condição no `REPITA` representa **o momento de parar**, e não de continuar.

---

# Comparando `ENQUANTO` e `REPITA`

| ENQUANTO (`while`)                                    | REPITA (`do...while`)                                     |
| ----------------------------------------------------- | --------------------------------------------------------- |
| Verifica a condição antes de executar                 | Executa primeiro e verifica depois                        |
| Pode não executar nenhuma vez                         | Executa pelo menos uma vez                                |
| Muito usado quando a condição deve ser validada antes | Muito usado quando é necessário executar ao menos uma vez |

---

# 5️⃣ Tabuada Utilizando `REPITA`

## Objetivo

Mostrar a tabuada de um número de 1 até 10.

---

## Código

```portugol
algoritmo "Tabuada"

var

numero, contagem: inteiro

inicio

contagem <- 1

escreva("Mostra a tabuada do número: ")
leia(numero)

repita

   escreval(numero, " x ", contagem,
            " = ", numero * contagem)

   contagem <- contagem + 1

ate (contagem > 10)

fimalgoritmo
```

---

## Explicação Linha por Linha

### Contador

```portugol
contagem <- 1
```

A tabuada sempre começa no número 1.

---

### `escreva`

```portugol
escreva(...)
```

Diferente de:

```portugol
escreval(...)
```

O comando `escreva` **não pula para a próxima linha**, permitindo que o usuário digite o valor na mesma linha da mensagem.

Exemplo:

```text
Mostra a tabuada do número: 7
```

Já `escreval` faria:

```text
Mostra a tabuada do número:

7
```

---

### Impressão

```portugol
numero * contagem
```

Se o usuário informar:

```text
7
```

O algoritmo gera:

```text
7 x 1 = 7

7 x 2 = 14

7 x 3 = 21

...

7 x 10 = 70
```

---

# 🧠 Conceito Fundamental

As estruturas de repetição permitem que um bloco de código seja executado várias vezes de forma automática, eliminando a necessidade de escrever instruções repetidas. Cada tipo de laço possui uma finalidade específica:

* **`PARA` (`for`)**: ideal quando a quantidade de repetições é conhecida.
* **`ENQUANTO` (`while`)**: ideal quando a repetição depende de uma condição avaliada antes da execução.
* **`REPITA...ATÉ` (`do...while`)**: ideal quando o bloco precisa ser executado pelo menos uma vez.

Escolher a estrutura correta torna o algoritmo mais eficiente, organizado e fácil de manter.

---

# ✅ Em Resumo

Nesta aula aprendi as três principais estruturas de repetição do VisualG: `PARA`, `ENQUANTO` e `REPITA...ATÉ`. Também compreendi a importância da variável contador (`i` ou `j`) para controlar quantas vezes um laço será executado. Desenvolvi exemplos de multiplicação repetitiva e uma tabuada, entendendo as diferenças entre cada estrutura e quando utilizar cada uma delas.

# ⚡ Resumo Relâmpago (10 linhas)

1. Estruturas de repetição executam um mesmo bloco de código várias vezes.
2. A variável contador controla quantas vezes o laço será executado.
3. `PARA` (`for`) é usado quando o número de repetições é conhecido.
4. `ENQUANTO` (`while`) verifica a condição antes de executar o bloco.
5. `REPITA...ATÉ` (`do...while`) executa o bloco antes de verificar a condição.
6. O contador deve ser atualizado manualmente no `ENQUANTO` e no `REPITA`.
7. Esquecer de atualizar o contador pode causar um laço infinito.
8. `escreva` não quebra linha; `escreval` quebra a linha após a mensagem.
9. A tabuada é um exemplo clássico de uso de estruturas de repetição.
10. Os laços de repetição são fundamentais para automatizar tarefas repetitivas em qualquer linguagem de programação.
