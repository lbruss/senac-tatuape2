
# UPDATE, DELETE, TRUNCATE e Backup

**Ideia principal**

* `UPDATE` → altera dados;
* `DELETE` → remove registros específicos;
* `TRUNCATE` → remove todos os registros, mantendo a tabela;
* `DROP` → remove a própria tabela ou banco;
* **Backup/Export** → salva uma cópia do banco para poder restaurá-lo posteriormente.

Além disso, criei novamente o banco `cadastro`, com as tabelas `estudantes` e `cursos`, inseri vários registros e aprendi a exportar e importar o banco pelo MySQL Workbench.

---

## 1. Inserindo dados na tabela `cursos`

A tabela `cursos` já estava criada.

Para inserir um curso:

```sql
INSERT INTO cursos
(idcurso, nome, descricao, carga, totalaulas, ano)
VALUES
(DEFAULT, 'Algorritmoss', 'Lógica de programação. Você aprenderá sobre o desenvolvimento de soluções com aplicações da lógica...', 40, 10, 2026);
```

Nesse exemplo, foi cometido um erro de digitação:

```
Algorritmoss
```

O correto seria:

```
Algoritmos
```

Para corrigir um dado que já foi inserido, utilizamos o comando `UPDATE`.

---

## 2. UPDATE — Alterando dados

```sql
UPDATE cursos
SET nome = 'Algoritmos'
WHERE idcurso = 1;
```

Depois:

```
Ctrl + Enter
```

**O que aconteceu?**

O comando procurou o curso cujo:

```
idcurso = 1
```

e alterou o valor da coluna `nome`.

**Antes**

```
Algorritmoss
```

**Depois**

```
Algoritmos
```

---

# Entendendo o UPDATE

A estrutura básica é:

```sql
UPDATE tabela
SET coluna = novo_valor
WHERE condição;
```

**`UPDATE cursos`**

Informa qual tabela será alterada.

**`SET`**

Define o que será modificado.

**`WHERE`**

Define **qual registro** será alterado.

Isso é extremamente importante.

Sem o `WHERE`, podemos alterar todos os registros da tabela.

---

# Cuidado com o WHERE

Imagine:

```sql
UPDATE cursos
SET nome = 'Algoritmos';
```

Nesse caso, não existe `WHERE`.

Consequentemente, **todos os cursos terão o nome alterado para `Algoritmos`**.

Por isso, quando queremos alterar apenas um registro, normalmente utilizamos a Chave Primária:

```sql
WHERE idcurso = 1;
```

A Chave Primária torna a identificação do registro muito mais precisa.

---

## 3. Alterando vários campos ao mesmo tempo

Também é possível modificar várias colunas utilizando um único `UPDATE`.

```sql
UPDATE cursos
SET nome = 'Algoritmos',
    carga = 24,
    totalaulas = 6
WHERE idcurso = 1;
```

As alterações são separadas por vírgulas.

Nesse caso, o registro de `idcurso = 1` terá três campos modificados:

* `nome`;
* `carga`;
* `totalaulas`.

---

## 4. Safe Update Mode do MySQL Workbench

O MySQL Workbench possui um mecanismo de proteção chamado **Safe Updates**.

Ele evita comandos perigosos de `UPDATE` e `DELETE` que não possuem uma condição suficientemente restritiva.

Isso ajuda a evitar situações como:

```sql
UPDATE cursos
SET nome = 'Algoritmos';
```

ou:

```sql
DELETE FROM cursos;
```

sem perceber que estamos afetando a tabela inteira.

---

## Desativando o Safe Updates

No MySQL Workbench:

```
Edit
↓
Preferences
↓
SQL Editor
```

No final da tela, desmarque:

```
Safe Updates (reject UPDATEs and DELETEs with no restrictions)
```

Depois clique em:

```text
OK
```

Para a alteração entrar em funcionamento, é necessário **reconectar ao servidor**.

---

**Importante**

Não é recomendado desativar essa proteção sem necessidade.

O Safe Updates existe justamente para evitar acidentes.

Um comando errado pode modificar ou excluir **milhares de registros de uma vez**.

Se for necessário realizar uma operação em toda a tabela, é melhor ter certeza absoluta do que está sendo feito antes de desativar a proteção.

---

## 5. Alterando dados diretamente pela tabela

Existe outra maneira de corrigir vários dados utilizando a interface do Workbench.

Primeiro:

```sql
SELECT * FROM cursos;
```

Depois:

```
Ctrl + Enter
```

O Workbench mostrará os registros em formato de tabela.

É possível editar os valores diretamente na grade.

Depois de fazer as alterações:

```
Apply
```

O Workbench mostrará o SQL que será executado.

Depois clique novamente em:

```
Apply
```

para confirmar.

Essa opção é bastante útil quando precisamos corrigir visualmente vários registros.

---

## 6. DELETE — Excluindo registros

Para excluir um registro específico:

```sql
DELETE FROM cursos
WHERE idcurso = 1;
```

Depois:

```
Ctrl + Enter
```

O registro cujo `idcurso` é `1` será removido.

---

**DELETE não apaga a tabela**

Isso é importante.

```sql
DELETE FROM cursos
WHERE idcurso = 1;
```

remove apenas o **registro selecionado**.

A tabela continua existindo.

Sua estrutura também continua existindo.

- **Por exemplo:**

```
Tabela cursos
├── idcurso
├── nome
├── descricao
├── carga
├── totalaulas
└── ano
```

Apenas uma das linhas será removida.

---

# DELETE sem WHERE

Também é possível escrever:

```sql
DELETE FROM cursos;
```

Porém isso remove **todos os registros da tabela**.

A tabela continua existindo, mas ficará sem nenhuma linha.

Por isso, `DELETE` sem `WHERE` deve ser utilizado com extremo cuidado.

---

## 7. TRUNCATE TABLE

Outro comando é:

```sql
TRUNCATE TABLE cursos;
```

Esse comando remove **todos os registros da tabela**.

Porém, diferentemente de `DROP TABLE`, a tabela continua existindo.

---

# DELETE x TRUNCATE x DROP

Essa diferença é fundamental.

| Comando          | O que acontece                                     |
| ---------------- | -------------------------------------------------- |
| `DELETE`         | Remove registros específicos ou todos os registros |
| `TRUNCATE TABLE` | Remove todos os registros rapidamente              |
| `DROP TABLE`     | Remove a tabela inteira                            |
| `DROP DATABASE`  | Remove o banco de dados inteiro                    |

---

**`DELETE`**

```sql
DELETE FROM cursos
WHERE idcurso = 1;
```

Remove apenas o registro indicado.

---

**`TRUNCATE`**

```sql
TRUNCATE TABLE cursos;
```

Remove todas as linhas.

A estrutura continua:

```
cursos
├── idcurso
├── nome
├── descricao
├── carga
├── totalaulas
└── ano
```

Mas não existem mais registros.

---

**`DROP`**

```sql
DROP TABLE cursos;
```

Aqui a própria tabela deixa de existir.

Não sobra nem a estrutura.

---

> Analogia

Imagine um caderno.

**DELETE**

Você apaga algumas linhas.

**TRUNCATE**

Você apaga todas as anotações, mas continua com o caderno.

**DROP**

Você joga o caderno fora.

Essa diferença ajuda a memorizar os três comandos.

---

## 8. Criando novamente o banco `cadastro`

Agora foi criado novamente um banco para praticar com duas tabelas:

* `estudantes`;
* `cursos`.

```sql
CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

Depois:

```sql
USE cadastro;
```

---

## 9. Criando a tabela `estudantes`

```sql
CREATE TABLE estudantes (
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    sexo ENUM('f','m','o'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(30) DEFAULT 'Brasileiro'
) DEFAULT CHARSET=utf8;
```

Nesse momento a tabela ainda não possui um identificador.

Então adicionamos `profissao`:

```sql
ALTER TABLE estudantes
ADD COLUMN profissao VARCHAR(50) AFTER nome;
```

A coluna ficará logo depois de `nome`.

---

## 10. Adicionando a Chave Primária

```sql
ALTER TABLE estudantes
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;
```

Esse comando faz três coisas ao mesmo tempo:

**`ADD COLUMN`**

Adiciona a coluna `id`.

**`AUTO_INCREMENT`**

Gera automaticamente os números.

**`PRIMARY KEY`**

Transforma `id` na Chave Primária.

**`FIRST`**

Coloca a coluna no início da tabela.

A estrutura fica aproximadamente:

```
id
nome
profissao
nascimento
sexo
peso
altura
nacionalidade
```

---

## 11. Criando a tabela `cursos`

```sql
CREATE TABLE IF NOT EXISTS cursos (
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT,
    carga INT UNSIGNED,
    totalaulas INT,
    ano YEAR DEFAULT 2026
) DEFAULT CHARSET=utf8;
```

Depois adicionamos o identificador:

```sql
ALTER TABLE cursos
ADD COLUMN idcurso INT AUTO_INCREMENT PRIMARY KEY FIRST;
```

Agora temos duas tabelas independentes:

```
cadastro
│
├── estudantes
│
└── cursos
```

---

## 12. Inserindo vários cursos

```sql
INSERT INTO cursos
(nome, descricao, carga, totalaulas, ano)
VALUES
('Algoritmos', 'Lógica de programação para desenvolvimento de algoritmos e soluções computacionais.', 40, 10, 2026),
('Excel Essencial', 'Criação de planilhas, gráficos, fórmulas, funções e armazenamento em nuvem.', 40, 10, 2027),
('Excel Avançado I', 'Funções avançadas para cálculos, relatórios, gráficos e banco de dados.', 24, 6, 2028),
('Excel Avançado II', 'Recursos avançados do Excel para automação e análise de dados.', 24, 6, 2025),
('Formação Excel do Básico ao Avançado', 'Curso completo de Excel 365 do nível básico ao avançado.', 72, 18, 2026),
('Desenvolvedor Web Front-end I', 'Desenvolvimento de sites responsivos utilizando HTML e CSS.', 60, 15, 2027),
('Desenvolvedor Web Front-end II JavaScript', 'Desenvolvimento de interatividade em páginas web utilizando JavaScript.', 40, 12, 2028),
('PHP com MySQL', 'Desenvolvimento de sistemas web utilizando PHP e banco de dados MySQL.', 40, 12, 2025),
('Lógica de Programação com PHP', 'Desenvolvimento de algoritmos utilizando a linguagem PHP.', 40, 12, 2026);
```

O `idcurso` não precisa ser informado.

Isso acontece porque ele possui:

```sql
AUTO_INCREMENT
```

O MySQL gera automaticamente os IDs.

---

## 13. Inserindo vários estudantes

```sql
INSERT INTO estudantes
(nome, profissao, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('Ana Beatriz Almeida Souza', 'Enfermeira', '1998-03-15', 'f', 58, 1.65, 'Brasileira'),
('Carlos Eduardo Pereira Lima', 'Engenheiro', '1995-07-22', 'm', 82, 1.78, 'Português'),
('Mariana Oliveira Santos', 'Professora', '2001-11-09', 'f', 64, 1.70, 'Brasileira'),
('João Victor Rodrigues Costa', 'Analista de Sistemas', '1997-01-30', 'm', 85, 1.80, 'Angolano'),
('Fernanda Martins Ribeiro', 'Enfermeira', '1999-05-18', 'f', 55, 1.62, 'Brasileira'),
('Lucas Henrique Alves Rocha', 'Advogado', '1996-12-03', 'm', 76, 1.75, 'Argentino'),
('Juliana Ferreira Gomes', 'Médica', '2000-08-27', 'f', 60, 1.68, 'Brasileira'),
('Pedro Henrique Barbosa Silva', 'Contador', '1994-04-14', 'm', 88, 1.82, 'Chileno'),
('Camila Dias Carvalho', 'Designer', '2002-09-06', 'f', 52, 1.60, 'Colombiana'),
('Rafael Moreira Araújo', 'Administrador', '1993-02-25', 'm', 79, 1.77, 'Brasileiro'),
('Bruna Cardoso Monteiro', 'Psicóloga', '1998-10-12', 'f', 59, 1.66, 'Portuguesa'),
('Felipe Nascimento Teixeira', 'Desenvolvedor', '1997-06-19', 'm', 90, 1.83, 'Brasileiro'),
('Larissa Batista Correia', 'Arquiteta', '2001-03-08', 'f', 63, 1.69, 'Mexicana'),
('Gabriel Mendes Lopes', 'Técnico em Informática', '1995-11-21', 'm', 74, 1.74, 'Brasileiro'),
('Isabela Ramos Fernandes', 'Nutricionista', '1999-07-02', 'f', 57, 1.63, 'Espanhola'),
('Thiago Gonçalves Vieira', 'Policial', '1996-01-17', 'm', 84, 1.79, 'Brasileiro'),
('Amanda Castro Moura', 'Farmacêutica', '2000-12-29', 'f', 61, 1.67, 'Italiana'),
('Daniel Freitas Andrade', 'Empresário', '1994-05-10', 'm', 87, 1.81, 'Brasileiro');
```

Novamente, o `id` não foi informado porque o `AUTO_INCREMENT` cuida dele.

---

## 14. Conferindo as tabelas

Para verificar a estrutura:

```sql
DESC estudantes;
```

e:

```sql
DESC cursos;
```

Para visualizar os dados:

```sql
SELECT * FROM estudantes;
```

e:

```sql
SELECT * FROM cursos;
```

---

# Backup do banco de dados

Depois de criar e preencher o banco, aprendi a fazer um **backup**.

Backup é uma cópia dos dados que pode ser utilizada posteriormente para recuperar o banco.

Isso é fundamental porque bancos de dados podem conter informações muito importantes.

---

## Exportando o banco pelo MySQL Workbench

No Workbench:

```
Server
↓
Data Export
```

Depois:

1. Selecionar o banco de dados.
2. Selecionar **Dump Structure and Data**.
3. Manter a primeira opção selecionada.
4. Selecionar **Export to Self-Contained File**.
5. Marcar **Include Create Schema**.
6. Escolher o local onde o arquivo será salvo.
7. Clicar em **Start Export**.
8. Continuar a operação quando solicitado.
9. Informar a senha, caso seja solicitada.

---

**O que significa "Dump Structure and Data"?**

Essa opção é muito importante.

Ela salva:

**Structure**

A estrutura do banco:

* tabelas;
* colunas;
* tipos;
* chaves;
* configurações.

**Data**

Os registros armazenados nas tabelas.

Ou seja, o backup contém tanto:

```
Como o banco deve ser criado
```

quanto:

```
Quais dados estavam dentro dele
```

---

**O que é Self-Contained File?**

Significa que o backup será armazenado em **um único arquivo**.

Esse arquivo pode posteriormente ser utilizado para restaurar o banco.

É muito mais conveniente do que depender de vários arquivos separados.

---

# Importando o banco novamente

Para restaurar/importar o backup:

```
Server
↓
Data Import
```

Depois:

1. Selecionar **Import from Self-Contained File**.
2. Clicar nos três pontos `...`.
3. Localizar o arquivo de backup.
4. Selecionar o arquivo.
5. Clicar em **Start Import**.
6. Aguardar a conclusão.

Depois disso, o banco poderá ser restaurado no MySQL.

---

# Backup na prática

Podemos imaginar:

```
Banco original
      ↓
   EXPORT
      ↓
Arquivo de backup
      ↓
    IMPORT
      ↓
Banco restaurado
```

O **Export** tira uma cópia do banco.

O **Import** utiliza essa cópia para reconstruir o banco.

---

# Importância do Backup 

Imagine que eu tenha um banco com:

* 10.000 clientes;
* 5.000 produtos;
* milhares de vendas.

Se eu executar acidentalmente:

```sql
DROP DATABASE cadastro;
```

todos esses dados poderão ser perdidos.

Se existir um backup, posso restaurar o banco.

Por isso, em ambientes profissionais, backup é uma parte essencial da administração de bancos de dados.

---

# Comandos fundamentais desta aula

| Comando             | Função                                |
| ------------------- | ------------------------------------- |
| `INSERT INTO`       | Insere registros                      |
| `UPDATE`            | Altera registros                      |
| `SET`               | Define os novos valores               |
| `WHERE`             | Define quais registros serão afetados |
| `DELETE`            | Exclui registros                      |
| `TRUNCATE TABLE`    | Remove todos os registros             |
| `DROP TABLE`        | Remove a tabela                       |
| `SELECT`            | Consulta dados                        |
| `DESC` / `DESCRIBE` | Mostra a estrutura da tabela          |

---

# Diferença fundamental: UPDATE, DELETE, TRUNCATE e DROP

```
UPDATE
   ↓
Altera dados

DELETE
   ↓
Remove registros

TRUNCATE
   ↓
Remove todos os registros
   ↓
Mantém a tabela

DROP
   ↓
Remove a própria tabela
```

Essa diferença precisa estar muito bem entendida, porque esses comandos possuem consequências completamente diferentes.

---

**Dicas importantes**

* Sempre confira o `WHERE` antes de executar um `UPDATE` ou `DELETE`.
* Utilize a **Chave Primária** no `WHERE` quando quiser atingir um registro específico.
* Não desative o **Safe Updates** sem necessidade.
* `TRUNCATE` remove todos os registros, mas mantém a estrutura.
* `DROP TABLE` remove a tabela inteira.
* `DROP DATABASE` remove o banco inteiro.
* Faça backups antes de operações importantes.
* `AUTO_INCREMENT` permite que o MySQL controle automaticamente os identificadores.
* `INSERT` permite cadastrar vários registros de uma vez.
* O `SELECT` é útil para conferir se uma alteração realmente funcionou.

---

# Resumo final

Nesta aula aprendi a trabalhar diretamente com os **dados** das tabelas. Utilizei `UPDATE` para corrigir e alterar registros, `DELETE` para remover registros específicos e `TRUNCATE TABLE` para limpar completamente uma tabela sem apagar sua estrutura. Também compreendi a diferença entre essas operações e `DROP`, que remove a própria tabela. Depois recriei o banco `cadastro`, com as tabelas `estudantes` e `cursos`, inseri diversos registros e utilizei `SELECT` e `DESC` para verificar os resultados. Por fim, aprendi a realizar **backup e restauração** pelo MySQL Workbench usando Data Export e Data Import.

---

**Resumo Relâmpago**

1. `INSERT INTO` insere novos registros no banco.
2. `UPDATE` altera registros existentes.
3. `SET` define quais valores serão modificados.
4. `WHERE` determina exatamente quais registros serão afetados.
5. `DELETE` remove registros específicos ou todos os registros.
6. `TRUNCATE TABLE` remove todas as linhas, mas mantém a estrutura da tabela.
7. `DROP TABLE` remove a tabela inteira.
8. `AUTO_INCREMENT` gera automaticamente os IDs das novas linhas.
9. Backup salva uma cópia da estrutura e dos dados para recuperação futura.
10. No Workbench, **Data Export** cria o backup e **Data Import** permite restaurá-lo.
