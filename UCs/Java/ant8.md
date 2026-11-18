# Cadastro de Produtos — Interface, Model e Integração com Fornecedores

Nesta aula, vamos iniciar a estrutura do cadastro de produtos do sistema **BL-PDV**.

O objetivo é criar a tela de produtos, preparar a classe responsável por armazenar seus dados e estabelecer a comunicação com o cadastro de fornecedores.

Também vamos aprender a preencher um `JComboBox` com os fornecedores cadastrados no banco de dados, permitindo selecionar um fornecedor e recuperar seu ID automaticamente.

---

# 1. Criando a tela de produtos (`frmProduto`)

Primeiro, vamos criar a interface gráfica que será utilizada para cadastrar produtos.

No Eclipse, dentro do package `view`, crie uma nova classe chamada:

```java
frmProduto
```

Essa classe será responsável pela tela de cadastro de produtos e utilizará `JDialog`, assim como a tela de fornecedores.

## 1.1. Adicionando o botão de cadastrar produto

Na pasta `img` do projeto, coloque um ícone de adicionar produto com tamanho de **64 × 64 pixels**.

No WindowBuilder:

1. Abra o arquivo `frmProduto` na opção Design.
2. Adicione um componente `JButton`.
3. Configure as propriedades:

| Propriedade | Valor |
|---|---|
| Variable | `btnAdicionarProduto` |
| Text | Vazio |
| Icon | Ícone de adicionar produto |
| ToolTipText | `Adicionar Produto` |
| Cursor | `HAND_CURSOR` |
| Convert field to local | Ativado |

Depois, clique duas vezes no botão para criar o evento `actionPerformed`.

Por enquanto, o evento ficará vazio. A lógica de cadastro será implementada posteriormente.

Exemplo:

```java
btnAdicionarProduto = new JButton("");
btnAdicionarProduto.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
        
    }
});

btnAdicionarProduto.setCursor(
    Cursor.getPredefinedCursor(Cursor.HAND_CURSOR)
);

btnAdicionarProduto.setToolTipText("Adicionar Produto");

btnAdicionarProduto.setIcon(
    new ImageIcon(frmProduto.class.getResource("/img/addproduto.jpg"))
);

btnAdicionarProduto.setBounds(21, 338, 75, 73);
getContentPane().add(btnAdicionarProduto);
```

**Observação:** o caminho `/img/addproduto.jpg` precisa corresponder exatamente ao nome e à extensão do arquivo colocado na pasta `img`.

## 1.2. Configurando o FlatLaf e a posição da janela

No método `main`, utilizamos:

```java
FlatDarkLaf.setup();
```

Essa instrução configura o tema escuro da biblioteca FlatLaf para os componentes Swing.

No construtor `frmProduto()`, depois de configurar o tamanho da janela, utilizamos:

```java
setLocationRelativeTo(null);
```

Essa instrução centraliza a janela na tela.

Atenção à sintaxe: o correto é `setLocationRelativeTo(null);`, sem parênteses adicionais no final.

## 1.3. Configurando os validadores dos campos

Vamos utilizar a classe `Validador`, criada anteriormente, para limitar a quantidade de caracteres e controlar quais tipos de dados podem ser digitados.

Adicione as seguintes instruções depois da criação e da adição dos respectivos campos:

```java
textDescricao.setDocument(new Validador(100));

textCategoria.setDocument(new Validador(100));

textPrecoCusto.setDocument(new Validador(10, "decimal"));

textPrecoVenda.setDocument(new Validador(10, "decimal"));

textQuantidade.setDocument(new Validador(10, "inteiro"));

textEstoqueMinino.setDocument(new Validador(10, "inteiro"));
```

Entenda o funcionamento:

| Campo | Validador | O que permite |
|---|---|---|
| Descrição | `new Validador(100)` | Até 100 caracteres de texto |
| Categoria | `new Validador(100)` | Até 100 caracteres de texto |
| Preço de custo | `new Validador(10, "decimal")` | Números com separador decimal |
| Preço de venda | `new Validador(10, "decimal")` | Números com separador decimal |
| Quantidade | `new Validador(10, "inteiro")` | Somente números inteiros |
| Estoque mínimo | `new Validador(10, "inteiro")` | Somente números inteiros |

**Atenção:** o validador decimal permite vírgula ou ponto como separador. Isso controla a digitação, mas não transforma automaticamente o conteúdo do campo em `double`. A conversão será necessária quando formos salvar os dados.

Outro detalhe: o validador de texto não impede que o usuário digite números. Ele apenas limita o tamanho do conteúdo.

## 1.4. Estrutura dos campos da tela

A tela terá os seguintes campos:

| Campo | Finalidade |
|---|---|
| ID | Identificador automático do produto |
| Produto | Descrição ou nome do produto |
| Categoria | Categoria à qual o produto pertence |
| Fornecedor | Seleção do fornecedor cadastrado |
| Custo | Preço de aquisição do produto |
| Venda | Preço de venda do produto |
| ID Fornecedor | Identificador do fornecedor selecionado |
| Quantidade | Quantidade atual em estoque |
| Estoque mínimo | Quantidade mínima desejada em estoque |

Os campos de ID do produto e ID do fornecedor são desabilitados porque seus valores serão preenchidos automaticamente pelo sistema.

O `JComboBox` será utilizado para selecionar um fornecedor existente, evitando que o usuário precise digitar manualmente seu identificador.

---

# 2. Criando a classe Model `Produto`

Agora vamos criar a classe responsável por representar os produtos dentro do sistema.

No package `model`, crie uma classe chamada:

```java
Produto
```

Essa classe armazenará os atributos de um produto e disponibilizará métodos getters e setters para acessar e modificar seus valores.

## 2.1. Código da classe Produto

```java
package model;

public class Produto {

    // ATRIBUTOS
    private int idProduto;
    private String codigoBarras;
    private String descricao;
    private String categoria;
    private double precoCusto;
    private double precoVenda;
    private int quantidade;
    private int estoqueMinimo;
    private int idFornecedor;

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getCodigoBarras() {
        return codigoBarras;
    }

    public void setCodigoBarras(String codigoBarras) {
        this.codigoBarras = codigoBarras;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getPrecoCusto() {
        return precoCusto;
    }

    public void setPrecoCusto(double precoCusto) {
        this.precoCusto = precoCusto;
    }

    public double getPrecoVenda() {
        return precoVenda;
    }

    public void setPrecoVenda(double precoVenda) {
        this.precoVenda = precoVenda;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getEstoqueMinimo() {
        return estoqueMinimo;
    }

    public void setEstoqueMinimo(int estoqueMinimo) {
        this.estoqueMinimo = estoqueMinimo;
    }

    public int getIdFornecedor() {
        return idFornecedor;
    }

    public void setIdFornecedor(int idFornecedor) {
        this.idFornecedor = idFornecedor;
    }
}
```

**Correção de nomenclatura:** no código original, o atributo estava escrito como `quatidade`. O correto é `quantidade`, assim como o método `getQuantidade()`.

## 2.2. Entendendo os atributos

| Atributo | Tipo | Significado |
|---|---|---|
| `idProduto` | `int` | Identificador do produto |
| `codigoBarras` | `String` | Código de barras do produto |
| `descricao` | `String` | Nome ou descrição do produto |
| `categoria` | `String` | Categoria do produto |
| `precoCusto` | `double` | Valor de aquisição |
| `precoVenda` | `double` | Valor de venda |
| `quantidade` | `int` | Quantidade disponível |
| `estoqueMinimo` | `int` | Limite mínimo de estoque |
| `idFornecedor` | `int` | Identificador do fornecedor relacionado |

**Por que o código de barras utiliza `String`?**

Mesmo que um código de barras seja formado por números, ele não representa uma quantidade que será calculada matematicamente.

Além disso, pode começar com zero. Se utilizássemos `int`, os zeros à esquerda seriam removidos.

Por isso, `String` é mais adequado.

## 2.3. Por que utilizamos getters e setters?

Os atributos são `private`, portanto não podem ser acessados diretamente de outras classes.

Os métodos getters permitem consultar os valores:

```java
produto.getDescricao();
```

Os métodos setters permitem modificar os valores:

```java
produto.setDescricao("Teclado Gamer");
```

Isso faz parte do princípio de **encapsulamento** da Programação Orientada a Objetos.

---

# 3. Criando a classe ProdutoController

Agora vamos criar a classe responsável por controlar as operações relacionadas aos produtos.

No package `controller`, crie uma classe chamada:

```java
ProdutoController
```

Código inicial:

```java
package controller;

import database.Database;

public class ProdutoController {

    Database database = new Database();

}
```

## 3.1. Entendendo o código

```java
import database.Database;
```

Importa a classe `Database`, responsável pela conexão com o banco de dados MySQL.

```java
Database database = new Database();
```

Cria um objeto da classe `Database`.

Com esse objeto, futuramente poderemos utilizar os métodos de conexão para executar operações na tabela de produtos.

**Observação:** por enquanto, essa classe ainda não possui métodos para cadastrar, consultar, editar ou excluir produtos. Estamos apenas preparando sua estrutura.

---

# 4. Conectando as classes à tela frmProduto

Agora precisamos fazer a tela de produtos ter acesso às classes que criamos.

No início da classe `frmProduto`, adicione os imports:

```java
import controller.FornecedorController;
import controller.ProdutoController;

import model.Fornecedor;
import model.Produto;
```

Depois, dentro da classe `frmProduto`, declare os objetos:

```java
FornecedorController controllerFornecedor = new FornecedorController();

ProdutoController controllerProduto = new ProdutoController();

Fornecedor fornecedor = new Fornecedor();

Produto produto = new Produto();
```

## 4.1. Qual é a função de cada objeto?

| Objeto | Classe | Responsabilidade |
|---|---|---|
| `controllerFornecedor` | `FornecedorController` | Consultar e controlar os fornecedores |
| `controllerProduto` | `ProdutoController` | Controlar as operações dos produtos |
| `fornecedor` | `Fornecedor` | Armazenar os dados de um fornecedor |
| `produto` | `Produto` | Armazenar os dados de um produto |

A separação entre Model e Controller ajuda a organizar o projeto.

- **Model:** representa os dados e as características dos objetos.
- **Controller:** executa as operações e faz a comunicação com outras partes do sistema.
- **View:** apresenta a interface gráfica e recebe as interações do usuário.

Esse tipo de organização facilita a manutenção e a evolução do sistema.

---

# 5. Preenchendo o JComboBox com os fornecedores

Agora vamos implementar uma funcionalidade importante: carregar automaticamente os fornecedores cadastrados no banco de dados dentro do `JComboBox`.

Assim, ao cadastrar um produto, poderemos selecionar qual fornecedor está relacionado a ele.

## 5.1. Importando ArrayList

No início de `frmProduto`, adicione:

```java
import java.util.ArrayList;
```

O `ArrayList` permite armazenar uma coleção de objetos em uma lista dinâmica.

Neste caso, ele será utilizado para receber todos os fornecedores retornados pelo Controller.

## 5.2. Criando o evento do JComboBox

No WindowBuilder:

1. Abra `frmProduto` na opção Design.
2. Clique com o botão direito no `cboFornecedor`.
3. Acesse `Add`.
4. Entre em `Action`.
5. Selecione `actionPerformed`.

Dentro do evento, adicione:

```java
String selecionado = (String) cboFornecedor.getSelectedItem();

if (selecionado != null && !selecionado.equals("Selecione")) {

    String id = selecionado.split(" - ")[0];

    textIDFornecedor.setText(id);

} else {

    textIDFornecedor.setText("");
}
```

## 5.3. Entendendo o evento

Primeiro, recuperamos o item selecionado:

```java
String selecionado = (String) cboFornecedor.getSelectedItem();
```

O método `getSelectedItem()` retorna o item atualmente selecionado no `JComboBox`.

Como o retorno é do tipo `Object`, utilizamos `(String)` para convertê-lo em texto.

Depois, verificamos se existe uma seleção válida:

```java
if (selecionado != null && !selecionado.equals("Selecione")) {
```

Aqui temos duas verificações:

- `selecionado != null`: verifica se existe algum item selecionado.
- `!selecionado.equals("Selecione")`: verifica se o item selecionado não é a opção padrão.

O operador `!` significa negação. Portanto, `!selecionado.equals("Selecione")` significa que o texto selecionado é diferente de `"Selecione"`.

Em seguida:

```java
String id = selecionado.split(" - ")[0];
```

O método `split()` divide um texto em partes utilizando um separador.

Imagine que o `JComboBox` tenha este item:

```text
3 - Fornecedor ABC
```

Ao utilizar:

```java
selecionado.split(" - ")
```

O texto será dividido em duas partes:

| Posição | Conteúdo |
|---|---|
| `[0]` | `3` |
| `[1]` | `Fornecedor ABC` |

Como queremos apenas o ID, utilizamos `[0]`.

Por último:

```java
textIDFornecedor.setText(id);
```

O ID do fornecedor selecionado é colocado automaticamente no campo `textIDFornecedor`.

Caso a seleção seja inválida, o campo será limpo:

```java
textIDFornecedor.setText("");
```

**Exemplo prático:**

<text>Imagine que o banco de dados tenha estes fornecedores:</text>

```text
1 - Distribuidora Central
2 - Informática Brasil
3 - Tech Solutions
```

Ao selecionar:

```text
2 - Informática Brasil
```

O campo `ID Fornecedor` será preenchido automaticamente com:

```text
2
```

Isso permite que o sistema associe o produto ao fornecedor correto utilizando o identificador dele.

## 5.4. Criando o método carregarFornecedor()

Agora precisamos criar um método que consulte os fornecedores no banco de dados e preencha o `JComboBox`.

Dentro da classe `frmProduto`, mas fora do construtor, adicione:

```java
private void carregarFornecedor() {

    // LIMPAR O COMBOBOX
    cboFornecedor.removeAllItems();

    // OPÇÃO PADRÃO
    cboFornecedor.addItem("Selecione");

    ArrayList<Fornecedor> lista = controllerFornecedor.listarFornecedores();

    for (Fornecedor fornecedor : lista) {

        cboFornecedor.addItem(
            fornecedor.getIdFornecedor() + " - " + fornecedor.getNome()
        );
    }
}
```

### Entendendo o método

**1. Remover os itens existentes**

```java
cboFornecedor.removeAllItems();
```

Remove todos os itens do `JComboBox`.

Isso evita duplicações caso o método seja chamado novamente.

**2. Adicionar uma opção padrão**

```java
cboFornecedor.addItem("Selecione");
```

Adiciona uma opção inicial para indicar que o usuário precisa selecionar um fornecedor.

**3. Buscar a lista de fornecedores**

```java
ArrayList<Fornecedor> lista = controllerFornecedor.listarFornecedores();
```

Aqui acontece a comunicação entre a View e o Controller.

O método `listarFornecedores()` consulta o banco de dados e retorna uma lista de objetos `Fornecedor`.

Essa lista é armazenada na variável `lista`.

**4. Percorrer os fornecedores**

```java
for (Fornecedor fornecedor : lista) {
```

Esse é um `for-each`, utilizado para percorrer todos os elementos de uma coleção.

A cada repetição, a variável `fornecedor` representa um dos objetos armazenados na lista.

**5. Adicionar os fornecedores ao JComboBox**

```java
cboFornecedor.addItem(
    fornecedor.getIdFornecedor() + " - " + fornecedor.getNome()
);
```

Recuperamos o ID e o nome de cada fornecedor e adicionamos essas informações ao `JComboBox`.

O resultado será semelhante a:

```text
Selecione
1 - Distribuidora Central
2 - Informática Brasil
3 - Tech Solutions
```

## 5.5. Chamando o método no construtor

Dentro do construtor `frmProduto()`, depois de criar os componentes da interface, adicione:

```java
carregarFornecedor();
```

Assim, quando a tela for aberta, o sistema executará o método e carregará automaticamente os fornecedores.

**Importante:** o método precisa ser chamado depois que o `cboFornecedor` e os demais componentes necessários estiverem inicializados.

---

# 6. Criando o método listarFornecedores() no FornecedorController

O método `carregarFornecedor()` depende de uma operação que ainda não existe no `FornecedorController`.

Por isso, agora vamos implementar o método `listarFornecedores()`.

Abra a classe `FornecedorController` e adicione os seguintes imports:

```java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
```

Alguns desses imports já podem existir na classe por causa dos métodos anteriores.

## 6.1. Código do método listarFornecedores()

Adicione dentro da classe `FornecedorController`:

```java
// ===============================
// LISTAR FORNECEDORES -> PRODUTOS
// ===============================
public ArrayList<Fornecedor> listarFornecedores() {

    ArrayList<Fornecedor> lista = new ArrayList<>();

    try {

        String sql = """
            select idFornecedor, nome
            from fornecedores
            order by nome
            """;

        Connection con = database.conectar();

        PreparedStatement stmt = con.prepareStatement(sql);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {

            Fornecedor fornecedor = new Fornecedor();

            fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
            fornecedor.setNome(rs.getString("nome"));

            lista.add(fornecedor);
        }

        rs.close();
        stmt.close();
        con.close();

    } catch (Exception e) {

        System.out.println(e);
    }

    return lista;
}
```

**Correção importante:** no código enviado na aula, a última linha estava como `return listarFornecedores();`. Isso provocaria uma chamada recursiva infinita, porque o método chamaria a si próprio repetidamente até ocorrer um erro de estouro de pilha (`StackOverflowError`).

O correto é:

```java
return lista;
```

Assim, o método devolve a lista que acabou de preencher.

## 6.2. Entendendo o método passo a passo

### Criando a lista

```java
ArrayList<Fornecedor> lista = new ArrayList<>();
```

Cria uma lista vazia que armazenará objetos da classe `Fornecedor`.

O tipo `Fornecedor` indica que essa lista armazenará somente objetos dessa classe.

### Preparando a consulta SQL

```sql
select idFornecedor, nome
from fornecedores
order by nome
```

Essa consulta busca duas informações da tabela `fornecedores`:

- `idFornecedor`: identificador do fornecedor.
- `nome`: nome do fornecedor.

O comando `ORDER BY nome` organiza os resultados em ordem alfabética crescente, por padrão.

Não precisamos consultar telefone, e-mail ou site porque a tela de produtos precisa apenas do ID e do nome para preencher o `JComboBox`.

### Abrindo a conexão

```java
Connection con = database.conectar();
```

Solicita uma conexão com o banco de dados por meio da classe `Database`.

### Preparando a instrução SQL

```java
PreparedStatement stmt = con.prepareStatement(sql);
```

Prepara a consulta SQL para ser executada.

**Observação:** no código original foi utilizado `prepareCall(sql)`. Para uma consulta SQL comum como essa, o mais adequado é `prepareStatement(sql)`. O método `prepareCall()` é destinado principalmente a chamadas de procedimentos armazenados (*stored procedures*).

### Executando a consulta

```java
ResultSet rs = stmt.executeQuery();
```

Executa o `SELECT` e recebe os registros encontrados em um objeto `ResultSet`.

O `ResultSet` permite percorrer os resultados retornados pelo banco.

### Percorrendo os registros

```java
while (rs.next()) {
```

O método `next()` avança para o próximo registro disponível.

O `while` continuará executando enquanto houver registros.

Diferentemente de um `if`, que executa seu bloco apenas uma vez, o `while` permite processar todos os fornecedores encontrados.

### Criando um objeto Fornecedor

```java
Fornecedor fornecedor = new Fornecedor();
```

Para cada registro encontrado, criamos um novo objeto `Fornecedor`.

Depois, preenchemos seus atributos:

```java
fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));

fornecedor.setNome(rs.getString("nome"));
```

- `getInt()` recupera um valor numérico inteiro.
- `getString()` recupera um valor textual.

### Adicionando o objeto à lista

```java
lista.add(fornecedor);
```

Adiciona o fornecedor atual à lista.

O processo se repete até que todos os registros sejam percorridos.

### Fechando as conexões

```java
rs.close();
stmt.close();
con.close();
```

Fecha os recursos utilizados na consulta:

1. `ResultSet`: resultado da consulta.
2. `PreparedStatement`: instrução SQL preparada.
3. `Connection`: conexão com o banco.

Por último:

```java
return lista;
```

Devolve a lista preenchida para quem chamou o método.

---

# 7. Entendendo a comunicação entre as classes

Agora temos uma sequência de comunicação entre três partes do sistema.

<escape>```text
frmProduto (View)
       |
       | chama carregarFornecedor()
       |
       v
FornecedorController (Controller)
       |
       | chama listarFornecedores()
       |
       v
Banco de Dados MySQL
       |
       | retorna os registros
       |
       v
FornecedorController
       |
       | devolve ArrayList<Fornecedor>
       |
       v
frmProduto (View)
       |
       | percorre a lista
       |
       v
cboFornecedor
       |
       | exibe ID + nome
       |
       v
Usuário seleciona um fornecedor
       |
       | evento actionPerformed
       |
       v
textIDFornecedor recebe o ID
```</escape>

O fluxo funciona assim:

1. A tela `frmProduto` é aberta.
2. O construtor chama `carregarFornecedor()`.
3. Esse método solicita a lista de fornecedores ao `FornecedorController`.
4. O Controller consulta o banco de dados.
5. Os registros são transformados em objetos `Fornecedor`.
6. Os objetos são armazenados em um `ArrayList`.
7. A lista retorna para a tela.
8. O `for-each` percorre a lista e adiciona os fornecedores ao `JComboBox`.
9. Quando o usuário seleciona um fornecedor, o evento recupera seu ID e preenche `textIDFornecedor`.

Esse processo permite reutilizar o cadastro de fornecedores sem precisar cadastrar novamente seus dados na tela de produtos.

---

# 8. Correções e cuidados importantes no código

Além da correção da recursão no método `listarFornecedores()`, existem alguns detalhes que precisam de atenção.

## 8.1. Texto da opção padrão do JComboBox

No método `carregarFornecedor()`, utilizamos:

```java
cboFornecedor.addItem("Selecione");
```

Portanto, no evento do `JComboBox`, a comparação também deve utilizar exatamente esse texto:

```java
!selecionado.equals("Selecione")
```

No código original, a comparação estava com `"Selecionado"`, o que é diferente de `"Selecione"`.

Se os textos não forem iguais, a condição poderá interpretar a opção padrão como se fosse um fornecedor válido.

## 8.2. Ordem de inicialização dos componentes

O `textIDFornecedor` precisa existir antes de o evento do `cboFornecedor` tentar utilizá-lo.

No código da aula, o método `carregarFornecedor()` é chamado no final do construtor, depois da criação dos campos. Isso evita que o carregamento inicial tente acessar um campo ainda não inicializado.

## 8.3. Tratamento de erros na conexão

O método `listarFornecedores()` captura exceções e imprime o erro no console:

```java
catch (Exception e) {
    System.out.println(e);
}
```

Isso ajuda a identificar problemas durante o desenvolvimento, mas não apresenta uma mensagem diretamente ao usuário.

Em uma evolução futura, podemos implementar um tratamento de erros mais completo e utilizar `try-with-resources` para garantir o fechamento dos recursos mesmo quando ocorre uma exceção.

## 8.4. O campo ID Fornecedor não deve ser digitado manualmente

O campo:

```java
textIDFornecedor.setEnabled(false);
```

Impede a edição direta pelo usuário.

Isso é adequado porque o ID deve corresponder ao fornecedor realmente selecionado no `JComboBox`.

---

# 9. Testando a funcionalidade

Agora vamos verificar se a integração entre a tela de produtos e o cadastro de fornecedores está funcionando.

### Passo 1 — Verificar os fornecedores

Abra o `Main.java` e execute o sistema.

Entre na opção **Fornecedores** e confira se os fornecedores cadastrados aparecem corretamente.

### Passo 2 — Abrir a tela de produtos

Volte à tela principal e clique em **Produtos**.

### Passo 3 — Verificar o JComboBox

Na tela de produtos, abra a lista de fornecedores.

Ela deverá apresentar a opção padrão e os fornecedores cadastrados no banco de dados.

Exemplo:

```text
Selecione
1 - Distribuidora Central
2 - Informática Brasil
3 - Tech Solutions
```

### Passo 4 — Testar a seleção

Selecione um fornecedor.

O campo `ID Fornecedor` deverá receber automaticamente o identificador correspondente.

Exemplo:

| Seleção | ID Fornecedor |
|---|---|
| `1 - Distribuidora Central` | `1` |
| `2 - Informática Brasil` | `2` |
| `3 - Tech Solutions` | `3` |

### Passo 5 — Testar a opção padrão

Selecione novamente a opção `Selecione`.

O campo `ID Fornecedor` deverá ficar vazio.

<text color="success" weight="semibold">Resultado esperado:</text> a tela de produtos consegue consultar os fornecedores cadastrados e preencher automaticamente o identificador do fornecedor escolhido.

---

# 10. Resumo Relâmpago — 10 linhas

1. A classe `frmProduto` representa a interface gráfica do cadastro de produtos.
2. O FlatLaf permite utilizar um tema escuro nos componentes Swing.
3. A classe `Validador` limita caracteres e controla os tipos de entrada.
4. A classe `Produto` representa os dados de cada produto.
5. Getters e setters permitem acessar e modificar atributos encapsulados.
6. A classe `ProdutoController` será responsável pelas operações dos produtos.
7. O `ArrayList<Fornecedor>` armazena uma lista dinâmica de fornecedores.
8. O método `listarFornecedores()` consulta o banco e devolve os registros encontrados.
9. O `JComboBox` apresenta os fornecedores e permite selecionar um deles.
10. O evento `actionPerformed` recupera o ID do fornecedor selecionado e preenche o campo correspondente.

---

**Próxima etapa:** implementar o cadastro de produtos no banco de dados, utilizando os dados da tela `frmProduto`, a classe `Produto` e o `ProdutoController`.
