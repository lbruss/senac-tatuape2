# BL-PDV — Cadastro de Produtos e Busca pelo Código de Barras

Nesta etapa, o formulário `frmProduto` passa a permitir duas operações importantes:

1. **Cadastrar produtos:** validar os campos, converter os valores para os tipos corretos e salvar os dados no MySQL.
2. **Consultar produtos pelo código de barras:** digitar ou ler o código de barras e pressionar Enter para localizar um produto já cadastrado e preencher automaticamente os campos.

Com isso, começamos a implementar operações de **CRUD** na parte de produtos, utilizando Java Swing, JDBC e MySQL.

---

## Adicionando os componentes de código de barras no frmProduto

Primeiro, abra a classe `frmProduto` no Eclipse e entre na aba **Design** do WindowBuilder.

Adicione os seguintes componentes:

| Componente   | Variable      | Configuração                          |
| ------------ | ------------- | ------------------------------------- |
| `JTextField` | `textBarcode` | Campo para digitar o código de barras |
| `JLabel`     | `lblLupa`     | Ícone de busca                        |
| `JLabel`     | `lblBarcode`  | Ícone de leitor de código de barras   |

Para os ícones, procure imagens adequadas:

- Ícone de busca (lupa).
- Ícone de leitor de código de barras, com tamanho de 64 × 64 pixels.

Salve as imagens na pasta `img` do projeto.

Exemplo de organização:

```text
blpvd
└── src
    └── img
        ├── buscar.jpg
        ├── scanner.jpg
        ├── produtos.jpg
        ├── produtos2.jpg
        └── addproduto.jpg
```

**Observação:** os caminhos utilizados no código precisam corresponder exatamente aos nomes e à localização dos arquivos.

---

## Implementando a validação e o cadastro de produtos

Agora, dê dois cliques no botão de adicionar produto (`btnAdicionarProduto`) e implemente as validações dentro do evento `actionPerformed`.

## Validando os campos obrigatórios

Antes de cadastrar um produto, precisamos verificar se os campos necessários foram preenchidos.

```java
// VALIDAÇÕES DOS CAMPOS OBRIGATÓRIOS
if(textBarcode.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha o código de barras");
    textBarcode.requestFocus();

}else if(textDescricao.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha o nome do produto");
    textDescricao.requestFocus();

}else if(textCategoria.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha a categoria");
    textCategoria.requestFocus();

}else if(textPrecoCusto.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha o preço de custo");
    textPrecoCusto.requestFocus();

}else if(textPrecoVenda.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha a venda");
    textPrecoVenda.requestFocus();

}else if(textQuantidade.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha a quantidade");
    textQuantidade.requestFocus();

}else if(textEstoqueMinimo.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha o estoque mínimo");
    textEstoqueMinimo.requestFocus();

}else if(textIDFornecedor.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha o fornecedor");
    cboFornecedor.requestFocus();
}
```

**Como funciona?**

A estrutura `if / else if` verifica as condições em sequência.

- Se o código de barras estiver vazio, apresenta uma mensagem e posiciona o cursor nesse campo.
- Caso contrário, verifica a descrição.
- Depois verifica a categoria e os valores.
- Continua até encontrar algum campo obrigatório vazio.

O método `isBlank()` verifica se uma String está vazia ou contém apenas espaços em branco.

Já o método `requestFocus()` direciona o foco do teclado para o componente indicado.

**Por que utilizar `else if`?**

Porque queremos identificar o primeiro campo inválido e interromper as verificações seguintes. Assim, o usuário corrige um problema de cada vez.

## Transferindo os dados para o objeto Produto

Se todas as validações forem aprovadas, os valores digitados serão transferidos para os atributos do objeto `produto`.

```java
produto.setCodigoBarras(textBarcode.getText());
produto.setDescricao(textDescricao.getText());
produto.setCategoria(textCategoria.getText());

// CONVERTER VÍRGULA PARA PONTO
produto.setPrecoCusto(
    Double.parseDouble(textPrecoCusto.getText().replace(",", "."))
);

produto.setPrecoVenda(
    Double.parseDouble(textPrecoVenda.getText().replace(",", "."))
);

produto.setQuatidade(Integer.parseInt(textQuantidade.getText()));
produto.setEstoqueMinimo(Integer.parseInt(textEstoqueMinimo.getText()));
produto.setIdFornecedor(Integer.parseInt(textIDFornecedor.getText()));
```

**Entendendo as conversões**

Os componentes `JTextField` armazenam os valores como texto (`String`). Entretanto, os atributos numéricos da classe `Produto` precisam receber valores numéricos.

Por isso, precisamos converter os dados.

| Método                 | Conversão                             |
| ---------------------- | ------------------------------------- |
| `getText()`            | Obtém o conteúdo do campo como String |
| `Double.parseDouble()` | Converte String para double           |
| `Integer.parseInt()`   | Converte String para int              |
| `replace(",", ".")`    | Substitui vírgula por ponto           |

**Por que substituir a vírgula por ponto?**

No Brasil, normalmente utilizamos vírgula para representar casas decimais:

```text
15,90
```

Porém, o método `Double.parseDouble()` espera o ponto como separador decimal:

```text
15.90
```

Por isso, utilizamos:

```java
textPrecoCusto.getText().replace(",", ".")
```

O método `replace()` substitui todas as ocorrências da vírgula por ponto antes da conversão.

**Exemplo:**

```java
String valor = "15,90";

double preco = Double.parseDouble(valor.replace(",", "."));
```

Resultado:

```text
15.9
```

O valor continua representando quinze reais e noventa centavos. A diferença está apenas na forma como o número é armazenado e exibido.

**Chamando o método adicionar()**

Depois de transferir os dados para o objeto `produto`, chamamos o método `adicionar()` da classe `ProdutoController`.

```java
boolean sucesso = controllerProduto.adicionar(produto);

if(sucesso == true) {
    JOptionPane.showMessageDialog(null, "Produto adicionado com sucesso!");

    limparCampos();

}else {
    JOptionPane.showMessageDialog(
        null,
        "Não foi possível adicionar o produto.\nCódigo de barras duplicado"
    );

    textBarcode.setText(null);
    textBarcode.requestFocus();
}
```

**Entendendo o retorno boolean**

O método `adicionar()` retorna um valor do tipo `boolean`, ou seja, pode retornar apenas:

- `true`: operação realizada com sucesso.
- `false`: ocorreu algum erro durante a operação.

A variável `sucesso` recebe esse retorno.

Se o cadastro funcionar, exibimos uma mensagem de sucesso e limpamos os campos.

Caso contrário, apresentamos uma mensagem de erro e limpamos o código de barras para que o usuário possa informar outro.

**Observação importante:** o `false` não significa necessariamente que o código de barras está duplicado. Pode indicar outro problema, como falha de conexão, erro SQL ou violação de uma chave estrangeira. A mensagem da interface é simplificada neste exercício.

---

## Criando o método limparCampos()

Para evitar repetir comandos de limpeza em vários eventos, criamos um método específico.

```java
void limparCampos() {
    textBarcode.setText(null);
    textDescricao.setText(null);
    textCategoria.setText(null);
    textPrecoCusto.setText(null);
    textPrecoVenda.setText(null);
    textQuantidade.setText(null);
    textEstoqueMinimo.setText(null);
    textIDFornecedor.setText(null);

    cboFornecedor.setSelectedItem("Selecione");

    textBarcode.requestFocus();
    btnAdicionarProduto.setEnabled(true);
}
```

**Explicação**

| Comando                        | Finalidade                              |
| ------------------------------ | --------------------------------------- |
| `setText(null)`                | Limpa o conteúdo do campo               |
| `setSelectedItem("Selecione")` | Retorna o ComboBox para a opção padrão  |
| `requestFocus()`               | Posiciona o cursor no código de barras  |
| `setEnabled(true)`             | Habilita novamente o botão de adicionar |

O método também é importante porque, quando localizarmos um produto existente, o botão de adicionar será desabilitado. Ao limpar o formulário, ele precisa ser habilitado novamente.

**Boa prática:** centralizar operações repetidas em métodos facilita a manutenção do código e evita duplicações.

---

## Código SQL — Criando a tabela produtos

Agora, abra o MySQL Workbench e selecione o banco de dados `blpdv`.

Execute o seguinte comando:

```sql
CREATE TABLE produtos (
    idProduto INT AUTO_INCREMENT,
    codigoBarras VARCHAR(20) UNIQUE,
    descricao VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precoCusto DECIMAL(10, 2) NOT NULL,
    precoVenda DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    estoqueMinimo INT NOT NULL DEFAULT 0,
    idFornecedor INT NOT NULL,

    PRIMARY KEY (idProduto),

    CONSTRAINT fk_produtos_fornecedores
    FOREIGN KEY (idFornecedor)
    REFERENCES fornecedores(idFornecedor)

) DEFAULT CHARSET = utf8;
```

**Entendendo a estrutura da tabela**

| Campo           | Tipo          | Finalidade                  |
| --------------- | ------------- | --------------------------- |
| `idProduto`     | INT           | Identificador do produto    |
| `codigoBarras`  | VARCHAR(20)   | Código de barras do produto |
| `descricao`     | VARCHAR(100)  | Nome ou descrição           |
| `categoria`     | VARCHAR(50)   | Categoria do produto        |
| `precoCusto`    | DECIMAL(10,2) | Valor pago na aquisição     |
| `precoVenda`    | DECIMAL(10,2) | Valor de venda              |
| `quantidade`    | INT           | Quantidade disponível       |
| `estoqueMinimo` | INT           | Limite mínimo de estoque    |
| `idFornecedor`  | INT           | Identificador do fornecedor |

**Restrições importantes**

**PRIMARY KEY**

```sql
PRIMARY KEY (idProduto)
```

Define `idProduto` como chave primária. Cada produto terá um identificador único.

**AUTO_INCREMENT**

```sql
idProduto INT AUTO_INCREMENT
```

Faz o MySQL gerar automaticamente o próximo identificador quando um produto for inserido.

**UNIQUE**

```sql
codigoBarras VARCHAR(20) UNIQUE
```

Impede que dois produtos tenham o mesmo código de barras.

**NOT NULL**

Determina que o campo não pode receber `NULL`, ou seja, precisa possuir um valor.

**DEFAULT**

```sql
quantidade INT NOT NULL DEFAULT 0
```

Define zero como valor padrão quando a inserção não informa uma quantidade.

**FOREIGN KEY**

```sql
CONSTRAINT fk_produtos_fornecedores
FOREIGN KEY(idFornecedor)
REFERENCES fornecedores(idFornecedor)
```

Cria um relacionamento entre as tabelas `produtos` e `fornecedores`.

Isso significa que cada produto precisa estar associado a um fornecedor que já exista na tabela `fornecedores`.

**Entendendo o relacionamento**

A relação entre essas tabelas é de **um para muitos (1\:N)**:

- Um fornecedor pode fornecer vários produtos.
- Cada produto está associado a um fornecedor.

O campo `idFornecedor` da tabela `produtos` é uma chave estrangeira que referencia a chave primária da tabela `fornecedores`.

---

## Implementando o ProdutoController — CRUD Create

Agora, abra a classe `ProdutoController`.

Vamos implementar o método responsável por inserir os produtos no banco de dados.

**Imports necessários**

```java
import java.sql.Connection;
import java.sql.PreparedStatement;

import database.Database;
import model.Produto;
```

Essas classes permitem:

- `Connection`: estabelecer e representar uma conexão com o banco.
- `PreparedStatement`: preparar e executar comandos SQL com parâmetros.
- `Database`: utilizar a classe responsável pela conexão.
- `Produto`: acessar os dados do produto.

**Método adicionar()**

```java
// ADICIONAR PRODUTO - CRUD CREATE
public boolean adicionar(Produto produto) {
    try {
        String sql = """
            INSERT INTO produtos(
                codigoBarras,
                descricao,
                categoria,
                precoCusto,
                precoVenda,
                quantidade,
                estoqueMinimo,
                idFornecedor
            )
            VALUES(?,?,?,?,?,?,?,?)
        """;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        // VERIFICAR SE O CÓDIGO DE BARRAS ESTÁ VAZIO
        if(produto.getCodigoBarras().isBlank()) {
            stmt.setNull(1, java.sql.Types.VARCHAR);
        } else {
            stmt.setString(1, produto.getCodigoBarras());
        }

        stmt.setString(2, produto.getDescricao());
        stmt.setString(3, produto.getCategoria());
        stmt.setDouble(4, produto.getPrecoCusto());
        stmt.setDouble(5, produto.getPrecoVenda());
        stmt.setInt(6, produto.getQuatidade());
        stmt.setInt(7, produto.getEstoqueMinimo());
        stmt.setInt(8, produto.getIdFornecedor());

        stmt.executeUpdate();

        stmt.close();
        con.close();

        return true;

    } catch (Exception e) {
        System.out.println("Erro ao adicionar o produto: " + e);
        return false;
    }
}
```

**Entendendo o PreparedStatement**

Observe o comando SQL:

```sql
INSERT INTO produtos(
    codigoBarras,
    descricao,
    categoria,
    precoCusto,
    precoVenda,
    quantidade,
    estoqueMinimo,
    idFornecedor
)
VALUES(?,?,?,?,?,?,?,?)
```

Os pontos de interrogação (`?`) representam parâmetros que serão preenchidos posteriormente.

Isso permite separar o comando SQL dos valores recebidos pelo programa.

Depois, utilizamos os métodos `setString()`, `setDouble()` e `setInt()` para preencher cada parâmetro.

| Posição | Método        | Dado             |
| ------- | ------------- | ---------------- |
| 1       | `setString()` | Código de barras |
| 2       | `setString()` | Descrição        |
| 3       | `setString()` | Categoria        |
| 4       | `setDouble()` | Preço de custo   |
| 5       | `setDouble()` | Preço de venda   |
| 6       | `setInt()`    | Quantidade       |
| 7       | `setInt()`    | Estoque mínimo   |
| 8       | `setInt()`    | ID do fornecedor |

**Atenção:** a numeração dos parâmetros começa em 1, não em 0.

## Verificando o código de barras

```java
if(produto.getCodigoBarras().isBlank()) {
    stmt.setNull(1, java.sql.Types.VARCHAR);
}else {
    stmt.setString(1, produto.getCodigoBarras());
}
```

Esse trecho verifica se o código de barras está vazio.

- Se estiver vazio, o parâmetro recebe `NULL`.
- Se estiver preenchido, recebe o código informado.

O método `setNull()` permite enviar um valor nulo ao banco de dados.

**Observação importante:** no formulário desenvolvido nesta aula, o código de barras é obrigatório. Portanto, essa verificação funciona como uma proteção adicional no Controller. Além disso, o campo SQL permite `NULL` porque não possui `NOT NULL`.

**Executando a inserção**

```java
stmt.executeUpdate();
```

O método `executeUpdate()` executa comandos SQL que modificam os dados do banco, como:

- `INSERT`: inserir registros.
- `UPDATE`: atualizar registros.
- `DELETE`: excluir registros.

Nesse caso, ele insere um novo produto.

Se a operação terminar sem lançar uma exceção, o método retorna `true`.

Se ocorrer algum erro, o `catch` captura a exceção e retorna `false`.

---

**Testando o cadastro de produtos**

Com a tabela criada e o método `adicionar()` implementado:

1. Execute o `main` do projeto.
2. Acesse a tela de produtos.
3. Preencha o código de barras.
4. Informe a descrição e a categoria.
5. Preencha os preços de custo e venda.
6. Informe a quantidade e o estoque mínimo.
7. Selecione um fornecedor.
8. Clique no botão de adicionar.

Se tudo estiver funcionando, o sistema deverá apresentar:

```text
Produto adicionado com sucesso!
```

Depois, os campos serão limpos automaticamente.

Também é possível conferir os registros diretamente no MySQL Workbench:

```sql
SELECT * FROM produtos;
```

---

## Implementando a busca pelo código de barras

Agora vamos implementar uma funcionalidade de consulta.

A ideia é permitir que o usuário digite o código de barras no campo `textBarcode` e pressione Enter.

O sistema pesquisará o produto no banco de dados.

- Se encontrar, preencherá os campos automaticamente.
- Se não encontrar, perguntará se o usuário deseja cadastrar o produto.

Essa operação corresponde ao **CRUD Read (leitura/consulta)**.

## Criando o evento keyPressed

No Eclipse:

1. Abra `frmProduto` na aba Design.
2. Clique com o botão direito no campo `textBarcode`.
3. Acesse `Add`.
4. Selecione `Key`.
5. Escolha `keyPressed`.

O Eclipse criará um evento que será executado quando uma tecla for pressionada enquanto o campo estiver selecionado.

Adicione a importação:

```java
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
```

**Verificando se a tecla pressionada foi Enter**

```java
if(e.getKeyCode() == KeyEvent.VK_ENTER) {
    // Código da consulta
}
```

O método `getKeyCode()` identifica qual tecla foi pressionada.

A constante `KeyEvent.VK_ENTER` representa a tecla Enter.

Portanto, o bloco só será executado quando o usuário pressionar Enter.

**Capturando o código de barras**

```java
String barcode = textBarcode.getText();

Produto produto = controllerProduto.buscarCodigoBarras(barcode);
```

Primeiro, capturamos o conteúdo do campo `textBarcode`.

Depois, enviamos esse valor para o método `buscarCodigoBarras()` do Controller.

O resultado é armazenado em uma variável do tipo `Produto`.

Essa variável poderá conter:

- Um objeto `Produto`, se o registro for encontrado.
- `null`, se nenhum produto corresponder ao código informado.

**Preenchendo os campos automaticamente**

Se o produto existir:

```java
if(produto != null) {
    textIDProduto.setText(String.valueOf(produto.getIdProduto()));
    textDescricao.setText(produto.getDescricao());
    textCategoria.setText(produto.getCategoria());
    textPrecoCusto.setText(String.valueOf(produto.getPrecoCusto()));
    textPrecoVenda.setText(String.valueOf(produto.getPrecoVenda()));
    textQuantidade.setText(String.valueOf(produto.getQuatidade()));
    textEstoqueMinimo.setText(String.valueOf(produto.getEstoqueMinimo()));
    textIDFornecedor.setText(String.valueOf(produto.getIdFornecedor()));
}
```

O método `setText()` preenche os campos de texto.

Já `String.valueOf()` converte valores numéricos para String, pois o `JTextField` trabalha com texto.

Por exemplo:

```java
int id = 10;

textIDProduto.setText(String.valueOf(id));
```

O número `10` é convertido para `"10"` antes de ser colocado no campo.

## Selecionando automaticamente o fornecedor

Além de preencher os campos, precisamos localizar o fornecedor correspondente no `JComboBox`.

```java
for(int i = 0; i < cboFornecedor.getItemCount(); i++) {
    String item = cboFornecedor.getItemAt(i);

    if(item.startsWith(produto.getIdFornecedor() + " - ")) {
        cboFornecedor.setSelectedIndex(i);
    }
}
```

**Entendendo o funcionamento**

**`getItemCount()`**

Retorna a quantidade de itens existentes no ComboBox.

**`getItemAt(i)`**

Obtém o item localizado na posição indicada.

**`startsWith()`**

Verifica se uma String começa com determinado texto.

**`setSelectedIndex(i)`**

Seleciona o item que está na posição indicada.

Exemplo de itens do ComboBox:

```text
Selecione
1 - Fornecedor A
2 - Fornecedor B
3 - Fornecedor C
```

Se o produto estiver relacionado ao fornecedor de ID `2`, o código procura um item que comece com:

```text
2 -
```

Quando encontra, seleciona automaticamente:

```text
2 - Fornecedor B
```

**Desabilitando o botão de adicionar**

```java
btnAdicionarProduto.setEnabled(false);
```

Quando um produto já existe, o botão de adicionar é desabilitado.

Isso evita que o usuário tente cadastrar novamente o mesmo produto pela tela.

Para voltar a habilitá-lo, utilizamos o método `limparCampos()`:

```java
btnAdicionarProduto.setEnabled(true);
```

**Quando o produto não existe**

Se a consulta retornar `null`, significa que não foi encontrado nenhum produto com aquele código de barras.

Nesse caso:

```java
else {
    int resposta = JOptionPane.showConfirmDialog(
        null,
        "Produto não cadastrado.\nDeseja cadastrar este produto?",
        "Aviso!",
        JOptionPane.YES_NO_OPTION
    );

    if(resposta == JOptionPane.NO_OPTION) {
        limparCampos();
    }else {
        textDescricao.requestFocus();
    }
}
```

O método `showConfirmDialog()` apresenta uma janela de confirmação com as opções Sim e Não.

O resultado é armazenado na variável `resposta`.

- `JOptionPane.NO_OPTION`: o usuário escolheu Não.
- `JOptionPane.YES_OPTION`: o usuário escolheu Sim.

Se escolher Não, o formulário será limpo.

Se escolher Sim, o cursor será direcionado para o campo de descrição, permitindo continuar o cadastro.

---

## Implementando o método buscarCodigoBarras() no ProdutoController

Agora precisamos criar o método que realmente consulta o banco de dados.

Abra a classe `ProdutoController`.

**Adicionando o import**

```java
import java.sql.ResultSet;
```

O `ResultSet` representa o conjunto de resultados retornado por uma consulta SQL.

Ele permite percorrer e recuperar os registros encontrados.

## Criando o método de consulta

```java
public Produto buscarCodigoBarras(String codigoBarras) {
    try {
        String sql = """
            SELECT idProduto, descricao, categoria, precoCusto,
                   precoVenda, quantidade, estoqueMinimo, idFornecedor
            FROM produtos
            WHERE codigoBarras = ?
        """;

        Produto produto = null;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, codigoBarras);

        ResultSet rs = stmt.executeQuery();

        // SE EXISTIR UM PRODUTO CADASTRADO
        if(rs.next()) {
            produto = new Produto();

            produto.setIdProduto(rs.getInt("idProduto"));
            produto.setDescricao(rs.getString("descricao"));
            produto.setCategoria(rs.getString("categoria"));
            produto.setPrecoCusto(rs.getDouble("precoCusto"));
            produto.setPrecoVenda(rs.getDouble("precoVenda"));
            produto.setQuatidade(rs.getInt("quantidade"));
            produto.setEstoqueMinimo(rs.getInt("estoqueMinimo"));
            produto.setIdFornecedor(rs.getInt("idFornecedor"));
        }

        rs.close();
        stmt.close();
        con.close();

        return produto;

    } catch (Exception e) {
        System.out.println("Erro ao buscar o produto: " + e);
        return null;
    }
}
```

**Entendendo a consulta SQL**

```sql
SELECT idProduto, descricao, categoria, precoCusto,
       precoVenda, quantidade, estoqueMinimo, idFornecedor
FROM produtos
WHERE codigoBarras = ?
```

Esse comando solicita ao MySQL os dados de um produto específico.

A cláusula `WHERE` filtra os registros:

```sql
WHERE codigoBarras = ?
```

O ponto de interrogação será substituído pelo código de barras informado pelo usuário.

```java
stmt.setString(1, codigoBarras);
```

Assim, o banco procura um registro cujo código de barras seja igual ao valor recebido.

\**Por que não utilizamos SELECT ?*

Porque podemos selecionar somente as colunas necessárias para a operação. Isso deixa a consulta mais explícita e facilita a manutenção.

**Entendendo o ResultSet**

```java
ResultSet rs = stmt.executeQuery();
```

O método `executeQuery()` executa uma consulta SQL e retorna um `ResultSet`.

Em seguida:

```java
if(rs.next()) {
```

O método `next()` avança para o próximo registro do resultado.

- Se existir um registro, retorna `true`.
- Se não existir, retorna `false`.

Como o código de barras foi definido como `UNIQUE`, a consulta deverá encontrar no máximo um produto.

**Criando e preenchendo o objeto**

```java
produto = new Produto();
```

Se o registro existir, criamos um novo objeto da classe `Produto`.

Depois, recuperamos cada coluna do banco e transferimos seu valor para o atributo correspondente.

Exemplo:

```java
produto.setDescricao(rs.getString("descricao"));
```

Nesse caso:

1. `rs.getString("descricao")` recupera a descrição do banco.
2. `setDescricao()` armazena o valor no atributo do objeto.

O mesmo processo é utilizado para os demais campos.

**Retornando o resultado**

```java
return produto;
```

Ao final, o método retorna o objeto preenchido.

Se nenhum registro for encontrado, a variável continuará com o valor inicial:

```java
Produto produto = null;
```

Portanto, retornará `null`.

Essa é a informação que permite ao formulário identificar se o produto já está cadastrado.

---

## Fluxo completo da busca e do cadastro

Veja como as classes trabalham juntas:

```text
USUÁRIO
   |
   | Digita o código de barras e pressiona Enter
   v
frmProduto
   |
   | Chama buscarCodigoBarras(barcode)
   v
ProdutoController
   |
   | Executa SELECT no MySQL
   v
BANCO DE DADOS
   |
   | Retorna o resultado da consulta
   v
ProdutoController
   |
   | Cria e retorna um objeto Produto
   v
frmProduto
   |
   +---- Produto encontrado
   |        |
   |        v
   |    Preenche os campos automaticamente
   |    Seleciona o fornecedor
   |    Desabilita o botão Adicionar
   |
   +---- Produto não encontrado
            |
            v
        Pergunta se deseja cadastrar
            |
            +---- Sim: direciona para a descrição
            |
            +---- Não: limpa o formulário
```

Essa separação de responsabilidades é importante:

- **View (`frmProduto`):** apresenta a interface e recebe as ações do usuário.
- **Controller (`ProdutoController`):** executa as operações e consultas no banco.
- **Model (`Produto`):** representa os dados do produto.
- **Database:** estabelece a conexão com o MySQL.

---

### Código completo atualizado do ProdutoController

Depois das implementações, a classe `ProdutoController` ficará assim:

```java
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.Database;
import model.Produto;

public class ProdutoController {

    Database database = new Database();

    // ===============================
    // ADICIONAR PRODUTO - CRUD CREATE
    // ===============================
    public boolean adicionar(Produto produto) {
        try {
            String sql = """
                INSERT INTO produtos(
                    codigoBarras, descricao, categoria,
                    precoCusto, precoVenda, quantidade,
                    estoqueMinimo, idFornecedor
                )
                VALUES(?,?,?,?,?,?,?,?)
            """;

            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            // VERIFICAR SE O CÓDIGO DE BARRAS ESTÁ VAZIO
            if(produto.getCodigoBarras().isBlank()) {
                stmt.setNull(1, java.sql.Types.VARCHAR);
            } else {
                stmt.setString(1, produto.getCodigoBarras());
            }

            stmt.setString(2, produto.getDescricao());
            stmt.setString(3, produto.getCategoria());
            stmt.setDouble(4, produto.getPrecoCusto());
            stmt.setDouble(5, produto.getPrecoVenda());
            stmt.setInt(6, produto.getQuatidade());
            stmt.setInt(7, produto.getEstoqueMinimo());
            stmt.setInt(8, produto.getIdFornecedor());

            stmt.executeUpdate();

            stmt.close();
            con.close();

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao adicionar o produto: " + e);
            return false;
        }
    }

    // ==================================================
    // BUSCAR PRODUTO PELO CÓDIGO DE BARRAS - CRUD READ
    // ==================================================
    public Produto buscarCodigoBarras(String codigoBarras) {
        try {
            String sql = """
                SELECT idProduto, descricao, categoria, precoCusto,
                       precoVenda, quantidade, estoqueMinimo, idFornecedor
                FROM produtos
                WHERE codigoBarras = ?
            """;

            Produto produto = null;

            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, codigoBarras);

            ResultSet rs = stmt.executeQuery();

            // SE EXISTIR UM PRODUTO CADASTRADO
            if(rs.next()) {
                produto = new Produto();

                produto.setIdProduto(rs.getInt("idProduto"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setPrecoCusto(rs.getDouble("precoCusto"));
                produto.setPrecoVenda(rs.getDouble("precoVenda"));
                produto.setQuatidade(rs.getInt("quantidade"));
                produto.setEstoqueMinimo(rs.getInt("estoqueMinimo"));
                produto.setIdFornecedor(rs.getInt("idFornecedor"));
            }

            rs.close();
            stmt.close();
            con.close();

            return produto;

        } catch (Exception e) {
            System.out.println("Erro ao buscar o produto: " + e);
            return null;
        }
    }
}
```

---

**Testando a busca pelo código de barras**

Agora execute o `main` do projeto.

1. Abra a tela de produtos.
2. Digite o código de barras completo de um produto já cadastrado.
3. Pressione Enter.
4. Observe se os campos são preenchidos automaticamente.
5. Confira se o fornecedor correspondente também é selecionado.

Depois, faça outro teste com um código de barras que ainda não esteja cadastrado.

O sistema deverá perguntar se deseja cadastrar o produto.

## Problemas que podem aparecer

| Problema                          | Possível causa                                               |
| --------------------------------- | ------------------------------------------------------------ |
| Produto não encontrado            | Código de barras digitado incorretamente                     |
| Erro ao inserir                   | Código de barras duplicado                                   |
| Erro de chave estrangeira         | Fornecedor inexistente                                       |
| Campos não preenchidos            | Falha na consulta ou nos nomes das colunas                   |
| ComboBox não seleciona fornecedor | ID do fornecedor não corresponde aos itens carregados        |
| Erro de conexão                   | MySQL desligado ou configuração incorreta no `Database.java` |

---

**Observações técnicas e melhorias importantes**

**Corrigir a comparação do ComboBox**

No código da aula aparece:

```java
if(selecionado != null && !selecionado.equals("Selecionado")) {
```

Mas a opção padrão cadastrada no ComboBox é:

```java
cboFornecedor.addItem("Selecione");
```

Portanto, a comparação correta é:

```java
if(selecionado != null && !selecionado.equals("Selecione")) {
```

Caso contrário, o programa poderá tentar interpretar `"Selecione"` como se fosse um ID de fornecedor.

**Corrigir o nome do método no comentário**

No código da aula, o método de busca foi identificado como:

```java
// BUSCAR PRODUTO PELO CÓDIGO DE BARRAS - CRUD CREATE
```

O correto é:

```java
// BUSCAR PRODUTO PELO CÓDIGO DE BARRAS - CRUD READ
```

Isso porque:

- `CREATE`: criação de registros.
- `READ`: leitura e consulta de registros.
- `UPDATE`: atualização de registros.
- `DELETE`: exclusão de registros.

**Cuidado com o objeto Produto dentro do evento**

Na classe `frmProduto`, já existe um atributo:

```java
Produto produto = new Produto();
```

Entretanto, dentro do evento `keyPressed`, a aula declara novamente:

```java
Produto produto = controllerProduto.buscarCodigoBarras(barcode);
```

Essa segunda declaração cria uma variável local com o mesmo nome, que oculta temporariamente o atributo da classe dentro daquele bloco.

O Java permite isso, mas pode gerar confusão durante a manutenção.

Uma alternativa mais clara é utilizar outro nome:

```java
Produto produtoEncontrado = controllerProduto.buscarCodigoBarras(barcode);
```

E utilizar `produtoEncontrado` nas verificações e preenchimentos daquele evento.

**Melhorando o fechamento da conexão**

Na aula, os recursos são fechados manualmente:

```java
rs.close();
stmt.close();
con.close();
```

Isso funciona quando o fluxo chega normalmente até esses comandos. Porém, se ocorrer uma exceção antes, algum recurso poderá permanecer aberto.

**Aprofundamento — try-with-resources**

Em projetos Java, uma alternativa mais segura é utilizar `try-with-resources`, que fecha automaticamente os recursos:

```java
try (
    Connection con = database.conectar();
    PreparedStatement stmt = con.prepareStatement(sql)
) {
    // Operação com o banco de dados
}
```

Quando houver um `ResultSet`, ele também poderá ser incluído nos recursos gerenciados.

Essa melhoria pode ser aplicada posteriormente ao Controller.

**Atenção ao tratamento de erros##

O método `adicionar()` retorna `false` para qualquer exceção.

Isso significa que o formulário não consegue distinguir se houve:

- Código de barras duplicado.
- Falha de conexão.
- Violação de chave estrangeira.
- Erro de sintaxe SQL.
- Outro problema no banco.

A mensagem de código de barras duplicado é uma simplificação da aula. Em uma versão mais completa, podemos identificar especificamente a violação da restrição `UNIQUE` e apresentar mensagens diferentes para cada situação.

**Atenção ao campo preço**

O projeto utiliza `double` para representar os preços:

```java
produto.setPrecoCusto(Double.parseDouble(...));
```

Para aplicações comerciais e financeiras, a recomendação é utilizar `BigDecimal`, pois ele oferece maior precisão no tratamento de valores decimais.

O MySQL já utiliza `DECIMAL(10,2)`, que é apropriado para armazenar valores monetários. A conversão para `BigDecimal` pode ser uma melhoria futura na classe `Produto` e no Controller.

---

**O que foi implementado nesta aula?**

| Funcionalidade                | Classe ou local     | Operação               |
| ----------------------------- | ------------------- | ---------------------- |
| Validação dos campos          | `frmProduto`        | Verificação de dados   |
| Conversão de valores          | `frmProduto`        | String para números    |
| Limpeza do formulário         | `frmProduto`        | Reutilização de método |
| Cadastro de produtos          | `ProdutoController` | CRUD Create            |
| Criação da tabela             | MySQL Workbench     | Estrutura do banco     |
| Relacionamento com fornecedor | MySQL Workbench     | Chave estrangeira      |
| Evento da tecla Enter         | `frmProduto`        | Captura de teclado     |
| Busca por código de barras    | `ProdutoController` | CRUD Read              |
| Preenchimento automático      | `frmProduto`        | Exibição dos dados     |
| Seleção do fornecedor         | `JComboBox`         | Localização pelo ID    |

---

**Resumo Relâmpago**

1. O `textBarcode` recebe o código de barras do produto.
2. Os campos obrigatórios são verificados com `isBlank()`.
3. O método `requestFocus()` direciona o cursor para o campo que precisa ser preenchido.
4. Os valores são transferidos para o objeto `Produto` por meio dos setters.
5. `Double.parseDouble()` e `Integer.parseInt()` convertem textos em números.
6. O método `adicionar()` utiliza `PreparedStatement` para inserir os dados no MySQL.
7. A tabela `produtos` possui uma chave estrangeira que referencia `fornecedores`.
8. O evento `keyPressed` identifica quando a tecla Enter é pressionada.
9. O método `buscarCodigoBarras()` realiza uma consulta SQL e retorna um objeto `Produto` ou `null`.
10. Se o produto existir, os campos são preenchidos automaticamente; caso contrário, o sistema oferece a opção de cadastrá-lo.
