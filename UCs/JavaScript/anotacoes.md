# Operadores e Estruturas Condicionais

Nesta parte foram estudados os **operadores comparativos, aritméticos e lógicos**, além das principais **estruturas condicionais** do JavaScript.

Esses conceitos são fundamentais porque permitem que o programa:

* compare valores;
* faça cálculos;
* tome decisões;
* execute determinado código somente quando uma condição for verdadeira;
* escolha entre várias possibilidades.

---

## Operadores Comparativos

Os **operadores comparativos** servem para comparar dois valores.

O resultado de uma comparação é sempre um **Booleano**:

* `true` → verdadeiro;
* `false` → falso.

- **Por exemplo:**

```javascript
1 == 1
```

Resultado:

```
true
```

Já:

```javascript
1 == 2
```

Resultado:

```
false
```

---

**Criando o arquivo `comparativos.html`**

No VS Code, foi criado o arquivo:

```
comparativos.html
```

Estrutura inicial:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Operadores comparativos</title>
</head>
<body>

    <h1>Operadores comparativos</h1>

    <p id="teste1">O valor de a é: </p>
    <p id="teste2">O valor de a é: </p>
    <p id="teste3">O valor de a é: </p>
    <p id="teste4">O valor de a é: </p>
    <p id="teste5">O valor de a é: </p>
    <p id="teste6">O valor de a é: </p>

    <script>

    </script>

</body>
</html>
```

Os elementos `<p>` possuem IDs diferentes para que o JavaScript possa colocar cada resultado em um local específico da página.

---

# Código completo - Operadores Comparativos 

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Operadores comparativos</title>
</head>
<body>

    <h1>Operadores comparativos</h1>

    <p id="teste1">O valor de a é: </p>
    <p id="teste2">O valor de a é: </p>
    <p id="teste3">O valor de a é: </p>
    <p id="teste4">O valor de a é: </p>
    <p id="teste5">O valor de a é: </p>
    <p id="teste6">O valor de a é: </p>

    <script>
        // Criação de variáveis
        var a = 1;
        var b = 1;
        var c = '1';
        var d = 2;

        // Impressão dos resultados
        document.getElementById('teste1').innerHTML += a == b;
        document.getElementById('teste2').innerHTML += a === c;
        document.getElementById('teste3').innerHTML += a === b;
        document.getElementById('teste4').innerHTML += a >= b;
        document.getElementById('teste5').innerHTML += a >= d;
        document.getElementById('teste6').innerHTML += a <= c;
    </script>

</body>
</html>
```

**Variáveis**

```javascript
var a = 1;
var b = 1;
var c = '1';
var d = 2;
```

Temos:

| Variável | Valor | Tipo   |
| -------- | ----: | ------ |
| `a`      |   `1` | Number |
| `b`      |   `1` | Number |
| `c`      | `'1'` | String |
| `d`      |   `2` | Number |

Observe que:

```javascript
1
```

é um número, enquanto:

```javascript
'1'
```

é um texto.

Apesar de visualmente serem parecidos, são tipos diferentes.

---

## 1.3 Igualdade `==`

```javascript
a == b
```

O operador `==` compara os valores.

No exemplo:

```javascript
a = 1;
b = 1;
```

Então:

```javascript
1 == 1
```

Resultado:

```text
true
```

### `==` — igualdade simples

O operador `==` verifica se os valores são iguais, podendo realizar conversão de tipo.

Exemplo:

```javascript
1 == '1'
```

Resultado:

```text
true
```

Isso acontece porque o JavaScript pode converter os tipos durante essa comparação.

---

## 1.4 Igualdade estrita `===`

```javascript
a === c
```

Aqui:

```javascript
a = 1;
c = '1';
```

O valor é parecido, mas os tipos são diferentes:

```text
a → Number
c → String
```

Portanto:

```javascript
1 === '1'
```

Resultado:

```text
false
```

O operador `===` verifica:

1. se o valor é igual;
2. se o tipo é igual.

Por isso ele é chamado de **igualdade estrita**.

### Regra prática

```text
==   → compara valor
===  → compara valor + tipo
```

---

## 1.5 Maior ou igual `>=`

```javascript
a >= b
```

Significa:

> `a` é maior ou igual a `b`?

Como:

```text
a = 1
b = 1
```

Temos:

```text
1 >= 1
```

Resultado:

```text
true
```

---

## 1.6 Menor ou igual `<=`

```javascript
a <= c
```

Significa:

> `a` é menor ou igual a `c`?

Nesse caso:

```text
a = 1
c = '1'
```

Em uma comparação relacional, o JavaScript realiza a conversão necessária para comparar os valores.

Resultado:

```text
true
```

---

## 1.7 Principais operadores comparativos

| Operador | Significado                |
| -------- | -------------------------- |
| `==`     | igual em valor             |
| `===`    | igual em valor e tipo      |
| `!=`     | diferente em valor         |
| `!==`    | diferente em valor ou tipo |
| `>`      | maior que                  |
| `<`      | menor que                  |
| `>=`     | maior ou igual             |
| `<=`     | menor ou igual             |

---

# 2. Operadores Aritméticos

Os **operadores aritméticos** são utilizados para realizar cálculos.

Foi criado o arquivo:

```text
aritméticos.html
```

Estrutura inicial:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Operadores aritméticos</title>
</head>
<body>

    <h1>Operadores aritméticos</h1>

    <script>

    </script>

</body>
</html>
```

---

# 2.1 Número + número

```javascript
var resposta = 1 + 2;

document.write(resposta + '<br>');
```

Como os dois valores são números:

```text
1 + 2 = 3
```

Resultado:

```text
3
```

O:

```html
<br>
```

é uma quebra de linha no HTML.

---

# 2.2 Booleano + número

Em operações numéricas, o JavaScript pode converter valores Booleanos:

```text
true  → 1
false → 0
```

Por exemplo:

```javascript
resposta = true + 1;
```

O JavaScript interpreta:

```text
true → 1
```

Então:

```text
1 + 1 = 2
```

Resultado:

```text
2
```

---

# 2.3 Booleano + Booleano

### `false + false`

```javascript
var resposta1 = false + false;
```

Convertendo:

```text
0 + 0 = 0
```

Resultado:

```text
0
```

### `false + true`

```javascript
var resposta2 = false + true;
```

Convertendo:

```text
0 + 1 = 1
```

Resultado:

```text
1
```

### `true + true`

```javascript
var resposta3 = true + true;
```

Convertendo:

```text
1 + 1 = 2
```

Resultado:

```text
2
```

---

# 2.4 Número + String

Quando uma operação com `+` envolve uma **String**, o comportamento muda.

```javascript
resposta = 5 + 'Senac';
```

Nesse caso não ocorre uma soma numérica.

O JavaScript realiza uma **concatenação**:

```text
5 + 'Senac'
```

vira:

```text
'5Senac'
```

### Concatenação

**Concatenação** significa juntar valores.

Exemplo:

```javascript
'Olá ' + 'mundo'
```

Resultado:

```text
Olá mundo
```

---

# 2.5 String + String

```javascript
resposta = 'Senac' + 'JavaScript';
```

As duas partes são Strings, então são concatenadas:

```text
SenacJavaScript
```

Se houver um espaço:

```javascript
resposta = 'Senac ' + 'JavaScript';
```

Resultado:

```text
Senac JavaScript
```

---

# 2.6 String + Booleano

```javascript
resposta = 'Senac ' + false;
```

Como existe uma String na operação, o resultado é uma concatenação.

O Booleano:

```text
false
```

é convertido para sua representação textual.

Resultado:

```text
Senac false
```

---

## 2.7 Código completo dos operadores aritméticos

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Operadores aritméticos</title>
</head>
<body>

    <h1>Operadores aritméticos</h1>

    <script>
        // Número + número = adição
        var resposta = 1 + 2;
        document.write(resposta + '<br>');

        // Booleano + número = adição
        resposta = true + 1;
        document.write(resposta + '<br>');

        // Booleano + Booleano = adição
        var resposta1 = false + false;
        var resposta2 = false + true;
        var resposta3 = true + true;

        document.write(resposta1 + '<br>');
        document.write(resposta2 + '<br>');
        document.write(resposta3 + '<br>');

        // Número + String = concatenação
        resposta = 5 + 'Senac';
        document.write(resposta + '<br>');

        // String + String = concatenação
        resposta = 'Senac' + 'JavaScript';
        document.write(resposta + '<br>');

        // String + Booleano = concatenação
        resposta = 'Senac ' + false;
        document.write(resposta + '<br>');
    </script>

</body>
</html>
```

> **Observação:** `+` pode representar **adição** ou **concatenação**, dependendo dos tipos envolvidos.

---

# 3. Operadores Lógicos

Os operadores lógicos trabalham principalmente com valores Booleanos:

```text
true
false
```

Os três principais operadores estudados são:

| Operador | Nome | Significado |    |    |
| -------- | ---- | ----------- | -- | -- |
| `&&`     | AND  | E           |    |    |
| `        |      | `           | OR | OU |
| `!`      | NOT  | NÃO         |    |    |

---

# 3.1 Operador `&&` — E

O operador:

```javascript
&&
```

significa **E**.

A ideia é:

> Todas as condições precisam ser verdadeiras.

Exemplo:

```javascript
true && true
```

Resultado:

```text
true
```

Mas:

```javascript
false && true
```

Resultado:

```text
false
```

Uma única condição falsa já faz o resultado lógico ser falso.

### Tabela verdade do `&&`

| A       | B       | A && B  |
| ------- | ------- | ------- |
| `true`  | `true`  | `true`  |
| `true`  | `false` | `false` |
| `false` | `true`  | `false` |
| `false` | `false` | `false` |

---

## 3.2 Exemplos com `&&`

```javascript
var resposta = true && true;
```

Resultado:

```text
true
```

---

```javascript
resposta = false && false;
```

Resultado:

```text
false
```

---

```javascript
resposta = false && true;
```

Resultado:

```text
false
```

---

Também podemos colocar uma comparação:

```javascript
resposta = false && (3 == 4);
```

Primeiro:

```javascript
3 == 4
```

é:

```text
false
```

Então:

```text
false && false
```

Resultado:

```text
false
```

---

# 3.3 `&&` com Strings

O operador lógico `&&` também pode trabalhar com outros valores, não apenas `true` e `false`.

Por exemplo:

```javascript
resposta = 'Senac' && 'JavaScript';
```

Como os dois valores são considerados verdadeiros, o resultado da expressão é o último valor:

```text
JavaScript
```

Outro exemplo:

```javascript
resposta = false && 'Senac';
```

Como o primeiro valor já é falso:

```text
false
```

o resultado é:

```text
false
```

Isso acontece porque o `&&` procura um valor falso; se encontrar, ele pode parar ali.

---

## 3.4 String vazia

Uma String vazia:

```javascript
''
```

não possui conteúdo.

Ela é considerada um valor **falsy** em JavaScript.

Exemplo:

```javascript
resposta = '' && false;
```

Resultado:

```text
''
```

E:

```javascript
resposta = false && '';
```

Resultado:

```text
false
```

### Valores truthy e falsy

JavaScript possui valores que são tratados como verdadeiros ou falsos em contextos lógicos.

Exemplos:

```text
true       → truthy
'Senac'    → truthy
1          → truthy

false      → falsy
''         → falsy
0          → falsy
null       → falsy
undefined  → falsy
NaN        → falsy
```

---

# 4. Operador `||` — OU

O operador:

```javascript
||
```

significa **OU**.

A lógica é:

> Pelo menos uma das condições precisa ser verdadeira.

### Tabela verdade do `||`

| A       | B       | A || B  |
| ------- | ------- | ------- |
| `true`  | `true`  | `true`  |
| `true`  | `false` | `true`  |
| `false` | `true`  | `true`  |
| `false` | `false` | `false` |

Portanto, diferente do `&&`, basta uma condição verdadeira.

---

## 4.1 Exemplos

```javascript
var resposta = true || true;
```

Resultado:

```text
true
```

---

```javascript
resposta = false || true;
```

Resultado:

```text
true
```

---

```javascript
resposta = true || false;
```

Resultado:

```text
true
```

---

```javascript
resposta = false || (3 == 4);
```

A comparação:

```javascript
3 == 4
```

é falsa.

Então:

```text
false || false
```

Resultado:

```text
false
```

---

## 4.2 `||` com Strings

```javascript
resposta = 'Senac' || 'JavaScript';
```

Como `'Senac'` é um valor truthy, o operador `||` retorna esse primeiro valor:

```text
Senac
```

Uma forma simples de pensar:

```text
&& → procura um valor falso
|| → procura um valor verdadeiro
```

---

# 5. Operador `!` — NOT

O operador:

```javascript
!
```

significa **NÃO** ou **negação**.

Ele inverte o valor lógico.

```javascript
!true
```

vira:

```text
false
```

E:

```javascript
!false
```

vira:

```text
true
```

### Tabela verdade

| Valor   | `!valor` |
| ------- | -------- |
| `true`  | `false`  |
| `false` | `true`   |

---

## 5.1 Exemplos

```javascript
var resposta = !true;
```

Resultado:

```text
false
```

---

```javascript
resposta = !false;
```

Resultado:

```text
true
```

---

Com uma String:

```javascript
resposta = !'Senac';
```

Como `'Senac'` é truthy:

```text
!'Senac'
```

resulta em:

```text
false
```

---

# 6. Estruturas Condicionais

As estruturas condicionais permitem que o programa **tome decisões**.

A ideia básica é:

> Se uma condição for verdadeira, faça determinada coisa.

Por exemplo:

```text
Se a média for maior ou igual a 7:
    aluno aprovado
```

Isso é implementado com:

```javascript
if
```

---

# 7. Condicional Simples — `if`

Foi criado o arquivo:

```text
condicional-simples.html
```

Estrutura:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estrutura condicional simples</title>
</head>
<body>

    <h1>Estrutura condicional simples</h1>

    <p id="teste"></p>

    <script>

    </script>

</body>
</html>
```

---

## 7.1 Código completo

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estrutura condicional simples</title>
</head>
<body>

    <h1>Estrutura condicional simples</h1>

    <p id="teste"></p>

    <script>
        // Criando a variável
        var media = 7;

        // Criando a condicional simples
        if (media >= 7) {
            resposta = 'Aprovado(a)';
        }

        // Mostrar o resultado
        document.getElementById('teste').innerHTML = resposta;
    </script>

</body>
</html>
```

### Entendendo o `if`

```javascript
if (media >= 7) {
```

Pode ser lido como:

> **Se** a média for maior ou igual a 7...

Depois temos:

```javascript
{
    resposta = 'Aprovado(a)';
}
```

que significa:

> ...execute este bloco de código.

No exemplo:

```text
media = 7
```

A condição:

```javascript
media >= 7
```

é verdadeira.

Então:

```javascript
resposta = 'Aprovado(a)';
```

é executado.

---

## 7.2 Estrutura básica

```javascript
if (condição) {
    // código executado se a condição for verdadeira
}
```

O `if` significa **se**.

A condição precisa resultar em algo que possa ser avaliado como verdadeiro ou falso.

---

# 8. Condicional Composta — `if...else`

A condicional composta possui dois caminhos:

```text
SE for verdadeiro → faça uma coisa
SENÃO → faça outra
```

Foi criado o arquivo:

```text
condicional-composta.html
```

---

## 8.1 Aprovado ou reprovado

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estrutura condicional composta</title>
</head>
<body>

    <h1>Estrutura condicional composta</h1>

    <p id="teste"></p>

    <script>
        // Criando a variável
        var media = 6;

        // Criando a condicional composta
        if (media >= 7) {
            resposta = 'Aprovado(a)';
        } else {
            resposta = 'Reprovado(a)';
        }

        // Mostrar o resultado
        document.getElementById('teste').innerHTML = resposta;
    </script>

</body>
</html>
```

Como:

```text
media = 6
```

a condição:

```javascript
media >= 7
```

é falsa.

Portanto, o `else` é executado:

```javascript
resposta = 'Reprovado(a)';
```

Resultado:

```text
Reprovado(a)
```

---

# 9. `if...else if...else`

Podemos ter mais de duas possibilidades.

Exemplo:

```text
7 ou mais → Aprovado
6 até menos de 7 → Recuperação
menos de 6 → Reprovado
```

Para isso usamos:

```javascript
else if
```

---

## 9.1 Código

```html
<script>
    // Criando a variável
    var media = 6;

    // Criando a condicional composta
    if (media >= 7) {
        resposta = 'Aprovado(a)';
    } else if (media >= 6) {
        resposta = 'Recuperação';
    } else {
        resposta = 'Reprovado(a)';
    }

    // Mostrar o resultado
    document.getElementById('teste').innerHTML = resposta;
</script>
```

### Como o JavaScript verifica?

Ele testa as condições de cima para baixo.

Com:

```text
media = 6
```

Primeiro:

```javascript
media >= 7
```

Resultado:

```text
false
```

Então passa para:

```javascript
media >= 6
```

Resultado:

```text
true
```

Portanto:

```text
Recuperação
```

é atribuído à variável `resposta`.

---

# 10. Condicional Ternário

O **operador ternário** permite escrever uma condição simples de forma mais curta.

Foi criado o arquivo:

```text
condicional-ternario.html
```

A estrutura básica é:

```javascript
condição ? valorSeVerdadeiro : valorSeFalso;
```

Podemos interpretar como:

```text
Se condição for verdadeira → primeiro valor
Senão → segundo valor
```

---

## 10.1 Exemplo

```javascript
var media = 7;
var resultado = '';

resultado = (media >= 7) ? 'Aprovado(a)' : 'Reprovado(a)';
```

A condição é:

```javascript
media >= 7
```

Se for verdadeira:

```text
Aprovado(a)
```

Se for falsa:

```text
Reprovado(a)
```

---

## 10.2 Código completo

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estrutura condicional ternário</title>
</head>
<body>

    <h1>Estrutura condicional ternário</h1>

    <p id="teste"></p>

    <script>
        // Criando as variáveis
        var media = 7;
        var resultado = '';

        // Condicional ternário
        resultado = (media >= 7)
            ? 'Aprovado(a)'
            : 'Reprovado(a)';

        // Mostrar o resultado
        document.getElementById('teste').innerHTML = resultado;
    </script>

</body>
</html>
```

### Desmontando a expressão

```javascript
resultado = (media >= 7) ? 'Aprovado(a)' : 'Reprovado(a)';
```

Temos:

```text
(media >= 7)
```

→ condição

```text
?
```

→ separa a condição dos resultados

```text
'Aprovado(a)'
```

→ resultado se for verdadeiro

```text
:
```

→ separa verdadeiro e falso

```text
'Reprovado(a)'
```

→ resultado se for falso

---

# 11. Ternário com três possibilidades

Também é possível colocar outro ternário dentro do primeiro.

Exemplo:

```javascript
var media = 6;
var resultado = '';

resultado = (media >= 7)
    ? 'Aprovado(a)'
    : (media >= 6)
        ? 'Recuperação'
        : 'Reprovado(a)';
```

A lógica é:

```text
media >= 7?
    SIM → Aprovado(a)
    NÃO → media >= 6?
              SIM → Recuperação
              NÃO → Reprovado(a)
```

Com:

```text
media = 6
```

o resultado será:

```text
Recuperação
```

### Observação

O ternário aninhado funciona, mas quando existem muitas condições, o `if...else if...else` normalmente fica mais fácil de ler.

---

# 12. Condicional de Escolha — `switch`

Quando temos várias opções baseadas no valor de uma variável, podemos utilizar:

```javascript
switch
```

Ele funciona como uma estrutura de **escolha**.

Foi criado o arquivo:

```text
condicional-escolha.html
```

---

# 12.1 Exemplo com dias da semana

O programa solicita um número de `1` a `7` e transforma esse número no respectivo dia da semana.

```javascript
var dia = 0;
var resposta = '';

dia = parseInt(prompt('Digite um número entre 1 a 7', ''));
```

---

## 12.2 `prompt()`

```javascript
prompt('Digite um número entre 1 a 7', '');
```

Abre uma caixa de diálogo no navegador solicitando uma informação ao usuário.

Por padrão, o valor recebido pelo `prompt()` é uma **String**.

Por isso foi utilizado:

```javascript
parseInt()
```

para converter o valor recebido para um número inteiro.

Exemplo:

```javascript
parseInt('5')
```

resulta em:

```text
5
```

---

# 12.3 Estrutura `switch`

```javascript
switch (dia) {
    case 1:
        resposta = 'Domingo';
        break;

    case 2:
        resposta = 'Segunda-Feira';
        break;

    case 3:
        resposta = 'Terça-Feira';
        break;

    case 4:
        resposta = 'Quarta-Feira';
        break;

    case 5:
        resposta = 'Quinta-Feira';
        break;

    case 6:
        resposta = 'Sexta-Feira';
        break;

    case 7:
        resposta = 'Sábado';
        break;

    default:
        resposta = 'Dia da semana não existe.';
}
```

### Como funciona?

Se:

```text
dia = 1
```

o JavaScript procura:

```javascript
case 1:
```

e executa:

```javascript
resposta = 'Domingo';
```

Se:

```text
dia = 5
```

ele encontra:

```javascript
case 5:
```

e executa:

```javascript
resposta = 'Quinta-Feira';
```

---

# 12.4 O `break`

O:

```javascript
break;
```

serve para interromper o `switch` depois que o caso correspondente foi executado.

Sem o `break`, o JavaScript pode continuar executando os próximos `case`.

Portanto, normalmente usamos:

```javascript
case 1:
    resposta = 'Domingo';
    break;
```

---

# 12.5 O `default`

O:

```javascript
default:
```

é executado quando nenhum `case` corresponde ao valor informado.

Por exemplo, se o usuário digitar:

```text
8
```

não existe:

```javascript
case 8
```

Então o `default` será executado.

No exercício original havia uma mensagem com uma ofensa ao usuário. Para uma aplicação real, é melhor utilizar uma mensagem neutra:

```javascript
default:
    resposta = 'Dia da semana não existe.';
```

---

# 12.6 Código completo

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estrutura condicional escolha</title>
</head>
<body>

    <h1>Estrutura condicional escolha</h1>

    <p id="teste"></p>

    <script>
        // Criando as variáveis
        var dia = 0;
        var resposta = '';

        // Solicitando um número para o usuário
        dia = parseInt(prompt('Digite um número entre 1 a 7', ''));

        /*
            Vai abrir uma caixa de diálogo no navegador
            pedindo para o usuário digitar um número
            entre 1 e 7.
        */

        // Criando a condicional escolha
        switch (dia) {
            case 1:
                resposta = 'Domingo';
                break;

            case 2:
                resposta = 'Segunda-Feira';
                break;

            case 3:
                resposta = 'Terça-Feira';
                break;

            case 4:
                resposta = 'Quarta-Feira';
                break;

            case 5:
                resposta = 'Quinta-Feira';
                break;

            case 6:
                resposta = 'Sexta-Feira';
                break;

            case 7:
                resposta = 'Sábado';
                break;

            default:
                resposta = 'Dia da semana não existe.';
        }

        // Mostrar o resultado
        document.getElementById('teste').innerHTML = resposta;
    </script>

</body>
</html>
```

---

# 13. Comparando as estruturas condicionais

Cada estrutura possui uma finalidade mais adequada.

### `if`

Usado quando precisamos verificar uma condição.

```javascript
if (media >= 7) {
    resposta = 'Aprovado';
}
```

---

### `if...else`

Usado quando existem dois caminhos.

```javascript
if (media >= 7) {
    resposta = 'Aprovado';
} else {
    resposta = 'Reprovado';
}
```

---

### `if...else if...else`

Usado quando existem várias condições diferentes.

```javascript
if (media >= 7) {
    resposta = 'Aprovado';
} else if (media >= 6) {
    resposta = 'Recuperação';
} else {
    resposta = 'Reprovado';
}
```

---

### Ternário

Usado principalmente para uma decisão curta.

```javascript
resultado = media >= 7 ? 'Aprovado' : 'Reprovado';
```

---

### `switch`

Usado quando precisamos escolher entre vários valores específicos.

```javascript
switch (dia) {
    case 1:
        resposta = 'Domingo';
        break;

    case 2:
        resposta = 'Segunda-Feira';
        break;
}
```

---

# 14. Fluxo mental para resolver exercícios

Ao receber um problema de programação, posso pensar nesta sequência:

```text
1. Quais são os dados?
        ↓
2. Quais são os tipos desses dados?
        ↓
3. Preciso fazer algum cálculo?
        ↓
4. Preciso comparar valores?
        ↓
5. Preciso tomar uma decisão?
        ↓
6. Tenho duas possibilidades ou várias?
        ↓
7. Escolho a estrutura adequada:
   if / else / else if / ternário / switch
        ↓
8. Exibo o resultado
```

Isso ajuda a transformar um problema escrito em linguagem natural em código.

---

# 15. Conceitos importantes desta aula

## Comparação

Compara valores e retorna um resultado lógico:

```javascript
a >= b
```

Resultado:

```text
true
```

ou:

```text
false
```

---

## Adição

Quando temos números:

```javascript
1 + 2
```

temos uma soma.

---

## Concatenação

Quando o `+` envolve uma String:

```javascript
'Olá ' + 'mundo'
```

temos junção de textos.

---

## Lógica `&&`

Representa **E**:

```javascript
condicao1 && condicao2
```

Normalmente, ambas precisam ser verdadeiras.

---

## Lógica `||`

Representa **OU**:

```javascript
condicao1 || condicao2
```

Pelo menos uma precisa ser verdadeira.

---

## Negação `!`

Inverte o valor lógico:

```javascript
!true
```

resulta em:

```text
false
```

---

## Condicional

Permite ao programa tomar decisões:

```javascript
if (condicao) {
    // ação
}
```

---

# Resumo Relâmpago — 10 linhas

1. **Operadores comparativos** comparam valores e produzem `true` ou `false`.
2. `==` compara principalmente o valor, enquanto `===` compara **valor e tipo**.
3. `>`, `<`, `>=` e `<=` fazem comparações numéricas.
4. O `+` pode fazer **adição** ou **concatenação**, dependendo dos valores envolvidos.
5. Em operações numéricas, `true` pode representar `1` e `false` pode representar `0`.
6. `&&` significa **E** e exige que as condições sejam verdadeiras para o resultado lógico ser verdadeiro.
7. `||` significa **OU** e precisa de pelo menos uma condição verdadeira.
8. `!` significa **NÃO** e inverte um valor lógico.
9. `if`, `else if` e `else` permitem criar decisões; o ternário é uma forma curta para decisões simples.
10. `switch`, `case`, `break` e `default` permitem escolher uma ação com base em vários valores possíveis.

Esse trecho fecha uma etapa importante: agora você já tem a base para fazer o JavaScript **comparar, calcular e tomar decisões**. O próximo passo naturalmente será aplicar essas estruturas em exercícios mais próximos de problemas reais.
