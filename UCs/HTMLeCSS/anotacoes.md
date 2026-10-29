# Projeto Biblioteca Senac: Interface Web Integrada, CSS Grid para Calendários e Estrutura de Modais

---

## 1. Visão Geral

Nesta aula, desenvolvi a estrutura completa de front-end para a landing page da **Biblioteca Senac Tatuapé**. O objetivo foi construir um portal moderno que agrupa recursos disponíveis, agenda de atividades interativa, sistema de recomendação de livros e agendamento de espaços.

Aprendi a utilizar o **CSS Grid** para criar layouts bidimensionais complexos (como a grade de um calendário com 7 colunas para os dias da semana) e a estruturar um **Modal (janela flutuante/sobreposta)** em HTML e CSS, deixando a página 100% preparada para receber a lógica dinâmica em JavaScript que será implementada na próxima etapa.

---

## 2. Entendendo o Conceito

### O que é um Modal e como funciona o CSS Grid em Calendários?

* **Conceito simples**:
* O **Modal** é como uma "janela pop-up" interna que aparece por cima do site sem recarregar a página, escurecendo o fundo para chamar a atenção do usuário para um detalhe específico.
* O **CSS Grid** funciona como uma tabela matemática invisível onde conseguimos definir exatamente quantas colunas queremos na tela (por exemplo, 7 colunas para os 7 dias da semana em um calendário).


* **Definição técnica**:
* O Modal utiliza posicionamento fixo (`position: fixed`) com coordenadas cobrindo toda a janela (`top: 0`, `left: 0`, `width: 100%`, `height: 100%`) e um `z-index` elevado para se sobrepor à camada do documento.
* O CSS Grid habilita o modelo de layout bidimensional através de `display: grid`, organizando os elementos filhos através de regras de linhas e colunas com a função `repeat(7, 1fr)`.


* **Analogia**: Pense no Modal como colocar um **cartão impresso de aviso** sobre a página de um livro. O livro continua lá embaixo, mas a sua atenção fica totalmente presa ao cartão sobreposto até que você o feche.

```
┌─────────────────────────────────────────────────────────────────┐
│ HEADER: Logo + Título + Menu de Navegação Flexbox                │
├─────────────────────────────────────────────────────────────────┤
│ SECTION: Recursos (Lista de Livros, Jogos, Computadores)        │
├─────────────────────────────────────────────────────────────────┤
│ SECTION: Agenda (Grade CSS Grid de 7 Colunas para o Calendário)  │
│ ┌────┬────┬────┬────┬────┬────┬────┐                            │
│ │Dom │Seg │Ter │Qua │Qui │Sex │Sáb │                            │
│ ├────┼────┼────┼────┼────┼────┼────┤                            │
│ │ 01 │ 02 │ 03 │ 04 │ 05 │ 06 │ 07 │                            │
│ └────┴────┴────┴────┴────┴────┴────┘                            │
├─────────────────────────────────────────────────────────────────┤
│ MODAL SOBREPOSTO (position: fixed + z-index: 1000)               │
│ ┌─────────────────────────────────────────────────────────────┐ │
│ │ [X] Título do Evento                                        │ │
│ │ Data: 15/03/2027                                            │ │
│ │ Descrição do evento detalhado aqui...                       │ │
│ └─────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘

```

---

## 3. Conceitos Fundamentais

### 3.1. Estrutura do Modal em HTML5

Para criar uma caixa de diálogo sobreposta, dividimos a estrutura em duas partes principais:

1. **Container de Fundo (`.modal`)**: Responsável por cobrir toda a tela com um fundo semitransparente escuro (`background: rgba(0, 0, 0, 0.5)`).
2. **Conteúdo do Modal (`.modal-content`)**: A caixa branca centralizada contendo os dados, o botão de fechar (`<span class="close">&times;</span>`) e os textos dinâmicos.

### 3.2. Configuração de Calendário com CSS Grid

* `display: grid`: Ativa o modelo de grade de duas dimensões.
* `grid-template-columns: repeat(7, 1fr)`: Cria automaticamente 7 colunas de largura rigorosamente igual (`1fr` = 1 fração do espaço disponível).
* `gap: 5px`: Define o espaçamento uniforme entre os dias do calendário.

### 3.3. Preparação para Injeção Dinâmica via JavaScript (IDs de Gancho)

Para permitir que o JavaScript insira eventos e manipule dados futuramente, inseri identificadores únicos (`id`):

* `id="calendar"`: Onde a grade de dias do mês será renderizada.
* `id="modal-titulo"`, `id="modal-data"`, `id="modal-descricao"`: Onde os dados do evento clicado serão preenchidos pelo JS.
* `id="form-indicacao"` e `id="lista-indicacoes"`: Para capturar e listar livros indicados pelos usuários.

---

## 4. Código / Exemplos Práticos

Abaixo estão os arquivos corrigidos e validados do projeto na pasta `bibliotecasenac`.

### Arquivo 1: `bibliotecasenac.html`

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca Senac Tatuapé</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <!-- Cabeçalho Principal -->
    <header>
        <div class="logo-container">
            <img src="logo_senac.png" alt="Logo do Senac">
            <h1>Biblioteca Senac Tatuapé</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#recursos">Recursos</a></li>
                <li><a href="#agenda">Agenda</a></li>
                <li><a href="#indicacoes">Indicações</a></li>
                <li><a href="#agendamento">Agendamento</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <!-- Seção de Recursos -->
        <section id="recursos">
            <h2>Recursos Disponíveis</h2>
            <ul>
                <li>Livros</li>
                <li>Jogos e videogame</li>
                <li>Jogos de tabuleiro</li>
                <li>Computadores para uso dos alunos</li>
            </ul>
        </section>

        <!-- Seção de Agenda de Atividades -->
        <section id="agenda">
            <h2>Agenda de Atividades - 2027</h2>
            <div id="calendar"></div>
        </section>

        <!-- Estrutura do Modal (Janela Flutuante) -->
        <div id="modal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="fecharModal()">&times;</span>
                <h2 id="modal-titulo"></h2>
                <p><strong>Data: </strong><span id="modal-data"></span></p>
                <p id="modal-descricao"></p>
            </div>
        </div>

        <!-- Seção de Indicações de Livros -->
        <section id="indicacoes">
            <h2>Indique um livro</h2>
            <form id="form-indicacao">
                <label for="nome">Seu Nome:</label>
                <input type="text" id="nome" required>

                <label for="livro">Título do livro:</label>
                <input type="text" id="livro" required>

                <button type="submit">Enviar</button>
            </form>

            <h3>Indicações recebidas</h3>
            <ul id="lista-indicacoes"></ul>
        </section>

        <!-- Seção de Agendamento -->
        <section id="agendamento">
            <h2>Agendamento de Espaço</h2>
            <p>O espaço pode ser reservado para atividades das turmas da unidade Tatuapé.</p>
            <button onclick="alert('Entre em contato com a biblioteca!')">Agendar</button>
        </section>
    </main>

    <!-- Rodapé -->
    <footer>
        <p>&copy; 2027 Biblioteca Senac Tatuapé</p>
    </footer>

    <!-- Arquivo de Lógica JavaScript -->
    <script src="script.js"></script>
</body>
</html>

```

---

### Arquivo 2: `style.css`

```css
/* Configuração Global */
body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    background-color: #f5f5f5;
    color: #333;
}

/* Cabeçalho da Página */
header {
    background-color: #ffffff;
    color: #004080;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.logo-container {
    display: flex;
    align-items: center;
    gap: 15px;
}

header img {
    width: 60px;
    height: auto;
}

/* Navegação */
nav ul {
    list-style: none;
    display: flex;
    gap: 15px;
    margin: 0;
    padding: 0;
}

nav a {
    color: #004080;
    text-decoration: none;
    font-weight: bold;
}

nav a:hover {
    text-decoration: underline;
}

/* Seções Principais */
section {
    padding: 20px;
    background-color: #ffffff;
    margin: 15px;
    border-radius: 8px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

button {
    background-color: #004080;
    color: #ffffff;
    border: none;
    padding: 10px 16px;
    border-radius: 6px;
    cursor: pointer;
}

button:hover {
    background-color: #002b55;
}

/* Estilização da Área do Calendário */
#calendar {
    padding: 15px;
    background-color: #eeeefd;
    border-radius: 8px;
}

.cal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

/* Grade de 7 Colunas para os Dias da Semana */
.cal-grid {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 5px;
}

.cal-dia {
    padding: 10px;
    background-color: #ffffff;
    border: 1px solid #ccc;
    text-align: center;
    border-radius: 4px;
}

.cal-dia.semana {
    font-weight: bold;
    background-color: #004080;
    color: #ffffff;
}

.cal-dia.evento {
    background-color: #ffeb3b;
    font-weight: bold;
    cursor: pointer;
}

.cal-dia.vazio {
    background-color: transparent;
    border: none;
}

/* ESTILIZAÇÃO DO MODAL (SOBREPOSIÇÃO) */
.modal {
    display: none;             /* Oculto por padrão até ser ativado pelo JS */
    position: fixed;           /* Fixo em relação à janela do navegador */
    z-index: 1000;            /* Garante que fique por cima de todos os elementos */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Fundo escuro transparente */
}

.modal-content {
    background-color: #ffffff;
    margin: 10% auto;
    padding: 20px;
    border-radius: 8px;
    width: 90%;
    max-width: 500px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.close {
    float: right;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover {
    color: #red;
}

/* Rodapé */
footer {
    text-align: center;
    padding: 15px;
    background-color: #004080;
    color: #ffffff;
    margin-top: 20px;
}

```

---

## 5. Desmontando o Código

### Análise da Estrutura do Modal (`.modal` e `.modal-content`)

* `display: none;`:
* *O que faz*: Oculta a janela completamente do fluxo de tela no carregamento inicial da página.
* *Por que está ali*: O modal só deve se tornar visível (`display: block`) quando o usuário clicar em uma data com evento na agenda via script JavaScript.


* `position: fixed; top: 0; left: 0; width: 100%; height: 100%;`:
* *O que faz*: Trava a div de fundo na tela inteira do navegador, independentemente da rolagem da página.


* `z-index: 1000;`:
* *O que faz*: Define a profundidade do elemento na pilha de camadas. O valor 1000 garante que ele sobreponha cabeçalhos, botões e imagens.


* `background-color: rgba(0, 0, 0, 0.5);`:
* *O que faz*: O valor `rgba` define as cores Vermelho (0), Verde (0), Azul (0) e a opacidade Alpha em `0.5` (50% de transparência). Cria a cortina de sombra ao redor da caixa branca.



### Análise do Calendário em CSS Grid (`.cal-grid`)

* `display: grid;`:
* *O que faz*: Habilita o contexto de grid no container da agenda.


* `grid-template-columns: repeat(7, 1fr);`:
* *O que faz*: Divide a largura total disponível do calendário em **7 colunas idênticas**. É o padrão perfeito para mapear os dias da semana (Domingo a Sábado).



---

## 6. Passo a Passo: Configuração do Projeto no VS Code

1. **Criar a pasta do projeto**:
* Crie a pasta `bibliotecasenac` e abra-a no Visual Studio Code.


2. **Adicionar os ativos visuais**:
* Baixe a imagem da logo do Senac, renomeie o arquivo para `logo_senac.png` e salve-o diretamente na pasta do projeto.


3. **Criar os arquivos de código**:
* Crie o arquivo de marcação `bibliotecasenac.html`.
* Crie a folha de estilos `style.css`.
* Crie um arquivo em branco chamado `script.js` (que receberá o código das funções de evento e preenchimento dinâmico posteriormente).


4. **Validar as conexões**:
* No `<head>` de `bibliotecasenac.html`, confirme o vínculo do CSS via `<link rel="stylesheet" href="style.css">`.
* Antes do fechamento de `</body>`, confirme o vínculo do script via `<script src="script.js"></script>`.



---

## 7. Tabelas Comparativas

### Tabela 1: Modelos de Layout no CSS (Grid vs. Flexbox)

| Critério | CSS Grid (`display: grid`) | CSS Flexbox (`display: flex`) |
| --- | --- | --- |
| **Dimensão de Layout** | **2D (Bidimensional)**: Controla linhas e colunas ao mesmo tempo. | **1D (Unidimensional)**: Controla o alinhamento em linha OU em coluna. |
| **Direcionamento do Design** | *Grid-first* (Ideal para criar a estrutura antes do conteúdo). | *Content-first* (Ideal para alinhar elementos dinâmicos). |
| **Melhor Aplicação no Projeto** | Montar a grade de 7 colunas do calendário (`.cal-grid`). | Alinhar os links da barra de navegação (`nav ul`) e cabeçalho (`header`). |

### Tabela 2: Camadas de Exibição no Front-End

| Estrutura | Propriedade CSS Chave | Posição no Documento | Função Principal |
| --- | --- | --- | --- |
| **Fluxo Normal** | `position: static` | Segue a ordem natural das tags HTML. | Exibir blocos de texto, seções e rodapés. |
| **Camada Sobreposta (Modal)** | `position: fixed` + `z-index: 1000` | Flutua fixo acima de todos os elementos da tela. | Exibir avisos e detalhes de eventos sem trocar de página. |

---

## 8. Erros Comuns e Cuidados

1. **Confundir a propriedade de exibição CSS `display` com o valor de alinhamento Flexbox**:
* ❌ *Incorreto*: `header { display: space-between; }` (`space-between` não é um tipo válido de `display`).
* ✔️ *Correto*: `header { display: flex; justify-content: space-between; align-items: center; }`.


2. **Utilizar o atributo incorreto em rótulos de formulário (`<label>`)**:
* ❌ *Incorreto*: `<label form="nome">Seu Nome:</label>`
* ✔️ *Correto*: `<label for="nome">Seu Nome:</label>` (O atributo correto para associar o rótulo ao `id` do input é `for`).


3. **Esquecer o `z-index` na declaração de Modais**:
* Se o `.modal` não tiver um `z-index` maior do que os outros elementos da página com `position: relative` ou `fixed`, o conteúdo da página poderá vazar e cobrir o modal.



---

## 9. Correções Técnicas das Minhas Anotações

* **Atributo `for` nos Labels**: No formulário de indicações do arquivo original, o código usava `form="nome"` e `form="livro"`. O atributo padrão W3C para vincular um `<label>` a um `<input>` é `for="id_do_input"`. A correção foi feita diretamente no HTML.
* **Propriedade Inexistente em `header**`: No arquivo CSS original, constava a linha `display: space-between;`. Ajustei para o padrão correto de Flexbox: `display: flex; justify-content: space-between; align-items: center;`.
* **Organização do Cabeçalho**: Agrupei a imagem e o título `<h1>` em uma div container (`.logo-container`) para que a imagem do Senac e o texto fiquem perfeitamente alinhados na horizontal.

---

## 10. Aprofundamento e Boas Práticas (Conteúdo Complementar)

### Preparando o DOM para o JavaScript

Nesta aula, construímos a base de marcação HTML e os estilos CSS. Para que o JavaScript funcione na próxima etapa, garantimos que os elementos possuam **IDs exclusivos** onde a manipulação de DOM acontecerá:

* `document.getElementById('calendar')`: Onde o JS irá criar as divs dos dias via laço de repetição (`loop`).
* `document.getElementById('modal')`: Onde o JS vai alterar a propriedade estilo de `display: none` para `display: block`.
* `fecharModal()`: Função que será declarada no arquivo `script.js` para reverter o modal para `display: none`.

---

## 11. Guia Rápido de Memorização

* **Criar Calendário de 7 Colunas**: `.grade { display: grid; grid-template-columns: repeat(7, 1fr); gap: 5px; }`
* **Criar Fundo de Modal**: `.modal { display: none; position: fixed; z-index: 1000; width: 100%; height: 100%; background: rgba(0,0,0,0.5); }`
* **Vincular Label ao Input**: `<label for="campo-id">` com `<input id="campo-id">`
* **Botão de Fechar Modal (Símbolo X)**: `<span class="close">&times;</span>`
* **Limpar Margens Globais**: `body { margin: 0; font-family: Arial, sans-serif; }`

---

## 12. Resumo Relâmpago — 10 Linhas

1. O projeto da Biblioteca Senac integra recursos semânticos do HTML5 com layouts modernos em CSS.
2. O CSS Grid é ativado com `display: grid` e é o modelo ideal para organizar a estrutura bidimensional do calendário.
3. A regra `grid-template-columns: repeat(7, 1fr)` divide o contêiner em 7 colunas iguais para os dias da semana.
4. Um Modal é uma estrutura sobreposta usada para exibir avisos e detalhes sem redirecionar o usuário.
5. O Modal permanece oculto com `display: none` até ser disparado por uma ação ou clique do usuário.
6. A propriedade `position: fixed` com `z-index: 1000` fixa o modal por cima de todos os elementos visíveis do site.
7. A cortina escura do modal é criada usando a função de cor com transparência `rgba(0, 0, 0, 0.5)`.
8. O atributo `for` do elemento `<label>` deve ser idêntico ao `id` do `<input>` correspondente para fins de acessibilidade.
9. A propriedade `justify-content: space-between` no Flexbox alinha a marca/logo de um lado e o menu do outro.
10. O HTML e o CSS fornecem a estrutura e os identificadores (`id`) que serão manipulados dynamicamente pelo JavaScript.
