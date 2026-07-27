# Banco de Dados (MySQL)

**Ideia principal**

Comecei a aprender **Banco de Dados**, entendendo como armazenar informações de forma organizada utilizando o **MySQL**.

Utilizar o **XAMPP**, que simula um servidor local, e o **MySQL Workbench**, que facilita a escrita e execução dos comandos SQL.

Criar bancos de dados, tabelas, inserir registros e compreendi por que uma **Chave Primária (Primary Key)** é indispensável para identificar cada registro de forma única.

---

**O que é um Banco de Dados?**

Um **Banco de Dados (Database)** é um sistema utilizado para armazenar informações de forma organizada.

Essas informações normalmente vêm de formulários, sistemas, aplicativos ou sites.

- **Exemplo**

Imagine um cadastro de uma escola.

Cada aluno preenche um formulário contendo:

* nome;
* data de nascimento;
* sexo;
* altura;
* peso;
* nacionalidade.

Esses dados precisam ser guardados em algum lugar.

Esse lugar é o **Banco de Dados**.

---

> Analogia

Imagine um grande arquivo de escritório.

- O armário inteiro seria o **Banco de Dados**.

- Cada gaveta seria uma **Tabela**.

- Cada folha seria um **Registro**.

Cada informação escrita na folha corresponde aos **campos** da tabela.

---

## Estrutura de um Banco de Dados

A organização normalmente segue esta estrutura:

```
Banco de Dados
│
├── Tabela Pessoas
│      ├── Registro 1
│      ├── Registro 2
│      └── Registro 3
│
├── Tabela Produtos
│
└── Tabela Funcionários
```

Ou seja:

* Um banco possui várias tabelas.
* Cada tabela possui vários registros.
* Cada registro possui vários campos.

---

**O que é um Registro?**

Um registro representa uma única informação cadastrada.

- **Exemplo**

| Nome  | Nascimento | Sexo |
| ----- | ---------- | ---- |
| Bruss | 29/05/2007 | M    |

Toda essa linha é um registro.

---

**O que é uma Tabela?**

A tabela organiza informações do mesmo tipo.

- **Exemplo:**

Tabela **Pessoas**

| Nome | Nascimento | Sexo | Peso |
| ---- | ---------- | ---- | ---- |

Cada coluna possui um tipo específico de dado.

---

# XAMPP

**O que é?**

O **XAMPP** é um pacote de programas que permite criar um **servidor local**.

Servidor local significa que tudo funciona apenas no próprio computador.

Ele é muito utilizado durante o desenvolvimento de projetos.

---

**Por que usar um servidor local?**

Antes de colocar um sistema na internet, é importante testá-lo.

O XAMPP permite fazer isso sem precisar contratar uma hospedagem.

É como montar uma "internet particular" dentro do computador.

---

**Componentes utilizados**

Foram utilizados dois serviços:

**Apache**

Responsável pelo servidor web.

Ele interpreta páginas PHP e disponibiliza o sistema.

---

**MySQL**

Responsável pelo Banco de Dados.

É ele quem armazena todas as informações.

---

## Iniciando o XAMPP

Abrir o XAMPP.

Depois clicar em:

```
Start → Apache
```

Em seguida:

```
Start → MySQL
```

Quando ambos estiverem em verde, significa que estão funcionando corretamente.

---

**Abrindo o phpMyAdmin**

Depois de iniciar o MySQL:

```
Admin
```

Será aberto automaticamente o navegador.

O sistema aberto chama-se:

```
phpMyAdmin
```

---

**O que é o phpMyAdmin?**

É uma interface gráfica para administrar bancos de dados.

Com ela é possível:

* criar bancos;
* criar tabelas;
* inserir dados;
* excluir informações;
* alterar estruturas.

Tudo isso utilizando uma interface visual.

---

# Criando um Banco de Dados pelo phpMyAdmin

No menu esquerdo:

```
Novo
```

Depois:

* escolher um nome;
* clicar em **Criar**.

Automaticamente o phpMyAdmin abrirá a tela para criação da primeira tabela.

---

# MySQL Workbench

**O que é?**

O **MySQL Workbench** é um programa utilizado para escrever comandos SQL.

Ele facilita muito o desenvolvimento porque possui:

* destaque de sintaxe;
* organização dos comandos;
* execução rápida;
* visualização de erros.

Na prática, ele funciona como um editor especializado em SQL.

---

**Criando a conexão**

Ao abrir o Workbench:

Clicar em:

```
+
```

Preencher:

**Connection Name**

Pode ser qualquer nome.

- **Exemplo:**

```
Servidor Local
```

---

**Hostname**

Normalmente permanece:

```
localhost
```

ou

```
127.0.0.1
```

Ambos representam o próprio computador.

---

**Porta**

A porta padrão do MySQL é:

```text
3306
```

Ela também pode ser consultada no XAMPP.

---

**Usuário**

```text
root
```

Por padrão, o usuário administrador criado pelo XAMPP é o **root**.

---

Depois basta clicar em:

```
OK
```

E abrir a conexão criada.

---

## Área do Workbench

No Workbench existem três áreas principais.

**Editor SQL**

Onde escrevemos os comandos.

---

**Resultado**

Na parte inferior aparece:

* erros;
* mensagens;
* resultado das consultas.

Isso facilita identificar problemas nos comandos.

---

**Schemas**

No canto esquerdo inferior existe a área:

```
Schemas
```

Ela mostra todos os bancos existentes.

---

# Criando um Banco pelo Workbench

Também é possível criar um banco diretamente pelo Workbench.

Clicar com o botão direito em:

```
Schemas
```

Depois:

```
Create Schema...
```

Escolher um nome.

Depois:

```
Apply
Apply
Finish
```

O banco será criado.

---

# Conceito importante

**Banco → Tabelas → Registros**

Essa é uma relação muito importante.

- **Exemplo:**

```
Banco:
Navio
```

Dentro dele:

```
Tabela:
Container
```

Dentro da tabela:

```
Registro:
Pessoa cadastrada
```

Ou seja:

Um banco contém várias tabelas.

Cada tabela contém vários registros.

---

# Criando um Banco via SQL

```sql
CREATE DATABASE cadastro;
```

Depois executar utilizando:

```
Ctrl + Enter
```

ou o botão do raio.

---

# Criando uma tabela

Na anotação original aparece `create tables`, mas o comando correto é:

```sql
CREATE TABLE pessoas (
    nome VARCHAR(30),
    idade INT,
    sexo CHAR(1),
    peso FLOAT,
    altura FLOAT,
    nacionalidade VARCHAR(30)
);
```

**Explicação linha por linha**

**CREATE TABLE**

Cria uma nova tabela.

---

**pessoas**

Nome da tabela.

---

**nome VARCHAR(30)**

Cria um campo chamado **nome**.

Pode armazenar até 30 caracteres.

---

**idade INT**

Armazena números inteiros.

> **Observação:** Na anotação original foi usado `Idade(11)`, mas a sintaxe correta é `INT`. O número entre parênteses não define a quantidade máxima de dígitos armazenados.

---

**sexo CHAR(1)**

Armazena apenas um caractere.

- **Exemplo:**

```
M
F
O
```

---

**peso FLOAT**

Armazena números com casas decimais.

---

**altura FLOAT**

Também armazena números decimais.

---

**nacionalidade VARCHAR(30)**

Texto com até 30 caracteres.

---

**Por que ocorreu erro?**

Ao executar o comando, apareceu um erro.

Isso aconteceu porque o MySQL não sabia em qual banco deveria criar a tabela.

Antes de criar a tabela é necessário selecionar o banco.

---

## Selecionando o banco

```
USE cadastro;
```

Esse comando informa:

> "Todos os próximos comandos serão executados dentro do banco chamado **cadastro**."

Depois disso:

```sql
CREATE TABLE pessoas (...);
```

funcionará normalmente.

---

# Atualizando o painel

Após criar a tabela:

Atualizar a lista de **Schemas**.

A tabela aparecerá no banco selecionado.

---

# Tipos de dados

**VARCHAR**

Armazena textos de tamanho variável.

Exemplo:

```
João
Maria
Alexandre
```

Cada registro ocupa apenas o espaço necessário.

---

**CHAR**

Armazena textos com tamanho fixo.

Muito utilizado para:

* sexo;
* UF;
* siglas.

---

**INT**

Armazena números inteiros.

Exemplo:

```
10
250
5000
```

---

**FLOAT**

Armazena números decimais.

Exemplo:

```
72.5
1.80
```

---

**DECIMAL**

Também armazena números decimais, porém com maior precisão.

É o tipo recomendado para:

* dinheiro;
* peso;
* medidas.

---

**DATE**

Armazena datas.

Formato:

```
AAAA-MM-DD
```

Exemplo:

```
2007-05-29
```

---

## Visualizando a estrutura da tabela

```sql
DESCRIBE pessoas;
```

ou

```sql
DESC pessoas;
```

O MySQL exibirá:

* nomes dos campos;
* tipos;
* restrições;
* chaves.

---

# Melhorando a modelagem

Durante a aula foi feita uma observação muito importante.

**Idade não é um bom campo**

A idade muda todos os anos.

Se hoje uma pessoa possui 18 anos, no próximo ano terá 19.

Isso obrigaria atualizar todos os registros constantemente.

Por isso o correto é armazenar:

```
Data de nascimento
```

A idade pode ser calculada automaticamente quando necessário.

Essa é uma prática utilizada em sistemas profissionais.

---

# Chave Primária (Primary Key)

Outro problema identificado foi que duas pessoas poderiam ser cadastradas várias vezes.

Como diferenciá-las?

A solução é utilizar uma **Chave Primária**.

---

**O que é?**

É um campo que identifica cada registro de forma única.

Nenhum valor pode se repetir.

---

- **Exemplos**

* CPF
* RG
* Matrícula
* Código do funcionário
* ID gerado automaticamente

Na maioria dos sistemas utiliza-se um campo chamado:

```sql
id
```

com incremento automático.

---

### Excluindo uma tabela

```sql
DROP TABLE pessoas;
```

Executar:

```text
Ctrl + Enter
```

A tabela será removida permanentemente.

---

### Excluindo um banco

```sql
DROP DATABASE cadastro;
```

Também remove todas as tabelas existentes dentro dele.

**Esse comando deve ser usado com cuidado, pois apaga todo o banco de dados.**

---

# Criando um banco configurado para UTF-8

```sql
CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

- **Explicação**

**DEFAULT CHARACTER SET utf8**

Define a codificação padrão.

Permite armazenar corretamente:

* acentos;
* cedilha;
* caracteres especiais.

---

**DEFAULT COLLATE utf8_general_ci**

Define as regras de comparação dos textos.

`ci` significa:

```
Case Insensitive
```

Ou seja:

```text
Bruss
BRUSS
bruss
```

são considerados equivalentes em muitas comparações.

---

# Criando a tabela (versão melhorada)

```sql
USE cadastro;

CREATE TABLE pessoas (
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    sexo ENUM('f','m','o'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(30) DEFAULT 'Brasileiro'
) DEFAULT CHARSET=utf8;
```

**Melhorias**

* `NOT NULL` impede que o nome fique vazio.
* `DATE` substitui idade.
* `ENUM` limita os valores permitidos para o sexo.
* `DECIMAL` é mais preciso que `FLOAT`.
* `DEFAULT` define um valor padrão caso nenhum seja informado.

---

## Inserindo um registro

```sql
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('Bruss','2007-05-29','m',70.00,1.65,'Brasileiro');
```

**O que faz?**

Adiciona uma nova linha na tabela `pessoas`.

Cada valor corresponde à coluna indicada.

---

# Consultando os dados

```sql
SELECT * FROM pessoas;
```

- **Explicação**

* `SELECT` → selecionar dados.
* `*` → todas as colunas.
* `FROM pessoas` → da tabela `pessoas`.

O resultado será uma lista com todos os registros cadastrados.

---

**Problema encontrado**

Mesmo após inserir um registro, ainda existe um problema.

Nada impede que a mesma pessoa seja cadastrada várias vezes.

Isso acontece porque **a tabela ainda não possui uma Chave Primária**.

Por esse motivo, o banco foi apagado para, na próxima etapa, recriar a estrutura corretamente utilizando uma chave primária.

---

**Dicas importantes**

* Sempre execute `USE nome_do_banco;` antes de criar tabelas.
* Prefira `DATE` em vez de armazenar idade.
* Utilize `DECIMAL` para valores que exigem precisão, como peso, altura e dinheiro.
* Todo banco de dados deve possuir uma **Chave Primária**, pois ela garante que cada registro seja único.
* Use `SELECT * FROM tabela;` para conferir se os dados foram gravados corretamente.

---

# Em resumo

Nesta aula aprendi os conceitos fundamentais de Banco de Dados utilizando MySQL. Configurei um servidor local com o XAMPP, acessei o phpMyAdmin e conectei o MySQL Workbench ao banco de dados. Criei bancos e tabelas, conheci os principais tipos de dados, inseri meu primeiro registro utilizando `INSERT INTO` e consultei as informações com `SELECT`. Também compreendi a importância de utilizar uma Chave Primária para impedir registros duplicados e por que armazenar a data de nascimento é uma solução melhor do que armazenar a idade.

---

**Resumo Relâmpago**

1. Um Banco de Dados armazena informações organizadas em tabelas.
2. O XAMPP cria um servidor local para testes, utilizando Apache e MySQL.
3. O phpMyAdmin permite administrar bancos de dados por uma interface gráfica.
4. O MySQL Workbench facilita a escrita e execução de comandos SQL.
5. `CREATE DATABASE` cria um novo banco de dados.
6. `USE cadastro;` seleciona o banco onde os próximos comandos serão executados.
7. `CREATE TABLE` cria tabelas com diferentes tipos de dados.
8. `INSERT INTO` adiciona novos registros e `SELECT *` exibe todos os dados.
9. A data de nascimento é melhor que a idade, pois não muda com o tempo.
10. Toda tabela deve possuir uma **Chave Primária**, garantindo que cada registro seja único.
