# Alterando a Estrutura das Tabelas (ALTER TABLE)

**Ideia principal**

Utilizando o comando **`ALTER TABLE`**, responsável por modificar a estrutura de uma tabela já existente.

Com ele é possível:

* adicionar colunas;
* remover colunas;
* alterar o tipo de um campo;
* modificar restrições (*constraints*);
* renomear colunas;
* renomear tabelas;
* alterar a posição das colunas;
* adicionar Chaves Primárias.

Esse comando é um dos mais importantes do SQL, pois permite evoluir um banco de dados sem precisar recriá-lo do zero.

---

**O que é ALTER TABLE?**

O comando:

```sql
ALTER TABLE
```

serve para modificar uma tabela que já existe.

Enquanto o `CREATE TABLE` cria uma tabela nova, o `ALTER TABLE` faz alterações em uma tabela já criada.

> Analogia

Imagine que uma tabela seja uma casa.

* `CREATE TABLE` → construir a casa.
* `ALTER TABLE` → reformar a casa.

Você pode adicionar quartos, remover paredes ou trocar portas, sem precisar demolir tudo.

---

# Selecionando o banco

Antes de qualquer alteração, é necessário informar ao MySQL qual banco será utilizado.

```sql
USE cadastro;
```

A partir desse momento, todos os comandos serão executados dentro do banco **cadastro**.

---

**Estrutura inicial da tabela**

A tabela utilizada na aula foi:

```sql
CREATE TABLE pessoas (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nascimento DATE,
    sexo ENUM('f','m','o'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(30) DEFAULT 'Brasileiro',
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;
```

---

## Adicionando uma nova coluna

Para adicionar uma coluna chamada **profissao**:

```sql
ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(20);
```

- **Explicação**

**ALTER TABLE pessoas**

Indica qual tabela será modificada.

**ADD COLUMN**

Adiciona uma nova coluna.

**profissao**

Nome da nova coluna.

**VARCHAR(20)**

Permite armazenar até 20 caracteres.

---

**Onde a coluna será criada?**

Quando nenhuma posição é informada, o MySQL adiciona a coluna **no final da tabela**.

- **Exemplo:**

Antes:

| id | nome | nascimento | sexo |
| -- | ---- | ---------- | ---- |

Depois:

| id | nome | nascimento | sexo | profissão |

---

**Verificando a estrutura**

Após qualquer alteração, é recomendado executar:

```sql
DESCRIBE pessoas;
```

ou

```sql
DESC pessoas;
```

Assim é possível conferir se a alteração foi aplicada corretamente.

---

# Mudando a posição da coluna

Caso a coluna tenha sido criada no lugar errado, posso removê-la e criá-la novamente na posição desejada.

```sql
ALTER TABLE pessoas
DROP COLUMN profissao;
```

Depois:

```sql
ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(20) AFTER nome;
```

---

**O que significa AFTER?**

O comando:

```sql
AFTER nome
```

faz com que a nova coluna seja criada **logo após a coluna `nome`**.

Resultado:

| id | nome | profissão | nascimento |

---

**Observação importante**

No MySQL existe apenas o comando:

```sql
AFTER
```

Não existe um comando chamado `BEFORE` para posicionar colunas antes de outra.

Para colocar uma coluna no início da tabela utiliza-se outro comando, visto a seguir.

---

## Adicionando uma coluna no início

```sql
ALTER TABLE pessoas
ADD COLUMN codigo INT FIRST;
```

**O que faz?**

A palavra:

```sql
FIRST
```

coloca a nova coluna como a primeira da tabela.

Resultado:

| codigo | id | nome | profissão | nascimento |

---

# Removendo uma coluna

Se ela não for mais necessária:

```sql
ALTER TABLE pessoas
DROP COLUMN codigo;
```

A coluna será removida da estrutura da tabela.

> **Atenção:** Ao remover uma coluna, todos os dados armazenados nela também são apagados.

---

# Alterando o tipo de uma coluna

Também é possível alterar o tipo de um campo já existente.

- **Exemplo:**

```sql
ALTER TABLE pessoas
MODIFY COLUMN profissao VARCHAR(30) NOT NULL;
```

**O que aconteceu?**

* o tamanho passou de 20 para 30 caracteres;
* o campo passou a ser obrigatório (`NOT NULL`).

---

**Por que apareceu um aviso??*

Apareceu um símbolo de alerta (⚠️).

Isso aconteceu porque já existiam registros cadastrados.

Esses registros não possuíam valor na coluna **profissao**.

Como a coluna passou a ser obrigatória (`NOT NULL`), o MySQL encontrou valores vazios e gerou um aviso.

Esse aviso é conhecido como **truncation warning** ou aviso de conversão/truncamento de dados, dependendo da situação.

---

## Corrigindo o problema

Para evitar esse aviso, pode-se definir um valor padrão.

```sql
ALTER TABLE pessoas
MODIFY COLUMN profissao VARCHAR(30) NOT NULL DEFAULT '';
```

**O que significa?**

Sempre que um novo registro não informar a profissão, o MySQL armazenará uma string vazia (`''`) como valor padrão.

Isso impede que o campo fique nulo.

---

# Renomeando uma coluna

Também posso alterar o nome de uma coluna.

```sql
ALTER TABLE pessoas
CHANGE COLUMN profissao prof VARCHAR(30) NOT NULL DEFAULT '';
```

- **Explicação**

Ao utilizar `CHANGE COLUMN`, é obrigatório informar novamente:

* o novo nome;
* o tipo de dado;
* as restrições (*constraints*).

**Antes**

```text
profissao
```

**Depois**

```text
prof
```

---

**Verificando a alteração**

```sql
DESCRIBE pessoas;
```

Assim é possível conferir se o novo nome foi aplicado corretamente.

---

# Renomeando uma tabela

Também é possível alterar o nome da tabela.

```sql
ALTER TABLE pessoas
RENAME TO estudantes;
```

Agora a tabela deixa de se chamar **pessoas** e passa a se chamar **estudantes**.

---

**Conferindo**

```sql
DESCRIBE estudantes;
```

Se o comando funcionar, significa que a tabela foi renomeada corretamente.

---

# Criando uma nova tabela — cursos

Foi criada uma nova tabela chamada **cursos**.

```sql
CREATE TABLE IF NOT EXISTS cursos (
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT,
    carga INT UNSIGNED,
    totalaulas INT,
    ano YEAR DEFAULT 2026
) DEFAULT CHARSET=utf8;
```

---

**Explicando cada campo**

- IF NOT EXISTS

Evita erro caso a tabela já exista.

O MySQL simplesmente ignora a criação.

---

- nome

```sql
VARCHAR(50)
```

Nome do curso.

---

- UNIQUE

Impede nomes repetidos.

- **Exemplo:**

```
Informática
Informática
```

O segundo cadastro será recusado.

---

- descricao

```sql
TEXT
```

Utilizado para textos longos.

É ideal para descrições completas.

---

- carga

```sql
INT UNSIGNED
```

Armazena apenas números positivos.

Como carga horária nunca será negativa, `UNSIGNED` é uma escolha adequada.

---

- totalaulas

Quantidade de aulas do curso.

---

- ano

```sql
YEAR
```

Armazena apenas o ano.

Caso nenhum valor seja informado, será utilizado:

```
2026
```

---

## Adicionando um ID

Depois foi adicionada uma coluna identificadora.

```sql
ALTER TABLE cursos
ADD COLUMN idcurso INT FIRST;
```

Ela será criada na primeira posição da tabela.

---

## Criando a Chave Primária

O comando:

```sql
ALTER TABLE cursos
ADD PRIMARY KEY (idcurso);
```

Agora `idcurso` passa a identificar cada curso de forma única.

---

## Transformando em AUTO_INCREMENT

Depois:

```sql
ALTER TABLE cursos
MODIFY COLUMN idcurso INT NOT NULL AUTO_INCREMENT;
```

Agora o próprio MySQL gera automaticamente o código de cada curso.

---

## Conferindo a estrutura

```sql
DESC cursos;
```

Esse comando exibirá toda a estrutura da tabela, incluindo:

* tipos de dados;
* chave primária;
* valores padrão;
* restrições.

---

# Tuplas

Durante os estudos pode aparecer o termo:

```
Tupla
```

**O que é uma tupla**

No contexto de Banco de Dados, **tupla** é simplesmente um **registro**, ou seja, uma linha da tabela.

- **Exemplo:**

| id | nome  |
| -- | ----- |
| 1  | Bruss |

Toda essa linha corresponde a uma tupla.

Hoje em dia é muito mais comum utilizar o termo **registro**, mas ambos possuem o mesmo significado.

---

# Resumo dos principais comandos ALTER TABLE

| Comando           | Função                                                       |
| ----------------- | ------------------------------------------------------------ |
| `ADD COLUMN`      | Adiciona uma nova coluna.                                    |
| `DROP COLUMN`     | Remove uma coluna.                                           |
| `MODIFY COLUMN`   | Altera o tipo de dado ou as restrições de uma coluna.        |
| `CHANGE COLUMN`   | Renomeia uma coluna e permite alterar seu tipo e restrições. |
| `RENAME TO`       | Renomeia a tabela.                                           |
| `FIRST`           | Coloca uma coluna como a primeira da tabela.                 |
| `AFTER coluna`    | Posiciona uma nova coluna após outra coluna específica.      |
| `ADD PRIMARY KEY` | Define uma Chave Primária para a tabela.                     |

---

# Passo a passo

**1.**

Selecionar o banco.

```sql
USE cadastro;
```

**2.**

Adicionar uma coluna.

```sql
ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(20);
```

**3.**

Conferir.

```sql
DESCRIBE pessoas;
```

**4.**

Remover a coluna.

```sql
ALTER TABLE pessoas
DROP COLUMN profissao;
```

**5.**

Criá-la novamente após `nome`.

```sql
ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(20) AFTER nome;
```

**6.**

Adicionar uma coluna no início.

```sql
ALTER TABLE pessoas
ADD COLUMN codigo INT FIRST;
```

**7.**

Remover essa coluna.

```sql
ALTER TABLE pessoas
DROP COLUMN codigo;
```

**8.**

Alterar o tipo da coluna.

```sql
ALTER TABLE pessoas
MODIFY COLUMN profissao VARCHAR(30) NOT NULL DEFAULT '';
```

**9.**

Renomear a coluna.

```sql
ALTER TABLE pessoas
CHANGE COLUMN profissao prof VARCHAR(30) NOT NULL DEFAULT '';
```

**10.**

Renomear a tabela.

```sql
ALTER TABLE pessoas
RENAME TO estudantes;
```

---

**Dicas importantes**

* Sempre utilize `DESCRIBE` ou `DESC` após alterar a estrutura de uma tabela para verificar se tudo foi aplicado corretamente.
* Evite remover colunas (`DROP COLUMN`) sem necessidade, pois todos os dados armazenados nelas serão perdidos.
* Utilize `DEFAULT` quando transformar um campo em `NOT NULL`, principalmente se já existirem registros na tabela.
* `CHANGE COLUMN` exige que o tipo de dado e as restrições sejam informados novamente.
* `ALTER TABLE` modifica apenas a **estrutura** da tabela; os registros permanecem, exceto quando uma coluna é removida.

---

# Em resumo

Nesta aula aprendi a utilizar o comando `ALTER TABLE` para modificar tabelas existentes. Adicionei, removi e reposicionei colunas, alterei tipos de dados e restrições, renomeei colunas e tabelas e compreendi como adicionar uma Chave Primária em uma tabela já criada. Também criei a tabela **cursos**, utilizando recursos como `UNIQUE`, `UNSIGNED`, `YEAR`, `AUTO_INCREMENT` e `IF NOT EXISTS`, entendendo como essas configurações tornam a estrutura do banco mais organizada e segura.

---

**Resumo Relâmpago**

1. `ALTER TABLE` modifica a estrutura de tabelas já existentes.
2. `ADD COLUMN` adiciona uma nova coluna.
3. `DROP COLUMN` remove uma coluna e seus dados.
4. `AFTER` posiciona uma coluna após outra, e `FIRST` a coloca no início da tabela.
5. `MODIFY COLUMN` altera o tipo de dado ou as restrições de uma coluna.
6. `CHANGE COLUMN` renomeia uma coluna e exige informar novamente seu tipo e restrições.
7. `RENAME TO` altera o nome da tabela.
8. `ADD PRIMARY KEY` define a chave primária de uma tabela.
9. `AUTO_INCREMENT` gera automaticamente identificadores únicos para novos registros.
10. O termo **tupla** é sinônimo de **registro**, representando uma linha da tabela.
