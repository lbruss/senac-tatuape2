# Lógica de Programação — Estruturas Condicionais (SE / SENÃO)

# 🎯 Ideia Principal

Nesta aula comecei a trabalhar com um dos conceitos mais importantes da programação: **tomada de decisão**.

Até agora os algoritmos apenas executavam instruções em sequência:

```text
Início
↓
Executa passo 1
↓
Executa passo 2
↓
Executa passo 3
↓
Fim
```

Agora os programas começam a pensar de forma diferente:

```text
SE acontecer uma condição
    faça uma coisa
SENÃO
    faça outra
```

É exatamente assim que sistemas reais funcionam.

Exemplos:

* Se a senha estiver correta → permitir acesso.
* Se o saldo for suficiente → realizar compra.
* Se a média for maior que 5 → aprovar aluno.
* Se o funcionário ganhar menos de R$ 2.000 → conceder aumento.

---

# 1️⃣ Cálculo de Combustível

## Objetivo

Calcular quanto será pago para abastecer um automóvel.

---

## Código

```portugol
algoritmo "Calculo Combustivel"

var

valorCombustivel, litrosCombustivel, resultado: real

inicio

escreval("Digite o valor do combustível:")
leia(valorCombustivel)

escreval("Digite a quantidade de litros abastecida:")
leia(litrosCombustivel)

escreval("")

resultado <- valorCombustivel * litrosCombustivel

escreval("O valor a ser pago será de R$ ", resultado)

fimalgoritmo
```

---

## Explicação Linha por Linha

### Entrada de Dados

```portugol
leia(valorCombustivel)
```

Recebe o preço de cada litro.

Exemplo:

```text
R$ 5,89
```

---

```portugol
leia(litrosCombustivel)
```

Recebe a quantidade de litros abastecida.

Exemplo:

```text
40 litros
```

---

### Processamento

```portugol
resultado <- valorCombustivel * litrosCombustivel
```

Multiplica o preço do litro pela quantidade de litros.

Exemplo:

```text
5,89 × 40
= 235,60
```

---

### Saída

```portugol
escreval("O valor a ser pago será de R$ ", resultado)
```

Exibe o valor final do abastecimento.

---

# 2️⃣ Cálculo de Combustível + Consumo do Veículo

## Objetivo

Além de calcular o valor pago pelo combustível, calcular também o consumo médio do veículo.

---

## Código

```portugol
algoritmo "Consumo do Veiculo"

var

valorCombustivel, litrosCombustivel, resultado: real
kmPercorrido, kmLitro, consumo: real

inicio

escreval("Digite o valor do combustível:")
leia(valorCombustivel)

escreval("Digite a quantidade de litros abastecida:")
leia(litrosCombustivel)

escreval("Digite quantos Km/L o carro faz:")
leia(kmLitro)

escreval("Informe quantos quilômetros foram percorridos:")
leia(kmPercorrido)

resultado <- valorCombustivel * litrosCombustivel

consumo <- kmPercorrido / litrosCombustivel

escreval("O valor a ser pago será de R$ ", resultado)
escreval("O seu consumo será de: ", consumo, " Km/L")

fimalgoritmo
```

---

## Entendendo o Consumo

A fórmula utilizada foi:

```text
Consumo = Km Percorrido ÷ Litros Gastos
```

Exemplo:

```text
300 km percorridos
25 litros consumidos
```

Resultado:

```text
300 ÷ 25 = 12 Km/L
```

Isso significa que o carro percorre 12 quilômetros para cada litro consumido.

---

## Observação

A variável:

```portugol
kmLitro
```

foi lida mas não utilizada no cálculo.

O cálculo do consumo já é obtido através de:

```portugol
kmPercorrido / litrosCombustivel
```

Portanto essa variável acaba ficando desnecessária nesse algoritmo.

---

# 3️⃣ Hospedagem em Hotel (Exercício Feito por Mim)

## Objetivo

Calcular o valor total de uma hospedagem.

---

## Situação

* Diária por pessoa: R$ 180
* Quantidade de pessoas: 4
* Quantidade de dias: 6

---

## Código

```portugol
algoritmo "Hospedagem"

var

valorDiaria, dias, resultado, quantidadePessoas: real

inicio

escreval("Digite a quantidade de pessoas")
leia(quantidadePessoas)

escreval("Digite a quantidade de dias")
leia(dias)

valorDiaria <- 180

resultado <- quantidadePessoas * valorDiaria * dias

escreval("O valor a ser pago será de R$ ", resultado)

fimalgoritmo
```

---

## Explicando a Fórmula

```portugol
resultado <- quantidadePessoas * valorDiaria * dias
```

O programa calcula:

```text
Quantidade de Pessoas
×
Valor da Diária
×
Quantidade de Dias
```

---

### Exemplo

```text
4 pessoas
R$ 180 por diária
6 dias
```

---

Resultado:

```text
4 × 180 × 6

720 × 6

4320
```

Valor final:

```text
R$ 4.320
```

---

# 4️⃣ Estrutura Condicional

## O que é?

Uma estrutura condicional permite que o programa tome decisões.

Sintaxe:

```portugol
se (condição) entao

    comandos

senao

    outros comandos

fimse
```

---

## Analogia

Imagine uma catraca de metrô.

```text
SE possuir bilhete
    entrar
SENÃO
    bloquear entrada
```

É exatamente esse raciocínio que o computador utiliza.

---

# 5️⃣ Média Final com Condicional

## Objetivo

Verificar se um aluno foi aprovado ou reprovado.

---

## Código

```portugol
algoritmo "Media Final"

var

media, nota1, nota2, nota3, nota4: real

inicio

escreval("Algoritmo para calcular a Média Final")
escreval("")

escreval("Digite a nota do 1° bimestre")
leia(nota1)

escreval("Digite a nota do 2° bimestre")
leia(nota2)

escreval("Digite a nota do 3° bimestre")
leia(nota3)

escreval("Digite a nota do 4° bimestre")
leia(nota4)

media <- (nota1 + nota2 + nota3 + nota4) / 4

se (media >= 5) entao

   escreval("Aluno aprovado com média final: ", media)

senao

   escreval("Aluno reprovado com média final: ", media)

fimse

fimalgoritmo
```

---

## Como o Computador Decide

Exemplo:

```text
7
8
5
6
```

Média:

```text
(7+8+5+6)/4

26/4

6,5
```

Teste:

```text
6,5 >= 5
```

Resultado:

```text
Verdadeiro
```

Mensagem:

```text
Aluno aprovado
```

---

# 6️⃣ Hospedagem com Desconto

## Objetivo

Conceder desconto para clientes que ficarem mais de 8 dias hospedados.

---

## Regra

```text
Se ficar mais de 8 dias
→ desconto de 15%
```

---

## Código Corrigido

```portugol
algoritmo "Hotel com Desconto"

var

valorDiaria, dias, resultado, quantidadePessoas: real
desconto, valorDesconto: real

inicio

escreval("Digite a quantidade de pessoas")
leia(quantidadePessoas)

escreval("Digite a quantidade de dias")
leia(dias)

valorDiaria <- 180

resultado <- quantidadePessoas * valorDiaria * dias

se (dias > 8) entao

   desconto <- 15/100

   valorDesconto <- resultado - (resultado * desconto)

   escreval("O valor com desconto é de R$ ", valorDesconto)

senao

   escreval("O valor a ser pago será de R$ ", resultado)

fimse

fimalgoritmo
```

---

## Entendendo o Cálculo

Exemplo:

```text
Resultado = R$ 5.000
```

Desconto:

```text
15% = 0,15
```

Valor descontado:

```text
5000 × 0,15

750
```

Valor final:

```text
5000 - 750

4250
```

---

# 7️⃣ Reajuste Salarial (Exercício Feito por Mim)

## Objetivo

Conceder aumento de 25% apenas para funcionários com salário inferior a R$ 2.000.

---

## Código

```portugol
algoritmo "Reajuste Salarial"

var

salario, aumento, valorFinal: real
nome: caractere

inicio

escreval("Digite o seu nome")
leia(nome)

escreval("Digite o seu salário")
leia(salario)

escreval("Funcionário: ", nome)

se (salario < 2000) entao

   aumento <- 25/100

   valorFinal <- salario + (salario * aumento)

   escreval("Seu salário foi de R$ ", salario,
             " para R$ ", valorFinal)

senao

   escreval("Seu salário não terá aumento")

fimse

fimalgoritmo
```

---

## Como o Cálculo Funciona

Salário:

```text
R$ 1.800
```

Aumento:

```text
25%
```

Convertendo:

```text
25 ÷ 100 = 0,25
```

Calculando:

```text
1800 × 0,25

450
```

Novo salário:

```text
1800 + 450

2250
```

Resultado:

```text
R$ 2.250
```

---

# 🧠 Conceito Fundamental

As estruturas condicionais são responsáveis por dar inteligência aos programas.

Sem elas, um programa apenas executa tarefas em sequência.

Com elas, o programa consegue:

* Comparar valores.
* Tomar decisões.
* Executar caminhos diferentes.
* Resolver problemas mais complexos.

Praticamente todos os sistemas modernos utilizam estruturas condicionais.

Exemplos:

* Login de usuário.
* Sistemas bancários.
* Jogos.
* Aplicativos.
* Sites.
* Inteligência Artificial.

Tudo depende de decisões lógicas.

---

# ✅ Em Resumo

Nesta aula aprendi a criar algoritmos envolvendo cálculos de combustível, consumo de veículos, hospedagem em hotel e reajuste salarial. Também comecei a utilizar estruturas condicionais através dos comandos `SE`, `SENÃO` e `FIMSE`, permitindo que os programas tomem decisões com base em determinadas condições. Com isso, os algoritmos deixam de apenas executar operações e passam a reagir a diferentes situações, tornando-se mais próximos dos sistemas reais utilizados no mercado.

# ⚡ Resumo Relâmpago (10 linhas)

1. Estruturas condicionais permitem que o programa tome decisões.
2. O comando `SE` testa uma condição lógica.
3. O comando `SENÃO` executa uma alternativa quando a condição é falsa.
4. O cálculo de combustível utiliza preço × quantidade de litros.
5. Consumo de combustível é calculado por Km percorrido ÷ litros consumidos.
6. O valor de hospedagem depende da quantidade de pessoas e dias.
7. Descontos podem ser aplicados usando porcentagens convertidas para decimal.
8. A média escolar é obtida somando as notas e dividindo pela quantidade de avaliações.
9. Reajustes salariais podem ser controlados através de condições lógicas.
10. A tomada de decisão é uma das bases fundamentais da programação.
