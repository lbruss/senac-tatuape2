# JavaScript Dinâmico: Manipulação do DOM, Eventos, Calendário Interativo e Modais no Projeto Biblioteca Senac

---

## 1. Visão Geral

Nesta aula, dei vida à interface da **Biblioteca Senac Tatuapé** que estruturamos em HTML e CSS nas aulas anteriores. Utilizando o **JavaScript (JS)**, transformei elementos estáticos em uma aplicação web interativa e funcional.

Aprendi a capturar o envio de formulários sem recarregar a página, a manipular o **DOM (Document Object Model)** para adicionar itens dinamicamente a uma lista, a construir um **calendário mensal navegável completo** com cálculo automático de dias e a integrar **caixas de diálogo flutuantes (modais)** ativadas por cliques em eventos cadastrados.

---

## 2. Entendendo o Conceito

### O que é Manipulação do DOM e Manipulação de Eventos?

* **Conceito simples**: Se o HTML é a estrutura da página e o CSS é a pintura, o JavaScript é o motor de controle. Ele escuta as ações do usuário (como cliques e envios de formulário) e altera o texto, as cores ou insere novos elementos na tela em tempo real.
* **Definição técnica**: O **DOM (Document Object Model)** é uma interface de programação que representa o documento HTML como uma árvore de objetos. O JavaScript utiliza essa estrutura para escutar eventos (`addEventListener`), ler valores de campos (`value`), criar novos nós (`createElement`) e alterar propriedades visuais sem a necessidade de recarregar o navegador.
* **Analogia**: Pense no HTML e CSS como uma **maquete de papelão de uma casa**. Sem JavaScript, a maquete é estática. Com o JavaScript, colocamos fios e um controle remoto: quando apertamos um botão no controle (evento), uma lâmpada da maquete acende ou uma porta abre (manipulação do DOM).

```
[ Usuário digita no formulário e clica "Enviar" ]
                       │
                       ▼
         e.preventDefault() (Evita o recarregamento)
                       │
                       ▼
       document.createElement("li") (Cria item no JS)
                       │
                       ▼
       lista.appendChild(item) (Insere no HTML visível)

```

---

## 3. Conceitos Fundamentais

### 3.1. Captura e Manipulação do DOM

* `document.getElementById("id")`: Busca e seleciona um elemento do HTML pelo seu atributo de identificação único.
* `.addEventListener("submit", function(e) { ... })`: Registra um "ouvinte" que dispara uma função quando o evento especificado (no caso, o envio de um formulário) acontece.
* `e.preventDefault()`: Interrompe o comportamento padrão do navegador (que seria enviar os dados via requisição HTTP e recarregar a página), permitindo processar tudo via script na mesma tela.
* `document.createElement("tag")`: Cria um novo elemento HTML na memória do navegador.
* `container.appendChild(novoElemento)`: Insere o elemento criado na memória como filho final do container selecionado no HTML.

### 3.2. Manipulação de Datas em JavaScript (`Date`)

O objeto nativo `Date` gerencia operações com datas e horários:

* `new Date(ano, mes)`: Cria um objeto de data apontando para o primeiro dia daquele mês. Em JS, os meses são contados de **0 (Janeiro)** a **11 (Dezembro)**.
* `new Date(ano, mes, 1).getDay()`: Retorna em qual dia da semana o mês começa (0 = Domingo, 1 = Segunda, ..., 6 = Sábado).
* `new Date(ano, mes + 1, 0).getDate()`: **Truque do último dia**: ao passar o dia `0` do mês seguinte, o JS calcula automaticamente o último dia do mês atual (ex: 28, 30 ou 31).
* `String(valor).padStart(2, "0")`: Preenche uma string à esquerda com o caractere especificado até atingir o tamanho desejado (ex: transforma o número `5` na string `"05"`).

### 3.3. Iteração e Seleção de Dados em Arrays

* Array de Objetos: Guarda coleções estruturadas contendo chave e valor (ex: `{ data: "2027-02-15", titulo: "...", descricao: "..." }`).
* `.find(condicao)`: Percorre a lista e retorna o primeiro elemento que atende à condição de busca (usado para verificar se o dia da grade possui um evento correspondente).

---

## 4. Código / Exemplos Práticos

Abaixo está o arquivo `script.js` completo, corrigido, formatado e com todos os recursos de interatividade devidamente integrados.

### Arquivo: `script.js`

```javascript
/* =================================================== */
/* 1. CADASTRO DE INDICAÇÕES DE LIVROS                 */
/* =================================================== */

// Escuta o envio do formulário de indicação
document.getElementById("form-indicacao").addEventListener("submit", function(e) {
    // Evita o recarregamento padrão da página ao enviar
    e.preventDefault();

    // Captura os valores digitados nos campos de texto
    const nome = document.getElementById("nome").value;
    const livro = document.getElementById("livro").value;

    // Seleciona a lista ul onde as indicações serão exibidas
    const lista = document.getElementById("lista-indicacoes");

    // Cria um novo item de lista <li> dinamicamente
    const item = document.createElement("li");
    item.textContent = `${nome} indicou: ${livro}`;

    // Adiciona o novo <li> dentro da <ul> no HTML
    lista.appendChild(item);

    // Limpa os campos do formulário para a próxima indicação
    document.getElementById("form-indicacao").reset();
});


/* =================================================== */
/* 2. BASE DE DADOS DE EVENTOS DA BIBLIOTECA (2027)    */
/* =================================================== */

const eventos2027 = [
    { 
        data: "2027-02-15", 
        titulo: "Semana de Jogos de Tabuleiro",
        descricao: "Venha participar de partidas abertas de Catan, Carcassonne e xadrez na sala principal da biblioteca."
    },
    { 
        data: "2027-03-10", 
        titulo: "Oficina de Pesquisa Acadêmica",
        descricao: "Aprenda a utilizar bases de dados científicas e as normas ABNT para trabalhos de conclusão de curso."
    },
    { 
        data: "2027-05-20", 
        titulo: "Clube de Leitura - Machado de Assis",
        descricao: "Debate focado na obra 'Dom Casmurro' e no contexto do Realismo no Brasil."
    },
    { 
        data: "2027-08-05", 
        titulo: "Campeonato de Videogame",
        descricao: "Torneio de jogos esportivos e de luta no espaço multimídia com premiação para o top 3."
    },
    { 
        data: "2027-10-12", 
        titulo: "Dia das Crianças - Atividades Especiais",
        descricao: "Contação de histórias, oficinas de pintura e troca de livros infantis durante todo o dia."
    },
    { 
        data: "2027-11-25", 
        titulo: "Feira Literária Senac Tatuapé",
        descricao: "Exposição de projetos de alunos, presença de autores convidados e sessões de autógrafos."
    }
];


/* =================================================== */
/* 3. LÓGICA DE CONSTRUÇÃO DO CALENDÁRIO               */
/* =================================================== */

let mesAtual = 0;  // Janeiro = 0, Fevereiro = 1...
let anoAtual = 2027;

function gerarCalendario(mes, ano) {
    const calendario = document.getElementById("calendar");
    
    // Limpa o conteúdo anterior do calendário antes de desenhar o novo mês
    calendario.innerHTML = "";

    const data = new Date(ano, mes);
    const primeiroDia = new Date(ano, mes, 1).getDay();           // Dia da semana do dia 1 (0-6)
    const diasNoMes = new Date(ano, mes + 1, 0).getDate();         // Total de dias no mês selecionado

    // 3.1. Criação do Cabeçalho de Navegação (Mês/Ano e Botões de Troca)
    const header = document.createElement("div");
    header.className = "cal-header";
    header.innerHTML = `
        <button onclick="mudarMes(-1)">⇦</button>
        <span>${data.toLocaleString("pt-BR", { month: "long" }).toUpperCase()} ${ano}</span>
        <button onclick="mudarMes(1)">⇨</button>
    `;
    calendario.appendChild(header);

    // 3.2. Criação da Grade do Calendário
    const grid = document.createElement("div");
    grid.className = "cal-grid";

    // 3.3. Inserção dos Dias da Semana no Cabeçalho da Grade
    const diasSemana = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];
    diasSemana.forEach(d => {
        const dia = document.createElement("div");
        dia.className = "cal-dia semana";
        dia.textContent = d;
        grid.appendChild(dia);
    });

    // 3.4. Preenchimento de Células Vazias antes do 1º dia do Mês
    for (let i = 0; i < primeiroDia; i++) {
        const vazio = document.createElement("div");
        vazio.className = "cal-dia vazio";
        grid.appendChild(vazio);
    }

    // 3.5. Renderização dos Dias do Mês e Mapeamento de Eventos
    for (let dia = 1; dia <= diasNoMes; dia++) {
        const cell = document.createElement("div");
        cell.className = "cal-dia";
        cell.textContent = dia;

        // Formata a data atual da célula no formato YYYY-MM-DD
        const dataStr = `${ano}-${String(mes + 1).padStart(2, "0")}-${String(dia).padStart(2, "0")}`;

        // Verifica se existe um evento cadastrado para esta data exata
        const evento = eventos2027.find(e => e.data === dataStr);

        if (evento) {
            cell.classList.add("evento");
            cell.title = evento.titulo;
            
            // Atribui o evento de clique na célula para abrir a janela Modal
            cell.addEventListener("click", () => abrirModal(evento));
        }

        grid.appendChild(cell);
    }

    // Adiciona a grade completa ao container do calendário
    calendario.appendChild(grid);
}

// Função para avançar ou voltar os meses no calendário
function mudarMes(delta) {
    mesAtual += delta;

    if (mesAtual < 0) {
        mesAtual = 11;
        anoAtual--;
    } else if (mesAtual > 11) {
        mesAtual = 0;
        anoAtual++;
    }

    gerarCalendario(mesAtual, anoAtual);
}


/* =================================================== */
/* 4. CONTROLE DA JANELA MODAL (FLUTUANTE)             */
/* =================================================== */

// Abre a janela modal e preenche com as informações do evento clicado
function abrirModal(evento) {
    const modal = document.getElementById("modal");

    // Converte a data do formato YYYY-MM-DD para o formato brasileiro DD/MM/YYYY
    const partesData = evento.data.split("-");
    const dataFormatada = `${partesData[2]}/${partesData[1]}/${partesData[0]}`;

    document.getElementById("modal-titulo").textContent = evento.titulo;
    document.getElementById("modal-data").textContent = dataFormatada;
    document.getElementById("modal-descricao").textContent = evento.descricao;

    modal.style.display = "block";
}

// Esconde a janela modal
function fecharModal() {
    document.getElementById("modal").style.display = "none";
}


/* =================================================== */
/* 5. INICIALIZAÇÃO DA APLICAÇÃO                       */
/* =================================================== */

// Renderiza o calendário inicial ao carregar o arquivo JS
gerarCalendario(mesAtual, anoAtual);

```

---

## 5. Desmontando o Código

### Análise do Cadastro de Indicações (`form-indicacao`)

* `e.preventDefault()`:
* *O que faz*: Bloqueia a ação padrão do evento `submit`.
* *Por que está ali*: Sem essa linha, ao clicar no botão "Enviar", o navegador atualizaria a tela e os dados digitados sumiriam antes de irem para a lista.


* `document.createElement("li")` e `lista.appendChild(item)`:
* *O que faz*: Fabrica uma nova tag `<li>` no motor do JS, adiciona o texto descritivo e a anexa como um elemento visível dentro da `<ul>` do HTML.



### Análise do Gerador do Calendário (`gerarCalendario`)

* `const primeiroDia = new Date(ano, mes, 1).getDay()`:
* *O que faz*: Descobre o dia da semana em que o dia 1 cai (ex: se o dia 1 for uma quarta-feira, `getDay()` retorna `3`).
* *Resultado*: O laço de repetição seguinte cria 3 células transparentes com a classe `cal-dia vazio` para empurrar o dia 1 exatamente para a coluna de quarta-feira na grade CSS Grid.


* `const diasNoMes = new Date(ano, mes + 1, 0).getDate()`:
* *O que faz*: Descobre quantos dias aquele mês possui. O valor `0` indica o último dia do mês anterior ao especificado (`mes + 1`).


* `String(mes + 1).padStart(2, "0")`:
* *O que faz*: Adiciona o número `1` ao mês (pois o mês no JS começa em 0) e garante que ele tenha 2 dígitos. O mês `2` vira a string `"02"`, combinando perfeitamente com o padrão de data `"2027-02-15"`.


* `cell.addEventListener("click", () => abrirModal(evento))`:
* *O que faz*: Conecta a célula do dia no calendário à função `abrirModal`, repassando o objeto do evento correspondente quando o usuário clica sobre ela.



---

## 6. Passo a Passo: Funcionamento da Renderização do Calendário

1. **Reset do Container**: A função inicia executando `calendario.innerHTML = ""` para limpar qualquer mês que estivesse desenhado anteriormente.
2. **Cálculo da Data**: Obtém o dia da semana inicial (`primeiroDia`) e o total de dias do mês (`diasNoMes`).
3. **Desenho do Cabeçalho**: Cria a barra com os botões `⇦` e `⇨` e exibe o nome do mês por extenso usando `toLocaleString("pt-BR")`.
4. **Alinhamento da Grade**: Insere as caixas vazias necessárias no início para alinhar os dias com os nomes da semana.
5. **Varredura e Mapeamento**:
* O laço `for` roda de `1` até `diasNoMes`.
* A cada dia, monta a string da data e busca no array `eventos2027` via `.find()`.
* Se um evento for encontrado, aplica a classe `.evento` (que deixa a caixa amarela) e registra a função de clique para abrir o Modal.


6. **Inserção no DOM**: Conecta a grade gerada dentro da `<div id="calendar">` na tela.

---

## 7. Tabelas Comparativas

### Tabela 1: Métodos de Manipulação do DOM

| Método | Para que serve? | Retorno / Resultado |
| --- | --- | --- |
| `document.getElementById("id")` | Seleciona um elemento único pelo atributo ID. | O objeto do elemento HTML. |
| `document.createElement("tag")` | Instancia um novo nó de elemento na memória. | Um elemento HTML "órfão" não visível ainda. |
| `pai.appendChild(filho)` | Insere um nó como último filho dentro de outro. | Exibe o elemento filho na página visível. |
| `elemento.textContent` | Altera ou lê apenas o texto interno do elemento. | Texto puro sem interpretar tags HTML. |
| `elemento.innerHTML` | Altera ou lê todo a marcação HTML interna. | Interpreta e desenha tags HTML passadas em string. |

### Tabela 2: Métodos do Objeto `Date` em JavaScript

| Método | O que retorna? | Exemplo de Retorno |
| --- | --- | --- |
| `getDate()` | O **dia do mês** (1 a 31). | `15` |
| `getDay()` | O **dia da semana** (0 = Domingo, 6 = Sábado). | `1` (Segunda-feira) |
| `getMonth()` | O **mês do ano** (0 = Janeiro, 11 = Dezembro). | `1` (Fevereiro) |
| `getFullYear()` | O **ano** com quatro dígitos. | `2027` |
| `toLocaleString()` | A data/mês formatada segundo um local (idioma). | `"fevereiro"` |

---

## 8. Erros Comuns e Cuidados

1. **Não utilizar `e.preventDefault()` em formulários**:
* ❌ *Incorreto*: Processar o formulário diretamente no `submit` sem o parâmetro e a instrução de cancelamento. A página recarrega e a indicação inserida é perdida imediatamente.
* ✔️ *Correto*: Incluir `e.preventDefault()` na primeira linha da função de evento.


2. **Confusão com o índice base zero dos meses em JS**:
* ❌ *Incorreto*: Tratar Janeiro como mês `1` e Dezembro como mês `12` na criação da data `new Date(2027, 1, 1)`.
* ✔️ *Correto*: Lembrar que Janeiro é `0` e Fevereiro é `1`. Ao converter para string ISO, deve-se somar `1`: `mes + 1`.


3. **Tentar ler propriedades inexistentes em objetos**:
* ❌ *Incorreto*: Chamar `evento.descricao` quando o objeto no array possui apenas `{ data: "...", titulo: "..." }`. A tela exibirá a palavra `undefined`.
* ✔️ *Correto*: Garantir que todos os objetos do array possuam todas as propriedades acessadas pela função.


4. **Não limpar o container ao redesenhar o calendário**:
* Se a instrução `calendario.innerHTML = ""` for omitida na função `gerarCalendario()`, o novo mês renderizado será colado abaixo do mês antigo em vez de substituí-lo.



---

## 9. Correções Técnicas das Minhas Anotações

* **Inconsistência de Dados no Modal (`descricao`)**: No rascunho original, a função `abrirModal` tentava exibir `evento.descricao`, mas os objetos do array `eventos2027` continham apenas as chaves `data` e `titulo`. Adicionei silenciosamente a propriedade `descricao` em cada objeto do array.
* **Falta de Evento de Clique nos Dias com Eventos**: No rascunho original, as células com eventos recebiam o destaque visual (`classList.add("evento")`), mas a função `abrirModal()` nunca era chamada. Adicionei o escutador de eventos `cell.addEventListener("click", ...)` diretamente na construção de cada célula.
* **Formatação e Organização do Código**: Ajustei identações quebradas e reuni escopos de funções que estavam misturados ou mal fechados nas anotações originais (como a função `mudarMes` colada ao final de `gerarCalendario`).
* **Melhoria de Usabilidade**: Adicionei a instrução `document.getElementById("form-indicacao").reset()` para limpar as caixas de texto após a adição de um novo livro na lista.

---

## 10. Aprofundamento e Boas Práticas (Conteúdo Complementar)

### Fechando o Modal ao Clicar Fora da Caixa

Uma boa prática universal de UX (Experiência do Usuário) em Modais é permitir que o usuário feche a janela não apenas clicando no botão `[X]`, mas também clicando em qualquer lugar do fundo escuro transparente. Podemos adicionar essa funcionalidade com o seguinte trecho:

```javascript
// Fecha a modal se o usuário clicar no fundo escuro fora do conteúdo
window.addEventListener("click", function(e) {
    const modal = document.getElementById("modal");
    if (e.target === modal) {
        fecharModal();
    }
});

```

### Template Literals (Interpolação de Strings)

O uso de crases (```) em vez de aspas permite interpolar variáveis diretamente no texto usando a sintaxe `${variavel}`, além de permitir a escrita de código HTML em múltiplas linhas, mantendo a leitura limpa e moderna.

---

## 11. Guia Rápido de Memorização

* **Cancelar Recarregamento de Formulário**: `e.preventDefault()`.
* **Criar Elemento em Memória**: `document.createElement("tag")`.
* **Inserir Filho no DOM**: `pai.appendChild(filho)`.
* **Pegar Último Dia do Mês**: `new Date(ano, mes + 1, 0).getDate()`.
* **Formatar Número com Zero à Esquerda**: `String(num).padStart(2, '0')`.
* **Buscar Item em Array**: `array.find(item => item.propriedade === valor)`.
* **Exibir Modal**: `modal.style.display = "block"`.
* **Ocultar Modal**: `modal.style.display = "none"`.

---

## 12. Resumo Relâmpago — 10 Linhas

1. O JavaScript é a linguagem responsável por adicionar interatividade e lógica dinâmica ao HTML e CSS.
2. O método `addEventListener` registra escutadores de eventos como envios de formulários e cliques de mouse.
3. O comando `e.preventDefault()` impede o recarregamento da página durante a submissão de formulários.
4. Os métodos `createElement` e `appendChild` criam e inserem novos elementos no DOM dinamicamente.
5. No objeto `Date` do JS, os meses são indexados de 0 (Janeiro) a 11 (Dezembro).
6. O truque `new Date(ano, mes + 1, 0).getDate()` retorna o número exato de dias do mês atual.
7. O método `padStart(2, "0")` padroniza números de um dígito para o formato de dois caracteres (ex: "05").
8. O método de array `.find()` localiza um objeto específico correspondente à data atual da célula.
9. Janelas Modais têm sua visibilidade alternada manipulando a propriedade `style.display` para `block` ou `none`.
10. O projeto conecta a marcação HTML aos eventos JS para criar um portal funcional e interativo.
