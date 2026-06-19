# Lógica de Programação — Exercícios Práticos no VisualG

# 🎯 Ideia Principal

Nesta aula, pratiquei a criação de algoritmos no VisualG utilizando os conceitos fundamentais de programação:

* Entrada de dados (`leia`)
* Saída de dados (`escreval`)
* Variáveis
* Operações matemáticas
* Atribuição de valores
* Processamento de dados

O objetivo desses exercícios foi transformar problemas do cotidiano em algoritmos capazes de realizar cálculos automaticamente.

---

# 1️⃣ Calculadora Simples

## Objetivo

Criar uma calculadora capaz de realizar as quatro operações matemáticas básicas:

* Soma
* Subtração
* Multiplicação
* Divisão

---

## Código Completo

```portugol
algoritmo "Calculadora"

var

num1, num2, resSoma, resSub, resMult, resDiv: real

inicio

// Bloco de Entrada de Dados

escreval("Digite o primeiro número")
leia(num1)

escreval("Digite o segundo número")
leia(num2)

// Bloco de Processamento de Dados

resSoma <- num1 + num2
resSub <- num1 - num2
resMult <- num1 * num2
resDiv <- num1 / num2

// Bloco de Saída de Dados

escreval("A soma dos dois valores é: ", resSoma)
escreval("A subtração dos dois valores é: ", resSub)
escreval("A multiplicação dos dois valores é: ", resMult)
escreval("A divisão dos dois valores é: ", resDiv)

fimalgoritmo
```

---

## Explicação Linha por Linha

### Declaração das Variáveis

```portugol
num1, num2, resSoma, resSub, resMult, resDiv: real
```

Cria seis variáveis do tipo real.

| Variável | Função                     |
| -------- | -------------------------- |
| num1     | Primeiro número digitado   |
| num2     | Segundo número digitado    |
| resSoma  | Resultado da soma          |
| resSub   | Resultado da subtração     |
| resMult  | Resultado da multiplicação |
| resDiv   | Resultado da divisão       |

Foi utilizado o tipo `real` porque o usuário pode digitar números com casas decimais.

Exemplo:

```text
10,5
7,8
3,14
```

---

### Entrada de Dados

```portugol
escreval("Digite o primeiro número")
leia(num1)
```

Exibe uma mensagem e aguarda o usuário digitar um valor.

O valor digitado será armazenado dentro da variável `num1`.

---

```portugol
escreval("Digite o segundo número")
leia(num2)
```

Repete o mesmo processo para a segunda variável.

---

### Processamento

```portugol
resSoma <- num1 + num2
```

Soma os dois números.

---

```portugol
resSub <- num1 - num2
```

Subtrai o segundo número do primeiro.

---

```portugol
resMult <- num1 * num2
```

Multiplica os dois valores.

---

```portugol
resDiv <- num1 / num2
```

Divide o primeiro valor pelo segundo.

---

### Saída de Dados

```portugol
escreval("A soma dos dois valores é: ", resSoma)
```

Mostra o resultado da soma.

---

```portugol
escreval("A subtração dos dois valores é: ", resSub)
```

Mostra o resultado da subtração.

---

```portugol
escreval("A multiplicação dos dois valores é: ", resMult)
```

Mostra o resultado da multiplicação.

---

```portugol
escreval("A divisão dos dois valores é: ", resDiv)
```

Mostra o resultado da divisão.

---

## Estrutura Utilizada

Este programa já segue a estrutura clássica de qualquer sistema:

```text
Entrada → Processamento → Saída
```

Essa é uma das estruturas mais importantes da informática.

---

# 2️⃣ Expressão Numérica

## Objetivo

Resolver uma expressão matemática utilizando variáveis.

---

## Código Completo

```portugol
algoritmo "Expressao Numerica"

var

num1, num2, result: real

inicio

num1 <- 2
num2 <- 3

// Processamento dos Dados

result <- ((num1 + num2) * (num1 - num2)) / 4

// Saída de Dados

escreval("Cálculo da expressão ((a+b)*(a-b))/4")
escreval("O resultado da expressão numérica é: ", result)

fimalgoritmo
```

---

## O que mudou?

Neste algoritmo não existe entrada de dados.

O usuário não digita nada.

Os valores já são definidos pelo programador.

---

```portugol
num1 <- 2
num2 <- 3
```

O operador `<-` significa "recebe".

Podemos ler assim:

```text
num1 recebe 2
num2 recebe 3
```

---

## Resolvendo a Expressão

A expressão é:

```text
((a+b)*(a-b))/4
```

Substituindo pelos valores:

```text
((2+3)*(2-3))/4
```

Primeiro:

```text
(5 * -1)/4
```

Depois:

```text
-5/4
```

Resultado:

```text
-1,25
```

---

## Importância do Uso dos Parênteses

Os parênteses controlam a ordem das operações.

Sem eles o resultado poderia ser diferente.

Lembrando da regra:

### PEMDAS

| Letra | Operação      |
| ----- | ------------- |
| P     | Parênteses    |
| E     | Expoentes     |
| M     | Multiplicação |
| D     | Divisão       |
| A     | Adição        |
| S     | Subtração     |

---

# 3️⃣ Cálculo da Altura de um Prédio

## Objetivo

Criar um programa capaz de calcular a altura de um prédio utilizando a sombra como referência.

---

## Código Informado

```portugol
algoritmo "Altura do Predio"

var

comprimentoSombra, alturaReferencia, alturaPredio: real

inicio

escreval("Digite o comprimento da sombra do prédio")
leia(comprimentoSombra)

escreval("Digite a altura de referência")
leia(alturaReferencia)

alturaPredio <- alturaReferencia * (comprimentoSombra / comprimentoSombra)

escreval("A altura do prédio é: ", alturaPredio)

fimalgoritmo
```

---

## Observação Importante

Da forma como está escrito:

```portugol
comprimentoSombra / comprimentoSombra
```

o resultado será sempre:

```text
1
```

Porque qualquer número dividido por ele mesmo resulta em 1.

Exemplo:

```text
10 ÷ 10 = 1
50 ÷ 50 = 1
100 ÷ 100 = 1
```

Consequentemente:

```portugol
alturaPredio <- alturaReferencia * 1
```

O resultado será sempre igual à altura de referência.

---

## Como normalmente esse problema é resolvido

Em matemática usamos semelhança de triângulos.

Seriam necessárias informações como:

* Altura de um objeto de referência.
* Sombra do objeto de referência.
* Sombra do prédio.

Então:

```text
Altura do prédio =
(Altura da referência × Sombra do prédio)
/ Sombra da referência
```

Isso gera um resultado proporcional.

---

# 4️⃣ Área de um Quadrado

## Objetivo

Calcular a área de um quadrado.

---

## Conceito Matemático

A fórmula da área do quadrado é:

```text
Área = lado × lado
```

ou

```text
Área = lado²
```

---

## Código

```portugol
algoritmo "Area do Quadrado"

var

result, lado: real

inicio

escreval("Cálculo da área do quadrado")

escreval("Digite a medida de um dos lados do quadrado")
leia(lado)

result <- lado * lado

escreval("A área do quadrado é: ", result, " m²")

fimalgoritmo
```

---

## Exemplo

Se:

```text
lado = 5
```

Então:

```text
área = 5 × 5
área = 25
```

Resultado:

```text
25 m²
```

---

# 5️⃣ Área do Retângulo (Exercício Feito por Mim)

## Objetivo

Calcular a área de um retângulo.

---

## Fórmula

```text
Área = Base × Altura
```

ou

```text
Área = lado maior × lado menor
```

---

## Código

```portugol
algoritmo "Area do Retangulo"

var

result, ladoMenor, ladoMaior: real

inicio

escreval("Cálculo da área do retângulo")

escreval("Digite o lado maior do retângulo")
leia(ladoMaior)

escreval("Digite o lado menor do retângulo")
leia(ladoMenor)

result <- ladoMaior * ladoMenor

escreval("A área do retângulo é: ", result, " m²")

fimalgoritmo
```

---

## Exemplo

Se:

```text
ladoMaior = 8
ladoMenor = 4
```

Então:

```text
8 × 4 = 32
```

Resultado:

```text
32 m²
```

---

# 6️⃣ Comissão sobre Vendas (Exercício Feito por Mim)

## Objetivo

Calcular a comissão de um vendedor.

---

## Comissão Definida

```text
12%
```

---

## Código

```portugol
algoritmo "Comissao"

var

vendas, comissao, resultado: real

inicio

escreval("========")
escreval("Magazine das Roupas")
escreval("========")
escreval("")

escreval("Digite o total das vendas realizadas pelo vendedor:")
leia(vendas)

comissao <- 12/100

resultado <- vendas * comissao

escreval("A comissão do vendedor é de R$: ", resultado)

fimalgoritmo
```

---

## Explicando o Cálculo

```portugol
comissao <- 12/100
```

Transforma:

```text
12%
```

em:

```text
0,12
```

---

Se o vendedor vendeu:

```text
R$ 5.000
```

Então:

```text
5000 × 0,12
```

Resultado:

```text
R$ 600
```

---

# 7️⃣ Desconto para Cliente (Exercício Feito por Mim)

## Objetivo

Aplicar desconto de 15% em uma compra.

---

## Código

```portugol
algoritmo "Desconto Cliente"

var

valCompra, valFinal, desconto: real
cliente: caractere

inicio

escreval("Escreva o valor da compra")
leia(valCompra)

escreval("Digite o nome do cliente")
leia(cliente)

desconto <- valCompra * 15/100

valFinal <- valCompra - desconto

escreval("O cliente é: ", cliente)
escreval("O valor da compra é: ", valCompra)
escreval("O valor a ser descontado é: ", desconto)
escreval("O valor final é: ", valFinal)

fimalgoritmo
```

---

## Como o cálculo funciona

### Primeiro

Calcula o desconto:

```portugol
desconto <- valCompra * 15/100
```

---

### Depois

Subtrai o desconto:

```portugol
valFinal <- valCompra - desconto
```

---

## Exemplo

Compra:

```text
R$ 1.000
```

Desconto:

```text
15% de 1000 = 150
```

Valor final:

```text
1000 - 150 = 850
```

Resultado:

```text
Valor final = R$ 850
```

---

# 🧠 Conceito Fundamental

Todos os exercícios desta aula seguem a mesma lógica:

```text
1. Criar variáveis
2. Receber dados
3. Processar informações
4. Exibir resultados
```

Essa estrutura é a base da programação.

Independentemente da linguagem utilizada futuramente (Python, Java, C#, PHP ou JavaScript), o raciocínio continuará sendo exatamente o mesmo.

---

# ✅ Em Resumo

Nesta aula pratiquei a criação de algoritmos no VisualG utilizando operações matemáticas, variáveis, entrada e saída de dados. Desenvolvi uma calculadora simples, resolvi uma expressão numérica, calculei áreas geométricas, comissão de vendas e desconto para clientes. Também observei que um algoritmo precisa ser analisado cuidadosamente para verificar se a fórmula utilizada realmente resolve o problema proposto. Além disso, comecei a criar algoritmos próprios, exercitando o raciocínio lógico e a capacidade de transformar problemas do mundo real em soluções computacionais.

# ⚡ Resumo Relâmpago (10 linhas)

1. Todo programa segue a lógica Entrada → Processamento → Saída.
2. Variáveis armazenam informações temporariamente na memória.
3. O tipo `real` permite trabalhar com números decimais.
4. A calculadora realizou soma, subtração, multiplicação e divisão.
5. Valores podem ser definidos diretamente no código sem entrada do usuário.
6. Parênteses controlam a ordem das operações matemáticas.
7. A área do quadrado é calculada por `lado × lado`.
8. A área do retângulo é calculada por `lado maior × lado menor`.
9. Porcentagens podem ser convertidas para decimal dividindo por 100.
10. Criar algoritmos próprios é uma das melhores formas de desenvolver lógica de programação.
