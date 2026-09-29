# Animações no DOM com Temporizadores (`setInterval`/`clearInterval`) e Eventos de Mouse (`onmousedown`/`onmouseup`)

---

**Visão Geral**

Nesta aula, dei um passo importante na manipulação avançada do **DOM (Document Object Model)**. Aprendi a criar **animações dinâmicas via código** utilizando temporizadores em JavaScript, além de responder a interações físicas do usuário na tela através de **eventos de clique e pressão do mouse**.

* **O que é:** * *Temporizadores (`setInterval`/`clearInterval`):* Funções nativas que executam um bloco de código repetidamente em intervalos fixos de tempo (em milissegundos).
* *Eventos de Mouse (`onmousedown`/`onmouseup`):* Eventos do DOM disparados exatamente no momento em que o usuário pressiona ou solta o botão do mouse.


* **Para que serve:** * Criar efeitos visuais, jogos, banners animados e contadores na tela.
* Alterar elementos visuais (como trocar uma imagem ou mudar cores) enquanto o usuário mantém o botão do mouse pressionado.


* **Por que é importante:** A Web moderna é rica em microinterações e elementos visuais responsivos. Saber manipular estilos e atributos dinamicamente em relação ao tempo e ao comportamento do mouse torna nossas páginas vivas e atraentes.
* **Ideia principal da aula:** Entender a relação indispensável entre o **CSS (`position: relative` / `position: absolute`)** e o **JavaScript (`element.style.top` / `element.style.left`)** para mover objetos na tela, controlar o ciclo de execução de temporizadores com `clearInterval()` e trocar atributos HTML (`src`) em tempo de execução.

---

**Entendendo o Conceito**

**Como Funciona a Animação por Código?**

Uma animação em tela nada mais é do que uma **sequência de fotos paradas exibidas rapidamente**, onde a posição do elemento muda ligeiramente a cada quadro (*frame*).

```
   [ Posição: 0px ] ──► (Espera 5ms) ──► [ Posição: 1px ] ──► (Espera 5ms) ──► [ Posição: 2px ] ...

```

1. Definimos o ponto de partida (`posicao = 0`).
2. O `setInterval()` dispara uma função de deslocamento a cada X milissegundos.
3. A função incrementa a variável (`posicao++`) e aplica o novo valor no CSS do elemento (`elemento.style.top = posicao + 'px'`).
4. Quando atinge o limite do contêiner, o `clearInterval()` cancela o temporizador para interromper o movimento.

---

## Eventos de Clique Continuado (`mousedown` vs `mouseup`)

Diferente do evento `onclick` (que só dispara quando o clique é completo — apertar + soltar), dividimos essa ação em duas etapas:

* **`onmousedown`:** Dispara no exato milissegundo em que o botão do mouse é **pressionado** para baixo.
* **`onmouseup`:** Dispara no exato momento em que o botão do mouse é **solto**.

```
[ Pressionou o botão ] ──► Evento onmousedown  ──► [ Executa Acende() / Carro1() ]
[ Soltou o botão ]     ──► Evento onmouseup    ──► [ Executa Apaga() / Carro2() ]

```

> Analogia do Cotidiano

* **Animação com Temporizador:** Pense em uma **esteira rolante com um cronômetro de precisão**. A cada bipe do relógio (`setInterval`), a esteira anda 1 milímetro. Quando o pacote chega ao fim da esteira (`limite == 350`), o sensor desliga o motor (`clearInterval`).
* **Eventos `mousedown`/`mouseup`:** Pense na **campainha de uma casa ou na buzina de um carro**. Enquanto você mantém a mão pressionando o botão (`mousedown`), o som toca/a luz acende. No momento em que você tira o dedo (`mouseup`), o som para/a luz apaga.

---

## Conceitos Fundamentais

**O Papel do CSS no Movimento com JS**

Para que o JavaScript consiga mover um elemento usando as propriedades `style.top` e `style.left`, a estrutura do CSS **deve obrigatoriamente** definir o posicionamento:

* **Contêiner Pai (`#quadrado`):** Deve ter `position: relative`. Ele serve como o mapa/fronteira de referência.
* **Elemento Filho (`#bola`):** Deve ter `position: absolute`. Isso permite que ele flutue e se desloque livremente dentro dos limites do pai a partir das coordenadas `top` (topo) e `left` (esquerda).

---

**Os Métodos de Temporização**

**`setInterval(funcao, tempoEmMs)`**

Executa a função passada repetidamente a cada intervalo de tempo especificado em milissegundos ($1 \text{ segundo} = 1000 \text{ ms}$). Retorna um número identificador (**ID**) do temporizador.

```javascript
let id = setInterval(Local, 5); // Executa a função Local() a cada 5 milissegundos

```

**`clearInterval(idDoTemporizador)`**

Interrompe e cancela a execução do temporizador associado ao ID informado. É essencial para impedir que o elemento continue se movendo infinitamente para fora da tela.

---

**Manipulação de Atributos com o DOM (`.src`)**

Podemos alterar qualquer atributo de uma tag HTML diretamente via JavaScript. Para trocar o caminho de uma imagem dinamizada por eventos de mouse, basta reatribuir a propriedade `.src` do elemento capturado:

```javascript
document.getElementById('lampada').src = 'luz-acesa.gif';

```

---

### Código / Exemplos Práticos

**Exemplo 1: Animação Diagonal Simples (`animacao-simples.html`)**

Animação onde uma bola desliza na diagonal do canto superior esquerdo $(0,0)$ até o limite inferior direito $(350,350)$ do quadrado.

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de DOM - Animação Simples</title>
    <style>
        #quadrado {
            width: 400px;
            height: 400px;
            position: relative; /* Define o limite para o elemento filho */
            background-color: #F5DEB3;
            border: 1px solid #333;
            border-radius: 30px;
        }

        #bola {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            position: absolute; /* Permite movimentação via top e left */
            background-color: #A52A2A;
            top: 0px;
            left: 0px;
        }
    </style>
</head>
<body>
    <h1>Exemplo de setInterval() e clearInterval()</h1>
    <p><button type="button" onclick="Anima();">Anima</button></p>

    <div id="quadrado">
        <div id="bola"></div>
    </div>

    <script>
        function Anima() {
            let elemento = document.getElementById('bola');
            let posicao = 0;
            
            // Dispara a função Local() a cada 5ms e guarda o ID do timer
            let id = setInterval(Local, 5);

            function Local() {
                // Largura do Quadrado (400px) - Largura da Bola (50px) = 350px (Limite)
                if (posicao >= 350) {
                    clearInterval(id); // Para a animação ao atingir o limite
                } else {
                    posicao++; // Incrementa a posição
                    elemento.style.top = posicao + 'px';  // Move para baixo
                    elemento.style.left = posicao + 'px'; // Move para a direita
                }
            }
        }
    </script>
</body>
</html>

```

---

**Exemplo 2: Interação com Imagem e Eventos de Mouse (`lampada.html`)**

Efeito de acender uma lâmpada ao pressionar o botão do mouse e apagar ao soltar.

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de DOM - Eventos de Mouse</title>
</head>
<body>
    <h1>Eventos onmousedown e onmouseup</h1>

    <img src="luz-apagada.gif" alt="Lâmpada" title="Lâmpada" id="lampada"
         onmousedown="Acende();" onmouseup="Apaga();">

    <p>Clique na lâmpada e mantenha o botão do mouse pressionado.</p>

    <script>
        // Função para acender a lâmpada (disparada ao pressionar o botão)
        function Acende() {
            document.getElementById('lampada').src = 'luz-acesa.gif';
        }

        // Função para apagar a lâmpada (disparada ao soltar o botão)
        function Apaga() {
            document.getElementById('lampada').src = 'luz-apagada.gif';
        }
    </script>
</body>
</html>

```

---

**Exemplo 3: Atividade Prática 1 — Animação com Botões de Ida e Volta**

Aprimoramento da animação adicionando controle completo de ida e retorno da bola ao ponto de origem $(0,0)$.

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de DOM - Atividade Animação Completa</title>
    <style>
        #quadrado {
            width: 400px;
            height: 400px;
            position: relative;
            background-color: #000000;
            border: 1px solid #2f2930;
            border-radius: 30px;
        }

        #bola {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            position: absolute;
            background-color: #4c0d70;
            top: 0px;
            left: 0px;
        }
    </style>
</head>
<body>
    <h1>setInterval() e clearInterval() - Controle de Ida e Volta</h1>
    <p>
        <button type="button" onclick="Anima();">Avançar (Ida)</button>
        <button type="button" onclick="Voltar();">Retornar (Volta)</button>
    </p>

    <div id="quadrado">
        <div id="bola"></div>
    </div>

    <script>
        // Função para mover a bola para frente (Ida)
        function Anima() {
            let elemento = document.getElementById('bola');
            let posicao = 0;
            let id = setInterval(Local, 5);

            function Local() {
                if (posicao >= 350) {
                    clearInterval(id);
                } else {
                    posicao++;
                    elemento.style.top = posicao + 'px';
                    elemento.style.left = posicao + 'px';
                }
            }
        }

        // Função para retornar a bola para a origem (Volta)
        function Voltar() {
            let elemento = document.getElementById('bola');
            let posicao = 350; // Começa na posição máxima
            let id = setInterval(Local, 5);

            function Local() {
                if (posicao <= 0) {
                    clearInterval(id); // Para ao atingir a origem 0px
                } else {
                    posicao--; // Decrementa a posição
                    elemento.style.top = posicao + 'px';
                    elemento.style.left = posicao + 'px';
                }
            }
        }
    </script>
</body>
</html>

```

---

**Exemplo 4: Atividade Prática 2 — Troca de Imagem Dinâmica (Carro)**

Exercício praticando a substituição de imagens dinâmicas sob controle do mouse.

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de DOM - Atividade Troca de Carro</title>
</head>
<body>
    <h1>Atividade: Manipulação de Imagem com Mouse</h1>

    <img src="carro1.jpg" alt="Carro" title="Clique para alterar" id="carro"
         onmousedown="MudaCarro();" onmouseup="RestauraCarro();">

    <p>Clique na imagem do carro e mantenha o mouse pressionado.</p>

    <script>
        // Exibe a imagem secundária enquanto pressionado
        function MudaCarro() {
            document.getElementById('carro').src = 'carro2.jpg';
        }

        // Restaura a imagem original ao soltar o botão
        function RestauraCarro() {
            document.getElementById('carro').src = 'carro1.jpg';
        }
    </script>
</body>
</html>

```

---

**Desmontando o Código**

**Desmontando o Cálculo de Limite da Animação: `posicao == 350`**

Por que o limite é $350\text{px}$ e não $400\text{px}$ (largura do quadrado)?

$$\text{Espaço Livre Múltiplo} = \text{Largura do Contêiner} - \text{Largura do Elemento}$$

$$\text{Espaço Livre Múltiplo} = 400\text{px} - 50\text{px} = 350\text{px}$$

Se permitíssemos `posicao` chegar a $400\text{px}$, a bola ultrapassaria e sairia para fora da borda do quadrado pai!

---

**Desmontando a Concatenação de Unidades CSS: `elemento.style.top = posicao + 'px';`**

O JavaScript manipula valores numéricos puros (ex: `10`, `11`, `12`). No entanto, regras de estilo CSS exigem **unidades de medida** obrigatórias (como `px`, `%`, `rem`).

* Portanto, devemos sempre concatenar o valor numérico com a string `'px'`.
* Sem a inclusão da string `'px'`, a propriedade do CSS simplesmente ignora a instrução e o objeto não se move.

---

**Desmontando a Função Interna (*Closure/Scope*): `setInterval(Local, 5)`**

Reparou que a função `Local()` foi declarada **dentro** da função `Anima()`?

* Isso garante que a função de deslocamento tenha acesso direto às variáveis `elemento`, `posicao` e `id` declaradas na função pai.
* O primeiro parâmetro do `setInterval` recebe apenas o **nome da função** `Local` (sem parênteses `()`). Se colocássemos `Local()`, a função seria executada imediatamente uma única vez, em vez de ser agendada pelo temporizador.

---

**Passo a Passo: Construindo Animações com DOM e CSS**

```
1. Montar a Estrutura HTML:
   Crie uma <div> pai (caixa) e uma <div> filho (objeto a mover) com IDs únicos.

2. Configurar o Posicionamento CSS:
   Aplique `position: relative` na <div> pai e `position: absolute` com `top: 0` e `left: 0` na <div> filho.

3. Mapear o Elemento no JavaScript:
   Capture a div filho usando `document.getElementById('objeto')`.

4. Inicializar Temporizador:
   Crie uma variável de controle (`posicao = 0`) e chame `let id = setInterval(funcaoCallback, tempoMs)`.

5. Atualizar Posição na Callback:
   A cada ciclo, altere `posicao++` (ou `posicao--`) e injete no CSS com `elemento.style.top = posicao + 'px'`.

6. Validar Ponto de Parada:
   Verifique se atingiu o limite pretendido com `if` e cancele o temporizador imediatamente com `clearInterval(id)`.

```

---

## Tabelas Comparativas

**Eventos de Clique e Mouse no DOM**

| Evento HTML | Quando Dispara? | Exemplo Prático |
| --- | --- | --- |
| **`onclick`** | Ao completar a ação inteira de clicar (pressionar + soltar). | Botões de formulário, links, confirmações. |
| **`onmousedown`** | No exato milissegundo em que o botão do mouse é **pressionado**. | Mirar em jogos, dar zoom visual, acender luzes. |
| **`onmouseup`** | No exato instante em que o botão do mouse é **solto**. | Soltar itens arrastados (*Drag & Drop*), apagar luzes. |

---

**Temporizadores em JavaScript**

| Método | Funcionamento | Como Interromper? |
| --- | --- | --- |
| **`setInterval(fn, ms)`** | Executa a função **repetidamente em loop** a cada intervalo de tempo. | `clearInterval(id)` |
| **`setTimeout(fn, ms)`** | Executa a função **uma única vez** após aguardar o tempo estipulado. | `clearTimeout(id)` |

---

## Erros Comuns e Cuidados

**Erro de Digitação no Nome do Método de Limpeza (`clearInterfal`)**

* **Incorreto:** `clearInterfal(id);`
* **Correto:** `clearInterval(id);`
* **Sintoma:** O navegador lança um erro `Uncaught TypeError: clearInterfal is not a function` e a animação **não para nunca**, ultrapassando as bordas da página.

**Esquecer de Definir `position: absolute` no CSS**

* **Sintoma:** O código executa, a variável `posicao` incrementa, mas a bola continua parada no canto da tela.
* **Motivo:** No CSS, as propriedades `top`, `bottom`, `left` e `right` são **completamente ignoradas** em elementos com posicionamento padrão (`position: static`).

**Escrever Parênteses no Parâmetro do `setInterval`**

* **Incorreto:** `setInterval(Local(), 5);`
* **Correto:** `setInterval(Local, 5);`
* **Motivo:** Passar `Local()` executa a função uma vez no ato e entrega o seu *retorno* para o temporizador. Passar apenas `Local` envia a **referência da função** para que o temporizador a invoque repetidamente a cada 5ms.

**Conectar o Mesmo Evento para Ações Opostas**

* **Incorreto:** No código de troca do carro, atribuir a mesma imagem nos dois eventos ou trocar a ordem de `onmousedown` e `onmouseup`.
* **Correto:** `onmousedown` deve chamar a ação de alteração inicial e `onmouseup` deve obrigatoriamente chamar a ação de restauração.

---

## Aprofundamento e Boas Práticas

**Animações Modernas de Alta Performance: `requestAnimationFrame()`**

Embora o `setInterval()` seja excelente para entender temporizadores na lógica de programação, animações profissionais modernas para navegadores costumam utilizar o método **`requestAnimationFrame()`**.

* **Por que usar `requestAnimationFrame`?**
* O `setInterval(..., 5)` tenta rodar o código rigidamente mesmo se a aba do navegador estiver minimizada, consumindo bateria e processamento à toa.
* O `requestAnimationFrame()` sincroniza os quadros da animação diretamente com a taxa de atualização do monitor do usuário (ex: 60Hz / 120Hz), produzindo movimentos **muito mais suaves** e economizando memória RAM.



```javascript
// Exemplo conceitual moderno com requestAnimationFrame:
function mover() {
    if (posicao < 350) {
        posicao++;
        elemento.style.left = posicao + 'px';
        requestAnimationFrame(mover); // Chama o próximo quadro sincronizado com o monitor
    }
}
requestAnimationFrame(mover);

```

**Separação de Eventos JS do HTML (`addEventListener`)**

Em vez de poluir a tag `<img>` ou `<button>` com atributos HTML inline (`onmousedown="..."`, `onclick="..."`), a boa prática moderna recomenda atribuir os escutadores de eventos (*Event Listeners*) via script:

```javascript
const lampada = document.getElementById('lampada');

// Adiciona os escutadores sem mexer no arquivo HTML
lampada.addEventListener('mousedown', Acende);
lampada.addEventListener('mouseup', Apaga);

```

---

**Resumo Relâmpago**

1. O método `setInterval(funcao, ms)` executa um bloco de código repetidamente em intervalos de tempo fixos.
2. O método `clearInterval(id)` cancela a execução de um temporizador ativo usando seu identificador.
3. Para movimentar elementos via JavaScript, o contêiner deve ser `position: relative` e o elemento `position: absolute`.
4. As coordenadas de deslocamento são aplicadas alterando propriedades do DOM como `style.top` e `style.left`.
5. Valores atribuídos ao CSS pelo JavaScript devem ser sempre concatenados com a unidade de medida `'px'`.
6. O evento `onmousedown` dispara no instante em que o botão do mouse é pressionado para baixo.
7. O evento `onmouseup` dispara no momento em que o botão do mouse é solto pelo usuário.
8. A propriedade `.src` do DOM permite substituir o caminho e o arquivo de uma imagem dinamicamente.
9. Passar parênteses ao definir o nome da callback em `setInterval(Local, 5)` é um erro comum de sintaxe.
10. O cálculo de limites de animação deve considerar a largura total do contêiner menos a largura do elemento animado.

---

## Guia Rápido de Memorização

* **Iniciar Temporizador:** `let id = setInterval(nomeFuncao, tempoEmMs);`
* **Parar Temporizador:** `clearInterval(id);`
* **Mover Elemento para Baixo:** `elemento.style.top = posicao + 'px';`
* **Mover Elemento para Direita:** `elemento.style.left = posicao + 'px';`
* **Pressionar Botão do Mouse:** `onmousedown="Funcao()"`
* **Soltar Botão do Mouse:** `onmouseup="Funcao()"`
* **Trocar Imagem via DOM:** `document.getElementById('id').src = 'nova-imagem.jpg';`
* **CSS Obrigatório para Animação:**

```css
  #conteiner { position: relative; }
  #objetoAnimado { position: absolute; top: 0px; left: 0px; }

```
