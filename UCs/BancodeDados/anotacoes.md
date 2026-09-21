# Anotações de Estudo: Povoamento, Consultas DQL, UPDATE e Agregações no Banco Pizzaria

---

## 1. Visão Geral

Nesta sessão de estudos, demos continuidade ao banco de dados **`pizzaria`**, realizando o povoamento completo da tabela filho **`pedidos`** e executando um conjunto diversificado de consultas operacionais e gerenciais.

Aprofundamos o uso da cláusula **`WHERE`** para filtragens específicas (por cidade, status do pedido e categoria da pizza), aplicamos atualizações de dados com **`UPDATE`**, cruzamos informações de clientes e pedidos usando **`INNER JOIN`** e geramos relatórios consolidados combinando **`GROUP BY`**, **`COUNT()`** e **`SUM()`**.

---

## 2. Entendendo o Conceito

### 1. Inserção de Dados na Tabela Relacionada (Lado $N$)

Ao inserir registros na tabela `pedidos`, o campo **`idCliente`** obrigatoriamente deve conter o ID de um cliente que já foi previamente cadastrado na tabela `clientes` (IDs de 1 a 10). Isso garante a **Integridade Referencial**.

### 2. Filtros Operacionais (`WHERE` + `ORDER BY`)

Em um sistema de pizzaria, a cozinha e os entregadores precisam de visões específicas dos dados:

* *Filtro por Status:* Listar apenas os pedidos com status `'Entregue'`, ordenados do mais antigo para o mais recente (`ORDER BY data_pedido`).
* *Filtro por Categoria:* Isolar pizzas de categorias específicas (ex: `'Especial'`) exibindo apenas as colunas relevantes para a produção (`pizza`, `tamanho`, `categoria`, `quantidade`, `preco`).

### 3. Atualização Segura de Dados (`UPDATE`)

Conforme um pedido avança no fluxo do restaurante, seu estado muda. O comando **`UPDATE`** altera o atributo `statusp`, sendo indispensável o uso do **`WHERE id_pedido = X`** para limitar a alteração exclusivamente àquele registro.

### 4. Relatórios com Agrupamento e Métricas Globais

Diferenciamos três indicadores fundamentais do negócio:

* **`COUNT(*)` em `clientes**`: Retorna a quantidade total de **clientes cadastrados** no sistema.
* **`COUNT(*)` em `pedidos**`: Retorna o total de **transações/vendas efetuadas**.
* **`SUM(quantidade)` em `pedidos**`: Soma o número total de **unidades físicas de pizzas vendidas** (pois um único pedido pode conter 2 ou mais pizzas).
* **`INNER JOIN` + `GROUP BY` + `COUNT()**`: Agrupa as vendas por cliente para descobrir quantos pedidos cada pessoa realizou individualmente.

---

## 3. Conceitos Fundamentais

* **`INSERT INTO pedidos`**: Inserção de registros na tabela filho associando cada compra a um `idCliente`.
* **`WHERE`**: Cláusula de filtragem condicional para selecionar linhas que atendem a critérios específicos (cidade, categoria, status).
* **`UPDATE ... SET ... WHERE`**: Comando DML para modificar valores em colunas de registros existentes.
* **`INNER JOIN`**: Junção que combina dados cadastrais da tabela `clientes` com os dados transacionais da tabela `pedidos`.
* **`COUNT(*)`**: Função agregada para contagem total de linhas/registros.
* **`SUM(coluna)`**: Função agregada para somatória do volume numérico acumulado de uma coluna.
* **`GROUP BY clientes.nome`**: Cláusula que agrupa as vendas por cliente para permitir a contagem individual de pedidos por pessoa.

---

## 4. Código / Exemplos Práticos

### Script Completo: Povoamento, Consultas, Alterações e Agregações

```sql
USE pizzaria;

-- ============================================================================
-- 1. POVOAMENTO DA TABELA PEDIDOS (15 Registros vinculados aos clientes 1 a 10)
-- ============================================================================
INSERT INTO pedidos
(id_pedido, pizza, tamanho, categoria, quantidade, preco, data_pedido, statusp, idCliente)
VALUES
(DEFAULT, 'Calabresa', 'Grande', 'Salgada', 1, 45.00, '2026-09-15', 'Entregue', 1),
(DEFAULT, 'Mussarela', 'Média', 'Salgada', 2, 38.00, '2026-09-15', 'Entregue', 2),
(DEFAULT, 'Frango com Catupiry', 'Grande', 'Especial', 1, 52.00, '2026-09-16', 'Entregue', 3),
(DEFAULT, 'Chocolate com Morango', 'Broto', 'Doce', 1, 32.00, '2026-09-16', 'Entregue', 1),
(DEFAULT, 'Quatro Queijos', 'Grande', 'Salgada', 1, 48.00, '2026-09-17', 'Entregue', 4),
(DEFAULT, 'Portuguesa', 'Grande', 'Salgada', 1, 46.00, '2026-09-17', 'Entregue', 5),
(DEFAULT, 'Marguerita', 'Média', 'Vegetariana', 1, 40.00, '2026-09-18', 'Entregue', 6),
(DEFAULT, 'Calabresa', 'Grande', 'Salgada', 2, 45.00, '2026-09-18', 'Entregue', 2),
(DEFAULT, 'Romeu e Julieta', 'Broto', 'Doce', 1, 30.00, '2026-09-19', 'Entregue', 7),
(DEFAULT, 'Pepperoni', 'Grande', 'Especial', 1, 55.00, '2026-09-19', 'Entregue', 8),
(DEFAULT, 'Atum com Cebola', 'Grande', 'Salgada', 1, 44.00, '2026-09-20', 'Entregue', 3),
(DEFAULT, 'Frango com Catupiry', 'Média', 'Especial', 1, 48.00, '2026-09-20', 'Entregue', 6),
(DEFAULT, 'Mussarela', 'Grande', 'Salgada', 1, 42.00, '2026-09-21', 'A caminho', 9),
(DEFAULT, 'Calabresa', 'Família', 'Salgada', 1, 58.00, '2026-09-21', 'Em preparo', 10),
(DEFAULT, 'Banana com Canela', 'Média', 'Doce', 1, 35.00, '2026-09-21', 'Em preparo', 1);

-- Listar todos os pedidos
SELECT * FROM pedidos;

-- Listar todos os clientes em ordem alfabética
SELECT * FROM clientes
ORDER BY nome;


-- ============================================================================
-- 2. CONSULTAS COM FILTROS ESPECÍFICOS (DQL)
-- ============================================================================

-- Clientes que moram em São Paulo
SELECT * FROM clientes
WHERE cidade = 'São Paulo';

-- Pedidos com status 'Entregue' ordenados por data crescente
SELECT * FROM pedidos
WHERE statusp = 'Entregue'
ORDER BY data_pedido;

-- Seleção de colunas específicas de pedidos da categoria 'Especial'
SELECT pizza, tamanho, categoria, quantidade, preco
FROM pedidos
WHERE categoria = 'Especial';


-- ============================================================================
-- 3. ATUALIZAÇÃO DE REGISTRO (DML)
-- ============================================================================

-- Alterar o status do pedido 1 para 'Pendente'
UPDATE pedidos
SET statusp = 'Pendente'
WHERE id_pedido = 1;


-- ============================================================================
-- 4. CONSULTAS RELACIONADAS COM INNER JOIN E AGRUPAMENTOS
-- ============================================================================

-- Relatório detalhado: Dados do cliente + dados do seu pedido
SELECT 
    clientes.nome, 
    clientes.telefone, 
    pedidos.pizza, 
    pedidos.tamanho, 
    pedidos.quantidade, 
    pedidos.preco, 
    pedidos.statusp
FROM clientes
INNER JOIN pedidos ON pedidos.idCliente = clientes.idCliente;

-- Quantidade de pedidos realizados por cada cliente
SELECT 
    clientes.nome, 
    COUNT(pedidos.id_pedido) AS quantidade_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.idCliente = pedidos.idCliente
GROUP BY clientes.nome
ORDER BY quantidade_pedidos DESC;


-- ============================================================================
-- 5. MÉTRICAS E TOTALIZADORES GLOBAIS
-- ============================================================================

-- Total de clientes cadastrados
SELECT COUNT(*) AS total_clientes 
FROM clientes;

-- Total de pedidos (transações) realizados
SELECT COUNT(*) AS total_pedidos 
FROM pedidos;

-- Total geral de pizzas vendidas (soma das quantidades individuais)
SELECT SUM(quantidade) AS total_pizzas_vendidas 
FROM pedidos;

```

---

## 5. Desmontando o Código

* `WHERE statusp = 'Entregue' ORDER BY data_pedido`: Isola apenas as entregas concluídas e organiza os resultados cronologicamente.
* `UPDATE pedidos SET statusp = 'Pendente' WHERE id_pedido = 1`: Altera a coluna `statusp` de forma cirúrgica, afetando exclusivamente a linha cujo `id_pedido` é igual a 1.
* `FROM clientes INNER JOIN pedidos ON pedidos.idCliente = clientes.idCliente`: Realiza o cruzamento das tabelas utilizando a chave primária `clientes.idCliente` e a chave estrangeira `pedidos.idCliente`.
* `COUNT(pedidos.id_pedido) ... GROUP BY clientes.nome`: Agrupa todas as compras feitas por uma mesma pessoa e conta quantas ocorrências de `id_pedido` existem para cada nome.
* `COUNT(*)` vs `SUM(quantidade)`:
* `COUNT(*)` em `pedidos` resulta em **15** (houve 15 pedidos/transações).
* `SUM(quantidade)` em `pedidos` resulta em **18** (foram vendidas 18 pizzas no total, pois alguns pedidos continham 2 unidades).



---

## 6. Tabelas Comparativas

### 1. Indicadores Globais no Banco `pizzaria`

| Consulta / Função | O que mede? | Resultado no Exemplo |
| --- | --- | --- |
| **`COUNT(*)` em `clientes**` | Total de clientes cadastrados no banco. | **10** clientes |
| **`COUNT(*)` em `pedidos**` | Total de notas/compras efetuadas no sistema. | **15** pedidos |
| **`SUM(quantidade)` em `pedidos**` | Volume total de unidades de pizzas vendidas. | **18** pizzas |

---

### 2. Consulta Simples vs. Consulta com `INNER JOIN`

| Abordagem | Tabela(s) Consultada(s) | O que exibe? |
| --- | --- | --- |
| **`SELECT * FROM pedidos`** | Apenas `pedidos` | Exibe os dados do pedido, mas mostra apenas o número do `idCliente` (código numérico). |
| **`SELECT ... FROM clientes INNER JOIN pedidos ...`** | `clientes` + `pedidos` | Exibe os dados do pedido junto com o **nome e telefone reais** do cliente. |

---

## 7. Erros Comuns e Cuidados

### 1. Executar `UPDATE` sem a cláusula `WHERE`

```sql
-- PERIGO EXTREMO (Alteraria O STATUS DE TODOS OS PEDIDOS do banco para 'Pendente')
UPDATE pedidos SET statusp = 'Pendente';

```

* **Regra de Ouro:** Sempre inclua a cláusula `WHERE` referenciando a chave primária (`WHERE id_pedido = 1`) ao executar comandos `UPDATE` ou `DELETE`.

### 2. Confundir `COUNT()` com `SUM()` em Relatórios de Estoque/Vendas

* **Incorreto para total de itens:** Usar `COUNT(quantidade)` apenas conta quantas linhas possuem valor preenchido na coluna `quantidade` (retornaria 15).
* **Correto para total de itens:** Usar `SUM(quantidade)` soma os valores contidos dentro da coluna (retorna 18).

---

## 8. Guia Rápido de Memorização

* **Filtrar por texto:** `WHERE coluna = 'Valor'`
* **Ordenar por data:** `ORDER BY data_pedido`
* **Atualizar um campo:** `UPDATE tabela SET coluna = 'Novo' WHERE id = X;`
* **Juntar tabelas:** `FROM tabA INNER JOIN tabB ON tabA.pk = tabB.fk`
* **Contar compras por cliente:** `SELECT nome, COUNT(id_pedido) ... GROUP BY nome`
* **Somar total vendido:** `SELECT SUM(quantidade) FROM pedidos;`

---

## Resumo Relâmpago — 10 Linhas

1. Foram inseridos 15 pedidos na tabela `pedidos`, todos associados aos clientes de ID 1 a 10.
2. A ordenação alfabética dos clientes é realizada com `SELECT * FROM clientes ORDER BY nome`.
3. O filtro `WHERE cidade = 'São Paulo'` isola apenas os clientes residentes na capital.
4. É possível filtrar pedidos por status e ordená-los por data com `WHERE statusp = 'Entregue' ORDER BY data_pedido`.
5. A seleção de colunas específicas (`pizza`, `tamanho`, `preco`) reduz o consumo de memória nas consultas.
6. O comando `UPDATE pedidos SET statusp = 'Pendente' WHERE id_pedido = 1` altera o status de um pedido específico.
7. O `INNER JOIN` cruza a tabela `clientes` com `pedidos` através da relação `clientes.idCliente = pedidos.idCliente`.
8. A combinação `COUNT(id_pedido)` com `GROUP BY clientes.nome` mostra a quantidade de pedidos feitos por cada cliente.
9. `COUNT(*)` é usado para obter o total de registros (10 clientes e 15 pedidos no histórico).
10. `SUM(quantidade)` calcula a soma real de unidades de pizzas vendidas (totalizando 18 pizzas).