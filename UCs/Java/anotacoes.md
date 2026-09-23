# Controle de Fluxo (Break/Continue), Funções em JavaScript e Modularização de Código

---

**Visão Geral**

Nesta aula, avancei em dois pilares essenciais da lógica e da arquitetura de software: o **controle fino de laços de repetição** (usando `break` e `continue`) e a **criação de Funções**, aprendendo também a organizar o projeto separando o código JavaScript em arquivos externos `.js`.

* **O que é:**

* *Controle de Fluxo (`break`/`continue`):* Instruções que alteram a execução normal de um laço de repetição antes que ele atinja sua condição de parada final.
* *Funções:* Blocos de código reutilizáveis projetados para realizar uma tarefa específica. Podem receber dados (parâmetros) e devolver um resultado (`return`).
* *Modularização:* Técnica de separar o HTML (estrutura) do JavaScript (comportamento/lógica) em arquivos distintos.


* **Para que serve:**

* `break` interrompe e encerra um laço imediatamente;
* `continue` pula apenas a iteração atual e passa para a próxima;
* Funções evitam a repetição de código (*DRY - Don't Repeat Yourself*);
* Arquivos `.js` externos tornam o sistema organizado, modular e fácil de manter.


* **Por que é importante:**

Nenhum sistema profissional escreve o mesmo cálculo várias vezes ou mantém milhares de linhas de script dentro do HTML. Aprender a isolar a lógica em funções e arquivos externos é o primeiro passo para pensar como um desenvolvedor de verdade.

* **Ideia principal da aula:**

Dominar a interrupção de loops, entender a diferença entre funções com e sem parâmetros, manipular o comando `return` e conectar arquivos HTML a scripts JavaScript externos usando o atalho de criação rápida do VS Code.

---

**Entendendo o Conceito**

## O Desvio de Fluxo no Loop

Normalmente, um laço `for` ou `while` executa todas as suas voltas do início ao fim. No entanto, às vezes precisamos intervir durante o percurso:

* **`break` (O Freio de Mão):** Interrompe o laço e expulsa a execução para fora dele imediatamente.
* **`continue` (A Lomba/Pulo):** Ignora tudo o que está abaixo dele **naquela volta específica**, mas não cancela o laço — ele pula direto para o incremento da próxima volta.

---

# O Conceito de Função (A Caixa-Preta)

Uma **função** funciona exatamente como uma **máquina** ou um **eletrodoméstico**:

```
[ Entradas / Parâmetros ] ───► ┌─────────────────────────┐
                               │  MÁQUINA / FUNÇÃO       │
                               │ (Processa a lógica)     │ ───► [ Saída / Return ]
                               └─────────────────────────┘

```

1. **Parâmetros (Entrada):**

São os ingredientes ou dados que você entrega para a máquina (ex: dois números para somar).

2. **Corpo da Função (Processamento):**

É o trabalho interno que a máquina realiza longe dos olhos do usuário.

3. **`return` (Saída):**

É o produto final pronto que a máquina devolve para quem a chamou.

> Analogia do Cotidiano

Imagine um **Micro-ondas**:

* O micro-ondas é a **função** `esquentarAlimento()`.
* O prato de comida e o tempo em segundos são os **parâmetros** que você passa para ele.
* O processo de esquentar é o **corpo da função**.
* O "bip" com a comida quente entregue é o **`return`**.
* Se você apenas apertar o botão "Pipoca" sem colocar nada dentro, é uma **função sem parâmetro**: ela já tem um tempo e potência fixos programados dentro dela.

---

## Conceitos Fundamentais

**Interruptores de Laço: `break` vs `continue`**

```javascript
// O laço iria de 0 a 10...
for (let cont = 0; cont <= 10; cont++) {
    if (cont === 8) {
        break; // Para no 8. Não executa nem exibe o 8, 9 ou 10.
    }
}

for (let cont = 0; cont <= 10; cont++) {
    if (cont === 8) {
        continue; // Pula o 8. Não exibe o 8, mas exibe o 9 e o 10 normalmente.
    }
}

```

---

**Anatomia de uma Função em JavaScript**

```javascript
function nomeDaFuncao(parametro1, parametro2) {
    // Bloco de código / Lógica
    let resultado = parametro1 + parametro2;
    
    return resultado; // Devolve o valor para quem chamou
}

```

1. **`function`:** Palavra-chave obrigatória para declarar uma função.

2. **Nome da Função:** Segue as regras de identificadores (deve ser claro e descrever uma ação, como `Soma`, `CalcularMedia`, `mostraTexto`).

3. **Parâmetros `(a, b)`:** Variáveis locais criadas para receber os valores externos (chamados de **argumentos**) quando a função é invocada.

4. **Instrução `return`:** Encerra a execução da função e envia o resultado de volta para o ponto onde a função foi chamada. Se não houver `return`, a função executa a tarefa e retorna `undefined` por padrão.

---

**Separação de Responsabilidades: HTML vs JS Externo**

Em vez de poluir a página web escrevendo código dentro da tag `<script>`, criamos um arquivo com extensão `.js` e fazemos a ligação através do atributo `src`:

```html
<!-- No arquivo HTML -->
<script src="02-funcao-com-parametros.js"></script>

```

## Dica de Produtividade no VS Code:

Para criar o arquivo `.js` externo rapidamente pelo HTML:

1. Escreva `<script src="nomeDoArquivo.js"></script>`.
2. Mantenha a tecla **`Ctrl`** pressionada e clique sobre o caminho `"nomeDoArquivo.js"`.
3. O VS Code perguntará se você deseja criar o arquivo. Clique em **Create File**. O arquivo abrirá pronto para digitar o código!

---

### Código / Exemplos Práticos

**Exemplo 1: Interrompendo o Laço com `break` (`break.html`)**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Controle de Fluxo - break</title>
</head>
<body>
    <h1>Controle de Fluxo - break</h1>
    <p id="teste"></p>

    <script>
        let resposta = '';

        for (let cont = 0; cont <= 10; cont++) {
            // Quando a variável atinge 8, o laço é cancelado imediatamente
            if (cont === 8) {
                break;
            }
            resposta += 'Valor da variável é: ' + cont + '<br/>';
        }

        // Exibe os valores de 0 até 7
        document.getElementById('teste').innerHTML = resposta;
    </script>
</body>
</html>

```

---

**Exemplo 2: Pulando uma Iteração com `continue` (`continue.html`)**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Controle de Fluxo - continue</title>
</head>
<body>
    <h1>Controle de Fluxo - continue</h1>
    <p id="teste"></p>

    <script>
        let resposta = '';

        for (let cont = 0; cont <= 10; cont++) {
            // Quando cont é 8, pula a adição desse valor e vai direto para o cont = 9
            if (cont === 8) {
                continue;
            }
            resposta += 'Valor da variável é: ' + cont + '<br/>';
        }

        // Exibe 0, 1, 2, 3, 4, 5, 6, 7, 9, 10 (o 8 é omitido)
        document.getElementById('teste').innerHTML = resposta;
    </script>
</body>
</html>

```

---

**Exemplo 3: Função Sem Parâmetros Disparada por Botão (`funcao-sem-parametro.html`)**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Função sem Parâmetro</title>
</head>
<body>
    <h1>Função sem Parâmetro</h1>
    <p id="teste"></p>
    
    <!-- O evento onclick chama a função mostraTexto() quando o usuário clica -->
    <button type="button" onclick="mostraTexto();">Mostrar Dados</button>

    <script>
        // Declaração da função sem parâmetros de entrada
        function mostraTexto() {
            let texto = 'Linguagem JavaScript<br/>';
            let media = ((2 + 5 + 8) / 3) + '<br/>'; // Média calculada = 5
            let resposta = true;

            // Insere os dados concatenados dentro do parágrafo
            document.getElementById('teste').innerHTML = texto + media + resposta;
        }
    </script>
</body>
</html>

```

---

**Exemplo 4: Função Com Parâmetros e Arquivo JS Externo**

**Arquivo HTML (`funcao-com-parametros.html`):**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Função com Parâmetros</title>
</head>
<body>
    <h1>Função com Parâmetros</h1>
    <p id="teste">A soma dos números é: </p>

    <!-- Conexão com o script JS externo -->
    <script src="02-funcao-com-parametros.js"></script>
</body>
</html>

```

**Arquivo JS (`02-funcao-com-parametros.js`):**

```javascript
// Declaração da função com dois parâmetros (a, b)
function Soma(a, b) {
    return a + b; // Retorna a soma matemática pura sem mexer no DOM
}

// Declaração de variáveis locais
let num1 = 0;
let num2 = 0;

// Solicita dados ao usuário via prompt e converte em números inteiros
num1 = parseInt(prompt('Digite o 1º número:', '0')) || 0;
num2 = parseInt(prompt('Digite o 2º número:', '0')) || 0;

// Invoca a função Soma passando num1 e num2 como argumentos e anexa ao DOM
document.getElementById('teste').innerHTML += Soma(num1, num2);

```

---

**Exemplo 5: Calculadora com 4 Funções Matemáticas e Eventos de Botão**

**Arquivo HTML (`calculadora-botoes.html`):**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calculadora com Funções e Botões</title>
</head>
<body>
    <h1>Calculadora com Funções e Parâmetros</h1>
    
    <p id="teste1">A soma dos números é: </p>
    <p id="teste2">A subtração dos números é: </p>
    <p id="teste3">A multiplicação dos números é: </p>
    <p id="teste4">A divisão dos números é: </p>

    <!-- Os botões disparam as funções específicas injetando o retorno no HTML -->
    <button type="button" onclick="document.getElementById('teste1').innerHTML += Soma(num1, num2);">Soma</button>
    <button type="button" onclick="document.getElementById('teste2').innerHTML += Sub(num1, num2);">Subtração</button>
    <button type="button" onclick="document.getElementById('teste3').innerHTML += Mult(num1, num2);">Multiplicação</button>
    <button type="button" onclick="document.getElementById('teste4').innerHTML += Div(num1, num2);">Divisão</button>

    <!-- Script externo com a lógica das funções -->
    <script src="03-funcao-com-parametros.js"></script>
</body>
</html>

```

**Arquivo JS (`03-funcao-com-parametros.js`):**

```javascript
// Módulo de Funções Aritméticas (Retornam valores puros)
function Soma(a, b) {
    return a + b;
}

function Sub(a, b) {
    return a - b;
}

function Mult(a, b) {
    return a * b;
}

function Div(a, b) {
    return a / b;
}

// Variáveis globais acessíveis pelos handlers onclick do HTML
let num1 = 0;
let num2 = 0;

// O prompt é executado imediatamente ao carregar a página
num1 = parseInt(prompt('Digite o 1º número:', '0')) || 0;
num2 = parseInt(prompt('Digite o 2º número:', '0')) || 0;

```

---

**Exemplo 6: Sistema de Média Escolar com Função de 4 Parâmetros**

**Arquivo HTML (`media-aluno.html`):**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cálculo de Média do Aluno</title>
</head>
<body>
    <h1>Cálculo de Média Escolar</h1>
    <p id="teste">A média do(a) aluno(a) é: </p>

    <script src="04-funcao-com-parametros.js"></script>
</body>
</html>

```

**Arquivo JS (`04-funcao-com-parametros.js`):**

```javascript
// Função que recebe 4 notas e calcula a média aritmética
function Media(a, b, c, d) {
    return (a + b + c + d) / 4;
}

// Variáveis para armazenar as notas
let nota1 = 0, nota2 = 0, nota3 = 0, nota4 = 0;

alert('Informe as 4 notas do(a) aluno(a)');

// Captura e conversão das 4 notas
nota1 = parseFloat(prompt('Digite a 1ª nota:', '0')) || 0;
nota2 = parseFloat(prompt('Digite a 2ª nota:', '0')) || 0;
nota3 = parseFloat(prompt('Digite a 3ª nota:', '0')) || 0;
nota4 = parseFloat(prompt('Digite a 4ª nota:', '0')) || 0;

// Exibição do resultado da média invocado com a função
document.getElementById('teste').innerHTML += Media(nota1, nota2, nota3, nota4).toFixed(1);

```

---

**Desmontando o Código**

**Desmontando o Funcionamento do `break` no Exemplo 1:**

1. O laço `for` inicia com `cont = 0`.
2. A cada ciclo, imprime o texto no padrão `"Valor da variável é: X"`.
3. Quando `cont` passa de 7 para **8**, o bloco condicional `if (cont === 8)` avalia como **verdadeiro**.
4. A instrução **`break`** é disparada.
5. O laço é **destruído instantaneamente**. A linha `resposta += ...` **não é executada** para o valor 8.
6. O programa avança para a linha seguinte fora do laço (`document.getElementById...`), exibindo o resultado até o 7.

---

**Desmontando o Funcionamento de `Media(nota1, nota2, nota3, nota4)`:**

1. Suponha que o usuário digitou as notas `8`, `7`, `6` e `9`.
2. O JavaScript chama a função `Media(8, 7, 6, 9)`.
3. Os argumentos são associados aos parâmetros em ordem posicional:
* `a = 8`, `b = 7`, `c = 6`, `d = 9`.


4. A expressão interna calcula: $(8 + 7 + 6 + 9) / 4 = 30 / 4 = 7.5$.
5. O comando `return 7.5` devolve o valor numérico `7.5` para o ponto da chamada.
6. `.innerHTML += 7.5` anexa o texto no parágrafo HTML.

---

**Passo a Passo: Criando e Ligando Arquivos JavaScript Externos**

```
1. No VS Code, crie a pasta do projeto e o arquivo HTML (ex: index.html).
2. Escreva a estrutura HTML5 padrão.
3. Dentro do <body>, adicione a tag informando o caminho do script externo:
   <script src="meuscript.js"></script>
4. Atalho de criação: Pressione e segure `Ctrl` e dê um clique no texto "meuscript.js".
5. Clique na opção "Create File" que aparecerá no topo do VS Code.
6. Escreva APENAS código JavaScript no novo arquivo (NÃO coloque a tag <script> dentro de arquivos .js!).
7. Salve ambos os arquivos com Ctrl + S e abra o HTML no navegador.

```

---

## Tabelas Comparativas

**`break` vs `continue`**

| Característica | `break` | `continue` |
| --- | --- | --- |
| **Ação no Laço** | Interrompe e **encerra o laço completamente**. | Pula apenas a **volta atual** e vai para a próxima. |
| **Próxima Linha Executada** | A primeira linha de código **fora/após** o laço. | O incremento (`cont++`) e o teste da **próxima volta**. |
| **Uso Comum** | Parar uma busca quando o item é encontrado. | Ignorar dados inválidos ou números pares/ímpares. |

---

**Funções Sem Parâmetro vs Funções Com Parâmetros**

| Tipo de Função | Recebe Dados Externos? | Flexibilidade | Exemplo de Uso |
| --- | --- | --- | --- |
| **Sem Parâmetro** | Não | Baixa (Sempre faz a mesma coisa exata). | Exibir um aviso fixo, limpar uma tela. |
| **Com Parâmetros** | Sim | Alta (Trabalha com dados dinâmicos). | Somar 2 números quaisquer, calcular médias. |

---

**Script Interno vs Script Externo**

| Abordagem | Onde fica o código JS? | Vantagem | Desvantagem |
| --- | --- | --- | --- |
| **Script Interno** | Dentro de `<script>` no arquivo HTML | Fácil de testar em trechos muito pequenos | Polui o HTML e dificulta o reuso em outras páginas |
| **Script Externo** | Em um arquivo `.js` separado | **Código limpo**, modular e reutilizável em várias páginas | Exige atenção aos caminhos de arquivo (`src`) |

---

## Erros Comuns e Cuidados

**Colocar Tags HTML `<script>` Dentro de Arquivos `.js`**

* **Erro:** Escrever `<script> let x = 10; </script>` dentro do arquivo `meuscript.js`.
* **Regra de Ouro:** Arquivos `.js` contêm **somente código JavaScript puro**. Tags HTML só pertencem a arquivos `.html`.

**Confusão de Nomes em Parâmetros vs Argumentos**

* **Parâmetros:** São as variáveis da **definição** da função (ex: `a` e `b` em `function Soma(a, b)`).
* **Argumentos:** São os **valores reais** passados na hora de chamar a função (ex: `num1` e `num2` em `Soma(num1, num2)`).

**Nome de Arquivo com Dupla Extensão (`.html.html`)**

* **Erro Comum:** Digitar `funcao.html` na caixa de criação do VS Code quando a opção de tipo já insere o `.html`, resultando em `funcao.html.html`.
* **Solução:** Atente-se à barra de arquivos do VS Code para garantir extensões limpas como `index.html` e `script.js`.

---

## Aprofundamento e Boas Práticas

**Funções Puras vs Manipulação Direta do DOM**

Percebeu que as nossas funções de cálculo como `Soma(a, b)` apenas fazem a conta e usam `return a + b;`, sem utilizar `document.getElementById` dentro delas?

Isso é uma **boa prática de arquitetura de software** chamada **Função Pura**:

* A função foca exclusivamente em **processar dados** (calcular).
* Quem chamou a função decide o que fazer com o resultado (exibir na tela, salvar em banco de dados ou enviar por e-mail).
* Isso torna a função **reutilizável** em qualquer parte do sistema!

**Funções Modernas: Arrow Functions (ES6)**

A partir do JavaScript moderno (ES6), aprendemos uma forma mais curta de escrever funções usando a sintaxe de "flecha" (**Arrow Functions**):

```javascript
// Função tradicional:
function Soma(a, b) {
    return a + b;
}

// Arrow Function equivalente:
const Soma = (a, b) => a + b;

```

Para funções simples de uma única linha, a Arrow Function omite a palavra `function`, as chaves `{}` e a palavra `return`, deixando o código extremamente enxuto.

---

**Resumo Relâmpago**

1. O comando `break` encerra um laço de repetição imediatamente, pulando para fora dele.
2. O comando `continue` ignora o restante do código da volta atual e pula para a próxima iteração.
3. Funções são blocos de código reutilizáveis projetados para realizar tarefas específicas.
4. Funções sem parâmetros executam rotinas fixas sem receber dados externos.
5. Funções com parâmetros recebem dados dinâmicos chamados argumentos na sua invocação.
6. A instrução `return` envia o resultado da função de volta para quem a chamou e encerra a função.
7. Arquivos JavaScript externos devem possuir extensão `.js` e ser ligados via `<script src="arquivo.js">`.
8. Pressionar `Ctrl` e clicar no caminho do script no HTML permite criar o arquivo `.js` no VS Code.
9. Funções puras que apenas retornam valores são mais flexíveis e reutilizáveis do que funções que alteram o DOM.
10. Utilizar `parseFloat()` é indispensável quando a entrada de dados da função envolve números decimais.

---

## Guia Rápido de Memorização

* **Sintaxe de Função:** `function nome(p1, p2) { return p1 + p2; }`
* **Interromper Loop:** `break;`
* **Pular Iteração:** `continue;`
* **Ligar JS Externo:** `<script src="script.js"></script>`
* **Chamar Função:** `let x = nome(val1, val2);`
* **Criar Arquivo Rápido no VS Code:** `Ctrl + Clique` sobre o nome do arquivo na tag `<script src="...">`