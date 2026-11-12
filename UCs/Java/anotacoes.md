# Integração Web, Geração de Relatórios PDF com OpenPDF e Início do Módulo de Produtos (Projeto BL-PDV)

**Visão Geral**

Nesta aula, expandi os recursos profissionais do sistema **BL-PDV**, finalizando funcionalidades avançadas no módulo de fornecedores e dando início ao módulo de gerenciamento de **Produtos**.

As principais entregas desta etapa foram:

1. **Acesso Direto ao Site do Fornecedor (`btnAcessar`):** Implementei um botão de ação ao lado do campo `textSite` em `FrmFornecedor.java` que utiliza a classe `java.awt.Desktop` para abrir o endereço web do fornecedor no navegador padrão do sistema operacional, contando com tratamento de exceção caso a URL seja inválida.
2. **Geração de Relatórios em PDF (`OpenPDF`):** Adicionei a biblioteca externa `openpdf-2.2.5.jar` ao projeto e desenvolvi o método `gerarRelatorioFornecedores()` no `FornecedorController.java`. O sistema consulta os fornecedores ordenados alfabeticamente, monta um documento A4 estruturado com título, data/hora de emissão, tabela formatada (`PdfPTable`) e totalizador, abrindo o arquivo PDF automaticamente na tela.
3. **Atualização do Menu Principal e Início de `FrmProduto`:** Adicionei o botão **Produtos** (`btnProdutos`) no painel lateral da `Main.java` (ajustando o espaçamento entre ícone e texto via `iconTextGap(12)`) e criei a estrutura visual inicial da janela modal `FrmProduto.java` (`JDialog`), preparando os campos para cadastro de mercadorias, preços, estoque e vínculo com fornecedores (`JComboBox`).

---

**Entendendo o Conceito**

## Integração com Aplicativos Nativos (`Desktop`) para URLs e Arquivos

A classe `java.awt.Desktop` atua como uma ponte entre a aplicação Java e o sistema operacional do usuário. Nesta aula, ela foi utilizada para duas finalidades distintas:

* **`desktop.browse(uri)`:** Aciona o **navegador web padrão** para abrir uma endereço HTTP/HTTPS digitado no cadastro.
* **`desktop.open(arquivo)`:** Aciona o **leitor de PDF padrão** do computador (como Adobe Reader, Edge ou Chrome) para exibir o relatório recém-gerado em disco.

---

## Geração Programática de Documentos PDF com OpenPDF

A biblioteca **OpenPDF** (`com.lowagie.text`) permite criar arquivos PDF linha por linha através de objetos Java, funcionando como uma linha de montagem editorial:

```
+-----------------------+      +-----------------------+      +-----------------------+
|   1. DOCUMENTO        |      |   2. ESCRITOR         |      |   3. CONTEÚDO         |
|  Document(PageSize.A4)| ---> | PdfWriter.getInstance | ---> | Paragraph & PdfPTable |
| (Define o papel)      |      | (Grava no arquivo)    |      | (Escreve textos/dados)|
+-----------------------+      +-----------------------+      +-----------------------+

```

> **Analogia da Gráfica:**

* O objeto `Document` é a folha de papel A4 em branco colocada sobre a mesa.
* O `PdfWriter` é a impressora conectada ao arquivo `fornecedor.pdf` no disco rígido.
* O `documento.open()` liga a máquina, os comandos `documento.add(...)` imprimem os parágrafos e tabelas na folha, e o `documento.close()` finaliza e encaderna o arquivo para que possa ser aberto.

---

## Relacionamento Visual com `JComboBox`

No formulário `FrmProduto`, introduzimos o componente **`JComboBox`** (`cboFornecedor`). Em bancos de dados relacionais, um produto pertence a um fornecedor (chave estrangeira). Em vez de obrigar o operador a decorar o número de ID do fornecedor, a caixa de seleção permite escolher o fornecedor pelo nome em uma lista suspensa.

---

**Conceitos Fundamentais**

## Classes Principais da Biblioteca OpenPDF (`com.lowagie.text`)

* **`Document`:** Representa o arquivo PDF em memória e define suas dimensões (`PageSize.A4`).
* **`PdfWriter`:** Vincula o `Document` a um fluxo de saída de arquivo (`FileOutputStream`), gravando os bytes no disco.
* **`Paragraph`:** Bloco de texto com suporte a alinhamento (`Element.ALIGN_CENTER`, `Element.ALIGN_RIGHT`) e fontes customizadas (`Font`).
* **`PdfPTable`:** Estrutura de grade tabular para exibir registros do banco de dados organizados em colunas proporcionais (`setWidths`).

## Espaçamento de Botões com `setIconTextGap()`

Nos botões do menu lateral (`btnFornecedores` e `btnProdutos`), utilizamos `setIconTextGap(12)` para definir uma margem exata de 12 pixels entre o ícone de 32x32 e o rótulo de texto, melhorando o alinhamento visual do menu.

## Tratamento de URLs Malformadas

O construtor `new URI(url)` exige que a String contenha o protocolo completo (ex: `[https://www.site.com.br](https://www.site.com.br)`). Caso o usuário digite apenas `[www.site.com](https://www.site.com).br` ou deixe o campo em branco, o Java lança uma exceção capturada pelo bloco `catch`, alertando o usuário com um exemplo válido.

---

### Código / Exemplos Práticos

**Arquivo 1: Controller com Geração de Relatório PDF (`FornecedorController.java`)**

```java
package controller;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.swing.JOptionPane;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import database.Database;
import model.Fornecedor;

/**
 * Controller responsável pelo CRUD e geração de relatórios de Fornecedores.
 * 
 * @author Bruss Loza
 */
public class FornecedorController {

    private Database database = new Database();

    // =========================================================================
    // 1. CRUD CREATE - ADICIONAR FORNECEDOR
    // =========================================================================
    public void adicionar(Fornecedor fornecedor) {
        String sql = """
            INSERT INTO fornecedores (nome, fone, email, site) VALUES (?, ?, ?, ?)
            """;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getFone());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getSite());

            stmt.executeUpdate();

            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =========================================================================
    // 2. CRUD READ - BUSCAR FORNECEDOR POR NOME
    // =========================================================================
    public Fornecedor buscar(String nome) {
        String sql = """
            SELECT idFornecedor, nome, fone, email, site
            FROM fornecedores
            WHERE nome LIKE ?
            """;

        Fornecedor fornecedor = null;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, "%" + nome + "%");

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                fornecedor = new Fornecedor();
                fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
                fornecedor.setNome(rs.getString("nome"));
                fornecedor.setFone(rs.getString("fone"));
                fornecedor.setEmail(rs.getString("email"));
                fornecedor.setSite(rs.getString("site"));
            }

            rs.close();
            stmt.close();
            con.close();

            return fornecedor;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // =========================================================================
    // 3. CRUD UPDATE - EDITAR FORNECEDORES
    // =========================================================================
    public void editarFornecedor(Fornecedor fornecedor) {
        String sql = """
            UPDATE fornecedores
            SET nome = ?, fone = ?, email = ?, site = ?
            WHERE idFornecedor = ?
            """;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getFone());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getSite());
            stmt.setInt(5, fornecedor.getIdFornecedor());

            stmt.executeUpdate();

            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =========================================================================
    // 4. CRUD DELETE - EXCLUIR FORNECEDOR
    // =========================================================================
    public void excluir(int idFornecedor) {
        String sql = """
            DELETE FROM fornecedores
            WHERE idFornecedor = ?
            """;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, idFornecedor);
            stmt.executeUpdate();

            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =========================================================================
    // 5. RELATÓRIO PDF - GERAR RELATÓRIO DE FORNECEDORES (OPENPDF)
    // =========================================================================
    public void gerarRelatorioFornecedores() {
        String sql = """
            SELECT nome, fone, email, site
            FROM fornecedores
            ORDER BY nome
            """;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // Configura o documento PDF no padrão de folha A4
            Document documento = new Document(PageSize.A4);
            String caminho = "fornecedor.pdf";

            // Vincula o documento ao arquivo físico de saída
            PdfWriter.getInstance(documento, new FileOutputStream(caminho));
            documento.open();

            // Cabeçalho: Título do Relatório
            Font fonteTitulo = new Font(Font.getFamilyIndex("Helvetica"), 16, Font.BOLD);
            Paragraph titulo = new Paragraph("RELATÓRIO DE FORNECEDORES", fonteTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            documento.add(titulo);

            // Cabeçalho: Data e Hora da Emissão
            DateTimeFormatter formatoDataHora = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            String dataHora = LocalDateTime.now().format(formatoDataHora);
            Paragraph data = new Paragraph("Data de emissão: " + dataHora);
            data.setAlignment(Element.ALIGN_CENTER);
            documento.add(data);

            // Espaçamento em branco
            documento.add(new Paragraph(" "));

            // Criação da Tabela com 4 colunas
            PdfPTable tabela = new PdfPTable(4);
            tabela.setWidths(new float[] {3.0f, 2.0f, 3.0f, 4.0f}); // Proporção das colunas
            tabela.setWidthPercentage(100); // Ocupa 100% da largura útil da página

            // Células do Cabeçalho da Tabela
            tabela.addCell("Nome");
            tabela.addCell("Fone");
            tabela.addCell("Email");
            tabela.addCell("Site");

            // Preenchimento dinâmico com os dados do ResultSet
            int quantidade = 0;
            while (rs.next()) {
                tabela.addCell(rs.getString("nome"));
                tabela.addCell(rs.getString("fone"));
                tabela.addCell(rs.getString("email"));
                tabela.addCell(rs.getString("site"));
                quantidade++;
            }

            documento.add(tabela);

            // Rodapé: Totalizador de Registros
            documento.add(new Paragraph(" "));
            Font fonteTotal = new Font(Font.getFamilyIndex("Helvetica"), 10, Font.BOLD);
            Paragraph total = new Paragraph("Total de fornecedores: " + quantidade, fonteTotal);
            total.setAlignment(Element.ALIGN_RIGHT);
            documento.add(total);

            // Fecha o documento PDF e os recursos do banco
            documento.close();
            rs.close();
            stmt.close();
            con.close();

            // Abre o arquivo PDF automaticamente no leitor padrão do sistema operacional
            File arquivo = new File(caminho);
            Desktop.getDesktop().open(arquivo);

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao gerar relatório PDF: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

```

---

**Arquivo 2: Formulário de Fornecedores Atualizado (`FrmFornecedor.java`)**

```java
package view;

import java.awt.Cursor;
import java.awt.Desktop;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URI;

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
 * Tela de Fornecedores com acesso direto ao site e emissão de relatório PDF.
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
    private JButton btnLimpar;
    private JButton btnBuscar;
    private JButton btnEditar;
    private JButton btnExcluir;
    private JButton btnAcessar;
    private JButton btnRelatorio;

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
        setModal(true);
        setResizable(false);
        setTitle("Fornecedores");
        setIconImage(Toolkit.getDefaultToolkit().getImage(FrmFornecedor.class.getResource("/img/fornecedor.png")));
        setBounds(100, 100, 680, 480);
        getContentPane().setLayout(null);
        setLocationRelativeTo(null);

        FornecedorController controller = new FornecedorController();
        Fornecedor fornecedor = new Fornecedor();

        // --- CAMPOS DO FORMULÁRIO ---
        lblID = new JLabel("ID");
        lblID.setEnabled(false);
        lblID.setFont(new Font("Arial", Font.BOLD, 14));
        lblID.setBounds(10, 40, 19, 17);
        getContentPane().add(lblID);

        textID = new JTextField();
        textID.setEnabled(false);
        textID.setBounds(52, 39, 96, 20);
        getContentPane().add(textID);
        textID.setColumns(10);

        lblNome = new JLabel("Nome");
        lblNome.setFont(new Font("Arial", Font.BOLD, 14));
        lblNome.setBounds(10, 96, 48, 26);
        getContentPane().add(lblNome);

        textNome = new JTextField();
        textNome.setColumns(10);
        textNome.setBounds(57, 94, 281, 33);
        getContentPane().add(textNome);
        textNome.setDocument(new Validador(50, "texto"));

        lblFone = new JLabel("Fone");
        lblFone.setFont(new Font("Arial", Font.BOLD, 14));
        lblFone.setBounds(10, 156, 48, 17);
        getContentPane().add(lblFone);

        textFone = new JTextField();
        textFone.setColumns(10);
        textFone.setBounds(56, 149, 148, 26);
        getContentPane().add(textFone);
        textFone.setDocument(new Validador(20));

        lblEmail = new JLabel("Email");
        lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
        lblEmail.setBounds(10, 211, 48, 17);
        getContentPane().add(lblEmail);

        textEmail = new JTextField();
        textEmail.setColumns(10);
        textEmail.setBounds(57, 207, 281, 26);
        getContentPane().add(textEmail);
        textEmail.setDocument(new Validador(50));

        lblSite = new JLabel("Site");
        lblSite.setFont(new Font("Arial", Font.BOLD, 14));
        lblSite.setBounds(10, 260, 32, 26);
        getContentPane().add(lblSite);

        textSite = new JTextField();
        textSite.setColumns(10);
        textSite.setBounds(57, 259, 281, 27);
        getContentPane().add(textSite);

        // --- BOTÕES DE CRUD ---
        btnAdicionar = new JButton("");
        btnAdicionar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (textNome.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o nome do fornecedor.");
                    textNome.requestFocus();
                } else if (textFone.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o telefone do fornecedor.");
                    textFone.requestFocus();
                } else {
                    fornecedor.setNome(textNome.getText());
                    fornecedor.setFone(textFone.getText());
                    fornecedor.setEmail(textEmail.getText());
                    fornecedor.setSite(textSite.getText());

                    controller.adicionar(fornecedor);
                    JOptionPane.showMessageDialog(null, "Fornecedor adicionado com sucesso.");
                    limparCampos();
                }
            }
        });
        btnAdicionar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnAdicionar.setToolTipText("Adicionar");
        btnAdicionar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/adicionar.png")));
        btnAdicionar.setBounds(10, 338, 89, 73);
        getContentPane().add(btnAdicionar);

        btnEditar = new JButton("");
        btnEditar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (textNome.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o nome do fornecedor");
                    textNome.requestFocus();
                } else if (textFone.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o telefone do fornecedor");
                    textFone.requestFocus();
                } else if (textEmail.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o email do fornecedor");
                    textEmail.requestFocus();
                } else if (textSite.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Preencha o site do fornecedor");
                    textSite.requestFocus();
                } else {
                    fornecedor.setIdFornecedor(Integer.parseInt(textID.getText()));
                    fornecedor.setNome(textNome.getText());
                    fornecedor.setFone(textFone.getText());
                    fornecedor.setEmail(textEmail.getText());
                    fornecedor.setSite(textSite.getText());

                    controller.editarFornecedor(fornecedor);
                    JOptionPane.showMessageDialog(null, "Dados do fornecedor alterados.");
                    limparCampos();
                }
            }
        });
        btnEditar.setToolTipText("Editar");
        btnEditar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/update.png")));
        btnEditar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnEditar.setBounds(109, 338, 84, 73);
        getContentPane().add(btnEditar);

        btnExcluir = new JButton("");
        btnExcluir.setToolTipText("Excluir");
        btnExcluir.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (textNome.getText().isBlank() || textID.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Busque um fornecedor antes de excluir.");
                    textNome.requestFocus();
                } else {
                    int idFornecedor = Integer.parseInt(textID.getText());
                    int resposta = JOptionPane.showConfirmDialog(
                        null, "Deseja realmente excluir este fornecedor?", "Atenção!", JOptionPane.YES_NO_OPTION
                    );
                    if (resposta == JOptionPane.YES_OPTION) {
                        controller.excluir(idFornecedor);
                        limparCampos();
                        JOptionPane.showMessageDialog(null, "Fornecedor excluído com sucesso.");
                    }
                }
            }
        });
        btnExcluir.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnExcluir.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/excluir.png")));
        btnExcluir.setBounds(203, 338, 89, 73);
        getContentPane().add(btnExcluir);

        btnLimpar = new JButton("");
        btnLimpar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                limparCampos();
            }
        });
        btnLimpar.setToolTipText("Limpar campos");
        btnLimpar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnLimpar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/limpar.png")));
        btnLimpar.setBounds(304, 338, 89, 73);
        getContentPane().add(btnLimpar);

        btnBuscar = new JButton("Buscar");
        btnBuscar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (textNome.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Informe o nome do fornecedor");
                    textNome.requestFocus();
                } else {
                    String nome = textNome.getText();
                    Fornecedor f = controller.buscar(nome);
                    if (f != null) {
                        textID.setText(String.valueOf(f.getIdFornecedor()));
                        textNome.setText(f.getNome());
                        textFone.setText(f.getFone());
                        textEmail.setText(f.getEmail());
                        textSite.setText(f.getSite());
                        btnAdicionar.setEnabled(false);
                    } else {
                        JOptionPane.showMessageDialog(null, "Fornecedor não cadastrado");
                        limparCampos();
                    }
                }
            }
        });
        getRootPane().setDefaultButton(btnBuscar);
        btnBuscar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnBuscar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/buscar.png")));
        btnBuscar.setBounds(368, 94, 126, 33);
        getContentPane().add(btnBuscar);

        // --- BOTÃO ACESSAR SITE NO NAVEGADOR ---
        btnAcessar = new JButton("Acessar");
        btnAcessar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String site = textSite.getText();
                link(site);
            }
        });
        btnAcessar.setToolTipText("Acessar");
        btnAcessar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnAcessar.setBounds(368, 258, 126, 33);
        getContentPane().add(btnAcessar);

        // --- BOTÃO GERAR RELATÓRIO PDF ---
        btnRelatorio = new JButton("");
        btnRelatorio.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                controller.gerarRelatorioFornecedores();
            }
        });
        btnRelatorio.setToolTipText("Gerar relatório");
        btnRelatorio.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/pdf.png")));
        btnRelatorio.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnRelatorio.setBounds(403, 338, 89, 73);
        getContentPane().add(btnRelatorio);

        // --- ILUSTRAÇÃO DECORATIVA DA TELA ---
        JLabel lblBannerFornecedor = new JLabel("");
        lblBannerFornecedor.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/fornecedor_banner.png")));
        lblBannerFornecedor.setBounds(525, 30, 115, 95);
        getContentPane().add(lblBannerFornecedor);
    }

    /**
     * Limpa os campos do formulário e reabilita o botão Adicionar.
     */
    void limparCampos() {
        textID.setText(null);
        textNome.setText(null);
        textFone.setText(null);
        textEmail.setText(null);
        textSite.setText(null);
        btnAdicionar.setEnabled(true);
    }

    /**
     * Abre uma URL no navegador padrão do sistema operacional com validação.
     * 
     * @param url Endereço web completo (ex: https://www.bruss.com.br)
     */
    private void link(String url) {
        Desktop desktop = Desktop.getDesktop();

        try {
            if (url == null || url.isBlank()) {
                throw new IllegalArgumentException("URL vazia");
            }
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
}

```

---

**Arquivo 3: Tela Principal com Botão de Produtos (`Main.java`)**

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
 * Janela Principal do Sistema BL-PDV com acesso a Fornecedores e Produtos.
 */
public class Main extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;
    private JLabel lblData;
    private JButton btnSobre;
    private JButton btnProdutos;

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

        // Rodapé Status Banco
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

        // Cabeçalho Data
        JLabel lblCalendario = new JLabel("");
        lblCalendario.setIcon(new ImageIcon(Main.class.getResource("/img/calendario.png")));
        lblCalendario.setBounds(682, 0, 24, 36);
        contentPane.add(lblCalendario);

        lblData = new JLabel("");
        lblData.setBounds(710, 0, 70, 36);
        contentPane.add(lblData);

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
        lblSistema.setForeground(Color.WHITE);
        lblSistema.setBounds(84, 45, 100, 30);
        panelLateral.add(lblSistema);

        // BOTÃO FORNECEDORES
        JButton btnFornecedores = new JButton("Fornecedores");
        btnFornecedores.setIconTextGap(12);
        btnFornecedores.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
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

        // BOTÃO PRODUTOS
        btnProdutos = new JButton("Produtos");
        btnProdutos.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                FrmProduto produto = new FrmProduto();
                produto.setVisible(true);
            }
        });
        btnProdutos.setIconTextGap(12);
        btnProdutos.setToolTipText("Produtos");
        btnProdutos.setIcon(new ImageIcon(Main.class.getResource("/img/produtos.png")));
        btnProdutos.setForeground(Color.BLACK);
        btnProdutos.setFont(new Font("Arial", Font.BOLD, 15));
        btnProdutos.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnProdutos.setBorderPainted(false);
        btnProdutos.setBackground(new Color(123, 104, 238));
        btnProdutos.setBounds(10, 154, 176, 41);
        panelLateral.add(btnProdutos);

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

**Arquivo 4: Estrutura Visual Inicial de Produtos (`FrmProduto.java`)**

```java
package view;

import java.awt.Font;
import java.awt.Toolkit;

import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

/**
 * Formulário Modal para Cadastro e Gestão de Produtos.
 */
public class FrmProduto extends JDialog {

    private static final long serialVersionUID = 1L;
    private JTextField textIDProduto;
    private JTextField textDescricao;
    private JTextField textCategoria;
    private JComboBox<String> cboFornecedor;
    private JTextField textIDFornecedor;
    private JTextField textPrecoCusto;
    private JTextField textPrecoVenda;
    private JTextField textQuantidade;
    private JTextField textEstoqueMinimo;

    public static void main(String[] args) {
        FlatDarkLaf.setup();

        try {
            FrmProduto dialog = new FrmProduto();
            dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
            dialog.setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public FrmProduto() {
        setModal(true);
        setResizable(false);
        setTitle("Produtos");
        setIconImage(Toolkit.getDefaultToolkit().getImage(FrmProduto.class.getResource("/img/produtos.png")));
        setBounds(100, 100, 640, 480);
        getContentPane().setLayout(null);
        setLocationRelativeTo(null);

        // --- CAMPO ID PRODUTO ---
        JLabel lblidProduto = new JLabel("ID");
        lblidProduto.setFont(new Font("Arial", Font.BOLD, 14));
        lblidProduto.setBounds(15, 20, 25, 20);
        getContentPane().add(lblidProduto);

        textIDProduto = new JTextField();
        textIDProduto.setToolTipText("Id Produto");
        textIDProduto.setEnabled(false);
        textIDProduto.setBounds(45, 20, 80, 22);
        getContentPane().add(textIDProduto);
        textIDProduto.setColumns(10);

        // --- CAMPO DESCRIÇÃO ---
        JLabel lblDescricao = new JLabel("Descrição");
        lblDescricao.setFont(new Font("Arial", Font.BOLD, 14));
        lblDescricao.setBounds(15, 60, 75, 20);
        getContentPane().add(lblDescricao);

        textDescricao = new JTextField();
        textDescricao.setBounds(95, 60, 320, 22);
        getContentPane().add(textDescricao);
        textDescricao.setColumns(10);

        // --- CAMPO CATEGORIA ---
        JLabel lblCategoria = new JLabel("Categoria");
        lblCategoria.setFont(new Font("Arial", Font.BOLD, 14));
        lblCategoria.setBounds(15, 100, 75, 20);
        getContentPane().add(lblCategoria);

        textCategoria = new JTextField();
        textCategoria.setBounds(95, 100, 200, 22);
        getContentPane().add(textCategoria);
        textCategoria.setColumns(10);

        // --- SELEÇÃO DE FORNECEDOR (JComboBox + ID Vinculado) ---
        JLabel lblFornecedor = new JLabel("Fornecedor");
        lblFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
        lblFornecedor.setBounds(15, 140, 85, 20);
        getContentPane().add(lblFornecedor);

        cboFornecedor = new JComboBox<>();
        cboFornecedor.setBounds(105, 140, 230, 22);
        getContentPane().add(cboFornecedor);

        JLabel lblIDFornecedor = new JLabel("ID Fornecedor");
        lblIDFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
        lblIDFornecedor.setBounds(355, 140, 105, 20);
        getContentPane().add(lblIDFornecedor);

        textIDFornecedor = new JTextField();
        textIDFornecedor.setEnabled(false);
        textIDFornecedor.setBounds(465, 140, 70, 22);
        getContentPane().add(textIDFornecedor);
        textIDFornecedor.setColumns(10);

        // --- CAMPOS DE PREÇO (CUSTO E VENDA) ---
        JLabel lblCusto = new JLabel("Custo");
        lblCusto.setFont(new Font("Arial", Font.BOLD, 14));
        lblCusto.setBounds(15, 185, 50, 20);
        getContentPane().add(lblCusto);

        textPrecoCusto = new JTextField();
        textPrecoCusto.setBounds(70, 185, 100, 22);
        getContentPane().add(textPrecoCusto);
        textPrecoCusto.setColumns(10);

        JLabel lblVenda = new JLabel("Venda");
        lblVenda.setFont(new Font("Arial", Font.BOLD, 14));
        lblVenda.setBounds(195, 185, 50, 20);
        getContentPane().add(lblVenda);

        textPrecoVenda = new JTextField();
        textPrecoVenda.setBounds(250, 185, 100, 22);
        getContentPane().add(textPrecoVenda);
        textPrecoVenda.setColumns(10);

        // --- CAMPOS DE ESTOQUE (QUANTIDADE E MÍNIMO) ---
        JLabel lblQuantidade = new JLabel("Quantidade");
        lblQuantidade.setFont(new Font("Arial", Font.BOLD, 14));
        lblQuantidade.setBounds(15, 230, 85, 20);
        getContentPane().add(lblQuantidade);

        textQuantidade = new JTextField();
        textQuantidade.setBounds(105, 230, 80, 22);
        getContentPane().add(textQuantidade);
        textQuantidade.setColumns(10);

        JLabel lblEstoqueMinimo = new JLabel("Estoque mínimo");
        lblEstoqueMinimo.setFont(new Font("Arial", Font.BOLD, 14));
        lblEstoqueMinimo.setBounds(205, 230, 115, 20);
        getContentPane().add(lblEstoqueMinimo);

        textEstoqueMinimo = new JTextField();
        textEstoqueMinimo.setBounds(325, 230, 80, 22);
        getContentPane().add(textEstoqueMinimo);
        textEstoqueMinimo.setColumns(10);
    }
}

```

---

**Desmontando o Código**

**Desmontando a Tabela Dinâmica no OpenPDF (`PdfPTable`)**

```java
PdfPTable tabela = new PdfPTable(4);
tabela.setWidths(new float[] {3.0f, 2.0f, 3.0f, 4.0f});
tabela.setWidthPercentage(100);

tabela.addCell("Nome");
// ...
while (rs.next()) {
    tabela.addCell(rs.getString("nome"));
    // ...
    quantidade++;
}
documento.add(tabela);

```

1. **`new PdfPTable(4)`**: Inicializa uma grade tabular configurada para exatamente **4 colunas**.
2. **`setWidths(new float[] {3.0f, 2.0f, 3.0f, 4.0f})`**: Define a largura relativa de cada coluna. A coluna *Site* (`4.0f`) recebe o dobro da largura da coluna *Fone* (`2.0f`).
3. **`tabela.addCell(...)`**: As 4 primeiras chamadas preenchem a linha de cabeçalho. As chamadas subsequentes dentro do laço `while (rs.next())` vão preenchendo automaticamente as linhas seguintes da esquerda para a direita.
4. **`quantidade++`**: Contador simples que contabiliza quantos fornecedores foram lidos do banco para exibir o resumo no rodapé.

---

**Desmontando a Abertura Automática do PDF**

```java
documento.close();
// ...
File arquivo = new File(caminho);
Desktop.getDesktop().open(arquivo);

```

1. **`documento.close()`**: **Passo obrigatório antes de abrir.** Finaliza a escrita no disco e libera o bloqueio do arquivo `fornecedor.pdf`.
2. **`Desktop.getDesktop().open(arquivo)`**: Solicita ao sistema operacional que abra o arquivo com o programa padrão associado à extensão `.pdf`.

---

**Passo a Passo**

**Passo a Passo 1: Importando a Biblioteca OpenPDF no Eclipse**

1. Acesse o repositório Maven Central (`central.sonatype.com`) e baixe o arquivo **`openpdf-2.2.5.jar`**.
2. Arraste o arquivo `.jar` para dentro da pasta **`lib`** do projeto `blpvd` no Eclipse.
3. Clique com o botão direito sobre `openpdf-2.2.5.jar` ➔ **Build Path** ➔ **Add to Build Path**.
4. Confirme que o arquivo apareceu dentro de **Referenced Libraries**.

---

**Passo a Passo 2: Testando o Relatório PDF e Acesso Web**

1. Execute a aplicação pela classe `Main.java` (`Ctrl + F11`) e abra **Fornecedores**.
2. **Teste do Botão Acessar:**
* Busque um fornecedor que possua um site cadastrado com protocolo (ex: `[https://www.google.com](https://www.google.com)`) e clique em **Acessar**. O navegador padrão abrirá a página.
* Apague o campo site (ou digite um texto sem `https://`) e clique em **Acessar**. A caixa de diálogo exibirá o exemplo de formato válido.


3. **Teste do Relatório PDF:**
* Clique no ícone de PDF (`btnRelatorio`).
* O arquivo `fornecedor.pdf` será gerado na pasta raiz do projeto no Eclipse e aberto imediatamente no seu leitor de PDF.



---

## Tabelas Comparativas

**Principais Classes do OpenPDF (`com.lowagie.text`)**

| Classe | Papel na Geração do PDF | Exemplo de Uso |
| --- | --- | --- |
| **`Document`** | Define o formato e margens da página. | `new Document(PageSize.A4)` |
| **`PdfWriter`** | Conecta o documento ao destino em disco. | `PdfWriter.getInstance(doc, out)` |
| **`Paragraph`** | Adiciona blocos de texto e títulos. | `new Paragraph("Título", fonte)` |
| **`PdfPTable`** | Cria tabelas estruturadas em linhas e colunas. | `new PdfPTable(4)` |

---

**Métodos da Classe `java.awt.Desktop`**

| Método | Parâmetro | O que executa no Sistema Operacional? |
| --- | --- | --- |
| **`browse(URI)`** | Objeto `java.net.URI` | Abre o **navegador web padrão** na URL especificada. |
| **`open(File)`** | Objeto `java.io.File` | Abre um **arquivo local** (PDF, TXT, imagem) no programa padrão. |

---

## Erros Comuns e Cuidados

**Abrir URL sem o Protocolo `http://` ou `https://`**

Ao clicar no botão `btnAcessar`, se o campo `textSite` contiver apenas `"[www.empresa.com](https://www.empresa.com).br"`, a classe `URI` ou o método `desktop.browse()` lançará uma exceção, pois o sistema operacional não sabe qual protocolo usar.

* **Cuidado:** Sempre cadastre sites começando com `https://`.

---

**`FileNotFoundException` ao Gerar Relatório com PDF Aberto**

Se você gerar o relatório `fornecedor.pdf` uma vez, deixá-lo aberto no seu leitor de PDF (como Adobe Reader) e clicar novamente em **Gerar Relatório**, o Windows bloqueará a sobrescrita do arquivo e o Java lançará `FileNotFoundException (O arquivo já está sendo usado por outro processo)`.

* **Solução:** Feche a aba do PDF no visualizador antes de gerar uma nova versão do relatório.

---

**Importar a Classe `Font` Errada no `FornecedorController`**

Existem duas classes chamadas `Font` disponíveis no Java:

* `java.awt.Font` (usada nas telas Swing)
* `com.lowagie.text.Font` (usada no OpenPDF)
* **Cuidado:** Na classe `FornecedorController`, certifique-se de importar **`com.lowagie.text.Font`**.

---

## Conteúdo Complementar e Aprofundamento

**Preparando a Tabela `produtos` no MySQL Workbench**

Como iniciamos a interface gráfica `FrmProduto`, o próximo passo natural no banco de dados `blpdv` será criar a tabela `produtos` relacionada à tabela `fornecedores` através de uma **Chave Estrangeira (`FOREIGN KEY`)**:

```sql
USE blpdv;

CREATE TABLE produtos (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precoCusto DECIMAL(10, 2) NOT NULL,
    precoVenda DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    estoqueMinimo INT NOT NULL,
    idFornecedor INT NOT NULL,
    -- Relacionamento com a tabela fornecedores
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (idFornecedor)
    REFERENCES fornecedores(idFornecedor)
) DEFAULT CHARSET = utf8;

```

---

**Resumo Relâmpago**

1. O botão `btnAcessar` utiliza `Desktop.getDesktop().browse(new URI(url))` para abrir o site no navegador.
2. URLs abertas via `java.awt.Desktop` exigem o protocolo completo (`https://`) para não gerar exceção.
3. A biblioteca `openpdf-2.2.5.jar` permite criar documentos PDF programaticamente em Java.
4. A classe `Document(PageSize.A4)` define o formato da folha e `PdfWriter` grava o arquivo em disco.
5. O componente `PdfPTable` organiza os registros do banco em colunas proporcionais no relatório.
6. É obrigatório chamar `documento.close()` antes de abrir o PDF gerado com `Desktop.getDesktop().open()`.
7. A propriedade `setIconTextGap(12)` ajusta o espaçamento em pixels entre o ícone e o texto do botão.
8. O botão `btnProdutos` foi adicionado ao painel lateral da `Main` para abrir a tela de produtos.
9. A janela `FrmProduto` (`JDialog`) foi criada em modo modal e com layout absoluto.
10. O componente `JComboBox` (`cboFornecedor`) será usado para vincular cada produto ao seu fornecedor.

---

## Guia Rápido de Memorização

**Estrutura Básica de Geração de PDF (OpenPDF)**

```java
Document doc = new Document(PageSize.A4);
PdfWriter.getInstance(doc, new FileOutputStream("relatorio.pdf"));
doc.open();
doc.add(new Paragraph("Título do Documento"));
doc.close();
Desktop.getDesktop().open(new File("relatorio.pdf"));

```

**Abrir Link Externo com Tratamento de Erro**

```java
try {
    Desktop.getDesktop().browse(new URI(textSite.getText()));
} catch (Exception e) {
    JOptionPane.showMessageDialog(null, "URL inválida! Use https://...");
}

```
