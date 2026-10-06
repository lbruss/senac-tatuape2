# Introdução ao HTML: Estrutura Básica, Elementos Semânticos, Listas, Imagens e Navegação

---

**Visão Geral**

Nesta aula, dei meus primeiros passos práticos na criação de páginas web e entendi a estrutura fundamental do **HTML** (*HyperText Markup Language*). Compreendi que o HTML é uma **linguagem de marcação** responsável pela estrutura e organização dos conteúdos na Web, servindo como o esqueleto de qualquer site.

Para fixar a estrutura, entendi duas analogias muito úteis:

1. **Analogia do Corpo Humano**:
* `<html>`: O corpo inteiro (o organismo da página).
* `<head>`: A **cabeça**. Contém as configurações, metadados, título da guia e instruções que o navegador lê, mas que não aparecem diretamente na área visível do site.
* `<body>`: O **corpo** visível. Onde ficam todos os textos, imagens, títulos, listas, botões e elementos com os quais o usuário interage.


* `<footer>`: O **pé** (rodapé). Fica na parte inferior do corpo e guarda informações de direitos autorais, contatos ou créditos.


2. **Analogia da Casa** (conforme vimos na introdução):


* **HTML** é a **estrutura bruta** da casa (paredes, portas, janelas e teto).


* **CSS** é a **decoração** (cores de tinta, pisos, móveis e acabamento).


* **JavaScript** é a **funcionalidade** (fiação elétrica, lâmpadas, portão automático e sensores).





As **tags** (etiquetas) são os comandos envolvidos por sinais de menor `<` e maior `>`. Elas dizem ao navegador como apresentar e interpretar cada pedaço do documento.

---

**Entendendo o Conceito**

**O que são Tags e Atributos?**

* **Conceito simples**: As tags funcionam como etiquetas demarcadoras. Elas avisam o navegador onde um elemento começa e onde ele termina.
* **Definição técnica**: Um elemento HTML é composto por uma **tag de abertura** (`<tag>`), o conteúdo interno, e uma **tag de fechamento** (`</tag>`). Alguns elementos possuem **atributos**, que são parâmetros adicionais colocados na tag de abertura no formato `nome="valor"`, fornecendo instruções extras ao navegador.
* **Analogia**: Pense em etiquetar caixas em uma mudança. Quando coloco uma etiqueta dizendo `"Livros de TI"`, a pessoa que está carregando sabe exatamente o tipo de conteúdo dentro daquela caixa e como deve manuseá-la.

```html
<p class="introducao">Este é o conteúdo do parágrafo.</p>
│       │                 │                          │
│       │                 └─ Conteúdo visível        └─ Tag de fechamento
│       └─ Atributo e valor
└─ Tag de abertura

```

---

**Conceitos Fundamentais**

## Declaração e Estrutura Principal

* `<!DOCTYPE html>`: Avisa ao navegador que o documento utiliza o padrão **HTML5** moderno.
* `<html>`: Tag raiz que envolve todo o documento HTML.
* `<head>`: Agrupa informações técnicas (metadados, título da guia e links para arquivos de estilo).
* `<title>`: Define o título que aparece na aba/guia do navegador.
* `<body>`: Contém todo o conteúdo visível para o usuário.



## Hierarquia de Títulos (`<h1>` a `<h6>`)

Os cabeçalhos (*headings*) organizam a importância da informação na página:

* `<h1>`: Título principal (o mais importante). Deve existir idealmente apenas um `<h1>` por página para boa prática de SEO.
* `<h2>` a `<h6>`: Subtítulos e seções secundárias em ordem decrescente de importância.

## Elementos Semânticos de Bloco

A semântica ajuda os navegadores e motores de busca (como o Google) a entenderem o significado das partes da página:

* `<main>`: Delimita o conteúdo principal e único da página.
* `<section>`: Agrupa conteúdos relacionados em blocos temáticos.
* `<aside>`: Conteúdo de suporte ou lateral (menus laterais, avisos, links adicionais).
* `<nav>`: Agrupa links de navegação do site.
* `<footer>`: Rodapé da página ou de uma seção.

## Formatação de Texto, Listas e Mídia

* `<p>`: Define um parágrafo de texto.
* `<b>` e `<i>`: Aplicam negrito (*bold*) e itálico (*italic*) visualmente.
* `<img>`: Insere uma imagem na página (tag auto-fechável).
* Atributo `src`: Indica o caminho do arquivo de imagem.
* Atributo `alt`: Texto alternativo lido por leitores de tela para acessibilidade e exibido caso a imagem falhe.


* `<ul>` e `<ol>`: Criam listas **não ordenadas** (com marcadores) e **ordenadas** (numeradas), respectivamente. Cada item é inserido com a tag `<li>` (*list item*).
* `<a>`: Tag de âncora usada para criar **links** (para outras páginas ou para seções da própria página usando o atributo `href`).

---

### Código / Exemplos Práticos

Abaixo estão os quatro arquivos desenvolvidos na aula, com a sintaxe corrigida e padronizada.

**Arquivo 1: `primeiroarquivo.html`**

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Minha Primeira Página</title>
</head>
<body>
    <h1>Meu Site de Exemplo</h1>
    <p>Este é um parágrafo de introdução, explicando o propósito da página.</p>

    <h2>Seção 1: Sobre mim</h2>
    <p>Aqui você pode escrever informações pessoais, como hobbies e interesses.</p>

    <h3>Detalhes adicionais</h3>
    <p>Este parágrafo traz informações mais específicas, como experiências ou projetos.</p>

    <h2>Seção 2: Contato</h2>
    <p>Você pode incluir um e-mail ou telefone para contato.</p>

    <h2>Seção 3: Conclusão</h2>
    <p>Um resumo final ou mensagem de despedida para os visitantes.</p>

    <footer>
        <p>Conteúdo criado por mim!</p>
    </footer>
</body>
</html>

```

---

**Arquivo 2: `segundoarquivo.html`**

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Atividade 2 - História da Tecnologia</title>
</head>
<body>
    <main>
        <section>
            <h1>Introdução</h1>
            <p>A tecnologia é o uso do conhecimento para inventar novos <i>dispositivos</i> ou <i>ferramentas</i>. Ao longo da história, a tecnologia vem facilitando a nossa vida.</p>
        </section>

        <section>
            <h1>Tecnologia na Antiguidade</h1>
            <p>Ao aprender a dominar o fogo, os seres <b>humanos primitivos</b> se diferenciaram dos outros animais. Há cerca de 2 milhões de anos, começaram a usar pedras como armas e ferramentas, dando início ao período conhecido como Idade da Pedra. Nessa época, também aprenderam a fazer cerâmica usando barro.</p>
        </section>

        <section>
            <h1>A tecnologia na Idade Média</h1>
            <p>O período da história conhecido como <b>Idade Média</b> começou pouco antes do século VI d.C. e durou até perto do século XVI. Ao longo dessa época, as inovações surgiram em diferentes regiões - como a China, o Império Bizantino, a Pérsia, a Índia e os países muçulmanos.</p>
        </section>

        <section>
            <h1>Revolução Industrial</h1>
            <h2>Ferro, carvão e vapor</h2>
            <p>No início do <b>século XVIII</b>, dois inventores ingleses criaram as condições para o nascimento da Revolução Industrial, um período em que a produção das manufaturas teve um grande crescimento. Abraham Darby descobriu o coque, um tipo de carvão que produzia um ferro de melhor qualidade. Thomas Newcomen inventou uma bomba para drenar água das minas de carvão que era acionada por um motor a vapor.</p>
        </section>
    </main>
</body>
</html>

```

---

**Arquivo 3: `terceiroarquivo.html`**

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Receita de Bolo de Fubá</title>
</head>
<body>
    <h1>Receita</h1>
    <h2>Bolo de Fubá</h2>

    <p>
        <img src="bolinFUBA.jpg" alt="Fatia de bolo de fubá fofinho" width="100" height="100">
    </p>

    <h3 id="ingredientes">Ingredientes</h3>
    <ul>
        <li>3 ovos inteiros</li>
        <li>2 xícaras (chá) de açúcar</li>
        <li>2 xícaras (chá) de fubá</li>
        <li>3 colheres (sopa) de farinha de trigo</li>
        <li>1/2 copo (americano) de óleo</li>
        <li>1 copo (americano) de leite</li>
        <li>1 colher (sopa) de fermento em pó</li>
    </ul>

    <h3 id="mododepreparo">Modo de preparo</h3>
    <ol>
        <li>Bata todos os ingredientes no liquidificador até a massa ficar homogênea.</li>
        <li>Despeje em uma forma untada e polvilhada.</li>
        <li>Leve ao forno médio (180°C) por 40 minutos.</li>
    </ol>

    <footer>
        <p>Contato: (11) 99999-8888</p>
    </footer>
</body>
</html>

```

---

**Arquivo 4: `quartoarquivo.html`**

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Navegação e História da Tecnologia</title>
</head>
<body>
    <aside>
        <nav>
            <ul>
                <li><a href="#introducao">Introdução</a></li>
                <li><a href="#antiguidade">Tecnologia na Antiguidade</a></li>
                <li><a href="#industrial">Revolução Industrial</a></li>
                <li>
                    <a href="terceiroarquivo.html">Receita de Bolo de Fubá</a>
                    <ul>
                        <li><a href="terceiroarquivo.html#ingredientes">Ingredientes</a></li>
                        <li><a href="terceiroarquivo.html#mododepreparo">Modo de Preparo</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </aside>

    <main>
        <section>
            <h1 id="introducao">Introdução</h1>
            <p>A tecnologia é o uso do conhecimento para inventar novos <i>dispositivos</i> ou <i>ferramentas</i>. Ao longo da história, a tecnologia vem facilitando a nossa vida.</p>
        </section>

        <section>
            <h1 id="antiguidade">Tecnologia na Antiguidade</h1>
            <p>Ao aprender a dominar o fogo, os seres <b>humanos primitivos</b> se diferenciaram dos outros animais. Há cerca de 2 milhões de anos, começaram a usar pedras como armas e ferramentas, dando início ao período conhecido como Idade da Pedra. Nessa época, também aprenderam a fazer cerâmica usando barro.</p>
        </section>

        <section>
            <h1 id="industrial">Revolução Industrial</h1>
            <h2>Ferro, carvão e vapor</h2>
            <p>No início do <b>século XVIII</b>, dois inventores ingleses criaram as condições para o nascimento da Revolução Industrial, um período em que a produção das manufaturas teve um grande crescimento. Abraham Darby descobriu o coque, um tipo de carvão que produzia um ferro de melhor qualidade. Thomas Newcomen inventou uma bomba para drenar água das minas de carvão que era acionada por um motor a vapor.</p>
        </section>
    </main>
</body>
</html>

```

---

**Desmontando o Código**

**Análise do `primeiroarquivo.html`**

* `<!DOCTYPE html>`: Define a versão moderna do HTML5.
* `<title>`: Fica dentro do `<head>`. Não é exibido no corpo da página, mas nomeia a aba da janela do navegador.
* `<h1>` até `<h3>`: Demonstram a hierarquia lógica dos títulos. O `<h1>` é o título geral da página, `<h2>` são os tópicos principais e `<h3>` são os subtopicos do `<h2>`.
* `<footer>`: Fica obrigatoriamente dentro da tag `<body>` para fechar a estrutura visível da página.

**Análise do `terceiroarquivo.html`**

* `<img src="bolinFUBA.jpg" alt="..." width="100" height="100">`:
* `src`: Aponta o nome do arquivo da imagem local na mesma pasta.
* `alt`: Descreve a imagem para leitores de tela e acessibilidade.
* `width` e `height`: Definem a largura e altura da imagem em pixels.


* `<ul>` vs `<ol>`: A lista de ingredientes usa `<ul>` porque a ordem não altera o resultado. A lista de modo de preparo usa `<ol>` porque os passos precisam seguir uma sequência cronológica exata.

**Análise do `quartoarquivo.html`**

* `<aside>` + `<nav>`: Estrutura o menu lateral de navegação semântica.
* `<a href="#introducao">`: Link **interno**. O `#` indica que o link deve rolar a tela até o elemento que possui `id="introducao"`.
* `<a href="terceiroarquivo.html#ingredientes">`: Link **misto**. Abre o arquivo `terceiroarquivo.html` e pula direto para o ponto com `id="ingredientes"`.

---

**Passo a Passo: Configuração do Ambiente no VS Code**

Para organizar os projetos no computador, segui as etapas abaixo:

1. **Criar a pasta do projeto**:
* Criei uma pasta chamada `projetos-html` em um local fácil de encontrar (como a Área de Trabalho ou Documentos).


2. **Abrir a pasta no Visual Studio Code**:
* Abri o VS Code, fui no menu superior em **File > Open Folder** (Arquivo > Abrir Pasta) e selecionei a pasta `projetos-html`.


3. **Criar os arquivos HTML**:
* No painel esquerdo (*Explorer*), cliquei no ícone de **New File** (Novo Arquivo) e criei sequencialmente: `primeiroarquivo.html`, `segundoarquivo.html`, `terceiroarquivo.html` e `quartoarquivo.html`.


4. **Adicionar a imagem da receita**:
* Baixei uma imagem de bolo de fubá, nomeei para `bolinFUBA.jpg` e salvei dentro da mesma pasta `projetos-html`.


5. **Executar no Navegador**:
* Dê dois cliques no arquivo `.html` dentro da pasta do computador ou utilize a extensão *Live Server* do VS Code para visualizar a página rodando no navegador.



---

## Tabelas Comparativas

**Tabela 1: Tags de Organização Semântica**

| Tag | Significado | Quando Usar? |
| --- | --- | --- |
| `<main>` | Conteúdo Principal | Apenas uma vez por página, envolvendo o assunto central. |
| `<section>` | Seção Temática | Para agrupar capítulos, blocos de assuntos ou módulos relacionados. |
| `<aside>` | Conteúdo Lateral / Suporte | Para menus laterais, painéis de links, avisos ou biografias do autor. |
| `<nav>` | Navegação | Para blocos de links principais de navegação do site. |
| `<footer>` | Rodapé | Na parte inferior do site para contatos, cópias e direitos autorais. |

**Tabela 2: Listas em HTML (`<ul>` vs `<ol>`)**

| Tipo de Lista | Tag Principal | Item da Lista | Marcador Padrão | Caso de Uso Típico |
| --- | --- | --- | --- | --- |
| **Não Ordenada** | `<ul>` | `<li>` | Bolinhas (*bullets*) | Ingredientes, categorias, características. |
| **Ordenada** | `<ol>` | `<li>` | Números (`1, 2, 3...`) | Passo a passo, receitas, tutorias, rankings. |

**Tabela 3: Formatação Estética vs. Semântica**

| Tag Estética (Antiga) | Tag Semântica (Moderna) | Resultado Visual | Diferença Técnica |
| --- | --- | --- | --- |
| `<b>` | `<strong>` | **Texto em negrito** | `<strong>` indica importância/urgência para leitores de tela. |
| `<i>` | `<em>` | *Texto em itálico* | `<em>` indica ênfase no significado da palavra. |

---

## Erros Comuns e Cuidados

1. **Escrever tags e atributos grudados**:
* ❌ *Incorreto*: `<imgsrc="bolo.jpg">` ou `<ahref="#menu">`
* ✔️ *Correto*: `<img src="bolo.jpg">` e `<a href="#menu">` (deve haver espaço entre a tag e o atributo).


2. **Colocar o `<footer>` fora do `<body>**`**:
* ❌ *Incorreto*: Posicionar a tag `<footer>` depois do fechamento de `</body>`.
* ✔️ *Correto*: Todo elemento visível ao usuário deve ficar dentro de `<body>...</body>`.


3. **Erros de digitação nas tags de fechamento**:
* ❌ *Incorreto*: `<./p>` ou `<p\>`
* ✔️ *Correto*: `</p>` (a barra é sempre para frente `/`).


4. **Não especificar o atributo `alt` em imagens**:
* Sem o atributo `alt`, leitores de tela para pessoas com deficiência visual não conseguirão descrever o que a imagem representa.


---

## Aprofundamento e Boas Práticas (Conteúdo Complementar)

**Caminhos Relativos vs. Caminhos Absolutos**

Ao inserir mídias ou criar links, compreendi como funcionam os caminhos:

* **Caminho Relativo**: Aponta para um arquivo dentro da própria estrutura do projeto.
* `src="bolinFUBA.jpg"` → Arquivo na mesma pasta.
* `src="imagens/bolinFUBA.jpg"` → Arquivo dentro da subpasta `imagens`.


* **Caminho Absoluto**: Aponta para um endereço completo na web.
* `src="[https://site.com/imagens/bolo.png](https://site.com/imagens/bolo.png)"`



**Acessibilidade (WCAG)**

Escrever HTML semântico com tags adequadas (`<main>`, `<nav>`, `<footer>`) e preencher o atributo `alt` em imagens não serve apenas para organização, mas permite que softwares leitores de tela naveguem pela página com facilidade.

---

## Guia Rápido de Memorização

* **Estrutura Base**: `<!DOCTYPE html>` → `<html>` → `<head>` (configurações) + `<body>` (conteúdo).


* **Título da Guia**: `<title>Título</title>` (fica dentro de `<head>`).
* **Títulos de Conteúdo**: `<h1>` (principal) até `<h6>` (menor).
* **Parágrafo**: `<p>Texto</p>`.
* **Imagem**: `<img src="caminho.jpg" alt="Descrição">`.
* **Lista sem Ordem**: `<ul>` com itens `<li>`.
* **Lista com Ordem**: `<ol>` com itens `<li>`.
* **Link Externo / Interno**: `<a href="destino">Texto</a>`.

---

**Resumo Relâmpago**

1. O HTML é a linguagem de marcação que define a estrutura bruta e o conteúdo de uma página web.
2. A analogia do corpo humano divide a página em `<html>` (corpo), `<head>` (cabeça), `<body>` (tronco visível) e `<footer>` (pé).
3. O comando `<!DOCTYPE html>` indica ao navegador que a página utiliza o padrão moderno HTML5.
4. As tags funcionam como etiquetas demarcadoras que envolvem o conteúdo com abertura `<tag>` e fechamento `</tag>`.
5. A hierarquia de títulos vai de `<h1>` (mais importante) até `<h6>` (subtítulo de menor peso).
6. Tags semânticas como `<main>`, `<section>`, `<aside>` e `<nav>` dão significado estrutural ao documento.
7. A tag `<img>` insere imagens usando o atributo `src` para o caminho e `alt` para a descrição acessível.
8. Listas não ordenadas usam `<ul>` (marcadores), enquanto listas ordenadas usam `<ol>` (números sequenciais).
9. A tag de âncora `<a>` utiliza o atributo `href` para criar links entre páginas ou seções com `id`.
10. O atributo `id` substituiu o uso obsoleto de `name` para mapear âncoras internas em HTML5.
