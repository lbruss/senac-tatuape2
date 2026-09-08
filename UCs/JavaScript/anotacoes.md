# Laços de Repetição e Variáveis Acumuladoras

Nesta parte da aula foram estudados os **laços de repetição** e as **variáveis acumuladoras**.

Os principais laços estudados foram:

* `for`
* `while`
* `do...while`

Também foi praticado o uso de:

* contador;
* acumulador;
* `prompt()`;
* `parseInt()`;
* `parseFloat()`;
* `alert()`;
* `innerHTML`;
* repetição para gerar tabuadas;
* repetição para somar valores digitados pelo usuário.

---

## Laços de repetição

Um **laço de repetição** permite executar o mesmo bloco de código várias vezes sem precisar escrever o código repetidamente.

Imagine que precisamos mostrar os números de `1` até `50`.

Sem um laço, seria necessário escrever:

```javascript
document.write(1);
document.write(2);
document.write(3);
// ...
document.write(50);
```

Isso seria trabalhoso e pouco eficiente.

Com um laço, podemos dizer:

> "Comece no 1 e continue enquanto não chegar ao 50."

O JavaScript fará as repetições automaticamente.

Os três principais laços estudados possuem a mesma finalidade geral, mas funcionam de maneiras diferentes.

---

## Laço `for`

O `for` é utilizado quando normalmente sabemos ou conseguimos definir claramente:

* onde a repetição começa;
* qual é a condição para continuar;
* como o contador será alterado.

A estrutura básica é:

```javascript
for (início; condição; incremento) {
    // código que será repetido
}
```

Podemos imaginar:

```
INÍCIO
   ↓
VERIFICA CONDIÇÃO
   ↓
Executa o código
   ↓
Incrementa
   ↓
Volta para a condição
```

---

## Exemplo: tabuada utilizando `for`

Foi criado o arquivo:

```
laco-for.html
```

Estrutura inicial:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laço de repetição FOR</title>
</head>
<body>

    <h1>Laço de repetição FOR</h1>

    <p id="tabuada"></p>

    <script>
    </script>

</body>
</html>
```

---

### Código completo

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laço de repetição FOR</title>
</head>
<body>

    <h1>Laço de repetição FOR</h1>

    <p id="tabuada"></p>

    <script>
        // Criando as variáveis
        var num = 5;       // Número da tabuada
        var cont = 1;      // Contador do loop
        var resposta = ''; // String que vai armazenar o resultado

        // Criando a tabuada
        for (cont = 1; cont <= 10; cont++) {

            // Esse laço repete de 1 até 10
            resposta += num + ' x ' + cont + ' = ' + (num * cont) + '<br>';
        }

        // Mostrar o resultado da tabuada
        document.getElementById('tabuada').innerHTML = resposta;
    </script>

</body>
</html>
```

---

**Entendendo o `for`**

A parte mais importante é:

```javascript
for (cont = 1; cont <= 10; cont++) {
```

Essa única linha possui três partes.

## 4.1 Primeira parte — início

```javascript
cont = 1
```

O contador começa com `1`.

---

**Segunda parte — condição**

```javascript
cont <= 10
```

Enquanto essa condição for verdadeira, o código será executado.

Ou seja:

```
cont = 1 → executa
cont = 2 → executa
cont = 3 → executa
...
cont = 10 → executa
cont = 11 → para
```

---

**Terceira parte — incremento**

```javascript
cont++
```

Depois de cada repetição, o contador aumenta em 1.

É equivalente a:

```javascript
cont = cont + 1;
```

---

**Gerando a tabuada**

Dentro do `for` temos:

```javascript
resposta += num + ' x ' + cont + ' = ' + (num * cont) + '<br>';
```

A variável:

```javascript
num
```

vale:

```
5
```

Enquanto:

```javascript
cont
```

vai de `1` até `10`.

Na primeira repetição:

```
5 x 1 = 5
```

Na segunda:

```
5 x 2 = 10
```

E assim por diante.

No final:

```
5 x 10 = 50
```

A variável `resposta` vai acumulando todas essas linhas.

---

**O operador `+=`**

Aqui:

```javascript
resposta += ...
```

estamos adicionando um novo conteúdo ao que já existe na variável.

É equivalente a:

```javascript
resposta = resposta + ...
```

- **Por exemplo:**

```javascript
var texto = '';

texto += 'Olá';
texto += ' mundo';
```

Resultado:

```
Olá mundo
```

Portanto, `+=` é muito útil quando precisamos **acumular informações** durante um laço.

---

**Exibindo o resultado**

Depois que o laço termina:

```javascript
document.getElementById('tabuada').innerHTML = resposta;
```

O JavaScript:

1. procura o elemento que possui `id="tabuada"`;
2. acessa seu `innerHTML`;
3. coloca dentro dele todo o conteúdo armazenado em `resposta`.

Como `resposta` contém várias linhas com `<br>`, a tabuada aparece organizada na página.

---

## Laço `do...while`

Foi criado o arquivo:

```
laco-do.html
```

O `do...while` possui uma característica muito importante:

> **O código dentro do `do` é executado pelo menos uma vez.**

Sua estrutura é:

```javascript
do {
    // código
} while (condição);
```

A ordem é:

```
Executa o código
       ↓
Verifica a condição
       ↓
Verdadeira? → repete
       ↓
Falsa? → encerra
```

---

### Tabuada utilizando `do...while`

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laço de repetição DO</title>
</head>
<body>

    <h1>Laço de repetição DO</h1>

    <p id="tabuada"></p>

    <script>
        // Criando as variáveis
        var num = 5;       // Número da tabuada
        var cont = 1;      // Contador do loop
        var resposta = ''; // String que vai armazenar o resultado

        // Criando a tabuada
        do {
            resposta += num + ' x ' + cont + ' = ' + (num * cont) + '<br>';

            cont++;
        } while (cont <= 10);

        // Exibir a tabuada
        document.getElementById('tabuada').innerHTML = resposta;
    </script>

</body>
</html>
```

---

**Diferença entre `for` e `do...while`**

No `for`, normalmente colocamos início, condição e incremento na mesma linha:

```javascript
for (cont = 1; cont <= 10; cont++) {
    // código
}
```

No `do...while`, essas partes ficam separadas:

```javascript
do {
    // código
    cont++;
} while (cont <= 10);
```

A principal diferença é **quando a condição é verificada**.

**`for`**

Primeiro verifica a condição:

```text
Verifica → executa → incrementa
```

**`do...while`**

Primeiro executa:

```
Executa → incrementa → verifica
```

---

**Uma diferença muito importante**

Considere:

```javascript
var cont = 11;

for (cont; cont <= 10; cont++) {
    console.log('Executando: ' + cont);
}
```

A condição:

```javascript
cont <= 10
```

é:

```
11 <= 10
```

Resultado:

```
false
```

Então o `for` não executa nenhuma vez.

Agora:

```javascript
var cont = 11;

do {
    console.log('Executando: ' + cont);

    cont++;
} while (cont <= 10);
```

O `do` executa primeiro:

```
Executando: 11
```

Somente depois o JavaScript verifica:

```
12 <= 10
```

Como é falso, o laço termina.

**Regra para memorizar**

```
FOR
→ verifica antes de executar.

WHILE
→ verifica antes de executar.

DO...WHILE
→ executa antes de verificar.
```

---

#**Quando utilizar `do...while`?**

O `do...while` é especialmente útil quando precisamos que uma ação aconteça **pelo menos uma vez**.

Um exemplo clássico é solicitar uma informação ao usuário.

```javascript
do {
    // pede uma informação
} while (informação inválida);
```

Nesse caso, o usuário precisa receber a primeira solicitação antes que o programa possa verificar se a informação está correta.

---

## Laço `while`

Foi criado o arquivo:

```
laco-while.html
```

O `while` significa:

> **enquanto**

Sua estrutura é:

```javascript
while (condição) {
    // código repetido
}
```

A condição é verificada **antes** da execução.

---

### Tabuada utilizando `while`

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laço de repetição WHILE</title>
</head>
<body>

    <h1>Laço de repetição WHILE</h1>

    <p id="tabuada"></p>

    <script>
        // Criando as variáveis
        var num = 5;       // Número da tabuada
        var cont = 1;      // Contador do loop
        var resposta = ''; // String que vai armazenar o resultado

        while (cont <= 10) {

            resposta += num + ' x ' + cont + ' = ' + (num * cont) + '<br>';

            cont++;
        }

        // Mostrar o resultado
        document.getElementById('tabuada').innerHTML = resposta;
    </script>

</body>
</html>
```

---

**Entendendo o `while`**

A linha:

```javascript
while (cont <= 10) {
```

significa:

> Enquanto `cont` for menor ou igual a `10`, execute o código.

Dentro do bloco:

```javascript
cont++;
```

é fundamental.

Isso faz o contador aumentar:

```
1 → 2 → 3 → 4 → ... → 10 → 11
```

Quando chegar em `11`:

```javascript
11 <= 10
```

será:

```
false
```

e o laço terminará.

---

**Cuidado com o loop infinito**

É muito importante alterar a variável utilizada na condição.

- **Por exemplo:**

```javascript
var cont = 1;

while (cont <= 10) {
    console.log(cont);
}
```

Esse código possui um problema.

`cont` nunca muda.

Ela continua sendo:

```
1
```

Então:

```
1 <= 10
```

continua sendo verdadeiro para sempre.

Resultado: **loop infinito**.

O correto seria:

```javascript
var cont = 1;

while (cont <= 10) {
    console.log(cont);
    cont++;
}
```

Agora o contador avança até a condição ficar falsa.

---

# Comparação dos três laços

| Laço         | Verifica condição | Estrutura                      | Executa pelo menos uma vez? |
| ------------ | ----------------- | ------------------------------ | --------------------------- |
| `for`        | antes             | início + condição + incremento | ❌ Não                       |
| `while`      | antes             | condição separada              | ❌ Não                       |
| `do...while` | depois            | código + condição              | ✅ Sim                       |

Uma forma simples de lembrar:

```
FOR
"Sei a estrutura da repetição."

WHILE
"Enquanto isso for verdadeiro, continue."

DO...WHILE
"Faça primeiro; depois veja se continua."
```

---

### Atividade 1 — Mostrar números de 1 até 50 com `for`

A proposta foi:

> Fazer um algoritmo em JavaScript para exibir os números de 1 até 50 utilizando `for`.

Código corrigido:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Atividade 1 - For</title>
</head>
<body>

    <h1>Atividade 1 - For</h1>

    <p id="repetir"></p>

    <script>
        /*
            Faça um algoritmo em JavaScript para exibir
            os números de 1 até 50 usando for.
        */

        var cont = 1;
        var num = '';

        for (cont = 1; cont <= 50; cont++) {
            num += cont + '<br>';
        }

        document.getElementById('repetir').innerHTML = num;
    </script>

</body>
</html>
```

---

**Como funciona**

O `for` começa:

```javascript
cont = 1
```

Depois verifica:

```javascript
cont <= 50
```

Enquanto for verdadeiro:

```javascript
num += cont + '<br>';
```

adiciona o número à String.

Depois:

```javascript
cont++;
```

aumenta o contador.

O resultado será:

```
1
2
3
4
5
...
50
```

---

### Atividade 2 — Mostrar números de 1 até 50 com `do...while`

Código:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Atividade 2 - Do...while</title>
</head>
<body>

    <h1>Atividade 2 - Do...while</h1>

    <p id="repetir"></p>

    <script>
        /*
            Faça um algoritmo em JavaScript para exibir
            os números de 1 até 50 usando do...while.
        */

        var cont = 1;
        var num = '';

        do {
            num += cont + '<br>';
            cont++;
        } while (cont <= 50);

        document.getElementById('repetir').innerHTML = num;
    </script>

</body>
</html>
```

A diferença está na estrutura:

```javascript
do {
    // executa primeiro
} while (condição);
```

---

### Atividade 3 — Mostrar números de 1 até 50 com `while`

Código:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Atividade 3 - While</title>
</head>
<body>

    <h1>Atividade 3 - While</h1>

    <p id="repetir"></p>

    <script>
        /*
            Faça um algoritmo em JavaScript para exibir
            os números de 1 até 50 usando while.
        */

        var cont = 1;
        var num = '';

        while (cont <= 50) {
            num += cont + '<br>';
            cont++;
        }

        document.getElementById('repetir').innerHTML = num;
    </script>

</body>
</html>
```

---

# Variável acumuladora

Agora foi introduzido um conceito muito importante:

> **Variável acumuladora.**

Uma variável acumuladora é utilizada para guardar e atualizar um resultado durante várias repetições.

- **Por exemplo, queremos somar:**

```
1 + 2 + 3 + 4 + 5
```

Podemos começar com:

```javascript
var total = 0;
```

Depois:

```javascript
total = total + 1;
```

Agora:

```
total = 1
```

Depois:

```javascript
total = total + 2;
```

Agora:

```
total = 3
```

Depois:

```
3 + 3 = 6
```

E assim por diante.

É como uma **caixa** onde vamos colocando os resultados anteriores junto com o próximo valor.

---

## Acumulador x contador

É importante não confundir os dois.

**Contador**

Normalmente serve para controlar quantas vezes o laço foi executado.

```javascript
cont++;
```

- **Exemplo:**

```
1 → 2 → 3 → 4 → 5
```

**Acumulador**

Serve para acumular um resultado.

```javascript
total = total + numero;
```

- **Exemplo:**

```
0
0 + 5 = 5
5 + 3 = 8
8 + 7 = 15
```

**Resumindo**

```
CONTADOR
→ conta.

ACUMULADOR
→ soma/acumula.
```

---

## Atividade — Somar 10 números

Foi criado o arquivo:

```
acumuladora.html
```

Estrutura:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Variável acumuladora</title>
</head>
<body>

    <h1>Variável acumuladora</h1>

    <p id="teste">A soma de todos os números é: </p>

    <script>
    </script>

</body>
</html>
```

---

### Código completo

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Variável acumuladora</title>
</head>
<body>

    <h1>Variável acumuladora</h1>

    <p id="teste">A soma de todos os números é: </p>

    <script>
        // Contador do loop
        var cont = 1;

        // Acumulador da soma
        var total = 0;

        // Variável para armazenar cada número digitado
        var numero = 0;

        // Informar ao usuário o que ele precisa fazer
        alert('Digite 10 números aleatórios');

        // Criando o laço de repetição
        for (cont = 1; cont <= 10; cont++) {

            numero = parseInt(
                prompt('Digite o ' + cont + 'º número', '')
            );

            total = total + numero;
        }

        // Mostrando o resultado
        document.getElementById('teste').innerHTML += total;
    </script>

</body>
</html>
```

---

**Entendendo o programa passo a passo**

**Contador**

```javascript
var cont = 1;
```

Controla o número da repetição.

O `for` fará:

```
1ª repetição
2ª repetição
3ª repetição
...
10ª repetição
```

---

**Acumulador**

```javascript
var total = 0;
```

Começamos com zero porque ainda não existe nenhum número somado.

---

**Variável temporária**

```javascript
var numero = 0;
```

Essa variável guarda o número digitado na repetição atual.

Ela não é o acumulador.

- **Por exemplo:**

```
numero = 10
total = 25
```

O `numero` representa apenas o valor atual.

O `total` representa tudo que já foi acumulado.

---

**`alert()`**

```javascript
alert('Digite 10 números aleatórios');
```

Mostra uma caixa de alerta no navegador.

Serve para informar ao usuário o que ele deve fazer.

---

**`prompt()`**

```javascript
prompt('Digite o ' + cont + 'º número', '')
```

Abre uma caixa para o usuário digitar um valor.

Como `cont` muda a cada repetição, a mensagem também muda:

```
Digite o 1º número
Digite o 2º número
Digite o 3º número
...
Digite o 10º número
```

---

**`parseInt()`**

O valor recebido pelo `prompt()` é uma String.

Por isso utilizamos:

```javascript
parseInt(...)
```

para transformar o texto em um número inteiro.

- **Exemplo:**

```javascript
parseInt('25')
```

resulta em:

```
25
```

---

**Acumulando a soma**

A linha principal é:

```javascript
total = total + numero;
```

Imagine que o usuário digite:

```
10
20
5
```

O programa fará:

```
total = 0

total = 0 + 10
total = 10

total = 10 + 20
total = 30

total = 30 + 5
total = 35
```

Esse processo continua até os 10 números serem digitados.

---

**Exibindo o resultado**

Depois que o `for` termina:

```javascript
document.getElementById('teste').innerHTML += total;
```

O valor final de `total` é colocado no parágrafo:

```html
<p id="teste">
    A soma de todos os números é:
</p>
```

O `+=` é utilizado porque queremos **manter o texto que já existe** e acrescentar o resultado.

---

## Segundo exercício — Total de vendas

Agora o conceito de acumulador foi aplicado a uma situação mais próxima de um problema real.

O programa deverá:

1. perguntar quantas vendas foram feitas;
2. pedir o valor de cada venda;
3. somar todas as vendas;
4. mostrar o total.

---

### Código completo

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Variável acumuladora</title>
</head>
<body>

    <h1>Variável acumuladora</h1>

    <p id="teste">O total de vendas foi: </p>

    <script>
        /*
            Código exemplo de controle de quantidade de entradas.

            O usuário informa quantas vendas foram feitas no dia.
            Depois digita os valores de cada venda,
            e o programa calcula o total das vendas.
        */

        // Contador do loop
        var cont = 1;

        // Acumulador das vendas
        var total = 0;

        // Valor de cada venda
        var venda = 0;

        // Quantidade de vendas
        var fim = 0;

        // Solicitar ao usuário a quantidade de vendas do dia
        fim = parseInt(
            prompt('Digite a quantidade de vendas', '')
        );

        // Criando o laço de repetição
        for (cont = 1; cont <= fim; cont++) {

            venda = parseFloat(
                prompt('Digite o valor da ' + cont + 'ª venda', '')
            );

            total = total + venda;
        }

        // Exibir o resultado
        document.getElementById('teste').innerHTML += total;
    </script>

</body>
</html>
```

---

**Entendendo o exercício de vendas**

Aqui temos quatro variáveis:

```javascript
var cont = 1;
var total = 0;
var venda = 0;
var fim = 0;
```

Cada uma possui uma função diferente.

| Variável | Função                         |
| -------- | ------------------------------ |
| `cont`   | controla as repetições         |
| `total`  | acumula os valores das vendas  |
| `venda`  | guarda a venda atual           |
| `fim`    | informa quantas vendas existem |

---

**Quantidade de vendas**

```javascript
fim = parseInt(
    prompt('Digite a quantidade de vendas', '')
);
```

O usuário informa, por exemplo:

```
3
```

Então:

```
fim = 3
```

O `for` será executado três vezes.

---

**Valor de cada venda**

Dentro do `for`:

```javascript
venda = parseFloat(
    prompt('Digite o valor da ' + cont + 'ª venda', '')
);
```

Aqui usamos `parseFloat()` porque uma venda pode possuir casas decimais.

- **Exemplo:**

```
25.50
10.75
8.90
```

`parseFloat()` converte o texto recebido para um número decimal.

---

**Por que `parseFloat()` e não `parseInt()`?**

`parseInt()` trabalha com números inteiros.

- **Exemplo:**

```javascript
parseInt('25')
```

→ `25`

Já `parseFloat()` permite valores com casas decimais:

```javascript
parseFloat('25.50')
```

→ `25.50`

Por isso `parseFloat()` é mais adequado para valores monetários nesse exercício.

---

**Acumulando as vendas**

Suponha que o usuário informe:

```
Quantidade de vendas: 3

Venda 1: 10.50
Venda 2: 20.00
Venda 3: 5.50
```

O programa fará:

```
total = 0

total = 0 + 10.50
total = 10.50

total = 10.50 + 20.00
total = 30.50

total = 30.50 + 5.50
total = 36.00
```

Resultado:

```
O total de vendas foi: 36
```

---

**Estrutura geral de um acumulador**

Um padrão muito importante é:

```javascript
var total = 0;

for (...) {
    total = total + valor;
}
```

Também podemos escrever:

```javascript
total += valor;
```

As duas formas representam a mesma ideia:

```javascript
total = total + valor;
```

e:

```javascript
total += valor;
```

---

**Padrão mental para exercícios com repetição**

Quando um exercício pedir para repetir alguma ação, procurar estas quatro perguntas:

**1. O que controla a repetição?**

Normalmente será o **contador**:

```javascript
var cont = 1;
```

**2. Até quando repetir?**

É a **condição**:

```javascript
cont <= 10
```

**3. O que será feito em cada repetição?**

- **Por exemplo:**

```javascript
numero = parseInt(prompt(...));
```

**4. Preciso guardar/acumular algum resultado?**

Se sim, criar um **acumulador**:

```javascript
var total = 0;
```

e atualizar:

```javascript
total += numero;
```

---

**Contador e acumulador juntos**

É muito comum os dois aparecerem no mesmo programa:

```javascript
var cont = 1;
var total = 0;

for (cont = 1; cont <= 10; cont++) {
    total += numero;
}
```

Nesse caso:

```
cont
↓
controla quantas vezes o código executa

total
↓
guarda o resultado acumulado
```

Essa combinação aparece constantemente em exercícios de programação.

---

# `for`, `while` e `do...while` — visão final

**`for`**

```javascript
for (cont = 1; cont <= 10; cont++) {
    // código
}
```

Ideal quando a estrutura do contador já está bem definida.

---

**`while`**

```javascript
while (condicao) {
    // código
}
```

Verifica a condição **antes** de executar.

Pode executar zero vezes.

---

**`do...while`**

```javascript
do {
    // código
} while (condicao);
```

Executa primeiro e verifica depois.

Executa **pelo menos uma vez**.

---

**Resumo Relâmpago**

1. **Laços de repetição** permitem executar um bloco de código várias vezes.
2. `for` reúne início, condição e incremento na mesma estrutura.
3. `while` verifica a condição antes de executar o bloco.
4. `do...while` executa o bloco primeiro e verifica a condição depois.
5. Por isso, `do...while` sempre executa pelo menos uma vez.
6. Um **contador** controla quantas vezes o laço será executado.
7. Um **acumulador** guarda e atualiza um resultado durante as repetições.
8. `+=` pode ser usado para acumular valores ou textos.
9. `parseInt()` converte entradas para números inteiros e `parseFloat()` permite números decimais.
10. O padrão **contador + condição + acumulador** é uma das bases para resolver exercícios de repetição.
