# Eventos de Interface, Integração com o Sistema Operacional, Formulário de Fornecedores e Padrão Model (Projeto BL-PDV)

**Visão Geral**

Nesta aula, avancei significativamente na interatividade da interface gráfica e na arquitetura do sistema **BL-PDV**.

Aprimorei a janela `Sobre.java` transformando a interface estática em uma tela interativa. Aprendi a programar eventos de clique: o botão `OK` agora encerra a janela usando o método `dispose()`, e o rótulo do GitHub funciona como um **hiperlink real**, invocando a classe `java.awt.Desktop` para abrir o navegador padrão do sistema operacional diretamente na URL do meu repositório.

Também integrei a janela `Sobre` à tela principal (`Main.java`), adicionando o evento de clique no botão "Sobre" do menu lateral.

Na segunda metade da aula, dei início ao módulo de cadastros do sistema:

1. criei a nova janela de diálogo `FrmFornecedor.java` (`JDialog`) com campos de texto (`JTextField`) e rótulos (`JLabel`) para manipular dados de fornecedores;
2. criei o novo pacote `model` e a classe JavaBean `Fornecedor.java`, aplicando o conceito de **Padrão Model** para mapear em memória os campos da tabela `fornecedores` do banco de dados MySQL.

---

**Entendendo o Conceito**

## Programação Orientada a Eventos (Event-Driven Programming)

Em interfaces gráficas, o código não roda de forma sequencial do início ao fim. O sistema entra em estado de espera (*Event Loop*) aguardando uma ação do usuário (clique do mouse, digitação no teclado, movimento da janela).

Quando o usuário clica em um componente, um **Evento** é disparado. Para responder a esse evento, registramos um **Listener** (ouvidor) no componente, que executa um bloco de código específico.

* **`ActionListener`:** Usado principalmente para cliques em botões (`JButton`).
* **`MouseListener` / `MouseAdapter`:** Usado para capturar interações do mouse (clique, passagem do ponteiro, clique duplo) em componentes que não são botões padrão, como um `JLabel`.

---

## Integração com a Área de Trabalho (`java.awt.Desktop`)

A classe `Desktop` do Java permite que a aplicação interaja diretamente com os aplicativos nativos do sistema operacional do cliente (navegador web padrão, leitor de e-mail ou gerenciador de arquivos).

> **Analogia da Secretária:** Imagine que sua aplicação Java é um executivo em uma reunião. Quando ele precisa abrir uma página da web, ele não constrói um navegador dentro da sua sala; ele apenas pede para a secretária (`Desktop.getDesktop()`) abrir o navegador que já está instalado no computador e navegar até o endereço desejado (`browse(uri)`).

---

## A Camada Model no Padrão MVC

O pacote `model` representa a camada de dados da aplicação. A classe `Fornecedor.java` é um **JavaBean** ou **DTO (Data Transfer Object)**. Ela não possui inteligência visual nem código de banco de dados; ela serve unicamente como um "container" trancado (atributos privados com Getters e Setters) para transportar as informações de um fornecedor entre a tela visual (`view`) e o banco de dados (`database`).

```
+------------------------------------+        +------------------------------------+
|            CAMADA VIEW             |        |            CAMADA MODEL            |
|       (frmFornecedor.java)         |        |          (Fornecedor.java)         |
|                                    |        |                                    |
| [TextID]    -> "1"                 |        | private int idFornecedor = 1;      |
| [TextNome]  -> "Empresa X"         | -----> | private String nome = "Empresa X"; |
| [TextFone]  -> "11 9999-9999"      |        | private String fone = "...";       |
|                                    |        | (Getters & Setters)                |
+------------------------------------+        +------------------------------------+

```

---

**Conceitos Fundamentais**

## O Método `dispose()`

Diferente de `System.exit(0)` (que encerra todo o programa Java e fecha todas as janelas), o método `dispose()` libera os recursos gráficos da janela atual e fecha **apenas a janela especificada**, mantendo as demais telas ativas.

## O Método `setLocationRelativeTo(null)`

Quando inserido no construtor de uma janela (`JFrame` ou `JDialog`), este comando instrui o sistema operacional a calcular as dimensões do monitor e posicionar a janela **exatamente no centro da tela**.

## As Classes `java.awt.Desktop` e `java.net.URI`

* **`URI` (Uniform Resource Identifier):** Representa e valida a sintaxe do endereço web (ex: `"[https://github.com/lbruss](https://github.com/lbruss)"`).
* **`Desktop.getDesktop().browse(uri)`:** Abre o navegador web padrão do SO e carrega a URI informada.

## Campos Desabilitados em Formulários (`setEnabled(false)`)

No formulário `FrmFornecedor`, o campo `textID` e seu rótulo foram configurados com `setEnabled(false)`. Isso impede que o operador digite um código manualmente, pois a chave primária (`idFornecedor`) é gerada automaticamente pelo banco de dados via `AUTO_INCREMENT`.

---

### Código / Exemplos Práticos

**Exemplo 1: Janela de Diálogo Interativa (`Sobre.java`)**

```java
package view;

import java.awt.Desktop;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.net.URI;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import com.formdev.flatlaf.FlatDarkLaf;

/**
 * Janela de diálogo 'Sobre' com interatividade de links e modo escuro.
 * 
 * @author Bruss Loza
 */
public class Sobre extends JDialog {

    private static final long serialVersionUID = 1L;

    /**
     * Execução de teste individual da janela Sobre.
     */
    public static void main(String[] args) {
        // Ativa o visual escuro do FlatLaf para testes
        FlatDarkLaf.setup();

        try {
            Sobre dialog = new Sobre();
            dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
            dialog.setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Construtor da janela Sobre.
     */
    public Sobre() {
        setTitle("Sobre");
        setIconImage(Toolkit.getDefaultToolkit().getImage(Sobre.class.getResource("/img/sobre.png")));
        setBounds(100, 100, 270, 370);
        getContentPane().setLayout(null);

        // Rótulos do Cabeçalho
        JLabel lblBLPDV = new JLabel("BL-PDV");
        lblBLPDV.setHorizontalAlignment(SwingConstants.CENTER);
        lblBLPDV.setFont(new Font("Arial", Font.BOLD, 15));
        lblBLPDV.setBounds(74, 11, 90, 24);
        getContentPane().add(lblBLPDV);

        JLabel lblDescricao = new JLabel("Sistema para gestão de estoque e PDV");
        lblDescricao.setFont(new Font("Arial", Font.BOLD, 12));
        lblDescricao.setBounds(10, 46, 235, 14);
        getContentPane().add(lblDescricao);

        JLabel lblAutor = new JLabel("Autor: Bruss Loza");
        lblAutor.setFont(new Font("Arial", Font.BOLD, 12));
        lblAutor.setBounds(10, 71, 150, 14);
        getContentPane().add(lblAutor);

        JLabel lblVersao = new JLabel("Versão 1.0");
        lblVersao.setFont(new Font("Arial", Font.BOLD, 14));
        lblVersao.setBounds(10, 96, 100, 14);
        getContentPane().add(lblVersao);

        // Ícones de Licença e Repositório
        JLabel lblMit = new JLabel("");
        lblMit.setIcon(new ImageIcon(Sobre.class.getResource("/img/mit.png")));
        lblMit.setBounds(10, 174, 32, 39);
        getContentPane().add(lblMit);

        JLabel lblGithub = new JLabel("");
        lblGithub.setIcon(new ImageIcon(Sobre.class.getResource("/img/github.png")));
        lblGithub.setBounds(10, 225, 32, 32);
        getContentPane().add(lblGithub);

        // Hiperlink do GitHub com Evento de Clique do Mouse
        JLabel lblRepositorio = new JLabel("github.com/lbruss");
        lblRepositorio.setFont(new Font("Tahoma", Font.PLAIN, 11));
        lblRepositorio.setBounds(50, 233, 150, 17);
        
        // Registra o evento de clique no rótulo
        lblRepositorio.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                link("https://github.com/lbruss");
            }
        });
        getContentPane().add(lblRepositorio);

        // Botão OK com Evento de Fechamento da Tela
        JButton btnOK = new JButton("OK");
        btnOK.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Descarta e fecha apenas a janela atual (Sobre)
                dispose();
            }
        });
        btnOK.setBounds(85, 285, 89, 23);
        getContentPane().add(btnOK);

        // Centraliza a janela no centro da tela ao abrir
        setLocationRelativeTo(null);
    }

    /**
     * Método utilitário para abrir URLs externas no navegador padrão do SO.
     * 
     * @param url Endereço web completo (ex: https://github.com/...)
     */
    private void link(String url) {
        Desktop desktop = Desktop.getDesktop();
        try {
            URI uri = new URI(url);
            desktop.browse(uri); // Abre a URI no navegador nativo
        } catch (Exception e) {
            System.err.println("Erro ao abrir o navegador: " + e.getMessage());
        }
    }
}

```

---

**Exemplo 2: Atualização da Tela Principal com Evento (`Main.java`)**

```java
package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import com.formdev.flatlaf.FlatLightLaf;
import database.Database;

/**
 * Janela Principal conectada às janelas secundárias através de eventos.
 */
public class Main extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;
    private JLabel lblData;
    private JButton btnSobre; // Promovido a atributo para gerenciar propriedades

    Database db = new Database();

    public static void main(String[] args) {
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

    public Main() {
        setTitle("BL-PDV");
        setIconImage(Toolkit.getDefaultToolkit().getImage(Main.class.getResource("/img/blpvd.png")));
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 800, 600);

        contentPane = new JPanel();
        contentPane.setForeground(Color.RED);
        setContentPane(contentPane);
        contentPane.setLayout(null);

        // Painel Lateral
        JPanel panelLateral = new JPanel();
        panelLateral.setBorder(null);
        panelLateral.setBackground(new Color(72, 61, 139));
        panelLateral.setBounds(0, 0, 196, 538);
        contentPane.add(panelLateral);
        panelLateral.setLayout(null);

        JLabel lblLogo = new JLabel("");
        lblLogo.setIcon(new ImageIcon(Main.class.getResource("/img/blpvd.png")));
        lblLogo.setBounds(10, 11, 64, 54);
        panelLateral.add(lblLogo);

        JLabel lblBLPDV = new JLabel("BL-PDV");
        lblBLPDV.setForeground(new Color(240, 248, 255));
        lblBLPDV.setFont(new Font("Arial", Font.BOLD, 25));
        lblBLPDV.setBounds(85, 23, 101, 30);
        panelLateral.add(lblBLPDV);

        JLabel lblSistema = new JLabel("Sistema de PDV");
        lblSistema.setForeground(new Color(255, 255, 255));
        lblSistema.setBounds(84, 45, 100, 30);
        panelLateral.add(lblSistema);

        JButton btnFornecedores = new JButton("Fornecedores");
        btnFornecedores.setBorderPainted(false);
        btnFornecedores.setForeground(Color.BLACK);
        btnFornecedores.setBackground(new Color(123, 104, 238));
        btnFornecedores.setFont(new Font("Arial", Font.BOLD, 15));
        btnFornecedores.setIcon(new ImageIcon(Main.class.getResource("/img/fornecedor.png")));
        btnFornecedores.setBounds(10, 102, 176, 41);
        panelLateral.add(btnFornecedores);

        JLabel lblDivisor = new JLabel("-------------------------------------");
        lblDivisor.setForeground(Color.WHITE);
        lblDivisor.setBounds(18, 457, 168, 23);
        panelLateral.add(lblDivisor);

        // Botão Sobre com evento configurado
        btnSobre = new JButton("Sobre");
        btnSobre.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Instancia e abre a janela de diálogo Sobre
                Sobre sobre = new Sobre();
                sobre.setVisible(true);
            }
        });
        btnSobre.setBackground(new Color(106, 90, 205));
        btnSobre.setFont(new Font("Arial", Font.BOLD, 13));
        btnSobre.setBorderPainted(false);
        btnSobre.setHorizontalAlignment(SwingConstants.LEADING);
        btnSobre.setIcon(new ImageIcon(Main.class.getResource("/img/sobre.png")));
        btnSobre.setBounds(10, 479, 176, 48);
        panelLateral.add(btnSobre);

        // Rodapé de Status do Banco
        JLabel lblDataBase = new JLabel("");
        lblDataBase.setIcon(new ImageIcon(Main.class.getResource("/img/banco.png")));
        lblDataBase.setBounds(206, 534, 20, 27);
        contentPane.add(lblDataBase);

        JLabel lblMysql = new JLabel("");
        lblMysql.setBounds(231, 534, 130, 27);
        contentPane.add(lblMysql);

        JLabel lblStatus = new JLabel("•");
        lblStatus.setHorizontalAlignment(SwingConstants.CENTER);
        lblStatus.setForeground(Color.RED);
        lblStatus.setFont(new Font("Tahoma", Font.PLAIN, 16));
        lblStatus.setBounds(365, 534, 20, 27);
        contentPane.add(lblStatus);

        // Cabeçalho de Data
        JLabel lblCalendario = new JLabel("");
        lblCalendario.setIcon(new ImageIcon(Main.class.getResource("/img/calendario.png")));
        lblCalendario.setBounds(682, 0, 24, 36);
        contentPane.add(lblCalendario);

        lblData = new JLabel("");
        lblData.setBounds(710, 0, 70, 36);
        contentPane.add(lblData);

        if (db.testarConexao()) {
            lblMysql.setText("MySQL Conectado");
            lblStatus.setForeground(Color.GREEN);
        } else {
            lblMysql.setText("MySQL Desconectado");
            lblStatus.setForeground(Color.RED);
        }

        atualizarData();
    }

    private void atualizarData() {
        DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String data = LocalDate.now().format(formatoData);
        lblData.setText(data);
    }
}

```

---

**Exemplo 3: Formulário de Cadastro de Fornecedores (`FrmFornecedor.java`)**

```java
package view;

import java.awt.Font;
import java.awt.Toolkit;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

/**
 * Interface gráfica (Formulário) para o Cadastro de Fornecedores.
 */
public class FrmFornecedor extends JDialog {

    private static final long serialVersionUID = 1L;
    
    // Componentes de entrada de texto declarados como atributos
    private JTextField textID;
    private JTextField textNome;
    private JTextField textFone;
    private JTextField textEmail;
    private JTextField textSite;

    public static void main(String[] args) {
        FlatDarkLaf.setup();

        try {
            FrmFornecedor dialog = new FrmFornecedor();
            dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
            dialog.setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public FrmFornecedor() {
        setResizable(false);
        setTitle("Fornecedores");
        setIconImage(Toolkit.getDefaultToolkit().getImage(FrmFornecedor.class.getResource("/img/fornecedor.png")));
        setBounds(100, 100, 680, 480);
        getContentPane().setLayout(null);
        setLocationRelativeTo(null); // Centraliza na tela

        // Campo ID (Desabilitado)
        JLabel lblID = new JLabel("ID");
        lblID.setEnabled(false);
        lblID.setFont(new Font("Arial", Font.BOLD, 14));
        lblID.setBounds(10, 11, 30, 17);
        getContentPane().add(lblID);

        textID = new JTextField();
        textID.setEnabled(false); // Impede edição direta do operador
        textID.setBounds(57, 10, 96, 20);
        getContentPane().add(textID);
        textID.setColumns(10);

        // Campo Nome
        JLabel lblNome = new JLabel("Nome");
        lblNome.setFont(new Font("Arial", Font.BOLD, 14));
        lblNome.setBounds(10, 44, 48, 17);
        getContentPane().add(lblNome);

        textNome = new JTextField();
        textNome.setColumns(10);
        textNome.setBounds(57, 43, 281, 20);
        getContentPane().add(textNome);

        // Campo Fone
        JLabel lblFone = new JLabel("Fone");
        lblFone.setFont(new Font("Arial", Font.BOLD, 14));
        lblFone.setBounds(10, 72, 48, 17);
        getContentPane().add(lblFone);

        textFone = new JTextField();
        textFone.setColumns(10);
        textFone.setBounds(57, 71, 150, 20);
        getContentPane().add(textFone);

        // Campo Email
        JLabel lblEmail = new JLabel("Email");
        lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
        lblEmail.setBounds(10, 103, 48, 17);
        getContentPane().add(lblEmail);

        textEmail = new JTextField();
        textEmail.setColumns(10);
        textEmail.setBounds(57, 102, 281, 20);
        getContentPane().add(textEmail);

        // Campo Site
        JLabel lblSite = new JLabel("Site");
        lblSite.setFont(new Font("Arial", Font.BOLD, 14));
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

**Exemplo 4: Classe de Modelo de Dados (`Fornecedor.java`)**

```java
package model;

/**
 * JavaBean que representa o Modelo de Dados da tabela 'fornecedores'.
 * 
 * @author Bruss Loza
 */
public class Fornecedor {

    // Atributos privados correspondentes às colunas da tabela MySQL
    private int idFornecedor;
    private String nome;
    private String fone;
    private String email;
    private String site;

    // --- GETTERS E SETTERS ---

    public int getIdFornecedor() {
        return idFornecedor;
    }

    public void setIdFornecedor(int idFornecedor) {
        this.idFornecedor = idFornecedor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getFone() {
        return fone;
    }

    public void setFone(String fone) {
        this.fone = fone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }
}

```

---

**Desmontando o Código**

**Desmontando a Abertura de Link Web (`link(String url)`)**

```java
private void link(String url) {
    Desktop desktop = Desktop.getDesktop();
    try {
        URI uri = new URI(url);
        desktop.browse(uri);
    } catch (Exception e) {
        System.out.println(e);
    }
}

```

1. **`Desktop desktop = Desktop.getDesktop();`**: Obtém a instância compartilhada da área de trabalho do sistema operacional atual.
2. **`URI uri = new URI(url);`**: Valida a String `"[https://github.com/lbruss](https://github.com/lbruss)"` e constrói um objeto do tipo `URI`.
3. **`desktop.browse(uri);`**: Solicita ao SO que inicie a aplicação associada ao protocolo `https://` (o navegador padrão).
4. **`try-catch`**: É obrigatório porque a conversão da URI pode lançar a exceção `URISyntaxException` ou o SO pode não suportar a ação (`IOException`).

---

**Desmontando o Fechamento da Janela com `dispose()`**

```java
btnOK.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
        dispose();
    }
});

```

1. **`btnOK.addActionListener(...)`**: Anexa um listener de evento de clique ao botão OK.
2. **`actionPerformed(ActionEvent e)`**: Método executado automaticamente no instante do clique.
3. **`dispose();`**: Destrói o objeto da janela `Sobre` e libera a memória alocada, deixando a janela `Main` aberta em segundo plano.

---

**Passo a Passo**

**Passo a Passo 1: Adicionando Evento de Mouse no Rótulo do GitHub no WindowBuilder**

1. Na aba **Design** do arquivo `Sobre.java`, selecione o rótulo `lblRepositorio`.
2. Clique com o botão direito sobre ele ➔ **Add event handler** ➔ **mouse** ➔ **mouseClicked**.
3. O Eclipse criará o método `mouseClicked(MouseEvent e)` no código-fonte.
4. Dentro do método gerado, insira a chamada: `link("[https://github.com/lbruss](https://github.com/lbruss)");`.

---

**Passo a Passo 2: Criando o Formulário `FrmFornecedor` no Eclipse**

1. Clique com o botão direito no pacote `view` ➔ **New** ➔ **Other...** ➔ **WindowBuilder** ➔ **Swing Designer** ➔ **JDialog**.
2. Defina o nome como `FrmFornecedor` (seguindo a convenção *PascalCase*).
3. Na aba **Design**:
* Defina as dimensões da janela para **680 x 480**.
* Configure `resizable = false` e defina a imagem de ícone `fornecedor.png`.
* Mude o layout do `getContentPane()` para **`absolute`**.


4. **Criando os Campos do Formulário:**
* Adicione `lblID` e `textID`. Selecione ambos e marque a propriedade `enabled` como **`false`**.
* Adicione os pares de `JLabel` e `JTextField` para: `Nome`, `Fone`, `Email` e `Site`.

---

**Passo a Passo 3: Criando a Camada Model (`Fornecedor.java`)**

1. No painel *Package Explorer*, clique com o botão direito na pasta `src` ➔ **New** ➔ **Package**.
2. Nomeie o pacote como **`model`**.
3. Clique com o botão direito no pacote `model` ➔ **New** ➔ **Class**.
4. Nomeie a classe como **`Fornecedor`**.
5. Declare os atributos privados com os mesmos nomes das colunas da tabela MySQL (`idFornecedor`, `nome`, `fone`, `email`, `site`).
6. Gere os métodos Getters e Setters (*Botão direito no editor ➔ Source ➔ Generate Getters and Setters*).

---

## Tabelas Comparativas

**`ActionListener` vs. `MouseAdapter`**

| Recurso | `ActionListener` | `MouseAdapter` / `MouseListener` |
| --- | --- | --- |
| **Foco de Uso** | Botões (`JButton`), Menus (`JMenuItem`). | Componentes genéricos (`JLabel`, `JPanel`, Imagens). |
| **Evento Principal** | Clique de ação padrão (`actionPerformed`). | Múltiplos eventos de mouse (`mouseClicked`, `mouseEntered`, `mouseExited`). |
| **Uso Comum no PDV** | Disparar ações de botões como "Salvar" ou "OK". | Transformar textos e imagens em links clicáveis. |

---

**Ações de Encerramento de Janela**

| Comando | O que faz no Sistema? | Aplicação Ideal |
| --- | --- | --- |
| **`dispose()`** | Destrói **apenas a janela atual**, mantendo as demais abertas. | Janelas secundárias (`JDialog`) como "Sobre" e "Cadastro". |
| **`setVisible(false)`** | Apenas **oculta a janela** da tela, mas mantém o objeto na memória RAM. | Janelas que precisam ser reaproveitadas rapidamente sem recalcular componentes. |
| **`System.exit(0)`** | **Encerra totalmente a JVM** e mata a aplicação inteira. | Botão de Sair da Tela Principal (`JFrame`). |

---

## Erros Comuns e Cuidados

**Nomenclatura de Classes Java (`frmFornecedor` vs `FrmFornecedor`)**

Na convenção oficial da linguagem Java, todas as classes devem começar obrigatoriamente com **letra maiúscula** (*PascalCase*).

* **Incorreto:** `public class frmFornecedor extends JDialog`
* **Correto:** `public class FrmFornecedor extends JDialog`

**Esquecer de Tratar Exceções ao Usar `Desktop.getDesktop()`**

Tentar abrir uma URL sem o bloco `try-catch` gerará erro de compilação, pois o método `.browse()` dispara exceções checadas (`IOException` e `URISyntaxException`).

---

## 9. Correções Técnicas das Minhas Anotações

Durante a revisão do meu rascunho de aula, apliquei as seguintes correções silenciosas:

1. **Nomenclatura da Classe `FrmFornecedor`:** No rascunho original, a classe do formulário foi grafada com inicial minúscula (`frmFornecedor`). Ajustei o nome da classe para **`FrmFornecedor`** (em *PascalCase*), alinhando com as convenções da linguagem Java.
2. **Extensões de Imagem na Pasta `img`:** No rascunho original, os arquivos de imagem variavam entre `.jpg` e `.png`. Padronizei as referências de código para buscar as imagens oficiais com a extensão `.png`.
3. **Nomenclatura de Pacotes:** Garanti a consistência de todos os pacotes em letras minúsculas (`view`, `database` e `model`).

---

## 10. Conteúdo Complementar e Aprofundamento

### Aprofundando a Arquitetura MVC (Model-View-Controller)

Com a criação do pacote `model`, iniciamos a estruturação de um sistema profissional em **camadas**:

1. **`view` (Visão):** Contém as janelas `Main.java`, `Sobre.java` e `FrmFornecedor.java`. Responsável apenas pela interface visual e interação com o usuário.
2. **`model` (Modelo):** Contém a classe `Fornecedor.java`. Responsável pela representação dos dados na memória.
3. **`database` (Persistência / DAO):** Contém a classe `Database.java`. Responsável por conversar diretamente com o servidor MySQL.

Essa separação impede que o código de banco de dados fique misturado com os botões da tela, facilitando modificações futuras sem quebrar a interface gráfica.

---

## Resumo Relâmpago — 10 Linhas

1. O método `dispose()` fecha e libera os recursos da janela atual sem encerrar o programa.
2. O comando `setLocationRelativeTo(null)` centraliza a janela no meio da tela do monitor.
3. Eventos de botões são capturados via `ActionListener` através do método `actionPerformed()`.
4. Eventos em componentes de texto ou imagem utilizam o escutador `MouseAdapter` com `mouseClicked()`.
5. A classe `java.awt.Desktop` permite abrir o navegador nativo do SO a partir de uma `URI`.
6. O botão "Sobre" na janela `Main` foi conectado para instanciar e exibir a caixa `Sobre`.
7. A janela `FrmFornecedor` (`JDialog`) foi criada para receber os dados cadastrais de fornecedores.
8. Campos de chave primária (`textID`) recebem `setEnabled(false)` por serem autoincrementados pelo banco.
9. O pacote `model` armazena as classes JavaBeans que mapeiam as tabelas da base de dados.
10. A classe `Fornecedor.java` utiliza atributos privados com Getters e Setters para proteger o transporte dos dados.

---

## Guia Rápido de Memorização

### Abrir URL Externa no Navegador

```java
Desktop.getDesktop().browse(new URI("https://github.com/lbruss"));

```

### Fechar Janela Secundária

```java
dispose();

```

### Centralizar Janela na Tela

```java
setLocationRelativeTo(null);

```
