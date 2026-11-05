# E-Commerce Multi-páginas: Estrutura HTML5, Componentes Globais, Vitrines Temáticas e Painéis de Gestão

**Visão Geral**

Nesta aula, avancei para o desenvolvimento de uma aplicação web completa de e-commerce multi-páginas: a **StyleStore**. Desenvolvi a arquitetura front-end de uma loja virtual moderna, dividida em páginas públicas de navegação (Home, Feminina, Masculina e Infantil) e áreas restritas com controle de sessão (Área do Cliente e Painel do Vendedor).

Compreendi como estruturar componentes reaproveitáveis (como o cabeçalho global, a vitrine de produtos, o carrinho de compras flutuante e o modal de finalização de pedidos) mantendo a consistência da interface entre diferentes telas. Além disso, preparei o HTML para interações avançadas em JavaScript, como carrossel automatizado de banners, renderização dinâmica de produtos por categoria, manipulação de estado do carrinho e exportação de relatórios em CSV, Excel e PDF.

---

**Entendendo o Conceito**

## Arquitetura de E-Commerce Multi-páginas (MPA)

* **Conceito simples**: É a estrutura tradicional de uma loja online em que cada seção principal (capa, roupas femininas, roupas masculinas, área de login) possui seu próprio arquivo HTML. No entanto, o visual e as funcionalidades essenciais (como o carrinho de compras) continuam funcionando da mesma forma em todas as telas.
* **Definição técnica**: Em uma aplicação multi-páginas (*Multi-Page Application - MPA*), o navegador realiza uma requisição HTTP para carregar um novo documento HTML a cada mudança de rota no menu de navegação. Para garantir a continuidade da experiência, os scripts globais (`main.js`) e as folhas de estilo universais (`style.css`) são compartilhados por todos os arquivos HTML, mantendo dados persistentes (como itens do carrinho ou estado da sessão) via armazenamento local do navegador (*LocalStorage*).
* **Analogia**: Pense em um **shopping center físico**. Cada página HTML (`feminina.html`, `masculina.html`) é uma ala ou andar diferente do shopping. O cabeçalho é a fachada do prédio (igual em todas as entradas), e o carrinho flutuante é o seu **carrinho de compras de rodinhas**, que você leva junto ao caminhar por qualquer andar do estabelecimento.

```
┌────────────────────────────────────────────────────────────────────────┐
│  HEADER GLOBAL (Style Store + Links de Navegação com Classe Active)    │
├────────────────────────────────────────────────────────────────────────┤
│  PÁGINAS DO SISTEMA:                                                   │
│  ├─ index.html     -> Carrossel Banners + Destaques da Loja           │
│  ├─ feminina.html  -> Vitrine Específica da Coleção Feminina           │
│  ├─ masculina.html -> Vitrine Específica da Coleção Masculina           │
│  ├─ infantil.html  -> Vitrine Específica da Coleção Infantil           │
│  ├─ cliente.html   -> Login + Histórico de Pedidos Pessoais            │
│  └─ vendedor.html  -> Login + Dashboard + Exportação de Relatórios    │
├────────────────────────────────────────────────────────────────────────┤
│  COMPONENTES FIXOS EM TODAS AS PÁGINAS:                                │
│  ├─ Carrinho Flutuante com Contador (#carrinho-qtd)                    │
│  └─ Modal de Checkout (#modal-carrinho)                                │
└────────────────────────────────────────────────────────────────────────┘

```

---

**Conceitos Fundamentais**

## Organização de Arquivos e Pastas do Projeto

Para garantir a manutenibilidade do código em projetos de médio e grande porte, dividi os ativos em diretórios bem definidos dentro da pasta raiz `loja/`:

* `css/`: Guarda as folhas de estilo globais (`style.css`).
* `js/`: Armazena a lógica de negócios, manipuladores de eventos e funções auxiliares (`main.js`).
* `img/`: Armazena os banners publicitários e imagens de produtos da loja.

## Indicador de Página Ativa (`class="active"`)

Nos links de navegação dentro do `<header>`, utilizou-se a classe `active` para indicar ao cliente exatamente em qual seção da loja ele se encontra. Isso melhora a usabilidade e a experiência do usuário (UX).

## Componente de Carrossel de Banners (`onmouseenter` e `onmouseleave`)

Na página principal (`index.html`), o banner promocional possui manipuladores de eventos inline para controle da temporização do carrossel:

* `onmouseenter="pausarCarrossel()"`: Pausa a rotação automática de slides quando o usuário passa o ponteiro do mouse sobre o banner para ler uma promoção.
* `onmouseleave="iniciarCarrosselAuto()"`: Retoma a transição automática assim que o mouse sai da área do banner.

## Controle de Exibição de Painéis por Autenticação

Nas telas `cliente.html` e `vendedor.html`, os formulários de login (`#box-login`) e os painéis administrativos (`#painel-cliente` e `#painel-vendedor`) coexistem no mesmo arquivo HTML. Inicialmente, o painel recebe a classe CSS `painel-escondido` (`display: none`). Após a validação das credenciais pelo JavaScript, o formulário é ocultado e o painel torna-se visível.

## Ciclo de Vida da Página (`DOMContentLoaded`)

Todos os scripts inline utilizam o evento `DOMContentLoaded`. Isso garante que o JavaScript só tente buscar elementos no DOM (como contêineres de produtos ou botões) após todo o HTML da página ter sido completamente lido e construído pela árvore do navegador.

---

### Código / Exemplos Práticos

Abaixo estão os 6 arquivos HTML que compõem a estrutura completa da **StyleStore**, com todas as correções técnicas de caminhos, links ativos, nomes de arquivos e chamadas de scripts devidamente padronizados.

**Arquivo 1: `index.html` (Página Principal)**

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
        <!-- Banner Carrossel com Imagens Promocionais -->
        <section class="carrossel-container" onmouseenter="pausarCarrossel()" onmouseleave="iniciarCarrosselAuto()">
            <div class="carrossel-wrapper" id="carrossel-slides">
                <!-- Slides gerados automaticamente pelo JS -->
            </div>
            <!-- Botões de Navegação Anterior/Próximo -->
            <button class="carrossel-btn btn-prev" onclick="mudarSlide(-1)" aria-label="Slide Anterior">&#10094;</button>
            <button class="carrossel-btn btn-next" onclick="mudarSlide(1)" aria-label="Próximo Slide">&#10095;</button>

            <!-- Indicadores (Bullets) -->
            <div class="carrossel-indicadores" id="carrossel-indicadores">
                <!-- Bullets gerados dinamicamente -->
            </div>
        </section>

        <!-- Vitrine de Produtos em Destaque -->
        <section>
            <h2 class="titulo-secao">Destaques da Loja</h2>
            <div id="grid-destaque" class="grid-produtos"></div>
        </section>
    </main>

    <!-- Botão Flutuante do Carrinho de Compras -->
    <div class="carrinho-flutuante" onclick="abrirModalCarrinho()">
        Carrinho <span id="carrinho-qtd">0</span>
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
        <p>&copy; 2026 StyleStore - Projeto Aula Front-End (HTML, CSS, JS)</p>
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

**Arquivo 2: `feminina.html` (Coleção Feminina)**

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleStore - Moda Feminina</title>
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
        Carrinho <span id="carrinho-qtd">0</span>
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

**Arquivo 3: `masculina.html` (Coleção Masculina)**

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleStore - Moda Masculina</title>
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
        Carrinho <span id="carrinho-qtd">0</span>
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

**Arquivo 4: `infantil.html` (Coleção Infantil)**

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleStore - Moda Infantil</title>
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
        Carrinho <span id="carrinho-qtd">0</span>
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

**Arquivo 5: `cliente.html` (Portal do Consumidor)**

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleStore - Área do Cliente</title>
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

        <!-- Painel de Acompanhamento (Exibido após Login) -->
        <div id="painel-cliente" class="painel-escondido">
            <div class="topo-painel">
                <h2>Bem-vindo(a), <span id="nome-usuario-logado">Cliente</span>!</h2>
                <button class="btn-secundario" onclick="realizarLogoutCliente()">Sair</button>
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

    <!-- Rodapé -->
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

**Arquivo 6: `vendedor.html` (Módulo Administrativo)**

```html
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleStore - Área do Vendedor</title>
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

    <!-- Rodapé -->
    <footer>
        <p>&copy; 2026 StyleStore - Módulo Administrativo</p>
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

**Desmontando o Código**

**Análise dos Carrosséis e Eventos Inline (`index.html`)**

* `onmouseenter="pausarCarrossel()"` e `onmouseleave="iniciarCarrosselAuto()"`:
* *O que faz*: O `onmouseenter` detecta quando o ponteiro do mouse entra na área da `<section>`, disparando uma função JS que pausa o temporizador (`clearInterval`). O `onmouseleave` faz o oposto, reativando o `setInterval`.
* *Por que está ali*: Garante acessibilidade e usabilidade para que o cliente consiga ler o conteúdo dos banners sem que o slide mude involuntariamente.

**Análise da Chamada de Scripts e Funções Específicas por Página**

* Em `index.html`: Chamo `renderizarDestaques()`, preenchendo a div `#grid-destaque`.
* Em `feminina.html`, `masculina.html` e `infantil.html`: Substituí a chamada genérica de destaques por `renderizarCategoria('nome_da_categoria')`. Isso orienta a função JS a filtrar a base de dados de produtos e injetar o HTML apenas dos itens pertencentes àquela categoria no contêiner correspondente (`#grid-feminina`, `#grid-masculina`, `#grid-infantil`).

**Análise da Estrutura da Área Administrativa (`vendedor.html`)**

* `<section id="area-relatorio-impressao">`: Agrupa a tabela e o cabeçalho oficial de relatórios. Essa estrutura com ID dedicado é fundamental para que, ao disparar a função `exportarPDF()`, a biblioteca de geração selecione apenas esse bloco da tela, ignorando os botões de navegação e menus do site.

---

**Passo a Passo: Estruturação Inicial do Projeto no VS Code**

1. **Criar a estrutura de diretórios pelo terminal ou interface**:
* Crie uma pasta principal chamada `loja`.
* Dentro de `loja`, crie três subpastas: `css`, `img` e `js`.


2. **Adicionar os arquivos de mídia**:
* Baixe 6 banners promocionais em formato retangular (ex: `banner1.jpg` a `banner6.jpg`) e coloque-os dentro da pasta `img/`.


3. **Criar os arquivos de código no VS Code**:
* Na raiz da pasta `loja`, crie os arquivos HTML: `index.html`, `feminina.html`, `masculina.html`, `infantil.html`, `cliente.html` e `vendedor.html`.
* Na pasta `css/`, crie o arquivo `style.css`.
* Na pasta `js/`, crie o arquivo `main.js`.


4. **Vincular os arquivos globais nos HTMLs**:
* No `<head>` de cada arquivo HTML, insira o link do CSS: `<link rel="stylesheet" href="css/style.css">`.
* Antes do fechamento da tag `</body>`, insira o script principal: `<script src="js/main.js"></script>`.

---

## Tabelas Comparativas

**Tabela 1: Estrutura das Páginas do E-Commerce StyleStore**

| Arquivo HTML | Função Principal | Elementos Chave | Chamadas no `DOMContentLoaded` |
| --- | --- | --- | --- |
| `index.html` | Portal de entrada e ofertas gerais | Carrossel de Banners + Grid de Destaques | `iniciarCarrosselBanners()`, `renderizarDestaques()` |
| `feminina.html` | Vitrine da Coleção Feminina | Grid de produtos `#grid-feminina` | `renderizarCategoria('feminina')` |
| `masculina.html` | Vitrine da Coleção Masculina | Grid de produtos `#grid-masculina` | `renderizarCategoria('masculina')` |
| `infantil.html` | Vitrine da Coleção Infantil | Grid de produtos `#grid-infantil` | `renderizarCategoria('infantil')` |
| `cliente.html` | Autenticação e acompanhamento de compras | Formulário de Login + Tabela de Pedidos | `verificarSessaoCliente()` |
| `vendedor.html` | Dashboard gerencial e emissão de dados | Login + Tabela Geral + Botões CSV/Excel/PDF | `verificarSessaoVendedor()` |

**Tabela 2: Tipos de Formatos de Exportação do Painel do Vendedor**

| Formato | Botão / Evento | Tipo de Dado Gerado | Vantagem de Uso |
| --- | --- | --- | --- |
| **CSV** | `exportarCSV()` | Arquivo de texto separado por vírgulas (`.csv`) | Leve, compatível com qualquer banco de dados ou planilha. |
| **Excel** | `exportarExcel()` | Planilha formatada em XML/XLSX (`.xls`) | Ideal para contabilidade e análise de vendas em empresas. |
| **PDF** | `exportarPDF()` | Documento impresso / visual (`.pdf`) | Layout fixo para apresentação oficial de relatórios gerenciais. |

---

## Erros Comuns e Cuidados

1. **Erro de digitação no evento de carregamento do DOM**:
* ❌ *Incorreto*: `document.addEventListener('DOMAContentLoader', ...)` (Palavra chave totalmente inválida).
* ✔️ *Correto*: `document.addEventListener('DOMContentLoaded', ...)`.


2. **Navegação com a classe `active` copiada sem alteração**:
* ❌ *Incorreto*: Deixar `<a href="index.html" class="active">Home</a>` em todas as páginas do site.
* ✔️ *Correto*: Mover a classe `active` para o link correspondente à página atual em cada arquivo (ex: em `feminina.html`, a classe `active` deve ficar no link `feminina.html`).


3. **Erros de digitação nos nomes de funções JavaScript**:
* ❌ *Incorreto*: `renderizarDestaqes()` ou `VerificarSessaoCliente()` (com letras faltando ou maiúsculas inconsistentes).
* ✔️ *Correto*: `renderizarDestaques()` e `verificarSessaoCliente()` (respeitando a regra de *camelCase* do JavaScript).


4. **Links para arquivos de páginas inexistentes**:
* ❌ *Incorreto*: Criar o arquivo físico como `femenina.html` e referenciar `<a href="feminina.html">`.
* ✔️ *Correto*: Garantir que os nomes dos arquivos no sistema operacional coincidam 100% com os links definidos na tag `href`.

---

## Aprofundamento e Boas Práticas (Conteúdo Complementar)

**Persistência de Dados com `localStorage`**

Em aplicações MPA (Multi-Page Applications), quando mudamos de página (ex: de `index.html` para `feminina.html`), o navegador zera as variáveis da memória RAM. Para evitar que o carrinho de compras se esvazie ao trocar de página, a biblioteca em `main.js` deve utilizar o `localStorage`:

```javascript
// Salvando o carrinho no navegador antes de mudar de página
localStorage.setItem('carrinhoStyleStore', JSON.stringify(carrinho));

// Lendo o carrinho salvo ao carregar qualquer página HTML
const carrinhoSalvo = JSON.parse(localStorage.getItem('carrinhoStyleStore')) || [];

```

**Acessibilidade em Botões de Controle (`aria-label`)**

No componente do carrossel (`index.html`), o uso do atributo `aria-label="Slide Anterior"` nos botões que possuem apenas caracteres especiais (como `&#10094;`) é fundamental para que softwares leitores de tela consigam explicar a função do botão para usuários com deficiência visual.

---

## Guia Rápido de Memorização

* **Evento de Carregamento Seguro do DOM**: `document.addEventListener('DOMContentLoaded', () => { ... });`
* **Vincular CSS na Subpasta**: `<link rel="stylesheet" href="css/style.css">`
* **Vincular JS na Subpasta**: `<script src="js/main.js"></script>`
* **Link Ativo no Menu**: `<a href="pagina.html" class="active">Texto</a>`
* **Mudar Slide no Carrossel**: `<button onclick="mudarSlide(-1)">` ou `<button onclick="mudarSlide(1)">`
* **Submissão de Formulário sem Reload**: `<form onsubmit="funcao(event)">` com `event.preventDefault()` no JS.
* **Ocultar Painel Privado via CSS**: `.painel-escondido { display: none; }`

---

**Resumo Relâmpago**

1. A StyleStore foi estruturada como uma aplicação web de e-commerce multi-páginas (*MPA*) organizada na pasta `loja`.
2. A separação dos arquivos em pastas (`css/`, `img/`, `js/`) garante a organização modular dos recursos do projeto.
3. O cabeçalho e os links de navegação são compartilhados por todas as páginas para manter a consistência visual.
4. A classe `active` no menu indica visualmente a seção exata em que o cliente está navegando.
5. O carrossel de banners da Home utiliza os eventos `onmouseenter` e `onmouseleave` para pausar e retomar a rotação automática.
6. As páginas de categorias (`feminina`, `masculina`, `infantil`) acionam a renderização dinâmica de produtos por filtro.
7. O botão flutuante e o modal do carrinho de compras permanecem acessíveis em todas as páginas públicas do e-commerce.
8. As telas de cliente e vendedor utilizam formulários de autenticação que alternam a exibição dos painéis privados.
9. O painel do vendedor disponibiliza botões para exportação instantânea do histórico de vendas em CSV, Excel e PDF.
10. O evento `DOMContentLoaded` garante a execução segura das funções JavaScript somente após a montagem do DOM.
