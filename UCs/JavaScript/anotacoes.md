# 🟨 JavaScript — Entrada de Dados pelo Usuário

Agora vou avançar a anotação para a parte de **entrada de dados pelo usuário**. O objetivo é sair de programas em que os valores ficam escritos diretamente no código e passar a permitir que o usuário **digite os valores durante a execução**.

> **Ideia principal:** até aqui, eu fazia `let a = 10`. Agora quero que o usuário possa digitar o valor de `a`.

---

## 1. Entrada de dados no JavaScript

Quando executo um programa pelo **Node.js**, posso utilizar o módulo `readline` para criar uma interação com o usuário pelo terminal.

A ideia é:

```text
Programa
   ↓
faz uma pergunta
   ↓
Usuário digita uma resposta
   ↓
Programa recebe a resposta
   ↓
JavaScript processa o valor
   ↓
Programa apresenta o resultado
```

Por exemplo:

```text
Digite o primeiro valor: 10
Digite o segundo valor: 5

Soma dos valores: 15
```

O usuário não precisa modificar o código para informar `10` e `5`.

---

# 2. O módulo `readline`

Para utilizar essa funcionalidade, primeiro importo o módulo:

```javascript
const readline = require('readline');
```

### Entendendo cada parte

### `const`

Declara uma constante.

```javascript
const readline
```

Estou criando uma constante chamada `readline`.

### `require()`

```javascript
require('readline')
```

O `require()` permite carregar um módulo para utilizá-lo no programa.

### `'readline'`

É o módulo nativo do Node.js utilizado para trabalhar com entrada e saída de dados de maneira interativa.

Portanto:

```javascript
const readline = require('readline');
```

pode ser entendido como:

> "Carregue o módulo `readline` e guarde sua referência na constante `readline`."

---

# 3. Criando a interface de entrada e saída

Depois de carregar o módulo, preciso criar uma interface:

```javascript
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
```

Essa é uma das partes mais importantes do código.

---

## 3.1 `readline.createInterface()`

```javascript
readline.createInterface()
```

Cria uma interface que permite ao programa **receber entradas e enviar saídas** pelo terminal.

Guardo essa interface na constante:

```javascript
rl
```

`rl` é apenas um nome escolhido para representar a interface do `readline`.

Poderia ser outro nome, mas `rl` é uma abreviação bastante utilizada.

---

## 3.2 `input: process.stdin`

```javascript
input: process.stdin
```

Define de onde o programa receberá os dados.

`process.stdin` representa a **entrada padrão** do processo.

Na prática, nesse caso:

> ⌨️ A entrada vem do teclado/terminal.

---

## 3.3 `output: process.stdout`

```javascript
output: process.stdout
```

Define para onde as mensagens de saída serão enviadas.

`process.stdout` representa a **saída padrão**.

Na prática:

> 🖥️ As mensagens aparecem no terminal.

---

## 3.4 Visualizando a estrutura

```text
                 Node.js
                    │
          ┌─────────┴─────────┐
          ↓                   ↓
   process.stdin       process.stdout
          │                   │
          ↓                   ↓
       ⌨️ Teclado          🖥️ Terminal
          │
          ↓
       readline
          │
          ↓
     Programa JavaScript
```

---

# 4. Fazendo uma pergunta com `rl.question()`

Depois de criar a interface, posso perguntar algo ao usuário:

```javascript
rl.question('Digite o seu nome: ', (nome) => {
    // código executado depois que o usuário responder
});
```

O método:

```javascript
rl.question()
```

faz uma pergunta e espera o usuário digitar uma resposta.

---

## 4.1 A pergunta

```javascript
'Digite o seu nome: '
```

É o texto que aparece no terminal.

---

## 4.2 `(nome) => { ... }`

Essa parte é uma **função de callback**.

```javascript
(nome) => {
    // código
}
```

Podemos entender inicialmente como:

> "Quando o usuário responder, coloque a resposta dentro da variável `nome` e execute o código que está dentro das chaves."

Por exemplo, se o usuário digitar:

```text
Bruss
```

a variável `nome` receberá:

```javascript
nome = "Bruss";
```

---

# 5. Primeiro programa completo

```javascript
// Configurando a entrada de dados pelo usuário
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o seu nome: ', (nome) => {
    console.log(`Nome: ${nome}`);

    rl.close();
});
```

### Fluxo de execução

1. Carrego o `readline`.
2. Crio a interface `rl`.
3. O programa pergunta o nome.
4. O usuário digita o nome.
5. A resposta é armazenada em `nome`.
6. `console.log()` mostra o nome.
7. `rl.close()` encerra a interface.

---

# 6. Por que preciso usar `Number()`?

Existe um detalhe **muito importante** quando recebo números através do `readline`:

> A entrada recebida pelo usuário chega como **String**.

Por exemplo, se o usuário digitar:

```text
10
```

o programa recebe algo equivalente a:

```javascript
"10"
```

e não:

```javascript
10
```

A diferença é:

```text
"10" → String
10   → Number
```

Por isso utilizo:

```javascript
Number(valor)
```

para converter o texto recebido em número.

---

# 7. Exemplo com dois valores

```javascript
const soma = Number(valor1) + Number(valor2);
```

Se:

```text
valor1 = "10"
valor2 = "5"
```

o JavaScript transforma:

```text
"10" → 10
"5"  → 5
```

Então realiza:

```text
10 + 5 = 15
```

---

# 8. Programa para somar dois valores

```javascript
// Configurando a entrada de dados pelo usuário
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o seu nome: ', (nome) => {
    rl.question('Digite o primeiro valor: ', (valor1) => {
        rl.question('Digite o segundo valor: ', (valor2) => {

            const soma = Number(valor1) + Number(valor2);

            console.log(`Nome: ${nome}`);
            console.log(`Soma dos valores: ${soma}`);

            rl.close();
        });
    });
});
```

---

# 9. Entendendo o código por partes

## Carregando o módulo

```javascript
const readline = require('readline');
```

Carrega o módulo `readline`.

---

## Criando a interface

```javascript
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
```

Configura:

* entrada → `process.stdin`;
* saída → `process.stdout`.

---

## Primeira pergunta

```javascript
rl.question('Digite o seu nome: ', (nome) => {
```

O programa pergunta o nome.

A resposta é armazenada em:

```javascript
nome
```

---

## Segunda pergunta

```javascript
rl.question('Digite o primeiro valor: ', (valor1) => {
```

O primeiro valor digitado fica armazenado em:

```javascript
valor1
```

---

## Terceira pergunta

```javascript
rl.question('Digite o segundo valor: ', (valor2) => {
```

O segundo valor fica armazenado em:

```javascript
valor2
```

---

## Fazendo a conversão e soma

```javascript
const soma = Number(valor1) + Number(valor2);
```

Converto os dois valores para `Number` e depois faço a soma.

---

## Exibindo o nome

```javascript
console.log(`Nome: ${nome}`);
```

Aqui estou utilizando uma **template string**.

As crases:

```javascript
`
```

permitem inserir variáveis dentro do texto usando:

```javascript
${variavel}
```

Se:

```javascript
nome = "Bruss";
```

o resultado será:

```text
Nome: Bruss
```

---

## Exibindo a soma

```javascript
console.log(`Soma dos valores: ${soma}`);
```

Se `soma` for `15`:

```text
Soma dos valores: 15
```

---

## Encerrando a interface

```javascript
rl.close();
```

Fecha a interface do `readline`.

É importante encerrar a interface quando não precisarei mais receber entradas.

---

# 10. Executando pelo terminal

Depois de salvar o arquivo, posso abrir o terminal integrado do VS Code.

Atalho:

```text
Ctrl + J
```

Depois utilizo:

```bash
node somadedoisvalores.js
```

### O que significa?

```text
node
```

é o comando utilizado para executar JavaScript através do **Node.js**.

```text
somadedoisvalores.js
```

é o arquivo que quero executar.

Portanto:

```bash
node somadedoisvalores.js
```

significa:

> "Execute este arquivo JavaScript usando o Node.js."

---

# 11. Criando uma calculadora simples

Agora posso aproveitar o mesmo conceito para criar uma calculadora.

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o primeiro valor: ', (valor1) => {
    rl.question('Digite o segundo valor: ', (valor2) => {

        let soma = Number(valor1) + Number(valor2);
        let subtracao = Number(valor1) - Number(valor2);
        let multiplicacao = Number(valor1) * Number(valor2);
        let divisao = Number(valor1) / Number(valor2);

        console.log('===== RESULTADO =====');
        console.log(`Soma dos valores: ${soma}`);
        console.log(`Subtração dos valores: ${subtracao}`);
        console.log(`Multiplicação dos valores: ${multiplicacao}`);
        console.log(`Divisão dos valores: ${divisao}`);

        rl.close();
    });
});
```

### ⚠️ Um detalhe

Na anotação original, a segunda pergunta estava escrita novamente como:

```javascript
'Digite o primeiro valor: '
```

Para a calculadora, o correto é:

```javascript
'Digite o segundo valor: '
```

---

# 12. O que a calculadora faz?

Supondo:

```text
Digite o primeiro valor: 10
Digite o segundo valor: 5
```

Temos:

```text
soma          = 15
subtração     = 5
multiplicação = 50
divisão       = 2
```

Resultado:

```text
===== RESULTADO =====
Soma dos valores: 15
Subtração dos valores: 5
Multiplicação dos valores: 50
Divisão dos valores: 2
```

---

# 13. Exercício — Área do quadrado

A fórmula da área de um quadrado é:

```text
A = lado × lado
```

Código:

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o lado 1: ', (l1) => {
    rl.question('Digite o lado 2: ', (l2) => {

        const area = Number(l1) * Number(l2);

        console.log('===== RESULTADO =====');
        console.log(`A área do quadrado é de: ${area} m²`);

        rl.close();
    });
});
```

### Exemplo

```text
lado 1 = 5
lado 2 = 5
```

Então:

```text
5 × 5 = 25
```

Resultado:

```text
A área do quadrado é de: 25 m²
```

> Para um quadrado verdadeiro, os dois lados possuem a mesma medida. O exercício usa dois valores, mas matematicamente basta um lado: `lado × lado`.

---

# 14. Exercício — Área do triângulo

A fórmula é:

```text
A = (base × altura) / 2
```

Código:

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o valor da base: ', (b) => {
    rl.question('Digite o valor da altura: ', (h) => {

        const area = (Number(b) * Number(h)) / 2;

        console.log('===== RESULTADO =====');
        console.log(`A área do triângulo é de: ${area} m²`);

        rl.close();
    });
});
```

### Exemplo

```text
base = 10
altura = 5
```

Cálculo:

```text
(10 × 5) / 2
50 / 2
25
```

Resultado:

```text
A área do triângulo é de: 25 m²
```

---

# 15. Exercício — Área do trapézio

A fórmula é:

```text
A = ((B + b) × h) / 2
```

Onde:

* `B` → base maior;
* `b` → base menor;
* `h` → altura.

Código:

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o valor da base maior: ', (B) => {
    rl.question('Digite o valor da base menor: ', (b) => {
        rl.question('Digite o valor da altura: ', (h) => {

            const area = ((Number(B) + Number(b)) * Number(h)) / 2;

            console.log('===== RESULTADO =====');
            console.log(`A área do trapézio é de: ${area} m²`);

            rl.close();
        });
    });
});
```

### Exemplo

```text
B = 10
b = 6
h = 5
```

Cálculo:

```text
((10 + 6) × 5) / 2
(16 × 5) / 2
80 / 2
40
```

Resultado:

```text
A área do trapézio é de: 40 m²
```

---

# 16. Exercício — Área do losango

A fórmula é:

```text
A = (D × d) / 2
```

Onde:

* `D` → diagonal maior;
* `d` → diagonal menor.

Código:

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o valor da diagonal maior: ', (D) => {
    rl.question('Digite o valor da diagonal menor: ', (d) => {

        const area = (Number(D) * Number(d)) / 2;

        console.log('===== RESULTADO =====');
        console.log(`A área do losango é de: ${area} m²`);

        rl.close();
    });
});
```

### Exemplo

```text
D = 10
d = 6
```

Então:

```text
(10 × 6) / 2 = 30
```

Resultado:

```text
A área do losango é de: 30 m²
```

---

# 17. Exercício — Área do retângulo

A fórmula é:

```text
A = base × altura
```

Código:

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o valor da base: ', (b) => {
    rl.question('Digite o valor da altura: ', (h) => {

        const area = Number(b) * Number(h);

        console.log('===== RESULTADO =====');
        console.log(`A área do retângulo é de: ${area} m²`);

        rl.close();
    });
});
```

Exemplo:

```text
base = 10
altura = 5
```

```text
10 × 5 = 50
```

Resultado:

```text
A área do retângulo é de: 50 m²
```

---

# 18. Exercício — Juros simples

A fórmula dos juros simples é:

```text
J = C × i × t
```

Onde:

* `J` → juros;
* `C` → capital;
* `i` → taxa;
* `t` → tempo.

Como a taxa é informada em porcentagem, preciso transformá-la em decimal:

```text
i / 100
```

Por isso:

```javascript
Number(i) / 100
```

---

## Código

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o capital aplicado: ', (c) => {
    rl.question('Digite a taxa de juros: ', (i) => {
        rl.question('Digite o tempo (em meses): ', (t) => {

            const juros = Number(c) * (Number(i) / 100) * Number(t);
            const montante = Number(c) + juros;

            console.log(`O juros simples é de: ${juros}`);
            console.log(`O valor do montante é de: ${montante}`);

            rl.close();
        });
    });
});
```

### Exemplo

Supondo:

```text
Capital = 1000
Taxa = 2%
Tempo = 5 meses
```

Primeiro:

```text
2 / 100 = 0,02
```

Depois:

```text
J = 1000 × 0,02 × 5
J = 100
```

Montante:

```text
M = 1000 + 100
M = 1100
```

Resultado:

```text
Juros simples: 100
Montante: 1100
```

> ⚠️ Ajustei o nome da variável para `juros`, porque `simples` representava o valor dos juros, enquanto o conceito matemático é o **juro**. Também é mais claro exibir "juros" no resultado.

---

# 19. Exercício — Juros compostos

Nos juros compostos, a fórmula do **montante** é:

```text
M = C × (1 + i)ᵗ
```

Onde:

* `M` → montante;
* `C` → capital;
* `i` → taxa em decimal;
* `t` → tempo.

No código:

```javascript
const montante = Number(c) * (1 + Number(i) / 100) ** Number(t);
```

---

## Código

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o capital aplicado: ', (c) => {
    rl.question('Digite a taxa de juros: ', (i) => {
        rl.question('Digite o tempo (em meses): ', (t) => {

            const montante = Number(c) *
                (1 + Number(i) / 100) ** Number(t);

            const juros = montante - Number(c);

            console.log(`O montante é de: ${montante}`);
            console.log(`Os juros compostos são de: ${juros}`);

            rl.close();
        });
    });
});
```

### Por que fiz duas variáveis?

A fórmula:

```text
C × (1 + i)ᵗ
```

calcula diretamente o **montante**, não apenas os juros.

Então:

```javascript
const montante = ...
```

calcula o valor total.

Depois:

```javascript
const juros = montante - Number(c);
```

calcula somente a parte correspondente aos juros.

### Exemplo

```text
Capital = 1000
Taxa = 2%
Tempo = 5 meses
```

A fórmula é:

```text
M = 1000 × (1 + 0,02)⁵
```

aproximadamente:

```text
M = 1104,08
```

Então os juros são aproximadamente:

```text
1104,08 - 1000 = 104,08
```

---

# 20. Um padrão que aparece em quase todos os exercícios

Observe que vários códigos possuem a mesma estrutura:

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
```

Depois:

```javascript
rl.question(...)
```

para receber os dados.

Depois:

```javascript
Number(...)
```

para converter os dados.

Depois:

```javascript
const resultado = ...
```

para realizar o cálculo.

Depois:

```javascript
console.log(...)
```

para apresentar o resultado.

E finalmente:

```javascript
rl.close();
```

para encerrar a entrada de dados.

Podemos representar isso assim:

```text
┌──────────────────────────────┐
│ 1. Importar readline         │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│ 2. Criar interface rl        │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│ 3. Perguntar ao usuário      │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│ 4. Receber os valores        │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│ 5. Converter com Number()    │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│ 6. Realizar o cálculo        │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│ 7. Mostrar resultado         │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│ 8. Fechar com rl.close()     │
└──────────────────────────────┘
```

Esse padrão será muito importante para os próximos exercícios.

---

# 21. ⚠️ Um detalhe importante sobre entrada de números

Como `rl.question()` entrega texto, preciso converter quando quero fazer cálculos:

```javascript
Number(valor1)
```

Por exemplo:

```javascript
const resultado = Number(valor1) + Number(valor2);
```

Sem essa conversão, o operador `+` pode trabalhar como concatenação de strings.

Exemplo:

```javascript
"10" + "5"
```

resulta em:

```text
"105"
```

Enquanto:

```javascript
Number("10") + Number("5")
```

resulta em:

```text
15
```

Essa diferença é **fundamental em JavaScript**.

---

**Resumo Relâmpago**

1. Para receber dados do usuário no Node.js, posso utilizar o módulo nativo **`readline`**.
2. `require('readline')` carrega o módulo para dentro do programa.
3. `readline.createInterface()` cria a interface de comunicação com o terminal.
4. `process.stdin` representa a **entrada** e `process.stdout` representa a **saída**.
5. `rl.question()` faz uma pergunta e recebe a resposta do usuário por meio de um callback.
6. Os dados recebidos pelo `rl.question()` são tratados como **String**.
7. Para utilizar esses dados em cálculos, posso convertê-los com `Number()`.
8. `console.log()` apresenta informações no terminal e `${}` permite inserir valores dentro de template strings.
9. `rl.close()` encerra a interface do `readline` quando não preciso mais receber dados.
10. A estrutura básica é: **configurar → perguntar → receber → converter → calcular → mostrar → fechar**.
    :::
