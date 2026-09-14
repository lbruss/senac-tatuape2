# BANCO JAPDV

---

**Visão Geral**

Nesta prática, iniciamos do zero a construção do banco de dados **`japdv`**, projetado para atender às necessidades reais de um **Sistema de Ponto de Venda (PDV)** e controle de estoque de uma loja.

O foco da aula foi estabelecer o relacionamento **1:N (Um-para-Muitos)** entre a tabela pai (**`fornecedores`**) e a tabela filho (**`produtos`**), além de aplicar tipos de dados e restrições fundamentais para sistemas comerciais:

* Uso de **`DECIMAL(8,2)`** para precisão em valores monetários.
* Uso da restrição **`UNIQUE`** no código de barras para evitar duplicidade de itens.
* Cruzamento de dados entre produto e seu respectivo fornecedor utilizando o **`INNER JOIN`**.

---

**Entendendo o Conceito**

**O Cenário de Negócio do PDV**

Em uma loja, os produtos vendidos no caixa precisam estar associados a quem os forneceu.

* **Um fornecedor** pode nos fornecer **vários produtos** ($1:N$).
* **Um produto** específico vem de apenas **um fornecedor principal** cadastrado.

**Por que usar `DECIMAL(8,2)` para Preços?**

Tipos numéricos como `FLOAT` e `DOUBLE` utilizam representação de ponto flutuante, o que pode gerar pequenas imprecisões de arredondamento em operações matemáticas (ex: $0.1 + 0.2 = 0.30000000000000004$). Em sistemas financeiros e de PDV, onde cada centavo importa, o tipo **`DECIMAL(M,D)`** é obrigatório por armazenar os números de forma exata.

* `DECIMAL(8,2)` significa: **8 dígitos no total**, dos quais **2 são decimais** (permite valores até $999.999,99$).

## A Restrição `UNIQUE` (Unicidade)

Ao contrário da Chave Primária (`PRIMARY KEY`), que identifica a linha inteira na tabela, a restrição **`UNIQUE`** pode ser aplicada a qualquer coluna para garantir que não existam dois registros com o mesmo valor nesse campo.

* **Aplicação no PDV:** O campo `codigoBarras` (GTIN/EAN) recebe a restrição `UNIQUE` para que o sistema impeça o cadastro acidental de dois produtos diferentes com o mesmo código de barras.

---

## Conceitos Fundamentais

* **`DECIMAL(P, D)`**: Tipo numérico exato. `P` é a precisão (total de dígitos) e `D` é a escala (casas decimais).
* **`UNIQUE`**: Restrição que impede valores duplicados em uma coluna específica na tabela.
* **Chave Estrangeira (`idFornecedor`)**: Coluna na tabela `produtos` que garante que o produto só seja cadastrado se apontar para um fornecedor válido.
* **`ORDER BY nome`**: Cláusula que ordena o resultado da consulta em ordem alfabética crescente (A-Z).
* **`INNER JOIN`**: Cláusula de junção que combina as linhas da tabela `produtos` com a tabela `fornecedores` onde a chave estrangeira for igual à chave primária.

---

### Código / Exemplos Práticos

**Script Completo de Criação, Povoamento e Consulta do Banco `japdv`**

```sql
-- 1. Criação e seleção do banco de dados JAPDV
CREATE DATABASE japdv
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE japdv;

-- 2. Criação da Tabela Pai: FORNECEDORES
CREATE TABLE fornecedores (
    idFornecedor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    fone VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY (idFornecedor)
) DEFAULT CHARSET = utf8;

-- Inserção de fornecedores para o sistema
INSERT INTO fornecedores
(idFornecedor, nome, fone, email)
VALUES
(DEFAULT, 'Tech Supplies LTDA', '(11) 987654321', 'contato@techsupplies.com.br'),
(DEFAULT, 'Distribuidora Silva S/A', '(21) 34567890', 'vendas@distribuidorasilva.com'),
(DEFAULT, 'Comércio de Embalagens Brasil', '(31) 991234567', 'atendimento@embalagensbrasil.com.br');

-- Listagem de fornecedores ordenada alfabeticamente
SELECT * FROM fornecedores
ORDER BY nome;

-- 3. Criação da Tabela Filho: PRODUTOS (com UNIQUE e FOREIGN KEY)
CREATE TABLE produtos (
    idProduto INT NOT NULL AUTO_INCREMENT,
    codigoBarras VARCHAR(100) UNIQUE,
    descricao TEXT NOT NULL,
    categoria VARCHAR(100),
    precoCusto DECIMAL(8,2) NOT NULL,
    precoVenda DECIMAL(8,2) NOT NULL,
    quantidade INT NOT NULL,
    estoqueMinimo INT NOT NULL,
    idFornecedor INT,
    FOREIGN KEY (idFornecedor) REFERENCES fornecedores(idFornecedor),
    PRIMARY KEY (idProduto)
) DEFAULT CHARSET = utf8;

-- Inserção de produtos vinculados aos seus fornecedores (IDs 1, 2 e 3)
INSERT INTO produtos
(idProduto, codigoBarras, descricao, categoria, precoCusto, precoVenda, quantidade, estoqueMinimo, idFornecedor)
VALUES
(DEFAULT, '7891234567890', 'Mouse Sem Fio óptico', 'Periféricos', 25.00, 49.90, 20, 5, 1),
(DEFAULT, '7891234567891', 'Teclado Mecânico RGB', 'Periféricos', 110.00, 199.90, 12, 3, 1),
(DEFAULT, '7891234567892', 'Suporte Ergonomico para Notebook', 'Acessórios', 35.00, 69.90, 15, 4, 2),
(DEFAULT, '7891234567893', 'Cabo HDMI 2.0 2 Metros', 'Cabos', 12.00, 29.90, 50, 10, 2),
(DEFAULT, '7891234567894', 'Caixa de Papelão 30x30x30 (10 Unid)', 'Embalagens', 18.00, 35.00, 100, 20, 3),
(DEFAULT, '7891234567895', 'Fita Adesiva Transparente 45mm x 45m', 'Embalagens', 4.50, 12.00, 80, 15, 3);

-- 4. Consulta Relatório de Estoque com INNER JOIN
SELECT 
    produtos.idProduto, 
    produtos.descricao, 
    produtos.categoria, 
    produtos.precoVenda, 
    produtos.quantidade, 
    produtos.estoqueMinimo, 
    fornecedores.nome AS fornecedor
FROM produtos
INNER JOIN fornecedores
ON fornecedores.idFornecedor = produtos.idFornecedor;

```

---

**Desmontando o Código**

* `codigoBarras VARCHAR(100) UNIQUE`: Adiciona a coluna de código de barras impondo a regra de unicidade. Se tentar inserir um segundo produto com o código `'7891234567890'`, o banco gera um erro de violação de chave única (*Duplicate entry*).
* `precoCusto DECIMAL(8,2) NOT NULL`: Permite registrar custos até `999999.99` garantindo exatidão centesimal.
* `FOREIGN KEY (idFornecedor) REFERENCES fornecedores(idFornecedor)`: Cria o vínculo de integridade referencial com a tabela de fornecedores.
* `fornecedores.nome AS fornecedor`: Atribui um apelido de coluna (*column alias*) para que no resultado da busca a coluna `nome` do fornecedor apareça com o título clareador **`fornecedor`**.

---

## Tabelas Comparativas

**`PRIMARY KEY` vs `UNIQUE`**

| Característica | `PRIMARY KEY` (Chave Primária) | `UNIQUE` (Restrição de Unicidade) |
| --- | --- | --- |
| **Identificação** | Identificador principal e obrigatório da linha. | Garante que valores de uma coluna não se repitam. |
| **Quantidade por Tabela** | Apenas **uma** por tabela. | Pode haver **múltiplas** em uma mesma tabela. |
| **Aceita Valores Nulos (`NULL`)** | **Não** (Sempre é `NOT NULL`). | **Sim** (Pode aceitar `NULL`, dependendo da declaração). |
| **Exemplo no JAPDV** | `idProduto` | `codigoBarras` |

---

**Tipos de Dados Numéricos para Valores Financeiros**

| Tipo de Dado | Precisão | Uso Recomendado |
| --- | --- | --- |
| **`FLOAT` / `DOUBLE**` | Ponto Flutuante (Aproximado) | Medições científicas, peso, altura, coordenadas GPS. |
| **`DECIMAL(M,D)`** | Numérico Exato (Fixo) | **Valores monetários**, preços, saldos bancários, impostos. |
| **`INT`** | Inteiro Sem Decimais | Quantidades em estoque, IDs, contadores. |

---

## Erros Comuns e Cuidados

**Usar `FLOAT` para Guardar Preços de Produtos**

Utilizar `FLOAT` pode fazer com que um preço de `R$ 49.90` seja salvo no disco como `49.89999961853027`. Ao calcular totais de vendas e relatórios de fechamento de caixa, o sistema acumulará diferenças de centavos. Use sempre `DECIMAL(8,2)`.

**Tentar Inserir Código de Barras Duplicado**

```sql
-- INCORRETO (Gera Erro 1062: Duplicate entry '7891234567890' for key 'codigoBarras')
INSERT INTO produtos (codigoBarras, descricao, ...) 
VALUES ('7891234567890', 'Mouse Gamer', ...);

```

* **Motivo:** A restrição `UNIQUE` impede a gravação de um código que já existe em outro produto cadastrado.

---

**Guia Rápido de Memorização**

* **Criar Banco:** `CREATE DATABASE japdv DEFAULT CHARACTER SET utf8;`
* **Definir Preço Exato:** `precoVenda DECIMAL(8,2) NOT NULL`
* **Evitar Código Duplicado:** `codigoBarras VARCHAR(100) UNIQUE`
* **Criar FK na Tabela:** `FOREIGN KEY (idFornecedor) REFERENCES fornecedores(idFornecedor)`
* **Consulta com Fornecedor:** `SELECT ... FROM produtos INNER JOIN fornecedores ON fornecedores.idFornecedor = produtos.idFornecedor;`

---

**Resumo Relâmpago**

1. O banco `japdv` foi criado para gerenciar o estoque e os fornecedores de um sistema de Ponto de Venda (PDV).
2. A tabela `fornecedores` atua como tabela pai e a tabela `produtos` atua como tabela filho no relacionamento 1:N.
3. A ordenação dos fornecedores foi realizada com a cláusula `ORDER BY nome`.
4. O tipo `DECIMAL(8,2)` foi utilizado nos preços para garantir precisão exata de centavos sem erros de arredondamento.
5. A restrição `UNIQUE` no `codigoBarras` impede que o mesmo código GTIN/EAN seja cadastrado duas vezes.
6. A chave estrangeira `idFornecedor` na tabela `produtos` garante a integridade referencial com os fornecedores.
7. O povoamento incluiu 3 fornecedores e 6 produtos devidamente vinculados por seus respectivos IDs.
8. O comando `INNER JOIN` cruzou as duas tabelas para exibir os detalhes dos produtos ao lado do nome do fornecedor.
9. A cláusula `ON fornecedores.idFornecedor = produtos.idFornecedor` estabelece a condição de igualdade da junção.
10. O uso de apelidos (`AS fornecedor`) melhora a legibilidade e a apresentação dos relatórios de consulta.Compreendido. Vou focar estritamente em organizar, refinar e formatar o texto exato que você enviar, sem adicionar informações extras ou criar conteúdo do zero.

