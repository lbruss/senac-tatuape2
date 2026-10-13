# Tabelas em HTML e Introdução ao CSS (Estilos Internos e Externos)

---

## 1. Visão Geral

Nesta aula, avancei em dois pilares fundamentais do desenvolvimento web: a construção de **tabelas estruturadas** em HTML e os primeiros passos na estilização visual utilizando **CSS (Cascading Style Sheets)**.

Aprendi a criar tabelas completas organizadas semanticamente em cabeçalho (`<thead>`) e corpo (`<tbody>`), compreendendo o uso do atributo `rowspan` para mesclar linhas. Em seguida, entrei no universo do CSS, entendendo como separar a **estrutura** (HTML) do **design** (CSS). Explorei tanto a aplicação de estilos internos na tag `<style>` quanto a criação de arquivos de estilo externos (`index.css`), utilizando seletores avançados e pseudo-classes para criar uma lista de tarefas interativa sem precisar de JavaScript.

---

## 2. Entendendo o Conceito

### O que são Tabelas e CSS?

* **Tabela HTML**: É uma grade bidimensional usada para exibir dados estruturados em linhas e colunas.
* *Analogia*: Funciona como uma planilha do Excel incorporada na página.


* **CSS (Cascading Style Sheets)**: É a linguagem de estilos que define as cores, fontes, espaçamentos e layouts de uma página HTML.
* *Analogia*: Se o HTML é a maquete de gesso de uma casa, o CSS é a pintura, a iluminação e a decoração dos cômodos.



### Como o CSS Interage com o HTML?

O CSS funciona com um sistema de **Regra e Seletor**:

1. **Seletor**: Aponta para qual elemento do HTML você quer aplicar a regra (ex: `h1`, `.destaque`, `input[type="checkbox"]`).
2. **Bloco de Declaração**: Define as propriedades e valores entre chaves `{}`.

```css
seletor {
    propriedade: valor;
}

```

---

## 3. Conceitos Fundamentais

### 3.1. Estrutura de Tabelas em HTML

* `<table>`: Container principal da tabela.
* `<thead>`: Agrupa os títulos e o cabeçalho das colunas.
* `<tbody>`: Agrupa o conteúdo principal dos dados da tabela.
* `<tr>` (*Table Row*): Cria uma linha na tabela.
* `<th>` (*Table Header*): Célula de cabeçalho (texto centralizado e em negrito por padrão).
* `<td>` (*Table Data*): Célula comum de dados.
* `rowspan`: Atributo aplicado a uma célula (`<td>` ou `<th>`) para fazer com que ela se expanda e ocupe verticalmente múltiplas linhas.
* `colspan`: Atributo usado para expandir uma célula horizontalmente por múltiplas colunas.

### 3.2. Formas de Incluir CSS na Página

1. **CSS Interno**: Escrito dentro da tag `<style>` dentro do `<head>` da própria página HTML. Ideal para testes rápidos ou páginas únicas.
2. **CSS Externo**: Escrito em um arquivo separado `.css` (ex: `index.css`) e vinculado ao HTML através da tag `<link rel="stylesheet" href="index.css">` no `<head>`. É o padrão profissional da indústria.

### 3.3. Seletores e Pseudo-classes Utilizados

* **Seletor Universal (`*`)**: Seleciona absolutamente todos os elementos da página.
* **Seletor de Classe (`.nome-da-classe`)**: Aplica estilos a qualquer elemento que possua o atributo `class="nome-da-classe"`.
* **Pseudo-elemento `::marker**`: Estiliza diretamente os marcadores visuais (números ou bolinhas) de listas `<li>`.
* **Pseudo-classe `:checked**`: Aplica estilos a elementos de formulário (como checkboxes) quando eles estão marcados pelo usuário.
* **Combinador de Símbolo Mais (`+`)**: Seleciona o elemento irmão diretamente adjacente ao elemento da esquerda (`input:checked + p`).
* **Combinador de Sinal de Maior (`>`)**: Seleciona apenas os filhos diretos do elemento pai (`li > p`).
* **Regra `!important**`: Força uma propriedade CSS a ter prioridade máxima, ignorando regras de especificidade anteriores.

---

## 4. Código / Exemplos Práticos

### Arquivo 1: `quintoarquivo.html` (Tabela com Mesclagem)

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Atividade 5 - Tabela de Músicas</title>
</head>
<body>
    <h1>Tabela de Músicas e Artistas</h1>

    <table border="1">
        <thead>
            <tr>
                <th>Artista</th>
                <th>Imagem</th>
                <th>Título</th>
                <th>Vídeo</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Red Hot Chili Peppers</td>
                <td><img src="recursos/rock_a.jpeg" alt="Red Hot Chili Peppers"></td>
                <td>Dark Necessities</td>
                <td><a href="https://www.youtube.com/watch?v=Q0oIoR9mLwc" target="_blank">Ouça agora</a></td>
            </tr>
            <tr>
                <td rowspan="3">Alanis Morissette</td>
                <td rowspan="3"><img src="recursos/rock_b.jpeg" alt="Alanis Morissette"></td>
                <td>You Oughta Know</td>
                <td><a href="https://www.youtube.com/watch?v=NPcyTyilmYY" target="_blank">Ouça agora</a></td>
            </tr>
            <tr>
                <td>Ironic (Clipe Oficial)</td>
                <td><a href="https://www.youtube.com/watch?v=Jne9t8sHpUc" target="_blank">Ouça agora</a></td>
            </tr>
            <tr>
                <td>Ironic (Ao Vivo)</td>
                <td><a href="https://www.youtube.com/watch?v=5w6lAUzZoh0" target="_blank">Ouça agora</a></td>
            </tr>
            <tr>
                <td>Supercombo</td>
                <td><img src="recursos/rock_c.jpeg" alt="Banda Supercombo"></td>
                <td>Piloto Automático</td>
                <td><a href="https://www.youtube.com/watch?v=YW4-V0xQkTg" target="_blank">Ouça agora</a></td>
            </tr>
        </tbody>
    </table>
</body>
</html>

```

---

### Arquivo 2: `basico.html` (Primeiros Passos com CSS Interno)

*(Nota: Ajustado o nome do arquivo para sem acento `basico.html` para seguir as melhores práticas do ecossistema web)*.

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Atividade HTML e CSS - Estilo Interno</title>
    <style>
        /* Bloco de CSS Interno */

        /* Definindo a classe CSS 'destaque' */
        .destaque {
            color: #b73011;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <p>Parágrafo sem estilo.</p>
    <p class="destaque">Parágrafo com estilo personalizado aplicado via classe CSS.</p>
</body>
</html>

```

---

### Arquivo 3: `receitadebolo.html` (Integração com CSS Externo)

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Receita de Bolo de Fubá Interativa</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <h1>Receita</h1>
    <h2>Bolo de Fubá</h2>

    <h3>Ingredientes</h3>
    <ul style="list-style: none;">
        <li>
            <input type="checkbox">
            <p>3 ovos inteiros</p>
        </li>
        <li>
            <input type="checkbox">
            <p>2 xícaras (chá) de açúcar</p>
        </li>
        <li>
            <input type="checkbox">
            <p>3 colheres (sopa) de farinha de trigo</p>
        </li>
        <li>
            <input type="checkbox">
            <p>1/2 copo (americano) de óleo</p>
        </li>
        <li>
            <input type="checkbox">
            <p>1 copo (americano) de leite</p>
        </li>
        <li>
            <input type="checkbox">
            <p>1 colher (sopa) de fermento em pó</p>
        </li>
    </ul>

    <h3>Modo de Preparo</h3>
    <ol>
        <li>
            <input type="checkbox">
            <p>Em um liquidificador, adicione os ovos, o açúcar, o fubá, a farinha de trigo, o óleo, o leite e o fermento em pó, depois bata até a massa ficar lisa e homogênea.</p>
        </li>
        <li>
            <input type="checkbox">
            <p>Despeje a massa em uma forma untada e polvilhada.</p>
        </li>
        <li style="color: red;">
            <input type="checkbox">
            <p>Leve para assar em forno médio (180ºC) preaquecido por 40 minutos.</p>
        </li>
    </ol>
</body>
</html>

```

---

### Arquivo 4: `index.css` (Estilos Externos)

```css
/* Aplicar a mesma família de fontes para todos os elementos da página */
* {
    font-family: sans-serif;
}

/* Estiliza os títulos principais e secundários */
h1 {
    color: #12787c;
}

h3 {
    color: #1a6868;
}

/* Customiza os marcadores de lista numerada */
li::marker {
    color: #1a6868;
    font-weight: bold;
    font-style: italic;
}

/* Define o espaçamento entre linhas da lista */
li {
    line-height: 30px;
}

/* Força os elementos input e p a ficarem lado a lado na mesma linha */
li > input[type="checkbox"], 
li > p {
    display: inline;
}

/* Força a cor do texto dos parágrafos dentro de li a ser preta */
li > p {
    color: black !important;
}

/* EFEITO INTERATIVO: 
   Quando o checkbox estiver marcado (:checked), 
   o parágrafo <p> que vem logo em seguida (+) recebe um risco de 'concluído' */
input[type="checkbox"]:checked + p {
    text-decoration: line-through;
}

```

---

## 5. Desmontando o Código

### Análise de `quintoarquivo.html` (Mesclagem com `rowspan`)

* `<td rowspan="3">Alanis Morissette</td>`: O atributo `rowspan="3"` manda essa célula se estender verticalmente por **3 linhas**. Por causa disso, nas duas linhas seguintes (`<tr>`), **não** criamos as células da artista nem da imagem, pois o espaço delas já está sendo ocupado por este `rowspan`.

### Análise de `basico.html` (Sintaxe CSS Interna)

* `.destaque`: O ponto `.` antes do nome indica que se trata de uma **Classe CSS**. Qualquer elemento do HTML com `class="destaque"` herdará o texto na cor `#b73011` e a fonte Arial.

### Análise do Conjunto `receitadebolo.html` + `index.css`

* `<link rel="stylesheet" href="index.css">`: Faz a ponte de ligação entre o arquivo de marcação HTML e o arquivo de estilos CSS.
* `display: inline;`: Por padrão, a tag `<p>` é um elemento de bloco (*block element*), ocupando 100% da largura e empurrando o próximo elemento para a linha de baixo. Ao alterar para `display: inline`, o texto do parágrafo fica na mesma linha do botão checkbox.
* `input[type="checkbox"]:checked + p`:
* `input[type="checkbox"]`: Seleciona apenas os inputs do tipo caixa de seleção.
* `:checked`: Aplica a regra somente quando o usuário clica e marca a caixa.
* `+ p`: O símbolo `+` (seletor irmão adjacente) pega o parágrafo `<p>` que vem exatamente após a caixa marcada e aplica `text-decoration: line-through;` (efeito tachado/riscado).



---

## 6. Passo a Passo

### Como Construir uma Tabela com Células Mescladas (`rowspan`)

1. **Definir a estrutura padrão**: Abra a tag `<table>`, insira o `<thead>` para os títulos das colunas e o `<tbody>` para as informações.
2. **Identificar a repetição**: Perceba se haverá dados repetidos nas linhas consecutivas (ex: o mesmo nome do artista para 3 músicas).
3. **Adicionar o atributo `rowspan` na primeira ocorrência**: Na primeira linha (`<tr>`) onde o dado aparece, adicione `rowspan="X"` na célula `<td>`, substituindo `X` pela quantidade de linhas atingidas.
4. **Remover as células excedentes nas linhas abaixo**: Nas linhas seguintes que foram cobertas pelo `rowspan`, simplesmente **omita** as tags `<td>` daquela posição para evitar que a tabela fique desalinhada.

---

## 7. Tabelas Comparativas

### Tabela 1: Tags de Estruturação de Tabelas HTML

| Tag | Nome | Função | Estilo Padrão no Navegador |
| --- | --- | --- | --- |
| `<table>` | Tabela | Container da grade | Bloco com margens padrão. |
| `<thead>` | Cabeçalho | Envolve as linhas de cabeçalho | Nenhum visual imediato (semântica). |
| `<tbody>` | Corpo | Envolve o conteúdo dos dados | Nenhum visual imediato (semântica). |
| `<tr>` | Linha (*Row*) | Define uma linha de células | Organiza elementos em fila horizontal. |
| `<th>` | Célula Cabeçalho | Identifica a coluna | Texto **negrito** e **centralizado**. |
| `<td>` | Célula de Dado | Insere a informação | Texto normal alinhado à esquerda. |

### Tabela 2: Formas de Aplicação de CSS

| Método | Como é feito? | Vantagens | Desvantagens |
| --- | --- | --- | --- |
| **Inline** | Atributo `style="..."` na tag HTML | Prático para testes rápidos e pontuais. | Polui o HTML e é difícil de manter. |
| **Interno** | Tag `<style>` no `<head>` | Não precisa de arquivo extra. | Vale apenas para aquela página específica. |
| **Externo** | Arquivo `.css` separado via `<link>` | **Padrão de mercado**. Reutilizável em todo o site. | Requer o carregamento de um arquivo a mais. |

### Tabela 3: Combinadores e Seletores CSS Utilizados

| Seletor / Combinador | Exemplo | O que ele seleciona? |
| --- | --- | --- |
| **Seletor Universal** | `*` | Seleciona **todos** os elementos do documento. |
| **Seletor de Atributo** | `input[type="checkbox"]` | Seleciona os inputs especificamente do tipo checkbox. |
| **Filho Direto (`>`)** | `li > p` | Seleciona apenas o `<p>` que é filho imediato de `<li>`. |
| **Irmão Adjacente (`+`)** | `input:checked + p` | Seleciona o `<p>` posicionado **logo após** um checkbox marcado. |

---

## 8. Erros Comuns e Cuidados

1. **Esquecer de abrir o `<body>` ao criar tabelas**:
* ❌ *Incorreto*: Inserir a tag `<table>` diretamente após o fechamento do `</head>`.
* ✔️ *Correto*: Toda tabela visível deve estar envolta na tag `<body>...</body>`.


2. **Escrever tags e atributos colados**:
* ❌ *Incorreto*: `<tdrowspan="3">`, `<inputtype="checkbox"/>`, `<ulstyle="...">`
* ✔️ *Correto*: `<td rowspan="3">`, `<input type="checkbox">`, `<ul style="...">`


3. **Não compensar o `rowspan` nas linhas seguintes**:
* Se colocar `rowspan="3"` em uma célula e não remover os `<td>` correspondentes das duas linhas de baixo, a tabela "quebrará" e ficará desalinhada com colunas sobrando.


4. **Uso de acentos e caracteres especiais em nomes de arquivos**:
* ❌ *Incorreto*: Salvar como `básico.html`.
* ✔️ *Correto*: Salvar como `basico.html` (evita falhas de links e incompatibilidade em servidores Linux).



---

## 9. Correções Técnicas das Minhas Anotações

* **Estrutura Ausente em `quintoarquivo.html**`: A anotação original colocava a tag `<table>` fora do `<body>`. Corrigi adicionando o `<body>` de forma limpa e semântica.
* **Atributos Colados**: Ajustei todas as ocorrências onde atributos estavam sem espaço (`<imgsrc=`, `<tdrowspan=`, `<metacharset=`, `<linkrel=`, `<inputtype=`, `<ulstyle=`).
* **Tag de Link Vazia em `quintoarquivo.html**`: No rascunho da aula, o 4º item da tabela continha a tag `<ahref="..."></a>` sem texto interno, deixando o link invisível na página. Adicionei o texto `Ouça agora`.
* **Erros de Digitação**: Corrigi `Red Host` para `Red Hot Chili Peppers`, e `Ingrendientes` para `Ingredientes`.
* **Sintaxe do Checkbox**: Ajustei o fechamento do `<input type="checkbox"/>` para o padrão moderno HTML5 `<input type="checkbox">`.

---

## 10. Aprofundamento e Boas Práticas (Conteúdo Complementar)

### O Perigo do `!important`

No arquivo `index.css`, utilizamos `color: black !important;`. O `!important` força a regra a se sobressair sobre todas as outras. Em projetos profissionais, **evite abusar do `!important**`, pois ele quebra a cascata natural do CSS e torna a manutenção e sobrescrita de estilos extremamente difícil conforme o projeto cresce.

### Bordas em Tabelas via CSS

No arquivo HTML utilizamos `border="1"`. Esse atributo visual é considerado **antigo/obsoleto no HTML5**. A forma moderna recomendada para adicionar bordas em tabelas é via CSS:

```css
table, th, td {
    border: 1px solid #ccc;
    border-collapse: collapse; /* Remove os espaços duplos entre as bordas das células */
}

```

---

## 11. Guia Rápido de Memorização

* **Tabela Básica**: `<table>` → `<thead>` (`<tr>` + `<th>`) → `<tbody>` (`<tr>` + `<td>`).
* **Mesclar Linhas Verticalmente**: `<td rowspan="3">`.
* **Vincular Arquivo CSS Externo**: `<link rel="stylesheet" href="index.css">` (no `<head>`).
* **Seletor de Classe**: `.nome-classe { ... }`.
* **Efeito Riscado**: `text-decoration: line-through;`.
* **Colocar Elementos Lado a Lado**: `display: inline;`.

---

## 12. Resumo Relâmpago — 10 Linhas

1. Tabelas HTML organizam dados em linhas (`<tr>`) e colunas com cabeçalhos (`<th>`) e células (`<td>`).
2. As tags `<thead>` e `<tbody>` agrupam respectivamente o cabeçalho e os dados principais de uma tabela.
3. O atributo `rowspan` funde células na vertical, fazendo uma única célula ocupar múltiplas linhas.
4. CSS é a linguagem responsável por aplicar estilos visuais, layouts e cores às páginas HTML.
5. O CSS Interno é inserido na tag `<style>` dentro do `<head>`, enquanto o CSS Externo usa um arquivo `.css` separado.
6. A tag `<link rel="stylesheet" href="index.css">` conecta o arquivo HTML ao seu código CSS externo.
7. O seletor universal `*` aplica regras globais de estilo para todos os elementos da página.
8. A propriedade `display: inline` faz com que elementos de bloco (como `<p>`) fiquem na mesma linha de outros elementos.
9. A pseudo-classe `:checked` permite aplicar estilos CSS dinâmicos a checkboxes e radios marcados.
10. O combinador `+` permite estilizar um elemento irmão que vem imediatamente após outro selecionado.
