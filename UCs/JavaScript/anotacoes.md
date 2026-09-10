# Caderno de Estudos: Entrada de Dados no Terminal com Node.js (Readline) e Algoritmos Práticos

---

## 1. Visão Geral

Nesta aula, avancei para um nível essencial da programação: a **interatividade**. Até então, nossos programas processavam apenas dados fixos inseridos diretamente no código (*hardcoded*). Agora, aprendi a permitir que o **usuário digite informações pelo terminal** em tempo de execução.

* **O que é:** O módulo `readline` é uma biblioteca nativa do Node.js usada para ler fluxos de entrada de dados (como a digitação no teclado) linha por linha.
* **Para que serve:** Permite criar programas interativos via linha de comando (CLI), fazendo perguntas ao usuário, capturando as respostas e processando esses dados dinamicamente.
* **Por que é importante:** Todo sistema real precisa interagir com usuários ou outros sistemas enviando e recebendo dados. O `readline` é a porta de entrada para entender como lidar com entrada (*input*) e saída (*output*) de dados no ecossistema Node.js.
* **Qual é a ideia principal da aula:** Aprender a importar e configurar o módulo `readline`, entender a mecânica de captura de dados com callbacks aninhados, converter textos em números e aplicar essa lógica na construção de calculadoras e algoritmos de geometria e finanças.

---

## 2. Entendendo o Conceito

Quando executamos um programa no terminal, estabelecemos um canal de comunicação bidirecional com o sistema operacional:

```
[ Teclado / Usuário ] ───(Entrada: process.stdin)───► [ Nosso Código Node.js ]
                                                              │
[ Terminal / Tela ]   ◄───(Saída: process.stdout)─────────────┘

```

1. **`process.stdin` (Standard Input):** O canal por onde o programa "escuta" o que o usuário digita no teclado.
2. **`process.stdout` (Standard Output):** O canal por onde o programa "fala" ou exibe os textos e resultados na tela do terminal.
3. **`rl.question()`:** O método que faz a pergunta na tela e aguarda o usuário digitar o valor e pressionar `Enter`.
4. **Conversão de Dados:** Qualquer texto digitado no terminal entra no programa como `String`. Se quisermos realizar cálculos matemáticos, precisamos obrigatoriamente converter essa `String` em `Number`.

### 💡 Analogia do Cotidiano

Imagine um **atendente de drive-thru de uma lanchonete**:

* O atendente faz uma pergunta pelo alto-falante (`rl.question`): *"Qual é o seu pedido?"*.
* Ele fica em silêncio esperando você falar (execução assíncrona/aguardando *input*).
* Quando você responde, ele anota a informação em uma ficha (`callback` recebendo o parâmetro `nome` ou `valor`).
* Se você pedir 2 hambúrgueres e 3 refrigerantes, ele precisa somar as quantidades como números, e não apenas juntar as palavras.
* Ao final do atendimento, ele fecha a janela e encerra a conversa (`rl.close()`). Se ele esquecer de fechar a janela, a fila trava e ninguém mais passa.

---

## 3. Conceitos Fundamentais

### A. O Módulo `readline`

No Node.js, módulos são pacotes de funcionalidades. O `readline` é um módulo **nativo**, o que significa que não precisamos instalar nada externo via `npm`; basta importá-lo no arquivo com o comando `require('readline')`.

### B. O Método `createInterface()`

Para usar o módulo, precisamos criar uma interface de leitura passando um objeto de configuração com a entrada (`input`) e a saída (`output`):

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

```

### C. A Função `rl.question()` e Callbacks

A estrutura do `rl.question` recebe dois argumentos:

1. O texto do prompt (a pergunta que aparece na tela).
2. Uma **função de callback**: uma função que só é executada **após** o usuário digitar a resposta e apertar `Enter`. A resposta do usuário é entregue como parâmetro dessa função.

### D. Encerramento com `rl.close()`

O Node.js mantém o processo ativo no terminal aguardando novos dados de entrada até que você diga explicitamente que a interatividade acabou. O comando `rl.close()` fecha o canal de leitura e finaliza a execução do script no terminal.

---

## 4. Passo a Passo de Execução no Terminal

Diferente de scripts simples que rodamos com extensões automáticas, programas com entrada interativa do usuário funcionam melhor quando executados diretamente pelo terminal integrado do VS Code.

```
1. Abrir o Terminal no VS Code:
   Pressione `Ctrl + J` (ou `Ctrl + '`) para abrir o painel inferior.

2. Verificar a Pasta de Trabalho:
   Certifique-se de que o terminal está apontando para a pasta onde está salvo o arquivo.

3. Executar o Script com o Node.js:
   Digite `node` seguido do nome exato do arquivo (com extensão `.js`) e aperte Enter:
   
   $ node somadedoisvalores.js

4. Interagir com o Programa:
   O terminal exibirá a primeira mensagem. Digite o valor e aperte `Enter`.
   Repita o processo para cada pergunta exibida.

```

> ⚠️ **Nota Importante:** A extensão *Code Runner* (executada pelo botão Play) por padrão roda o código em um console de saída somente leitura (*Output*), o que pode impedir que você digite os dados. Por isso, utilizar o terminal do VS Code com o comando `node nomeDoArquivo.js` é a forma mais segura e recomendada.

---

## 5. Código e Desmontando o Código (Exemplos Práticos)

### Exemplo 1: Leitura de Nome e Soma Simples de Dois Valores

Este foi o nosso primeiro código interativo para entender a mecânica de callbacks aninhados e a conversão do tipo de dado.

```javascript
// Configurando a entrada de dados pelo usuário
const readline = require('readline');

// Criando a interface de entrada e saída
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Fazendo a primeira pergunta ao usuário
rl.question('Digite o seu nome: ', (nome) => {
    // Segunda pergunta (aninhada dentro do primeiro callback)
    rl.question('Digite o primeiro valor: ', (valor1) => {
        // Terceira pergunta (aninhada dentro do segundo callback)
        rl.question('Digite o segundo valor: ', (valor2) => {
            
            // Conversão explícita de String para Number antes de somar
            const soma = Number(valor1) + Number(valor2);

            console.log(`Nome: ${nome}`);
            console.log(`Soma dos valores: ${soma}`);

            // Encerra a interface para liberar o terminal
            rl.close();
        });
    });
});

```

#### Desmontando o Código Linha por Linha:

* **`const readline = require('readline');`**: Importa o módulo nativo de leitura de linha do Node.js e o armazena na constante `readline`.
* **`const rl = readline.createInterface({ ... });`**: Inicializa a interface interativa. A constante `rl` passa a ser o nosso objeto de controle para perguntas e respostas.
* **`rl.question('Digite o seu nome: ', (nome) => { ... });`**: O programa exibe a frase na tela e suspende a execução até que o usuário responda. O texto digitado é guardado na variável `nome`.
* **`rl.question('Digite o primeiro valor: ', (valor1) => { ... });`**: Como a leitura é assíncrona, para fazer uma segunda pergunta **após** receber a primeira resposta, precisamos colocar a nova pergunta *dentro* do bloco da primeira.
* **`const soma = Number(valor1) + Number(valor2);`**: **Etapa crucial!** Os valores recebidos de `valor1` e `valor2` chegam como texto (`"10"` e `"5"`). A função `Number()` converte essas Strings para números reais (`10` e `5`). Sem isso, `"10" + "5"` resultaria na concatenação `"105"`.
* **`console.log(\`Soma dos valores: ${soma}`);`**: Exibe a mensagem final usando *Template Literals* (interpolação com crases).
* **`rl.close();`**: Notifica a interface que a captura de dados acabou, permitindo que o Node.js encerre a aplicação com sucesso.

---

### Exemplo 2: Calculadora Básica com 4 Operações

Neste exercício, capturamos dois números e aplicamos as quatro operações fundamentais da matemática de uma só vez.

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o primeiro valor: ', (valor1) => {
    rl.question('Digite o segundo valor: ', (valor2) => {
        // Conversão dos valores capturados
        let num1 = Number(valor1);
        let num2 = Number(valor2);

        // Realizando os cálculos matemáticos
        let soma = num1 + num2;
        let subtracao = num1 - num2;
        let multiplicacao = num1 * num2;
        let divisao = num1 / num2;

        console.log('===== RESULTADO =====');
        console.log(`Soma dos valores: ${soma}`);
        console.log(`Subtração dos valores: ${subtracao}`);
        console.log(`Multiplicação dos valores: ${multiplicacao}`);
        console.log(`Divisão dos valores: ${divisao}`);

        rl.close();
    });
});

```

#### Desmontando o Código:

* Para otimizar a leitura e evitar repetidas chamadas de `Number()`, convertemos `valor1` e `valor2` logo no início do bloco e os armazenamos em variáveis do tipo number (`num1` e `num2`).
* Se o usuário digitar `0` no segundo valor, a variável `divisao` resultará em `Infinity` (comportamento padrão do JavaScript ao dividir um número por zero, sem travar o código).

---

### Exemplo 3: Exercícios de Geometria Plana (Cálculo de Áreas)

Aqui resolvi uma série de exercícios para consolidar a captura de dados e aplicar fórmulas geométricas.

#### A. Área do Quadrado ($A = L_1 \times L_2$ ou $A = L^2$)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o lado 1: ', (l1) => {
    rl.question('Digite o lado 2: ', (l2) => {
        let area = Number(l1) * Number(l2);

        console.log('===== RESULTADO =====');
        console.log(`A área do quadrado é de: ${area} m²`);

        rl.close();
    });
});

```

#### B. Área do Triângulo ($A = \frac{b \times h}{2}$)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o valor da base (b): ', (b) => {
    rl.question('Digite o valor da altura (h): ', (h) => {
        let area = (Number(b) * Number(h)) / 2;

        console.log('===== RESULTADO =====');
        console.log(`A área do triângulo é de: ${area} m²`);

        rl.close();
    });
});

```

#### C. Área do Trapézio ($A = \frac{(B + b) \times h}{2}$)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o valor da base maior (B): ', (B) => {
    rl.question('Digite o valor da base menor (b): ', (b) => {
        rl.question('Digite o valor da altura (h): ', (h) => {
            // Parênteses garantem que a soma das bases ocorra antes da multiplicação e divisão
            let area = ((Number(B) + Number(b)) * Number(h)) / 2;

            console.log('===== RESULTADO =====');
            console.log(`A área do trapézio é de: ${area} m²`);

            rl.close();
        });
    });
});

```

#### D. Área do Losango ($A = \frac{D \times d}{2}$) e Retângulo ($A = b \times h$)

```javascript
// Código para Área do Losango
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite a diagonal maior (D): ', (D) => {
    rl.question('Digite a diagonal menor (d): ', (d) => {
        let area = (Number(D) * Number(d)) / 2;
        
        console.log('===== RESULTADO =====');
        console.log(`A área do losango é de: ${area} m²`);

        rl.close();
    });
});

```

---

### Exemplo 4: Exercícios de Matemática Financeira (Juros Simples e Compostos)

#### A. Juros Simples

Fórmula: $J = C \times i \times t$ e Montante: $M = C + J$

* $C$ = Capital Inicial
* $i$ = Taxa de Juros (em porcentagem, portanto dividida por 100)
* $t$ = Tempo (em meses ou períodos)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o capital aplicado (C): ', (c) => {
    rl.question('Digite a taxa de juros mensal em % (i): ', (i) => {
        rl.question('Digite o tempo em meses (t): ', (t) => {
            let capital = Number(c);
            let taxa = Number(i) / 100; // Converte a porcentagem para valor decimal
            let tempo = Number(t);

            const simples = capital * taxa * tempo;
            const montante = capital + simples;

            console.log('===== RESULTADO =====');
            console.log(`O valor dos juros simples é de: R$ ${simples.toFixed(2)}`);
            console.log(`O valor total do montante é de: R$ ${montante.toFixed(2)}`);

            rl.close();
        });
    });
});

```

#### B. Juros Compostos (Juros sobre Juros)

Fórmula do Montante: $M = C \times (1 + i)^t$

```javascript
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Digite o capital aplicado (C): ', (c) => {
    rl.question('Digite a taxa de juros mensal em % (i): ', (i) => {
        rl.question('Digite o tempo em meses (t): ', (t) => {
            let capital = Number(c);
            let taxa = Number(i) / 100;
            let tempo = Number(t);

            // Fórmula do Montante em Juros Compostos usando o operador de exponenciação (**)
            const montante = capital * ((1 + taxa) ** tempo);
            const jurosCompostos = montante - capital;

            console.log('===== RESULTADO =====');
            console.log(`O valor total do montante é de: R$ ${montante.toFixed(2)}`);
            console.log(`O valor acumulado somente de juros é de: R$ ${jurosCompostos.toFixed(2)}`);

            rl.close();
        });
    });
});

```

---

## 6. Tabelas Comparativas

### Métodos de Conversão de Tipos de Dados

| Método | Entrada | Resultado | Uso Recomendado |
| --- | --- | --- | --- |
| `Number(val)` | `"10.5"` | `10.5` | Conversão geral (inteiros e decimais). Se falhar, retorna `NaN`. |
| `parseInt(val)` | `"10.5"` | `10` | Extrai apenas a parte inteira do número. |
| `parseFloat(val)` | `"10.5"` | `10.5` | Preserva as casas decimais (ótimo para valores financeiros). |

---

### Resumo das Fórmulas Aplicadas nos Algoritmos

| Figura / Conceito | Fórmula Aplicada em JavaScript | Explicação |
| --- | --- | --- |
| **Quadrado** | `l1 * l2` | Multiplicação dos lados. |
| **Triângulo** | `(b * h) / 2` | Metade da área do retângulo correspondente. |
| **Trapézio** | `((B + b) * h) / 2` | Soma das bases vezes a altura, dividido por 2. |
| **Losango** | `(D * d) / 2` | Multiplicação das diagonais dividida por 2. |
| **Juros Simples** | `C * (i / 100) * t` | Rendimento fixo calculado sobre o capital inicial. |
| **Juros Compostos** | `C * ((1 + (i / 100)) ** t)` | Rendimento acumulativo (juros incidem sobre o montante anterior). |

---

## 7. Erros Comuns e Cuidados

### 1. Escrever comandos juntos sem espaço

* **Incorreto:** `constreadline=require('readline');` ou `constrl=readline...`
* **Correto:** `const readline = require('readline');` e `const rl = ...`
* **Motivo:** O JavaScript precisa de espaço em branco para separar as palavras-chave (`const`, `let`, `var`) dos nomes das variáveis.

### 2. Concatenar Strings em vez de Somar Números

* **Incorreto:** `let soma = valor1 + valor2;` *(se valor1="5" e valor2="3", resulta em `"53"`)*
* **Correto:** `let soma = Number(valor1) + Number(valor2);` *(resulta em `8`)*
* **Motivo:** A entrada obtida pelo `readline` é sempre do tipo `String`. O operador `+` com textos realiza a junção (concatenação), e não a soma matemática.

### 3. Esquecer o fechamento da interface (`rl.close()`)

* **Sintoma:** O código executa, imprime o resultado, mas o terminal fica "travado" piscando o cursor sem devolver o controle da linha de comando ao usuário.
* **Solução:** Colocar `rl.close()` no final da última função de callback executada.

### 4. Textos idênticos em prompts sequenciais (Erro de Copiar e Colar)

* **Incorreto:**

```javascript
  rl.question('Digite o primeiro valor: ', (v1) => {
      rl.question('Digite o primeiro valor: ', (v2) => { ... });
  });
  

```

* **Correto:** Alterar a segunda pergunta para `'Digite o segundo valor: '`.

---

## 8. Correções Técnicas das Minhas Anotações

Foram feitas as seguintes correções diretas nos trechos do rascunho original:

1. **Separação de Palavras-Chave:** Corrigidos os erros de digitação `constreadline` para `const readline` e `constrl` para `const rl`.
2. **Correção do Prompt na Calculadora Simples:** Na anotação original, a segunda pergunta estava repetida como `"Digite o primeiro valor: "`. A pergunta foi alterada para `"Digite o segundo valor: "` para não confundir o usuário.
3. **Coerção de Tipos na Área do Trapézio:** No rascunho original estava `((Number(B) + Number(b)) * h) / 2`. A variável `h` foi envolvida em `Number(h)` para manter a consistência do tratamento numérico.
4. **Precisão de Conceito em Juros Compostos:** No rascunho, a variável chamava-se `composto`, mas a fórmula aplicada `C * (1 + i) ** t` calcula diretamente o **Montante Total ($M$)**. Ajustei a explicação para deixar claro que os juros em si são calculados subtraindo o capital do montante ($J = M - C$).

---

## 9. Aprofundamento e Boas Práticas

### A. O Problema do "Callback Hell" e o Readline Assíncrono

Reparou como o nosso código foi ficando "inclinado" para a direita à medida que adicionamos perguntas?

```javascript
rl.question(..., () => {
    rl.question(..., () => {
        rl.question(..., () => {
            // Aninhamento excessivo!
        });
    });
});

```

Esse aninhamento de funções dentro de funções é conhecido no mercado como **Callback Hell** (Inferno dos Callbacks). Ocorre porque a leitura do terminal é uma operação **assíncrona** (o Node.js fica esperando o usuário sem travar a CPU).

Em conteúdos futuros do curso, aprenderemos a resolver isso de forma mais limpa usando **Promises** e **`async/await`** com a biblioteca `readline/promises`.

### B. Formatação de Moeda com `.toFixed(2)`

Quando trabalhamos com cálculos financeiros no computador, é comum obter números com muitas casas decimais imprevisíveis (ex: `10.333333333333334`).

Para limitar a exibição a 2 casas decimais (padrão de centavos), usamos o método `.toFixed(2)` associado a números:

```javascript
let valor = 105.6789;
console.log(valor.toFixed(2)); // Exibe exatamente "105.68" (com arredondamento automático)

```

---

## 10. Resumo Relâmpago — 10 Linhas

1. O módulo nativo `readline` possibilita a entrada interativa de dados pelo terminal no Node.js.
2. A interface é criada com `readline.createInterface()` mapeando `process.stdin` (entrada) e `process.stdout` (saída).
3. O método `rl.question()` faz a pergunta ao usuário e captura a resposta dentro de uma função de callback.
4. Qualquer dado recebido do terminal entra na aplicação nativamente como uma `String`.
5. Usamos a função `Number()` para converter textos em números antes de realizar operações matemáticas.
6. A ausência da conversão numérica faz com que o operador `+` concatene textos em vez de somar valores.
7. Múltiplas perguntas no terminal exigem callbacks aninhados para garantir a ordem correta de execução.
8. O comando `rl.close()` é obrigatório para encerrar a escuta do terminal e liberar a execução do Node.js.
9. Na matemática financeira, `**` representa a elevação de potência necessária para o cálculo de juros compostos.
10. Scripts interativos devem ser executados no terminal com o comando `node nomeDoArquivo.js`.

---

## 11. Guia Rápido de Memorização

* **Importar Readline:** `const readline = require('readline');`
* **Criar Interface:** `const rl = readline.createInterface({ input: process.stdin, output: process.stdout });`
* **Fazer Pergunta:** `rl.question('Texto', (resposta) => { ... });`
* **Fechar Leitura:** `rl.close();`
* **Converter Texto para Número:** `Number(variavelTexto)`
* **Casas Decimais (Finanças):** `numero.toFixed(2)`
* **Rodar no Terminal:** `node arquivo.js`
* **Abrir Terminal do VS Code:** `Ctrl + J`
