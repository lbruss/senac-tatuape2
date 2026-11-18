# Projeto BL-PDV: CRUD de Fornecedores (Limpar, Buscar e Editar)

Nesta aula, continuamos o desenvolvimento do sistema **BL-PDV**, utilizando Java, Swing, MySQL e JDBC.

O objetivo é ampliar a tela de fornecedores, adicionando três funcionalidades:

- **Limpar:** apaga os dados preenchidos nos campos.
- **Buscar:** consulta um fornecedor cadastrado no banco de dados.
- **Editar:** atualiza as informações de um fornecedor existente.

Essas funcionalidades fazem parte do conceito de **CRUD**, utilizado para realizar operações básicas de manipulação de dados.

---

# Relembrando o CRUD

CRUD é uma sigla formada pelas quatro operações fundamentais utilizadas em sistemas que trabalham com bancos de dados.

| Operação | Significado | Função |
|---|---|---|
| Create | Criar | Cadastrar novos registros. |
| Read | Ler | Consultar registros existentes. |
| Update | Atualizar | Modificar registros cadastrados. |
| Delete | Excluir | Remover registros. |

No nosso projeto BL-PDV, estamos desenvolvendo essas operações para a tabela `fornecedores`.

Nesta aula, trabalharemos principalmente com:

- **Create:** já implementado anteriormente, por meio do botão Adicionar.
- **Read:** será implementado pelo botão Buscar.
- **Update:** será implementado pelo botão Editar.
- **Delete:** ainda será desenvolvido em uma próxima etapa.

## Criando o botão Limpar

A primeira funcionalidade será permitir que o usuário apague rapidamente todas as informações preenchidas na tela de fornecedores.

**Adicionando o botão no WindowBuilder**

No Eclipse, abra a classe `frmFornecedor.java` e acesse a aba **Design**.

Em seguida:

1. Procure na internet um ícone de limpeza com tamanho de 64 × 64 pixels.
2. Salve a imagem na pasta `img` do projeto.
3. Arraste um `JButton` para a tela.
4. Configure suas propriedades:

| Propriedade | Valor |
|---|---|
| Text | Vazio |
| Variable | `btnLimpar` |
| Icon | Imagem de limpeza |
| Cursor | `HAND_CURSOR` |
| ToolTipText | `Limpar campos` |

O cursor `HAND_CURSOR` altera o ponteiro do mouse para o formato de uma mão quando ele passa sobre o botão, indicando que o elemento pode ser clicado.

## Criando o evento do botão

Clique com o botão direito no botão Limpar e acesse:

**Add → Action → actionPerformed**

Dentro do evento, chamaremos um método responsável por limpar os campos:

```java
limparCampos();
```

Esse método será criado fora do construtor da classe:

```java
void limparCampos() {
    textID.setText(null);
    textNome.setText(null);
    textFone.setText(null);
    textEmail.setText(null);
    textSite.setText(null);

    btnAdicionar.setEnabled(true);
}
```

**Entendendo o método `limparCampos()`**

O método `limparCampos()` centraliza a operação de limpeza da tela.

- `textID.setText(null)`: apaga o conteúdo do campo de ID.
- `textNome.setText(null)`: apaga o nome.
- `textFone.setText(null)`: apaga o telefone.
- `textEmail.setText(null)`: apaga o e-mail.
- `textSite.setText(null)`: apaga o site.
- `btnAdicionar.setEnabled(true)`: habilita novamente o botão Adicionar.

**Por que habilitar o botão Adicionar?**

Quando buscamos um fornecedor, o botão Adicionar é desabilitado para evitar que o usuário confunda uma consulta com um novo cadastro.

Ao limpar os campos, queremos retornar a tela ao estado inicial. Por isso, habilitamos novamente o botão.

**Entendendo `setText(null)`**

O método `setText()` altera o conteúdo de um componente de texto.

```java
textNome.setText("Bruss Loza");
```

Coloca o texto `Bruss Loza` no campo.

```java
textNome.setText(null);
```

Apaga o conteúdo do campo.

**Entendendo `setEnabled()`**

O método `setEnabled()` habilita ou desabilita um componente.

```java
btnAdicionar.setEnabled(false);
```

Desabilita o botão.

```java
btnAdicionar.setEnabled(true);
```

Habilita o botão novamente.

## Integrando a limpeza ao cadastro

Depois que um fornecedor for cadastrado com sucesso, também chamaremos o método `limparCampos()`.

Assim, não será necessário clicar manualmente no botão Limpar após cada cadastro.

No evento do botão Adicionar:

```java
// MENSAGEM DE CONFIRMAÇÃO
JOptionPane.showMessageDialog(null, "Fornecedor adicionado com sucesso.");

// LIMPAR CAMPOS
limparCampos();
```

Dessa forma, após o cadastro, os campos serão apagados automaticamente.

---

## Criando a funcionalidade Buscar — CRUD READ

Agora vamos implementar a operação **Read**, responsável por consultar informações que já estão armazenadas no banco de dados.

O usuário poderá informar o nome de um fornecedor e clicar no botão Buscar. O sistema fará uma consulta no MySQL e preencherá os campos da tela com os dados encontrados.

## Adicionando o botão Buscar

Na aba Design de `frmFornecedor.java`:

1. Procure um ícone de lupa ou busca com tamanho de 24 × 24 pixels.
2. Coloque a imagem na pasta `img` do projeto.
3. Adicione um novo `JButton` à tela.
4. Configure as propriedades:

| Propriedade | Valor |
|---|---|
| Text | `Buscar` |
| Variable | `btnBuscar` |
| Icon | Ícone de busca |
| Cursor | `HAND_CURSOR` |
| Convert field to local | Ativado |

O botão será utilizado para iniciar a pesquisa do fornecedor.

## Criando o evento do botão Buscar

Clique com o botão direito no botão e acesse:

**Add → Action → actionPerformed**

Dentro do evento, adicione:

```java
// VALIDAÇÃO
if(textNome.getText().isBlank()) {

    JOptionPane.showMessageDialog(null, "Informe o nome do fornecedor");
    textNome.requestFocus();

} else {

    String nome = textNome.getText();

    Fornecedor fornecedor = controller.buscar(nome);

    // SE EXISTIR UM FORNECEDOR CADASTRADO
    if(fornecedor != null) {

        textID.setText(String.valueOf(fornecedor.getIdFornecedor()));
        textNome.setText(fornecedor.getNome());
        textFone.setText(fornecedor.getFone());
        textEmail.setText(fornecedor.getEmail());
        textSite.setText(fornecedor.getSite());

        // DESABILITAR O BOTÃO ADICIONAR
        btnAdicionar.setEnabled(false);

    } else {

        JOptionPane.showMessageDialog(null, "Fornecedor não cadastrado");
        limparCampos();

    }
}
```

**Entendendo a validação**

Antes de realizar a pesquisa, precisamos verificar se o usuário informou algum nome.

```java
if(textNome.getText().isBlank())
```

- `getText()`: obtém o conteúdo digitado no campo.
- `isBlank()`: verifica se o texto está vazio ou contém somente espaços em branco.
- `if`: executa o bloco de código caso a condição seja verdadeira.

Se o campo estiver vazio, será apresentada uma mensagem:

```java
JOptionPane.showMessageDialog(null, "Informe o nome do fornecedor");
```

Depois:

```java
textNome.requestFocus();
```

O método `requestFocus()` coloca o foco no campo Nome, permitindo que o usuário digite sem precisar clicar novamente nele.

##  Obtendo o nome para a pesquisa

```java
String nome = textNome.getText();
```

Criamos uma variável `nome` para armazenar o texto digitado pelo usuário.

Em seguida:

```java
Fornecedor fornecedor = controller.buscar(nome);
```

Chamamos o método `buscar()` da classe `FornecedorController`, enviando o nome como parâmetro.

O método fará a consulta no banco de dados e retornará um objeto `Fornecedor`, caso encontre um resultado.

## Verificando se o fornecedor existe

```java
if(fornecedor != null)
```

Essa condição verifica se o método retornou um objeto válido.

- Se `fornecedor` for diferente de `null`, significa que um fornecedor foi encontrado.
- Se `fornecedor` for igual a `null`, significa que a consulta não retornou um fornecedor.

Quando o fornecedor é encontrado, seus dados são colocados nos campos da tela.

## Preenchendo os campos automaticamente

```java
textID.setText(String.valueOf(fornecedor.getIdFornecedor()));
textNome.setText(fornecedor.getNome());
textFone.setText(fornecedor.getFone());
textEmail.setText(fornecedor.getEmail());
textSite.setText(fornecedor.getSite());
```

Cada linha obtém uma informação do objeto `Fornecedor` e a apresenta no campo correspondente.

Observe que o ID utiliza:

```java
String.valueOf(fornecedor.getIdFornecedor())
```

Isso acontece porque `getIdFornecedor()` retorna um número inteiro, enquanto `JTextField.setText()` recebe uma `String`.

O método `String.valueOf()` converte o valor numérico para texto.

**Desabilitando o botão Adicionar**

```java
btnAdicionar.setEnabled(false);
```

Quando encontramos um fornecedor, desabilitamos o botão Adicionar.

Isso ajuda a evitar que o usuário cadastre novamente um fornecedor enquanto está consultando ou preparando a edição de um registro existente.

## Configurando a tecla Enter para buscar

Adicione esta linha no construtor:

```java
getRootPane().setDefaultButton(btnBuscar);
```

Ela define o botão Buscar como o botão padrão da janela.

Assim, quando o usuário pressionar **Enter**, o evento do botão Buscar será executado, sem precisar clicar nele com o mouse.

---

## Implementando o método `buscar()` no FornecedorController

Agora precisamos criar o método que realmente fará a consulta no banco de dados.

Abra:

`src → controller → FornecedorController.java`

Adicione o seguinte import:

```java
import java.sql.ResultSet;
```

O `ResultSet` é utilizado para armazenar e percorrer os resultados retornados por uma consulta SQL.

### Código do método Buscar

```java
public Fornecedor buscar(String nome) {
    try {

        String sql = """
            select idFornecedor, nome, fone, email, site
            from fornecedores
            where nome like ?
        """;

        Fornecedor fornecedor = null;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, "%" + nome + "%");

        ResultSet rs = stmt.executeQuery();

        // SE EXISTIR UM FORNECEDOR COM O NOME PESQUISADO
        if(rs.next()) {

            fornecedor = new Fornecedor();

            fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
            fornecedor.setNome(rs.getString("Nome"));
            fornecedor.setFone(rs.getString("Fone"));
            fornecedor.setEmail(rs.getString("Email"));
            fornecedor.setSite(rs.getString("Site"));

        }

        // FECHAR AS CONEXÕES
        rs.close();
        stmt.close();
        con.close();

        return fornecedor;

    } catch (Exception e) {

        System.out.println(e);
        return null;

    }
}
```

**Entendendo a consulta SQL**

```sql
select idFornecedor, nome, fone, email, site
from fornecedores
where nome like ?
```

Vamos entender cada parte:

**SELECT**

Define quais colunas queremos consultar.

```sql
select idFornecedor, nome, fone, email, site
```

Estamos solicitando o ID, nome, telefone, e-mail e site do fornecedor.

**FROM**

Define a tabela de onde os dados serão obtidos.

```sql
from fornecedores
```

A consulta será realizada na tabela `fornecedores`.

**WHERE**

Define uma condição para filtrar os resultados.

```sql
where nome like ?
```

A pesquisa será feita considerando a coluna `nome`.

O símbolo `?` representa um parâmetro que será preenchido pelo Java.

**Entendendo o operador LIKE**

O operador `LIKE` permite realizar pesquisas utilizando padrões de texto.

No nosso código:

```java
stmt.setString(1, "%" + nome + "%");
```

Estamos preenchendo o primeiro parâmetro da consulta com o nome informado pelo usuário, colocando o caractere `%` antes e depois.

O `%` é um caractere curinga do SQL. Ele representa qualquer sequência de caracteres.

Por exemplo, suponha que exista este fornecedor:

`Fornecedor: Mercado Central`

Se pesquisarmos:

`Central`

A consulta será equivalente a:

```sql
where nome like '%Central%'
```

Isso permite encontrar o fornecedor mesmo que o usuário não digite o nome completo.

Outros exemplos:

| Pesquisa | Padrão | Resultado esperado |
|---|---|---|
| `Mercado` | `%Mercado%` | Nomes que contenham Mercado. |
| `Central` | `%Central%` | Nomes que contenham Central. |
| `Mercado Central` | `%Mercado Central%` | Nomes que contenham essa expressão. |

**Observação importante:** dependendo da configuração de comparação do MySQL, a pesquisa pode não diferenciar letras maiúsculas e minúsculas.

**Entendendo o PreparedStatement**

```java
PreparedStatement stmt = con.prepareStatement(sql);
```

O `PreparedStatement` prepara uma instrução SQL que possui parâmetros.

Depois, utilizamos:

```java
stmt.setString(1, "%" + nome + "%");
```

O número `1` indica que estamos preenchendo o primeiro `?` da consulta.

Esse recurso evita que seja necessário montar a consulta SQL concatenando diretamente o texto digitado pelo usuário.

Além disso, o uso de parâmetros ajuda a prevenir ataques de SQL Injection.

**Executando a consulta**

```java
ResultSet rs = stmt.executeQuery();
```

O método `executeQuery()` executa uma consulta SQL que retorna resultados, como um `SELECT`.

O resultado é armazenado em um objeto `ResultSet`.

**Diferença importante:**

| Método | Utilização |
|---|---|
| `executeQuery()` | Consultas que retornam resultados, como SELECT. |
| `executeUpdate()` | Operações como INSERT, UPDATE e DELETE. |

## 4.6. Percorrendo o resultado com `rs.next()`

```java
if(rs.next()) {
```

O método `next()` movimenta o cursor do `ResultSet` para a próxima linha do resultado.

- Se existir uma linha disponível, retorna `true`.
- Se não existir, retorna `false`.

Como estamos verificando se há pelo menos um fornecedor encontrado, utilizamos `if`.

## Criando o objeto Fornecedor

```java
fornecedor = new Fornecedor();
```

Quando encontramos um registro, criamos um novo objeto da classe `Fornecedor`.

Depois, transferimos os dados retornados pelo banco para esse objeto:

```java
fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
fornecedor.setNome(rs.getString("Nome"));
fornecedor.setFone(rs.getString("Fone"));
fornecedor.setEmail(rs.getString("Email"));
fornecedor.setSite(rs.getString("Site"));
```

- `rs.getInt()`: obtém um valor inteiro.
- `rs.getString()`: obtém um valor textual.
- `setIdFornecedor()`, `setNome()` etc.: armazenam os valores nos atributos do objeto.

## Fechando as conexões

```java
rs.close();
stmt.close();
con.close();
```

Após utilizar os recursos do banco, precisamos fechá-los.

- `rs.close()`: fecha o conjunto de resultados.
- `stmt.close()`: fecha o comando SQL.
- `con.close()`: encerra a conexão com o banco de dados.

Isso evita manter recursos ocupados desnecessariamente.

**Retornando o fornecedor**

```java
return fornecedor;
```

O método retorna o objeto preenchido quando encontra um fornecedor.

Caso nenhum registro seja encontrado, a variável continuará com o valor `null`.

No bloco `catch`:

```java
catch (Exception e) {
    System.out.println(e);
    return null;
}
```

Se ocorrer uma exceção durante a consulta, o erro será apresentado no console e o método retornará `null`.

**Observação importante:** nesse exemplo, `null` pode representar tanto uma pesquisa sem resultados quanto uma falha na consulta. Em uma implementação mais robusta, é interessante tratar essas situações separadamente.

---

## Criando a funcionalidade Editar — CRUD UPDATE

Agora vamos implementar a operação **Update**, utilizada para modificar informações de registros que já existem no banco de dados.

No nosso sistema, o usuário primeiro buscará um fornecedor. Depois, poderá alterar seus dados e clicar no botão Editar para salvar as modificações.

## Adicionando o botão Editar

Na aba Design de `frmFornecedor.java`:

1. Procure um ícone de atualização, geralmente chamado de Update.
2. Utilize uma imagem de 64 × 64 pixels.
3. Coloque a imagem na pasta `img` do Eclipse.
4. Adicione um novo `JButton` na tela.
5. Configure as propriedades:

| Propriedade | Valor |
|---|---|
| Text | Vazio |
| Variable | `btnEditar` |
| Icon | Ícone de atualização |
| Cursor | `HAND_CURSOR` |
| ToolTipText | `Editar` |
| Convert field to local | Ativado |

Depois, clique com o botão direito no botão e acesse:

**Add → Action → actionPerformed**

## Criando a validação dos campos

Dentro do evento, adicione:

```java
if(textNome.getText().isBlank()) {

    JOptionPane.showMessageDialog(null, "Preencha o nome do fornecedor");
    textNome.requestFocus();

} else if(textFone.getText().isBlank()) {

    JOptionPane.showMessageDialog(null, "Preencha o telefone do fornecedor");
    textFone.requestFocus();

} else if(textEmail.getText().isBlank()) {

    JOptionPane.showMessageDialog(null, "Preencha o email do fornecedor");
    textEmail.requestFocus();

} else if(textSite.getText().isBlank()) {

    JOptionPane.showMessageDialog(null, "Preencha o site do fornecedor");
    textSite.requestFocus();

} else {

    fornecedor.setIdFornecedor(Integer.parseInt(textID.getText()));
    fornecedor.setNome(textNome.getText());
    fornecedor.setFone(textFone.getText());
    fornecedor.setEmail(textEmail.getText());
    fornecedor.setSite(textSite.getText());

    // ENVIAR OS DADOS PARA O CONTROLLER
    controller.editarFornecedor(fornecedor);

    // MENSAGEM PARA O USUÁRIO
    JOptionPane.showMessageDialog(null, "Dados do fornecedor alterado");

    // LIMPAR CAMPOS
    limparCampos();

}
```

**Entendendo as validações**

Antes de editar, verificamos se os campos obrigatórios estão preenchidos.

As condições são executadas em sequência:

1. Verifica se o nome está vazio.
2. Verifica se o telefone está vazio.
3. Verifica se o e-mail está vazio.
4. Verifica se o site está vazio.

Se algum campo estiver vazio, o sistema apresenta uma mensagem e direciona o foco para o campo correspondente.

**Observação importante:** nessa implementação, e-mail e site também são tratados como obrigatórios, pois existe uma validação para impedir que esses campos fiquem vazios.

## Obtendo o ID do fornecedor

```java
fornecedor.setIdFornecedor(Integer.parseInt(textID.getText()));
```

Essa linha merece atenção.

O ID identifica exclusivamente o registro que será atualizado no banco de dados.

O campo `textID` é um `JTextField`, portanto seu conteúdo é uma `String`.

Porém, o atributo `idFornecedor` da classe `Fornecedor` é um número inteiro.

Por isso, utilizamos:

```java
Integer.parseInt(textID.getText())
```

Esse método converte o texto em um número do tipo `int`.

**Exemplo:**

```java
String id = "15";

int numero = Integer.parseInt(id);
```

Agora, a variável `numero` possui o valor inteiro `15`.

## Transferindo os dados para o objeto

```java
fornecedor.setNome(textNome.getText());
fornecedor.setFone(textFone.getText());
fornecedor.setEmail(textEmail.getText());
fornecedor.setSite(textSite.getText());
```

Essas linhas transferem os valores que estão na tela para o objeto `Fornecedor`.

Assim, o objeto passa a conter os dados atualizados que serão enviados ao Controller.

## Chamando o Controller

```java
controller.editarFornecedor(fornecedor);
```

Aqui, enviamos o objeto para o método `editarFornecedor()` da classe `FornecedorController`.

O Controller será responsável por executar o comando SQL que atualizará o registro no banco de dados.

---

## Implementando o método `editarFornecedor()` no Controller

Abra:

`src → controller → FornecedorController.java`

Adicione o método:

```java
public void editarFornecedor(Fornecedor fornecedor) {

    try {

        String sql = """
            update fornecedores
            set nome = ?, fone = ?, email = ?, site = ?
            where idFornecedor = ?
        """;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        // OBTER OS DADOS DO FORNECEDOR (MODEL)
        stmt.setString(1, fornecedor.getNome());
        stmt.setString(2, fornecedor.getFone());
        stmt.setString(3, fornecedor.getEmail());
        stmt.setString(4, fornecedor.getSite());
        stmt.setInt(5, fornecedor.getIdFornecedor());

        // EXECUTA A ATUALIZAÇÃO NO BANCO
        stmt.executeUpdate();

        // ENCERRA AS CONEXÕES
        stmt.close();
        con.close();

    } catch (Exception e) {

        System.out.println(e);

    }
}
```

**Entendendo o comando UPDATE**

O comando SQL utilizado é:

```sql
UPDATE fornecedores
SET nome = ?, fone = ?, email = ?, site = ?
WHERE idFornecedor = ?
```

O `UPDATE` é utilizado para modificar registros existentes em uma tabela.

**UPDATE**

Indica qual tabela será atualizada.

```sql
UPDATE fornecedores
```

Estamos trabalhando com a tabela `fornecedores`.

**SET**

Define quais colunas receberão novos valores.

```sql
SET nome = ?, fone = ?, email = ?, site = ?
```

Estamos atualizando o nome, telefone, e-mail e site.

**WHERE**

Define qual registro será alterado.

```sql
WHERE idFornecedor = ?
```

Essa condição identifica o fornecedor pelo seu ID.

**Por que o WHERE é tão importante?**

Imagine que a tabela tenha estes registros:

| ID | Nome | Telefone |
|---:|---|---|
| 1 | Mercado Central | 1111-1111 |
| 2 | Padaria do Bairro | 2222-2222 |
| 3 | Loja de Informática | 3333-3333 |

Se executarmos um `UPDATE` sem a condição `WHERE`, o banco poderá atualizar todos os registros da tabela.

Por isso, utilizamos o ID para indicar exatamente qual fornecedor deve ser modificado.

**Regra importante:** em operações de atualização e exclusão, sempre confira a condição `WHERE` para evitar alterar ou remover registros indevidamente.

**Preenchendo os parâmetros do SQL**

```java
stmt.setString(1, fornecedor.getNome());
stmt.setString(2, fornecedor.getFone());
stmt.setString(3, fornecedor.getEmail());
stmt.setString(4, fornecedor.getSite());
stmt.setInt(5, fornecedor.getIdFornecedor());
```

Cada comando `set` preenche um dos pontos de interrogação da consulta.

| Parâmetro | Método | Informação |
|---:|---|---|
| 1 | `setString()` | Nome |
| 2 | `setString()` | Telefone |
| 3 | `setString()` | E-mail |
| 4 | `setString()` | Site |
| 5 | `setInt()` | ID do fornecedor |

Observe que o último parâmetro é o ID, utilizado na condição `WHERE`.

**Executando a atualização**

```java
stmt.executeUpdate();
```

O método `executeUpdate()` executa o comando SQL de atualização.

Diferentemente do `executeQuery()`, ele não retorna um `ResultSet`.

Ele retorna um número inteiro que representa a quantidade de linhas afetadas pela operação.

Por exemplo:

- `1`: um registro foi atualizado.
- `0`: nenhum registro foi alterado.

**Fechando os recursos**

```java
stmt.close();
con.close();
```

Depois da atualização, fechamos o `PreparedStatement` e a conexão com o banco de dados.

**Aprofundamento — Boa prática:** em projetos maiores, é recomendado utilizar `try-with-resources` para fechar automaticamente conexões e comandos SQL, mesmo quando ocorre uma exceção.

---

### Código completo da classe FornecedorController

Após implementar os métodos Adicionar, Buscar e Editar, a classe `FornecedorController` ficará assim:

```java
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.Database;
import model.Fornecedor;

// SERÁ A CLASSE UTILIZADA PARA FAZER O CRUD
public class FornecedorController {

    // OBJETO DATABASE - ACESSO AO BANCO DE DADOS
    Database database = new Database();

    // MÉTODOS CRUD

    // ======================
    // ADICIONAR FORNECEDORES
    // CRUD CREATE
    // ======================
    public void Adicionar(Fornecedor fornecedor) {

        try {

            String sql = """
                insert into fornecedores (nome, fone, email, site)
                values (?,?,?,?)
            """;

            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            // 1, 2, 3, 4 = (?, ?, ?, ?)
            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getFone());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getSite());

            stmt.executeUpdate();

            // FECHAR A CONEXÃO COM O BANCO
            stmt.close();
            con.close();

        } catch (Exception e) {

            System.out.println(2);

        }
    }

    // ===============================
    // BUSCAR FORNECEDORES
    // CRUD READ
    // ===============================
    public Fornecedor buscar(String nome) {

        try {

            String sql = """
                select idFornecedor, nome, fone, email, site
                from fornecedores
                where nome like ?
            """;

            Fornecedor fornecedor = null;

            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, "%" + nome + "%");

            ResultSet rs = stmt.executeQuery();

            // SE EXISTIR UM FORNECEDOR COM O NOME PESQUISADO
            if(rs.next()) {

                fornecedor = new Fornecedor();

                fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
                fornecedor.setNome(rs.getString("Nome"));
                fornecedor.setFone(rs.getString("Fone"));
                fornecedor.setEmail(rs.getString("Email"));
                fornecedor.setSite(rs.getString("Site"));

            }

            // FECHAR AS CONEXÕES
            rs.close();
            stmt.close();
            con.close();

            return fornecedor;

        } catch (Exception e) {

            System.out.println(e);
            return null;

        }
    }

    // ====================================
    // CRUD UPDATE - EDITAR FORNECEDORES
    // ====================================
    public void editarFornecedor(Fornecedor fornecedor) {

        try {

            String sql = """
                update fornecedores
                set nome = ?, fone = ?, email = ?, site = ?
                where idFornecedor = ?
            """;

            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            // OBTER OS DADOS DO FORNECEDOR (MODEL)
            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getFone());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getSite());
            stmt.setInt(5, fornecedor.getIdFornecedor());

            // EXECUTA A ATUALIZAÇÃO NO BANCO
            stmt.executeUpdate();

            // ENCERRA AS CONEXÕES
            stmt.close();
            con.close();

        } catch (Exception e) {

            System.out.println(e);

        }
    }

}
```

---

**Entendendo o funcionamento completo do sistema**

Agora temos três operações funcionando na estrutura do projeto:

<escape>```text
                 USUÁRIO
                    |
                    v
             frmFornecedor
                    |
          +---------+---------+
          |         |         |
          v         v         v
       ADICIONAR  BUSCAR    EDITAR
          |         |         |
          +---------+---------+
                    |
                    v
          FornecedorController
                    |
                    v
                Database
                    |
                    v
               MySQL
                    |
                    v
              fornecedores
```</escape>

Cada classe possui uma responsabilidade:

| Classe | Responsabilidade |
|---|---|
| `frmFornecedor` | Apresentar a tela e receber as ações do usuário. |
| `Fornecedor` | Representar os dados de um fornecedor. |
| `FornecedorController` | Executar as operações de cadastro, consulta e edição. |
| `Database` | Estabelecer a conexão com o MySQL. |
| `Validador` | Controlar a entrada de dados nos campos de texto. |

Essa organização ajuda a separar a interface, os dados e as operações do banco de dados.

# 9. Testando as funcionalidades

Depois de terminar as alterações, execute a classe `frmFornecedor` ou abra o sistema pela classe `Main`.

## Teste 1 — Adicionar fornecedor

1. Abra a tela Fornecedores.
2. Preencha os campos Nome e Telefone.
3. Clique em Adicionar.
4. Verifique se a mensagem de confirmação aparece.
5. Confira se os campos foram limpos.

No MySQL Workbench, execute:

```sql
USE blpdv;

SELECT * FROM fornecedores;
```

Verifique se o fornecedor foi cadastrado.

**Teste 2 — Limpar campos**

1. Digite informações nos campos.
2. Clique no botão Limpar.
3. Verifique se todos os campos foram apagados.
4. Confira se o botão Adicionar voltou a ficar habilitado.

**Teste 3 — Buscar fornecedor**

1. Digite o nome de um fornecedor já cadastrado.
2. Clique em Buscar.
3. Verifique se os dados aparecem automaticamente nos campos.
4. Teste também pressionar Enter para realizar a busca.

Depois, pesquise um nome inexistente e verifique se aparece a mensagem:

`Fornecedor não cadastrado`

**Teste 4 — Editar fornecedor**

1. Pesquise um fornecedor existente.
2. Altere o nome, telefone, e-mail ou site.
3. Clique em Editar.
4. Verifique se aparece a mensagem de confirmação.
5. Confira se os campos foram limpos.

No Workbench, execute:

```sql
SELECT * FROM fornecedores;
```

Verifique se os dados foram atualizados e se o ID do registro permaneceu o mesmo.

---

# Guia Rápido de Memorização

| Código | Para que serve |
|---|---|
| `setText(null)` | Limpa o conteúdo de um campo. |
| `setEnabled(true)` | Habilita um componente. |
| `setEnabled(false)` | Desabilita um componente. |
| `requestFocus()` | Coloca o foco em um componente. |
| `isBlank()` | Verifica se o texto está vazio ou contém somente espaços. |
| `String.valueOf()` | Converte um valor para String. |
| `Integer.parseInt()` | Converte uma String para inteiro. |
| `LIKE` | Realiza pesquisas por padrões de texto no SQL. |
| `%` | Representa qualquer sequência de caracteres no LIKE. |
| `PreparedStatement` | Prepara comandos SQL com parâmetros. |
| `executeQuery()` | Executa consultas que retornam resultados. |
| `executeUpdate()` | Executa INSERT, UPDATE e DELETE. |
| `ResultSet` | Armazena os resultados de uma consulta. |
| `rs.next()` | Avança para a próxima linha do resultado. |
| `UPDATE` | Atualiza registros existentes. |
| `WHERE` | Define quais registros serão afetados. |

---

**Resumo Relâmpago**

1. O CRUD possui quatro operações: Create, Read, Update e Delete.
2. O botão Limpar utiliza `setText(null)` para apagar os campos.
3. O método `limparCampos()` centraliza a limpeza da tela.
4. O botão Buscar implementa a operação Read do CRUD.
5. O método `buscar()` utiliza SELECT e LIKE para consultar fornecedores.
6. O `PreparedStatement` permite trabalhar com parâmetros na consulta SQL.
7. O `ResultSet` armazena os resultados retornados pelo banco de dados.
8. O botão Editar implementa a operação Update do CRUD.
9. O comando SQL UPDATE modifica os dados de um registro identificado pelo WHERE.
10. O ID do fornecedor identifica qual registro deve ser atualizado no banco de dados.
