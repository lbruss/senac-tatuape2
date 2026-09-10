# Introdução a Banco de Dados e MySQL

---

## 1. Visão Geral

Nesta aula, comecei os estudos sobre **Banco de Dados Relacional**, utilizando o ecossistema MySQL com a ferramenta de gerenciamento gráfico **MySQL Workbench** e o **XAMPP**.

O objetivo de um banco de dados é armazenar, organizar e persistir as informações fornecidas por sistemas ou formulários web. Em vez de salvar dados em arquivos de texto soltos, o banco garante segurança, integridade, facilidade de consulta e acesso simultâneo para os dados das nossas aplicações.

---

## 2. Entendendo o Conceito

Para compreender como as informações ficam guardadas, a estrutura segue uma hierarquia simples:

1. **Servidor de Banco de Dados:** É o computador ou serviço que roda o sistema gerenciador (ex: MySQL).
2. **Banco de Dados (Schema):** É como uma grande pasta ou diretório do projeto.
3. **Tabela:** É uma estrutura de linhas e colunas criada dentro do banco para organizar um tipo específico de entidade (ex: usuários, produtos, pedidos).
4. **Registro (ou Linha/Tupla):** É o dado individual inserido em uma tabela.

### Analogia

> Pense no **Banco de Dados** como um armário de arquivos de uma empresa.
> Cada **Tabela** é uma gaveta rotulada (ex: "Ficha de Clientes").
> Cada **Registro** é uma folha de papel preenchida com os dados de um único cliente que fica dentro dessa gaveta.

---

## 3. Conceitos Fundamentais

### Tipos de Dados Básicos no MySQL

Os tipos de dados definem qual natureza de informação uma coluna de tabela pode armazenar:

* **`INT`**: Armazena números inteiros sem casas decimais (ex: IDs, contagens).
* **`VARCHAR(n)`**: Armazena texto de tamanho variável até o limite $n$ de caracteres. Se alocarmos `VARCHAR(30)` e gravarmos "Bruss" (5 caracteres), o banco ocupará espaço equivalente a apenas 5 caracteres.
* **`CHAR(n)`**: Armazena texto com tamanho fixo. Se definir `CHAR(10)` e salvar "Ana", o banco preencherá os 7 caracteres restantes com espaços em branco. É ideal para dados com tamanho constante, como siglas de estados (`CHAR(2)`) ou sexo (`CHAR(1)`).
* **`FLOAT`**: Armazena números com ponto flutuante (decimais) de precisão simples.
* **`DECIMAL(m, d)`**: Armazena números decimais com precisão exata. Onde $m$ é o número total de dígitos e $d$ é a quantidade de casas após a vírgula. Exemplo: `DECIMAL(5,2)` suporta valores até `999.99`.
* **`DATE`**: Armazena datas no formato padrão ISO `'AAAA-MM-DD'`.
* **`ENUM('val1', 'val2', ...)`**: Limita a coluna a aceitar apenas uma das opções pré-definidas na lista.

### Chave Primária (Primary Key)

A **Chave Primária (PK)** é um campo ou conjunto de campos que identifica cada registro de uma tabela de forma única. Ela impede a duplicação de dados e garante que uma pessoa ou item não seja cadastrado repetidamente com as mesmas características sem uma forma de diferenciação.

---

## 4. Ferramentas Utilizadas: XAMPP e MySQL Workbench

Para trabalhar com banco de dados localmente durante o desenvolvimento, utilizamos duas ferramentas complementares:

### XAMPP (Servidor Local)

Servidor simulado que roda localmente na máquina (`localhost`). Nele, ativamos o módulo **Apache** (servidor web) e o módulo **MySQL** (servidor de banco de dados).

### MySQL Workbench

Cliente gráfico que se conecta ao MySQL rodando no XAMPP para executarmos nossos scripts SQL, visualizar esquemas e gerenciar as tabelas visualmente.

---

## 5. Passo a Passo: Configuração do Ambiente

1. **Iniciar os Serviços no XAMPP:**
* Abra o painel do XAMPP.
* Clique em **Start** no *Apache* e no *MySQL* para subir os serviços locais.


2. **Criar a Conexão no MySQL Workbench:**
* Abra o MySQL Workbench e clique no ícone **`+`** ao lado de *MySQL Connections*.
* **Connection Name:** Digite um nome para a conexão (ex: `Localhost`).
* **Hostname:** Mantenha `127.0.0.1` ou `localhost` (representa a própria máquina).
* **Port:** Verifique se está apontando para a porta do MySQL no XAMPP (padrão: `3306`).
* **Username:** Deixe como `root`.
* Clique em **OK** e abra a conexão criada.


3. **Localizar o painel de esquemas:**
* No menu inferior esquerdo do Workbench, selecione a aba **Schemas** para visualizar todos os bancos de dados criados.



---

## 6. Código / Exemplos Práticos

### Primeiro Teste: Criação Inicial e Ajuste de Erros

Abaixo está o primeiro script testado em aula, corrigindo o comando incorreto de criação de tabela (`CREATE TABLES` foi corrigido para `CREATE TABLE`).

```sql
-- Seleciona qual banco de dados receberá os comandos a seguir
USE cadastro;

-- Criação inicial da tabela de pessoas
CREATE TABLE pessoas (
    nome VARCHAR(30),
    idade INT,
    sexo CHAR(1),
    peso FLOAT,
    altura FLOAT,
    nacionalidade VARCHAR(30)
);

-- Exibe a estrutura e os tipos de dados da tabela
DESCRIBE pessoas;

```

---

### Desmontando o Código

* `USE cadastro;`: Informa ao MySQL em qual banco de dados os comandos subsequentes devem ser aplicados. Sem esse comando, o MySQL retorna erro de "Nenhum banco selecionado".
* `CREATE TABLE pessoas (...);`: Instrui o banco a estruturar uma nova tabela chamada `pessoas` com os campos especificados entre parênteses.
* `DESCRIBE pessoas;`: Retorna o esquema da tabela (colunas, tipos de dados, aceitação de nulos, chaves e valores padrão).

---

### Apagando e Reconstruindo o Banco com Codificação UTF-8

Para dar suporte correto a acentos e caracteres da língua portuguesa, apagamos a estrutura inicial e recriamos o banco especificando o *charset* correto.

```sql
-- Exclusão de estruturas antigas caso existam
DROP TABLE IF EXISTS pessoas;
DROP DATABASE IF EXISTS cadastro;

-- Criação do banco de dados configurado para padrão UTF-8
CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

-- Seleção do banco de dados ativo
USE cadastro;

-- Criação da tabela otimizada com restrições e valores padrão
CREATE TABLE pessoas (
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    sexo ENUM('m', 'f', 'o'),
    peso DECIMAL(5, 2),
    altura DECIMAL(3, 2),
    nacionalidade VARCHAR(30) DEFAULT 'Brasileiro'
) DEFAULT CHARSET = utf8;

-- Inserção de um registro de teste
INSERT INTO pessoas 
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES 
('Bruss', '2007-05-29', 'm', 70.00, 1.65, 'Brasileiro');

-- Consulta de todos os registros salvos na tabela
SELECT * FROM pessoas;

```

---

### Desmontando o Código Avançado

* `DROP DATABASE cadastro;`: Apaga permanentemente o banco de dados e todas as tabelas contidas nele.
* `DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci`: Define a codificação do banco para UTF-8, garantindo suporte a acentuação e caracteres especiais sem corromper o texto.
* `NOT NULL`: Garante que o campo `nome` seja de preenchimento obrigatório no momento do cadastro.
* `ENUM('m', 'f', 'o')`: Restringe as opções aceitas no campo `sexo` apenas aos valores definidos.
* `DEFAULT 'Brasileiro'`: Define um valor automático para a coluna caso nenhum valor seja informado na inserção.
* `INSERT INTO pessoas (...) VALUES (...)`: Insere uma nova linha de dados na tabela associando as colunas declaradas aos seus respetivos valores.
* `SELECT * FROM pessoas;`: Realiza uma busca e retorna todas as colunas (`*`) e registros existentes na tabela `pessoas`.

---

## 7. Tabelas Comparativas

### Diferença Entre Tipos Textuais

| Tipo de Dado | Comportamento no Armazenamento | Exemplo de Aplicação | Desempenho / Uso |
| --- | --- | --- | --- |
| **`CHAR(n)`** | Tamanho fixo. Preenche o restante com espaços. | Sigla de UF (`'SP'`), Sexo (`'M'`) | Mais rápido para buscas em tamanhos fixos. |
| **`VARCHAR(n)`** | Tamanho variável. Aloca apenas os caracteres usados. | Nome completo, E-mail | Economiza espaço em disco. |
| **`ENUM(...)`** | Aceita estritamente opções de uma lista fechada. | Estado civil, Sexo, Status do pedido | Garante validação no próprio banco. |

---

## 8. Erros Comuns e Cuidados

### 1. Digitar o comando no plural

```sql
-- INCORRETO
CREATE TABLES pessoas ( ... );

```

```sql
-- CORRETO
CREATE TABLE pessoas ( ... );

```

* **Motivo:** A sintaxe DDL do SQL exige que o objeto seja declarado no singular (`CREATE TABLE`, `CREATE DATABASE`).

### 2. Esquecer de selecionar o banco ativo

Ao executar `CREATE TABLE` sem executar `USE nome_do_banco;` antes, o Workbench exibirá um erro informando que nenhum banco de dados padrão foi selecionado (*No database selected*).

### 3. Usar idade em vez de data de nascimento

Guardar a **idade** diretamente no banco de dados exige atualização constante a cada ano. A boa prática é armazenar a **data de nascimento** (`DATE`) e calcular a idade dinamicamente via consulta quando necessário.

### 4. Ausência de Chave Primária

Inserir registros sem uma **Chave Primária** permite a entrada de dados duplicados e idênticos, tornando impossível distinguir ou atualizar um registro específico no futuro.

---

## 9. Aprofundamento e Boas Práticas

> **Observação importante (Conhecimento Complementar):**
> Na aula criamos a tabela sem uma chave primária explicitada. Para resolver o problema de duplicidade de registros mencionado no final do rascunho, adicionamos uma coluna com auto-incremento configurada como chave primária:

```sql
CREATE TABLE pessoas (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    sexo ENUM('m', 'f', 'o'),
    peso DECIMAL(5, 2),
    altura DECIMAL(3, 2),
    nacionalidade VARCHAR(30) DEFAULT 'Brasileiro',
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8;

```

O atributo `AUTO_INCREMENT` faz com que o MySQL gere automaticamente um número sequencial único (1, 2, 3...) para cada nova pessoa cadastrada.

---

## 10. Guia Rápido de Memorização

* **Criar Banco:** `CREATE DATABASE nome;`
* **Deletar Banco:** `DROP DATABASE nome;`
* **Selecionar Banco:** `USE nome;`
* **Criar Tabela:** `CREATE TABLE nome (coluna TIPO);`
* **Deletar Tabela:** `DROP TABLE nome;`
* **Ver Estrutura:** `DESCRIBE nome_da_tabela;`
* **Inserir Dados:** `INSERT INTO tabela (colunas) VALUES (valores);`
* **Consultar Dados:** `SELECT * FROM tabela;`
* **Executar no Workbench:** Ícone do raio (`Ctrl + Enter` na linha selecionada).

---

## Resumo Relâmpago — 10 Linhas

1. Banco de Dados armazena de forma estruturada as informações enviadas por aplicações e formulários.
2. O XAMPP emula o servidor local (`localhost`) rodando os serviços do Apache e MySQL.
3. O MySQL Workbench é a interface gráfica para escrita e execução de scripts SQL.
4. Bancos de dados são organizados em tabelas, e tabelas são compostas por linhas (registros) e colunas.
5. Os comandos `CREATE DATABASE` e `CREATE TABLE` estruturam os bancos e tabelas.
6. É necessário executar `USE nome_do_banco;` para indicar onde as tabelas serão criadas.
7. O tipo `VARCHAR` aloca texto de tamanho variável e o `CHAR` reserva tamanho fixo.
8. Configurar `DEFAULT CHARACTER SET utf8` evita erros de acentuação no banco.
9. O comando `INSERT INTO` grava novos registros e o `SELECT * FROM` faz a leitura desses dados.
10. A Chave Primária (`PRIMARY KEY`) é indispensável para evitar cadastros duplicados e identificar registros de forma única.
