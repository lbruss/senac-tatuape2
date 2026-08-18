Lógica de Programação — Matrizes

🎯 Ideia Principal

Depois de estudar vetores, agora comecei a trabalhar com matrizes.

A principal diferença é:

Vetor: possui uma dimensão → trabalha com posições em sequência.

Matriz: possui duas dimensões → trabalha com linhas e colunas.


Uma boa forma de imaginar uma matriz é como uma tabela.

Colunas
        1    2    3
      ┌────┬────┬────┐
Linha 1│    │    │    │
      ├────┼────┼────┤
Linha 2│    │    │    │
      ├────┼────┼────┤
Linha 3│    │    │    │
      └────┴────┴────┘

Uma matriz 3 × 3 possui:

3 linhas × 3 colunas = 9 posições


---

1. O que é uma Matriz?

Uma matriz é uma estrutura de dados capaz de armazenar vários valores organizados em linhas e colunas.

Por exemplo:

matriz[1,2]

significa:

linha 1;

coluna 2.


Enquanto no vetor tínhamos:

vetor[3]

na matriz temos:

matriz[3,2]

Ou seja, precisamos informar duas posições.


---

🧠 Analogia

Imagine uma sala de aula.

Cada aluno possui uma posição formada por:

Linha + Coluna

Por exemplo:

[2,3]

poderia significar:

> Linha 2, coluna 3.



Uma matriz funciona dessa maneira: cada elemento possui uma localização determinada pela combinação de linha e coluna.


---

2. Declaração de uma Matriz no VisualG

A estrutura é:

nome: vetor[1..3, 1..3] de caractere

Vamos separar:

nome

É o nome da matriz.

[1..3, 1..3]

Define:

linhas de 1 até 3;

colunas de 1 até 3.


Portanto:

3 × 3 = 9 posições

E:

de caractere

determina o tipo de dado que será armazenado.


---

3. Matriz 3 × 3

Uma matriz:

nome: vetor[1..3, 1..3] de caractere

pode ser visualizada assim:

Colunas
          1     2     3

Linha 1  [ ]   [ ]   [ ]

Linha 2  [ ]   [ ]   [ ]

Linha 3  [ ]   [ ]   [ ]

Cada célula pode armazenar uma informação.


---

4. Percorrendo uma Matriz

Aqui aparece um conceito muito importante:

> Para percorrer uma matriz, normalmente utilizamos dois laços PARA, um dentro do outro.



Por exemplo:

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        ...

    fimpara

fimpara

O primeiro contador:

i

representa as linhas.

O segundo:

j

representa as colunas.

Podemos pensar assim:

i → linha
j → coluna


---

5. Exemplo — Preenchendo e Exibindo uma Matriz

Código

algoritmo "Matriz"

var

nome: vetor[1..3, 1..3] de caractere
i, j: inteiro

inicio

// Leitura dos dados da matriz

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        escreval("Digite o dado para a posição [", i, ",", j, "]: ")
        leia(nome[i,j])

    fimpara

fimpara

escreval("")
escreval("Matriz digitada:")

// Exibição dos dados

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        escreva(nome[i,j], " ")

    fimpara

    escreval()

fimpara

fimalgoritmo


---

🔍 Entendendo os dois PARA

Primeiro:

para i de 1 ate 3 faca

O i controla as linhas.

Dentro dele temos:

para j de 1 ate 3 faca

O j controla as colunas.

Isso faz com que todas as posições sejam percorridas.

A sequência será:

[1,1]
[1,2]
[1,3]

[2,1]
[2,2]
[2,3]

[3,1]
[3,2]
[3,3]

São exatamente as 9 posições da matriz.


---

⚠️ Por que existe um escreval() depois do segundo PARA?

Na parte de exibição temos:

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        escreva(nome[i,j], " ")

    fimpara

    escreval()

fimpara

O comando:

escreva()

não quebra a linha.

Então os elementos de uma mesma linha ficam juntos.

Depois que todas as colunas daquela linha foram exibidas:

escreval()

faz a quebra de linha.

Assim conseguimos visualizar a matriz como uma tabela.


---

6. Matriz para Somar Todos os Valores

Agora a matriz será utilizada para realizar um cálculo.

Objetivo

Criar uma matriz 3 × 3, armazenar números inteiros e calcular a soma de todos os elementos.


---

Código

algoritmo "Soma da Matriz"

var

valor: vetor[1..3, 1..3] de inteiro
i, j, soma: inteiro

inicio

soma <- 0

// Leitura da matriz

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        escreval("Digite o valor [", i, ",", j, "]: ")
        leia(valor[i,j])

        // Soma o valor atual
        soma <- soma + valor[i,j]

    fimpara

fimpara

escreval("")

// Exibição do resultado

escreval("A soma dos valores da matriz = ", soma)

fimalgoritmo


---

🔍 Como a soma funciona?

Antes de começar:

soma <- 0

A variável soma funciona como um acumulador.

Cada número digitado é acrescentado a ela:

soma <- soma + valor[i,j]

Imagine que sejam digitados:

1  2  3
4  5  6
7  8  9

O algoritmo fará:

soma = 0

0 + 1 = 1
1 + 2 = 3
3 + 3 = 6
6 + 4 = 10
...
36 + 9 = 45

Resultado:

45


---

7. Matriz com Multiplicação

Agora o objetivo será:

1. preencher uma matriz;


2. percorrer a matriz;


3. multiplicar cada elemento por 2;


4. exibir a nova matriz.




---

Código

algoritmo "Matriz Multiplicada"

var

valor: vetor[1..3, 1..3] de inteiro
i, j: inteiro

inicio

// Entrada dos dados

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        escreval("Digite um número inteiro:")
        leia(valor[i,j])

    fimpara

fimpara

// Multiplicação por 2

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        valor[i,j] <- valor[i,j] * 2

    fimpara

fimpara

// Exibição do resultado

escreval("Matriz multiplicada:")

para i de 1 ate 3 faca

    para j de 1 ate 3 faca

        escreva(valor[i,j], " ")

    fimpara

    escreval()

fimpara

fimalgoritmo


---

🔍 O que acontece na multiplicação?

Suponha que a matriz inicialmente seja:

1  2  3
4  5  6
7  8  9

A instrução:

valor[i,j] <- valor[i,j] * 2

é aplicada a cada posição.

Resultado:

2   4   6
8  10  12
14 16  18

O algoritmo não cria outra matriz. Ele modifica os valores que já estavam armazenados.


---

🧩 Entrada → Processamento → Saída

Esse exercício também reforça o princípio fundamental da informática:

ENTRADA
   ↓
PROCESSAMENTO
   ↓
SAÍDA

Entrada

O usuário fornece os valores:

leia(valor[i,j])

Processamento

O algoritmo modifica os valores:

valor[i,j] <- valor[i,j] * 2

Saída

O programa mostra o resultado:

escreva(valor[i,j], " ")

Esse modelo aparece constantemente em programas reais.


---

🔄 Vetor × Matriz

Estrutura	Dimensões	Exemplo

Variável comum	0	idade
Vetor	1	vetor[3]
Matriz	2	matriz[3,3]


Podemos visualizar:

Variável:

idade


Vetor:

[10] [20] [30]


Matriz:

[10] [20] [30]
[40] [50] [60]
[70] [80] [90]

A matriz é, portanto, uma extensão da ideia do vetor para duas dimensões.


---

🧠 Conceito Fundamental

O ponto mais importante desta aula é entender que uma matriz é uma estrutura de dados bidimensional, organizada por linhas e colunas. Para percorrê-la completamente, utilizamos normalmente dois laços de repetição aninhados: um controla as linhas e outro controla as colunas. Isso permite realizar operações em cada elemento individualmente, como leitura, soma, multiplicação, comparação ou alteração de valores.


---

💡 Um detalhe importante

Nas anotações aparece a ideia de que a matriz é "melhor que o vetor".

Tecnicamente, não é correto dizer que uma estrutura é simplesmente melhor que a outra.

A escolha depende do problema.

Vetor

É adequado quando os dados estão organizados em uma única sequência:

Notas de alunos:

[7, 8, 6, 9, 10]

Matriz

É adequada quando existe uma relação de linha e coluna:

Tabela de notas:

        P1  P2  P3
Aluno1   7   8   9
Aluno2   6   7   8
Aluno3   9   9  10

Portanto:

> Vetor → uma dimensão.
Matriz → duas dimensões.




---

✅ Em Resumo

Aprendi que uma matriz permite armazenar diversos valores organizados em linhas e colunas. Uma matriz 3 × 3 possui nove posições e cada elemento pode ser acessado informando sua linha e sua coluna. Para percorrer todos os elementos, utilizo dois laços PARA, sendo um responsável pelas linhas e outro pelas colunas. Também aprendi a preencher, exibir, somar e modificar os valores de uma matriz. A mesma lógica pode ser aplicada a diversos problemas que envolvem tabelas e conjuntos de dados bidimensionais.

⚡ Resumo Relâmpago — 10 linhas

1. Matriz é uma estrutura de dados organizada em linhas e colunas.


2. Uma matriz 3 × 3 possui 9 posições.


3. Cada posição é acessada por dois índices: matriz[linha,coluna].


4. No VisualG, uma matriz pode ser declarada como vetor[1..3,1..3].


5. O primeiro índice normalmente representa a linha.


6. O segundo índice representa a coluna.


7. Para percorrer uma matriz usamos dois PARA aninhados.


8. O laço externo controla as linhas e o interno controla as colunas.


9. Podemos realizar operações como soma e multiplicação em cada elemento.


10. Vetor possui uma dimensão; matriz possui duas dimensões.


