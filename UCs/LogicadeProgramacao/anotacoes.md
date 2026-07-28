# Estrutura de Controle `ESCOLHA...CASO` (Switch Case)

**Ideia Principal**

Uma nova estrutura de decisão chamada **`ESCOLHA...CASO`** (equivalente ao `switch case` em diversas linguagens de programação).

Até agora, todas as decisões eram feitas utilizando vários comandos `SE`, `SENÃO` e `SENÃO SE`. Porém, quando existem muitas opções possíveis para um mesmo valor, escrever vários `SE` deixa o código mais longo e difícil de ler.

Para esses casos existe o comando **`ESCOLHA...CASO`**, que torna o algoritmo mais organizado e fácil de entender.

---

**O que é o `ESCOLHA...CASO`?**

A estrutura `ESCOLHA...CASO` é utilizada quando uma variável pode assumir **vários valores diferentes**, e cada valor executa uma ação específica.

Sua estrutura geral é:

```portugol
escolha variavel

   caso valor1
      comandos

   caso valor2
      comandos

   caso valor3
      comandos

   outrocaso
      comandos

fimescolha
```

---

**Quando utilizar?**

O `ESCOLHA...CASO` é indicado quando há diversas possibilidades para **uma mesma variável**.

Exemplos:

* Dias da semana.
* Meses do ano.
* Menu de opções.
* Calculadoras.
* Sistemas bancários.
* Caixas eletrônicos.
* Jogos.
* Sistemas de cadastro.

Em vez de fazer várias comparações com `SE`, basta verificar o valor da variável uma única vez.

---

> Analogia

Imagine um elevador.

Você aperta um botão.

Dependendo do número escolhido, ele leva para um andar diferente.

```
Botão 1 → Térreo

Botão 2 → Primeiro andar

Botão 3 → Segundo andar

Botão 4 → Terceiro andar
```

É exatamente esse comportamento que o comando `ESCOLHA` possui.

---

## Exemplo — Descobrir o Dia da Semana

**Objetivo**

Mostrar o dia da semana correspondente ao número digitado.

---

**Código**

```portugol
algoritmo "Escolha-Caso"

var

diaDaSemana: inteiro

inicio

escreval("Digite um número entre 1 e 7 para saber o dia da semana")
leia(diaDaSemana)

escolha diaDaSemana

   caso 1
      escreval("Domingo")

   caso 2
      escreval("Segunda-feira")

   caso 3
      escreval("Terça-feira")

   caso 4
      escreval("Quarta-feira")

   caso 5
      escreval("Quinta-feira")

   caso 6
      escreval("Sexta-feira")

   caso 7
      escreval("Sábado")

   outrocaso

      escreval("Você digitou um valor inválido")

fimescolha

fimalgoritmo
```

---

**Explicação Linha por Linha**

**Leitura da variável**

```portugol
leia(diaDaSemana)
```

Recebe um número digitado pelo usuário.

Exemplo:

```
4
```

---

**Estrutura `ESCOLHA`**

```portugol
escolha diaDaSemana
```

O computador analisa o valor armazenado na variável.

No exemplo:

```
diaDaSemana = 4
```

Então ele procura:

```
caso 4
```

Resultado:

```
Quarta-feira
```

---

- `outrocaso`

```portugol
outrocaso
```

É executado quando nenhum dos casos corresponde ao valor informado.

- **Exemplo:**

```
Usuário digitou:

15
```

Resultado:

```
Você digitou um valor inválido.
```

---

# Calculadora Utilizando `ESCOLHA`

**Objetivo**

Criar uma calculadora simples.

O usuário escolhe qual operação deseja realizar.

---

**Código**

```portugol
algoritmo "Calculadora"

var

calculo: inteiro
valor1, valor2, result: real

inicio

escreval("Digite o primeiro valor:")
leia(valor1)

escreval("Digite o segundo valor:")
leia(valor2)

escreval("Escolha a operação matemática")
escreval("1 - Adição")
escreval("2 - Subtração")
escreval("3 - Multiplicação")
escreval("4 - Divisão")

leia(calculo)

escolha calculo

   caso 1
      result <- valor1 + valor2
      escreval("O resultado é ", result)

   caso 2
      result <- valor1 - valor2
      escreval("O resultado é ", result)

   caso 3
      result <- valor1 * valor2
      escreval("O resultado é ", result)

   caso 4
      result <- valor1 / valor2
      escreval("O resultado é ", result)

   outrocaso
      escreval("Você digitou um valor inválido.")

fimescolha

fimalgoritmo
```

---

**Como o algoritmo funciona**

Primeiro o usuário informa dois números.

Depois escolhe a operação.

- **Exemplo:**

```
Valor 1 = 20

Valor 2 = 10

Operação = 3
```

O computador encontra:

```
caso 3
```

Executa:

```
20 × 10
```

Resultado:

```
200
```

---

- **Observação**

Perceba que **somente um dos casos será executado**.

Os demais são ignorados.

Isso torna o algoritmo muito eficiente.

---

# Sistema de Doação

**Objetivo**

Criar um menu de doações.

---

**Código**

```portugol
algoritmo "Doacao"

var

valor: real
doacao: inteiro

inicio

escreval("Doação para uma pessoa bem humilde (Eu)")
escreval("")
escreval("Digite o número de acordo com a sua escolha")
escreval("")
escreval("1 - Doar R$ 10,00")
escreval("2 - Doar R$ 25,00")
escreval("3 - Doar R$ 50,00")
escreval("4 - Doar outro valor")
escreval("5 - Cancelar a doação")

leia(doacao)

escolha doacao

   caso 1
      escreval("Você doou R$ 10,00")

   caso 2
      escreval("Você doou R$ 25,00")

   caso 3
      escreval("Você doou R$ 50,00")

   caso 4
      escreval("Digite o valor desejado")
      leia(valor)
      escreval("Você doou R$ ", valor)

   caso 5
      escreval("Você doou o total de R$ 0,00")

   outrocaso
      escreval("Valor inválido")

fimescolha

fimalgoritmo
```

---

- **Explicação**

Esse algoritmo simula um menu.

Cada número representa uma opção.

```
1 → Doação de R$ 10,00

2 → Doação de R$ 25,00

3 → Doação de R$ 50,00

4 → Valor personalizado

5 → Cancelar
```

É exatamente a mesma lógica utilizada em caixas eletrônicos, aplicativos e menus de sistemas.

---

# Cálculo de Frete por Região

**Objetivo**

Calcular o valor final de uma compra de acordo com a região de entrega.

---

**Regras**

| Região       |    Frete |
| ------------ | -------: |
| Sudeste      |   Grátis |
| Sul          | R$ 10,00 |
| Centro-Oeste | R$ 25,00 |
| Norte        | R$ 50,00 |
| Nordeste     | R$ 40,00 |

---

**Código**

```portugol
algoritmo "Frete por Regiao"

var

valorF, valorC: real
frete: inteiro

inicio

escreval("Digite o valor da compra")
leia(valorC)

escreval("Digite o número da região")
escreval("1 - Sudeste")
escreval("2 - Sul")
escreval("3 - Centro-Oeste")
escreval("4 - Norte")
escreval("5 - Nordeste")

leia(frete)

escolha frete

   caso 1

      escreval("O valor da sua compra é de R$ ", valorC)
      escreval("O seu frete é grátis")

   caso 2

      valorF <- valorC + 10

      escreval("O valor da sua compra é de R$ ", valorC)
      escreval("O valor do frete é de R$ 10,00")
      escreval("O valor final a ser pago é de R$ ", valorF)

   caso 3

      valorF <- valorC + 25

      escreval("O valor da sua compra é de R$ ", valorC)
      escreval("O valor do frete é de R$ 25,00")
      escreval("O valor final a ser pago é de R$ ", valorF)

   caso 4

      valorF <- valorC + 50

      escreval("O valor da sua compra é de R$ ", valorC)
      escreval("O valor do frete é de R$ 50,00")
      escreval("O valor final a ser pago é de R$ ", valorF)

   caso 5

      valorF <- valorC + 40

      escreval("O valor da sua compra é de R$ ", valorC)
      escreval("O valor do frete é de R$ 40,00")
      escreval("O valor final a ser pago é de R$ ", valorF)

   outrocaso

      escreval("Número inválido")

fimescolha

fimalgoritmo
```

---

**Como o algoritmo funciona**

Primeiro o usuário informa o valor da compra.

Depois escolhe a região.

Dependendo da região, o programa adiciona um valor diferente ao frete.

- **Exemplo:**

```
Compra = R$ 200,00

Região = Norte
```

O algoritmo encontra:

```
caso 4
```

Executa:

```
200 + 50
```

Resultado:

```
Valor final = R$ 250,00
```

---

# Utilizar `ESCOLHA`?

Se esse algoritmo fosse desenvolvido utilizando apenas `SE`, seria necessário comparar a mesma variável diversas vezes.

Com `ESCOLHA`, o código fica:

* Mais organizado.
* Mais fácil de ler.
* Mais simples de manter.
* Mais intuitivo.

Por isso, quando existem muitas opções fixas, `ESCOLHA...CASO` costuma ser a melhor escolha.

---

# Conceito Fundamental

A estrutura `ESCOLHA...CASO` é utilizada quando uma única variável pode assumir vários valores possíveis, e cada valor corresponde a uma ação diferente.

Ela substitui longas sequências de `SE...SENÃO`, deixando o algoritmo mais limpo e organizado. Esse recurso é amplamente utilizado em menus de sistemas, calculadoras, caixas eletrônicos, aplicativos, jogos e diversos programas que precisam oferecer várias opções ao usuário.

---

# Em Resumo

Nesta aula aprendi a utilizar a estrutura `ESCOLHA...CASO` (`switch case`) para criar algoritmos com múltiplas opções de forma organizada. Desenvolvi exemplos para identificar o dia da semana, construir uma calculadora, criar um menu de doações e calcular o frete conforme a região de entrega. Também compreendi que essa estrutura é ideal quando uma única variável determina qual bloco de código será executado.

**Resumo Relâmpago**

1. `ESCOLHA...CASO` é usado quando uma variável possui várias opções possíveis.
2. É equivalente ao `switch case` de outras linguagens de programação.
3. Apenas um `caso` é executado por vez.
4. O `outrocaso` trata valores que não correspondem a nenhuma opção válida.
5. Essa estrutura deixa o código mais organizado que vários `SE`.
6. É muito utilizada em menus e sistemas com opções fixas.
7. Pode ser aplicada em calculadoras, cadastros e controles de acesso.
8. Cada `caso` representa uma ação específica para um determinado valor.
9. O algoritmo compara a variável apenas uma vez, tornando a lógica mais clara.
10. `ESCOLHA...CASO` é uma das principais estruturas de controle da programação.
