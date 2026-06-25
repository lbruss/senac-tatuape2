# Lógica de Programação — Estruturas Condicionais Encadeadas (SE, SENÃO SE e SENÃO)

# 🎯 Ideia Principal

Nesta aula aprofundei o uso das estruturas condicionais, permitindo que um algoritmo tome decisões mais complexas.

Até agora eu utilizava apenas:

```text
SE condição
    faça algo
SENÃO
    faça outra coisa
FIMSE
```

Agora comecei a utilizar condições encadeadas:

```text
SE condição 1
    faça algo
SENÃO
    SE condição 2
        faça outra coisa
    SENÃO
        faça uma terceira coisa
    FIMSE
FIMSE
```

Esse tipo de estrutura é extremamente comum em sistemas reais porque normalmente existem várias possibilidades para uma mesma situação.

Exemplos:

* Aprovar, recuperar ou reprovar um aluno.
* Calcular diferentes valores de frete.
* Aplicar reajustes salariais diferentes.
* Classificar clientes em categorias.
* Definir descontos conforme o valor da compra.

---

# 1️⃣ Média Escolar com Recuperação

## Objetivo

Classificar um aluno em:

* Aprovado
* Recuperação
* Reprovado

---

## Código

```portugol
algoritmo "Media Escolar"

var

media, n1, n2, n3, n4: real

inicio

escreval("Entre com a nota 1")
leia(n1)

escreval("Entre com a nota 2")
leia(n2)

escreval("Entre com a nota 3")
leia(n3)

escreval("Entre com a nota 4")
leia(n4)

media <- (n1 + n2 + n3 + n4) / 4

se (media >= 6) entao

   escreval("Aluno Aprovado")

senao

   se (media >= 5) entao

      escreval("Aluno em Recuperação")

   senao

      escreval("Aluno Reprovado")

   fimse

fimse

fimalgoritmo
```

---

## Como o algoritmo pensa

### Primeira verificação

```portugol
se (media >= 6)
```

Pergunta:

```text
A média é maior ou igual a 6?
```

Se sim:

```text
Aluno Aprovado
```

O algoritmo termina a decisão.

---

### Segunda verificação

Caso a primeira condição seja falsa:

```portugol
se (media >= 5)
```

Agora ele pergunta:

```text
A média é maior ou igual a 5?
```

Se sim:

```text
Aluno em Recuperação
```

---

### Última possibilidade

Se nenhuma condição anterior for verdadeira:

```text
Aluno Reprovado
```

---

## Exemplo 1

Notas:

```text
8
7
6
9
```

Média:

```text
(8+7+6+9)/4

30/4

7,5
```

Resultado:

```text
Aluno Aprovado
```

---

## Exemplo 2

Notas:

```text
5
5
6
4
```

Média:

```text
20/4

5
```

Resultado:

```text
Aluno em Recuperação
```

---

## Exemplo 3

Notas:

```text
4
3
5
4
```

Média:

```text
16/4

4
```

Resultado:

```text
Aluno Reprovado
```

---

# 2️⃣ Sistema de Frete

## Objetivo

Calcular o valor do frete de acordo com o valor da compra.

---

## Regras

| Valor da Compra      | Frete    |
| -------------------- | -------- |
| Acima de R$ 300      | Grátis   |
| R$ 200 até R$ 299,99 | R$ 15,50 |
| R$ 150 até R$ 199,99 | R$ 25,50 |
| Abaixo de R$ 150     | R$ 37,50 |

---

## Código Organizado

```portugol
algoritmo "Frete"

var

valorDaCompra, valorFinal: real

inicio

escreval("Digite o valor da compra:")
leia(valorDaCompra)

se (valorDaCompra >= 300) entao

   escreval("Frete Grátis")

senao

   se (valorDaCompra >= 200) entao

      valorFinal <- valorDaCompra + 15.50

      escreval("Você pagará R$ 15,50 de frete")
      escreval("O valor total da compra é R$ ", valorFinal)

   senao

      se (valorDaCompra >= 150) entao

         valorFinal <- valorDaCompra + 25.50

         escreval("Você pagará R$ 25,50 de frete")
         escreval("O valor total da compra é R$ ", valorFinal)

      senao

         valorFinal <- valorDaCompra + 37.50

         escreval("Você pagará R$ 37,50 de frete")
         escreval("O valor total da compra é R$ ", valorFinal)

      fimse

   fimse

fimse

fimalgoritmo
```

---

## Entendendo a Lógica

Imagine uma loja virtual.

Primeiro ela verifica:

```text
Compra acima de R$ 300?
```

Se sim:

```text
Frete grátis
```

Caso contrário:

```text
Compra acima de R$ 200?
```

Se sim:

```text
Frete de R$ 15,50
```

Caso contrário:

```text
Compra acima de R$ 150?
```

Se sim:

```text
Frete de R$ 25,50
```

Caso contrário:

```text
Frete de R$ 37,50
```

---

## Analogia

Pense como uma escada de decisões:

```text
Compra >= 300 ?
        ↓
      Sim → Frete Grátis

      Não
        ↓

Compra >= 200 ?
        ↓
      Sim → Frete 15,50

      Não
        ↓

Compra >= 150 ?
        ↓
      Sim → Frete 25,50

      Não
        ↓

Frete 37,50
```

---

# 3️⃣ Reajuste Salarial por Faixa (Exercício Feito por Mim)

## Objetivo

Aplicar diferentes reajustes salariais conforme a faixa salarial.

---

## Regras

| Salário                      | Reajuste |
| ---------------------------- | -------- |
| Acima de R$ 3.000            | 5%       |
| Entre R$ 2.000 e R$ 2.999,99 | 10%      |
| Abaixo de R$ 2.000           | 15%      |

---

## Código Organizado

```portugol
algoritmo "Reajuste Salarial"

var

salario, valorFinal, aumento1, aumento2, aumento3: real
nome: caractere

inicio

escreval("Digite o seu nome")
leia(nome)

escreval("Digite o seu salário")
leia(salario)

escreval("Funcionário: ", nome)

se (salario >= 3000) entao

   aumento1 <- 5/100

   valorFinal <- salario + (salario * aumento1)

   escreval("O seu salário teve um reajuste de 5%")
   escreval("Foi de R$ ", salario, " para R$ ", valorFinal)

senao

   se (salario >= 2000) entao

      aumento2 <- 10/100

      valorFinal <- salario + (salario * aumento2)

      escreval("O seu salário teve um reajuste de 10%")
      escreval("Foi de R$ ", salario, " para R$ ", valorFinal)

   senao

      aumento3 <- 15/100

      valorFinal <- salario + (salario * aumento3)

      escreval("O seu salário teve um reajuste de 15%")
      escreval("Foi de R$ ", salario, " para R$ ", valorFinal)

   fimse

fimse

fimalgoritmo
```

---

## Explicação da Lógica

O algoritmo verifica primeiro o maior salário.

### Faixa 1

```portugol
se (salario >= 3000)
```

Recebe:

```text
5%
```

---

### Faixa 2

```portugol
se (salario >= 2000)
```

Recebe:

```text
10%
```

---

### Faixa 3

Todos os demais recebem:

```text
15%
```

---

## Exemplo

Salário:

```text
R$ 2.500
```

O algoritmo verifica:

```text
2500 >= 3000 ?
```

Falso.

Depois:

```text
2500 >= 2000 ?
```

Verdadeiro.

Aplica:

```text
10%
```

Cálculo:

```text
2500 × 0,10

250
```

Novo salário:

```text
2500 + 250

2750
```

Resultado:

```text
R$ 2.750
```

---

# 🧠 Conceito Fundamental

As estruturas condicionais encadeadas permitem criar programas capazes de analisar diversas situações antes de tomar uma decisão.

O fluxo normalmente funciona assim:

```text
Condição 1
↓
Condição 2
↓
Condição 3
↓
Resultado Final
```

Quanto mais condições existem, mais inteligente e próximo de um sistema real o algoritmo se torna.

Praticamente qualquer sistema empresarial utiliza esse conceito diariamente.

---

# ✅ Em Resumo

Nesta aula aprendi a utilizar estruturas condicionais encadeadas para resolver problemas com múltiplas possibilidades. Criei um sistema de aprovação escolar com recuperação, um cálculo de frete baseado em faixas de valor da compra e um sistema de reajuste salarial baseado em faixas salariais. Também compreendi que o computador analisa as condições de cima para baixo e executa apenas o bloco correspondente à primeira condição verdadeira encontrada.

# ⚡ Resumo Relâmpago (10 linhas)

1. Estruturas condicionais encadeadas permitem várias decisões no mesmo algoritmo.
2. O computador verifica as condições de cima para baixo.
3. Apenas o bloco da primeira condição verdadeira é executado.
4. A média escolar pode gerar aprovação, recuperação ou reprovação.
5. A média é calculada somando as notas e dividindo por 4.
6. O sistema de frete utiliza faixas de valor da compra.
7. Compras acima de R$ 300 recebem frete grátis.
8. Reajustes salariais podem variar conforme a faixa salarial.
9. Percentuais são convertidos para decimal dividindo por 100.
10. Condicionais são fundamentais para criar programas inteligentes e próximos da realidade.
