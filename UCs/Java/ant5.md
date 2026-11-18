# BL-PDV: Validação de campos e cadastro de fornecedores

**Criando a classe Validador**

Nesta etapa, vamos criar uma classe responsável por controlar o que o usuário pode digitar nos campos de texto do sistema.

Por exemplo, podemos definir que:

- O campo Nome aceita até 50 caracteres.
- O campo Telefone aceita até 20 caracteres.
- Um campo numérico aceita somente números de 0 a 9.
- Um campo decimal aceita números com vírgula ou ponto como separador decimal.

Essa validação ajuda a evitar que o usuário digite informações fora do padrão esperado.

## Criando o package utils

Dentro da pasta `src`:

1. Clique com o botão direito.
2. Selecione **New → Package**.
3. Digite `utils`.
4. Clique em **Finish**.

Dentro desse package, crie uma classe chamada `Validador`.

O caminho ficará assim:

```text
src
└── utils
    └── Validador.java
```

### Código da classe Validador

```java
package utils;

import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.PlainDocument;

public class Validador extends PlainDocument {

    private static final long serialVersionUID = 1L;

    private int limite;
    private String tipo;

    public Validador(int limite) {
        super();
        this.limite = limite;
        this.tipo = "texto";
    }

    public Validador(int limite, String tipo) {
        super();
        this.limite = limite;
        this.tipo = tipo;
    }

    public void insertString(int ofs, String str, AttributeSet a)
            throws BadLocationException {

        // VERIFICAR SE O TEXTO É NULO
        if (str == null) {
            return;
        }

        // VERIFICA LIMITE DE CARACTERES
        if (getLength() + str.length() > limite) {
            return;
        }

        // VERIFICAR O TIPO DE TEXTO
        if (tipo.equals("texto")) {
            super.insertString(ofs, str, a);

        // VERIFICAR SE O NÚMERO É INTEIRO
        } else if (tipo.equals("inteiro")) {

            // ACEITA SOMENTE NÚMEROS DE 0 A 9
            if (str.matches("[0-9]+")) {
                super.insertString(ofs, str, a);
            }

        // VERIFICAR SE É DECIMAL
        } else if (tipo.equals("decimal")) {

            // TEXTO ATUAL NO CAMPO
            String textoAtual = getText(0, getLength());

            // TEXTO QUE SERÁ INSERIDO
            String novoTexto = textoAtual.substring(0, ofs)
                    + str
                    + textoAtual.substring(ofs);

            // ACEITA NÚMEROS E UMA VÍRGULA OU PONTO
            if (novoTexto.matches("[0-9]*([,.][0-9]*)?")) {
                super.insertString(ofs, str, a);
            }
        }
    }
}
```

**Entendendo a classe Validador**

**Herança de PlainDocument**

```java
public class Validador extends PlainDocument
```

A classe `Validador` herda de `PlainDocument`, uma classe do Java Swing responsável por controlar o conteúdo de documentos de texto.

Isso permite modificar o comportamento dos campos de texto, definindo regras para aquilo que pode ser digitado.

Em outras palavras, a classe `Validador` funciona como um filtro entre o teclado e o campo de texto.

**Atributos da classe**

```java
private int limite;
private String tipo;
```

- `limite`: determina a quantidade máxima de caracteres permitidos.
- `tipo`: determina qual regra de validação será utilizada.

O modificador `private` impede que esses atributos sejam acessados diretamente de outras classes.

**Primeiro construtor**

```java
public Validador(int limite) {
    super();
    this.limite = limite;
    this.tipo = "texto";
}
```

Esse construtor recebe apenas o limite de caracteres.

Como não foi informado um tipo específico, ele define automaticamente o tipo como `"texto"`.

Exemplo:

```java
new Validador(50);
```

Significa que o campo poderá receber texto com até 50 caracteres.

**Segundo construtor**

```java
public Validador(int limite, String tipo) {
    super();
    this.limite = limite;
    this.tipo = tipo;
}
```

Esse construtor recebe dois parâmetros:

- `limite`: quantidade máxima de caracteres.
- `tipo`: regra de validação que será aplicada.

Exemplo:

```java
new Validador(50, "texto");
```

Nesse caso, o campo terá limite de 50 caracteres e utilizará a validação de texto.

Também poderíamos utilizar:

```java
new Validador(10, "inteiro");
new Validador(10, "decimal");
```

**Método insertString()**

```java
public void insertString(int ofs, String str, AttributeSet a)
        throws BadLocationException
```

Esse método é chamado quando algum conteúdo é inserido no documento do campo de texto.

Seus parâmetros são:

| Parâmetro | Significado |
|---|---|
| `ofs` | Posição em que o conteúdo será inserido. |
| `str` | Texto que será inserido. |
| `a` | Atributos associados ao texto. |

A palavra `throws` indica que o método pode lançar uma exceção chamada `BadLocationException`, relacionada a uma posição inválida no documento.

Como estamos sobrescrevendo um método herdado de `PlainDocument`, podemos controlar o que acontece durante a inserção de conteúdo.

## Verificando se o texto é nulo

```java
if (str == null) {
    return;
}
```

Primeiro, verificamos se o conteúdo recebido é `null`.

Se for, o método utiliza `return` para interromper sua execução.

Isso evita tentar processar uma informação inexistente.

## Limitando a quantidade de caracteres

```java
if (getLength() + str.length() > limite) {
    return;
}
```

Aqui verificamos se a quantidade de caracteres ultrapassará o limite estabelecido.

- `getLength()`: retorna a quantidade de caracteres que já existem no campo.
- `str.length()`: retorna a quantidade de caracteres que estão sendo inseridos.
- `limite`: representa a quantidade máxima permitida.

Exemplo:

Se o limite for 50 e o campo já tiver 45 caracteres, não será possível inserir mais 6 caracteres de uma vez, pois o total chegaria a 51.

O `return` impede a inserção quando o limite é ultrapassado.

## Validando texto

```java
if (tipo.equals("texto")) {
    super.insertString(ofs, str, a);
}
```

Quando o tipo for `"texto"`, o conteúdo será inserido normalmente, respeitando o limite de caracteres.

O método `equals()` compara o conteúdo de duas Strings.

Já `super.insertString()` chama o método original da classe `PlainDocument`, realizando a inserção no campo.

## Validando números inteiros

```java
else if (tipo.equals("inteiro")) {

    if (str.matches("[0-9]+")) {
        super.insertString(ofs, str, a);
    }
}
```

Quando o tipo for `"inteiro"`, o sistema verifica se o conteúdo inserido contém somente números de 0 a 9.

O método `matches()` verifica se o texto corresponde a uma expressão regular (*Regex*).

A expressão:

```java
[0-9]+
```

Significa:

- `[0-9]`: aceita qualquer algarismo entre 0 e 9.
- `+`: exige pelo menos um caractere.

Exemplos:

| Entrada | Resultado |
|---|---|
| `123` | Aceita |
| `4567` | Aceita |
| `12a` | Rejeita |
| `abc` | Rejeita |
| `-10` | Rejeita |

Essa validação não permite números negativos, pois o sinal de menos não faz parte da expressão.

## Validando números decimais

```java
else if (tipo.equals("decimal")) {

    String textoAtual = getText(0, getLength());

    String novoTexto = textoAtual.substring(0, ofs)
            + str
            + textoAtual.substring(ofs);

    if (novoTexto.matches("[0-9]*([,.][0-9]*)?")) {
        super.insertString(ofs, str, a);
    }
}
```

Essa parte permite inserir números decimais utilizando vírgula ou ponto como separador.

Primeiro, obtemos o conteúdo que já existe no campo:

```java
String textoAtual = getText(0, getLength());
```

- `getText()`: recupera o conteúdo do documento.
- `0`: posição inicial da leitura.
- `getLength()`: quantidade total de caracteres existentes.

Depois, montamos uma String com o conteúdo que existiria após a inserção:

```java
String novoTexto = textoAtual.substring(0, ofs)
        + str
        + textoAtual.substring(ofs);
```

O método `substring()` permite obter partes de uma String.

A montagem considera três partes:

1. Texto que aparece antes da posição de inserção.
2. Novo conteúdo que será inserido.
3. Texto que aparece depois da posição de inserção.

Isso é importante porque a validação precisa considerar o resultado completo, não somente os caracteres novos.

**Entendendo a expressão regular**

```java
[0-9]*([,.][0-9]*)?
```

- `[0-9]*`: aceita zero ou mais números.
- `[,.]`: aceita vírgula ou ponto.
- `(...)`: agrupa uma parte da expressão.
- `?`: torna o grupo anterior opcional.

Exemplos:

| Entrada | Resultado |
|---|---|
| `100` | Aceita |
| `10,50` | Aceita |
| `10.50` | Aceita |
| `0,75` | Aceita |
| `10,50,20` | Rejeita |
| `10.50.20` | Rejeita |
| `10a` | Rejeita |

**Observação importante:** essa expressão também permite estados intermediários, como uma String vazia ou apenas um separador decimal. Isso pode ser útil durante a digitação, mas a validação final do valor deve ser feita antes de salvar os dados.

## Como utilizar a classe Validador

Depois de criar a classe, podemos utilizá-la em qualquer `JTextField`.

Exemplo:

```java
textNome.setDocument(new Validador(50));
```

Isso limita o campo a 50 caracteres.

Para aceitar somente números inteiros:

```java
textID.setDocument(new Validador(10, "inteiro"));
```

Para aceitar números decimais:

```java
textPreco.setDocument(new Validador(10, "decimal"));
```

**Atenção:** a classe `Validador` não altera automaticamente todos os campos do sistema. É necessário aplicar o validador individualmente em cada `JTextField`.

---

## Criando a classe FornecedorController

Agora vamos criar a classe responsável por fazer a comunicação entre a aplicação Java e o banco de dados.

Até aqui, temos três partes importantes:

- **View:** representa a interface gráfica que o usuário utiliza.
- **Model:** representa os dados e as informações do sistema.
- **Controller:** controla as operações e faz a comunicação entre a interface e o banco de dados.

Essa organização segue a ideia do padrão arquitetural MVC (*Model-View-Controller*).

## Criando o package controller

Dentro da pasta `src`:

1. Clique com o botão direito.
2. Selecione **New → Package**.
3. Digite `controller`.
4. Clique em **Finish**.

Dentro desse package, crie uma classe chamada `FornecedorController`.

A estrutura ficará assim:

```text
src
├── controller
│   └── FornecedorController.java
├── database
│   └── Database.java
├── model
│   └── Fornecedor.java
├── utils
│   └── Validador.java
└── view
    ├── Main.java
    ├── Sobre.java
    └── frmFornecedor.java
```

### Código da classe FornecedorController

```java
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.Database;
import model.Fornecedor;

// SERÁ A CLASSE UTILIZADA PARA FAZER O CRUD
public class FornecedorController {

    // OBJETO DATABASE - ACESSO AO BANCO DE DADOS
    Database database = new Database();

    // MÉTODOS (FUNÇÕES) CRUD

    // ======================
    // ADICIONAR FORNECEDORES
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
}
```

**Entendendo a classe FornecedorController**

**Importando as classes necessárias**

```java
import java.sql.Connection;
import java.sql.PreparedStatement;

import database.Database;
import model.Fornecedor;
```

Essas importações permitem utilizar recursos de diferentes partes do projeto.

| Importação | Finalidade |
|---|---|
| `Connection` | Representa uma conexão com o banco de dados. |
| `PreparedStatement` | Permite preparar e executar comandos SQL com parâmetros. |
| `Database` | Classe criada anteriormente para conectar ao MySQL. |
| `Fornecedor` | Classe Model que representa os dados de um fornecedor. |

**Criando o objeto Database**

```java
Database database = new Database();
```

Criamos um objeto da classe `Database`.

Esse objeto será utilizado para acessar o método `conectar()`, responsável por estabelecer a conexão com o banco de dados.

**Criando o método Adicionar()**

```java
public void Adicionar(Fornecedor fornecedor)
```

Esse método recebe um objeto da classe `Fornecedor`.

O objeto contém as informações que serão cadastradas:

- Nome.
- Telefone.
- E-mail.
- Site.

O tipo de retorno é `void`, ou seja, o método executa a operação, mas não devolve um resultado para quem o chamou.

**Criando o comando SQL**

```java
String sql = """
    insert into fornecedores (nome, fone, email, site)
    values (?,?,?,?)
""";
```

Esse comando realiza a inserção de um novo registro na tabela `fornecedores`.

A instrução SQL utilizada é:

```sql
INSERT INTO fornecedores (nome, fone, email, site)
VALUES (?, ?, ?, ?);
```

O comando `INSERT INTO` é utilizado para adicionar registros em uma tabela.

Os pontos de interrogação representam parâmetros que serão preenchidos posteriormente.

**Estabelecendo a conexão**

```java
Connection con = database.conectar();
```

Chamamos o método `conectar()` da classe `Database`.

O resultado é armazenado na variável `con`, que representa a conexão com o MySQL.

**Preparando o comando SQL**

```java
PreparedStatement stmt = con.prepareStatement(sql);
```

O `PreparedStatement` prepara o comando SQL para receber os valores.

Uma das vantagens desse recurso é permitir que os dados sejam enviados separadamente do comando SQL, reduzindo riscos de SQL Injection.

**Preenchendo os parâmetros**

```java
stmt.setString(1, fornecedor.getNome());
stmt.setString(2, fornecedor.getFone());
stmt.setString(3, fornecedor.getEmail());
stmt.setString(4, fornecedor.getSite());
```

Aqui preenchemos os quatro parâmetros do comando SQL.

O primeiro argumento de `setString()` representa a posição do parâmetro, começando em 1.

O segundo argumento representa o valor que será enviado.

| Posição | Método | Informação |
|---|---|---|
| 1 | `getNome()` | Nome do fornecedor |
| 2 | `getFone()` | Telefone |
| 3 | `getEmail()` | E-mail |
| 4 | `getSite()` | Site |

Os métodos `getNome()`, `getFone()`, `getEmail()` e `getSite()` pertencem à classe `Fornecedor` e recuperam os valores armazenados no objeto.

**Executando o comando SQL**

```java
stmt.executeUpdate();
```

O método `executeUpdate()` executa comandos SQL que modificam os dados do banco.

É utilizado principalmente em operações como:

- `INSERT`: adicionar registros.
- `UPDATE`: atualizar registros.
- `DELETE`: excluir registros.

No nosso caso, ele executa o `INSERT`, adicionando o fornecedor à tabela.

**Fechando a conexão**

```java
stmt.close();
con.close();
```

Depois de executar o comando, fechamos o `PreparedStatement` e a conexão.

Isso libera os recursos utilizados pela aplicação.

**Tratamento de exceções**

```java
catch (Exception e) {
    System.out.println(2);
}
```

O `catch` captura possíveis erros que acontecerem dentro do bloco `try`.

Entretanto, imprimir apenas o número `2` não mostra qual foi o problema.

Uma forma mais útil de identificar o erro seria:

```java
catch (Exception e) {
    e.printStackTrace();
}
```

Assim, o Eclipse apresenta detalhes da exceção no console.

## Entendendo o CRUD

CRUD é uma sigla formada pelas quatro operações básicas utilizadas para manipular dados em um banco de dados.

| Letra | Operação | SQL | Finalidade |
|---|---|---|---|
| C | Create | `INSERT` | Criar ou adicionar registros. |
| R | Read | `SELECT` | Consultar registros. |
| U | Update | `UPDATE` | Atualizar registros. |
| D | Delete | `DELETE` | Excluir registros. |

Nesta etapa do projeto, estamos implementando a primeira operação: **Create**, responsável por adicionar fornecedores.

As demais operações serão implementadas posteriormente.

---

## Integrando o Controller à tela frmFornecedor

Agora vamos conectar a interface gráfica à classe responsável por salvar os dados no banco.

Para isso, precisamos criar dois objetos dentro do construtor de `frmFornecedor`.

**Importando as classes**

No início do arquivo `frmFornecedor.java`, adicione:

```java
import controller.FornecedorController;
import model.Fornecedor;
import utils.Validador;
```

Essas importações permitem utilizar o Controller, o Model e a classe de validação.

## Criando os objetos

Dentro do construtor `frmFornecedor()`, adicione:

```java
// OBJETO CONTROLLER
FornecedorController controller = new FornecedorController();

// OBJETO FORNECEDOR
Fornecedor fornecedor = new Fornecedor();
```

**Objeto Controller**

```java
FornecedorController controller = new FornecedorController();
```

Cria um objeto responsável por acessar os métodos de cadastro e demais operações do banco de dados.

**Objeto Fornecedor**

```java
Fornecedor fornecedor = new Fornecedor();
```

Cria um objeto que armazenará as informações digitadas pelo usuário.

O funcionamento será:

1. O usuário preenche os campos da tela.
2. Os valores são transferidos para o objeto `Fornecedor`.
3. O objeto é enviado ao `FornecedorController`.
4. O Controller executa o comando SQL.
5. O registro é inserido no banco de dados.

### 3.3. Aplicando a validação nos campos

Agora vamos configurar o limite de caracteres dos campos de texto.

No campo Nome:

```java
textNome.setDocument(new Validador(50));
```

No campo Telefone:

```java
textFone.setDocument(new Validador(20));
```

No campo E-mail:

```java
textEmail.setDocument(new Validador(50));
```

Cada linha associa um objeto `Validador` ao documento do respectivo campo.

Como estamos utilizando o construtor que recebe somente o limite, os campos utilizarão automaticamente o tipo `"texto"`.

**Observação:** apesar de o campo Telefone normalmente receber números, nesta configuração ele ainda aceita texto, pois estamos utilizando `new Validador(20)`, que define o tipo padrão como `"texto"`.

### Código da primeira versão de frmFornecedor

Nesta primeira etapa, a tela já possui os campos e suas respectivas validações, mas ainda não possui o botão de cadastro.

```java
package view;

import java.awt.Font;
import java.awt.Toolkit;

import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

import controller.FornecedorController;
import model.Fornecedor;
import utils.Validador;

public class frmFornecedor extends JDialog {

    private static final long serialVersionUID = 1L;

    private JLabel lblID;
    private JTextField textID;
    private JTextField textNome;
    private JLabel lblNome;
    private JTextField textFone;
    private JTextField textEmail;
    private JLabel lblFone;
    private JLabel lblEmail;
    private JTextField textSite;
    private JLabel lblSite;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {

        // USO DA BIBLIOTECA FLATLAF (SWING MODERNO)
        FlatDarkLaf.setup();

        try {
            frmFornecedor dialog = new frmFornecedor();
            dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
            dialog.setVisible(true);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Create the dialog.
     */
    public frmFornecedor() {

        setResizable(false);
        setTitle("Fornecedores");

        setIconImage(Toolkit.getDefaultToolkit().getImage(
                frmFornecedor.class.getResource("/img/fornecedor.jpg")));

        setBounds(100, 100, 680, 480);
        getContentPane().setLayout(null);

        // CENTRALIZAR A TELA AO ABRIR
        setLocationRelativeTo(null);

        // OBJETO CONTROLLER
        FornecedorController controller = new FornecedorController();

        // OBJETO FORNECEDOR
        Fornecedor fornecedor = new Fornecedor();

        lblID = new JLabel("ID");
        lblID.setEnabled(false);
        lblID.setFont(new Font("Arial", Font.BOLD, 14));
        lblID.setBounds(10, 11, 19, 17);
        getContentPane().add(lblID);

        textID = new JTextField();
        textID.setEnabled(false);
        textID.setBounds(29, 10, 96, 20);
        getContentPane().add(textID);
        textID.setColumns(10);

        lblNome = new JLabel("Nome");
        lblNome.setFont(new Font("Arial", Font.BOLD, 14));
        lblNome.setEnabled(false);
        lblNome.setBounds(10, 44, 48, 17);
        getContentPane().add(lblNome);

        textNome = new JTextField();
        textNome.setColumns(10);
        textNome.setBounds(57, 43, 281, 20);
        getContentPane().add(textNome);

        // VALIDAÇÃO DE NÚMERO MÁXIMO DE CARACTERES
        textNome.setDocument(new Validador(50));

        textFone = new JTextField();
        textFone.setColumns(10);
        textFone.setBounds(57, 71, 121, 20);
        getContentPane().add(textFone);
        textFone.setDocument(new Validador(20));

        lblFone = new JLabel("Fone");
        lblFone.setFont(new Font("Arial", Font.BOLD, 14));
        lblFone.setEnabled(false);
        lblFone.setBounds(10, 72, 48, 17);
        getContentPane().add(lblFone);

        lblEmail = new JLabel("Email");
        lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
        lblEmail.setEnabled(false);
        lblEmail.setBounds(10, 103, 48, 17);
        getContentPane().add(lblEmail);

        textEmail = new JTextField();
        textEmail.setColumns(10);
        textEmail.setBounds(57, 102, 281, 20);
        getContentPane().add(textEmail);
        textEmail.setDocument(new Validador(50));

        lblSite = new JLabel("Site");
        lblSite.setFont(new Font("Arial", Font.BOLD, 14));
        lblSite.setEnabled(false);
        lblSite.setBounds(10, 138, 32, 17);
        getContentPane().add(lblSite);

        textSite = new JTextField();
        textSite.setColumns(10);
        textSite.setBounds(57, 137, 281, 20);
        getContentPane().add(textSite);
    }
}
```

---

## Configurando o botão Adicionar

Agora vamos adicionar um botão responsável por cadastrar os fornecedores.

**Adicionando o botão pelo WindowBuilder**

Abra `frmFornecedor.java` e vá para a aba **Design**.

Na área de componentes:

1. Localize `JButton`.
2. Arraste o botão para a tela de fornecedores.
3. Procure um ícone de adicionar com resolução de 64 × 64 pixels.
4. Coloque a imagem na pasta `img` do projeto.
5. Selecione o botão e configure suas propriedades.

Configure:

| Propriedade | Valor |
|---|---|
| `text` | Deixe vazio. |
| `icon` | Selecione a imagem de adicionar. |
| `variable` | `btnAdicionar` |
| `toolTipText` | `Adicionar` |
| `cursor` | `HAND_CURSOR` |

A propriedade `variable` define o nome da variável que representa o botão no código.

O `toolTipText` mostra uma pequena descrição quando o usuário posiciona o mouse sobre o botão.

O `HAND_CURSOR` altera o cursor para o formato de uma mão, indicando que o componente pode ser clicado.

**Entendendo o ActionListener**

Para fazer o botão executar uma ação, precisamos adicionar um evento.

No WindowBuilder:

1. Clique com o botão direito no botão Adicionar.
2. Selecione **Add**.
3. Entre em **Events**.
4. Selecione **action**.
5. Clique em **actionPerformed**.

O Eclipse criará uma estrutura semelhante a esta:

```java
btnAdicionar.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {

        // CÓDIGO EXECUTADO AO CLICAR NO BOTÃO

    }
});
```

O `ActionListener` é responsável por escutar eventos de ação, como o clique em um botão.

O método `actionPerformed()` é executado quando o evento acontece.

Portanto, tudo que estiver dentro dele será executado quando o usuário clicar no botão.

---

## Configurando o botão Fornecedores e o botão Sobre no Main.java

Agora vamos melhorar a interação dos botões da tela principal.

Abra `Main.java` e vá para a aba **Design**.

Selecione o botão Fornecedores e configure:

| Propriedade | Valor |
|---|---|
| `cursor` | `HAND_CURSOR` |
| `toolTipText` | `Fornecedor` |

Faça o mesmo com o botão Sobre:

| Propriedade | Valor |
|---|---|
| `cursor` | `HAND_CURSOR` |
| `toolTipText` | `Sobre` |

Assim, os dois botões terão o mesmo comportamento visual de interação.

## Criando o evento do botão Fornecedores

Clique com o botão direito no botão Fornecedores.

Depois:

1. Selecione **Add**.
2. Entre em **Events**.
3. Selecione **action**.
4. Clique em **actionPerformed**.

Dentro do método criado, adicione:

```java
frmFornecedor fornecedor = new frmFornecedor();
fornecedor.setVisible(true);
```

**Entendendo os comandos**

```java
frmFornecedor fornecedor = new frmFornecedor();
```

Cria um novo objeto da classe `frmFornecedor`.

```java
fornecedor.setVisible(true);
```

Torna a janela visível para o usuário.

Assim, quando o usuário clicar no botão Fornecedores da tela principal, a janela de cadastro será aberta.

### Código completo de Main.java

```java
package view;

import java.awt.EventQueue;
import java.awt.Toolkit;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.swing.JFrame;
import javax.swing.JPanel;

import com.formdev.flatlaf.FlatLightLaf;

import database.Database;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.Color;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Cursor;

public class Main extends JFrame {

    private static final long serialVersionUID = 1L;

    private JPanel contentPane;
    private JLabel lblData;

    // CRIAÇÃO DO OBJETO PARA CONEXÃO COM O BANCO DE DADOS
    Database db = new Database();

    private JButton btnNewButton;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {

        // USO DA BIBLIOTECA FLATLAF (SWING MODERNO)
        FlatLightLaf.setup();

        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    Main frame = new Main();
                    frame.setVisible(true);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the frame.
     */
    public Main() {

        setTitle("BL-PDV");

        setIconImage(Toolkit.getDefaultToolkit().getImage(
                Main.class.getResource("/img/blpvd.png")));

        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 800, 600);

        contentPane = new JPanel();
        contentPane.setForeground(Color.RED);
        setContentPane(contentPane);
        contentPane.setLayout(null);

        JLabel lblDataBase = new JLabel("");
        lblDataBase.setIcon(new ImageIcon(
                Main.class.getResource("/img/banco.jpg")));
        lblDataBase.setBounds(10, 534, 20, 27);
        contentPane.add(lblDataBase);

        JLabel lblMysql = new JLabel("");
        lblMysql.setBounds(35, 534, 103, 27);
        contentPane.add(lblMysql);

        JLabel lblStatus = new JLabel("•");
        lblStatus.setHorizontalAlignment(SwingConstants.CENTER);
        lblStatus.setForeground(Color.RED);
        lblStatus.setFont(new Font("Tahoma", Font.PLAIN, 16));
        lblStatus.setBounds(135, 534, 20, 27);
        contentPane.add(lblStatus);

        JLabel lblCalendario = new JLabel("");
        lblCalendario.setIcon(new ImageIcon(
                Main.class.getResource("/img/calendario.jpg")));
        lblCalendario.setBounds(682, 0, 24, 36);
        contentPane.add(lblCalendario);

        lblData = new JLabel("");
        lblData.setBounds(710, 0, 64, 36);
        contentPane.add(lblData);

        JPanel panelLateral = new JPanel();
        panelLateral.setBorder(null);
        panelLateral.setBackground(new Color(72, 61, 139));
        panelLateral.setBounds(0, 0, 196, 538);
        contentPane.add(panelLateral);
        panelLateral.setLayout(null);

        JLabel lblLogo = new JLabel("");
        lblLogo.setIcon(new ImageIcon(
                Main.class.getResource("/img/blpvd.png")));
        lblLogo.setBounds(10, 11, 64, 54);
        panelLateral.add(lblLogo);

        JLabel lblBLPDV = new JLabel("BL-PDV");
        lblBLPDV.setForeground(new Color(240, 248, 255));
        lblBLPDV.setFont(new Font("Arial", Font.BOLD, 25));
        lblBLPDV.setBounds(85, 23, 101, 30);
        panelLateral.add(lblBLPDV);

        // BOTÃO FORNECEDOR
        JButton btnFornecedores = new JButton("Fornecedores");

        btnFornecedores.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

                frmFornecedor fornecedor = new frmFornecedor();
                fornecedor.setVisible(true);
            }
        });

        btnFornecedores.setToolTipText("Fornecedor");
        btnFornecedores.setCursor(
                Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        btnFornecedores.setBorderPainted(false);
        btnFornecedores.setForeground(new Color(0, 0, 0));
        btnFornecedores.setBackground(new Color(123, 104, 238));
        btnFornecedores.setFont(new Font("Arial", Font.BOLD, 15));

        btnFornecedores.setIcon(new ImageIcon(
                Main.class.getResource("/img/fornecedor.jpg")));

        btnFornecedores.setBounds(10, 102, 176, 41);
        panelLateral.add(btnFornecedores);

        JLabel lblSistema = new JLabel("Sistema de PDV");
        lblSistema.setForeground(new Color(255, 255, 255));
        lblSistema.setBounds(84, 45, 74, 30);
        panelLateral.add(lblSistema);

        JLabel lblNewLabel = new JLabel("-------------------------------------");
        lblNewLabel.setForeground(new Color(255, 255, 255));
        lblNewLabel.setBounds(18, 457, 168, 23);
        panelLateral.add(lblNewLabel);

        btnNewButton = new JButton("Sobre");

        btnNewButton.setToolTipText("Sobre");
        btnNewButton.setCursor(
                Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        // EVENTO BOTÃO SOBRE
        btnNewButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {

                // ABRIR TELA SOBRE
                Sobre sobre = new Sobre();
                sobre.setVisible(true);
            }
        });

        btnNewButton.setBackground(new Color(106, 90, 205));
        btnNewButton.setFont(new Font("Arial", Font.BOLD, 13));
        btnNewButton.setBorderPainted(false);
        btnNewButton.setHorizontalAlignment(SwingConstants.LEADING);

        btnNewButton.setIcon(new ImageIcon(
                Main.class.getResource("/img/sobre.jpg")));

        btnNewButton.setBounds(10, 479, 176, 48);
        panelLateral.add(btnNewButton);

        // VERIFICAR A CONEXÃO COM O BANCO DE DADOS
        if (db.testarConexao() == true) {

            System.out.println("Banco Conectado");

            lblMysql.setText("MySQL Conectado");
            lblStatus.setForeground(Color.GREEN);

        } else {

            System.out.println("Erro na Conexão");

            lblMysql.setText("MySQL Desconectado");
            lblStatus.setForeground(Color.RED);
        }

        // COMANDO O MÉTODO (FUNÇÃO) - atualizarData
        atualizarData();
    }

    // FUNÇÃO (MÉTODO) PARA ATUALIZAR A DATA DO SISTEMA
    private void atualizarData() {

        // OBTER A DATA DO SISTEMA OPERACIONAL
        DateTimeFormatter formatoData =
                DateTimeFormatter.ofPattern("dd/MM/yyyy");

        String data = LocalDate.now().format(formatoData);

        // ALTERAR O TEXTO DE lblData
        lblData.setText(data);
    }
}
```

**Entendendo o evento do botão Fornecedores**

O trecho principal é:

```java
btnFornecedores.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {

        frmFornecedor fornecedor = new frmFornecedor();
        fornecedor.setVisible(true);
    }
});
```

O funcionamento acontece da seguinte maneira:

1. `addActionListener()` registra um evento no botão.
2. `actionPerformed()` define o que será executado quando o botão for clicado.
3. `new frmFornecedor()` cria uma nova janela de fornecedores.
4. `setVisible(true)` exibe essa janela.

O botão Sobre utiliza a mesma lógica, mas cria um objeto da classe `Sobre`.

---

## Configurando a janela frmFornecedor como modal

Agora vamos alterar uma propriedade da janela de fornecedores.

Abra `frmFornecedor.java` e vá para a aba **Design**.

1. Clique na área principal da janela, não em um componente interno.
2. Na área de componentes, selecione `javax`.
3. Procure a propriedade `modal`.
4. Altere seu valor para `true`.
5. Volte para a aba **Source**.

O Eclipse deverá adicionar a seguinte linha ao construtor:

```java
setModal(true);
```

**O que significa uma janela modal?**

Uma janela modal impede que o usuário interaja com outras janelas da mesma aplicação enquanto ela estiver aberta.

No nosso projeto, isso significa que, ao abrir a janela Fornecedores, o usuário deverá finalizar ou fechar essa janela antes de voltar a utilizar a tela principal.

Isso é útil quando uma operação precisa ser concluída antes de continuar.

**Comparação:**

| Tipo de janela | Comportamento |
|---|---|
| Modal | Bloqueia a interação com outras janelas da aplicação. |
| Não modal | Permite utilizar outras janelas enquanto ela permanece aberta. |

No projeto BL-PDV, a janela de fornecedores será modal.

---

## Configurando a validação do campo Nome

Agora vamos modificar a linha de validação do campo Nome.

Antes:

```java
textNome.setDocument(new Validador(50));
```

Depois:

```java
textNome.setDocument(new Validador(50, "texto"));
```

A diferença é que agora estamos informando explicitamente o tipo de validação.

O resultado continua sendo um campo de texto com limite de 50 caracteres.

**Atenção à escrita:** em Java, a palavra-chave é `new`, sempre com letra minúscula. Portanto, `New Validador` está incorreto.

---

## Programando o botão Adicionar

Agora vamos implementar a parte mais importante desta etapa: o cadastro de fornecedores.

O objetivo é fazer com que o botão:

1. Verifique se o nome foi preenchido.
2. Verifique se o telefone foi preenchido.
3. Transfira as informações dos campos para o objeto `Fornecedor`.
4. Envie o objeto ao `FornecedorController`.
5. Mostre uma mensagem de confirmação.

**Importando as classes necessárias**

No início de `frmFornecedor.java`, adicione:

```java
import javax.swing.JOptionPane;
import javax.swing.JButton;
import javax.swing.ImageIcon;

import java.awt.Cursor;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
```

Essas classes são utilizadas para criar o botão, configurar seu comportamento e exibir mensagens.

| Classe | Finalidade |
|---|---|
| `JOptionPane` | Exibir caixas de diálogo e mensagens. |
| `JButton` | Criar botões. |
| `ImageIcon` | Exibir imagens e ícones. |
| `Cursor` | Alterar o formato do cursor do mouse. |
| `ActionListener` | Escutar eventos de ação. |
| `ActionEvent` | Representar o evento ocorrido. |

## Criando a variável do botão

Na declaração dos atributos da classe, adicione:

```java
private JButton btnAdicionar;
```

Essa variável representa o botão Adicionar.

## Criando o evento do botão

Dentro do construtor `frmFornecedor()`, depois da criação dos campos de texto, adicione:

```java
// EVENTO DO BOTÃO ADICIONAR
btnAdicionar = new JButton("");

btnAdicionar.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {

        if (textNome.getText().isBlank()) {

            JOptionPane.showMessageDialog(
                    null,
                    "Preencha o nome do fornecedor."
            );

            textNome.requestFocus();

        } else if (textFone.getText().isBlank()) {

            JOptionPane.showMessageDialog(
                    null,
                    "Preencha o telefone do fornecedor."
            );

        } else {

            // TRANSFERIR OS DADOS DA TELA PARA O OBJETO
            fornecedor.setNome(textNome.getText());
            fornecedor.setFone(textFone.getText());
            fornecedor.setEmail(textEmail.getText());
            fornecedor.setSite(textSite.getText());

            // ENVIAR O OBJETO PARA O CONTROLLER
            controller.Adicionar(fornecedor);

            // MENSAGEM DE CONFIRMAÇÃO
            JOptionPane.showMessageDialog(
                    null,
                    "Fornecedor adicionado com sucesso."
            );
        }
    }
});

btnAdicionar.setCursor(
        Cursor.getPredefinedCursor(Cursor.HAND_CURSOR)
);

btnAdicionar.setToolTipText("Adicionar");

btnAdicionar.setIcon(new ImageIcon(
        frmFornecedor.class.getResource("/img/adicionar.jpg")
));

btnAdicionar.setBounds(29, 338, 89, 73);

getContentPane().add(btnAdicionar);
```

**Entendendo a validação dos campos**

**Verificando o nome**

```java
if (textNome.getText().isBlank()) {
```

- `getText()`: recupera o conteúdo digitado no campo.
- `isBlank()`: verifica se a String está vazia ou contém somente espaços em branco.

Se o usuário não preencher o nome, a condição será verdadeira.

**Exibindo a mensagem**

```java
JOptionPane.showMessageDialog(
        null,
        "Preencha o nome do fornecedor."
);
```

O método `showMessageDialog()` exibe uma caixa de diálogo com uma mensagem.

O primeiro parâmetro representa a janela responsável pela mensagem. Quando utilizamos `null`, a mensagem não fica associada diretamente a uma janela específica.

O segundo parâmetro é o texto que será apresentado.

**Posicionando o cursor no campo**

```java
textNome.requestFocus();
```

O método `requestFocus()` solicita que o campo Nome receba o foco.

Isso permite que o usuário continue digitando diretamente no campo que precisa ser preenchido.

**Verificando o telefone**

```java
else if (textFone.getText().isBlank()) {
```

Se o nome estiver preenchido, o sistema verifica se o telefone está vazio.

Caso esteja, apresenta a mensagem:

```java
"Preencha o telefone do fornecedor."
```

O `else if` significa que essa segunda condição somente será verificada se a primeira condição for falsa.

## Transferindo os dados da tela para o objeto

Se o nome e o telefone estiverem preenchidos, o programa executará:

```java
fornecedor.setNome(textNome.getText());
fornecedor.setFone(textFone.getText());
fornecedor.setEmail(textEmail.getText());
fornecedor.setSite(textSite.getText());
```

Aqui acontece a transferência das informações da interface gráfica para o objeto `Fornecedor`.

Cada método `set` recebe o conteúdo de um campo.

| Campo da tela | Método utilizado |
|---|---|
| `textNome` | `setNome()` |
| `textFone` | `setFone()` |
| `textEmail` | `setEmail()` |
| `textSite` | `setSite()` |

Os métodos `setNome()`, `setFone()`, `setEmail()` e `setSite()` são *setters* da classe `Fornecedor`.

Eles permitem modificar os atributos privados do objeto.

**Exemplo prático:**

Imagine que o usuário digitou:

- Nome: Mercado Central.
- Telefone: 11999999999.
- E-mail: contato@mercadocentral.com.
- Site: www.mercadocentral.com.

Depois dos comandos `set`, o objeto `fornecedor` terá essas informações armazenadas em seus atributos.

## Enviando o objeto para o Controller

```java
controller.Adicionar(fornecedor);
```

Agora enviamos o objeto completo para o método `Adicionar()` da classe `FornecedorController`.

O Controller recebe os dados e utiliza o JDBC para executar o comando SQL no MySQL.

O caminho dos dados é:

```text
JTextField
    ↓
Objeto Fornecedor
    ↓
FornecedorController
    ↓
PreparedStatement
    ↓
MySQL
    ↓
Tabela fornecedores
```

Essa separação permite que a interface gráfica não precise executar diretamente os comandos SQL.

## Exibindo a mensagem de confirmação

```java
JOptionPane.showMessageDialog(
        null,
        "Fornecedor adicionado com sucesso."
);
```

Depois da chamada ao Controller, o programa apresenta uma mensagem informando que o fornecedor foi adicionado.

**Observação importante:** no código atual da aula, o método `Adicionar()` não retorna um resultado para a tela. Por isso, a mensagem pode aparecer mesmo se ocorrer algum erro durante a gravação no banco. Em uma versão mais completa do sistema, o Controller deverá retornar `true` ou `false` para confirmar se o cadastro realmente foi realizado.

---

### Código completo atualizado de frmFornecedor.java

Abaixo está o código reunindo a janela, os campos, as validações e o evento do botão Adicionar.

```java
package view;

import java.awt.Font;
import java.awt.Toolkit;

import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

import controller.FornecedorController;
import model.Fornecedor;
import utils.Validador;

import javax.swing.JButton;
import javax.swing.ImageIcon;

import java.awt.Cursor;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class frmFornecedor extends JDialog {

    private static final long serialVersionUID = 1L;

    private JLabel lblID;
    private JTextField textID;
    private JTextField textNome;
    private JLabel lblNome;
    private JTextField textFone;
    private JTextField textEmail;
    private JLabel lblFone;
    private JLabel lblEmail;
    private JTextField textSite;
    private JLabel lblSite;
    private JButton btnAdicionar;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {

        // USO DA BIBLIOTECA FLATLAF (SWING MODERNO)
        FlatDarkLaf.setup();

        try {

            frmFornecedor dialog = new frmFornecedor();

            dialog.setDefaultCloseOperation(
                    JDialog.DISPOSE_ON_CLOSE
            );

            dialog.setVisible(true);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Create the dialog.
     */
    public frmFornecedor() {

        setModal(true);
        setResizable(false);
        setTitle("Fornecedores");

        setIconImage(Toolkit.getDefaultToolkit().getImage(
                frmFornecedor.class.getResource("/img/fornecedor.jpg")
        ));

        setBounds(100, 100, 680, 480);
        getContentPane().setLayout(null);

        // CENTRALIZAR A TELA AO ABRIR
        setLocationRelativeTo(null);

        // OBJETO CONTROLLER
        FornecedorController controller = new FornecedorController();

        // OBJETO FORNECEDOR
        Fornecedor fornecedor = new Fornecedor();

        lblID = new JLabel("ID");
        lblID.setEnabled(false);
        lblID.setFont(new Font("Arial", Font.BOLD, 14));
        lblID.setBounds(10, 11, 19, 17);
        getContentPane().add(lblID);

        textID = new JTextField();
        textID.setEnabled(false);
        textID.setBounds(29, 10, 96, 20);
        getContentPane().add(textID);
        textID.setColumns(10);

        lblNome = new JLabel("Nome");
        lblNome.setFont(new Font("Arial", Font.BOLD, 14));
        lblNome.setEnabled(false);
        lblNome.setBounds(10, 44, 48, 17);
        getContentPane().add(lblNome);

        textNome = new JTextField();
        textNome.setColumns(10);
        textNome.setBounds(57, 43, 281, 20);
        getContentPane().add(textNome);

        // VALIDAÇÃO DE NÚMERO MÁXIMO DE CARACTERES
        textNome.setDocument(new Validador(50, "texto"));

        textFone = new JTextField();
        textFone.setColumns(10);
        textFone.setBounds(57, 71, 121, 20);
        getContentPane().add(textFone);
        textFone.setDocument(new Validador(20));

        lblFone = new JLabel("Fone");
        lblFone.setFont(new Font("Arial", Font.BOLD, 14));
        lblFone.setEnabled(false);
        lblFone.setBounds(10, 72, 48, 17);
        getContentPane().add(lblFone);

        lblEmail = new JLabel("Email");
        lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
        lblEmail.setEnabled(false);
        lblEmail.setBounds(10, 103, 48, 17);
        getContentPane().add(lblEmail);

        textEmail = new JTextField();
        textEmail.setColumns(10);
        textEmail.setBounds(57, 102, 281, 20);
        getContentPane().add(textEmail);
        textEmail.setDocument(new Validador(50));

        lblSite = new JLabel("Site");
        lblSite.setFont(new Font("Arial", Font.BOLD, 14));
        lblSite.setEnabled(false);
        lblSite.setBounds(10, 138, 32, 17);
        getContentPane().add(lblSite);

        textSite = new JTextField();
        textSite.setColumns(10);
        textSite.setBounds(57, 137, 281, 20);
        getContentPane().add(textSite);

        // EVENTO DO BOTÃO ADICIONAR
        btnAdicionar = new JButton("");

        btnAdicionar.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {

                if (textNome.getText().isBlank()) {

                    JOptionPane.showMessageDialog(
                            null,
                            "Preencha o nome do fornecedor."
                    );

                    textNome.requestFocus();

                } else if (textFone.getText().isBlank()) {

                    JOptionPane.showMessageDialog(
                            null,
                            "Preencha o telefone do fornecedor."
                    );

                } else {

                    // TRANSFERIR OS DADOS DA TELA PARA O OBJETO
                    fornecedor.setNome(textNome.getText());
                    fornecedor.setFone(textFone.getText());
                    fornecedor.setEmail(textEmail.getText());
                    fornecedor.setSite(textSite.getText());

                    // ENVIAR O OBJETO PARA O CONTROLLER
                    controller.Adicionar(fornecedor);

                    // MENSAGEM DE CONFIRMAÇÃO
                    JOptionPane.showMessageDialog(
                            null,
                            "Fornecedor adicionado com sucesso."
                    );
                }
            }
        });

        btnAdicionar.setCursor(
                Cursor.getPredefinedCursor(Cursor.HAND_CURSOR)
        );

        btnAdicionar.setToolTipText("Adicionar");

        btnAdicionar.setIcon(new ImageIcon(
                frmFornecedor.class.getResource("/img/adicionar.jpg")
        ));

        btnAdicionar.setBounds(29, 338, 89, 73);

        getContentPane().add(btnAdicionar);
    }
}
```

---

**Testando o cadastro de fornecedores**

Agora que a interface e o Controller estão conectados, vamos testar se os dados estão sendo gravados corretamente no banco de dados.

**Executando o sistema**

1. Abra `Main.java`.
2. Clique com o botão direito no arquivo.
3. Selecione **Run As → Java Application**.
4. Aguarde a abertura da tela principal do BL-PDV.

**Abrindo a tela de fornecedores**

Na tela principal:

1. Clique no botão **Fornecedores**.
2. A janela de cadastro será aberta.
3. Preencha os campos Nome, Telefone, E-mail e Site.
4. Clique no botão Adicionar.

Exemplo de cadastro:

| Campo | Informação |
|---|---|
| Nome | Mercado Central |
| Telefone | 11999999999 |
| E-mail | contato@mercadocentral.com |
| Site | www.mercadocentral.com |

Se o nome ou telefone estiver vazio, o sistema deverá apresentar uma mensagem solicitando o preenchimento.

Se os dois campos obrigatórios estiverem preenchidos, o sistema enviará os dados para o Controller.

## Verificando os dados no MySQL Workbench

Agora vamos conferir se o fornecedor realmente foi cadastrado.

1. Abra o MySQL Workbench.
2. Acesse a conexão criada anteriormente.
3. Abra uma nova aba de consulta SQL.
4. Execute:

```sql
USE blpdv;
```

Esse comando seleciona o banco de dados `blpdv`.

Depois, execute:

```sql
SELECT * FROM fornecedores;
```

O comando `SELECT` consulta os registros da tabela.

O `*` significa que queremos visualizar todas as colunas disponíveis.

Se o cadastro tiver sido realizado corretamente, o fornecedor deverá aparecer no resultado da consulta.

Exemplo de resultado esperado:

| idFornecedor | nome | fone | email | site |
|---|---|---|---|---|
| 1 | Mercado Central | 11999999999 | contato@mercadocentral.com | www.mercadocentral.com |

O valor de `idFornecedor` é preenchido automaticamente pelo banco de dados, pois a coluna foi criada com `AUTO_INCREMENT`.

**Entendendo o caminho completo do cadastro**

Essa etapa é importante porque conecta praticamente todas as partes do projeto.

```text
USUÁRIO
   |
   | Preenche os campos
   v
frmFornecedor.java
   |
   | Validador verifica as entradas
   |
   | Dados são transferidos pelos setters
   v
model.Fornecedor
   |
   | Objeto enviado ao Controller
   v
controller.FornecedorController
   |
   | Prepara o comando SQL
   | Preenche os parâmetros
   v
PreparedStatement
   |
   | Executa INSERT
   v
MySQL
   |
   v
Tabela fornecedores
```

Cada classe possui uma responsabilidade:

| Classe | Responsabilidade |
|---|---|
| `frmFornecedor` | Exibir a tela e receber os dados do usuário. |
| `Validador` | Controlar o conteúdo digitado nos campos. |
| `Fornecedor` | Armazenar os dados do fornecedor. |
| `FornecedorController` | Executar a operação de cadastro. |
| `Database` | Estabelecer a conexão com o banco de dados. |

---

**Observações importantes e boas práticas**

**A mensagem de sucesso não garante que o cadastro foi realizado**

No código atual, temos:

```java
controller.Adicionar(fornecedor);

JOptionPane.showMessageDialog(
        null,
        "Fornecedor adicionado com sucesso."
);
```

O problema é que `Adicionar()` possui retorno `void`.

Isso significa que a tela não recebe nenhuma informação sobre o resultado da operação.

Se o banco estiver desconectado ou ocorrer um erro no comando SQL, a mensagem de sucesso ainda poderá aparecer.

Em uma evolução futura, o método poderá retornar um valor booleano:

- `true`: cadastro realizado.
- `false`: cadastro não realizado.

Assim, a interface poderá apresentar a mensagem correta.

**Melhorando o tratamento de erros**

Atualmente, o Controller utiliza:

```java
catch (Exception e) {
    System.out.println(2);
}
```

Essa instrução não informa a causa do erro.

Uma alternativa melhor para identificar problemas durante os testes é:

```java
catch (Exception e) {
    e.printStackTrace();
}
```

Isso permite visualizar a exceção e sua origem no console do Eclipse.

**Utilizando try-with-resources**

Uma boa prática em JDBC é utilizar `try-with-resources` para fechar automaticamente os recursos utilizados.

Exemplo de implementação aprimorada:

```java
public boolean adicionar(Fornecedor fornecedor) {

    String sql = """
        INSERT INTO fornecedores (nome, fone, email, site)
        VALUES (?, ?, ?, ?)
    """;

    try (
        Connection con = database.conectar();
        PreparedStatement stmt = con.prepareStatement(sql)
    ) {

        if (con == null) {
            return false;
        }

        stmt.setString(1, fornecedor.getNome());
        stmt.setString(2, fornecedor.getFone());
        stmt.setString(3, fornecedor.getEmail());
        stmt.setString(4, fornecedor.getSite());

        return stmt.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
```

**Observação:** para utilizar essa versão, também será necessário ajustar o tratamento de uma conexão nula, pois o `try-with-resources` não aceita uma conexão inexistente como recurso. A implementação acima ilustra a ideia, mas a verificação de `null` deve ocorrer antes de criar o `PreparedStatement` em uma versão final.

O importante é entender que `try-with-resources` fecha automaticamente os recursos quando o bloco termina, mesmo se acontecer uma exceção.

**Limitações da validação atual**

A classe `Validador` foi criada para controlar a inserção de texto, mas existem alguns detalhes importantes:

- O telefone ainda aceita letras porque utiliza o tipo padrão `"texto"`.
- O campo E-mail limita a quantidade de caracteres, mas não verifica se o endereço possui formato válido.
- O campo Site não recebeu um `Validador` no código apresentado.
- O limite de caracteres precisa considerar situações como substituir um texto selecionado, não apenas inserir caracteres no final.
- A validação do campo não substitui a validação final antes de gravar no banco.

Essas melhorias podem ser implementadas em etapas posteriores.

---

## Guia rápido de memorização

| Recurso | Para que serve |
|---|---|
| `PlainDocument` | Controla o conteúdo de um documento de texto. |
| `insertString()` | Controla a inserção de caracteres. |
| `getLength()` | Retorna a quantidade de caracteres existentes. |
| `matches()` | Verifica se uma String corresponde a uma Regex. |
| `substring()` | Extrai uma parte de uma String. |
| `setDocument()` | Associa um documento ao campo de texto. |
| `PreparedStatement` | Prepara comandos SQL com parâmetros. |
| `setString()` | Preenche parâmetros do tipo String. |
| `executeUpdate()` | Executa comandos SQL que modificam dados. |
| `JOptionPane` | Exibe mensagens em caixas de diálogo. |
| `isBlank()` | Verifica se uma String está vazia ou contém somente espaços. |
| `requestFocus()` | Solicita foco para um componente. |
| `ActionListener` | Escuta eventos de ação. |
| `actionPerformed()` | Executa o código quando o evento acontece. |
| `setVisible(true)` | Torna uma janela visível. |
| `setModal(true)` | Define uma janela como modal. |
| `HAND_CURSOR` | Exibe o cursor em formato de mão. |

---

**Resumo Relâmpago**

1. A classe `Validador` herda de `PlainDocument` e controla o conteúdo digitado nos campos de texto.
2. O Validador permite estabelecer limites de caracteres e regras para texto, números inteiros e decimais.
3. A classe `FornecedorController` é responsável por executar as operações relacionadas ao cadastro no banco de dados.
4. O método `Adicionar()` recebe um objeto `Fornecedor` e utiliza JDBC para inserir seus dados no MySQL.
5. O `PreparedStatement` prepara o comando SQL e o `setString()` preenche seus parâmetros.
6. O `executeUpdate()` executa o comando `INSERT`, adicionando o fornecedor à tabela.
7. A tela `frmFornecedor` utiliza os objetos `FornecedorController` e `Fornecedor` para enviar os dados.
8. O botão Adicionar utiliza `ActionListener` para validar os campos e executar o cadastro.
9. O botão Fornecedores do `Main.java` abre a tela de cadastro, que foi configurada como modal.
10. O cadastro é conferido no MySQL Workbench utilizando `USE blpdv;` e `SELECT * FROM fornecedores;`.
