# HTML e JavaScript 

Nesta parte, vou apenas **conhecer o HTML e entender como o JavaScript pode interagir com uma página**. O aprofundamento de HTML e CSS ficará para depois.

A ideia principal é começar a sair do JavaScript executado apenas no terminal e entender como ele funciona **dentro de uma página web**.

---

**Criando a pasta do projeto**

Primeiro, crio uma pasta chamada:

```
exemplohtml
```

Depois:

1. Abro o **Visual Studio Code**.
2. Vou em **File → Open Folder**.
3. Seleciono a pasta `exemplohtml`.
4. Dentro dela, crio os arquivos `.html`.

A estrutura ficará aproximadamente assim:

```
exemplohtml/
│
├── exemplo1.html
├── 01-primeira-pagina.html
├── tipodedados.html
├── objeto.html
└── operadoresincrementais.html
```

---

## Primeiro contato com HTML

Crio o arquivo:

```
exemplo1.html
```

E coloco:

```html
<html>
<head>
    <title>Turma TI 0425</title>
</head>

<body>
    HTML - CSS - JAVASCRIPT
</body>
</html>
```

**Entendendo a estrutura**

O HTML utiliza **tags** para estruturar o conteúdo de uma página.

**`<html>`**

```html
<html>
```

Indica o início do documento HTML.

O documento termina com:

```html
</html>
```

---

**`<head>`**

```html
<head>
```

Contém informações e configurações da página que não são, normalmente, o conteúdo principal exibido para o usuário.

---

**`<title>`**

```html
<title>Turma TI 0425</title>
```

Define o título da página, normalmente apresentado na aba do navegador.

---

**`<body>`**

```html
<body>
    HTML - CSS - JAVASCRIPT
</body>
```

O `<body>` contém o conteúdo que será apresentado na página.

Podemos pensar assim:

```
HTML
│
├── HEAD
│   └── Informações/configurações da página
│
└── BODY
    └── Conteúdo apresentado ao usuário
```

---

# Primeira página em JavaScript

Agora crio:

```
01-primeira-pagina.html
```

O HTML inicial será:

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Primeira página em JavaScript</title>
</head>

<body>
    <h1>Primeira página em JavaScript</h1>
    <p id="texto"></p>
</body>

</html>
```

---

# Algumas partes novas do HTML

**`<!DOCTYPE html>`**

```html
<!DOCTYPE html>
```

Informa ao navegador que o documento utiliza HTML5.

---

**`lang="pt-br"`**

```html
<html lang="pt-br">
```

Indica o idioma principal do documento.

Neste caso:

```
pt-br → português do Brasil
```

---

**`<meta charset="utf-8">`**

```html
<meta charset="utf-8">
```

Define a codificação dos caracteres.

O UTF-8 permite representar corretamente diversos caracteres, incluindo:

```
á
ã
ç
é
õ
```

Isso é especialmente importante quando estou escrevendo páginas em português.

---

**`<meta name="viewport"...>`**

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

É uma configuração importante para que a página se adapte melhor a diferentes tamanhos de tela, principalmente celulares.

Por enquanto, basta entender que ela ajuda no comportamento **responsivo** da página.

---

**`<h1>`**

```html
<h1>Primeira página em JavaScript</h1>
```

Representa um título de nível 1.

---

**`<p id="texto"></p>`**

```html
<p id="texto"></p>
```

Cria um parágrafo.

O atributo:

```html
id="texto"
```

dá a esse elemento um identificador único chamado `texto`.

Esse `id` será utilizado posteriormente pelo JavaScript para localizar esse elemento.

---

# Colocando JavaScript dentro do HTML

Agora adiciono:

```html
<script>
    // Código JavaScript
</script>
```

- **Por exemplo:**

```html
<body>

    <h1>Primeira página em JavaScript</h1>
    <p id="texto"></p>

    <script>
        // Código JavaScript
    </script>

</body>
```

A tag:

```html
<script>
```

indica ao navegador que o conteúdo a seguir contém código JavaScript.

---

**Comentários em JavaScript**

Dentro do `<script>` posso utilizar comentários.

**Comentário de uma linha**

```javascript
// Comentário na linha
```

Tudo depois de `//`, naquela linha, será ignorado pelo interpretador.

**Comentário de várias linhas**

```javascript
/*
    Isto é um comentário
    que contém várias linhas
    de informações
*/
```

É útil quando quero documentar uma explicação maior.

---

# `document.write()`

Posso escrever diretamente na página utilizando:

```javascript
document.write('Meu primeiro texto em JavaScript');
```

O método `document.write()` escreve conteúdo no documento HTML.

Então:

```javascript
document.write('Meu primeiro texto em JavaScript');
```

faz o texto aparecer na página.

**Entendendo**

```
document
   ↓
representa o documento/página
   ↓
.write()
   ↓
escreve conteúdo
```

> `document.write()` é útil para entender a interação básica entre JavaScript e HTML, embora não seja a abordagem mais utilizada para atualizar o conteúdo de páginas modernas.

---

# `document.getElementById()`

Agora aparece um dos conceitos mais importantes:

```javascript
document.getElementById('texto')
```

Esse método procura no HTML um elemento que tenha:

```html
id="texto"
```

- **Por exemplo:**

```html
<p id="texto"></p>
```

O JavaScript consegue localizar esse elemento através de:

```javascript
document.getElementById('texto')
```

Podemos imaginar:

```
HTML
│
└── <p id="texto"></p>
            ↑
            │
JavaScript procura pelo ID
            │
            ↓
document.getElementById('texto')
```

---

# Alterando o conteúdo com `innerHTML`

Depois de encontrar o elemento, posso modificar seu conteúdo:

```javascript
document.getElementById('texto').innerHTML =
    'Segundo texto em JavaScript';
```

Aqui acontecem duas coisas:

**1. Localizo o elemento**

```javascript
document.getElementById('texto')
```

**2. Altero seu conteúdo**

```javascript
.innerHTML = 'Segundo texto em JavaScript';
```

Então:

```html
<p id="texto"></p>
```

passa a ser equivalente a:

```html
<p id="texto">Segundo texto em JavaScript</p>
```

---

**Código completo**

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Primeira página em JavaScript</title>
</head>

<body>

    <h1>Primeira página em JavaScript</h1>
    <p id="texto"></p>

    <script>

        // Comentário de uma linha

        /*
            Isto é um comentário
            que contém várias linhas
            de informações
        */

        document.write('Meu primeiro texto em JavaScript');

        // Localiza o elemento que possui id="texto"
        // e altera seu conteúdo.
        document.getElementById('texto').innerHTML =
            'Segundo texto em JavaScript';

    </script>

</body>

</html>
```

---

# 11. HTML + JavaScript

Aqui aparece uma ideia fundamental para o desenvolvimento web:

```text
HTML
 ↓
estrutura da página

CSS
 ↓
aparência/estilo

JavaScript
 ↓
comportamento/interação
```

Por enquanto, estou começando a entender a relação:

```text
HTML
  ↓
cria <p id="texto">
  ↓
JavaScript
  ↓
encontra id="texto"
  ↓
altera o conteúdo
```

Esse conceito será muito importante quando eu começar a trabalhar com **DOM (Document Object Model)**.

---

# 12. Tipos de dados no HTML + JavaScript

Agora crio outro arquivo HTML para visualizar diferentes tipos de dados.

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tipo de dados</title>
</head>

<body>

    <h1>Tipo de dados</h1>

    <p id="teste1">O valor de a é: </p>
    <p id="teste2">O valor de b é: </p>
    <p id="teste3">O valor de c é: </p>
    <p id="teste4">O valor de d é: </p>
    <p id="teste5">O valor de e é: </p>
    <p id="teste6">O valor de f é: </p>
    <p id="teste7">O valor de g é: </p>

    <script>

    </script>

</body>

</html>
```

Aqui tenho sete elementos diferentes:

```text
teste1
teste2
teste3
teste4
teste5
teste6
teste7
```

Cada um possui um `id` diferente para que o JavaScript possa encontrá-lo individualmente.

---

# 13. Declarando diferentes tipos de dados

Dentro do `<script>`:

```javascript
// Definindo as variáveis

var a;
var b = 1;
var c = [1, 2, 3, 4, 5];
var d = ['Verde', 'Amarelo', 'Azul', 'Branco'];
var e = 'JavaScript';
var f = false;
var g = null;
```

Agora vou destrinchar cada uma.

---

## `a` — variável sem valor atribuído

```javascript
var a;
```

A variável foi declarada, mas nenhum valor foi atribuído.

Nesse caso, seu valor é:

```javascript
undefined
```

Portanto, é importante diferenciar:

```text
undefined → não foi atribuído um valor
null      → representa intencionalmente ausência de valor
```

---

## `b` — número

```javascript
var b = 1;
```

O valor `1` é um número.

No JavaScript, o tipo `Number` é utilizado para números inteiros e decimais.

Exemplos:

```javascript
10
3.14
-5
0
```

---

## `c` — array

```javascript
var c = [1, 2, 3, 4, 5];
```

Um **array** permite armazenar vários valores em uma única variável.

Posso imaginar como uma sequência de posições:

```text
Índice:   0   1   2   3   4
          ↓   ↓   ↓   ↓   ↓
Valor:   [1,  2,  3,  4,  5]
```

⚠️ A contagem começa em **0**, não em 1.

Portanto:

```javascript
c[0] → 1
c[1] → 2
c[2] → 3
c[3] → 4
c[4] → 5
```

---

# 14. `c[2]`

No código:

```javascript
document.getElementById("teste3").innerHTML += c[2];
```

Estou acessando:

```javascript
c[2]
```

Como os índices começam em zero:

```text
c[0] = 1
c[1] = 2
c[2] = 3
```

Portanto:

```javascript
c[2]
```

retorna:

```text
3
```

---

# 15. `d` — array de strings

```javascript
var d = ['Verde', 'Amarelo', 'Azul', 'Branco'];
```

Também é um array, mas agora seus elementos são strings.

```text
Índice:    0         1          2        3
           ↓         ↓          ↓        ↓
         Verde    Amarelo      Azul    Branco
```

Por exemplo:

```javascript
d[0]
```

retorna:

```text
Verde
```

---

# 16. `e` — String

```javascript
var e = 'JavaScript';
```

É uma **String**, ou seja, uma sequência de caracteres usada para representar texto.

Também poderia ser:

```javascript
var e = "JavaScript";
```

---

# 17. `f` — Boolean

```javascript
var f = false;
```

É um valor booleano.

Os valores booleanos são:

```javascript
true
false
```

Eles são muito utilizados em decisões e condições.

Por exemplo:

```javascript
var maiorDeIdade = true;
```

---

# 18. `g` — `null`

```javascript
var g = null;
```

`null` representa uma ausência intencional de valor.

É diferente de:

```javascript
var a;
```

que resulta em `undefined`.

Uma forma simples de lembrar:

```text
undefined → ainda não existe um valor atribuído
null      → eu defini que não há valor
```

---

# 19. Exibindo as variáveis no HTML

Agora utilizo:

```javascript
document.getElementById("teste1").innerHTML += a;
```

O operador:

```javascript
+=
```

significa:

> "Pegue o conteúdo atual e acrescente o novo valor."

Por exemplo:

```html
<p id="teste1">O valor de a é: </p>
```

e:

```javascript
document.getElementById("teste1").innerHTML += a;
```

mantém:

```text
O valor de a é:
```

e acrescenta o valor de `a`.

---

## Código completo

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tipo de dados</title>
</head>

<body>

    <h1>Tipo de dados</h1>

    <p id="teste1">O valor de a é: </p>
    <p id="teste2">O valor de b é: </p>
    <p id="teste3">O valor de c é: </p>
    <p id="teste4">O valor de d é: </p>
    <p id="teste5">O valor de e é: </p>
    <p id="teste6">O valor de f é: </p>
    <p id="teste7">O valor de g é: </p>

    <script>

        // Definindo as variáveis
        var a;
        var b = 1;
        var c = [1, 2, 3, 4, 5];
        var d = ['Verde', 'Amarelo', 'Azul', 'Branco'];
        var e = 'JavaScript';
        var f = false;
        var g = null;

        // Exibindo o conteúdo de cada variável
        document.getElementById("teste1").innerHTML += a;
        document.getElementById("teste2").innerHTML += b;
        document.getElementById("teste3").innerHTML += c[2];
        document.getElementById("teste4").innerHTML += d;
        document.getElementById("teste5").innerHTML += e;
        document.getElementById("teste6").innerHTML += f;
        document.getElementById("teste7").innerHTML += g;

    </script>

</body>

</html>
```

---

# 20. Variável do tipo objeto

Agora crio:

```text
objeto.html
```

HTML inicial:

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Variável do tipo objeto</title>
</head>

<body>

    <h1>Variável do tipo objeto</h1>
    <p id="dados">Dados do carro: </p>

    <script>

    </script>

</body>

</html>
```

---

# 21. O que é um objeto?

Um objeto permite agrupar informações relacionadas.

Por exemplo, posso representar um carro:

```text
Carro
├── fábrica → Volkswagen
├── modelo  → Jetta
├── cor     → Azul
└── ano     → 2026
```

Cada informação é uma **propriedade** do objeto.

É parecido com uma ficha:

```text
┌──────────────────────┐
│ CARRO                │
├──────────────────────┤
│ Fábrica: Volkswagen │
│ Modelo: Jetta        │
│ Cor: Azul            │
│ Ano: 2026            │
└──────────────────────┘
```

---

# 22. Criando o objeto

O código apresentado utiliza:

```javascript
var meuCarro = new Object();
```

Isso cria um novo objeto vazio.

Depois adiciono propriedades:

```javascript
meuCarro.fabrica = 'Volkswagen';
meuCarro.modelo = 'Jetta';
meuCarro.cor = 'Azul';
meuCarro.ano = 2026;
```

Agora o objeto possui:

```text
meuCarro
├── fabrica
├── modelo
├── cor
└── ano
```

---

# 23. Acessando propriedades

Posso acessar uma propriedade utilizando:

```javascript
meuCarro.modelo
```

Isso significa:

> "Pegue a propriedade `modelo` do objeto `meuCarro`."

Então:

```javascript
meuCarro.modelo
```

retorna:

```text
Jetta
```

Da mesma maneira:

```javascript
meuCarro.cor
```

retorna:

```text
Azul
```

---

# 24. Exibindo o objeto na página

```javascript
document.getElementById('dados').innerHTML +=
    meuCarro.fabrica + '-' +
    meuCarro.modelo + '-' +
    meuCarro.cor + '-' +
    meuCarro.ano;
```

Estou:

1. encontrando o elemento `dados`;
2. pegando a propriedade `fabrica`;
3. pegando `modelo`;
4. pegando `cor`;
5. pegando `ano`;
6. juntando os valores;
7. colocando o resultado no HTML.

Resultado aproximado:

```text
Dados do carro: Volkswagen-Jetta-Azul-2026
```

> O nome correto da fabricante é **Volkswagen**.

---

# 25. Operadores incrementais

Agora crio outro arquivo para testar:

```text
operadoresincrementais.html
```

Estrutura:

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Operadores incrementais</title>
</head>

<body>

    <h1>Operadores incrementais</h1>

    <p id="teste1">O valor de a é: </p>
    <p id="teste2">O valor de b é: </p>
    <p id="teste3">O valor de c é: </p>
    <p id="teste4">O valor de d é: </p>

    <script>

    </script>

</body>

</html>
```

---

# 26. `++` e `--`

Os operadores incrementais são:

```javascript
++
--
```

### Incremento

```javascript
++
```

adiciona `1`.

Exemplo:

```javascript
var a = 5;
a++;
```

Agora:

```text
a = 6
```

### Decremento

```javascript
--
```

subtrai `1`.

Exemplo:

```javascript
var a = 5;
a--;
```

Agora:

```text
a = 4
```

---

# 27. Pré-fixado e pós-fixado

Existe uma diferença importante entre:

```javascript
++a
```

e:

```javascript
a++
```

### Pré-incremento

```javascript
++a
```

Primeiro incrementa e depois utiliza o valor.

### Pós-incremento

```javascript
a++
```

Primeiro utiliza o valor atual e depois incrementa.

Exemplo:

```javascript
var a = 5;

console.log(++a);
```

Resultado:

```text
6
```

Porque primeiro aumentou:

```text
5 → 6
```

Agora:

```javascript
var a = 5;

console.log(a++);
```

O valor utilizado na expressão é:

```text
5
```

e depois `a` passa a valer:

```text
6
```

---

# 28. Analisando o exercício dos incrementos

Código:

```javascript
var a = 1;
var b = 1;
var c = 1;
var d = 5;

a = ++a;
b = b++;
d = --d;

for (var cont = 1; cont <= 3; cont++) {
    c = c + cont;
}
```

Vamos separar.

---

## `a = ++a`

Inicialmente:

```text
a = 1
```

O `++a` incrementa primeiro:

```text
1 → 2
```

Então:

```text
a = 2
```

---

## `b = b++`

Aqui existe uma pegadinha importante.

Inicialmente:

```text
b = 1
```

O `b++` é pós-incremento.

Na atribuição:

```javascript
b = b++;
```

o valor antigo é utilizado na atribuição e, apesar do incremento ocorrer durante a expressão, a atribuição acaba sobrescrevendo o resultado.

Nesse caso, `b` permanece:

```text
b = 1
```

Portanto, essa linha **não é uma forma útil de incrementar uma variável**.

O correto para simplesmente incrementar seria:

```javascript
b++;
```

---

# 29. `d = --d`

Inicialmente:

```text
d = 5
```

O `--d` decrementa primeiro:

```text
5 → 4
```

Então:

```text
d = 4
```

---

# 30. O `for`

Agora temos:

```javascript
for (var cont = 1; cont <= 3; cont++) {
    c = c + cont;
}
```

O `for` cria uma repetição.

Ele possui três partes:

```javascript
for (
    var cont = 1;
    cont <= 3;
    cont++
)
```

### 1. Inicialização

```javascript
var cont = 1
```

Começo o contador em `1`.

### 2. Condição

```javascript
cont <= 3
```

Enquanto essa condição for verdadeira, o bloco será executado.

### 3. Incremento

```javascript
cont++
```

Depois de cada repetição, aumento `cont` em `1`.

---

# 31. Calculando `c`

Inicialmente:

```text
c = 1
```

### Primeira repetição

```text
cont = 1
```

Então:

```text
c = c + cont
c = 1 + 1
c = 2
```

### Segunda repetição

```text
cont = 2
```

Então:

```text
c = 2 + 2
c = 4
```

### Terceira repetição

```text
cont = 3
```

Então:

```text
c = 4 + 3
c = 7
```

Depois:

```text
cont = 4
```

A condição:

```text
4 <= 3
```

é falsa.

O `for` termina.

Portanto:

```text
c = 7
```

---

# 32. Exibindo os resultados

Finalmente:

```javascript
document.getElementById('teste1').innerHTML += a;
document.getElementById('teste2').innerHTML += b;
document.getElementById('teste3').innerHTML += c;
document.getElementById('teste4').innerHTML += d;
```

Cada linha encontra um `<p>` pelo `id` e acrescenta o valor correspondente.

Os valores finais são:

```text
a = 2
b = 1
c = 7
d = 4
```

---

# 33. Código completo do exercício

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Operadores incrementais</title>
</head>

<body>

    <h1>Operadores incrementais</h1>

    <p id="teste1">O valor de a é: </p>
    <p id="teste2">O valor de b é: </p>
    <p id="teste3">O valor de c é: </p>
    <p id="teste4">O valor de d é: </p>

    <script>

        // Criação das variáveis
        var a = 1;
        var b = 1;
        var c = 1;
        var d = 5;

        // O pré-incremento aumenta o valor antes de utilizá-lo.
        // O pós-incremento aumenta o valor depois de utilizá-lo.

        a = ++a;
        b = b++;
        d = --d;

        for (var cont = 1; cont <= 3; cont++) {
            c = c + cont;
        }

        document.getElementById('teste1').innerHTML += a;
        document.getElementById('teste2').innerHTML += b;
        document.getElementById('teste3').innerHTML += c;
        document.getElementById('teste4').innerHTML += d;

    </script>

</body>

</html>
```

---

# 🧠 O que eu aprendi nesta parte

A parte mais importante desta aula não é decorar todas as tags HTML. É começar a entender **como JavaScript conversa com uma página HTML**.

O fluxo básico é:

```text
              HTML
               │
               ↓
        Cria elementos
               │
               ↓
       <p id="texto">
               │
               ↓
          JavaScript
               │
               ↓
document.getElementById("texto")
               │
               ↓
          innerHTML
               │
               ↓
     Modifica a página
```

E também comecei a trabalhar com:

* `document.write()`;
* `document.getElementById()`;
* `innerHTML`;
* `id`;
* `<script>`;
* arrays;
* índices de arrays;
* objetos e propriedades;
* `null`;
* `undefined`;
* `true` e `false`;
* `++` e `--`;
* pré e pós-incremento;
* `for`;
* integração entre JavaScript e HTML.

---

# ⚡ Resumo Relâmpago — 10 linhas

1. **HTML** é utilizado para estruturar o conteúdo da página.
2. `<head>` contém informações/configurações e `<body>` contém o conteúdo da página.
3. `<script>` permite colocar JavaScript dentro do HTML.
4. `document.write()` escreve conteúdo diretamente no documento.
5. `document.getElementById()` localiza um elemento HTML pelo seu `id`.
6. `innerHTML` permite alterar o conteúdo interno de um elemento.
7. Arrays armazenam vários valores e seus índices começam em **0**.
8. Objetos agrupam informações através de **propriedades**, como `meuCarro.modelo`.
9. `++` incrementa e `--` decrementa; a posição do operador determina se o valor é alterado antes ou depois da expressão.
10. O `for` permite repetir um bloco de código enquanto uma condição for verdadeira.
