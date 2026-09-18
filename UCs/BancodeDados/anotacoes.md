# Consultas Agregadas em Vendas (JAPDV) e Banco Pizzaria

---

**Visão Geral**

Nesta sessão de estudos, abordamos dois tópicos essenciais do ecossistema de bancos de dados relacionais:

1. **Consultas de Relatórios de Vendas (`japdv`):** Exploração da função de agregação **`SUM()`** combinada com **`INNER JOIN`**, filtros temporais de data (**`LIKE`**) e a cláusula de agrupamento **`GROUP BY`** para analisar os produtos vendidos em um dia específico sob diferentes perspectivas.
2. **Novo Banco de Dados (`pizzaria`):** Criação do esquema completo de um sistema de controle de clientes e pedidos para uma pizzaria, aplicando o relacionamento **1:N (Um-para-Muitos)** com **Chave Estrangeira (FK)** e cadastrando o primeiro lote de clientes.

---

**Entendendo o Conceito**

**Consultas com Agregação (`SUM`) e Agrupamento (`GROUP BY`**

Quando realizamos vendas em um PDV, muitas vezes precisamos responder a perguntas de negócio como:

* *“Quantas unidades no total foram vendidas hoje?”* $\rightarrow$ Exige a soma geral de todos os itens em uma data.
* *“Quantas unidades de CADA produto foram vendidas hoje?”* $\rightarrow$ Exige somar a quantidade e **agrupar os resultados por produto e data**.

O comando **`GROUP BY`** junta todas as linhas que possuem o mesmo valor nas colunas especificadas (ex: mesmo `idProduto` e `dataVenda`) e aplica a função de agregação (**`SUM`**) para cada grupo individualmente.

**Filtro de Data em Campos `DATETIME` com `LIKE`**

O campo `dataVenda` armazena data e hora juntas (ex: `2026-09-16 14:30:00`). Ao usar a cláusula `WHERE dataVenda LIKE '2026-09-16%'`, o MySQL filtra todos os registros que iniciem com o ano, mês e dia desejados, ignorando as variações de horário.

Modelagem do Banco `pizzaria` ($1:N$)

No domínio de uma pizzaria:

* **Um Cliente** pode realizar **vários Pedidos** ao longo do tempo.
* **Cada Pedido** pertence obrigatoriamente a **apenas um Cliente**.

Para implementar essa regra no banco físico, colocamos a Chave Primária de `clientes` (`idCliente`) dentro da tabela `pedidos` como **Chave Estrangeira (`FOREIGN KEY`)**.

---

## Conceitos Fundamentais

* **`SUM(coluna)`**: Função de agregação que calcula a soma total dos valores numéricos de uma coluna.
* **`GROUP BY coluna1, coluna2`**: Cláusula que divide o conjunto de resultados em grupos de linhas correspondentes para aplicar funções agregadas.
* **`LIKE 'AAAA-MM-DD%'`**: Padrão de busca para filtrar registros por uma data específica em colunas `DATETIME`.
* **Relacionamento $1:N$**: Padrão onde a Chave Primária da tabela "1" (`clientes`) é inserida como Chave Estrangeira na tabela "N" (`pedidos`).
* **`FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)`**: Garante a integridade referencial, impedindo que um pedido seja associado a um cliente inexistente.

---

### Código / Exemplos Práticos

**Parte 1: Consultas de Vendas Diárias no Banco `japdv`**

```sql
USE japdv;

-- ============================================================================
-- JEITO 1: Agregação Global sem Agrupamento (Totalizador Simples)
-- ============================================================================
-- Retorna a soma de todas as quantidades de itens vendidas em todo o histórico.
SELECT 
    vendas.dataVenda, 
    itens_venda.quantidade, 
    SUM(quantidade)
FROM itens_venda
INNER JOIN vendas ON vendas.idVenda = itens_venda.idVenda;


-- ============================================================================
-- JEITO 2: Total Geral de Itens Vendidos em uma Data Específica
-- ============================================================================
-- Soma a quantidade total de unidades vendidas em um único dia (2026-09-16).
SELECT 
    SUM(itens_venda.quantidade) AS total_geral_itens_vendidos
FROM itens_venda
INNER JOIN vendas ON vendas.idVenda = itens_venda.idVenda
WHERE vendas.dataVenda LIKE '2026-09-16%';


-- ============================================================================
-- JEITO 3: Total Vendido Agrupado por Produto e Data (Relatório Detalhado)
-- ============================================================================
-- Exibe a quantidade exata vendida de CADA produto em um dia específico.
SELECT 
    vendas.dataVenda, 
    itens_venda.idProduto, 
    SUM(itens_venda.quantidade) AS total_vendido
FROM itens_venda
INNER JOIN vendas ON vendas.idVenda = itens_venda.idVenda
WHERE vendas.dataVenda LIKE '2026-09-16%'
GROUP BY vendas.dataVenda, itens_venda.idProduto;

```

---

**Parte 2: Criação e Povoamento do Banco `pizzaria`**

```sql
-- 1. Criação e seleção do Banco de Dados
CREATE DATABASE pizzaria
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE pizzaria;

-- 2. Criação da Tabela CLIENTES (Lado 1 do relacionamento)
CREATE TABLE clientes (
    idCliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    cidade VARCHAR(50) NOT NULL,
    idade INT,
    PRIMARY KEY(idCliente)
) DEFAULT CHARSET = utf8;

DESCRIBE clientes;

-- 3. Povoamento da Tabela CLIENTES (10 registros)
INSERT INTO clientes
(idCliente, nome, telefone, email, cidade, idade)
VALUES
(DEFAULT, 'Carlos Eduardo Silva', '(11) 98765-1111', 'carlos.silva@email.com', 'São Paulo', 28),
(DEFAULT, 'Mariana Oliveira', '(11) 98765-2222', 'mariana.o@email.com', 'São Paulo', 34),
(DEFAULT, 'Lucas Rodrigues', '(11) 98765-3333', 'lucas.rod@email.com', 'Santo André', 22),
(DEFAULT, 'Fernanda Costa', '(11) 98765-4444', 'fe.costa@email.com', 'São Bernardo do Campo', 45),
(DEFAULT, 'Rafael Santos', '(11) 98765-5555', 'rafael.santos@email.com', 'São Caetano do Sul', 19),
(DEFAULT, 'Beatriz Lima', '(11) 98765-6666', 'beatriz.lima@email.com', 'São Paulo', 31),
(DEFAULT, 'Thiago Almeida', '(11) 98765-7777', 'thiago.a@email.com', 'Osasco', 27),
(DEFAULT, 'Juliana Pereira', '(11) 98765-8888', 'juliana.p@email.com', 'Guarulhos', 39),
(DEFAULT, 'Gabriel Souza', '(11) 98765-9999', 'gabriel.souza@email.com', 'São Paulo', 25),
(DEFAULT, 'Amanda Carvalho', '(11) 98765-0000', 'amanda.c@email.com', 'Campinas', 52);

-- 4. Criação da Tabela PEDIDOS (Lado N do relacionamento, com FK)
CREATE TABLE pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    pizza VARCHAR(100) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    categoria VARCHAR(50),
    quantidade INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_pedido DATE,
    statusp VARCHAR(20),
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    PRIMARY KEY(id_pedido)
) DEFAULT CHARSET = utf8;

DESCRIBE pedidos;

```

---

**Desmontando o Código**

* **Análise das 3 Abordagens de Consulta no `japdv`:**
* **Jeito 1:** Tenta listar data e quantidade individual junto com `SUM(quantidade)`. Sem `GROUP BY`, em instâncias estritas do MySQL (`ONLY_FULL_GROUP_BY`), essa consulta pode gerar erro de sintaxe por misturar campos detalhados com agregação global.
* **Jeito 2:** Aplica o filtro `WHERE vendas.dataVenda LIKE '2026-09-16%'` e retorna **um único valor**: o volume total de peças/itens vendidos naquele dia.
* **Jeito 3:** Adiciona `GROUP BY vendas.dataVenda, itens_venda.idProduto`. O banco separa os registros por produto e calcula a soma vendida de cada um individualmente no dia especificado.


* **Análise da Tabela `pedidos` no Banco `pizzaria`:**
* `idCliente INT NOT NULL`: Cria a coluna local para armazenar o código do cliente comprador.
* `FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)`: Impõe a restrição de Chave Estrangeira. Todo pedido inserido em `pedidos` precisará ter um `idCliente` que já exista na tabela `clientes`.



---

## 6. Tabelas Comparativas

### 1. Comparativo dos 3 Jeitos de Consultar Vendas com Agregação

| Abordagem | Usa `WHERE` (Filtro de Data)? | Usa `GROUP BY`? | O que o Resultado Representa? |
| --- | --- | --- | --- |
| **Jeito 1** | Não | Não | Soma global sem agrupamento (pode falhar no modo `ONLY_FULL_GROUP_BY`). |
| **Jeito 2** | **Sim** (`LIKE '2026-09-16%'`) | Não | **Total geral em unidades** vendidas por toda a loja naquela data. |
| **Jeito 3** | **Sim** (`LIKE '2026-09-16%'`) | **Sim** (`GROUP BY dataVenda, idProduto`) | **Relatório item a item** de quanto cada produto vendeu naquela data. |

---

### 2. Estrutura do Relacionamento no Banco `pizzaria`

| Tabela | Papel no Banco | Chave Primária (PK) | Chave Estrangeira (FK) |
| --- | --- | --- | --- |
| **`clientes`** | Tabela Pai (Lado 1) | `idCliente` | *Não possui* |
| **`pedidos`** | Tabela Filho (Lado N) | `id_pedido` | `idCliente` (aponta para `clientes.idCliente`) |

---

## 7. Erros Comuns e Cuidados

### 1. Omitir Colunas do `GROUP BY` ao Usar Funções de Agregação

```sql
-- INCORRETO (Em MySQL estrito gera erro 1055: ONLY_FULL_GROUP_BY)
SELECT vendas.dataVenda, itens_venda.idProduto, SUM(itens_venda.quantidade)
FROM itens_venda
JOIN vendas ON vendas.idVenda = itens_venda.idVenda
GROUP BY itens_venda.idProduto; -- Faltou incluir vendas.dataVenda no GROUP BY

```

* **Regra de Ouro:** Todas as colunas presentes no `SELECT` que **não estejam** dentro de uma função agregada (como `SUM`, `COUNT`, `AVG`) devem obrigatoriamente figurar na cláusula `GROUP BY`.

### 2. Quebras de Linha Inadvertidas em Inserção de Strings (`INSERT`)

Ao cadastrar os e-mails da tabela `clientes`, certifique-se de que a string não possua quebras de linha acidentais dentro das aspas, pois isso gravará caracteres de nova linha (`\n`) no banco de dados.

---

## 8. Guia Rápido de Memorização

* **Somar campo numérico:** `SUM(nome_coluna)`
* **Agrupar relatórios por categoria/item:** `GROUP BY coluna1, coluna2`
* **Filtrar data em `DATETIME`:** `WHERE data_campo LIKE 'YYYY-MM-DD%'`
* **Criar Chave Estrangeira na Tabela:** `FOREIGN KEY (coluna_local) REFERENCES tabela_pai(coluna_pk)`

---

## Resumo Relâmpago — 10 Linhas

1. O comando `SUM()` soma todos os valores numéricos das linhas selecionadas.
2. Usar `SUM()` com colunas normais no `SELECT` exige a inclusão da cláusula `GROUP BY`.
3. O filtro `WHERE vendas.dataVenda LIKE '2026-09-16%'` isola todas as vendas efetuadas em uma data específica.
4. O agrupamento por `idProduto` gera um relatório detalhado com a quantidade vendida de cada item por dia.
5. O novo banco `pizzaria` gerencia a relação entre clientes e seus respectivos pedidos.
6. A tabela `clientes` armazena os dados cadastrais (nome, telefone, e-mail, cidade e idade).
7. Foram cadastrados 10 clientes iniciais localizados em São Paulo e cidades da região metropolitana.
8. A tabela `pedidos` guarda a pizza solicitada, tamanho, quantidade, preço, data, status e a FK do cliente.
9. O relacionamento 1:N garante que um único cliente possa realizar múltiplos pedidos.
10. A `FOREIGN KEY (idCliente)` em `pedidos` garante a integridade referencial com a tabela `clientes`.Entendido, todo o texto será escrito e exibido diretamente aqui no chat.

Para que eu possa elaborar o conteúdo exato que você precisa, qual é o tema, formato (ex: artigo, redação, e-mail, roteiro) ou assunto que devemos abordar?