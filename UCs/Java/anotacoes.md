# Validação de Campos (PlainDocument), Camada Controller (CRUD) e Inserção de Dados via JDBC (Projeto BL-PDV)

**Visão Geral**

Nesta aula, dei um salto fundamental na arquitetura do sistema **BL-PDV**: implementei a camada de negócio (**Controller**) e conectei o formulário de fornecedores ao banco de dados MySQL para realizar a primeira operação de um **CRUD** (Create, Read, Update, Delete) — a **inserção de dados (Create)**.

Para garantir a integridade dos dados antes mesmo que eles cheguem ao banco, criei uma classe utilitária personalizada (`Validador`) que estende `PlainDocument`. Ela limita a quantidade máxima de caracteres e restringe o tipo de dado digitado nos campos de texto (`JTextField`).

Além disso:

1. criei a classe `FornecedorController` no pacote `controller`, utilizando `PreparedStatement` com comandos SQL parametrizados para evitar falhas de segurança;
2. conectei a tela `FrmFornecedor` à camada Controller, adicionando validações de campos obrigatórios com `isBlank()` e `requestFocus()`;
3. configurei a janela do formulário para o modo **modal** (`setModal(true)`), bloqueando a janela principal enquanto o cadastro está aberto;
4. aprimorei a experiência do usuário (UX) adicionando o cursor em formato de mãozinha (`HAND_CURSOR`) e textos de dica (`ToolTipText`) nos botões;
5. validei a persistência dos dados realizando consultas `SELECT * FROM fornecedores;` no **MySQL Workbench**.

---

**Entendendo o Conceito**

## Validação de Entrada com `PlainDocument`

No Java Swing, o comportamento padrão de um `JTextField` permite que o usuário digite quantos caracteres quiser. Se o campo de telefone no banco de dados suporta no máximo 20 caracteres e o usuário digitar 25, o banco disparará uma exceção de estouro de limite (*Data truncation*).

Para evitar isso, usamos a classe `PlainDocument`. Ela intercepta cada caractere **antes** de ele ser desenhado na tela.

> **Analogia da Catraca Inteligente:**
O `PlainDocument` funciona como uma catraca com contador e detector de metal na entrada de um evento. Se a catraca atingir o limite de pessoas (número máximo de caracteres) ou detectar um item não permitido (letras onde só deveriam entrar números), a catraca simplesmente não gira e a entrada é bloqueada na hora.

---

## O Padrão MVC em Ação (Model-View-Controller)

Nesta aula, a arquitetura em três camadas do sistema ficou totalmente funcional:

```
+---------------------+           +---------------------+           +--------------------------+
|     CAMADA VIEW     |  (Objeto) |    CAMADA MODEL     |  (Objeto) |    CAMADA CONTROLLER     |
|   (FrmFornecedor)   | --------> |    (Fornecedor)     | --------> |  (FornecedorController)  |
|  [Interface Visual] |           | [Transporte Dados]  |           |   [Regra de Negócio/SQL] |
+---------------------+           +---------------------+           +--------------------------+
                                                                                  |
                                                                                  | (PreparedStatement)
                                                                                  v
                                                                    +--------------------------+
                                                                    |     BANCO DE DADOS       |
                                                                    |     (MySQL - blpdv)      |
                                                                    +--------------------------+

```

1. **View (`FrmFornecedor`):** Captura os dados digitados nos campos, valida se os obrigatórios foram preenchidos e monta o objeto `Fornecedor`.
2. **Model (`Fornecedor`):** Carrega os dados encapsulados via Getters e Setters.
3. **Controller (`FornecedorController`):** Recebe o objeto Model, abre a conexão com o banco, monta a query SQL parametrizada (`?`) e executa o salvamento.

---

## Segurança no Banco com `PreparedStatement`

Em vez de concatenar Strings diretamente no SQL (ex: `"INSERT INTO ... VALUES ('" + nome + "')"`), utilizamos a interface **`PreparedStatement`** com curingas (`?`).

> **Analogia dos Envelopes Numerados:**
Imaginar a instrução SQL com `?` é como enviar uma carta para o banco de dados com envelopes numerados lacrados (`?1`, `?2`, `?3`, `?4`). O banco compila o comando SQL primeiro e só depois insere o conteúdo dos envelopes nas posições certas. Isso impede que comandos maliciosos digitados pelo usuário sejam executados como código SQL (**Prevenção contra SQL Injection**).

---

**Conceitos Fundamentais**

## Interceptação via `insertString()`

O método `insertString(int ofs, String str, AttributeSet a)` da classe `PlainDocument` é disparado sempre que um novo caractere é inserido no campo. Se chamarmos `super.insertString()`, o texto é aceito e exibido; se dermos um `return` antecipado, o caractere é descartado.

## Expressões Regulares (RegEx) para Filtros

Utilizamos expressões regulares no `Validador` para verificar a validade da digitação:

* **`str.matches("[0-9]+")`**: Permite apenas números inteiros de 0 a 9.
* **`novoTexto.matches("[0-9]*([,.][0-9]*)?")`**: Permite apenas números com no máximo um separador decimal (ponto ou vírgula).

## Validação com `isBlank()` e `requestFocus()`

* **`text.getText().isBlank()`**: Verifica se o campo está vazio ou se contém apenas espaços em branco (recurso do Java 11+).
* **`text.requestFocus()`**: Coloca o cursor de digitação piscando diretamente dentro do campo incorreto, melhorando a agilidade do operador.

## Janelas Modais (`setModal(true)`)

Ao definir `setModal(true)` em um `JDialog`, a janela assume controle total. O usuário fica impossibilitado de clicar na janela principal (`Main`) atrás dela até que a janela modal seja fechada.

---

### Código / Exemplos Práticos

**Arquivo 1: Classe Utilitária de Validação de Campos (`Validador.java`)**

```java
package utils;

import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.PlainDocument;

/**
 * Classe utilitária para limitação de caracteres e filtro de tipos em JTextFields.
 * 
 * @author Bruss Loza
 */
public class Validador extends PlainDocument {

    private static final long serialVersionUID = 1L;
    private int limite;
    private String tipo;

    /**
     * Construtor para limitação simples de caracteres (tipo padrão: texto).
     * 
     * @param limite Quantidade máxima de caracteres permitidos
     */
    public Validador(int limite) {
        super();
        this.limite = limite;
        this.tipo = "texto";
    }

    /**
     * Construtor para limitação de caracteres e tipo específico.
     * 
     * @param limite Quantidade máxima de caracteres
     * @param tipo Tipo de validação ("texto", "inteiro", "decimal")
     */
    public Validador(int limite, String tipo) {
        super();
        this.limite = limite;
        this.tipo = tipo;
    }

    @Override
    public void insertString(int ofs, String str, AttributeSet a) throws BadLocationException {
        // Se o texto inserido for nulo, encerra a execução
        if (str == null) {
            return;
        }

        // Verifica se o tamanho atual + novo texto excede o limite estipulado
        if (getLength() + str.length() > limite) {
            return;
        }

        // Validação por tipo de conteúdo
        if (tipo.equals("texto")) {
            super.insertString(ofs, str, a);
            
        } else if (tipo.equals("inteiro")) {
            // Aceita somente dígitos numéricos de 0 a 9 (não aceita números negativos)
            if (str.matches("[0-9]+")) {
                super.insertString(ofs, str, a);
            }
            
        } else if (tipo.equals("decimal")) {
            // Monta o texto como ficaria após a inserção para validar a máscara
            String textoAtual = getText(0, getLength());
            String novoTexto = textoAtual.substring(0, ofs) + str + textoAtual.substring(ofs);

            // Permite dígitos e apenas um ponto ou vírgula como separador decimal
            if (novoTexto.matches("[0-9]*([,.][0-9]*)?")) {
                super.insertString(ofs, str, a);
            }
        }
    }
}

```

---

**Arquivo 2: Camada Controller do Fornecedor (`FornecedorController.java`)**

```java
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.Database;
import model.Fornecedor;

/**
 * Classe responsável por intermediar as regras de negócio e operações CRUD de Fornecedores.
 * 
 * @author Bruss Loza
 */
public class FornecedorController {

    // Instanciação da classe de banco de dados
    private Database database = new Database();

    // =========================================================================
    // MÉTODO CRUD: ADICIONAR FORNECEDOR
    // =========================================================================
    
    /**
     * Insere um novo registro de Fornecedor na tabela 'fornecedores' do MySQL.
     * 
     * @param fornecedor Objeto Model preenchido com os dados da tela
     */
    public void adicionar(Fornecedor fornecedor) {
        // SQL com parâmetros posicionais (?) para prevenção de SQL Injection
        String sql = """
            INSERT INTO fornecedores (nome, fone, email, site) VALUES (?, ?, ?, ?)
            """;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            // Substituição dos parâmetros ? pelos valores do objeto Model
            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getFone());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getSite());

            // Executa o comando de inserção no banco de dados
            stmt.executeUpdate();

            // Encerra os recursos de conexão
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.err.println("Erro ao adicionar fornecedor no banco: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

```

---

**Arquivo 3: Formulário de Cadastro de Fornecedor (`FrmFornecedor.java`)**

```java
package view;

import java.awt.Cursor;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

import controller.FornecedorController;
import model.Fornecedor;
import utils.Validador;

/**
 * Formulário Modal para Cadastro de Fornecedores.
 */
public class FrmFornecedor extends JDialog {

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
     * Teste de execução direta da janela.
     */
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

    /**
     * Construtor da tela de fornecedores.
     */
    public FrmFornecedor() {
        setModal(true); // Bloqueia a janela principal enquanto esta estiver aberta
        setResizable(false);
        setTitle("Fornecedores");
        setIconImage(Toolkit.getDefaultToolkit().getImage(FrmFornecedor.class.getResource("/img/fornecedor.png")));
        setBounds(100, 100, 680, 480);
        getContentPane().setLayout(null);
        setLocationRelativeTo(null); // Centraliza a janela na tela

        // Instanciação dos objetos da camada MVC
        FornecedorController controller = new FornecedorController();
        Fornecedor fornecedor = new Fornecedor();

        // Componentes do Campo ID
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

        // Componentes do Campo Nome + Validação
        lblNome = new JLabel("Nome");
        lblNome.setFont(new Font("Arial", Font.BOLD, 14));
        lblNome.setBounds(10, 44, 48, 17);
        getContentPane().add(lblNome);

        textNome = new JTextField();
        textNome.setColumns(10);
        textNome.setBounds(57, 43, 281, 20);
        getContentPane().add(textNome);
        textNome.setDocument(new Validador(50, "texto")); // Máximo 50 caracteres

        // Componentes do Campo Fone + Validação
        lblFone = new JLabel("Fone");
        lblFone.setFont(new Font("Arial", Font.BOLD, 14));
        lblFone.setBounds(10, 72, 48, 17);
        getContentPane().add(lblFone);

        textFone = new JTextField();
        textFone.setColumns(10);
        textFone.setBounds(57, 71, 121, 20);
        getContentPane().add(textFone);
        textFone.setDocument(new Validador(20)); // Máximo 20 caracteres

        // Componentes do Campo Email + Validação
        lblEmail = new JLabel("Email");
        lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
        lblEmail.setBounds(10, 103, 48, 17);
        getContentPane().add(lblEmail);

        textEmail = new JTextField();
        textEmail.setColumns(10);
        textEmail.setBounds(57, 102, 281, 20);
        getContentPane().add(textEmail);
        textEmail.setDocument(new Validador(50)); // Máximo 50 caracteres

        // Componentes do Campo Site
        lblSite = new JLabel("Site");
        lblSite.setFont(new Font("Arial", Font.BOLD, 14));
        lblSite.setBounds(10, 138, 32, 17);
        getContentPane().add(lblSite);

        textSite = new JTextField();
        textSite.setColumns(10);
        textSite.setBounds(57, 137, 281, 20);
        getContentPane().add(textSite);

        // BOTÃO ADICIONAR E EVENTO DE SALVAMENTO
        btnAdicionar = new JButton("");
        btnAdicionar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Validação de campos obrigatórios
                if (textNome.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o nome do fornecedor.");
                    textNome.requestFocus(); // Aponta o foco para o campo Nome
                } else if (textFone.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o telefone do fornecedor.");
                    textFone.requestFocus();
                } else {
                    // Transferência dos dados da tela para o objeto Model
                    fornecedor.setNome(textNome.getText());
                    fornecedor.setFone(textFone.getText());
                    fornecedor.setEmail(textEmail.getText());
                    fornecedor.setSite(textSite.getText());

                    // Envio do objeto Model para a camada Controller
                    controller.adicionar(fornecedor);

                    // Mensagem de confirmação
                    JOptionPane.showMessageDialog(null, "Fornecedor adicionado com sucesso.");
                }
            }
        });
        btnAdicionar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnAdicionar.setToolTipText("Adicionar");
        btnAdicionar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/adicionar.png")));
        btnAdicionar.setBounds(29, 338, 89, 73);
        getContentPane().add(btnAdicionar);
    }
}

```

---

**Arquivo 4: Janela Principal com Integração do Menu (`Main.java`)**

```java
package view;

import java.awt.Color;
import java.awt.Cursor;
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
 * Tela principal conectada à abertura de formulários do sistema.
 */
public class Main extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;
    private JLabel lblData;
    private JButton btnSobre;

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

        // Painel Lateral de Navegação
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

        // BOTÃO FORNECEDORES COM CURSOR E EVENTO DE ABERTURA
        JButton btnFornecedores = new JButton("Fornecedores");
        btnFornecedores.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Instancia e abre o formulário de Fornecedores em modo modal
                FrmFornecedor fornecedor = new FrmFornecedor();
                fornecedor.setVisible(true);
            }
        });
        btnFornecedores.setToolTipText("Fornecedor");
        btnFornecedores.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnFornecedores.setBorderPainted(false);
        btnFornecedores.setForeground(Color.BLACK);
        btnFornecedores.setBackground(new Color(123, 104, 238));
        btnFornecedores.setFont(new Font("Arial", Font.BOLD, 15));
        btnFornecedores.setIcon(new ImageIcon(Main.class.getResource("/img/fornecedor.png")));
        btnFornecedores.setBounds(10, 102, 176, 41);
        panelLateral.add(btnFornecedores);

        JLabel lblSistema = new JLabel("Sistema de PDV");
        lblSistema.setForeground(Color.WHITE);
        lblSistema.setBounds(84, 45, 100, 30);
        panelLateral.add(lblSistema);

        JLabel lblDivisor = new JLabel("-------------------------------------");
        lblDivisor.setForeground(Color.WHITE);
        lblDivisor.setBounds(18, 457, 168, 23);
        panelLateral.add(lblDivisor);

        // BOTÃO SOBRE
        btnSobre = new JButton("Sobre");
        btnSobre.setToolTipText("Sobre");
        btnSobre.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnSobre.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
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

        // Rodapé e Cabeçalho
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

**Desmontando o Código**

**Desmontando o `PreparedStatement` no `FornecedorController`**

```java
String sql = "INSERT INTO fornecedores (nome, fone, email, site) VALUES (?, ?, ?, ?)";
PreparedStatement stmt = con.prepareStatement(sql);

stmt.setString(1, fornecedor.getNome());
stmt.setString(2, fornecedor.getFone());
stmt.setString(3, fornecedor.getEmail());
stmt.setString(4, fornecedor.getSite());

stmt.executeUpdate();

```

1. **`VALUES (?, ?, ?, ?)`**: Os pontos de interrogação reservam espaço na instrução compilada no banco.
2. **`stmt.setString(1, fornecedor.getNome());`**: Substitui o **primeiro `?**` pela String retornada por `getNome()`. **Atenção:** No JDBC, os índices dos parâmetros do `PreparedStatement` começam em **1**, e não em 0!
3. **`stmt.executeUpdate();`**: Método utilizado para executar comandos SQL que **modificam a base de dados** (INSERT, UPDATE, DELETE). Retorna a quantidade de linhas afetadas.
4. **`stmt.close(); con.close();`**: Libera o objeto de instrução e fecha a sessão TCP ativada com o servidor MySQL.

---

**Desmontando o Evento do Botão Adicionar em `FrmFornecedor`**

```java
if (textNome.getText().isBlank()) {
    JOptionPane.showMessageDialog(null, "Preencha o nome do fornecedor.");
    textNome.requestFocus();
} else {
    fornecedor.setNome(textNome.getText());
    // ...
    controller.adicionar(fornecedor);
    JOptionPane.showMessageDialog(null, "Fornecedor adicionado com sucesso.");
}

```

1. **`textNome.getText().isBlank()`**: Garante que o usuário não cadastre um fornecedor sem nome ou preenchido apenas com espaços em branco.
2. **`textNome.requestFocus()`**: Força a interface visual a colocar o cursor de digitação piscando na caixa `textNome`.
3. **`fornecedor.setNome(...)`**: Lê os componentes visuais da `View` e transfere seus conteúdos para a classe `Model`.
4. **`controller.adicionar(fornecedor)`**: Invoca o método da camada de controle passando o modelo preenchido.
5. **`JOptionPane.showMessageDialog(...)`**: Exibe uma caixa de diálogo avisando que a operação foi concluída.

---

**Passo a Passo**

**Passo a Passo: Teste Completo de Inserção e Verificação no Workbench**

1. **Passo 1: Executar a Aplicação no Eclipse:**
* Abra a classe `Main.java` e pressione `Ctrl + F11`.


2. **Passo 2: Navegar até o Cadastro:**
* Na tela principal do PDV, passe o mouse sobre o botão **Fornecedores** (observe o cursor mudando para a mãozinha `HAND_CURSOR`) e clique.


3. **Passo 3: Preencher o Formulário Modal:**
* Tente clicar na janela principal atrás (observe que a tela `FrmFornecedor` bloqueia o clique por ser modal).
* Digite o nome do fornecedor (ex: `"Distribuidora Tatuapé"`). Tente digitar um texto com mais de 50 caracteres (observe que o `Validador` impede a digitação do 51º caractere).
* Preencha o telefone (ex: `"11 2222-3333"`), e-mail e site.


4. **Passo 4: Confirmar o Salvamento:**
* Clique no botão **Adicionar**.
* Observe a mensagem de confirmação: `"Fornecedor adicionado com sucesso."`.


5. **Passo 5: Validar a Persistência no MySQL Workbench:**
* Abra o MySQL Workbench e conecte-se à base local.
* Digite os comandos na aba Query:



```sql
     USE blpdv;
     SELECT * FROM fornecedores;
     

```

* Pressione `Ctrl + Shift + Enter`.
* **Resultado Esperado:** A tabela de resultados exibirá o fornecedor cadastrado com o `idFornecedor` autoincrementado (ex: `ID 1`), confirmando a integração completa entre View, Model, Controller e Banco de Dados!

---

## Tabelas Comparativas

**Tipos de Validação Suportados pela Classe `Validador`**

| Tipo Configurado | RegEx Utilizada | Comportamento no Campo de Texto |
| --- | --- | --- |
| **`"texto"`** | *(Sem filtro de tipo)* | Permite letras, números, símbolos e acentos até o limite de caracteres. |
| **`"inteiro"`** | `"[0-9]+"` | Permite **apenas dígitos de 0 a 9**. Rejeita letras, espaços e sinais de menos (`-`). |
| **`"decimal"`** | `"[0-9]*([,.][0-9]*)?"` | Permite dígitos e **no máximo um ponto ou vírgula** como separador decimal. |

---

**`executeUpdate()` vs. `executeQuery()` em JDBC**

| Método JDBC | Para quais comandos SQL serve? | O que retorna? |
| --- | --- | --- |
| **`executeUpdate()`** | `INSERT`, `UPDATE`, `DELETE` | Retorna um inteiro (`int`) indicando quantas linhas foram alteradas na tabela. |
| **`executeQuery()`** | `SELECT` | Retorna um objeto **`ResultSet`** contendo os dados consultados do banco. |

---

## Erros Comuns e Cuidados

**Erro de Índice em `PreparedStatement` (`SQLIndexOutOfBoundsException`)**

No JDBC, a contagem dos parâmetros `?` começa em **1** (e não em 0, como nos vetores do Java).

```java
// ❌ INCORRETO (Dispara exceção Parameter index out of bounds):
stmt.setString(0, fornecedor.getNome());

// ✅ CORRETO (Primeiro parâmetro '?' da query):
stmt.setString(1, fornecedor.getNome());

```

---

**Esquecer de Tratar o Tratamento de Erros no Catch do Controller**

No rascunho original, o bloco `catch` trazia a instrução `System.out.println(2);`. Em ambientes reais, isso esconde a falha do desenvolvedor.

* **Solução:** Substitua por `e.printStackTrace();` ou `System.err.println(...)` para visualizar a mensagem real de erro do SQL no console do Eclipse.

---

**Falha de Extensão das Imagens (`.jpg` vs `.png`)**

Ao carregar imagens via `getResource("/img/adicionar.jpg")`, se a imagem gravada na pasta `img` for `.png`, o Java não encontrará o arquivo e o botão ficará sem ícone.

* **Cuidado:** Verifique a extensão exata dos arquivos na pasta `img`.

---

## Conteúdo Complementar e Aprofundamento

**Limpando os Campos da Tela Após o Cadastro**

Após salvar um fornecedor com sucesso, uma excelente prática de usabilidade (UX) é **limpar todos os campos de texto** e reposicionar o foco no campo `textNome` para permitir um novo cadastro sem ter que apagar o texto antigo manualmente:

```java
// Método utilitário para incluir na classe FrmFornecedor.java:
private void limparCampos() {
    textID.setText("");
    textNome.setText("");
    textFone.setText("");
    textEmail.setText("");
    textSite.setText("");
    textNome.requestFocus(); // Coloca o cursor piscando no campo Nome
}

// Como chamar dentro da ação do botão Adicionar:
controller.adicionar(fornecedor);
JOptionPane.showMessageDialog(null, "Fornecedor adicionado com sucesso.");
limparCampos(); // Limpa a tela para o próximo cadastro

```

---

**Resumo Relâmpago**

1. A classe `Validador` estende `PlainDocument` para limitar caracteres e filtrar tipos em `JTextFields`.
2. A interceptação de caracteres ocorre no método `insertString()` antes da exibição na tela.
3. A camada `controller.FornecedorController` contém a regra de negócio e os métodos de banco (CRUD).
4. O uso de `PreparedStatement` com parâmetros `?` impede ataques de SQL Injection no banco de dados.
5. Os índices dos parâmetros `?` no `PreparedStatement` iniciam em 1 (`stmt.setString(1, ...)`).
6. O método `stmt.executeUpdate()` é utilizado para executar comandos `INSERT`, `UPDATE` e `DELETE`.
7. O método `isBlank()` verifica se um campo de texto está vazio ou preenchido apenas com espaços.
8. O método `text.requestFocus()` posiciona o cursor de digitação diretamente no campo desejado.
9. Janelas modais (`setModal(true)`) impedem a interação com outras telas até que o diálogo seja fechado.
10. O teste final no MySQL Workbench via `SELECT * FROM fornecedores;` confirma a gravação do registro.

---

## Guia Rápido de Memorização

**Inserção de Dados via JDBC (`PreparedStatement`)**

```java
String sql = "INSERT INTO tabela (c1, c2) VALUES (?, ?)";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setString(1, model.getCampo1());
stmt.setString(2, model.getCampo2());
stmt.executeUpdate();
stmt.close();

```

**Aplicando Validação no `JTextField`**

```java
// Limita a 50 caracteres do tipo texto
textCampo.setDocument(new Validador(50, "texto"));

// Limita a 10 dígitos inteiros
textCampo.setDocument(new Validador(10, "inteiro"));

```
