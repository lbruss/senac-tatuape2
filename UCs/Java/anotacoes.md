# BL-PDV — Cadastro de Produtos: Editar, Excluir e Buscar

Nesta etapa do projeto **BL-PDV**, vamos ampliar o formulário `frmProduto` e o controlador `ProdutoController`. Até aqui, já conseguimos cadastrar produtos e pesquisar pelo código de barras. Agora, vamos implementar as operações de edição, exclusão e busca pela descrição.

Essas operações completam as quatro ações básicas do CRUD:

| Operação | Significado | Método |
|---|---|---|
| Create | Cadastrar um produto | `adicionar()` |
| Read | Consultar um produto | `buscarCodigoBarras()` e `buscarProduto()` |
| Update | Editar um produto | `editar()` |
| Delete | Excluir um produto | `deletar()` |

---

## 1. Adicionando os botões Editar e Deletar

No Eclipse, abra o formulário `frmProduto` na aba **Design**.

Adicione dois componentes `JButton`:

| Propriedade | Botão Editar | Botão Deletar |
|---|---|---|
| Variable | `btnUpdate` | `btnDelete` |
| Text | Vazio | Vazio |
| Icon | Ícone de editar | Ícone de deletar |

Os ícones serão utilizados para identificar visualmente a função de cada botão.

No código da classe, o WindowBuilder cria as variáveis:

```java
private JButton btnUpdate;
private JButton btnDelete;
```

**Por que utilizar ícones?**

Os ícones ajudam o usuário a identificar rapidamente as ações disponíveis. Isso deixa a interface mais intuitiva e reduz a quantidade de texto nos botões.

---

## 2. Implementando a edição de produtos no formulário

A edição permite modificar as informações de um produto que já está cadastrado no banco de dados.

Para isso, precisamos recuperar o produto, alterar seus dados e enviar as novas informações ao banco.

No botão `btnUpdate`, adicione um evento `ActionListener`.

### 2.1. Validando os campos obrigatórios

Antes de atualizar o produto, precisamos verificar se os campos necessários foram preenchidos.

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

}else {
    // Atualização do produto
}
```

Cada condição verifica um campo. Caso esteja vazio, o sistema exibe uma mensagem e direciona o cursor para o campo que precisa ser preenchido.

O `else` final é executado somente quando todas as validações são aprovadas.

### 2.2. Transferindo os dados para o objeto Produto

Dentro do último `else`, precisamos atualizar os atributos do objeto `produto` com as informações digitadas no formulário.

```java
produto.setIdProduto(Integer.parseInt(textIDProduto.getText()));
produto.setCodigoBarras(textBarcode.getText());
produto.setDescricao(textDescricao.getText());
produto.setCategoria(textCategoria.getText());

// Converter vírgula para ponto antes de transformar em Double
produto.setPrecoCusto(Double.parseDouble(
    textPrecoCusto.getText().replace(",", ".")
));

produto.setPrecoVenda(Double.parseDouble(
    textPrecoVenda.getText().replace(",", ".")
));

produto.setQuatidade(Integer.parseInt(textQuantidade.getText()));
produto.setEstoqueMinimo(Integer.parseInt(textEstoqueMinimo.getText()));
produto.setIdFornecedor(Integer.parseInt(textIDFornecedor.getText()));
```

**Entendendo os principais comandos:**

- `setIdProduto()`: informa qual produto será atualizado. O ID é fundamental para localizar o registro correto no banco.
- `setCodigoBarras()`: atualiza o código de barras.
- `setDescricao()`: atualiza o nome ou descrição do produto.
- `setCategoria()`: atualiza a categoria.
- `setPrecoCusto()` e `setPrecoVenda()`: recebem os preços convertidos para `double`.
- `setQuatidade()`: atualiza a quantidade disponível.
- `setEstoqueMinimo()`: atualiza o limite mínimo de estoque.
- `setIdFornecedor()`: informa o fornecedor relacionado ao produto.

### 2.3. Chamando o método de edição

Depois de preencher o objeto, chamamos o método `editar()` do controlador:

```java
boolean sucesso = controllerProduto.editar(produto);

if(sucesso == true) {
    JOptionPane.showMessageDialog(null, "Produto editado com sucesso!");
    limparCampos();

}else {
    JOptionPane.showMessageDialog(null,
        "Não foi possível editar o produto.\nCódigo de barras duplicado");

    textBarcode.requestFocus();
}
```

O método retorna um valor booleano:

- `true`: a operação foi executada sem lançar uma exceção.
- `false`: ocorreu algum erro durante a operação.

Se a edição for bem-sucedida, o formulário será limpo. Caso contrário, o sistema exibirá uma mensagem de erro.

**Observação importante:** a mensagem de erro menciona código de barras duplicado, mas nem todo erro de edição será causado por isso. Também pode ocorrer uma falha de conexão ou outro problema no banco de dados. Em uma versão mais completa, seria melhor identificar e apresentar cada erro separadamente.

---

## 3. Implementando o método editar() no ProdutoController

Agora precisamos criar o método responsável por atualizar os dados diretamente no MySQL.

Abra `ProdutoController.java` e adicione o método:

```java
// ===============================
// EDITAR PRODUTO - CRUD UPDATE
// ===============================
public boolean editar(Produto produto) {
    try {
        String sql = """
            update produtos
            set codigoBarras = ?, descricao = ?, categoria = ?,
                precoCusto = ?, precoVenda = ?, quantidade = ?,
                estoqueMinimo = ?, idFornecedor = ?
            where idProduto = ?
            """;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        // Verificar se o código de barras está vazio
        if(produto.getCodigoBarras().isBlank()) {
            stmt.setNull(1, java.sql.Types.VARCHAR);
        }else {
            stmt.setString(1, produto.getCodigoBarras());
        }

        stmt.setString(2, produto.getDescricao());
        stmt.setString(3, produto.getCategoria());
        stmt.setDouble(4, produto.getPrecoCusto());
        stmt.setDouble(5, produto.getPrecoVenda());
        stmt.setInt(6, produto.getQuatidade());
        stmt.setInt(7, produto.getEstoqueMinimo());
        stmt.setInt(8, produto.getIdFornecedor());
        stmt.setInt(9, produto.getIdProduto());

        stmt.executeUpdate();

        stmt.close();
        con.close();

        return true;

    } catch (Exception e) {
        System.out.println("Erro ao editar o produto: " + e);
        return false;
    }
}
```

### 3.1. Entendendo o comando SQL UPDATE

O comando utilizado é:

```sql
UPDATE produtos
SET codigoBarras = ?,
    descricao = ?,
    categoria = ?,
    precoCusto = ?,
    precoVenda = ?,
    quantidade = ?,
    estoqueMinimo = ?,
    idFornecedor = ?
WHERE idProduto = ?;
```

O `UPDATE` modifica informações de um registro que já existe.

- `UPDATE produtos`: informa qual tabela será modificada.
- `SET`: define quais colunas receberão novos valores.
- `WHERE idProduto = ?`: identifica exatamente qual produto será atualizado.

**Atenção ao WHERE:** sem essa condição, o comando poderia atualizar todos os produtos da tabela, em vez de modificar apenas o produto selecionado.

### 3.2. Entendendo os parâmetros do PreparedStatement

Os pontos de interrogação são parâmetros que recebem valores por meio dos métodos `setString()`, `setDouble()` e `setInt()`.

| Parâmetro | Informação | Método |
|---|---|---|
| 1 | Código de barras | `setString()` ou `setNull()` |
| 2 | Descrição | `setString()` |
| 3 | Categoria | `setString()` |
| 4 | Preço de custo | `setDouble()` |
| 5 | Preço de venda | `setDouble()` |
| 6 | Quantidade | `setInt()` |
| 7 | Estoque mínimo | `setInt()` |
| 8 | ID do fornecedor | `setInt()` |
| 9 | ID do produto | `setInt()` |

O ID do produto ocupa o nono parâmetro porque é utilizado na condição `WHERE`.

### 3.3. Por que utilizar setNull()?

```java
stmt.setNull(1, java.sql.Types.VARCHAR);
```

Esse comando informa ao banco de dados que o valor da primeira coluna deve ser `NULL`.

Já:

```java
stmt.setString(1, produto.getCodigoBarras());
```

envia o código de barras normalmente.

Isso é importante porque a coluna `codigoBarras` foi criada permitindo valores nulos.

---

## 4. Implementando a exclusão de produtos

O método `deletar()` também pertence ao `ProdutoController`.

Ele recebe o ID do produto e utiliza esse identificador para excluir o registro correspondente.

```java
// ===============================
// DELETAR PRODUTO - CRUD DELETE
// ===============================
public boolean deletar(int idProduto) {
    try {
        String sql = """
            delete from produtos
            where idProduto = ?
            """;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setInt(1, idProduto);

        stmt.executeUpdate();

        stmt.close();
        con.close();

        return true;

    } catch (Exception e) {
        System.out.println("Erro ao deletar o produto: " + e);
        return false;
    }
}
```

### 4.1. Entendendo o comando SQL DELETE

```sql
DELETE FROM produtos
WHERE idProduto = ?;
```

- `DELETE FROM produtos`: indica que queremos excluir um registro da tabela `produtos`.
- `WHERE idProduto = ?`: identifica qual registro será excluído.

Assim como no `UPDATE`, a condição `WHERE` é essencial. Sem ela, todos os registros da tabela poderiam ser excluídos.

### 4.2. Parâmetro do método

```java
public boolean deletar(int idProduto)
```

O método recebe um número inteiro, que representa o identificador do produto.

Por exemplo:

```java
controllerProduto.deletar(5);
```

Esse comando solicita a exclusão do produto cujo `idProduto` é `5`.

**Observação:** o código da aula apresenta o método `deletar()` no controlador, mas não apresenta o evento completo do botão `btnDelete`. Portanto, para concluir a exclusão pela interface, ainda precisamos programar o evento desse botão.

Uma implementação possível é:

```java
btnDelete.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {

        if(textIDProduto.getText().isBlank()) {
            JOptionPane.showMessageDialog(null, "Busque um produto antes de excluir");
            textDescricao.requestFocus();

        }else {
            int resposta = JOptionPane.showConfirmDialog(
                null,
                "Deseja realmente excluir este produto?",
                "Confirmar exclusão",
                JOptionPane.YES_NO_OPTION
            );

            if(resposta == JOptionPane.YES_OPTION) {

                int id = Integer.parseInt(textIDProduto.getText());

                boolean sucesso = controllerProduto.deletar(id);

                if(sucesso) {
                    JOptionPane.showMessageDialog(null, "Produto excluído com sucesso!");
                    limparCampos();

                }else {
                    JOptionPane.showMessageDialog(null, "Não foi possível excluir o produto.");
                }
            }
        }
    }
});
```

Esse evento solicita confirmação antes de excluir o registro. Se o usuário confirmar, o sistema chama `deletar()` e verifica o resultado.

---

## 5. Implementando a busca de produtos pela descrição

Além da pesquisa pelo código de barras, vamos adicionar uma segunda maneira de localizar produtos: pela descrição.

No `frmProduto`, abra a aba **Design** e adicione um `JButton` com as seguintes propriedades:

| Propriedade | Valor |
|---|---|
| Variable | `btnBuscar` |
| Text | `Buscar` |
| Icon | Ícone de busca |

Depois, clique duas vezes no botão para criar seu evento.

### 5.1. Validando a descrição

Primeiro, verificamos se o campo de descrição foi preenchido:

```java
if(textDescricao.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha o nome do produto");
    textDescricao.requestFocus();

}else {
    // Realizar a busca
}
```

A busca só será executada quando o usuário informar uma descrição.

### 5.2. Chamando o controlador

Dentro do `else`, capturamos o texto digitado e chamamos o método `buscarProduto()`:

```java
String descricao = textDescricao.getText();

Produto produto = controllerProduto.buscarProduto(descricao);
```

O método recebe a descrição e retorna um objeto `Produto`, caso encontre um registro correspondente.

### 5.3. Preenchendo os campos automaticamente

Se o produto existir, o sistema utiliza os métodos `setText()` para preencher os campos do formulário:

```java
if(produto != null) {

    textIDProduto.setText(String.valueOf(produto.getIdProduto()));
    textBarcode.setText(produto.getCodigoBarras());
    textDescricao.setText(produto.getDescricao());
    textCategoria.setText(produto.getCategoria());
    textPrecoCusto.setText(String.valueOf(produto.getPrecoCusto()));
    textPrecoVenda.setText(String.valueOf(produto.getPrecoVenda()));
    textQuantidade.setText(String.valueOf(produto.getQuatidade()));
    textEstoqueMinimo.setText(String.valueOf(produto.getEstoqueMinimo()));
    textIDFornecedor.setText(String.valueOf(produto.getIdFornecedor()));

    // Localizar e selecionar o fornecedor a partir do ID
    for(int i = 0; i < cboFornecedor.getItemCount(); i++) {

        String item = cboFornecedor.getItemAt(i);

        if(item.startsWith(produto.getIdFornecedor() + " - ")) {
            cboFornecedor.setSelectedIndex(i);
        }
    }

    // Desabilitar o botão Adicionar e habilitar Editar/Deletar
    btnAdicionarProduto.setEnabled(false);
    btnUpdate.setEnabled(true);
    btnDelete.setEnabled(true);

}else {
    JOptionPane.showMessageDialog(null, "Produto não cadastrado");
    textDescricao.requestFocus();
}
```

### 5.4. Entendendo os comandos

**`String.valueOf()`**

Transforma um valor em texto.

Por exemplo:

```java
int id = 10;

textIDProduto.setText(String.valueOf(id));
```

O método `setText()` recebe uma `String`. Por isso, quando o valor original é um número, utilizamos `String.valueOf()` para convertê-lo.

**`produto != null`**

Verifica se o controlador encontrou um produto.

Se o resultado for diferente de `null`, significa que o objeto foi encontrado e pode ser utilizado.

**`for`**

Percorre os itens existentes no `JComboBox`:

```java
for(int i = 0; i < cboFornecedor.getItemCount(); i++)
```

- `int i = 0`: começa pelo primeiro item.
- `i < cboFornecedor.getItemCount()`: continua enquanto houver itens.
- `i++`: avança para o próximo item.

**`startsWith()`**

Verifica se um texto começa com determinado conteúdo:

```java
item.startsWith(produto.getIdFornecedor() + " - ")
```

Como os fornecedores são apresentados no formato `ID - Nome`, esse comando permite localizar o fornecedor pelo ID.

**`setSelectedIndex(i)`**

Seleciona o fornecedor encontrado no `JComboBox`.

### 5.5. Controle dos botões

Depois de encontrar um produto, precisamos impedir que o usuário tente cadastrá-lo novamente e liberar as opções de edição e exclusão.

```java
btnAdicionarProduto.setEnabled(false);
btnUpdate.setEnabled(true);
btnDelete.setEnabled(true);
```

O método `setEnabled()` controla se um componente pode ser utilizado:

- `false`: desabilita o botão.
- `true`: habilita o botão.

---

## 6. Criando o método buscarProduto() no ProdutoController

Agora precisamos implementar a consulta no banco de dados.

Adicione o seguinte método ao `ProdutoController`:

```java
// ===========================================
// BUSCAR PRODUTO PELA DESCRIÇÃO - CRUD READ
// ===========================================
public Produto buscarProduto(String descricao) {
    try {
        String sql = """
            select idProduto, codigoBarras, descricao, categoria,
                   precoCusto, precoVenda, quantidade, estoqueMinimo,
                   idFornecedor
            from produtos
            where descricao = ?
            """;

        Produto produto = null;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, descricao);

        ResultSet rs = stmt.executeQuery();

        // SE EXISTIR UM PRODUTO CADASTRADO
        if(rs.next()) {
            produto = new Produto();

            produto.setIdProduto(rs.getInt("idProduto"));
            produto.setCodigoBarras(rs.getString("codigoBarras"));
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

### 6.1. Entendendo o SELECT

```sql
SELECT idProduto, codigoBarras, descricao, categoria,
       precoCusto, precoVenda, quantidade, estoqueMinimo,
       idFornecedor
FROM produtos
WHERE descricao = ?;
```

Esse comando consulta a tabela `produtos` e retorna as informações do registro cuja descrição corresponde ao valor informado.

O `WHERE descricao = ?` limita a busca à descrição recebida pelo método.

### 6.2. Entendendo o ResultSet

```java
ResultSet rs = stmt.executeQuery();
```

O `ResultSet` armazena o resultado de uma consulta `SELECT`.

Para verificar se existe algum registro:

```java
if(rs.next()) {
```

O método `next()` avança para a próxima linha do resultado.

- Se existir uma linha, retorna `true`.
- Se não existir, retorna `false`.

Quando encontra um registro, criamos um novo objeto:

```java
produto = new Produto();
```

Depois, transferimos os dados do banco para os atributos desse objeto.

Por exemplo:

```java
produto.setDescricao(rs.getString("descricao"));
```

Esse comando lê o valor da coluna `descricao` no banco e coloca essa informação no objeto `produto`.

Ao final:

```java
return produto;
```

Retornamos o objeto preenchido. Se nenhum produto for encontrado, o valor continua sendo `null`.

---

## 7. Diferença entre buscar pelo código de barras e pela descrição

O projeto agora possui dois métodos de consulta.

| Método | Campo utilizado na busca | Objetivo |
|---|---|---|
| `buscarCodigoBarras()` | `codigoBarras` | Localizar pelo código de barras |
| `buscarProduto()` | `descricao` | Localizar pela descrição |

Ambos utilizam `SELECT`, `PreparedStatement` e `ResultSet`.

A principal diferença está na coluna utilizada na condição `WHERE`.

**Observação importante:** a consulta apresentada utiliza `descricao = ?`, ou seja, exige uma descrição correspondente ao valor pesquisado. Ela não realiza uma busca parcial.

Se quisermos encontrar produtos mesmo digitando apenas parte do nome, podemos utilizar:

```sql
WHERE descricao LIKE ?
```

E no Java:

```java
stmt.setString(1, "%" + descricao + "%");
```

Por exemplo, uma pesquisa por `café` poderia encontrar `Café em pó`, `Café solúvel` e `Café especial`.

---

## 8. Fluxo de funcionamento do cadastro de produtos

Com as novas funcionalidades, o fluxo do formulário fica assim:

1. O usuário informa o código de barras ou a descrição.
2. O sistema consulta o banco de dados.
3. Se encontrar o produto, preenche os campos automaticamente.
4. O sistema desabilita o botão Adicionar.
5. Os botões Editar e Deletar ficam disponíveis.
6. Se o usuário editar, o método `editar()` atualiza o registro.
7. Se o usuário excluir e confirmar, o método `deletar()` remove o registro.
8. Depois de uma operação bem-sucedida, `limparCampos()` prepara o formulário para uma nova operação.

---

## 9. Observações importantes e correções

### 9.1. Corrigir a opção padrão do JComboBox

No código anterior, o item padrão do `JComboBox` foi definido como:

```java
cboFornecedor.addItem("Selecione");
```

Porém, no evento do componente, a comparação aparece como:

```java
!selecionado.equals("Selecionado")
```

Os textos são diferentes. A comparação correta é:

```java
if(selecionado != null && !selecionado.equals("Selecione")) {
    String id = selecionado.split(" - ")[0];
    textIDFornecedor.setText(id);

}else {
    textIDFornecedor.setText("");
}
```

Assim, a opção padrão não será interpretada como um fornecedor válido.

### 9.2. Cuidado com o botão Deletar

O método `deletar()` já está implementado no controlador, mas ele só será executado quando o evento do botão `btnDelete` chamar esse método.

Também é importante solicitar confirmação antes de excluir um produto, evitando exclusões acidentais.

### 9.3. Atenção ao retorno booleano

Nos métodos `adicionar()`, `editar()` e `deletar()`, o retorno `true` indica que a execução chegou ao final sem lançar uma exceção.

Entretanto, o método `executeUpdate()` retorna um número que representa a quantidade de linhas afetadas. Uma atualização ou exclusão pode afetar zero linhas caso o ID não exista.

Uma melhoria seria verificar esse retorno:

```java
int linhasAfetadas = stmt.executeUpdate();

return linhasAfetadas > 0;
```

No método `editar()` e no `deletar()`, isso permite confirmar que algum registro realmente foi modificado ou removido.

### 9.4. Melhor prática: try-with-resources

Nos exemplos da aula, os recursos são fechados manualmente:

```java
rs.close();
stmt.close();
con.close();
```

Uma forma mais segura de trabalhar com JDBC é utilizar `try-with-resources`, que fecha automaticamente a conexão, o comando e o resultado mesmo quando ocorre uma exceção.

Exemplo:

```java
try(Connection con = database.conectar();
    PreparedStatement stmt = con.prepareStatement(sql)) {

    // Executar a operação

}
```

Essa é uma melhoria importante para evitar recursos abertos desnecessariamente.

### 9.5. Atenção ao nome do atributo quantidade

No código atual da aula, o atributo aparece como `quatidade`, com as letras invertidas.

O nome correto é `quantidade`. Se futuramente corrigirmos esse atributo na classe `Produto`, também será necessário atualizar os métodos correspondentes, como `getQuatidade()` e `setQuatidade()`, para `getQuantidade()` e `setQuantidade()` em todo o projeto.

---

## 10. Testes práticos

Depois de implementar os métodos, execute o projeto e faça os seguintes testes:

- [ ] Cadastre um produto.
- [ ] Pesquise o produto pelo código de barras e pressione Enter.
- [ ] Verifique se os campos são preenchidos automaticamente.
- [ ] Pesquise o produto pela descrição utilizando o botão Buscar.
- [ ] Verifique se o fornecedor correto é selecionado no `JComboBox`.
- [ ] Edite o preço de um produto e confirme se a alteração foi salva.
- [ ] Tente editar um produto com um código de barras já utilizado por outro.
- [ ] Exclua um produto e confirme a operação.
- [ ] Verifique no MySQL Workbench se as alterações foram realizadas.

---

## Guia Rápido de Memorização

| Comando | Função |
|---|---|
| `UPDATE` | Atualiza registros existentes |
| `SET` | Define os novos valores das colunas |
| `WHERE` | Determina qual registro será alterado ou excluído |
| `DELETE` | Exclui registros |
| `SELECT` | Consulta informações |
| `PreparedStatement` | Prepara comandos SQL com parâmetros |
| `executeUpdate()` | Executa INSERT, UPDATE e DELETE |
| `executeQuery()` | Executa consultas SELECT |
| `ResultSet` | Armazena os resultados de uma consulta |
| `rs.next()` | Avança para a próxima linha do resultado |
| `setEnabled()` | Habilita ou desabilita componentes |
| `String.valueOf()` | Converte valores para texto |
| `startsWith()` | Verifica o início de uma String |
| `setSelectedIndex()` | Seleciona um item do JComboBox |

## Resumo Relâmpago — 10 linhas

1. O CRUD é formado por Create, Read, Update e Delete.
2. `adicionar()` cadastra novos produtos no banco de dados.
3. `buscarCodigoBarras()` localiza produtos pelo código de barras.
4. `buscarProduto()` localiza produtos pela descrição.
5. `editar()` utiliza UPDATE para modificar informações existentes.
6. `deletar()` utiliza DELETE para excluir um produto.
7. O WHERE identifica qual registro será alterado ou excluído.
8. O PreparedStatement envia os parâmetros para os comandos SQL.
9. O ResultSet permite acessar os dados retornados pelo SELECT.
10. O formulário utiliza os controladores para realizar as operações no banco de dados.

**Próxima etapa:** continuar a implementação do formulário de produtos, revisar os eventos dos botões e avançar para as próximas funcionalidades do BL-PDV.
