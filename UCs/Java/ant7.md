# BL-PDV: Acesso a sites, geração de relatórios em PDF e início da tela de produtos

Nesta aula, continuamos o desenvolvimento do sistema **BL-PDV**, utilizando Java, Swing, Eclipse WindowBuilder, MySQL e bibliotecas externas.

O objetivo foi adicionar novas funcionalidades à tela de fornecedores, gerar relatórios em PDF e começar a construção da tela de produtos.

---

## Botão Acessar — Abrindo sites pelo Java

Na tela `frmFornecedor`, vamos adicionar um botão que permite abrir o site cadastrado para determinado fornecedor diretamente no navegador padrão do computador.

**Criando o botão**

No Eclipse:

1. Abra `frmFornecedor.java`.
2. Acesse a aba **Design**.
3. Arraste um novo `JButton` para a tela.
4. Configure as propriedades:

| Propriedade | Valor |
|---|---|
| Variable | `btnAcessar` |
| Text | `Acessar` |
| ToolTipText | `Acessar` |
| Cursor | `HAND_CURSOR` |

Depois, dê dois cliques no botão para criar o evento `actionPerformed`.

**Código do evento**

Dentro do evento do botão, adicione:

```java
String site = textSite.getText();
link(site);
```

**Entendendo o código:**

- `textSite.getText()` captura o endereço digitado no campo de site.
- `String site` armazena esse endereço em uma variável.
- `link(site)` chama um método responsável por abrir o endereço no navegador.

O método `link()` recebe o endereço como parâmetro.

## Criando o método `link()`

Adicione o método abaixo dentro da classe `frmFornecedor`, mas fora do construtor:

```java
private void link(String url) {
    Desktop desktop = Desktop.getDesktop();

    try {
        URI uri = new URI(url);

        desktop.browse(uri);

    } catch (Exception e) {
        JOptionPane.showMessageDialog(
            null,
            "Digite um formato válido de site\nExemplo: https://www.bruss.com.br"
        );

        textSite.requestFocus();
    }
}
```

**Entendendo cada parte**

**1. Criando o objeto Desktop**

```java
Desktop desktop = Desktop.getDesktop();
```

A classe `Desktop`, do pacote `java.awt`, permite que o Java interaja com recursos do sistema operacional.

Por meio dela, podemos abrir páginas na internet, arquivos e outros recursos utilizando os programas padrão do computador.

**2. Criando um objeto URI**

```java
URI uri = new URI(url);
```

`URI` significa *Uniform Resource Identifier* (Identificador Uniforme de Recursos).

É uma classe utilizada para representar identificadores de recursos, como endereços de páginas.

O construtor recebe o conteúdo da variável `url`.

**3. Abrindo o endereço**

```java
desktop.browse(uri);
```

O método `browse()` solicita ao sistema operacional que abra o endereço no navegador padrão.

**4. Tratamento de erros**

```java
catch (Exception e) {
```

Caso aconteça algum problema, o programa executa o bloco `catch`.

Por exemplo:
- Endereço com formato inválido.
- Navegador indisponível.
- Ambiente sem suporte à operação de navegação.

```java
JOptionPane.showMessageDialog(null, "Digite um formato válido de site...");
```

Exibe uma mensagem orientando o usuário a informar um endereço válido.

```java
textSite.requestFocus();
```

Devolve o foco ao campo de site, permitindo que o usuário corrija o endereço.

**Imports necessários**

No início de `frmFornecedor.java`, precisamos importar:

```java
import java.awt.Desktop;
import java.net.URI;
```

**Observação importante**

Para abrir um endereço corretamente, normalmente devemos informar o protocolo, como `https://`.

Exemplo:

```text
https://www.bruss.com.br
```

O método apresentado trata exceções, mas não verifica se o campo está vazio antes de tentar abrir o endereço. Essa validação pode ser adicionada posteriormente.

---

## Biblioteca OpenPDF — Gerando arquivos PDF

Agora vamos adicionar ao projeto uma biblioteca externa chamada **OpenPDF**, utilizada para criar documentos PDF por meio do Java.

**Baixando a biblioteca**

Acesse o endereço indicado na aula:

https://central.sonatype.com/artifact/com.github.librepdf/openpdf/2.2.5/overview

Baixe o arquivo:

```text
openpdf-2.2.5.jar
```

O arquivo `.jar` contém classes Java compiladas que podem ser utilizadas em outros projetos.

## Adicionando ao Eclipse

1. Abra o projeto `blpvd`.
2. Localize a pasta `lib`.
3. Arraste o arquivo `openpdf-2.2.5.jar` para dentro dela.
4. Clique com o botão direito no arquivo.
5. Acesse **Build Path**.
6. Clique em **Add to Build Path**.

Depois disso, o Eclipse poderá reconhecer as classes da biblioteca no projeto.

**O que é OpenPDF?**

A OpenPDF é uma biblioteca Java utilizada para criar e manipular documentos PDF.

Com ela, podemos:
- Criar documentos PDF.
- Adicionar textos e parágrafos.
- Configurar fontes e alinhamentos.
- Criar tabelas.
- Organizar informações em páginas.

No nosso sistema, ela será utilizada para gerar um relatório com os fornecedores cadastrados no banco de dados.

---

## Botão Relatório — Gerando o PDF de fornecedores

Vamos adicionar um botão na tela `frmFornecedor` para gerar um relatório contendo os fornecedores cadastrados.

**Criando o botão**

Na aba **Design** de `frmFornecedor`:

1. Arraste um novo `JButton`.
2. Configure:

| Propriedade | Valor |
|---|---|
| Variable | `btnRelatorio` |
| Text | Vazio |
| ToolTipText | `Gerar relatório` |

Procure um ícone de PDF com tamanho de 64 × 64 pixels e coloque-o na pasta `/img` do projeto.

Configure o ícone do botão para utilizar:

```text
/img/pdf.jpg
```

## Evento do botão

Dê dois cliques no botão e adicione:

```java
controller.gerarRelatorioFornecedores();
```

Esse comando chama o método `gerarRelatorioFornecedores()` da classe `FornecedorController`.

Assim, a tela fica responsável por receber o clique do usuário, enquanto o Controller executa a lógica de geração do relatório.

---

## Método gerarRelatorioFornecedores()

Agora vamos trabalhar na classe:

```text
controller/FornecedorController.java
```

Dentro dela, adicionaremos o método responsável por consultar os fornecedores no banco de dados, montar o documento PDF e abrir o arquivo gerado.

### Código completo do método

```java
public void gerarRelatorioFornecedores() {
    try {
        String sql = """
            select nome, fone, email, site
            from fornecedores
            order by nome
            """;

        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql);

        ResultSet rs = stmt.executeQuery();

        Document documento = new Document(PageSize.A4);

        String caminho = "fornecedor.pdf";

        PdfWriter.getInstance(documento, new FileOutputStream(caminho));

        documento.open();

        Font fonteTitulo = new Font(Font.getFamilyIndex("Helvetica"), 16, Font.BOLD);

        Paragraph titulo = new Paragraph("RELATÓRIO DE FORNECEDORES", fonteTitulo);

        titulo.setAlignment(Element.ALIGN_CENTER);
        documento.add(titulo);

        DateTimeFormatter formatoDataHora = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

        String dataHora = LocalDateTime.now().format(formatoDataHora);

        Paragraph data = new Paragraph("Data de emissão: " + dataHora);
        data.setAlignment(Element.ALIGN_CENTER);

        documento.add(data);

        documento.add(new Paragraph(" "));

        // TABELA
        PdfPTable tabela = new PdfPTable(4);

        tabela.setWidths(new float[] {3.0f, 2.0f, 3.0f, 4.0f});
        tabela.setWidthPercentage(100);

        // CABEÇALHO DA TABELA
        tabela.addCell("Nome");
        tabela.addCell("Fone");
        tabela.addCell("Email");
        tabela.addCell("Site");

        // DADOS DOS FORNECEDORES
        int quantidade = 0;

        while (rs.next()) {
            tabela.addCell(rs.getString("Nome"));
            tabela.addCell(rs.getString("Fone"));
            tabela.addCell(rs.getString("Email"));
            tabela.addCell(rs.getString("Site"));

            quantidade++;
        }

        documento.add(tabela);

        documento.add(new Paragraph(" "));

        Font fonteTotal = new Font(Font.getFamilyIndex("Helvetica"), 10, Font.BOLD);

        Paragraph total = new Paragraph("Total de fornecedores: " + quantidade, fonteTotal);
        total.setAlignment(Element.ALIGN_RIGHT);

        documento.add(total);

        documento.close();

        rs.close();
        stmt.close();
        con.close();

        // ABRIR O PDF AUTOMATICAMENTE
        File arquivo = new File(caminho);
        Desktop.getDesktop().open(arquivo);

    } catch (Exception e) {
        System.out.println(e);
    }
}
```

**Entendendo a consulta SQL**

```java
String sql = """
    select nome, fone, email, site
    from fornecedores
    order by nome
    """;
```

Essa consulta busca os dados dos fornecedores cadastrados.

- `SELECT`: seleciona as informações que queremos consultar.
- `nome, fone, email, site`: colunas que serão utilizadas no relatório.
- `FROM fornecedores`: indica a tabela de origem.
- `ORDER BY nome`: organiza os resultados em ordem alfabética pelo nome.

Não estamos utilizando `WHERE`, portanto a consulta retorna todos os fornecedores cadastrados.

**Executando a consulta**

```java
Connection con = database.conectar();
PreparedStatement stmt = con.prepareStatement(sql);

ResultSet rs = stmt.executeQuery();
```

Essas três linhas são responsáveis pela comunicação com o banco de dados.

- `Connection`: representa a conexão com o banco.
- `PreparedStatement`: prepara a instrução SQL.
- `ResultSet`: recebe os resultados retornados pela consulta.

O método `executeQuery()` é utilizado para executar consultas SQL que retornam resultados, como `SELECT`.

## Criando o documento PDF

```java
Document documento = new Document(PageSize.A4);
```

Cria um novo documento PDF com tamanho de página A4.

O objeto `Document` representa o documento que receberá os conteúdos do relatório.

```java
String caminho = "fornecedor.pdf";
```

Define o nome do arquivo que será gerado.

```java
PdfWriter.getInstance(documento, new FileOutputStream(caminho));
```

Cria o mecanismo responsável por escrever o documento PDF no arquivo indicado.

- `PdfWriter`: classe da OpenPDF que escreve o conteúdo no formato PDF.
- `FileOutputStream`: permite gravar os dados em um arquivo.
- `caminho`: indica o nome e o local do arquivo.

Como foi informado somente o nome do arquivo, ele será criado no diretório de trabalho utilizado pelo programa.

```java
documento.open();
```

Abre o documento para receber os elementos.

É importante chamar esse método antes de adicionar textos e tabelas.

**Criando o título**

```java
Font fonteTitulo = new Font(Font.getFamilyIndex("Helvetica"), 16, Font.BOLD);
```

Cria uma configuração de fonte para o título.

- `Helvetica`: família da fonte.
- `16`: tamanho da fonte.
- `Font.BOLD`: estilo em negrito.

```java
Paragraph titulo = new Paragraph("RELATÓRIO DE FORNECEDORES", fonteTitulo);
```

Cria um parágrafo contendo o título do relatório.

```java
titulo.setAlignment(Element.ALIGN_CENTER);
```

Centraliza o título horizontalmente.

```java
documento.add(titulo);
```

Adiciona o título ao documento PDF.

**Importante:** criar um elemento não significa que ele já está no documento. É necessário utilizar `documento.add()` para adicioná-lo.

## Adicionando data e horário

```java
DateTimeFormatter formatoDataHora = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
```

Define o formato da data e do horário.

| Símbolo | Significado |
|---|---|
| `dd` | Dia |
| `MM` | Mês |
| `yyyy` | Ano com quatro dígitos |
| `HH` | Hora no formato de 24 horas |
| `mm` | Minutos |

Exemplo:

```text
12/11/2026 14:32
```

```java
String dataHora = LocalDateTime.now().format(formatoDataHora);
```

- `LocalDateTime.now()` obtém a data e o horário atuais do computador.
- `.format(formatoDataHora)` transforma essa informação no formato definido.

```java
Paragraph data = new Paragraph("Data de emissão: " + dataHora);
```

Cria um parágrafo com a data e o horário de emissão.

```java
data.setAlignment(Element.ALIGN_CENTER);
documento.add(data);
```

Centraliza e adiciona o parágrafo ao PDF.

## Criando a tabela

```java
PdfPTable tabela = new PdfPTable(4);
```

Cria uma tabela com quatro colunas.

Cada coluna representará uma informação do fornecedor:

1. Nome.
2. Fone.
3. Email.
4. Site.

```java
tabela.setWidths(new float[] {3.0f, 2.0f, 3.0f, 4.0f});
```

Define a proporção de largura entre as colunas.

Os valores representam larguras relativas, e não medidas fixas em centímetros.

Neste exemplo:

- Nome: proporção 3.
- Fone: proporção 2.
- Email: proporção 3.
- Site: proporção 4.

```java
tabela.setWidthPercentage(100);
```

Define que a tabela ocupará 100% da largura disponível na área do documento.

## Criando o cabeçalho

```java
tabela.addCell("Nome");
tabela.addCell("Fone");
tabela.addCell("Email");
tabela.addCell("Site");
```

Cada chamada de `addCell()` adiciona uma célula à tabela.

As primeiras quatro células formam o cabeçalho do relatório.

**Preenchendo a tabela com os fornecedores**

```java
int quantidade = 0;

while (rs.next()) {
    tabela.addCell(rs.getString("Nome"));
    tabela.addCell(rs.getString("Fone"));
    tabela.addCell(rs.getString("Email"));
    tabela.addCell(rs.getString("Site"));

    quantidade++;
}
```

Esse trecho percorre os registros retornados pelo banco de dados.

**Entendendo o `while`:**

```java
while (rs.next()) {
```

O método `rs.next()` avança o cursor do `ResultSet` para o próximo registro.

Enquanto houver registros disponíveis, o bloco será executado.

**Obtendo os dados:**

```java
rs.getString("Nome");
rs.getString("Fone");
rs.getString("Email");
rs.getString("Site");
```

Cada comando recupera o valor de uma coluna do registro atual.

**Adicionando as informações:**

```java
tabela.addCell(rs.getString("Nome"));
```

Adiciona o nome do fornecedor à tabela. O mesmo acontece com telefone, email e site.

**Contando os fornecedores:**

```java
quantidade++;
```

Incrementa a variável `quantidade` em uma unidade a cada fornecedor processado.

Assim, ao terminar o `while`, teremos o total de registros encontrados.

## 4.10. Adicionando a tabela ao PDF

```java
documento.add(tabela);
```

Adiciona a tabela completa ao documento.

Até esse momento, ela já contém o cabeçalho e os dados recuperados do banco.

## 4.11. Exibindo o total de fornecedores

```java
Font fonteTotal = new Font(Font.getFamilyIndex("Helvetica"), 10, Font.BOLD);
```

Cria uma fonte em negrito, tamanho 10.

```java
Paragraph total = new Paragraph("Total de fornecedores: " + quantidade, fonteTotal);
```

Cria um parágrafo que apresenta a quantidade de fornecedores.

```java
total.setAlignment(Element.ALIGN_RIGHT);
```

Alinha o texto à direita.

```java
documento.add(total);
```

Adiciona o total ao relatório.

## Finalizando o documento e abrindo o PDF

```java
documento.close();
```

Finaliza o documento PDF e grava o conteúdo pendente.

Depois, fechamos os recursos da consulta:

```java
rs.close();
stmt.close();
con.close();
```

- `rs.close()`: fecha o conjunto de resultados.
- `stmt.close()`: fecha a instrução SQL.
- `con.close()`: encerra a conexão com o banco de dados.

Por último:

```java
File arquivo = new File(caminho);
Desktop.getDesktop().open(arquivo);
```

- `File`: representa o arquivo no sistema operacional.
- `new File(caminho)`: cria uma referência ao PDF gerado.
- `Desktop.getDesktop().open(arquivo)`: solicita ao sistema operacional que abra o arquivo no programa padrão para PDFs.

**Imports necessários no FornecedorController**

Adicione os imports utilizados pelo método:

```java
import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
```

**Observações importantes sobre o relatório**

- O nome do arquivo será `fornecedor.pdf`.
- O arquivo é criado no diretório de trabalho do programa, não necessariamente dentro da pasta `src`.
- Se o arquivo já existir, a gravação poderá substituir o conteúdo anterior.
- O método apresentado não verifica se a conexão com o banco foi estabelecida antes de utilizá-la.
- Os recursos da consulta deveriam ser fechados mesmo quando ocorre uma exceção. Uma evolução importante é utilizar `try-with-resources`.
- O código captura exceções, mas apenas as imprime no console. Uma melhoria futura seria exibir uma mensagem ao usuário quando o relatório não puder ser gerado.

---

## Atualizando o Main.java — Botão Produtos

Agora vamos melhorar o menu lateral da tela principal e adicionar uma nova opção chamada **Produtos**.

**Alterando o botão Fornecedores**

No `Main.java`, acesse a aba **Design**.

Selecione o botão Fornecedores e altere:

| Propriedade | Valor |
|---|---|
| Icon Text Gap | `12` |
| Cursor | `HAND_CURSOR` |

O `iconTextGap` define o espaço entre o ícone e o texto do botão.

## Criando o botão Produtos

Adicione um novo `JButton` ao painel lateral.

Configure:

| Propriedade | Valor |
|---|---|
| Variable | `btnProdutos` |
| Text | `Produtos` |
| ToolTipText | `Produtos` |
| Cursor | `HAND_CURSOR` |
| Icon Text Gap | `12` |

Procure um ícone de produto com tamanho de 32 × 32 pixels e coloque-o na pasta `/img` do projeto.

Configure o ícone para:

```text
/img/produtos.jpg
```

## Evento do botão Produtos

Dê dois cliques no botão e adicione:

```java
frmProduto produto = new frmProduto();
produto.setVisible(true);
```

**Entendendo o código:**

```java
frmProduto produto = new frmProduto();
```

Cria um novo objeto da classe `frmProduto`.

```java
produto.setVisible(true);
```

Torna a janela visível na tela.

Dessa forma, quando o usuário clicar em Produtos, o sistema abrirá a janela de cadastro de produtos.

---

**Criando a janela frmProduto**

Agora vamos criar uma nova janela para trabalhar com o cadastro de produtos.

**Criando um JDialog**

No Eclipse:

1. Acesse o menu **View**.
2. Entre em **Other**.
3. Procure **WindowBuilder**.
4. Acesse **Swing Designer**.
5. Selecione a opção para criar um novo `JDialog`.
6. Defina o nome da classe como `frmProduto`.
7. Coloque a classe dentro do pacote `view`.

O arquivo ficará assim:

```text
src
└── view
    ├── Main.java
    ├── Sobre.java
    ├── frmFornecedor.java
    └── frmProduto.java
```

**Configurando a janela**

Abra `frmProduto.java` na aba **Design**.

Remova os componentes desnecessários, mantendo a estrutura básica da janela.

Configure as propriedades do componente principal:

| Propriedade | Valor |
|---|---|
| Size | `640 × 480` |
| Title | `Produtos` |
| Modal | `true` |
| Resizable | `false` |
| Icon | Ícone de produtos |

No `getContentPane`, configure:

```text
Layout: Absolute
```

O layout absoluto permite posicionar os componentes manualmente por meio de coordenadas e dimensões.

**Atenção:** esse layout facilita a montagem visual da tela durante a aula, mas pode apresentar problemas de adaptação quando a janela é executada em diferentes resoluções ou quando os componentes mudam de tamanho.

---

**Montando os campos da tela de produtos**

Agora vamos adicionar os componentes que formarão o formulário de cadastro.

A tela terá informações como identificação, descrição, categoria, fornecedor, custo, preço de venda, quantidade e estoque mínimo.

**Campo ID do produto**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblidProduto` |
| Text | `ID` |

Adicione um `JTextField`:

| Propriedade | Valor |
|---|---|
| Variable | `textIDProduto` |
| Text | Vazio |
| ToolTipText | `Id Produto` |
| Enabled | `false` |

O campo de ID ficará desabilitado porque a identificação do produto normalmente será gerada automaticamente pelo banco de dados.

**Campo Descrição**

Adicione um `JTextField`:

| Propriedade | Valor |
|---|---|
| Variable | `textDescricao` |

Esse campo será utilizado para informar o nome ou a descrição do produto.

Exemplo:

```text
Teclado USB
```

**Campo Categoria**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblCategoria` |
| Text | `Categoria` |

Adicione um `JTextField`:

| Propriedade | Valor |
|---|---|
| Variable | `textCategoria` |

Esse campo será utilizado para informar a categoria do produto.

Exemplos:

- Informática.
- Periféricos.
- Acessórios.
- Eletrônicos.

**Campo Fornecedor**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblFornecedor` |
| Text | `Fornecedor` |

Adicione um `JComboBox`:

| Propriedade | Valor |
|---|---|
| Variable | `cboFornecedor` |

O `JComboBox` apresenta uma lista suspensa de opções.

Nesse caso, ele será utilizado para selecionar o fornecedor relacionado ao produto.

**Aprofundamento:** futuramente, poderemos preencher esse componente automaticamente com os fornecedores cadastrados na tabela `fornecedores` do banco de dados.

Isso evita que o usuário precise digitar novamente os dados de um fornecedor já existente.

**Campo Custo**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblCusto` |
| Text | `Custo` |

Adicione um `JTextField`:

| Propriedade | Valor |
|---|---|
| Variable | `textPrecoCusto` |

Esse campo armazenará o valor pelo qual o estabelecimento compra o produto.

Exemplo:

```text
50,00
```

**Campo Venda**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblVenda` |
| Text | `Venda` |

Adicione um `JTextField`.

**Correção de nomenclatura:** nas instruções da aula aparece `lblPrecoCusto` como variável do campo de venda. Como esse componente é um `JTextField` destinado ao preço de venda, o nome coerente é:

```text
textPrecoVenda
```

Assim, evitamos confundir o preço de custo com o preço de venda.

**Campo ID Fornecedor**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblIDFornecedore` |
| Text | `ID Fornecedor` |

Adicione um `JTextField`:

| Propriedade | Valor |
|---|---|
| Variable | `textIDFornecedor` |
| Enabled | `false` |

Esse campo representa o identificador do fornecedor associado ao produto.

**Observação:** o nome `textIDForecedor` aparece com erro de digitação nas instruções. A grafia recomendada é `textIDFornecedor`.

O campo ficará desabilitado para impedir alterações manuais no identificador.

**Campo Quantidade**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblQuantidade` |
| Text | `Quantidade` |

Adicione um `JTextField`:

| Propriedade | Valor |
|---|---|
| Variable | `textQuantidade` |

Esse campo será utilizado para registrar a quantidade de unidades disponíveis do produto.

Exemplo:

```text
25
```

**Campo Estoque mínimo**

Adicione um `JLabel`:

| Propriedade | Valor |
|---|---|
| Variable | `lblEstoqueMinino` |
| Text | `Estoque mínimo` |

Adicione um `JTextField`:

| Propriedade | Valor |
|---|---|
| Variable | `textEstoqueMinino` |

Esse campo representa a quantidade mínima de unidades que o estabelecimento deseja manter em estoque.

Exemplo:

```text
5
```

Se a quantidade disponível ficar abaixo desse valor, o sistema poderá futuramente emitir um alerta de estoque baixo.

**Correção de nomenclatura:** o termo correto é `mínimo`, e não `minino`. Para manter consistência no código, os nomes recomendados são `lblEstoqueMinimo` e `textEstoqueMinimo`.

---

**Organização dos componentes da tela frmProduto**

Até aqui, a estrutura dos componentes planejados é:

| Componente | Variável | Finalidade |
|---|---|---|
| JLabel | `lblidProduto` | Identificação do produto |
| JTextField | `textIDProduto` | ID automático |
| JTextField | `textDescricao` | Descrição do produto |
| JLabel | `lblCategoria` | Identificação da categoria |
| JTextField | `textCategoria` | Categoria do produto |
| JLabel | `lblFornecedor` | Identificação do fornecedor |
| JComboBox | `cboFornecedor` | Seleção do fornecedor |
| JLabel | `lblCusto` | Identificação do custo |
| JTextField | `textPrecoCusto` | Preço de custo |
| JLabel | `lblVenda` | Identificação do preço de venda |
| JTextField | `textPrecoVenda` | Preço de venda |
| JLabel | `lblIDFornecedore` | Identificação do ID do fornecedor |
| JTextField | `textIDFornecedor` | ID do fornecedor |
| JLabel | `lblQuantidade` | Identificação da quantidade |
| JTextField | `textQuantidade` | Quantidade disponível |
| JLabel | `lblEstoqueMinimo` | Identificação do estoque mínimo |
| JTextField | `textEstoqueMinimo` | Limite mínimo de estoque |

**Atenção:** a aula termina durante a montagem dos componentes da tela `frmProduto`. Ainda não foram apresentados o código completo dessa janela, a classe `Produto`, a tabela de produtos no MySQL ou as operações CRUD para produtos. Essas partes não devem ser consideradas implementadas ainda.

---

## Conceitos importantes aprendidos nesta aula

**Desktop**

Classe do Java utilizada para interagir com recursos do sistema operacional, como abrir páginas no navegador e arquivos.

**URI**

Identificador utilizado para representar recursos. No exemplo, é utilizado para representar o endereço do site do fornecedor.

**OpenPDF**

Biblioteca externa Java utilizada para criar documentos PDF.

**Document**

Representa o documento PDF que receberá os conteúdos.

**Paragraph**

Representa um parágrafo de texto dentro do PDF.

**PdfPTable**

Classe utilizada para construir tabelas dentro do documento PDF.

**ResultSet**

Objeto que armazena os resultados de uma consulta SQL e permite percorrer os registros retornados.

**JComboBox**

Componente Swing que apresenta uma lista suspensa de opções para o usuário selecionar.

**JDialog**

Janela secundária do Swing. Pode ser modal, impedindo a interação com outras janelas do aplicativo enquanto estiver aberta.

**CRUD**

Conjunto das quatro operações fundamentais de manipulação de dados:

| Operação | Significado | Exemplo no BL-PDV |
|---|---|---|
| Create | Criar | Adicionar fornecedor |
| Read | Ler | Buscar fornecedor |
| Update | Atualizar | Editar fornecedor |
| Delete | Excluir | Excluir fornecedor |

---

**Observações técnicas para o desenvolvimento**

1. **Acesso a sites:** o método `Desktop.browse()` depende do suporte do sistema operacional e da disponibilidade de um navegador.
2. **Geração de PDF:** a biblioteca OpenPDF precisa estar corretamente adicionada ao Build Path para que os imports sejam reconhecidos.
3. **Organização do projeto:** a geração do relatório foi colocada no Controller, separando a interface gráfica da lógica de acesso aos dados e criação do documento.
4. **Arquivos PDF:** o caminho `fornecedor.pdf` é relativo ao diretório de trabalho do programa.
5. **Banco de dados:** a consulta do relatório utiliza todos os fornecedores cadastrados, organizados pelo nome.
6. **JComboBox:** o componente `cboFornecedor` poderá ser preenchido com dados vindos do banco de dados.
7. **Estoque mínimo:** esse campo permitirá implementar futuramente uma lógica de alerta quando a quantidade de produtos estiver baixa.
8. **Preço de custo e preço de venda:** são informações diferentes e devem possuir campos separados.

---

**Resumo Relâmpago**
1. O botão Acessar utiliza `Desktop` e `URI` para abrir sites no navegador padrão.
2. O método `link()` recebe o endereço e tenta abri-lo, tratando possíveis exceções.
3. A biblioteca OpenPDF permite criar documentos PDF utilizando Java.
4. O `Document` representa o PDF, enquanto `Paragraph` adiciona textos.
5. O `PdfPTable` cria tabelas com colunas e células.
6. O `ResultSet` percorre os fornecedores retornados pela consulta SQL.
7. O método `gerarRelatorioFornecedores()` cria um relatório com dados, data e quantidade de fornecedores.
8. O botão Produtos abre a janela `frmProduto` por meio de um novo objeto.
9. A tela `frmProduto` começa a ser construída com campos de descrição, categoria, fornecedor e preços.
10. Os campos de quantidade e estoque mínimo serão utilizados no controle de estoque do BL-PDV.

**Próxima etapa:** continuar a montagem da tela `frmProduto` e desenvolver a estrutura de cadastro de produtos no banco de dados.
