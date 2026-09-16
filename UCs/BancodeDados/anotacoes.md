# Tabela de Vendas, Itens da Venda, Exclusão em Cascata (ON DELETE CASCADE), Data e hora automático (CURRENT_TIMESTAMP) e Agregação com COUNT() no Banco JAPDV

---

**Visão Geral**

Nesta etapa do desenvolvimento do banco de dados **`japdv`**, avançamos para o registro de transações comerciais completas, construindo a estrutura de **Cabeçalho e Itens de Venda** (relacionamento Mestre/Detalhe).

Aprendemos a automatizar o registro temporal usando **`DATETIME DEFAULT CURRENT_TIMESTAMP`**, dominamos a regra de integridade referencial com remoção em cascata (**`ON DELETE CASCADE`**), registramos 5 vendas completas com seus respectivos itens e introduzimos as primeiras consultas estatísticas utilizando a função de agregação **`COUNT()`**.

---

**Entendendo o Conceito**

**Estrutura Mestre/Detalhe (`vendas` e `itens_venda`)**

Em sistemas de PDV e e-commerce, uma venda nunca é gravada em uma única tabela. Ela é dividida em duas:

* **`vendas` (Cabeçalho/Mestre):** Guarda as informações gerais do cupom fiscal, como número da venda, data/hora e o valor total cobrado.
* **`itens_venda` (Detalhes/Itens):** Guarda cada produto individual comprado naquela venda, junto com a quantidade e o preço unitário praticado no momento da compra.

## O Carimbo de Data/Hora Automático (`CURRENT_TIMESTAMP`)

Em vez de depender da digitação manual da data pelo operador de caixa ou pela aplicação, definimos o valor padrão da coluna `dataVenda` como **`CURRENT_TIMESTAMP`**. O próprio MySQL consulta o relógio do servidor no momento do `INSERT` e grava a data e a hora exatas da transação.

## Exclusão em Cascata (`ON DELETE CASCADE`)

Por padrão, o MySQL bloqueia a exclusão de uma venda que possua itens cadastrados. Ao adicionar a instrução **`ON DELETE CASCADE`** na Chave Estrangeira de `idVenda`:

* Quando uma venda for cancelada/excluída da tabela `vendas`, o banco de dados **apaga automaticamente todos os itens dessa venda** na tabela `itens_venda`, mantendo o banco limpo e sem registros órfãos.

## A Função de Agregação `COUNT()`

A função **`COUNT()`** serve para contar a quantidade de linhas que atendem a um determinado critério na consulta, sendo essencial para levantar dados de estoque e relatórios operacionais.

> Analogia

> Pense em um **Cupom Fiscal de Supermercado**:
> * O **topo do cupom** (Número da Venda, Data/Hora e Total Pago) é a tabela **`vendas`**.
> * Cada **linha de produto impresso** no cupom (Ex: *2x Refrigerante R$ 5,00*) é um registro na tabela **`itens_venda`**.
> * Se a venda for cancelada e o cupom for jogado no lixo (**`DELETE FROM vendas`**), todas as linhas impressas nele somem juntas (**`ON DELETE CASCADE`**).
> 
> 

---

# Conceitos Fundamentais

* **`DATETIME DEFAULT CURRENT_TIMESTAMP`**: Preenche a coluna automaticamente com a data e o horário atual do servidor.
* **`ON DELETE CASCADE`**: Regra de integridade referencial que remove automaticamente os registros filhos ao excluir o registro pai.
* **`itens_venda`**: Tabela associativa que conecta `vendas` e `produtos`, permitindo que uma venda tenha múltiplos produtos e um produto esteja em múltiplas vendas ($N:N$).
* **Congelamento do Preço (`precoUnitario`)**: Armazena o preço do produto **no momento da venda**, impedindo que alterações futuras no cadastro do produto alterem o histórico de vendas passadas.
* **`COUNT(*)`**: Função de agregação que conta o total de registros retornados por uma consulta SQL.

---

### Código / Exemplos Práticos

**Script Completo de Transações, Tabelas e Consultas de Agregação**

```sql
USE japdv;

-- 1. Criação da Tabela de Vendas (Cabeçalho da Transação)
CREATE TABLE vendas (
    idVenda INT NOT NULL AUTO_INCREMENT,
    dataVenda DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(idVenda)
) DEFAULT CHARSET = utf8;

-- 2. Criação da Tabela de Itens da Venda (com Exclusão em Cascata)
CREATE TABLE itens_venda (
    idItem INT NOT NULL AUTO_INCREMENT,
    idVenda INT NOT NULL,
    FOREIGN KEY (idVenda) REFERENCES vendas(idVenda) ON DELETE CASCADE,
    idProduto INT NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES produtos(idProduto),
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(idItem)
) DEFAULT CHARSET = utf8;

-- 3. Registro das Transações de Venda (DML)

-- Venda 1
INSERT INTO vendas (total) VALUES (16.00);

INSERT INTO itens_venda (idVenda, idProduto, quantidade, precoUnitario) VALUES
(1, 1, 2, 3.00),
(1, 4, 1, 10.00);

-- Venda 2
INSERT INTO vendas (total) VALUES (199.90);

INSERT INTO itens_venda (idVenda, idProduto, quantidade, precoUnitario) VALUES
(2, 2, 1, 199.90);

-- Venda 3
INSERT INTO vendas (total) VALUES (165.70);

INSERT INTO itens_venda (idVenda, idProduto, quantidade, precoUnitario) VALUES
(3, 1, 2, 49.90),
(3, 4, 1, 29.90),
(3, 6, 3, 12.00);

-- Venda 4
INSERT INTO vendas (total) VALUES (139.90);

INSERT INTO itens_venda (idVenda, idProduto, quantidade, precoUnitario) VALUES
(4, 3, 1, 69.90),
(4, 5, 2, 35.00);

-- Venda 5
INSERT INTO vendas (total) VALUES (60.00);

INSERT INTO itens_venda (idVenda, idProduto, quantidade, precoUnitario) VALUES
(5, 6, 5, 12.00);

-- Validação das vendas realizadas
SELECT * FROM vendas;

-- 4. Consultas de Agregação e Estoque (DQL)

-- Total de produtos cadastrados no sistema
SELECT COUNT(*) FROM produtos;

-- Total de produtos que estão com estoque zerado
SELECT COUNT(*) FROM produtos
WHERE quantidade = 0;

```

---

**Desmontando o Código**

* `dataVenda DATETIME DEFAULT CURRENT_TIMESTAMP`: Define o campo como tipo data/hora e atribui o valor padrão do instante da inserção.
* `FOREIGN KEY (idVenda) REFERENCES vendas(idVenda) ON DELETE CASCADE`: Vincula o item ao cabeçalho da venda e habilita a remoção automática dos itens caso a venda seja excluída.
* `precoUnitario DECIMAL(10,2) NOT NULL`: Registra o preço do item no instante exato da compra.
* `SELECT COUNT(*) FROM produtos;`: Conta todas as linhas existentes na tabela de produtos.
* `SELECT COUNT(*) FROM produtos WHERE quantidade = 0;`: Filtra com `WHERE` antes de contar, retornando apenas quantos produtos estão sem estoque.

---

# Tabelas Comparativas

**Comportamentos de Exclusão na Chave Estrangeira (`ON DELETE`)**

| Opção | Comportamento ao Excluir o Registro Pai | Recomendado Para |
| --- | --- | --- |
| **`RESTRICT` / `NO ACTION**` *(Padrão)* | Bloqueia a exclusão do pai se houver filhos vinculados. | Produtos, Clientes, Fornecedores. |
| **`ON DELETE CASCADE`** | Apaga automaticamente todos os registros filhos correspondentes. | Itens de Venda, Histórico temporário. |
| **`ON DELETE SET NULL`** | Mantém o registro filho, mas define o campo da FK como `NULL`. | Responsáveis secundários, categorias opcionais. |

---

**Funções de Contagem e Agregação no SQL**

| Comando | O que faz? |
| --- | --- |
| **`COUNT(*)`** | Conta o número total de **linhas** retornadas pela consulta. |
| **`COUNT(coluna)`** | Conta apenas os valores **não-nulos (`NOT NULL`)** daquela coluna. |
| **`COUNT(DISTINCT coluna)`** | Conta a quantidade de valores **únicos e diferentes** em uma coluna. |

---

## Erros Comuns e Cuidados

**Não Congelar o Preço na Tabela de Itens**

```sql
-- INCORRETO: Não salvar precoUnitario em itens_venda e buscar sempre do cadastro de produtos.

```

* **Motivo:** Se o produto subir de preço no mês seguinte, o relatório de vendas passadas mudará de valor, adulterando a contabilidade da loja. **O preço da venda deve ser congelado no `itens_venda**`.

**Usar `ON DELETE CASCADE` na Tabela de Produtos**

Se você colocar `ON DELETE CASCADE` na FK `idProduto` da tabela `itens_venda`, ao apagar um produto do cadastro, todas as vendas passadas daquele produto serão apagas. Em produtos e fornecedores, deve-se usar o padrão (**`RESTRICT`**) ou desativar o produto (`ativo = false`).

---

## Aprofundamento e Boas Práticas

> **Observação importante (Conhecimento Complementar):**
> **Consultando a Venda Completa com `SUM()` e `JOIN`:**
> Podemos verificar se o total calculado bate com os itens inseridos somando a quantidade multiplicada pelo preço unitário:

```sql
> SELECT 
>     v.idVenda, 
>     v.dataVenda, 
>     p.descricao AS produto, 
>     iv.quantidade, 
>     iv.precoUnitario,
>     (iv.quantidade * iv.precoUnitario) AS subtotal
> FROM vendas v
> JOIN itens_venda iv ON v.idVenda = iv.idVenda
> JOIN produtos p ON p.idProduto = iv.idProduto
> WHERE v.idVenda = 1;
> 

```

---

**Guia Rápido de Memorização**

* **Data e Hora Automáticas:** `DATETIME DEFAULT CURRENT_TIMESTAMP`
* **Exclusão Filha Automática:** `FOREIGN KEY (...) REFERENCES ... ON DELETE CASCADE`
* **Contar Total de Registros:** `SELECT COUNT(*) FROM tabela;`
* **Contar com Filtro:** `SELECT COUNT(*) FROM tabela WHERE condicao;`

---

**Resumo Relâmpago**

1. A modelagem Mestre/Detalhe divide a transação em duas tabelas: `vendas` (cabeçalho) e `itens_venda` (itens).
2. O parâmetro `DEFAULT CURRENT_TIMESTAMP` registra a data e hora do servidor automaticamente.
3. A regra `ON DELETE CASCADE` elimina os itens da venda automaticamente se o cabeçalho da venda for apagado.
4. A tabela `itens_venda` conecta `vendas` e `produtos` em um relacionamento $N:N$.
5. O campo `precoUnitario` em `itens_venda` congela o valor do produto no momento da compra.
6. Foram cadastradas 5 vendas completas no banco `japdv` com seus respectivos produtos e quantidades.
7. A função `COUNT(*)` é uma função de agregação usada para contar linhas no banco de dados.
8. `SELECT COUNT(*) FROM produtos;` retorna o total geral de itens cadastrados no estoque.
9. A cláusula `WHERE quantidade = 0` combinada com o `COUNT(*)` identifica produtos esgotados.
10. O tipo `DECIMAL(10,2)` garante precisão financeira tanto no total da venda quanto nos preços unitários.

