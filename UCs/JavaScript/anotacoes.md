# Caderno de Estudos: Introdução ao HTML com JavaScript e Manipulação do DOM

---

## 1. Visão Geral

Nesta aula, dei os primeiros passos na integração entre o **HTML** e o **JavaScript**. Entendi como o código JavaScript consegue "conversar" com a estrutura visual de uma página web, alterando conteúdos e manipulando elementos em tempo real.

* **O que é:** O HTML (HyperText Markup Language) é a linguagem de marcação usada para estruturar páginas web. O JavaScript é a linguagem de programação utilizada para adicionar interatividade e dinamismo a essa estrutura.
* **Para que serve:** Unir HTML com JavaScript permite criar sites dinâmicos, onde textos, imagens e componentes se alteram de acordo com a lógica do programa ou com ações do usuário, sem a necessidade de recarregar a página.
* **Por que é importante:** Todo desenvolvedor web (Front-end) precisa dominar a integração do JavaScript com o **DOM** (*Document Object Model*), pois é assim que o código ganha vida na tela do navegador.
* **Ideia principal da aula:** Criar arquivos HTML básicos no VS Code, inserir scripts com a tag `<script>`, selecionar elementos pelos seus IDs (`document.getElementById`) e exibir diferentes tipos de dados (variáveis, arrays, objetos, operadores e laços de repetição) diretamente na página web.

---

## 2. Entendendo o Conceito

Uma página web é construída por camadas:

1. **HTML:** Define a estrutura e os elementos visuais (títulos, parágrafos, botões).
2. **JavaScript:** Interfere nessa estrutura para ler ou alterar o que está escrito nos elementos.

Para que o JavaScript consiga encontrar um elemento específico no HTML, atribuímos um **identificador único** a esse elemento usando o atributo `id` (por exemplo: `<p id="texto"></p>`). O JavaScript utiliza esse `id` como um "endereço" para localizar o elemento exato na memória do navegador e modificar o seu conteúdo através da propriedade `innerHTML`.

```
[ Elemento HTML: <p id="texto"></p> ] ◄─── (Localizado via id) ─── [ JavaScript: document.getElementById('texto') ]
                                                                                   │
[ Tela exibe: "Novo Conteúdo" ] ◄─── (Conteúdo alterado via) ─── [ .innerHTML = 'Novo Conteúdo' ]

```

### 💡 Analogia do Cotidiano

Imagine um **prédio comercial**:

* O **HTML** é a estrutura do prédio (as paredes, salas e a numeração das portas).
* O **`id`** é o número da sala no corredor (ex: *Sala 101*).
* O **JavaScript** é o recepcionista que caminha até a *Sala 101* (`document.getElementById('sala101')`) e troca a placa com o nome da empresa na porta (`.innerHTML = 'Nova Empresa'`).

---

## 3. Conceitos Fundamentais

### A. Estrutura Básica do HTML5

Todo documento HTML funcional segue uma hierarquia de tags:

* `<!DOCTYPE html>`: Declara ao navegador que o arquivo utiliza a versão moderna do HTML (HTML5).
* `<html lang="pt-br">`: Tag raiz do documento, especificando a linguagem da página.
* `<head>`: Contém os metadados (configurações invisíveis ao usuário, como codificação de caracteres `utf-8`, responsividade da tela e o título da aba `<title>`).
* `<body>`: Contém todo o conteúdo visual visível da página (títulos `<h1>`, parágrafos `<p>`, etc.).

### B. A Tag `<script>`

É a tag usada para incorporar código JavaScript dentro de um arquivo HTML. O navegador executa os comandos presentes entre `<script>` e `</script>` sequencialmente, no momento em que lê essa tag.

### C. Métodos de Saída no Navegador

* **`document.write()`**: Escreve um texto diretamente no fluxo do documento HTML.
> ⚠️ **Cuidado:** Se usado após a página ter sido totalmente carregada, ele pode apagar todo o HTML existente e substituí-lo pelo texto novo.


* **`document.getElementById(" id ")`**: Busca na página o elemento HTML que possui o atributo `id` correspondente.
* **`innerHTML`**: Propriedade que permite ler ou alterar o conteúdo HTML/texto interno do elemento selecionado.
* **Operador `+=` no DOM**: Usado para **acrescentar** um novo texto ao conteúdo que já existia dentro do elemento, em vez de sobrescrevê-lo.

### D. Arrays e Índice Zero

Ao manipular vetores (Arrays) no JavaScript, o primeiro elemento **sempre** ocupa o índice `0`.

* Para o array `['Verde', 'Amarelo', 'Azul']`:
* `d[0]` traz `'Verde'`
* `d[1]` traz `'Amarelo'`
* `d[2]` traz `'Azul'`



### E. Criação de Objetos com `new Object()`

Objetos são estruturas de dados que armazenam conjuntos de propriedades no formato de chave e valor. Podemos instanciar um objeto genérico usando a sintaxe `new Object()` e atribuir atributos dinamicamente através do operador ponto `.`.

### F. Operadores Incrementais e Decrementais (Pré vs. Pós)

* **Pré-incremento (`++a`):** Soma 1 à variável **antes** de retornar ou usar seu valor na expressão.
* **Pós-incremento (`b++`):** Retorna o valor atual da variável para a expressão e soma 1 **depois**.
* **Comportamento do operador `+=` em loops:** No laço `for`, a instrução `c = c + cont;` acumula o valor da variável de controle `cont` na variável `c`.

---

## 4. Código / Exemplos Práticos

### Criando a Estrutura de Pastas e Arquivos

Para organizar os exercícios, criamos uma pasta chamada `exemploshtml` e salvamos os arquivos `.html` dentro dela.

---

### Arquivo 1: `exemplo1.html` (Estrutura Mínima)

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

---

### Arquivo 2: `01-primeira-pagina.html` (Manipulação Básica do DOM)

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

        // Usando o método document.write() para escrever na tela
        document.write('Meu primeiro texto em JavaScript');

        // Selecionando o elemento com id="texto" e inserindo a frase no HTML dele
        document.getElementById('texto').innerHTML = 'Segundo texto em JavaScript';
    </script>
</body>
</html>

```

---

### Arquivo 3: `02-tipos-de-dados.html` (Exibindo Variáveis no HTML)

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
        var a; // Variável 'a' declarada, mas sem valor (undefined)
        var b = 1; // Variável 'b' do tipo Number (inteiro)
        var c = [1, 2, 3, 4, 5]; // Array numérico
        var d = ['Verde', 'Amarelo', 'Azul', 'Branco']; // Array de Strings (textos)
        var e = 'JavaScript'; // Variável do tipo String
        var f = false; // Variável do tipo Boolean (lógica)
        var g = null; // Variável com valor nulo explícito

        // Exibindo o conteúdo de cada variável anexando ao texto existente (+=)
        document.getElementById("teste1").innerHTML += a;
        document.getElementById("teste2").innerHTML += b;
        document.getElementById("teste3").innerHTML += c[2]; // Posição 2 = 3º elemento (valor 3)
        document.getElementById("teste4").innerHTML += d;
        document.getElementById("teste5").innerHTML += e;
        document.getElementById("teste6").innerHTML += f;
        document.getElementById("teste7").innerHTML += g;     
    </script>
</body>
</html>

```

---

### Arquivo 4: `objeto.html` (Trabalhando com Objetos)

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
        // Criando um objeto genérico usando a sintaxe new Object()
        var meuCarro = new Object();
        
        // Atribuindo propriedades ao objeto
        meuCarro.fabrica = 'Volkswagen';
        meuCarro.modelo = 'Jetta';
        meuCarro.cor = 'Azul';
        meuCarro.ano = 2026;

        // Concatenando as propriedades e inserindo no parágrafo
        document.getElementById('dados').innerHTML += 
            meuCarro.fabrica + ' - ' + meuCarro.modelo + ' - ' + meuCarro.cor + ' - ' + meuCarro.ano;
    </script>
</body>
</html>

```

---

### Arquivo 5: `05-operadores-incrementais.html` (Incremento e Laço `for`)

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

        // Operações de incremento e decremento
        a = ++a; // Pré-incremento: 'a' passa a valer 2
        
        // Atribuição com pós-incremento (b recebe o valor original '1' antes da elevação)
        b = b++; 
        
        d = --d; // Pré-decremento: 'd' passa a valer 4

        // Laço de repetição for
        // Executa com cont = 1, 2 e 3
        for (var cont = 1; cont <= 3; cont++) {
            c = c + cont; // Acumula o valor de cont em c
        }

        // Exibição dos resultados na tela
        document.getElementById('teste1').innerHTML += a;
        document.getElementById('teste2').innerHTML += b;
        document.getElementById('teste3').innerHTML += c;
        document.getElementById('teste4').innerHTML += d;
    </script>
</body>
</html>

```

---

## 5. Desmontando o Código

### A. Desmontando o arquivo `02-tipos-de-dados.html`:

* **`<p id="teste1">O valor de a é: </p>`**: Cria um parágrafo que já inicia com o texto "O valor de a é: ".
* **`var a;`**: Como declaramos a variável mas não atribuímos nenhum valor, o JavaScript define o tipo padrão dela como `undefined`.
* **`document.getElementById("teste1").innerHTML += a;`**: O operador `+=` pega o texto existente ("O valor de a é: ") e junta com o valor de `a` (`undefined`). O parágrafo na tela resultará em: **"O valor de a é: undefined"**.
* **`c[2]`**: O vetor `c` possui os valores `[1, 2, 3, 4, 5]`. Como a contagem dos índices começa em zero (`0 = 1`, `1 = 2`, `2 = 3`), `c[2]` acessa o valor **`3`**.

---

### B. Desmontando o arquivo `03-objeto.html`:

* **`var meuCarro = new Object();`**: Instancia uma nova estrutura de objeto na memória.
* **`meuCarro.modelo = 'Jetta';`**: Cria a propriedade `modelo` dentro de `meuCarro` e guarda nela o texto `'Jetta'`.
* **`document.getElementById('dados').innerHTML += ...`**: Junta o texto fixo do parágrafo com as propriedades do objeto separadas por traços (`-`), resultando em: **"Dados do carro: Volkswagen - Jetta - Azul - 2026"**.

---

### C. Desmontando o arquivo `05-operadores-incrementais.html`:

Entender o que acontece com cada variável é essencial para entender a lógica:

1. **`a = ++a;`**:
* Inicialmente `a = 1`.
* O pré-incremento `++a` aumenta `a` para `2` **imediatamente** e retorna `2`.
* A variável `a` recebe `2`. Resultado exibido: **`2`**.


2. **`b = b++;`** *(Atenção a esta pegadinha de sintaxe!)*:
* Inicialmente `b = 1`.
* O pós-incremento `b++` retorna o valor **atual** (`1`) para a atribuição e agenda o incremento de `b` para depois.
* Porém, a atribuição `= ` sobrescreve `b` com o valor retornado (`1`).
* Como resultado, `b` volta a ser **`1`**. Resultado exibido: **`1`**.


3. **`d = --d;`**:
* Inicialmente `d = 5`.
* O pré-decremento `--d` subtrai `1` imediatamente, alterando `d` para `4`. Resultado exibido: **`4`**.


4. **O Laço `for (var cont = 1; cont <= 3; cont++)**`:
* A variável `c` inicia valendo `1`.
* **Volta 1:** `cont = 1`. Executa `c = 1 + 1` ➔ `c` vira `2`.
* **Volta 2:** `cont = 2`. Executa `c = 2 + 2` ➔ `c` vira `4`.
* **Volta 3:** `cont = 3`. Executa `c = 4 + 3` ➔ `c` vira `7`.
* **Fim do laço:** `cont` passa para `4`, a condição `4 <= 3` é falsa e o laço encerra.
* Resultado de `c` exibido na tela: **`7`**.



---

## 6. Passo a Passo

### Como Criar e Testar Páginas HTML com JavaScript no Navegador:

1. **Criar a Pasta do Projeto:**
* Abra o VS Code, vá no menu superior: `File > Open Folder`.
* Crie uma pasta chamada `exemploshtml` no seu computador e clique em **Selecionar pasta**.


2. **Criar o Arquivo HTML:**
* No painel esquerdo do VS Code, clique no ícone de *Novo Arquivo*.
* Digite o nome do arquivo incluindo a extensão `.html` (ex: `01-primeira-pagina.html`).


3. **Digitar e Salvar o Código:**
* Insira a estrutura HTML e os blocos `<script>`.
* Pressione `Ctrl + S` para salvar as alterações.


4. **Executar a Página no Navegador:**
* **Opção A (Direta):** Abra a pasta `exemploshtml` no seu Gerenciador de Arquivos do Windows e dê um duplo clique no arquivo `.html`. Ele abrirá automaticamente no seu navegador padrão (Chrome, Edge, Firefox).
* **Opção B (Recomendada via VS Code):** Instale a extensão **Live Server** no VS Code, clique com o botão direito dentro do arquivo `.html` e selecione **Open with Live Server**. A página abrirá no navegador e atualizará automaticamente a cada novo salvamento.



---

## 7. Tabelas Comparativas

### Atribuição Simples vs. Atribuição com Adição (DOM)

| Comando | Estado do Parágrafo `<p id="t">Texto Inicial</p>` | Resultado Final Exibido na Tela |
| --- | --- | --- |
| `document.getElementById('t').innerHTML = ' Novo';` | Apaga o conteúdo antigo e coloca apenas o novo. | `Novo` |
| `document.getElementById('t').innerHTML += ' Novo';` | Preserva o conteúdo antigo e anexa o novo no final. | `Texto Inicial Novo` |

---

### Tipos de Dados em Exibição HTML

| Variável | Valor Atribuído | O que é exibido pelo `.innerHTML` | Tipo no JavaScript |
| --- | --- | --- | --- |
| `var a;` | *Nenhum* | `undefined` | `Undefined` |
| `var b = 1;` | `1` | `1` | `Number` |
| `var c = [1,2,3];` | `[1,2,3]` | `1,2,3` *(Convertido para String)* | `Array` (Object) |
| `var f = false;` | `false` | `false` | `Boolean` |
| `var g = null;` | `null` | `null` | `Null` |

---

## 8. Erros Comuns e Cuidados

### 1. Tags HTML e Atributos "Colados" sem Espaço

* **Incorreto:** `<!DOCTYPEhtml>`, `<htmllang="pt-br">`, `<pid="texto"></p>`
* **Correto:** `<!DOCTYPE html>`, `<html lang="pt-br">`, `<p id="texto"></p>`
* **Motivo:** O interpretador do navegador precisa do espaço para distinguir o nome da tag dos seus atributos.

### 2. Palavras-Chave do JavaScript "Coladas" no Nome da Variável

* **Incorreto:** `vara = 1;`, `varmeuCarro = ...`, `vard = ['Verde'];`
* **Correto:** `var a = 1;`, `var meuCarro = ...`, `var d = ['Verde'];`
* **Motivo:** O JavaScript entende `vara` como um único identificador não declarado, gerando um erro de execução (`ReferenceError`).

### 3. A Armadilha de Reatribuir o Pós-Incremento (`b = b++`)

* **Código Problemático:** `var b = 1; b = b++;`
* **O que acontece:** O incremento pós-fixado agenda o aumento de `b` para **depois** da atribuição, mas a atribuição substitui a variável com o valor original imediatamente.
* **Forma Correta de Apenas Incrementar:** Use apenas `b++;` ou `b = b + 1;` sem reatribuir `b = b++`.

### 4. Confusão sobre a Posição dos Índices em Arrays

* **Sintoma:** Escrever `c[2]` achando que vai acessar o segundo elemento.
* **Realidade:** `c[2]` acessa o **terceiro** elemento do array, pois a contagem começa em `0` (`0` é o 1º, `1` é o 2º, `2` é o 3º).

---

## 9. Correções Técnicas das Minhas Anotações

Foram corrigidos silenciosamente nos blocos de código e explicados os seguintes itens:

1. **Espaçamento de Tags HTML e Metadados:** Todas as tags HTML coladas (como `<!DOCTYPEhtml>` e `<metacharset="utf-8">`) foram corrigidas para a sintaxe padrão com espaços apropriados (`<!DOCTYPE html>` e `<meta charset="utf-8">`).
2. **Espaçamento de Variáveis JavaScript:** Corrigidas declarações como `vara`, `varb`, `varmeuCarro` para `var a`, `var b`, `var meuCarro`.
3. **Comentário de Posição de Array:** Nas anotações originais estava escrito `c[2]; //Representa a segunda posição do vetor`. Tecnicamente, no padrão de contagem humana, o elemento do índice `2` é o **terceiro** valor contido no vetor. O comentário foi atualizado para evitar confusão conceitual.
4. **Ortografia de Nomes de Marca:** Corrigida a grafia de `'Volkswagem'` para o nome correto `'Volkswagen'`.

---

## 10. Aprofundamento e Boas Práticas

### A. Objeto Literal vs. `new Object()`

Nas anotações da aula, criamos o objeto utilizando a sintaxe construtora antiga:

```javascript
var meuCarro = new Object();
meuCarro.fabrica = 'Volkswagen';
meuCarro.modelo = 'Jetta';

```

No desenvolvimento moderno, prioriza-se o uso de **Objetos Literais**, que usam chaves `{}`. É uma sintaxe mais limpa, rápida e legível:

```javascript
const meuCarro = {
    fabrica: 'Volkswagen',
    modelo: 'Jetta',
    cor: 'Azul',
    ano: 2026
};

```

### B. Onde Posicionar a Tag `<script>` no HTML?

Colocar o `<script>` no início do arquivo (dentro do `<head>`) pode gerar um erro se o script tentar acessar um elemento HTML que **ainda não foi desenhado na tela** pelo navegador.

Por isso, existem duas boas práticas principais:

1. **Colocar a tag `<script>` no final do `<body>`:** Como o navegador lê o arquivo de cima para baixo, quando ele chegar no script, todos os elementos HTML já estarão carregados na memória DOM.
2. **Usar o atributo `defer` na tag do `<head>`:**

```html
   <script src="script.js" defer></script>
   

```

Isso instrui o navegador a baixar o script em segundo plano e executá-lo somente após a montagem completa da árvore HTML.

---

## 11. Resumo Relâmpago — 10 Linhas

1. O HTML estrutura a página web, enquanto o JavaScript manipula esses elementos dinamicamente.
2. A tag `<script>` insere código JavaScript diretamente dentro de arquivos `.html`.
3. O atributo `id` funciona como o identificador único de um elemento HTML para ser encontrado pelo JavaScript.
4. O método `document.getElementById('id')` seleciona um elemento do DOM através do seu identificador.
5. A propriedade `.innerHTML` permite alterar ou ler o texto e tags presentes dentro de um elemento HTML.
6. O operador `+=` anexa novos dados ao conteúdo já existente na propriedade `innerHTML`.
7. Variáveis declaradas sem valor inicial assumem o tipo padrão `undefined`.
8. O acesso a elementos de um Array utiliza índices iniciados em zero (ex: `array[0]` é o primeiro elemento).
9. Objetos agrupam atributos e podem ser construídos dinamicamente adicionando propriedades após a criação.
10. O pré-incremento (`++a`) altera o valor antes da instrução, enquanto o pós-incremento (`a++`) altera depois.

---

## 12. Guia Rápido de Memorização

* **Selecionar Elemento por ID:** `document.getElementById('nomeDoId')`
* **Alterar Conteúdo HTML:** `elemento.innerHTML = 'Novo Texto';`
* **Anexar Conteúdo ao Existente:** `elemento.innerHTML += ' Texto Extra';`
* **Primeiro Item de um Array:** `lista[0]`
* **Acessar Propriedade de Objeto:** `objeto.propriedade` ou `objeto['propriedade']`
* **Pré-incremento:** `++x` *(soma 1 imediatamente)*
* **Pós-incremento:** `x++` *(disponibiliza o valor atual e soma 1 em seguida)*
* **Criar Objeto Literal (Boa Prática):** `const obj = { chave: 'valor' };`
