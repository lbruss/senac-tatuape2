# Arquitetura E-Commerce Multi-páginas (HTML5): Estrutura, Vitrines Dinâmicas e Painéis de Gestão

---

## 1. Visão Geral

Nesta etapa do projeto **StyleStore**, construí a arquitetura HTML5 completa de uma loja virtual multi-páginas. O sistema foi estruturado em seis documentos principais: a vitrine inicial (`index.html`), três catálogos segmentados por público (`feminina.html`, `masculina.html` e `infantil.html`) e dois ambientes restritos com autenticação (`cliente.html` e `vendedor.html`).

Aprendi a manter a consistência visual e funcional entre diferentes arquivos HTML compartilhando uma única folha de estilos (`css/style.css`) e um motor lógico central (`js/main.js`). Além disso, preparei pontos de ancoragem (`id` e eventos DOM) para que o JavaScript controle dinamicamente o carrossel de banners, a filtragem de produtos por categoria, o carrinho de compras flutuante e a exportação de relatórios gerenciais.

---

## 2. Entendendo o Conceito

### O que é uma Aplicação Web Multi-páginas (MPA) Modularizada?

* **Conceito simples**: É um site dividido em vários arquivos `.html` separados (um para cada seção da loja), mas que compartilham os mesmos blocos estruturais — como o menu superior e o carrinho de compras — para que o usuário sinta que está navegando dentro de um único sistema integrado.
* **Definição técnica**: Em uma arquitetura *Multi-Page Application* (MPA), cada navegação no menu carrega um novo documento HTML do servidor ou sistema de arquivos. Para evitar repetição de código lógico e visual, todos os documentos importam os mesmos ativos estáticos (`style.css` e `main.js`) e utilizam ganchos específicos no DOM (como `#grid-feminina` ou `#tabela-pedidos-cliente`) para que o script saiba exatamente qual conteúdo renderizar em cada tela.
* **Analogia**: Imagine uma **loja de departamentos de vários andares**. Cada arquivo HTML é um andar diferente (Moda Feminina, Moda Masculina, Moda Infantil, Atendimento ao Cliente). A fachada e a sinalização (Cabeçalho) seguem o mesmo padrão em todos os pisos, e a sacola de compras que você carrega (Carrinho Flutuante) acompanha você de um andar para o outro.

```
┌────────────────────────────────────────────────────────────────────────┐
│  HEADER GLOBAL (Style Store + Navegação com Indicador .active)         │
├────────────────────────────────────────────────────────────────────────┤
│  DOCUMENTOS HTML DA APLICAÇÃO (loja/):                                 │
│  ├─ index.html     ──► Carrossel Auto + Vitrine (#grid-destaques)      │
│  ├─ feminina.html  ──► Vitrine Filtrada (#grid-feminina)               │
│  ├─ masculina.html ──► Vitrine Filtrada (#grid-masculina)              │
│  ├─ infantil.html  ──► Vitrine Filtrada (#grid-infantil)               │
│  ├─ cliente.html   ──► Login + Tabela Pedidos (#painel-cliente)        │
│  └─ vendedor.html  ──► Login + Dashboard + Relatórios (#painel-vendedor)│
├────────────────────────────────────────────────────────────────────────┤
│  COMPONENTES GLOBAIS COMPARTILHADOS:                                   │
│  ├─ Botão Flutuante (.carrinho-flutuante -> #carrinho-qtd)             │
│  └─ Modal de Checkout (#modal-carrinho -> #carrinho-itens / total)     │
└────────────────────────────────────────────────────────────────────────┘

```

---

## 3. Conceitos Fundamentais

### 3.1. Organização de Diretórios do Projeto

A separação dos arquivos por responsabilidade evita desorganização conforme o projeto cresce:

* `loja/` (Raiz): Contém exclusivamente os arquivos de marcação `.html`.
* `loja/css/`: Armazena as folhas de estilo (`style.css`).
* `loja/js/`: Centraliza toda a programação e regras de negócio (`main.js`).
* `loja/img/`: Guarda os banners promocionais e fotos dos produtos.

### 3.2. Navegação Contextual com `class="active"`

Em cada arquivo HTML, o link correspondente à própria página recebe a classe CSS `active` dentro da tag `<nav>`. Isso fornece retorno visual imediato ao usuário sobre sua localização atual no site.

### 3.3. Ciclo de Vida `DOMContentLoaded` e Inicialização Contextual

Ao final de cada arquivo HTML, utilizamos o ouvinte `document.addEventListener('DOMContentLoaded', ...)`. Esse evento garante que o navegador termine de ler e construir toda a árvore HTML antes de executar as funções JavaScript que buscam elementos por `id` na tela. Cada página invoca apenas as funções necessárias para o seu contexto (ex: `renderizarDestaques()` na Home; `renderizarCategoria('feminina')` na página feminina).

### 3.4. Eventos Declarativos Inline (`onmouseenter`, `onmouseleave`, `onclick`, `onsubmit`)

Os atributos de evento diretamente nas tags HTML conectam ações do usuário às funções definidas em `js/main.js`:

* `onmouseenter="pausarCarrossel()"` e `onmouseleave="iniciarCarrosselBannersAuto()"`: Pausam a troca automática de banners quando o usuário posiciona o mouse sobre a imagem e retomam ao retirar o cursor.
* `onsubmit="realizarLoginCliente(event)"`: Intercepta o envio do formulário de login, passando o objeto `event` para impedir o recarregamento da página.

### 3.5. Alternância de Telas no Mesmo Documento (Login vs. Painel)

Nas páginas `cliente.html` e `vendedor.html`, tanto a caixa de login (`#box-login`) quanto o painel interno (`#painel-cliente` / `#painel-vendedor`) existem no mesmo HTML. O painel inicia oculto pela classe `.painel-escondido` (`display: none`) e é revelado via JavaScript após a validação da sessão.

---

## 4. Código / Exemplos Práticos

Abaixo estão os seis arquivos HTML que estruturam a **StyleStore**, organizados na raiz da pasta `loja/`.

### Arquivo 1: `index.html` (Página Inicial)

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleStore - Home</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- Cabeçalho Principal com Navegação -->
    <header>
        <div class="header-container">
            <h1>Style Store</h1>
            <nav>
                <a href="index.html" class="active">Home</a>
                <a href="feminina.html">Feminina</a>
                <a href="masculina.html">Masculina</a>
                <a href="infantil.html">Infantil</a>
                <a href="cliente.html">Área do cliente</a>
                <a href="vendedor.html">Área do vendedor</a>
            </nav>
        </div>
    </header>

    <!-- Conteúdo Principal -->
    <main class="container">
        <!-- Banner Carrossel com 6 imagens -->
        <section class="carrossel-container" onmouseenter="pausarCarrossel()" onmouseleave="iniciarCarrosselBannersAuto()">
            <div class="carrossel-wrapper" id="carrossel-slides">
                <!-- Slides gerados automaticamente pelo JS -->
            </div>
            <!-- Botões de Navegação Anterior/Próximo -->
            <button class="carrossel-btn btn-prev" onclick="mudarSlide(-1)" aria-label="Slide Anterior">&#10094;</button>
            <button class="carrossel-btn btn-next" onclick="mudarSlide(1)" aria-label="Próximo Slide">&#10095;</button>

            <!-- Indicadores (Pontos/Bullets) -->
            <div class="carrossel-indicadores" id="carrossel-indicadores">
                <!-- Bullets gerados dinamicamente -->
            </div>
        </section>

        <!-- Vitrine de Produtos em Destaque -->
        <section>
            <h2 class="titulo-secao">Destaque da loja</h2>
            <div id="grid-destaques" class="grid-produtos"></div>
        </section>
    </main>

    <!-- Botão Flutuante do Carrinho de Compras -->
    <div class="carrinho-flutuante" onclick="abrirModalCarrinho()">
        🛒 Carrinho <span id="carrinho-qtd">0</span>
    </div>

    <!-- Modal do Carrinho de Compras -->
    <div id="modal-carrinho" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Seu Carrinho de Compras</h2>
                <span class="fechar" onclick="fecharModalCarrinho()">&times;</span>
            </div>
            <div id="carrinho-itens" class="carrinho-corpo"></div>
            <div class="carrinho-rodape">
                <h3>Total: R$ <span id="carrinho-total">0.00</span></h3>
                <button class="btn-primary" onclick="finalizarCompra()">Finalizar Compra</button>
            </div>
        </div>
    </div>

    <!-- Rodapé -->
    <footer>
        <p>&copy; 2026 StyleStore - Projeto aula Front-End (HTML, CSS, JS)</p>
    </footer>
    
    <!-- Script JavaScript Principal -->
    <script src="js/main.js"></script> 
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            iniciarCarrosselBanners();
            renderizarDestaques();
        });
    </script>

</body>
</html>

```

---

### Arquivo 2: `feminina.html` (Coleção Feminina)

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Style Store - Moda Feminina</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- Cabeçalho Principal com Navegação -->
    <header>
        <div class="header-container">
            <h1>Style Store</h1>
            <nav>
                <a href="index.html">Home</a>
                <a href="feminina.html" class="active">Feminina</a>
                <a href="masculina.html">Masculina</a>
                <a href="infantil.html">Infantil</a>
                <a href="cliente.html">Área do cliente</a>
                <a href="vendedor.html">Área do vendedor</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <h2 class="titulo-secao">Coleção Moda Feminina</h2>
        <div id="grid-feminina" class="grid-produtos"></div>
    </main>

    <!-- Botão Flutuante do Carrinho de Compras -->
    <div class="carrinho-flutuante" onclick="abrirModalCarrinho()">
        🛒 Carrinho <span id="carrinho-qtd">0</span>
    </div>

    <!-- Modal do Carrinho de Compras -->
    <div id="modal-carrinho" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Seu Carrinho de Compras</h2>
                <span class="fechar" onclick="fecharModalCarrinho()">&times;</span>
            </div>
            <div id="carrinho-itens" class="carrinho-corpo"></div>
            <div class="carrinho-rodape">
                <h3>Total: R$ <span id="carrinho-total">0.00</span></h3>
                <button class="btn-primary" onclick="finalizarCompra()">Finalizar Compra</button>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 StyleStore - Moda Feminina</p>
    </footer>
    
    <!-- Script JavaScript Principal -->
    <script src="js/main.js"></script> 
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            renderizarCategoria('feminina');
        });
    </script>

</body>
</html>

```

---

### Arquivo 3: `masculina.html` (Coleção Masculina)

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Style Store - Moda Masculina</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- Cabeçalho Principal com Navegação -->
    <header>
        <div class="header-container">
            <h1>Style Store</h1>
            <nav>
                <a href="index.html">Home</a>
                <a href="feminina.html">Feminina</a>
                <a href="masculina.html" class="active">Masculina</a>
                <a href="infantil.html">Infantil</a>
                <a href="cliente.html">Área do cliente</a>
                <a href="vendedor.html">Área do vendedor</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <h2 class="titulo-secao">Coleção Moda Masculina</h2>
        <div id="grid-masculina" class="grid-produtos"></div>
    </main>

    <!-- Botão Flutuante do Carrinho de Compras -->
    <div class="carrinho-flutuante" onclick="abrirModalCarrinho()">
        🛒 Carrinho <span id="carrinho-qtd">0</span>
    </div>

    <!-- Modal do Carrinho de Compras -->
    <div id="modal-carrinho" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Seu Carrinho de Compras</h2>
                <span class="fechar" onclick="fecharModalCarrinho()">&times;</span>
            </div>
            <div id="carrinho-itens" class="carrinho-corpo"></div>
            <div class="carrinho-rodape">
                <h3>Total: R$ <span id="carrinho-total">0.00</span></h3>
                <button class="btn-primary" onclick="finalizarCompra()">Finalizar Compra</button>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 StyleStore - Moda Masculina</p>
    </footer>
    
    <!-- Script JavaScript Principal -->
    <script src="js/main.js"></script> 
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            renderizarCategoria('masculina');
        });
    </script>

</body>
</html>

```

---

### Arquivo 4: `infantil.html` (Coleção Infantil)

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Style Store - Moda Infantil</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- Cabeçalho Principal com Navegação -->
    <header>
        <div class="header-container">
            <h1>Style Store</h1>
            <nav>
                <a href="index.html">Home</a>
                <a href="feminina.html">Feminina</a>
                <a href="masculina.html">Masculina</a>
                <a href="infantil.html" class="active">Infantil</a>
                <a href="cliente.html">Área do cliente</a>
                <a href="vendedor.html">Área do vendedor</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <h2 class="titulo-secao">Coleção Moda Infantil</h2>
        <div id="grid-infantil" class="grid-produtos"></div>
    </main>

    <!-- Botão Flutuante do Carrinho de Compras -->
    <div class="carrinho-flutuante" onclick="abrirModalCarrinho()">
        🛒 Carrinho <span id="carrinho-qtd">0</span>
    </div>

    <!-- Modal do Carrinho de Compras -->
    <div id="modal-carrinho" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Seu Carrinho de Compras</h2>
                <span class="fechar" onclick="fecharModalCarrinho()">&times;</span>
            </div>
            <div id="carrinho-itens" class="carrinho-corpo"></div>
            <div class="carrinho-rodape">
                <h3>Total: R$ <span id="carrinho-total">0.00</span></h3>
                <button class="btn-primary" onclick="finalizarCompra()">Finalizar Compra</button>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 StyleStore - Moda Infantil</p>
    </footer>
    
    <!-- Script JavaScript Principal -->
    <script src="js/main.js"></script> 
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            renderizarCategoria('infantil');
        });
    </script>

</body>
</html>

```

---

### Arquivo 5: `cliente.html` (Área do Cliente)

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleStore - Área do cliente</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- Cabeçalho Principal com Navegação -->
    <header>
        <div class="header-container">
            <h1>Style Store</h1>
            <nav>
                <a href="index.html">Home</a>
                <a href="feminina.html">Feminina</a>
                <a href="masculina.html">Masculina</a>
                <a href="infantil.html">Infantil</a>
                <a href="cliente.html" class="active">Área do cliente</a>
                <a href="vendedor.html">Área do vendedor</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <!-- Formulário de Autenticação -->
        <div id="box-login" class="card-form">
            <h2>Login do Cliente</h2>
            <form onsubmit="realizarLoginCliente(event)">
                <div class="form-group">
                    <label for="cliente-email">E-mail:</label>
                    <input type="email" id="cliente-email" required placeholder="seuemail@exemplo.com">
                </div>
                <div class="form-group">
                    <label for="cliente-senha">Senha:</label>
                    <input type="password" id="cliente-senha" required placeholder="Digite sua senha">
                </div>
                <button type="submit" class="btn-primary btn-block">Entrar</button>
            </form>
        </div>

        <!-- Painel de Acompanhamento de Pedidos (Exibido após Login) -->
        <div id="painel-cliente" class="painel-escondido">
            <div class="topo-painel">
                <h2>Bem-vindo(a), <span id="nome-usuario-logado">Cliente</span>!</h2>
                <button class="btn-secundario" onclick="realizarLogout()">Sair</button>
            </div>

            <h3 class="subtitulo-painel">Meus Pedidos Realizados</h3>
            <div class="tabela-container">
                <table>
                    <thead>
                        <tr>
                            <th>Nº Pedido</th>
                            <th>Data</th>
                            <th>Item(s)</th>
                            <th>Total</th>
                            <th>Status de Acompanhamento</th>
                        </tr>
                    </thead>
                    <tbody id="tabela-pedidos-cliente"></tbody>
                </table>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2026 StyleStore - Área do Cliente</p>
    </footer>

    <!-- Script JavaScript Principal -->
    <script src="js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            verificarSessaoCliente();
        });
    </script>

</body>
</html>

```

---

### Arquivo 6: `vendedor.html` (Painel Administrativo)

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Style Store - Área do Vendedor</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- Cabeçalho Principal com Navegação -->
    <header>
        <div class="header-container">
            <h1>Style Store - Painel Gerencial</h1>
            <nav>
                <a href="index.html">Sair do Painel</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <!-- Tela de Login do Vendedor -->
        <div id="box-login-vendedor" class="card-form">
            <h2>Login do Vendedor</h2>
            <form onsubmit="realizarLoginVendedor(event)">
                <div class="form-group">
                    <label for="vendedor-user">Usuário / E-mail:</label>
                    <input type="text" id="vendedor-user" required placeholder="vendedor@loja.com">
                </div>
                <div class="form-group">
                    <label for="vendedor-pass">Senha:</label>
                    <input type="password" id="vendedor-pass" required placeholder="123456">
                </div>
                <button type="submit" class="btn-primary btn-block">Acessar Painel</button>
            </form>
        </div>

        <!-- Dashboard Administrativo (Exibido após o Login) -->
        <div id="painel-vendedor" class="painel-escondido">
            <div class="topo-painel">
                <h2>Painel de Controle de Vendas</h2>
                <button class="btn-secundario" onclick="realizarLogoutVendedor()">Sair</button>
            </div>

            <!-- Botões de Exportação de Relatórios -->
            <section class="card-relatorio">
                <h3>Gerar Relatórios de Vendas</h3>
                <p>Selecione o formato desejado para exportação instantânea:</p>
                <div class="acoes-relatorio">
                    <button class="btn-relatorio btn-csv" onclick="exportarCSV()">Exportar CSV</button>
                    <button class="btn-relatorio btn-excel" onclick="exportarExcel()">Exportar Excel</button>
                    <button class="btn-relatorio btn-pdf" onclick="exportarPDF()">Exportar PDF</button>
                </div>
            </section>

            <!-- Tabela Geral de Vendas para Impressão e Visualização -->
            <section id="area-relatorio-impressao">
                <div class="cabecalhos-relatorio-pdf">
                    <h2>Style Store - Relatório Oficial de Vendas</h2>
                    <p>Emissão: <span id="data-relatorio"></span></p>
                </div>

                <h3>Histórico de Pedidos Registrados</h3>
                <div class="tabela-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID Pedido</th>
                                <th>Cliente</th>
                                <th>E-mail</th>
                                <th>Data</th>
                                <th>Total (R$)</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="tabela-vendas-vendedor"></tbody>
                    </table>
                </div>
            </section>
        </div>
    </main>

    <footer>
        <p>&copy; 2026 Style Store - Módulo Administrativo</p>
    </footer>

    <!-- Script JavaScript Principal -->
    <script src="js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            verificarSessaoVendedor();
        });
    </script>

</body>
</html>

```

---

## 5. Desmontando o Código

### Análise do Carrossel Interativo (`index.html`)

* `<section class="carrossel-container" onmouseenter="pausarCarrossel()" onmouseleave="iniciarCarrosselBannersAuto()">`:
* *O que faz*: Detecta a entrada e a saída do ponteiro do mouse sobre a área do banner.
* *Por que está ali*: Evita que o slide mude de imagem enquanto o cliente está lendo uma oferta ou tentando clicar no botão do banner.


* `<div class="carrossel-wrapper" id="carrossel-slides">` e `<div class="carrossel-indicadores" id="carrossel-indicadores">`:
* *O que faz*: Servem como contêineres vazios onde o JavaScript injetará dinamicamente os 6 slides e as bolinhas de navegação.



### Análise das Vitrines Segmentadas (`feminina.html`, `masculina.html`, `infantil.html`)

* `renderizarCategoria('feminina')` (e equivalentes):
* *O que faz*: Ao carregar o DOM da página, chama uma única função genérica no `main.js` passando o nome da categoria como argumento (`string`). A função filtra o catálogo de produtos e injeta os cards na respectiva `div` (`#grid-feminina`, `#grid-masculina` ou `#grid-infantil`).



### Análise da Área de Impressão (`vendedor.html`)

* `<section id="area-relatorio-impressao">` e `<div class="cabecalhos-relatorio-pdf">`:
* *O que faz*: Isola a tabela de vendas e um cabeçalho oficial (oculto na tela normal) para que, quando o vendedor clicar em **Exportar PDF**, a regra `@media print` do CSS imprima exclusivamente os dados financeiros, ignorando menus e botões.



---

## 6. Passo a Passo: Montagem da Estrutura no VS Code

1. **Criar a árvore de diretórios**:
* Crie a pasta principal `loja`.
* Dentro de `loja`, crie três subpastas: `css`, `img` e `js`.


2. **Abastecer a pasta de imagens**:
* Salve as imagens de banners e peças de roupas dentro de `loja/img/`.


3. **Criar os documentos HTML na raiz (`loja/`)**:
* Crie `index.html`, `feminina.html`, `masculina.html`, `infantil.html`, `cliente.html` e `vendedor.html`.


4. **Criar os arquivos de estilo e script**:
* Crie `style.css` dentro de `loja/css/`.
* Crie `main.js` dentro de `loja/js/`.


5. **Conferir os vínculos relativos**:
* Certifique-se de que todos os HTMLs apontam para `href="css/style.css"` no `<head>` e `src="js/main.js"` antes do fechamento de `</body>`.



---

## 7. Tabelas Comparativas

### Tabela 1: Mapeamento das Páginas HTML e Chamadas de Inicialização

| Arquivo HTML | Contêiner Principal | Link Ativo (`class="active"`) | Funções Executadas no `DOMContentLoaded` |
| --- | --- | --- | --- |
| `index.html` | `#carrossel-slides` e `#grid-destaques` | Home | `iniciarCarrosselBanners()`, `renderizarDestaques()` |
| `feminina.html` | `#grid-feminina` | Feminina | `renderizarCategoria('feminina')` |
| `masculina.html` | `#grid-masculina` | Masculina | `renderizarCategoria('masculina')` |
| `infantil.html` | `#grid-infantil` | Infantil | `renderizarCategoria('infantil')` |
| `cliente.html` | `#box-login` e `#painel-cliente` | Área do cliente | `verificarSessaoCliente()` |
| `vendedor.html` | `#box-login-vendedor` e `#painel-vendedor` | *(Link de retorno à Home)* | `verificarSessaoVendedor()` |

### Tabela 2: Componentes Globais vs. Componentes Específicos

| Escopo | Componentes | Arquivos Onde Aparecem | Finalidade |
| --- | --- | --- | --- |
| **Global (Vitrine)** | `.carrinho-flutuante` e `#modal-carrinho` | `index`, `feminina`, `masculina`, `infantil` | Permitir adicionar/visualizar itens e finalizar compras em qualquer catálogo. |
| **Específico (Home)** | `.carrossel-container` | Apenas `index.html` | Exibir banners promocionais rotativos na página de entrada. |
| **Específico (Gestão)** | `.card-form` e `.painel-escondido` | `cliente.html` e `vendedor.html` | Controlar autenticação e exibir tabelas de pedidos ou relatórios. |

---

## 8. Erros Comuns e Cuidados

1. **Divergência entre o nome físico do arquivo e o link `href**`:
* ❌ *Incorreto*: Salvar o arquivo no computador como `femenina.html` (com "e") enquanto o menu de navegação aponta para `<a href="feminina.html">` (com "i"). O navegador exibirá erro *404 Not Found* ao clicar no link.
* ✔️ *Correto*: Nomear o arquivo exatamente como `feminina.html` para coincidir com todos os links `<nav>` do projeto.


2. **Esquecer de atualizar `class="active"` ao duplicar templates HTML**:
* Ao copiar a estrutura de `index.html` para criar as páginas de categorias, é comum esquecer de mover `class="active"` para o link da nova página, deixando "Home" sempre destacada.


3. **Incompatibilidade de nomes entre HTML e JavaScript**:
* Os `id`s das grades (`#grid-destaques`, `#grid-feminina`) e os nomes das funções (`iniciarCarrosselBannersAuto()`, `verificarSessaoCliente()`) devem ser escritos exatamente com a mesma grafia e letras maiúsculas/minúsculas (*camelCase*) definidas no `js/main.js`.



---

## 9. Validação e Ajustes Técnicos das Anotações

* **Padronização do Nome do Arquivo `feminina.html**`: Na instrução escrita constava `femenina.html`, mas todos os links `<nav>` do projeto apontam para `feminina.html`. O título do bloco de código foi ajustado para `feminina.html` para evitar quebra de navegação.
* **Integridade dos Ganchos e Funções**: Todos os identificadores (`#grid-destaques`, `#carrinho-qtd`, `#modal-carrinho`), eventos (`DOMContentLoaded`, `onmouseleave="iniciarCarrosselBannersAuto()"`) e chamadas de funções (`renderizarCategoria()`, `verificarSessaoCliente()`, `verificarSessaoVendedor()`) estão perfeitamente alinhados entre os seis documentos.
* **Acessibilidade em Formulários**: Adicionados os atributos `for` nas tags `<label>` de `cliente.html` e `vendedor.html` vinculando-os aos respectivos `id`s dos campos `<input>`.

---

## 10. Aprofundamento e Boas Práticas (Conteúdo Complementar)

### Acessibilidade com ARIA (`aria-label`)

Nos botões de navegação do carrossel (`&#10094;` e `&#10095;`), o uso de símbolos gráficos sem texto visível dificulta a compreensão por leitores de tela utilizados por pessoas com deficiência visual. O atributo `aria-label="Slide Anterior"` e `aria-label="Próximo Slide"` resolve esse problema fornecendo uma descrição textual invisível para tecnologias assistivas.

### Manutenção de Estado em Aplicações Multi-páginas

Como cada clique no menu recarrega um novo documento HTML, variáveis comuns em memória JavaScript são reiniciadas a cada troca de tela. Para que os itens adicionados ao carrinho na página `feminina.html` continuem aparecendo ao navegar para `masculina.html`, o arquivo `js/main.js` utiliza a API `localStorage` do navegador para gravar e recuperar os dados entre páginas.

---

## 11. Guia Rápido de Memorização

* **Vincular CSS na subpasta**: `<link rel="stylesheet" href="css/style.css">`
* **Vincular JS na subpasta**: `<script src="js/main.js"></script>`
* **Aguardar carregamento seguro do DOM**: `document.addEventListener('DOMContentLoaded', () => { ... });`
* **Pausar/Retomar evento com mouse**: `onmouseenter="funcaoPausar()"` / `onmouseleave="funcaoRetomar()"`
* **Interceptar envio de formulário**: `<form onsubmit="minhaFuncao(event)">`
* **Ocultar painel antes do login**: `class="painel-escondido"`
* **Caracteres especiais úteis em HTML**: `&times;` (ícone × de fechar), `&copy;` (símbolo ©), `&#10094;` (seta ❮), `&#10095;` (seta ❯).

---

## 12. Resumo Relâmpago — 10 Linhas

1. O projeto **StyleStore** utiliza uma arquitetura multi-páginas (*MPA*) organizada na pasta raiz `loja/` com subpastas `css/`, `img/` e `js/`.
2. Todos os seis arquivos HTML compartilham a mesma folha de estilos (`css/style.css`) e o mesmo script lógico (`js/main.js`).
3. O cabeçalho de navegação utiliza `class="active"` para destacar visualmente a página atual em cada documento.
4. A página `index.html` integra um carrossel de banners com controle de pausa ao passar o mouse (`onmouseenter` e `onmouseleave`).
5. As páginas `feminina.html`, `masculina.html` e `infantil.html` reutilizam a mesma estrutura de vitrine, alterando apenas o parâmetro de `renderizarCategoria()`.
6. O botão flutuante e o modal do carrinho de compras estão presentes em todas as páginas de catálogo para permitir compras contínuas.
7. As páginas `cliente.html` e `vendedor.html` alternam entre o formulário de login e o painel interno após validação da sessão.
8. O painel do vendedor possui uma área dedicada (`#area-relatorio-impressao`) estruturada para exportação em CSV, Excel e PDF.
9. O evento `DOMContentLoaded` assegura que as funções JavaScript só sejam executadas após a montagem completa dos elementos HTML.
10. Manter a exatidão entre nomes de arquivos, links `href`, classes CSS e `id`s é fundamental para o funcionamento integrado do front-end.
