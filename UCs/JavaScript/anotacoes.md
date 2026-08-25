# JavaScript — Introdução, Sintaxe, Variáveis e Operadores

**O que é JavaScript**

**JavaScript** é uma linguagem de programação muito utilizada no mercado atualmente.

Ela é principalmente conhecida pelo desenvolvimento **Front-end**, mas também pode ser utilizada no **Back-end**.

**Onde o JavaScript pode ser usado?**

**Front-end:** interação e comportamento das páginas Web.

**Back-end:** desenvolvimento da parte do servidor, utilizando ambientes como o Node.js.

**Aplicações:** também pode ser utilizado em diferentes tipos de aplicações.

Uma forma simples de entender:

> **HTML** → estrutura da página
> **CSS** → aparência da página
> **JavaScript** → comportamento e lógica da página

Por exemplo, o HTML pode criar um botão, o CSS pode deixá-lo bonito e o JavaScript pode fazer alguma coisa acontecer quando o usuário clicar nele.

---

# Sintaxe do JavaScript

A **sintaxe** é o conjunto de regras que define como devemos escrever o código para que ele seja entendido corretamente pelo JavaScript.

É semelhante à gramática de uma língua: assim como precisamos seguir determinadas regras para uma frase fazer sentido, precisamos seguir as regras da linguagem para o programa funcionar.

Entre as regras básicas estão:

* O JavaScript diferencia **maiúsculas e minúsculas**.
* As instruções são executadas, normalmente, **de cima para baixo**.
* O `;` pode ser utilizado para indicar o final de uma instrução. 

**JavaScript diferencia maiúsculas e minúsculas**

Isso é chamado de **case-sensitive**.

- **Por exemplo:**

```javascript
var nome = "Bruss";
var Nome = "João";
```

`nome` e `Nome` são identificadores diferentes.

Portanto:

```javascript
console.log(nome);
```

não é a mesma coisa que:

```javascript
console.log(Nome);
```

**Também é importante lembrar que os comandos e métodos precisam respeitar sua escrita correta.**

- **Por exemplo:**

```javascript
console.log("Olá Mundo!");
```

O correto é `console.log()` com `console` em letras minúsculas.

---

**Ponto e vírgula `;`**

O ponto e vírgula pode ser utilizado para indicar o final de uma instrução:

```javascript
var mensagem = "Olá Mundo";
console.log(mensagem);
```

Cada linha representa uma instrução.

O JavaScript possui **Automatic Semicolon Insertion (ASI)**, portanto o `;` nem sempre é obrigatório. Mesmo assim, durante o aprendizado, é uma boa prática utilizá-lo de forma consistente.

---

## Primeiro exemplo de JavaScript

```javascript
// Declarando a variável mensagem
var mensagem = "Olá Mundo";

// Mostrando o conteúdo da mensagem no console
console.log(mensagem);
```

**Entendendo linha por linha**

**Linha 1**

```javascript
// Declarando a variável mensagem
```

Isso é um **comentário**.

O JavaScript ignora essa linha durante a execução. Ela serve para nós, programadores, entendermos o código.

---

**Linha 2**

```javascript
var mensagem = "Olá Mundo";
```

Aqui estamos criando uma variável chamada `mensagem`.

Podemos separar essa instrução:

```
var       mensagem       =       "Olá Mundo";
│             │          │             │
│             │          │             └─ valor armazenado
│             │          └─ atribuição
│             └─ nome da variável
└─ declaração da variável
```

A variável funciona como uma **caixa com um nome**.

Nesse caso:

> Caixa chamada `mensagem` → guarda `"Olá Mundo"`

---

**Linha 3**

```javascript
console.log(mensagem);
```

`console.log()` é utilizado para mostrar informações no **console**.

O JavaScript pega o valor armazenado em `mensagem` e o envia para o console.

Resultado:

```
Olá Mundo
```

---

**Comentários**

Os comentários são textos inseridos no código para **explicar, documentar ou organizar o programa**.

Eles não são executados pelo JavaScript. 

Existem duas formas principais.

**Comentário de uma linha**

Utilizamos `//`:

```javascript
// Este é um comentário
console.log("Olá Mundo!");
```

Tudo que estiver depois de `//` naquela linha será ignorado pelo JavaScript.

---

**Comentário de várias linhas**

Utilizamos:

```javascript
/*
   Este é um comentário
   de várias linhas.
*/
```

É útil quando precisamos explicar uma parte maior do código.

- **Resumindo**

| Sintaxe     | Tipo                        |
| ----------- | --------------------------- |
| `//`        | Comentário de uma linha     |
| `/* ... */` | Comentário de várias linhas |

---

# Métodos

Um **método** é uma função associada a um objeto que pode realizar determinada ação.

Durante esta introdução, veremos métodos relacionados ao `document` e ao `console`.

- **Por exemplo:**

```javascript
console.log("Olá Mundo!");
```

Aqui estamos utilizando o método `log()` do objeto `console`.

Também veremos:

```javascript
document.write();
```

e:

```javascript
document.getElementById();
```

---

## `document.write()`

O método:

```javascript
document.write();
```

pode escrever conteúdo diretamente no documento HTML. 

- **Exemplo:**

```javascript
document.write("Esta frase foi escrita em JavaScript");
```

Nesse caso, o texto será inserido na página.

> Atenção

`document.write()` deve ser utilizado com cuidado. Quando executado depois que a página já foi carregada, ele pode substituir o conteúdo existente do documento.

Por isso, em aplicações reais, normalmente existem formas mais apropriadas de modificar o conteúdo da página.

---

## `document.getElementById()`

O método:

```javascript
document.getElementById();
```

serve para localizar um elemento HTML através do seu atributo `id`. 

- **Exemplo:**

```html
<p id="teste">Olá mundo!</p>
<button onclick="mudaTexto()">Mudar texto</button>
```

Depois podemos utilizar JavaScript:

```javascript
function mudaTexto() {
    document.getElementById("teste").innerHTML = "JavaScript";
}
```

**Entendendo**

```javascript
document
```

Representa o documento HTML que está sendo exibido.

```javascript
.getElementById("teste")
```

Procura no documento um elemento que possua:

```html
id="teste"
```

Nesse caso:

```html
<p id="teste">Olá mundo!</p>
```

é encontrado.

Depois:

```javascript
.innerHTML = "JavaScript";
```

altera o conteúdo interno do elemento.

Antes:

```
Olá mundo!
```

Depois:

```
JavaScript
```

> Analogia

Imagine o HTML como uma casa cheia de objetos.

O `id` funciona como uma **etiqueta de identificação**.

```html
<p id="teste">
```

é como colocar uma etiqueta dizendo:

> "Este objeto se chama teste."

Então:

```javascript
document.getElementById("teste")
```

significa:

> "Procure no documento o objeto que possui a etiqueta `teste`."

---

# Variáveis

Uma **variável** é um espaço utilizado para armazenar um valor que poderá ser utilizado pelo programa.

Podemos pensar em uma variável como uma caixa:

```
┌───────────────┐
│   mensagem    │
│  "Olá Mundo"  │
└───────────────┘
```

O nome da caixa é `mensagem` e o conteúdo armazenado é `"Olá Mundo"`.

No JavaScript, podemos declarar variáveis utilizando:

```javascript
var
let
const
```

---

## `var`, `let` e `const`

**`var`**

É uma forma mais antiga de declarar variáveis:

```javascript
var nome = "Bruss";
```

Ainda funciona, mas em código JavaScript moderno, normalmente preferimos `let` e `const`, pois possuem regras de escopo mais previsíveis.

---

**`let`**

É utilizada quando o valor da variável pode ser alterado:

```javascript
let idade = 18;

idade = 19;
```

O valor inicialmente era `18` e depois passou a ser `19`.

---

**`const`**

É utilizada quando não pretendemos reatribuir a variável:

```javascript
const nome = "Bruss";
```

Não podemos fazer:

```javascript
nome = "João";
```

porque `nome` foi declarado com `const`.

- **Regra prática**

```text
const → valor não será reatribuído
let   → valor poderá ser reatribuído
var   → forma antiga, ainda existente
```

> Importante: `const` impede a **reatribuição da variável**, não significa que absolutamente tudo relacionado ao valor seja imutável.

---

# Tipos de dados

Uma variável pode armazenar diferentes tipos de valores.

Os principais tipos apresentados são:

* `String`
* `Number`
* `Boolean`
* `Array`
* `Object` 

---

**String**

`String` representa **texto**.

- **Exemplos:**

```javascript
"Olá Mundo"
"Bruss"
'JavaScript'
```

Podemos utilizar aspas simples ou duplas:

```javascript
let nome = "Bruss";
let cidade = 'São Paulo';
```

O texto fica entre aspas para que o JavaScript saiba que aquilo é uma sequência de caracteres.

---

**Number**

`Number` representa números.

- **Exemplos:**

```javascript
10
25
3.14
10.50
```

No JavaScript, o tipo `Number` é utilizado tanto para números inteiros quanto para números decimais.

- **Por exemplo:**

```javascript
let idade = 18;
let altura = 1.65;
```

Não precisamos utilizar tipos separados equivalentes a `int` e `float` apenas para representar esses casos.

---

**Boolean**

`Boolean` representa apenas dois valores:

```javascript
true
false
```

Ou seja:

```
true  → verdadeiro
false → falso
```

- **Exemplo:**

```javascript
let maiorDeIdade = true;
```

Esse tipo é muito utilizado em decisões e condições.

---

**Array**

Um `Array` permite armazenar vários valores em uma única estrutura.

- **Exemplo:**

```javascript
let frutas = ["Maçã", "Pera", "Laranja"];
```

Podemos imaginar:

```
frutas
 ├── Maçã
 ├── Pera
 └── Laranja
```

O array é parecido com uma **lista**.

**Embora possa ser usado para representar uma coleção de dados semelhante a uma matriz/lista de outras linguagens, o `Array` do JavaScript possui características próprias.**

---

**Object**

Um `Object` permite armazenar dados organizados em **propriedades**.

- **Exemplo:**

```javascript
let pessoa = {
    nome: "Pedro",
    idade: 35
};
```

Podemos visualizar:

```
pessoa
├── nome  → "Pedro"
└── idade → 35
```

Cada propriedade possui:

```
nome: valor
```

- **Por exemplo:**

```javascript
nome: "Pedro"
```

onde:

* `nome` → propriedade;
* `"Pedro"` → valor.

---

# 12. Exemplo reunindo tipos de dados

```javascript
var nome = "Maria Aparecida";
var idade = 25;
var ativo = true;
var frutas = ["Maçã", "Pera", "Laranja"];
var pessoa = {
    nome: "Pedro",
    idade: 35
};

console.log(nome, idade, ativo, frutas, pessoa);
```

Aqui temos:

| Variável | Tipo    | Valor                       |
| -------- | ------- | --------------------------- |
| `nome`   | String  | `"Maria Aparecida"`         |
| `idade`  | Number  | `25`                        |
| `ativo`  | Boolean | `true`                      |
| `frutas` | Array   | Lista de frutas             |
| `pessoa` | Object  | Objeto com `nome` e `idade` |

---

# 13. Operadores

Os **operadores** são símbolos que permitem realizar operações com valores e variáveis.

Exemplos:

```javascript
+
-
*
/
%
**
```

Também existem operadores utilizados para:

* incrementar e decrementar;
* comparar valores;
* realizar operações lógicas.

---

# 14. Operadores incrementais

Os operadores incrementais permitem aumentar ou diminuir o valor de uma variável.

## Incremento `++`

Adiciona `1`:

```javascript
let x = 10;

x++;
```

Agora:

```text
x = 11
```

---

## Decremento `--`

Subtrai `1`:

```javascript
let x = 10;

x--;
```

Agora:

```text
x = 9
```

---

# 15. Pré-fixado e pós-fixado

O `++` e o `--` podem aparecer antes ou depois da variável.

## Pós-fixado

```javascript
x++;
```

Primeiro o valor atual é utilizado e **depois** acontece o incremento.

Exemplo:

```javascript
var x = 10;

console.log(x++);
```

Resultado:

```text
10
```

Depois da execução:

```text
x = 11
```

---

## Pré-fixado

```javascript
++x;
```

Primeiro acontece o incremento e **depois** o valor é utilizado.

Exemplo:

```javascript
var x = 10;

console.log(++x);
```

Resultado:

```text
11
```

Nesse caso, o valor de `x` passa para `11` antes de ser enviado para o `console.log()`.

A diferença está na **ordem da operação**. 

### Forma de lembrar

```text
x++ → usa → aumenta
++x → aumenta → usa
```

---

# 16. Operadores comparativos

Os operadores comparativos servem para **comparar valores**.

O resultado de uma comparação é um valor booleano:

```javascript
true
```

ou:

```javascript
false
```

Eles são fundamentais para estruturas de decisão, como `if` e `else`. 

---

## Principais operadores

| Operador | Significado       |
| -------- | ----------------- |
| `==`     | Igualdade solta   |
| `===`    | Igualdade estrita |
| `!=`     | Diferente         |
| `!==`    | Diferente estrito |
| `>`      | Maior que         |
| `<`      | Menor que         |
| `>=`     | Maior ou igual    |
| `<=`     | Menor ou igual    |

---

# 17. `==` — igualdade solta

Compara os valores permitindo conversão de tipo.

```javascript
console.log(5 == "5");
```

Resultado:

```text
true
```

Isso acontece porque, nesse caso, o JavaScript considera os valores equivalentes após a conversão necessária.

---

# 18. `===` — igualdade estrita

Compara **valor e tipo**.

```javascript
console.log(5 === "5");
```

Resultado:

```text
false
```

Por quê?

Porque:

```text
5   → Number
"5" → String
```

Os valores parecem iguais, mas os tipos são diferentes.

### Regra prática

Em JavaScript moderno, geralmente é preferível utilizar:

```javascript
===
```

em vez de:

```javascript
==
```

quando queremos uma comparação mais previsível.

---

# 19. `!=` e `!==`

### Diferente

```javascript
5 != 3
```

Resultado:

```text
true
```

### Diferente estrito

```javascript
5 !== "5"
```

Resultado:

```text
true
```

Nesse caso, o valor e o tipo são considerados na comparação.

---

# 20. Maior e menor

Podemos comparar números utilizando:

```javascript
>
<
>=
<=
```

Exemplo:

```javascript
console.log(10 > 8);
```

Resultado:

```text
true
```

Porque `10` realmente é maior que `8`.

---

# 21. Operadores aritméticos

Os operadores aritméticos permitem realizar cálculos matemáticos. 

| Operador | Operação         | Exemplo   |
| -------- | ---------------- | --------- |
| `+`      | Adição           | `10 + 5`  |
| `-`      | Subtração        | `10 - 5`  |
| `*`      | Multiplicação    | `10 * 5`  |
| `/`      | Divisão          | `10 / 5`  |
| `%`      | Resto da divisão | `10 % 5`  |
| `**`     | Exponenciação    | `10 ** 5` |

---

## 21.1 Adição `+`

```javascript
console.log(10 + 5);
```

Resultado:

```text
15
```

---

## 21.2 Subtração `-`

```javascript
console.log(10 - 5);
```

Resultado:

```text
5
```

---

## 21.3 Multiplicação `*`

```javascript
console.log(10 * 5);
```

Resultado:

```text
50
```

---

## 21.4 Divisão `/`

```javascript
console.log(10 / 5);
```

Resultado:

```text
2
```

---

## 21.5 Resto da divisão `%`

O operador `%` retorna o **resto** de uma divisão inteira.

Exemplo:

```javascript
console.log(10 % 3);
```

Temos:

```text
10 ÷ 3 = 3
resto = 1
```

Portanto:

```text
1
```

Esse operador é muito útil, por exemplo, para descobrir se um número é par:

```javascript
numero % 2
```

Se o resultado for `0`, o número é par.

---

## 21.6 Exponenciação `**`

O operador `**` realiza uma potência.

```javascript
console.log(10 ** 5);
```

Significa:

```text
10⁵
```

ou:

```text
10 × 10 × 10 × 10 × 10
```

Resultado:

```text
100000
```

⚠️ Em JavaScript, `^` **não é o operador de potência**. Para exponenciação, utilizamos `**`.

---

# 22. Operadores lógicos

Os operadores lógicos são utilizados para combinar ou inverter expressões booleanas.

Os três principais são: 

| Operador | Nome | Ideia                                       |    |                                                |
| -------- | ---- | ------------------------------------------- | -- | ---------------------------------------------- |
| `&&`     | E    | Todas as condições precisam ser verdadeiras |    |                                                |
| `        |      | `                                           | OU | Pelo menos uma condição precisa ser verdadeira |
| `!`      | NÃO  | Inverte o resultado                         |    |                                                |

---

## 22.1 E — `&&`

Retorna `true` somente quando **as duas condições são verdadeiras**.

```javascript
let idade = 20;
let habilidade = true;

console.log(idade >= 18 && habilidade);
```

Analisando:

```text
idade >= 18 → true
habilidade  → true
```

Então:

```text
true && true → true
```

---

## 22.2 OU — `||`

Retorna `true` quando **pelo menos uma condição é verdadeira**.

Exemplo:

```javascript
let idade = 20;

console.log(idade >= 18 || idade == 15);
```

Temos:

```text
idade >= 18 → true
idade == 15 → false
```

Como existe pelo menos uma condição verdadeira:

```text
true || false → true
```

---

## 22.3 NÃO — `!`

O operador `!` inverte um valor booleano.

```javascript
let habilidade = true;

console.log(!habilidade);
```

Resultado:

```text
false
```

Porque:

```text
!true → false
!false → true
```

---

# 23. ⚠️ Cuidado com `||` e `|`

Existe uma diferença importante entre:

```javascript
||
```

e:

```javascript
|
```

Para **OU lógico**, utilizamos:

```javascript
||
```

O operador `|` é outro operador, relacionado a operações bit a bit.

Portanto, quando quisermos fazer:

> condição A **OU** condição B

devemos utilizar:

```javascript
condicaoA || condicaoB
```

---

# 24. Preparando o ambiente para programar

Para executar os exemplos de JavaScript, será utilizado o **Visual Studio Code**.

A extensão indicada nas aulas é:

> **Code Runner**, de **Jun Han**.

Ela permite executar determinados códigos diretamente pelo Visual Studio Code.

---

# 25. Criando o primeiro arquivo JavaScript

## Passo 1 — Criar um novo arquivo

No Visual Studio Code:

```text
File → New File
```

Depois podemos criar um arquivo chamado:

```text
olamundo.js
```

A extensão:

```text
.js
```

é utilizada para identificar um arquivo JavaScript.

---

## Passo 2 — Salvar o arquivo

Escolha uma pasta para guardar o arquivo e salve como:

```text
olamundo.js
```

O `.js` é importante porque identifica o arquivo como JavaScript.

---

## Passo 3 — Escrever o código

Digite:

```javascript
console.log("Olá Mundo!");
```

---

## Passo 4 — Executar

Com o Code Runner instalado, podemos utilizar o botão:

▶️ **Run Code**

no canto superior direito do Visual Studio Code.

Também podemos utilizar o atalho:

```text
Ctrl + Alt + N
```

---

# 26. Se o código não executar corretamente

Caso o Code Runner não funcione como esperado, uma possibilidade é abrir a pasta do projeto no Visual Studio Code.

Vá em:

```text
File → Open Folder
```

Depois:

1. Localize a pasta onde o arquivo `.js` está salvo.
2. Selecione a pasta.
3. Abra-a no Visual Studio Code.
4. No painel esquerdo, clique no arquivo `.js`.
5. Execute novamente utilizando **Run Code**.

### Por que abrir a pasta?

Porque o Visual Studio Code passa a tratar aquela pasta como o **projeto/workspace atual**.

Isso facilita a organização dos arquivos e a execução do código dentro daquele contexto.

---

# 27. Primeiro teste com variável

Agora podemos combinar `console.log()` com uma variável:

```javascript
console.log("Olá Mundo!");

var a = 10;

console.log(a);
```

### Linha 1

```javascript
console.log("Olá Mundo!");
```

Mostra o texto:

```text
Olá Mundo!
```

### Linha 2

```javascript
var a = 10;
```

Cria uma variável chamada `a` e armazena o número `10`.

### Linha 3

```javascript
console.log(a);
```

Mostra o valor armazenado em `a`.

Resultado:

```text
Olá Mundo!
10
```

---

# 28. Trabalhando com duas variáveis

```javascript
console.log("Olá Mundo!");

var a = 10, b = 5;

console.log(a);
console.log(b);
console.log(a + b);

console.log("O resultado de a+b é:", a + b);
```

Aqui temos duas variáveis:

```text
a = 10
b = 5
```

Então:

```javascript
a + b
```

é:

```text
10 + 5 = 15
```

Resultado esperado:

```text
Olá Mundo!
10
5
15
O resultado de a+b é: 15
```

---

# 29. Testando os operadores aritméticos

```javascript
console.log("Olá Mundo!");

var a = 10, b = 5;

console.log(a);
console.log(b);

console.log(a + b);
console.log(a - b);
console.log(a * b);
console.log(a / b);
console.log(a % b);
console.log(a ** b);
```

Com:

```text
a = 10
b = 5
```

temos:

| Expressão | Resultado | Operação      |
| --------- | --------: | ------------- |
| `a + b`   |      `15` | Adição        |
| `a - b`   |       `5` | Subtração     |
| `a * b`   |      `50` | Multiplicação |
| `a / b`   |       `2` | Divisão       |
| `a % b`   |       `0` | Resto         |
| `a ** b`  |  `100000` | Potência      |

---

# 30. Entendendo o `console.log()` mais profundamente

Podemos enviar mais de um valor para `console.log()`:

```javascript
console.log("O resultado de a+b é:", a + b);
```

Aqui existem dois argumentos:

```text
"O resultado de a+b é:"
a + b
```

O JavaScript calcula primeiro:

```javascript
a + b
```

Se:

```text
a = 10
b = 5
```

então:

```text
a + b = 15
```

O console exibirá:

```text
O resultado de a+b é: 15
```

---

# 31. Calculando uma média

Podemos utilizar variáveis e operadores para realizar cálculos mais completos.

Exemplo:

```javascript
let num1 = 5;
let num2 = 6;
let num3 = 2;
let num4 = 3;

var media = (num1 + num2 + num3 + num4) / 4;

console.log("A média é:", media);
```

## Entendendo passo a passo

Temos quatro números:

```text
num1 = 5
num2 = 6
num3 = 2
num4 = 3
```

Primeiro somamos:

```text
5 + 6 + 2 + 3 = 16
```

Depois dividimos pela quantidade de números:

```text
16 / 4 = 4
```

Portanto:

```text
A média é: 4
```

---

## Por que usamos parênteses?

A expressão:

```javascript
(num1 + num2 + num3 + num4) / 4
```

usa parênteses para deixar explícito que devemos realizar a soma primeiro.

Sem os parênteses, a precedência dos operadores poderia produzir uma expressão diferente.

Os parênteses funcionam como uma forma de dizer:

> "Primeiro faça tudo que está aqui dentro."

---

# 32. Uma versão mais moderna do exemplo

Podemos utilizar `const` para valores que não serão reatribuídos:

```javascript
const num1 = 5;
const num2 = 6;
const num3 = 2;
const num4 = 3;

const media = (num1 + num2 + num3 + num4) / 4;

console.log("A média é:", media);
```

Neste caso, `const` deixa claro que não pretendemos trocar os valores dessas variáveis durante a execução.

---

# 33. Como tudo isso começa a se conectar

Até aqui, já temos várias peças importantes do JavaScript:

```text
VARIÁVEIS
   ↓
armazenam valores
   ↓
TIPOS DE DADOS
   ↓
String / Number / Boolean / Array / Object
   ↓
OPERADORES
   ↓
fazem cálculos e comparações
   ↓
RESULTADOS
   ↓
true / false / números / textos etc.
   ↓
ESTRUTURAS DE DECISÃO
   ↓
if / else
```

Por exemplo:

```javascript
let idade = 20;

console.log(idade >= 18);
```

O que acontece?

### 1. Criamos a variável

```javascript
let idade = 20;
```

### 2. Fazemos uma comparação

```javascript
idade >= 18
```

### 3. O JavaScript calcula

```text
20 >= 18
```

### 4. O resultado é booleano

```text
true
```

### 5. O `console.log()` exibe o resultado

```text
true
```

Esse raciocínio será fundamental quando começarmos a estudar **condicionais**, porque programas frequentemente precisam tomar decisões com base em comparações.

---

# 34. Resumo dos principais conceitos

| Conceito                    | O que faz                                 |   |           |
| --------------------------- | ----------------------------------------- | - | --------- |
| JavaScript                  | Linguagem de programação                  |   |           |
| Sintaxe                     | Regras para escrever o código             |   |           |
| `//`                        | Comentário de uma linha                   |   |           |
| `/* */`                     | Comentário de várias linhas               |   |           |
| `console.log()`             | Exibe informações no console              |   |           |
| `document.write()`          | Escreve conteúdo no documento             |   |           |
| `document.getElementById()` | Localiza elemento HTML pelo `id`          |   |           |
| `var`                       | Declara variável                          |   |           |
| `let`                       | Declara variável que pode ser reatribuída |   |           |
| `const`                     | Declara variável que não será reatribuída |   |           |
| `String`                    | Texto                                     |   |           |
| `Number`                    | Números                                   |   |           |
| `Boolean`                   | `true` ou `false`                         |   |           |
| `Array`                     | Coleção/lista de valores                  |   |           |
| `Object`                    | Dados organizados em propriedades         |   |           |
| `++`                        | Incrementa 1                              |   |           |
| `--`                        | Decrementa 1                              |   |           |
| `==`                        | Igualdade com conversão de tipo           |   |           |
| `===`                       | Igualdade de valor e tipo                 |   |           |
| `!=`                        | Diferente                                 |   |           |
| `!==`                       | Diferente estrito                         |   |           |
| `>` / `<`                   | Maior / menor                             |   |           |
| `+`                         | Adição                                    |   |           |
| `-`                         | Subtração                                 |   |           |
| `*`                         | Multiplicação                             |   |           |
| `/`                         | Divisão                                   |   |           |
| `%`                         | Resto da divisão                          |   |           |
| `**`                        | Exponenciação                             |   |           |
| `&&`                        | E lógico                                  |   |           |
| `                           |                                           | ` | OU lógico |
| `!`                         | NÃO lógico                                |   |           |

---

**Resumo Relâmpago**

1. **JavaScript** é uma linguagem muito utilizada no desenvolvimento Web, tanto no Front-end quanto no Back-end.
2. A **sintaxe** define as regras para escrever o código corretamente, e JavaScript diferencia maiúsculas de minúsculas.
3. `//` cria comentários de uma linha e `/* ... */` cria comentários de várias linhas.
4. `console.log()` é utilizado para mostrar informações no console.
5. Variáveis podem ser declaradas com `var`, `let` ou `const`; em código moderno, `let` e `const` são normalmente preferidos.
6. Os principais tipos estudados são **String, Number, Boolean, Array e Object**.
7. `++` incrementa 1 e `--` decrementa 1; a posição do operador define se ele é pré ou pós-fixado.
8. `==` compara com conversão de tipo, enquanto `===` compara valor **e tipo**.
9. Os operadores aritméticos incluem `+`, `-`, `*`, `/`, `%` e `**`; `**` representa potência no JavaScript.
10. Os operadores lógicos são `&&` (**E**), `||` (**OU**) e `!` (**NÃO**) e serão fundamentais para construir condições e decisões.
