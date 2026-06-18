# Programas, Linguagens, Variáveis e Algoritmos

**Ideia Principal**

Entendendo melhor o que é um **programa de computador**, quais são os **tipos de linguagem de programação**, como funcionam **variáveis, constantes, operadores** e como criar meus primeiros **algoritmos**.

A ideia principal é: **um programa é feito por instruções organizadas, escritas em uma linguagem que permite ao computador receber dados, processar informações e gerar uma saída**.

Antes de escrever códigos mais complexos, preciso entender a base: como declarar variáveis, como usar operadores, como pensar em sequência lógica e como testar um algoritmo.

---

## Programa de Computador

Um **programa de computador** é um conjunto de instruções criadas para fazer o computador executar alguma tarefa.

Essas instruções precisam estar em uma ordem lógica, porque o computador executa exatamente o que foi pedido.

Exemplo simples:

```
1. Receber dois números
2. Somar esses números
3. Mostrar o resultado
```

Isso já é a ideia básica de um programa.

Um programa pode ser algo simples, como uma calculadora, ou algo muito complexo, como um sistema bancário, um jogo, um aplicativo ou um sistema operacional.

---

> Analogia simples: 
Um programa é como uma lista de ordens para uma pessoa muito obediente, mas sem interpretação própria.

Se eu esquecer uma etapa, a pessoa não vai “adivinhar”.
Com o computador é a mesma coisa.

Por exemplo, se eu disser:

```
Faça um bolo.
```

Isso é muito genérico.

Mas se eu disser:

```
1. Pegue os ingredientes.
2. Misture os ingredientes.
3. Coloque na forma.
4. Leve ao forno.
5. Espere assar.
6. Retire do forno.
```

Agora existe uma sequência lógica.

Na programação, essa sequência lógica é essencial.

---

# Tipos de Linguagem de Programação

As linguagens de programação podem ser classificadas de várias formas, mas uma classificação importante é:

* Linguagem de baixo nível.
* Linguagem de alto nível.

Essa classificação tem relação com o quanto a linguagem está próxima da máquina ou próxima do ser humano.

---

## Linguagem de Baixo Nível

A **linguagem de baixo nível** é uma linguagem mais próxima da máquina.

Ela conversa mais diretamente com o hardware do computador, ou seja, com processador, memória e registradores.

Um exemplo clássico é a linguagem **Assembly**.

---

**Características da linguagem de baixo nível**

As linguagens de baixo nível são:

* Mais próximas do funcionamento interno da máquina.
* Mais difíceis de ler para o ser humano.
* Mais rápidas em alguns casos.
* Mais dependentes do tipo de processador e arquitetura.
* Usadas quando se precisa de muito controle sobre o hardware.

---

## Assembly

**Assembly** é uma linguagem de baixo nível.

Ela usa comandos mais próximos das instruções que o processador entende.

Exemplo simplificado:

```
MOV AX, 5
ADD AX, 3
```

Explicando de forma simples:

* `MOV AX, 5`: coloca o valor `5` em um registrador chamado `AX`.
* `ADD AX, 3`: soma `3` ao valor que está em `AX`.

Esse tipo de linguagem exige que o programador entenda mais sobre como o processador trabalha internamente.

---

**Vantagem da linguagem de baixo nível**

A principal vantagem é o **controle**.

Com ela, é possível controlar melhor os recursos da máquina.

Ela pode ser usada em:

* Sistemas embarcados.
* Drivers.
* Firmware.
* Sistemas que precisam de alto desempenho.
* Programas muito próximos do hardware.

---

**Desvantagem da linguagem de baixo nível**

A principal desvantagem é a dificuldade.

O código costuma ser mais complexo, menos legível e menos portátil.

Portabilidade significa a capacidade de um programa funcionar em diferentes máquinas ou sistemas com poucas alterações.

---

## Linguagem de Alto Nível

A **linguagem de alto nível** é uma linguagem mais próxima do ser humano.

Ela possui uma sintaxe mais organizada, mais legível e mais fácil de entender.

Exemplos de linguagens de alto nível:

* Python
* Java
* JavaScript
* C#
* PHP
* VisualG
* C
* C++

---

**Características da linguagem de alto nível**

As linguagens de alto nível são:

* Mais fáceis de ler.
* Mais fáceis de escrever.
* Mais próximas da linguagem humana.
* Mais portáveis.
* Mais usadas no desenvolvimento de sistemas, sites, aplicativos e programas.
* Dependem de compiladores ou interpretadores para serem executadas.

---

# Sintaxe

**Sintaxe** é o conjunto de regras de escrita de uma linguagem.

Cada linguagem tem sua forma correta de escrever comandos.

Exemplo em VisualG:

```portugol 
escreval("Digite seu nome: ")
leia(nome)
```

Esse código tem uma estrutura específica.
Se eu escrever fora do padrão da linguagem, o programa pode dar erro.

---

# Compilador

Um **compilador** é um programa que traduz o código escrito pelo programador para uma linguagem que o computador consegue executar.

O computador não entende diretamente linguagens como C, Java ou VisualG.

Então o compilador faz a tradução.

A ideia é:

```
Código escrito pelo programador → Compilador → Código entendido pela máquina
```

---

# Interpretador

Um **interpretador** também traduz o código, mas geralmente faz isso linha por linha durante a execução.

Linguagens como Python e JavaScript costumam usar interpretação ou modelos mistos, dependendo do ambiente.

---

**Vantagens da linguagem de alto nível**

As principais vantagens são:

* Código mais fácil de entender.
* Maior produtividade.
* Maior portabilidade.
* Mais facilidade para manutenção.
* Mais próxima da lógica humana.

---

**Desvantagens da linguagem de alto nível**

As linguagens de alto nível podem:

* Ocupar mais memória.
* Gerar rotinas mais genéricas.
* Ser mais complexas internamente.
* Depender de compiladores, interpretadores ou ambientes de execução.

Mesmo assim, elas são muito usadas porque facilitam bastante o desenvolvimento.

---

# Variáveis e Constantes

Na programação, eu preciso guardar informações na memória do computador.

Para isso, uso **variáveis** e **constantes**.

---

## Variável

Uma **variável** é um espaço reservado na memória do computador para armazenar um dado.

Esse dado pode ser:

* Um número.
* Um texto.
* Um caractere.
* Um valor verdadeiro ou falso.
* Um número decimal.

A variável recebe esse nome porque o valor dela pode mudar durante a execução do programa.

---

> Analogia da caixa

Uma variável é como uma caixa.

Essa caixa tem:

* **Nome**
* **Tipo**
* **Conteúdo**

Exemplo:

```
nome: caractere
idade: inteiro
```

Aqui eu tenho duas “caixas”:

* A caixa `nome`, que guarda texto.
* A caixa `idade`, que guarda número inteiro.

---

- **Exemplo prático**

```portugol
idade: inteiro
```

Isso significa que eu criei uma variável chamada `idade`, e ela vai guardar um número inteiro.

Depois, posso colocar um valor nela:

```portugol
idade <- 18
```

Isso significa que a variável `idade` recebeu o valor `18`.

---

## Constante

Uma **constante** também guarda um valor na memória, mas esse valor não deve mudar durante a execução do programa.

- **Exemplo:**

```
PI = 3.14159
```

O valor de `PI` normalmente não muda.

A diferença principal é:

```
Variável: pode mudar.
Constante: permanece fixa.
```

---

# Tipos de Dados

Os **tipos de dados** indicam qual tipo de informação uma variável pode armazenar.

Isso é importante porque o computador precisa saber como tratar aquele valor.

Um número inteiro, por exemplo, não é tratado da mesma forma que um texto.

---

## Char

O tipo **char** representa um único caractere.

- **Exemplos:**

```
'A'
'B'
'7'
'@'
```

Ele serve para guardar apenas um símbolo.

- **Exemplo:**

```
letra = 'A'
```

---

## Int / Inteiro

O tipo **int**, ou **inteiro**, representa números inteiros.

Ou seja, números sem casas decimais.

- **Exemplos:**

```
1
25
100
-8
0
```

No VisualG, normalmente usamos:

```portugol
idade: inteiro
```

---

## Float / Real

O tipo **float** representa números com casas decimais.

- **Exemplos:**

```
7.5
10.25
3.14
```

No VisualG, o tipo usado é geralmente:

```portugol
real
```

- **Exemplo:**

```portugol
media: real
```

Esse tipo é usado para notas, médias, medidas, preços e valores quebrados.

---

## Double

O tipo **double** também representa números com casas decimais, mas costuma ter mais precisão do que o float.

Ele é usado quando preciso guardar números decimais com mais detalhes.

- **Exemplo:**

```
3.1415926535
```

---

## String / Caractere

Uma **string** representa um texto, ou seja, uma sequência de caracteres.

- **Exemplos:**

```
"Bruss"
"Digite seu nome"
"Técnico em Informática"
```

No VisualG, usamos:

```portugol
nome: caractere
```

Mesmo que o nome do tipo seja `caractere`, ele pode guardar textos.

---

## Boolean / Lógico

O tipo **boolean**, ou **lógico**, representa apenas dois valores:

```
verdadeiro
falso
```

Ele é muito usado em testes lógicos.

Exemplo:

```
senhaCorreta = verdadeiro
```

Na programação, isso é muito importante para decisões.

- **Exemplo:**

```
Se a senha estiver correta, entra no sistema.
Senão, mostra erro.
```

---

# Nomes de Variáveis

Ao criar variáveis, preciso seguir algumas regras.

Essas regras existem para evitar erros e deixar o código mais organizado.

---

## Regras para nomear variáveis

1. O nome da variável deve iniciar com uma letra.
2. Pode conter números, mas não pode começar com número.
3. O caractere `_` pode ser usado no nome.
4. Letras maiúsculas e minúsculas são diferentes.
5. Palavras reservadas não podem ser usadas.
6. O ideal é escolher nomes que tenham significado.

---

**Exemplo correto**

```text
idade
nome
valor1
valor2
media_final
resultado
```

Esses nomes são bons porque indicam o que a variável guarda.

---

**Exemplo incorreto**

```
1valor
nome completo
var
inicio
fim
```

**Explicando:**

* `1valor`: começa com número.
* `nome completo`: tem espaço.
* `var`, `inicio` e `fim`: podem ser palavras reservadas dependendo da linguagem.

---

## Maiúsculas e minúsculas

Em muitas linguagens, letras maiúsculas e minúsculas são diferentes.

Exemplo:

```
idade
Idade
IDADE
```

Esses três nomes podem ser interpretados como variáveis diferentes.

Por isso, é importante manter um padrão.

---

## Nomes com significado

É melhor usar:

```
media
idade
resultado
nomeAluno
```

Do que usar:

```
x
y
z
a
b
```

Nomes claros facilitam a leitura e a manutenção do código.

---

## Operadores Aritméticos

Os **operadores aritméticos** são usados para fazer cálculos.

---

**Principais operadores**

| Operador     | Significado      | Exemplo |
| ------------ | ---------------- | ------- |
| `+`          | Soma             | `5 + 2` |
| `-`          | Subtração        | `5 - 2` |
| `*`          | Multiplicação    | `5 * 2` |
| `/`          | Divisão          | `5 / 2` |
| `%` ou `mod` | Resto da divisão | `5 % 2` |

---

**Soma**

```
5 + 2 = 7
```

Usada para adicionar valores.

---

**Subtração**

```
5 - 2 = 3
```

Usada para tirar um valor de outro.

---

**Multiplicação**

```
5 * 2 = 10
```

Na programação, normalmente usamos `*` para multiplicar.

---

**Divisão**

```
10 / 2 = 5
```

Em algumas linguagens ou pseudocódigos, também pode aparecer como `div`.

---

**Resto da divisão**

O operador `%` ou `mod` retorna o resto de uma divisão.

Exemplo:

```
5 % 2 = 1
```

Porque:

```
5 dividido por 2 = 2
Resto = 1
```

Esse operador é muito usado para verificar se um número é par ou ímpar.

Exemplo:

```
Se numero % 2 = 0, o número é par.
Se numero % 2 = 1, o número é ímpar.
```

---

# Operadores de Atribuição

Os **operadores de atribuição** são usados para colocar ou atualizar valores dentro de variáveis.

---

## Igual `=`

Em muitas linguagens, o sinal `=` é usado para atribuir valor.

- **Exemplo:**

```
idade = 18
```

Significa:

```
A variável idade recebe o valor 18.
```

No VisualG, a atribuição geralmente é feita com:

```portugol
idade <- 18
```

---

## Incremento `++`

O operador `++` aumenta o valor de uma variável em 1.

Exemplo:

```
contador++
```

É o mesmo que:

```
contador = contador + 1
```

---

## Decremento `--`

O operador `--` diminui o valor de uma variável em 1.

- **Exemplo:**

```
contador--
```

É o mesmo que:

```
contador = contador - 1
```

---

## Incremento de valor `+=`

O operador `+=` soma um valor à variável.

Exemplo:

```
total += 10
```

É o mesmo que:

```
total = total + 10
```

---

## Decremento de valor `-=`

O operador `-=` subtrai um valor da variável.

- **Exemplo:**

```
total -= 5
```

É o mesmo que:

```
total = total - 5
```

---

# 1️⃣2️⃣ Operadores de Comparação

Os **operadores de comparação** são usados para comparar valores.

O resultado de uma comparação sempre será um teste lógico:

```text
verdadeiro ou falso
```

---

## Principais operadores de comparação

| Operador | Significado    | Exemplo            |
| -------- | -------------- | ------------------ |
| `==`     | Igualdade      | `idade == 18`      |
| `!=`     | Diferença      | `senha != correta` |
| `>`      | Maior que      | `idade > 18`       |
| `<`      | Menor que      | `idade < 18`       |
| `>=`     | Maior ou igual | `idade >= 18`      |
| `<=`     | Menor ou igual | `idade <= 18`      |

---

## Igualdade `==`

O operador `==` verifica se dois valores são iguais.

Exemplo:

```text
idade == 18
```

Se a idade for 18, o resultado será verdadeiro.
Se não for, será falso.

---

## Diferença `!=`

O operador `!=` verifica se dois valores são diferentes.

Exemplo:

```text
senha != senhaCorreta
```

Se a senha digitada for diferente da senha correta, o resultado será verdadeiro.

---

## Maior que `>`

```text
idade > 18
```

Verifica se a idade é maior que 18.

---

## Menor que `<`

```text
idade < 18
```

Verifica se a idade é menor que 18.

---

## Maior ou igual `>=`

```text
idade >= 18
```

Verifica se a idade é maior ou igual a 18.

---

## Menor ou igual `<=`

```text
idade <= 18
```

Verifica se a idade é menor ou igual a 18.

---

# 1️⃣3️⃣ Operadores Lógicos

Os **operadores lógicos** servem para combinar testes lógicos.

Eles trabalham com valores como:

```text
verdadeiro
falso
```

Os principais operadores são:

* **E**
* **OU**
* **NÃO**

---

## Operador E

O operador **E** exige que todas as condições sejam verdadeiras.

Exemplo:

```text
idade >= 18 E possuiDocumento = verdadeiro
```

Nesse caso, a pessoa só passa se:

* Tiver 18 anos ou mais.
* Possuir documento.

Se uma das condições for falsa, o resultado geral será falso.

---

## Operador OU

O operador **OU** exige que pelo menos uma condição seja verdadeira.

Exemplo:

```text
pagamento = dinheiro OU pagamento = cartão
```

Se uma das opções for verdadeira, o teste passa.

---

## Operador NÃO

O operador **NÃO** inverte o resultado lógico.

Exemplo:

```text
NÃO aprovado
```

Se `aprovado` for verdadeiro, vira falso.
Se `aprovado` for falso, vira verdadeiro.

---

# 1️⃣4️⃣ Teste Lógico

Um **teste lógico** é uma verificação que retorna apenas dois resultados:

```text
verdadeiro ou falso
```

Exemplo:

```text
10 > 5
```

Resultado:

```text
verdadeiro
```

Outro exemplo:

```text
3 == 8
```

Resultado:

```text
falso
```

Na programação, esses testes são muito usados para decisões.

Exemplo:

```text
Se a nota for maior ou igual a 6, o aluno está aprovado.
Caso contrário, está reprovado.
```

---

# 1️⃣5️⃣ Algoritmo

Um **algoritmo** é uma sequência de passos para resolver um problema.

Ele precisa ser:

* Claro.
* Organizado.
* Finito.
* Objetivo.
* Escrito em ordem lógica.

A função do algoritmo é resolver um problema.

---

## Importância dos verbos de ação

Ao escrever um algoritmo, é comum cada etapa começar com um verbo de ação.

Exemplos:

* Pegar
* Posicionar
* Subir
* Tirar
* Colocar
* Somar
* Exibir
* Ler
* Guardar

Isso deixa o passo mais direto e facilita entender o que deve ser feito.

---

# 1️⃣6️⃣ Primeiro exemplo de algoritmo — Trocar a lâmpada

```text
Algoritmo "Trocar a Lâmpada"

Início

1. Pegar uma escada
2. Posicionar a escada
3. Subir na escada
4. Tirar a lâmpada velha
5. Colocar a lâmpada nova
6. Descer da escada
7. Acender a lâmpada nova
8. Guardar a escada

Fim
```

---

## Explicando o algoritmo

Esse é um algoritmo simples, feito em linguagem natural.

O problema é:

```text
Trocar uma lâmpada.
```

A solução foi dividida em passos.

---

## Passo 1 — Pegar uma escada

```text
1. Pegar uma escada
```

Antes de trocar a lâmpada, preciso alcançar o local onde ela está.

A escada é necessária porque a lâmpada geralmente fica em um ponto alto.

---

## Passo 2 — Posicionar a escada

```text
2. Posicionar a escada
```

Não basta pegar a escada.
Ela precisa estar bem posicionada para evitar queda e permitir acesso à lâmpada.

---

## Passo 3 — Subir na escada

```text
3. Subir na escada
```

Agora que a escada está posicionada, posso subir para alcançar a lâmpada.

---

## Passo 4 — Tirar a lâmpada velha

```text
4. Tirar a lâmpada velha
```

A lâmpada antiga precisa ser removida para abrir espaço para a nova.

---

## Passo 5 — Colocar a lâmpada nova

```text
5. Colocar a lâmpada nova
```

Depois de retirar a lâmpada velha, coloco a nova no lugar.

---

## Passo 6 — Descer da escada

```text
6. Descer da escada
```

Depois de instalar a lâmpada, preciso descer com segurança.

---

## Passo 7 — Acender a lâmpada nova

```text
7. Acender a lâmpada nova
```

Esse passo serve para testar se a troca funcionou.

---

## Passo 8 — Guardar a escada

```text
8. Guardar a escada
```

Depois que o problema foi resolvido, guardo o objeto usado.

---

## Observação importante

Esse exemplo mostra que um algoritmo não precisa começar com código.

Antes de programar, posso escrever a solução em linguagem natural.

Isso ajuda a organizar o pensamento.

---

# 1️⃣7️⃣ Boas práticas para criar algoritmos

Quando eu for criar um algoritmo, é melhor fazer ele de forma curta e objetiva.

Um algoritmo muito grande e confuso fica mais difícil de testar, corrigir e melhorar.

O ideal é:

* Resolver uma parte do problema por vez.
* Usar passos claros.
* Evitar passos ambíguos.
* Testar se a solução realmente funciona.
* Melhorar o algoritmo se necessário.

---

# 1️⃣8️⃣ Algoritmo para cálculo — Somar dois valores

```text
Algoritmo "Somar dois valores"

Início

1. Criar a variável valor1
2. Criar a variável valor2
3. Criar a variável resultado
4. Inserir o primeiro valor
5. Inserir o segundo valor
6. Somar os valores das variáveis
7. Armazenar o valor da soma na variável resultado
8. Exibir o resultado

Fim
```

---

## Explicando o algoritmo

Esse algoritmo resolve o problema de somar dois números.

---

## Passo 1 — Criar a variável valor1

```text
1. Criar a variável valor1
```

Essa variável vai guardar o primeiro número digitado.

---

## Passo 2 — Criar a variável valor2

```text
2. Criar a variável valor2
```

Essa variável vai guardar o segundo número digitado.

---

## Passo 3 — Criar a variável resultado

```text
3. Criar a variável resultado
```

Essa variável vai guardar o resultado da soma.

---

## Passo 4 — Inserir o primeiro valor

```text
4. Inserir o primeiro valor
```

Aqui o usuário informa o primeiro número.

---

## Passo 5 — Inserir o segundo valor

```text
5. Inserir o segundo valor
```

Aqui o usuário informa o segundo número.

---

## Passo 6 — Somar os valores das variáveis

```text
6. Somar os valores das variáveis
```

O algoritmo pega o valor de `valor1` e soma com `valor2`.

---

## Passo 7 — Armazenar o resultado

```text
7. Armazenar o valor da soma na variável resultado
```

O resultado da soma precisa ser guardado em algum lugar.

Por isso, uso a variável `resultado`.

---

## Passo 8 — Exibir o resultado

```text
8. Exibir o resultado
```

Depois do processamento, o resultado precisa aparecer para o usuário.

---

# 1️⃣9️⃣ Teste de Mesa

O **teste de mesa** é uma forma de testar manualmente um algoritmo.

Nele, eu simulo o funcionamento do algoritmo passo a passo, como se fosse o computador.

Isso ajuda a descobrir se a lógica está correta.

---

## Exemplo de teste de mesa

Algoritmo:

```text
valor1 = 10
valor2 = 5
resultado = valor1 + valor2
```

Teste:

| Variável  | Valor |
| --------- | ----- |
| valor1    | 10    |
| valor2    | 5     |
| resultado | 15    |

Resultado final:

```text
15
```

O teste de mesa é útil porque permite encontrar erros antes mesmo de usar um programa.

---

# 2️⃣0️⃣ VisualG

O **VisualG** é um software usado para escrever e testar algoritmos em Portugol.

Ele é muito usado no começo dos estudos de programação porque permite praticar lógica sem precisar aprender logo de cara uma linguagem mais complexa.

Com ele, posso criar variáveis, ler dados, fazer cálculos e mostrar resultados.

---

# 2️⃣1️⃣ Algoritmo — Somar 3 valores e dividir por 2

```text
Algoritmo "Somar 3 valores e dividir por 2"

Início

1. Criar a variável valor1
2. Criar a variável valor2
3. Criar a variável valor3
4. Criar a variável resultado
5. Inserir o primeiro valor
6. Inserir o segundo valor
7. Inserir o terceiro valor
8. Somar os valores das variáveis
9. Dividir o valor da soma por 2
10. Armazenar o valor na variável resultado
11. Exibir o resultado

Fim
```

---

## Explicando esse algoritmo

Esse algoritmo recebe três valores, soma todos eles e divide o resultado por 2.

Exemplo:

```text
valor1 = 10
valor2 = 20
valor3 = 30
```

Soma:

```text
10 + 20 + 30 = 60
```

Divisão por 2:

```text
60 / 2 = 30
```

Resultado:

```text
30
```

---

## Observação importante

Esse algoritmo não calcula a média de três valores, porque para calcular a média de três valores seria necessário dividir por 3.

Neste caso, como a divisão é por 2, o algoritmo está apenas somando três valores e dividindo a soma por 2.

---

# 2️⃣2️⃣ Primeiro exemplo no VisualG — Leitor de nome e idade

Agora, no VisualG, foi criado um algoritmo para ler o nome e a idade do usuário.

---

## Código completo

```portugol
algoritmo "Leitor de nome e idade"

var
   nome: caractere
   idade: inteiro

inicio
   escreval("Digite o seu nome: ")
   leia(nome)

   escreval("Digite a sua idade: ")
   leia(idade)

   escreval("O nome digitado é ", nome, " e sua idade é ", idade)

fimalgoritmo
```

---

## Explicando linha por linha

```portugol
algoritmo "Leitor de nome e idade"
```

Essa linha define o nome do algoritmo.

O nome serve para identificar o programa.

---

```portugol
var
```

Essa parte indica o início da área de declaração de variáveis.

É aqui que eu digo quais variáveis o programa vai usar.

---

```portugol
nome: caractere
```

Aqui crio uma variável chamada `nome`.

Ela é do tipo `caractere`, porque vai guardar texto.

---

```portugol
idade: inteiro
```

Aqui crio uma variável chamada `idade`.

Ela é do tipo `inteiro`, porque vai guardar um número inteiro.

---

```portugol
inicio
```

Essa linha indica onde começa a execução do algoritmo.

A partir daqui, o programa começa a seguir os comandos.

---

```portugol
escreval("Digite o seu nome: ")
```

O comando `escreval` mostra uma mensagem na tela.

Nesse caso, ele pede para o usuário digitar o nome.

---

```portugol
leia(nome)
```

O comando `leia` recebe uma informação digitada pelo usuário.

Aqui, o valor digitado será armazenado dentro da variável `nome`.

---

```portugol
escreval("Digite a sua idade: ")
```

Essa linha mostra uma nova mensagem, pedindo a idade do usuário.

---

```portugol
leia(idade)
```

Aqui o programa lê a idade digitada e guarda esse valor na variável `idade`.

---

```portugol
escreval("O nome digitado é ", nome, " e sua idade é ", idade)
```

Essa linha exibe uma frase com os valores armazenados nas variáveis.

Ela junta texto fixo com valores das variáveis.

Isso é chamado de **concatenação**.

---

```portugol
fimalgoritmo
```

Essa linha indica o fim do algoritmo.

---

## Como executar

Para executar no VisualG, posso pressionar:

```text
F9
```

Se o código estiver correto, o programa será executado e pedirá o nome e a idade.

---

# 2️⃣3️⃣ Concatenação

**Concatenar** significa juntar informações.

Na programação, normalmente significa juntar textos com variáveis.

Exemplo:

```portugol
escreval("Olá, ", nome)
```

Se a variável `nome` tiver o valor `Bruss`, a saída será:

```text
Olá, Bruss
```

A concatenação é muito usada para montar mensagens personalizadas.

---

# 2️⃣4️⃣ Segundo exemplo no VisualG — Somar dois valores

---

## Código completo

```portugol
algoritmo "Somar dois valores"

var
   resultado, valor1, valor2: inteiro

inicio
   escreval("Digite o primeiro valor")
   leia(valor1)

   escreval("Digite o segundo valor")
   leia(valor2)

   resultado <- valor1 + valor2

   escreval("O resultado da soma dos valores é ", resultado)

fimalgoritmo
```

---

## Explicando linha por linha

```portugol
algoritmo "Somar dois valores"
```

Define o nome do algoritmo.

Nesse caso, o objetivo é somar dois números.

---

```portugol
var
```

Indica a área onde as variáveis serão declaradas.

---

```portugol
resultado, valor1, valor2: inteiro
```

Aqui são criadas três variáveis do tipo inteiro:

* `valor1`: guarda o primeiro número.
* `valor2`: guarda o segundo número.
* `resultado`: guarda o resultado da soma.

Como todas são do mesmo tipo, posso declarar na mesma linha.

---

```portugol
inicio
```

Indica o começo dos comandos do programa.

---

```portugol
escreval("Digite o primeiro valor")
```

Mostra uma mensagem pedindo o primeiro valor.

---

```portugol
leia(valor1)
```

Lê o número digitado pelo usuário e guarda dentro da variável `valor1`.

---

```portugol
escreval("Digite o segundo valor")
```

Mostra uma mensagem pedindo o segundo valor.

---

```portugol
leia(valor2)
```

Lê o segundo número digitado e guarda dentro da variável `valor2`.

---

```portugol
resultado <- valor1 + valor2
```

Essa é a linha do processamento.

O programa soma o valor de `valor1` com o valor de `valor2`.

Depois, armazena o resultado dentro da variável `resultado`.

O símbolo `<-` significa “recebe”.

Então posso ler assim:

```text
resultado recebe valor1 + valor2
```

---

```portugol
escreval("O resultado da soma dos valores é ", resultado)
```

Mostra na tela uma mensagem com o resultado da soma.

Aqui acontece concatenação entre o texto e a variável `resultado`.

---

```portugol
fimalgoritmo
```

Finaliza o algoritmo.

---

## Exemplo de execução

Se eu digitar:

```text
valor1 = 10
valor2 = 20
```

O processamento será:

```text
resultado = 10 + 20
resultado = 30
```

Saída:

```text
O resultado da soma dos valores é 30
```

---

# 2️⃣5️⃣ Terceiro exemplo no VisualG — Média de quatro valores

---

## Código completo

```portugol
algoritmo "Média de quatro valores"

var
   media, valor1, valor2, valor3, valor4: real

inicio
   escreval("Digite o primeiro valor")
   leia(valor1)

   escreval("Digite o segundo valor")
   leia(valor2)

   escreval("Digite o terceiro valor")
   leia(valor3)

   escreval("Digite o quarto valor")
   leia(valor4)

   media <- (valor1 + valor2 + valor3 + valor4) / 4

   escreval("O resultado da média dos valores é ", media)

fimalgoritmo
```

---

## Explicando linha por linha

```portugol
algoritmo "Média de quatro valores"
```

Define o nome do algoritmo.

O objetivo é calcular a média de quatro valores.

---

```portugol
var
```

Indica o início da área de declaração das variáveis.

---

```portugol
media, valor1, valor2, valor3, valor4: real
```

Aqui são criadas cinco variáveis do tipo `real`.

Uso `real` porque a média pode ter casas decimais.

Exemplo:

```text
7.5
8.25
9.75
```

As variáveis são:

* `valor1`: guarda o primeiro valor.
* `valor2`: guarda o segundo valor.
* `valor3`: guarda o terceiro valor.
* `valor4`: guarda o quarto valor.
* `media`: guarda o resultado final da média.

---

```portugol
inicio
```

Marca o início da execução do algoritmo.

---

```portugol
escreval("Digite o primeiro valor")
```

Mostra uma mensagem pedindo o primeiro valor.

---

```portugol
leia(valor1)
```

Lê o primeiro valor digitado e armazena na variável `valor1`.

---

```portugol
escreval("Digite o segundo valor")
```

Mostra uma mensagem pedindo o segundo valor.

---

```portugol
leia(valor2)
```

Lê o segundo valor digitado e armazena na variável `valor2`.

---

```portugol
escreval("Digite o terceiro valor")
```

Mostra uma mensagem pedindo o terceiro valor.

---

```portugol
leia(valor3)
```

Lê o terceiro valor digitado e armazena na variável `valor3`.

---

```portugol
escreval("Digite o quarto valor")
```

Mostra uma mensagem pedindo o quarto valor.

---

```portugol
leia(valor4)
```

Lê o quarto valor digitado e armazena na variável `valor4`.

---

```portugol
media <- (valor1 + valor2 + valor3 + valor4) / 4
```

Essa linha calcula a média.

Primeiro, o programa soma os quatro valores:

```text
valor1 + valor2 + valor3 + valor4
```

Os parênteses garantem que a soma aconteça antes da divisão.

Depois, o resultado da soma é dividido por 4.

Por fim, o valor calculado é armazenado na variável `media`.

---

```portugol
escreval("O resultado da média dos valores é ", media)
```

Mostra na tela o resultado da média.

O texto fixo é juntado com o valor da variável `media`.

---

```portugol
fimalgoritmo
```

Finaliza o algoritmo.

---

## Exemplo de execução

Se eu digitar:

```text
valor1 = 8
valor2 = 7
valor3 = 9
valor4 = 6
```

A conta será:

```text
media = (8 + 7 + 9 + 6) / 4
media = 30 / 4
media = 7.5
```

Saída:

```text
O resultado da média dos valores é 7.5
```

---

# 2️⃣6️⃣ Conceito Fundamental

O conceito mais importante desta aula é entender que um programa trabalha com dados armazenados em variáveis.

Esses dados podem ser textos, números inteiros, números reais ou valores lógicos.

Com os operadores, consigo fazer cálculos, comparações e atribuições.

Com algoritmos, consigo organizar os passos para resolver um problema.

No VisualG, começo a transformar esses passos em código, usando comandos como `escreval`, `leia`, variáveis e atribuições.

---

# ✅ Em resumo

Nesta aula, aprendi que um programa de computador é uma sequência de instruções organizadas.

Também entendi a diferença entre linguagens de baixo nível e alto nível.

As linguagens de baixo nível são mais próximas da máquina, enquanto as linguagens de alto nível são mais próximas do ser humano.

Aprendi que variáveis são espaços na memória usados para armazenar dados, e que cada variável deve ter um tipo.

Também estudei operadores aritméticos, de atribuição, comparação e lógica.

Além disso, vi que algoritmos são sequências de passos criadas para resolver problemas.

No VisualG, comecei a escrever algoritmos reais, lendo dados, armazenando em variáveis, processando informações e exibindo resultados.

---

# ⚡ Resumo Relâmpago — 10 linhas

1. Programa de computador é um conjunto de instruções para resolver uma tarefa.
2. Linguagem de baixo nível é mais próxima da máquina, como Assembly.
3. Linguagem de alto nível é mais próxima do ser humano e mais fácil de entender.
4. Variável é um espaço reservado na memória para guardar dados.
5. Uma variável possui nome, tipo e conteúdo.
6. Tipos de dados definem se a variável guarda texto, número ou valor lógico.
7. Operadores aritméticos servem para fazer cálculos.
8. Operadores de comparação retornam verdadeiro ou falso.
9. Algoritmo é uma sequência organizada de passos para resolver um problema.
10. No VisualG, uso `escreval`, `leia`, variáveis e atribuições para criar meus primeiros programas.

