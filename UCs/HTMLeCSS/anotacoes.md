# Arquitetura CSS Avançada: Variáveis, Carrossel Animado, Glassmorphism, Grid Responsivo e Regras de Impressão

**Visão Geral**

Nesta aula, construí toda a folha de estilos global (`style.css`) do projeto **StyleStore**. Essa etapa eleva o visual das seis páginas HTML que estruturamos anteriormente para um nível profissional de interface moderna.

Aprendi a centralizar a identidade visual do sistema utilizando **Variáveis CSS (`:root`)**, a criar um componente de **carrossel de banners** com efeito de vidro fosco (**Glassmorphism**), a montar uma vitrine de produtos adaptável a qualquer resolução usando **CSS Grid responsivo (`auto-fill` e `minmax`)**, a estruturar o modal do carrinho de compras e a configurar uma folha de estilos específica para **impressão e exportação de relatórios em PDF (`@media print`)**.

---

**Entendendo o Conceito**

## Variáveis CSS (`:root`), Glassmorphism e Media Queries de Impressão

* **Variáveis CSS (`:root`)**:
* *Conceito simples*: Funcionam como uma paleta de tintas nomeadas. Em vez de decorar códigos hexadecimais de cores e repeti-los centenas de vezes, damos um nome amigável a cada cor no topo do arquivo. Se precisarmos mudar a cor da loja inteira depois, alteramos em um único lugar.
* *Definição técnica*: São propriedades customizadas (*Custom Properties*) declaradas no escopo global da pseudo-classe `:root` (que referencia o elemento raiz `<html>`) com o prefixo `--` e acessadas em qualquer seletor através da função `var()`.


* **Glassmorphism (Efeito Vidro Fosco)**:
* *Definição técnica*: Estilo visual criado pela combinação de um fundo semitransparente (`rgba`), uma borda fina translúcida e a propriedade `backdrop-filter: blur()`, que desfoca o que está posicionado atrás do elemento.


* **Media Query de Impressão (`@media print`)**:
* *Definição técnica*: Um bloco condicional de CSS que só entra em ação quando o navegador aciona a janela de impressão ou geração de PDF (`window.print()`). Ele permite ocultar menus, botões e rodapés, imprimindo apenas os relatórios desejados.



```
┌─────────────────────────────────────────────────────────────────┐
│ :root { --primary-color: #1a1a2e; --accent-color: #e63946; }    │
│    │                                                            │
│    ├──► header { background: var(--primary-color); }            │
│    ├──► .btn-banner { background: var(--accent-color); }        │
│    └──► .preco { color: var(--accent-color); }                  │
└─────────────────────────────────────────────────────────────────┘

```

---

**Conceitos Fundamentais**

## Reset Global e `box-sizing: border-box`

Por padrão, os navegadores adicionam margens e espaçamentos internos diferentes em cada tag, além de somarem o `padding` e a `border` à largura declarada do elemento (fazendo uma caixa de `200px` ficar maior do que deveria).

* O seletor universal `*` zera `margin` e `padding`.
* `box-sizing: border-box` força o navegador a incluir bordas e preenchimentos internos dentro da medida total de largura e altura, mantendo o cálculo de layout previsível.

## Sticky Footer com Flexbox no `<body>`

Para evitar que o rodapé (`<footer>`) suba e fique flutuando no meio da tela em páginas com pouco conteúdo (como a tela de login), aplicamos três regras combinadas:

1. No `body`: `display: flex; flex-direction: column; min-height: 100vh;` (ocupa no mínimo 100% da altura da tela).
2. No `.container` (`<main>`): `flex: 1;` (cresce dinamicamente para ocupar todo o espaço livre).
3. Resultado: O rodapé é empurrado automaticamente para o final da janela.

## O Segredo do Carrossel Horizontal

Para fazer slides passarem lado a lado dentro de uma janela fixa:

* `.carrossel-container`: Define `overflow: hidden` (esconde os slides que estão fora da área visível) e `position: relative`.
* `.carrossel-wrapper`: Usa `display: flex` para colocar todos os slides em uma fila horizontal contínua e utiliza `transition: transform 0.6s` para deslizar suavemente quando o JavaScript alterar o eixo `translateX`.
* `.carrossel-slide`: Recebe `min-width: 100%` para que cada slide ocupe exatamente a largura inteira do banner por vez.

## Grid de Produtos Totalmente Responsivo

* `grid-template-columns: repeat(auto-fill, minmax(250px, 1fr))`:
* `minmax(250px, 1fr)`: Cada cartão de produto terá **no mínimo** `250px` de largura e crescerá proporcionalmente (`1fr`) até preencher o espaço.
* `auto-fill`: O navegador calcula automaticamente quantas colunas de `250px` cabem na tela atual. Se a tela diminuir (celular), as colunas quebram para a linha de baixo sem precisar de Media Queries extras.

---

### Código / Exemplos Práticos

Abaixo está o arquivo `style.css` completo da pasta `css/`, com todas as classes sincronizadas com os arquivos HTML do projeto, e com os erros de sintaxe, transformações e seletores corrigidos.

### Arquivo: `css/style.css`

```css
/* =================================================== */
/* CONFIGURAÇÕES GERAIS E VARIÁVEIS                    */
/* =================================================== */
:root {
    --primary-color: #1a1a2e;
    --accent-color: #e63946;
    --bg-color: #f8f9fa;
    --card-bg: #ffffff;
    --text-color: #2b2d42;
    --border-color: #e0e0e0;
    --success-color: #2a9d8f;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--bg-color);
    color: var(--text-color);
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 2rem auto;
    padding: 0 1rem;
    flex: 1;
}

/* =================================================== */
/* CABEÇALHO E NAVEGAÇÃO                               */
/* =================================================== */
header {
    background-color: var(--primary-color);
    color: white;
    padding: 1rem 0;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.header-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
}

header h1 {
    font-size: 1.8rem;
    letter-spacing: 1px;
}

nav a {
    color: #edf2f4;
    text-decoration: none;
    margin-left: 1.2rem;
    font-weight: 500;
    transition: color 0.3s;
}

nav a:hover,
nav a.active {
    color: var(--accent-color);
}

/* =================================================== */
/* BANNER CARROSSEL                                    */
/* =================================================== */
.carrossel-container {
    position: relative;
    width: 100%;
    max-width: 1200px;
    height: 380px;
    margin-bottom: 2.5rem;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    background-color: var(--primary-color);
}

.carrossel-wrapper {
    display: flex;
    width: 100%;
    height: 100%;
    transition: transform 0.6s cubic-bezier(0.25, 1, 0.5, 1);
}

.carrossel-slide {
    min-width: 100%;
    height: 100%;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
}

.carrossel-slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
}

/* Efeito Glassmorphism sobre o Banner */
.carrossel-overlay {
    position: relative;
    z-index: 2;
    background: rgba(0, 0, 0, 0.45);
    backdrop-filter: blur(4px);
    padding: 2.2rem 3rem;
    border-radius: 16px;
    text-align: center;
    color: white;
    max-width: 720px;
    margin: 0 1.5rem;
    border: 1px solid rgba(255, 255, 255, 0.25);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.35);
}

.carrossel-overlay h2 {
    font-size: 2.3rem;
    margin-bottom: 0.8rem;
    color: white;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

.carrossel-overlay p {
    font-size: 1.15rem;
    margin-bottom: 1.4rem;
    opacity: 0.95;
    line-height: 1.4;
}

.carrossel-overlay .btn-banner {
    display: inline-block;
    background-color: var(--accent-color);
    color: white;
    padding: 0.75rem 1.8rem;
    border-radius: 30px;
    text-decoration: none;
    font-weight: 700;
    font-size: 1rem;
    transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
    box-shadow: 0 4px 12px rgba(230, 57, 70, 0.4);
}

.carrossel-overlay .btn-banner:hover {
    background-color: #ff4d5a;
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(230, 57, 70, 0.6);
}

/* Botões Laterais de Navegação do Carrossel */
.carrossel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.45);
    color: white;
    border: 1px solid rgba(255, 255, 255, 0.3);
    font-size: 1.4rem;
    width: 46px;
    height: 46px;
    border-radius: 50%;
    cursor: pointer;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background 0.3s, transform 0.2s;
}

.carrossel-btn:hover {
    background: var(--accent-color);
    transform: translateY(-50%) scale(1.1);
}

.btn-prev { left: 15px; }
.btn-next { right: 15px; }

/* Indicadores (Bullets/Dots) */
.carrossel-indicadores {
    position: absolute;
    bottom: 15px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 10px;
    z-index: 10;
}

.dot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.5);
    cursor: pointer;
    transition: all 0.3s ease;
}

.dot.active,
.dot:hover {
    background-color: var(--accent-color);
    transform: scale(1.2);
    width: 26px;
    border-radius: 12px;
}

/* =================================================== */
/* VITRINE DE PRODUTOS                                 */
/* =================================================== */
.titulo-secao {
    font-size: 1.8rem;
    margin-bottom: 1.5rem;
    border-left: 5px solid var(--accent-color);
    padding-left: 0.8rem;
}

.grid-produtos {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 1.8rem;
}

.card-produto {
    background-color: var(--card-bg);
    border-radius: 12px;
    overflow: hidden;
    border: 1px solid var(--border-color);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
    transition: transform 0.3s, box-shadow 0.3s;
    display: flex;
    flex-direction: column;
}

.card-produto:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
}

.card-produto img {
    width: 100%;
    height: 260px;
    object-fit: cover;
    background-color: #f0f0f0;
}

.card-info {
    padding: 1.2rem;
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.card-info h3 {
    font-size: 1.1rem;
    margin-bottom: 0.5rem;
}

.card-info .preco {
    font-size: 1.3rem;
    font-weight: bold;
    color: var(--accent-color);
    margin: 0.8rem 0;
}

/* =================================================== */
/* BOTÕES GLOBAIS                                      */
/* =================================================== */
.btn-primary {
    background-color: var(--primary-color);
    color: white;
    border: none;
    padding: 0.75rem 1.2rem;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    transition: background 0.3s;
}

.btn-primary:hover {
    background-color: var(--accent-color);
}

.btn-secundario {
    background-color: #6c757d;
    color: white;
    border: none;
    padding: 0.6rem 1rem;
    border-radius: 6px;
    cursor: pointer;
}

.btn-block {
    width: 100%;
}

/* =================================================== */
/* CARRINHO FLUTUANTE E MODAL DE CHECKOUT              */
/* =================================================== */
.carrinho-flutuante {
    position: fixed;
    bottom: 25px;
    right: 25px;
    background-color: var(--accent-color);
    color: white;
    padding: 1rem 1.6rem;
    border-radius: 50px;
    cursor: pointer;
    font-weight: bold;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25);
    z-index: 1000;
    transition: transform 0.2s;
}

.carrinho-flutuante:hover {
    transform: scale(1.05);
}

/* Fundo Escuro da Janela Modal */
.modal {
    display: none;
    position: fixed;
    z-index: 2000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    align-items: center;
    justify-content: center;
}

.modal-content {
    background: white;
    padding: 2rem;
    border-radius: 12px;
    max-width: 550px;
    width: 90%;
    max-height: 85vh;
    margin: 5% auto;
    display: flex;
    flex-direction: column;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 1rem;
}

.fechar {
    font-size: 1.8rem;
    cursor: pointer;
    line-height: 1;
}

.carrinho-corpo {
    flex: 1;
    overflow-y: auto;
    margin: 1rem 0;
}

.carrinho-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.8rem 0;
    border-bottom: 1px solid #f0f0f0;
}

.carrinho-rodape {
    border-top: 1px solid var(--border-color);
    padding-top: 1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* =================================================== */
/* FORMULÁRIOS E PAINÉIS DE GESTÃO                     */
/* =================================================== */
.card-form {
    max-width: 420px;
    margin: 3rem auto;
    background: white;
    padding: 2.5rem;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

.card-form h2 {
    margin-bottom: 1.5rem;
    text-align: center;
}

.form-group {
    display: block;
    margin-bottom: 1.2rem;
    font-weight: 500;
}

.form-group label {
    display: block;
    margin-bottom: 0.4rem;
}

.form-group input {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid var(--border-color);
    border-radius: 6px;
}

.painel-escondido {
    display: none;
}

.topo-painel {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.subtitulo-painel {
    margin-bottom: 1rem;
}

/* =================================================== */
/* TABELAS E RELATÓRIOS                                */
/* =================================================== */
.tabela-container {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

th, td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid var(--border-color);
}

th {
    background-color: var(--primary-color);
    color: white;
}

.card-relatorio {
    background: white;
    padding: 1.5rem;
    border-radius: 8px;
    margin-bottom: 2rem;
    border: 1px solid var(--border-color);
}

.acoes-relatorio {
    display: flex;
    gap: 1rem;
    margin-top: 1rem;
    flex-wrap: wrap;
}

.btn-relatorio {
    padding: 0.8rem 1.4rem;
    border-radius: 6px;
    border: none;
    color: white;
    font-weight: bold;
    cursor: pointer;
}

.btn-csv { background-color: #2196F3; }
.btn-excel { background-color: #4CAF50; }
.btn-pdf { background-color: #E91E63; }

.cabecalhos-relatorio-pdf {
    display: none;
}

footer {
    background-color: var(--primary-color);
    color: white;
    text-align: center;
    padding: 1.5rem;
    margin-top: 3rem;
}

/* =================================================== */
/* ESTILO EXCLUSIVO PARA IMPRESSÃO / EXPORTAÇÃO PDF    */
/* =================================================== */
@media print {
    body * {
        visibility: hidden;
    }

    #area-relatorio-impressao,
    #area-relatorio-impressao * {
        visibility: visible;
    }

    #area-relatorio-impressao {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
    }

    .cabecalhos-relatorio-pdf {
        display: block;
        margin-bottom: 20px;
        text-align: center;
    }
}

```

---

**Desmontando o Código**

**Análise do Centralizador Matemático (`transform`)**

Nos botões do carrossel e nos indicadores (dots), utilizamos posicionamento absoluto combinado com deslocamento de eixo para centralização exata:

* **Centralização Vertical (`.carrossel-btn`)**:
* `top: 50%`: Empurra a borda superior do botão para a metade exata da altura do banner.
* `transform: translateY(-50%)`: Puxa o botão para cima na metade de sua própria altura, alinhando-o milimetricamente no centro vertical.


* **Centralização Horizontal (`.carrossel-indicadores`)**:
* `left: 50%` + `transform: translateX(-50%)`: Empurra a barra de bolinhas até o meio da tela e puxa metade da sua largura para a esquerda, centralizando-a perfeitamente.

**Análise da Regra de Impressão (`@media print`)**

* `body * { visibility: hidden; }`: Torna invisível absolutamente tudo na tela durante o modo de impressão, mas mantém os espaços reservados na estrutura.
* `#area-relatorio-impressao, #area-relatorio-impressao * { visibility: visible; }`: Reativa a visibilidade apenas para a seção da tabela de vendas e seus elementos filhos.
* `#area-relatorio-impressao { position: absolute; left: 0; top: 0; }`: Move a tabela para o topo esquerdo da folha de papel A4, eliminando espaços em branco deixados pelo cabeçalho oculto.

---

**Passo a Passo: Vinculando e Validando os Estilos**

1. **Criar o arquivo de estilos**:
* Na subpasta `css/` do projeto `loja`, crie o arquivo `style.css`.

2. **Definir o design system no topo**:
* Adicione o bloco `:root` com as variáveis de cores para padronizar todos os botões, cabeçalhos e alertas.

3. **Configurar os layouts de grade**:
* Aplique o modelo Flexbox para alinhamentos lineares (cabeçalho, itens do carrinho, botões) e o modelo CSS Grid para a vitrine responsiva (`.grid-produtos`).

4. **Conferir a integração com o HTML**:
* Abra as páginas HTML (`index.html`, `cliente.html`, `vendedor.html`) no navegador usando a extensão *Live Server* e verifique se o cabeçalho azul-marinho e as regras de alinhamento foram carregados corretamente.

---

## Tabelas Comparativas

**Tabela 1: Funções de Transformação CSS (`translate`, `translateX`, `translateY`)**

| Função CSS | Eixo de Movimento | Comportamento | Caso de Uso no Projeto |
| --- | --- | --- | --- |
| `translate(x, y)` | Horizontal e Vertical | Move o elemento nos dois eixos simultaneamente. | Deslocamentos compostos. |
| `translateX(valor)` | Apenas Horizontal (X) | Valor positivo vai para a direita; negativo para a esquerda. | Centralizar os indicadores de bolinha (`translateX(-50%)`). |
| `translateY(valor)` | Apenas Vertical (Y) | Valor positivo desce; valor negativo sobe o elemento. | Efeito de elevação ao passar o mouse no card (`translateY(-6px)`). |

**Tabela 2: Unidades de Medida Utilizadas no Projeto**

| Unidade | Tipo | Base de Cálculo | Onde foi usada? |
| --- | --- | --- | --- |
| **`rem`** | Relativa | Tamanho da fonte do elemento raiz `<html>` (Padrão = `16px`). | Margens, paddings e fontes (`2rem` = `32px`). |
| **`vh`** | Relativa | Porcentagem da altura total visível da tela (*Viewport Height*). | Altura mínima do site (`100vh`) e limite do modal (`85vh`). |
| **`%`** | Relativa | Porcentagem das dimensões do elemento pai direto. | Largura de imagens (`100%`) e posicionamento (`top: 50%`). |
| **`px`** | Absoluta | Pixels físicos da tela. | Bordas (`1px`), sombras e largura mínima de colunas (`250px`). |

---

## Erros Comuns e Cuidados

1. **Confundir `translate(-6px)` com `translateY(-6px)**`:
* ❌ *Incorreto*: Escrever `transform: translate(-6px)` esperando que o botão ou card suba. Quando passamos apenas 1 parâmetro para `translate()`, o CSS entende que é o **eixo X (horizontal)**, empurrando o elemento para a esquerda!
* ✔️ *Correto*: Usar explicitamente `transform: translateY(-6px)` para movimentar no eixo vertical (subir/descer) e `translateX(-50%)` para o eixo horizontal.

2. **Incompatibilidade de nomes de classes entre o HTML e o CSS**:
* Se no arquivo HTML a classe foi escrita no plural (`class="grid-produtos"`, `class="card-relatorio"`, `class="cabecalhos-relatorio-pdf"`) e no CSS foi escrita no singular (`.grid-produto`, `.card-relatorios`, `.cabecalho-relatorio-pdf`), o navegador ignorará totalmente o estilo daquela seção.

3. **Esquecer de estilizar a classe base `.modal**`:
* No arquivo HTML, o carrinho de compras utiliza `<div id="modal-carrinho" class="modal">`. Se a classe `.modal` não for declarada no `style.css` com `display: none; position: fixed;`, o carrinho aparecerá aberto e quebrado no final da página logo ao abrir o site.

---

* **Adição da Classe `.modal` Ausente**: No rascunho da aula, o estilo do `.modal-content` estava presente, mas a regra principal da janela `.modal` (responsável pelo fundo escuro transparente e por manter o carrinho fechado inicialmente com `display: none`) havia sido omitida. Adicionei a regra completa ao código.
* **Suavização de Sombras**: Ajustei a opacidade exagerada de `rgba(0,0,0, 0.8)` e `0.5` nos formulários e cards de produtos para sombras mais suaves e modernas (`0.1` e `0.08`).

---

## Aprofundamento e Boas Práticas (Conteúdo Complementar)

**Nomenclatura de Variáveis CSS**

No arquivo original da aula, a variável principal foi nomeada com um erro de grafia em inglês: `--prymary-color`. Embora o navegador aceite qualquer nome definido pelo desenvolvedor desde que seja chamado da mesma forma no `var()`, a boa prática profissional é manter a ortografia correta em inglês (`--primary-color`) para facilitar a leitura em equipes de desenvolvimento e evitar erros de digitação.

**Acessibilidade e Foco no Teclado (`:focus`)**

Além do efeito `:hover` (usado com o mouse), é uma boa prática adicionar o estado `:focus-visible` em botões e links de navegação para que usuários que navegam utilizando a tecla `Tab` do teclado consigam visualizar em qual elemento da loja estão posicionados.

---

## 11. Guia Rápido de Memorização

* **Declarar Variável CSS**: `:root { --nome-cor: #1a1a2e; }`
* **Usar Variável CSS**: `color: var(--nome-cor);`
* **Grid Responsivo Automático**: `grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));`
* **Efeito Vidro Fosco**: `background: rgba(0, 0, 0, 0.45); backdrop-filter: blur(4px);`
* **Centralizar Verticalmente Absoluto**: `top: 50%; transform: translateY(-50%);`
* **Centralizar Horizontalmente Absoluto**: `left: 50%; transform: translateX(-50%);`
* **Ajustar Imagem sem Distorcer**: `object-fit: cover;`
* **Regras de Impressão PDF**: `@media print { ... }`

---

## 12. Resumo Relâmpago — 10 Linhas

1. A pseudo-classe `:root` centraliza variáveis CSS globais de cores para facilitar a manutenção do tema visual.
2. O reset universal com `box-sizing: border-box` padroniza o cálculo de larguras e bordas em todos os navegadores.
3. Combinar `display: flex`, `flex-direction: column` e `min-height: 100vh` no `body` mantém o rodapé fixado no final da tela.
4. O carrossel horizontal utiliza `overflow: hidden` no contêiner e `display: flex` no wrapper para alinhar os slides lado a lado.
5. O efeito Glassmorphism combina fundos translúcidos `rgba` com o desfoque da propriedade `backdrop-filter: blur()`.
6. As funções `translateX` e `translateY` controlam respectivamente deslocamentos nos eixos horizontal e vertical.
7. A regra `grid-template-columns: repeat(auto-fill, minmax(250px, 1fr))` cria vitrines de produtos responsivas sem Media Queries.
8. A propriedade `object-fit: cover` redimensiona imagens de banners e produtos preenchendo o espaço sem distorções.
9. O bloco `@media print` oculta elementos de navegação da tela e formata exclusivamente a tabela de relatórios para impressão em PDF.
10. A precisão na nomenclatura das classes entre HTML e CSS é essencial para que as regras de estilo sejam aplicadas corretamente.
