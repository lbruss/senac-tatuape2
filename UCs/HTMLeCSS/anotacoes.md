# Menus Off-Canvas Interativos e Tabelas Avançadas em HTML5 e CSS3

---

## 1. Visão Geral

Nesta aula, avancei para técnicas mais complexas de UI (Interface do Usuário) e estruturação de dados. Explorei a criação de **menus suspensos e gavetas laterais (Off-Canvas)** utilizando exclusivamente HTML5 e CSS3 puro, sem a necessidade de JavaScript para controlar animações ou visibilidade.

Além disso, aprofundei o trabalho com **tabelas complexas**, aprendendo a combinar mesclagens horizontais (`colspan`) e verticais (`rowspan`) com mídias, hiperlinks externos, favicons e metadados de SEO On-Page.

Compreendi dois conceitos práticos fundamentais:

1. **Menu Off-Canvas**: Uma barra de navegação que fica escondida fora da área visível da tela (`left: -60vw`) e desliza suavemente para dentro quando o usuário passa o mouse (`:hover`) sobre o item correspondente, utilizando a propriedade `transition`.
2. **SEO e Identidade Visual em Tabelas**: Como preparar uma página estruturada em tabela para motores de busca usando meta tags (`description`, `keywords`), associando um favicon (`<link rel="icon">`) e aplicando estilos customizados via CSS externo.

---

## 2. Entendendo o Conceito

### Menus Off-Canvas e Unidades Viewport

* **Conceito simples**: Um menu Off-Canvas é como uma gaveta secreta na lateral do site. Ela fica recolhida para fora da tela e só aparece quando você precisa dela.
* **Definição técnica**: É um padrão de navegação onde o contêiner de menu é posicionado de forma fixa (`position: fixed`) fora da janela de exibição (*viewport*) com coordenadas negativas (`left: -60vw`). Ao disparar o estado `:hover` no elemento pai, a coordenada é alterada para `left: 0`, e o CSS interpola o movimento ao longo do tempo especificado na propriedade `transition`.
* **Analogia**: Pense na porta de correr de um guarda-roupa planejado. A porta fica guardada no canto; quando você puxa o puxador (passa o mouse), ela desliza suavemente sobre o trilho até cobrir o espaço desejado.

```
┌─────────────────────────────────────────────────────────────┐
│ FORA DA TELA (left: -60vw)  │  TELA VISÍVEL DO NAVEGADOR     │
│ ┌─────────────────────────┐ │ ┌───────────────────────────┐ │
│ │  sidebar (Menu)         │ │ │ .main (100vw x 100vh)     │ │
│ │  - Item a.1             │ │ │ [Item A] [Item B] [Item C]│ │
│ │  - Item a.2             │ │ │                           │ │
│ └─────────────────────────┘ │ └───────────────────────────┘ │
└─────────────────────────────┴───────────────────────────────┘
            │                               │
            └──────── Passar o Mouse ───────┘
                      (left: 0) -> Desliza para a direita

```

---

## 3. Conceitos Fundamentais

### 3.1. Unidades de Medida Relativas ao Viewport (`vw` e `vh`)

* `1vw` (Viewport Width): Equivale a 1% da largura total da janela visível do navegador. `100vw` ocupa 100% da largura da tela.
* `1vh` (Viewport Height): Equivale a 1% da altura total da janela visível do navegador. `100vh` faz com que o elemento ocupe exatamente toda a altura da tela.

### 3.2. Transições em CSS (`transition`)

A propriedade `transition` permite definir a animação suave de transição entre dois estados de um elemento (por exemplo, do estado normal para o estado `:hover`).

* **Sintaxe**: `transition: [propriedade] [duração] [função-de-tempo];`
* Exemplo: `transition: left 1s;` faz a coordenada `left` demorar 1 segundo para deslizar da posição original até a nova posição.

### 3.3. Posicionamento Fixo (`position: fixed`)

Aplica o posicionamento do elemento em relação à janela do navegador (*viewport*), desvinculando-o do fluxo comum da página. O elemento permanece parado no mesmo lugar mesmo quando a página é rolada.

### 3.4. Combinador de Filhos Diretos (`>`) e Pseudoclasse `:hover`

* `>`: Garante que o CSS aplique a regra **apenas** nos elementos que são filhos imediatos do pai, sem afetar subníveis aninhados.
* `:hover`: Pseudoclasse acionada no momento exato em que o cursor do mouse é posicionado sobre o elemento.

### 3.5. Meta Tags de SEO e Favicon

* `<meta name="description" content="...">`: Resumo da página lido pelos motores de busca (como o Google) para exibir nos resultados de pesquisa.
* `<meta name="keywords" content="...">`: Palavras-chave relacionadas ao tema do site.
* `<link rel="icon" href="favicon.ico">`: Define o ícone em miniatura exibido na aba/guia do navegador.

---

## 4. Código / Exemplos Práticos

Abaixo estão os códigos desenvolvidos em aula, divididos por pasta e com todas as inconsistências de sintaxe corrigidas.

### Projeto 1: Menu Off-Canvas (Pasta `documento/`)

#### Arquivo: `menu.html`

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menus Interativos e Off-Canvas</title>
    <link rel="stylesheet" href="menus.css">
</head>
<body>
    <div class="main">
        <ul>
            <li>Item A
                <ul class="sidebar">
                    <li>Item a.1</li>
                    <li>Item a.2</li>
                    <li>Item a.3</li>
                    <li>Item a.4</li>
                </ul>
            </li>
            <li>Item B
                <ul>
                    <li>Item b.1</li>
                    <li>Item b.2</li>
                    <li>Item b.3</li>
                    <li>Item b.4</li>
                </ul>
            </li>
            <li>Item C</li>
            <li>Item D</li>
        </ul>
    </div>
</body>
</html>

```

#### Arquivo: `menus.css`

```css
/* Resete básico e definição da família de fontes */
* {
    font-family: Arial, Helvetica, sans-serif;
    box-sizing: border-box;
}

/* Remove marcadores das listas (bolinhas/números) */
ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

/* Configuração da área principal ocupando 100% da tela visível */
.main {
    width: 100vw;
    height: 100vh;
}

/* Organiza os itens do menu principal em linha horizontal com Flexbox */
.main > ul {
    display: flex;
    background-color: #f0f0f0;
}

/* Define que cada item do menu principal ocupe 20% do container pai */
.main > ul > li {
    width: 20%;
    padding: 10px;
    text-align: center;
    cursor: pointer;
}

/* Esconde por padrão as sublistas genéricas */
ul > li > ul {
    display: none;
}

/* Efeito visual de destaque ao passar o mouse no item do menu */
ul > li:hover {
    background-color: #d9caf7;
}

/* Exibe a sublista comum como bloco ao passar o mouse */
ul > li:hover > ul {
    display: block;
    padding-left: 0;
}

/* Configuração dos itens dentro da sublista */
ul > li:hover > ul > li {
    min-height: 1.5rem;
    background-color: #b897f9;
    padding: 5px;
    margin-top: 2px;
}

/* =================================================== */
/* CONFIGURAÇÃO DO MENU LATERAL OFF-CANVAS (SIDEBAR)   */
/* =================================================== */

/* Estado inicial do Sidebar: escondido fora da tela à esquerda */
.main > ul > li > ul.sidebar {
    display: block;
    position: fixed;
    top: 40px;
    left: -60vw;              /* Posiciona o menu 60% da largura da tela para fora */
    width: 60vw;              /* O menu terá 60% de largura quando aberto */
    height: 100vh;
    background-color: #bfa5ed;
    padding: 12px;
    transition: left 1s;      /* Transição suave da propriedade left durante 1 segundo */
}

/* Estado ativo do Sidebar: desliza para a tela ao passar o mouse */
.main > ul > li:hover > ul.sidebar {
    left: 0;                  /* Traz a barra de volta para o canto esquerdo visível */
}

```

---

### Projeto 2: Tabela Linux Estilizada (Pasta `tabelalinux/`)

#### Arquivo: `tabelalinux.html`

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Aqui você encontra conteúdos e comparações referentes ao sistema operacional Linux e suas distribuições.">
    <meta name="keywords" content="linux, ubuntu, opensuse, red hat, debian, sistema operacional">
    
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="estilo.css">

    <title>Tabela Comparativa Linux</title>
</head>
<body>
    <table id="tabela">
        <!-- Cabeçalho Principal com Título e Logo -->
        <tr>
            <td colspan="3">
                <h1>A história do Linux</h1>
            </td>
            <td>
                <a target="_blank" href="https://www.ubuntu.com/">
                    <img src="tux4.png" alt="Mascote Tux do Linux" width="50">
                </a>
            </td>
        </tr>

        <!-- Barra Amarela de Navegação de Distribuições -->
        <tr class="yellow">
            <td><a target="_blank" href="https://ubuntu.com/">UBUNTU</a></td>
            <td><a target="_blank" href="https://www.opensuse.org/">OpenSUSE</a></td>
            <td><a target="_blank" href="https://www.redhat.com/">RED HAT</a></td>
            <td><a target="_blank" href="https://www.debian.org/">DEBIAN</a></td>
        </tr>

        <!-- Linha de Espaçamento -->
        <tr>
            <td colspan="4"><br></td>
        </tr>

        <!-- Seção Central com Imagem Principal e Lista de Distribuições -->
        <tr>
            <td colspan="3" rowspan="4">
                <img src="ubuntu.png" alt="Banner Ubuntu Linux" width="300">
            </td>
            <td><h3>UBUNTU</h3></td>
        </tr>
        <tr>
            <td><h3>RED HAT</h3></td>
        </tr>
        <tr>
            <td><h3>OpenSUSE</h3></td>
        </tr>
        <tr>
            <td><h3>DEBIAN</h3></td>
        </tr>

        <!-- Linhas de Separação e Rodapé -->
        <tr>
            <td class="ouro" colspan="4"><br></td>
        </tr>
        <tr class="yellow">
            <td colspan="4">RODAPÉ INFORMATIVO</td>
        </tr>
        <tr>
            <td class="ouro" colspan="4">
                Desenvolvido por: Bruss Loza
            </td>
        </tr>
    </table>  
</body>
</html>

```

#### Arquivo: `estilo.css`

```css
@charset "UTF-8";

/* Estilização do Fundo do Documento */
body {
    background: url("fundo2.png");
    margin: 0;
    padding: 20px;
}

/* Configuração Principal da Tabela */
table#tabela {
    width: 100%;
    height: 100%;
    border: 2px solid gold;
    border-spacing: 0px;       /* Remove a lacuna entre as bordas das células */
    font-family: 'Comic Sans MS', sans-serif;
    text-align: center;
}

/* Estilo Padrão das Células */
td {
    border: 2px solid gold;
    padding: 5px;              /* Adiciona espaçamento interno nas células */
    vertical-align: middle;
}

/* Estilo das Linhas Amarelas */
tr.yellow {
    background-color: yellow;
    font-family: 'Comic Sans MS', sans-serif;
    font-weight: bold;
}

/* Estilo das Células Douradas / Laranjas */
td.ouro {
    background-color: #ffa500;
    font-family: 'Comic Sans MS', sans-serif;
    font-weight: bold;
    font-size: 12pt;
}

/* Estilização do Título Principal */
h1 {
    text-align: center;
    font-family: 'Comic Sans MS', sans-serif;
    color: #ffffff;
}

/* Efeito Hover nos Links da Barra Amarela */
tr.yellow a {
    color: black;
    text-decoration: none;
}

tr.yellow a:hover {
    color: red;
    text-decoration: underline;
}

```

---

## 5. Desmontando o Código

### Análise do Menu Off-Canvas (`menus.css`)

* `.main > ul > li > ul.sidebar`:
* `position: fixed`: Retira o menu do fluxo comum e prende-o na janela do navegador.
* `left: -60vw`: Desloca o elemento para a esquerda uma distância equivalente a **60% da largura da tela**. Como a largura do menu também é `60vw`, ele fica totalmente oculto do lado fora da tela.
* `transition: left 1s`: Diz ao navegador: *"Quando o valor de `left` mudar, não mude instantaneamente; faça uma animação suave que dure exatamente 1 segundo"*.


* `.main > ul > li:hover > ul.sidebar`:
* `left: 0`: Quando o usuário posiciona o cursor sobre o item da lista pai, a coordenada `left` muda para 0. O CSS ativa a transição e desliza o menu lateral para dentro da tela.



### Análise da Tabela Linux (`tabelalinux.html`)

* `<td colspan="3" rowspan="4">`: Esta única célula mescla **3 colunas no sentido horizontal** e **4 linhas no sentido vertical**. Isso permite que a imagem do Ubuntu ocupe um grande bloco à esquerda enquanto quatro linhas com os nomes das distribuições são organizadas perfeitamente ao seu lado.
* `border-spacing: 0px;`: Elimina o espaço duplo padrão que os navegadores colocam entre as bordas de tabelas normais.

---

## 6. Passo a Passo: Construindo a Animação Off-Canvas

1. **Estruturar o HTML com aninhamento**:
* Crie uma lista principal `<ul>` e adicione uma sublista `<ul class="sidebar">` dentro de um dos itens `<li>`.


2. **Definir a largura relativa do Viewport**:
* Defina a largura do menu lateral como `60vw` no CSS.


3. **Esconder o elemento fora da tela**:
* Aplique `position: fixed` e defina `left: -60vw` para empurrar o menu inteiramente para a esquerda.


4. **Adicionar o gatilho de interação (`:hover`)**:
* Crie a regra `.pai:hover > .sidebar` e defina `left: 0`.


5. **Adicionar a transição suave**:
* No bloco principal da `.sidebar`, insira `transition: left 1s;`. Ao passar o mouse sobre o elemento pai, o menu deslizará suavemente.



---

## 7. Tabelas Comparativas

### Tabela 1: Unidades de Medida CSS (`vw`/`vh` vs. `%` vs. `px`)

| Unidade | Tipo | Referência de Cálculo | Caso de Uso Ideal |
| --- | --- | --- | --- |
| **`px`** | Absoluta | Pixels físicos da tela. | Bordas, sombras, ícones pequenos. |
| **`%`** | Relativa | Tamanho do **elemento pai direto**. | Colunas de grid e layouts fluidos internos. |
| **`vw` / `vh**` | Relativa | Tamanho total da **janela do navegador (Viewport)**. | Menus Off-Canvas, modais, seções Hero de tela cheia. |

### Tabela 2: Posicionamentos CSS (`position`)

| Valor | Em relação a quê? | Permite `top`, `left`, `right`, `bottom`? | Sai do fluxo da página? |
| --- | --- | --- | --- |
| `static` (padrão) | Fluxo normal do documento | Não | Não |
| `relative` | À sua própria posição original | Sim | Não (deixa espaço vago) |
| `absolute` | Ao ancestral mais próximo com `position` diferente de `static` | Sim | **Sim** |
| `fixed` | À janela do navegador (*viewport*) | Sim | **Sim** (fica fixo na tela) |

---

## 8. Erros Comuns e Cuidados

1. **Cálculo incorreto nas anotações sobre porcentagem**:
* ❌ *Incorreto*: "Se o contêiner pai tiver uma largura de 1000px, o elemento filho com `20%` terá uma largura de `200%`."
* ✔️ *Correto*: Se o contêiner pai tem `1000px`, `20%` corresponde a **`200px`** (pixels), e não 200%.


2. **Sintaxe quebrada no atributo `content` do Viewport**:
* ❌ *Incorreto*: `content="width=device=width, initial-scale=1.0"`
* ✔️ *Correto*: `content="width=device-width, initial-scale=1.0"`


3. **Aplicar a propriedade `width` na tag `<tr>` no CSS**:
* ❌ *Incorreto*: `tr.yellow { width: 292px; }` (a propriedade `width` não é suportada por padrão em linhas de tabela `<tr>` no CSS W3C).
* ✔️ *Correto*: Aplique a largura nas células `<td>` ou na `<table>` principal.


4. **Valor inválido na propriedade `vertical-align**`:
* ❌ *Incorreto*: `vertical-align: center;` (o valor `center` não existe para esta propriedade).
* ✔️ *Correto*: `vertical-align: middle;`.



---

## 9. Correções Técnicas das Minhas Anotações

* **Erro de Cálculo em Comentário**: Corrigi o comentário no código `menus.css` onde estava escrito que `20%` de `1000px` resultaria em `200%`. Ajustei para a explicação matemática correta: **`200px`**.
* **Sintaxe do Meta Viewport**: Corrigi os sinais de igual em excesso no arquivo `menu.html` (`=width=device=width`).
* **Propriedade Inexistente no CSS**: A regra `vertical-align: center` no arquivo `estilo.css` foi corrigida para `vertical-align: middle`.
* **Largura em Linhas de Tabela**: Removi o atributo `width: 292px` do seletor `tr.yellow`, pois a especificação do CSS define que o dimensionamento deve ser feito nas células `<td>` ou no contêiner `<table>`.
* **Links na Tabela Linux**: Adicionei as tags de âncora `<a>` que faltavam na linha amarela de navegação para que todas as distribuições Linux apontassem para seus respectivos sites oficiais.

---

## 10. Aprofundamento e Boas Práticas (Conteúdo Complementar)

### Acessibilidade em Menus Apenas com CSS (`:hover`)

Menus acionados exclusivamente por `:hover` possuem uma limitação séria: **não funcionam em dispositivos móveis touch screen** (como celulares e tablets), pois não existe ponteiro de mouse para flutuar sobre o item.

Em projetos profissionais, utilizamos JavaScript para alternar uma classe `.ativo` via clique ou toque, associando atributos de acessibilidade como `aria-expanded="true/false"`.

### Tabelas para Layout vs. Tabelas para Dados

No passado (anos 1990 e início dos anos 2000), tabelas HTML eram usadas incorretamente para estruturar o layout inteiro de um site. Hoje, essa prática é considerada **obsoleta e prejudicial ao SEO**.

* **Regra moderna**: Use Flexbox e CSS Grid para criar o layout da página. Use a tag `<table>` **apenas** para apresentar dados tabulares e relatórios (como a comparação de distribuições Linux).

---

## 11. Guia Rápido de Memorização

* **Largura da Tela**: `100vw` (100% do viewport width).
* **Altura da Tela**: `100vh` (100% do viewport height).
* **Fixar Elemento na Tela**: `position: fixed;`.
* **Esconder Sidebar**: `left: -60vw;` (com `position: fixed`).
* **Animação Suave**: `transition: left 1s;`.
* **Mesclar Colunas na Tabela**: `<td colspan="3">`.
* **Mesclar Linhas na Tabela**: `<td rowspan="4">`.
* **Remover Espaço entre Bordas da Tabela**: `border-spacing: 0;` (ou `border-collapse: collapse;`).

---

## 12. Resumo Relâmpago — 10 Linhas

1. As unidades `vw` e `vh` medem porcentagens diretas da largura e altura da janela visível do navegador.
2. O posicionamento `position: fixed` fixa um elemento em relação à tela, retirando-o do fluxo normal da página.
3. Menus Off-Canvas são posicionados com coordenadas negativas (ex: `left: -60vw`) para ficarem ocultos fora da tela.
4. A propriedade `transition` cria animações suaves ao interpolar mudanças de propriedades CSS ao longo do tempo.
5. O seletor `>` atinge exclusivamente os filhos diretos do elemento pai no HTML.
6. Meta tags de descrição e palavras-chave ajudam na indexação e no SEO On-Page do site nos motores de busca.
7. O favicon é associado no `<head>` com `<link rel="icon" href="favicon.ico">` para exibir o ícone na aba do navegador.
8. Nativos das tabelas, `colspan` mescla células na horizontal e `rowspan` mescla células na vertical.
9. A propriedade `border-spacing: 0px` elimina as lacunas padrão entre as bordas de células em tabelas.
10. Tabelas devem ser usadas exclusivamente para exibir dados tabulares, enquanto Flexbox/Grid devem ser usados para layouts.
