# Validação Avançada de Produtos, Arquitetura MVC para Estoque e Carregamento Dinâmico de `JComboBox` (Projeto BL-PDV)

**Visão Geral**

Nesta aula, estruturei a arquitetura completa em três camadas (**MVC**) para o módulo de **Produtos** do sistema **BL-PDV** e integrei o formulário `FrmProduto.java` ao banco de dados para carregar dinamicamente a lista de fornecedores cadastrados.

As principais evoluções realizadas nesta etapa foram:

1. **Validação Tipada no Formulário de Produtos (`FrmProduto.java`):** Apliquei a classe utilitária `Validador` nos campos de entrada do cadastro de produtos, restringindo textos a 100 caracteres, preços de custo e venda ao formato `"decimal"` e quantidades de estoque ao formato `"inteiro"`. Adicionei também o botão de ação `btnAdicionarProduto` e o ícone ilustrativo da tela.
2. **Criação da Camada Model e Controller de Produtos:** Criei a classe JavaBean `Produto.java` no pacote `model` (mapeando atributos como código de barras, descrição, preços, estoque e a chave estrangeira `idFornecedor`) e inicializei a classe `ProdutoController.java` no pacote `controller`.
3. **Listagem Dinâmica com `ArrayList` e `JComboBox`:** Implementei o método `listarFornecedores()` no `FornecedorController.java` para consultar todos os fornecedores em ordem alfabética e devolvê-los em uma coleção dinâmica (`ArrayList<Fornecedor>`). Na interface `FrmProduto`, criei o método `carregarFornecedor()` para preencher o componente suspenso `cboFornecedor` no formato `"ID - Nome"`.
4. **Extração Automática da Chave Estrangeira (`split`):** Programei um evento `ActionListener` no `cboFornecedor` que intercepta a seleção do usuário, separa a String usando o método `.split(" - ")` e preenche automaticamente o campo bloqueado `textIDFornecedor` com o código numérico do fornecedor escolhido.

---

**Entendendo o Conceito**

## Relacionamento Visual entre Tabelas (`JComboBox` + Chave Estrangeira)

Em um banco de dados relacional, a tabela `produtos` não armazena o nome completo do fornecedor; ela armazena apenas o código identificador dele (**Chave Estrangeira / `idFornecedor**`). Porém, para o operador do PDV, decorar números de ID é inviável.

Para resolver esse problema de usabilidade, criamos uma ponte visual entre o **nome legível** e o **ID relacional**:

```
+-----------------------------------+       +--------------------------------------+
|      BANCO DE DADOS (MySQL)       |       |       CONTROLLER (ArrayList)         |
|  idFornecedor: 3                  | ----> |  Fornecedor(id=3, nome="Distrib. X") |
|  nome: "Distribuidora X"          |       +--------------------------------------+
+-----------------------------------+                          |
                                                               v
+-----------------------------------+       +--------------------------------------+
|    CAMPO OCULTO/BLOQUEADO         |       |        JCOMBOBOX (Interface)         |
|  textIDFornecedor: "3"            | <---- |  Item exibido: "3 - Distribuidora X" |
| (Usado no INSERT do Produto)      | split |  (Selecionado pelo operador)         |
+-----------------------------------+       +--------------------------------------+

```

> **Analogia da Etiqueta com Código de Barras:**
O `JComboBox` funciona como a prateleira de uma loja onde o cliente escolhe o produto olhando para o nome impresso na embalagem (`"3 - Distribuidora X"`). Por baixo dos panos, o leitor `.split(" - ")[0]` lê apenas o código numérico (`"3"`) e o envia para o caixa (`textIDFornecedor`) registrar a operação no sistema.

---

## Manipulação de Strings com `.split()`

O método `String.split(separador)` divide um texto em várias partes sempre que encontra o padrão delimitador informado, devolvendo um **Array estático (`String[]`)** com os pedaços recortados:

* **Texto original:** `"15 - Atacadão São Paulo"`
* **Comando:** `selecionado.split(" - ")`
* **Resultado em memória:** `["15", "Atacadão São Paulo"]`
* Índice `[0]` ➔ `"15"` (O ID que vai para `textIDFornecedor`)
* Índice `[1]` ➔ `"Atacadão São Paulo"` (O nome do fornecedor)

---

**Conceitos Fundamentais**

## Regras de Validação no Cadastro de Produtos

Cada tipo de dado de um produto exige uma regra de negócio específica na interface gráfica:

* **`new Validador(100)`**: Usado em `textDescricao` e `textCategoria`, limitando o tamanho ao limite do `VARCHAR(100)` do banco.
* **`new Validador(10, "decimal")`**: Usado em `textPrecoCusto` e `textPrecoVenda`, permitindo apenas números e um único separador decimal (ponto ou vírgula).
* **`new Validador(10, "inteiro")`**: Usado em `textQuantidade` e `textEstoqueMinimo`, bloqueando letras, sinais negativos ou números fracionados.

## Coleções Dinâmicas no Retorno de Consultas (`ArrayList<Fornecedor>`)

Quando uma consulta SQL retorna múltiplas linhas (como todos os fornecedores cadastrados), não sabemos previamente quantos registros existem na tabela. Por isso, o método `listarFornecedores()` instancia um `ArrayList<Fornecedor>`, percorre o `ResultSet` com um laço `while (rs.next())` e adiciona cada objeto à lista dinâmica.

## Encapsulamento na Classe Model `Produto`

A classe `Produto.java` reúne todos os atributos de uma mercadoria (incluindo `codigoBarras`, `precoCusto`, `precoVenda`, `quantidade`, `estoqueMinimo` e `idFornecedor`), utilizando modificadores `private` e métodos públicos `get` e `set` para trafegar dados com segurança entre a `View` e o `Controller`.

---

### Código / Exemplos Práticos

**Arquivo 1: Modelo de Dados de Produto (`Produto.java`)**

```java
package model;

/**
 * JavaBean que representa o Modelo de Dados da tabela 'produtos'.
 * 
 * @author Bruss Loza
 */
public class Produto {

    // Atributos privados mapeados conforme as colunas do banco de dados
    private int idProduto;
    private String codigoBarras;
    private String descricao;
    private String categoria;
    private double precoCusto;
    private double precoVenda;
    private int quantidade;
    private int estoqueMinimo;
    private int idFornecedor;

    // --- GETTERS E SETTERS ---

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

---

**Arquivo 2: Controller Inicial de Produtos (`ProdutoController.java`)**

```java
package controller;

import database.Database;

/**
 * Classe responsável por gerenciar as regras de negócio e operações CRUD de Produtos.
 * 
 * @author Bruss Loza
 */
public class ProdutoController {

    // Instância de acesso ao banco de dados MySQL
    Database database = new Database();

    // Métodos CRUD de Produtos serão implementados nas próximas etapas
}

```

---

**Arquivo 3: Controller de Fornecedores com Listagem (`FornecedorController.java`)**

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
import java.util.ArrayList;

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
 * Controller de Fornecedores contendo CRUD completo, Relatório PDF e Listagem para ComboBox.
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
    // 5. RELATÓRIO DE FORNECEDORES (PDF)
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

            PdfPTable tabela = new PdfPTable(4);
            tabela.setWidths(new float[] {3.0f, 2.0f, 3.0f, 4.0f});
            tabela.setWidthPercentage(100);

            tabela.addCell("Nome");
            tabela.addCell("Fone");
            tabela.addCell("Email");
            tabela.addCell("Site");

            int quantidade = 0;
            while (rs.next()) {
                tabela.addCell(rs.getString("nome"));
                tabela.addCell(rs.getString("fone"));
                tabela.addCell(rs.getString("email"));
                tabela.addCell(rs.getString("site"));
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

            File arquivo = new File(caminho);
            Desktop.getDesktop().open(arquivo);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =========================================================================
    // 6. LISTAR FORNECEDORES -> PREENCHIMENTO DE COMBOBOX EM PRODUTOS
    // =========================================================================
    public ArrayList<Fornecedor> listarFornecedores() {
        ArrayList<Fornecedor> lista = new ArrayList<>();
        String sql = """
            SELECT idFornecedor, nome
            FROM fornecedores
            ORDER BY nome
            """;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // Percorre todos os registros retornados pelo SELECT
            while (rs.next()) {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
                fornecedor.setNome(rs.getString("nome"));

                // Adiciona o objeto preenchido à lista dinâmica
                lista.add(fornecedor);
            }

            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Retorna a lista preenchida para a camada View
        return lista;
    }
}

```

---

**Arquivo 4: Formulário de Cadastro de Produtos (`FrmProduto.java`)**

```java
package view;

import java.awt.Cursor;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

import controller.FornecedorController;
import controller.ProdutoController;
import model.Fornecedor;
import model.Produto;
import utils.Validador;

/**
 * Formulário Modal para Cadastro e Gestão de Produtos com Seleção Dinâmica de Fornecedores.
 * 
 * @author Bruss Loza
 */
public class FrmProduto extends JDialog {

    private static final long serialVersionUID = 1L;

    // Instâncias da camada MVC
    private FornecedorController controllerFornecedor = new FornecedorController();
    private ProdutoController controllerProduto = new ProdutoController();
    private Fornecedor fornecedor = new Fornecedor();
    private Produto produto = new Produto();

    // Componentes da Interface Gráfica
    private JTextField textIDProduto;
    private JTextField textDescricao;
    private JTextField textCategoria;
    private JLabel lblCategoria;
    private JLabel lblProduto;
    private JLabel lblFornecedor;
    private JTextField textPrecoCusto;
    private JLabel lblCusto;
    private JComboBox<String> cboFornecedor;
    private JTextField textPrecoVenda;
    private JLabel lblVenda;
    private JTextField textIDFornecedor;
    private JLabel lblIDFornecedor;
    private JTextField textQuantidade;
    private JLabel lblQuantidade;
    private JTextField textEstoqueMinimo;
    private JButton btnAdicionarProduto;

    /**
     * Execução de teste individual da janela.
     */
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

    /**
     * Construtor da tela de Produtos.
     */
    public FrmProduto() {
        setModal(true);
        setResizable(false);
        setTitle("Produtos");
        setIconImage(Toolkit.getDefaultToolkit().getImage(FrmProduto.class.getResource("/img/produtos.png")));
        setBounds(100, 100, 640, 480);
        getContentPane().setLayout(null);
        setLocationRelativeTo(null); // Centraliza a tela ao abrir

        // --- CAMPO ID PRODUTO ---
        JLabel lblidProduto = new JLabel("ID");
        lblidProduto.setFont(new Font("Arial", Font.BOLD, 14));
        lblidProduto.setBounds(10, 24, 30, 20);
        getContentPane().add(lblidProduto);

        textIDProduto = new JTextField();
        textIDProduto.setEnabled(false);
        textIDProduto.setToolTipText("Id Produto");
        textIDProduto.setBounds(36, 25, 86, 20);
        getContentPane().add(textIDProduto);
        textIDProduto.setColumns(10);

        // --- CAMPO DESCRIÇÃO DO PRODUTO ---
        lblProduto = new JLabel("Produto");
        lblProduto.setFont(new Font("Arial", Font.BOLD, 14));
        lblProduto.setBounds(10, 60, 62, 20);
        getContentPane().add(lblProduto);

        textDescricao = new JTextField();
        textDescricao.setFont(new Font("Arial", Font.BOLD, 12));
        textDescricao.setBounds(80, 56, 404, 30);
        getContentPane().add(textDescricao);
        textDescricao.setColumns(10);
        textDescricao.setDocument(new Validador(100)); // Máximo 100 caracteres

        // --- CAMPO CATEGORIA ---
        lblCategoria = new JLabel("Categoria");
        lblCategoria.setFont(new Font("Arial", Font.BOLD, 14));
        lblCategoria.setBounds(10, 106, 75, 20);
        getContentPane().add(lblCategoria);

        textCategoria = new JTextField();
        textCategoria.setFont(new Font("Arial", Font.BOLD, 12));
        textCategoria.setColumns(10);
        textCategoria.setBounds(92, 107, 180, 20);
        getContentPane().add(textCategoria);
        textCategoria.setDocument(new Validador(100)); // Máximo 100 caracteres

        // --- SELEÇÃO DE FORNECEDOR (JCOMBOBOX) ---
        lblFornecedor = new JLabel("Fornecedor");
        lblFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
        lblFornecedor.setBounds(282, 106, 86, 20);
        getContentPane().add(lblFornecedor);

        cboFornecedor = new JComboBox<String>();
        cboFornecedor.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Captura o item selecionado no formato "ID - Nome"
                String selecionado = (String) cboFornecedor.getSelectedItem();
                
                if (selecionado != null && !selecionado.equals("Selecione")) {
                    // Extrai apenas o ID antes do separador " - "
                    String id = selecionado.split(" - ")[0];
                    textIDFornecedor.setText(id);
                } else {
                    textIDFornecedor.setText("");
                }
            }
        });
        cboFornecedor.setBounds(378, 106, 180, 22);
        getContentPane().add(cboFornecedor);

        // --- CAMPO ID DO FORNECEDOR VINCULADO ---
        lblIDFornecedor = new JLabel("ID Fornecedor");
        lblIDFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
        lblIDFornecedor.setBounds(496, 180, 103, 20);
        getContentPane().add(lblIDFornecedor);

        textIDFornecedor = new JTextField();
        textIDFornecedor.setEnabled(false);
        textIDFornecedor.setFont(new Font("Arial", Font.BOLD, 12));
        textIDFornecedor.setColumns(10);
        textIDFornecedor.setBounds(496, 139, 100, 30);
        getContentPane().add(textIDFornecedor);

        // --- CAMPOS DE PREÇO (CUSTO E VENDA) ---
        lblCusto = new JLabel("Custo");
        lblCusto.setFont(new Font("Arial", Font.BOLD, 14));
        lblCusto.setBounds(10, 142, 47, 20);
        getContentPane().add(lblCusto);

        textPrecoCusto = new JTextField();
        textPrecoCusto.setFont(new Font("Arial", Font.BOLD, 12));
        textPrecoCusto.setColumns(10);
        textPrecoCusto.setBounds(59, 138, 100, 30);
        getContentPane().add(textPrecoCusto);
        textPrecoCusto.setDocument(new Validador(10, "decimal")); // Validação decimal

        lblVenda = new JLabel("Venda");
        lblVenda.setFont(new Font("Arial", Font.BOLD, 14));
        lblVenda.setBounds(195, 142, 47, 20);
        getContentPane().add(lblVenda);

        textPrecoVenda = new JTextField();
        textPrecoVenda.setFont(new Font("Arial", Font.BOLD, 12));
        textPrecoVenda.setColumns(10);
        textPrecoVenda.setBounds(252, 138, 100, 30);
        getContentPane().add(textPrecoVenda);
        textPrecoVenda.setDocument(new Validador(10, "decimal")); // Validação decimal

        // --- CAMPOS DE CONTROLE DE ESTOQUE ---
        lblQuantidade = new JLabel("Quantidade");
        lblQuantidade.setFont(new Font("Arial", Font.BOLD, 14));
        lblQuantidade.setBounds(10, 202, 86, 20);
        getContentPane().add(lblQuantidade);

        textQuantidade = new JTextField();
        textQuantidade.setFont(new Font("Arial", Font.BOLD, 12));
        textQuantidade.setColumns(10);
        textQuantidade.setBounds(101, 198, 100, 30);
        getContentPane().add(textQuantidade);
        textQuantidade.setDocument(new Validador(10, "inteiro")); // Validação inteiro

        JLabel lblEstoqueMinimo = new JLabel("Estoque Mínimo");
        lblEstoqueMinimo.setFont(new Font("Arial", Font.BOLD, 14));
        lblEstoqueMinimo.setBounds(224, 202, 120, 20);
        getContentPane().add(lblEstoqueMinimo);

        textEstoqueMinimo = new JTextField();
        textEstoqueMinimo.setFont(new Font("Arial", Font.BOLD, 12));
        textEstoqueMinimo.setColumns(10);
        textEstoqueMinimo.setBounds(345, 198, 100, 30);
        getContentPane().add(textEstoqueMinimo);
        textEstoqueMinimo.setDocument(new Validador(10, "inteiro")); // Validação inteiro

        // --- ILUSTRAÇÃO DECORATIVA ---
        JLabel lblIlustracao = new JLabel("");
        lblIlustracao.setIcon(new ImageIcon(FrmProduto.class.getResource("/img/produtos2.png")));
        lblIlustracao.setBounds(471, 302, 128, 128);
        getContentPane().add(lblIlustracao);

        // --- BOTÃO ADICIONAR PRODUTO ---
        btnAdicionarProduto = new JButton("");
        btnAdicionarProduto.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Evento de inserção será conectado na próxima aula
            }
        });
        btnAdicionarProduto.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnAdicionarProduto.setToolTipText("Adicionar Produto");
        btnAdicionarProduto.setIcon(new ImageIcon(FrmProduto.class.getResource("/img/addproduto.png")));
        btnAdicionarProduto.setBounds(21, 338, 75, 73);
        getContentPane().add(btnAdicionarProduto);

        // Carrega os fornecedores do banco para o JComboBox assim que a tela abre
        carregarFornecedor();
    }

    /**
     * Consulta o banco de dados via Controller e preenche o cboFornecedor.
     */
    private void carregarFornecedor() {
        // Limpa itens anteriores
        cboFornecedor.removeAllItems();

        // Adiciona a instrução padrão na primeira posição
        cboFornecedor.addItem("Selecione");

        // Busca a lista ordenada no banco de dados
        ArrayList<Fornecedor> lista = controllerFornecedor.listarFornecedores();

        // Percorre a lista adicionando no formato "ID - Nome"
        for (Fornecedor fornecedor : lista) {
            cboFornecedor.addItem(fornecedor.getIdFornecedor() + " - " + fornecedor.getNome());
        }
    }
}

```

---

**Desmontando o Código**

**Desmontando o Carregamento Dinâmico (`carregarFornecedor()`)**

```java
cboFornecedor.removeAllItems();
cboFornecedor.addItem("Selecione");

ArrayList<Fornecedor> lista = controllerFornecedor.listarFornecedores();

for (Fornecedor fornecedor : lista) {
    cboFornecedor.addItem(fornecedor.getIdFornecedor() + " - " + fornecedor.getNome());
}

```

1. **`cboFornecedor.removeAllItems()`**: Esvazia a caixa de seleção antes de preenchê-la, evitando duplicação de itens caso o método seja chamado mais de uma vez.
2. **`cboFornecedor.addItem("Selecione")`**: Insere um texto orientativo na posição 0, garantindo que nenhum fornecedor fique selecionado por engano ao abrir a tela.
3. **`for (Fornecedor fornecedor : lista)`**: Utiliza o laço *For-Each* para percorrer cada objeto `Fornecedor` retornado do MySQL e concatenar seu ID e nome em uma única String legível.

---

**Desmontando a Extração do ID com `.split()`**

```java
String selecionado = (String) cboFornecedor.getSelectedItem();

if (selecionado != null && !selecionado.equals("Selecione")) {
    String id = selecionado.split(" - ")[0];
    textIDFornecedor.setText(id);
} else {
    textIDFornecedor.setText("");
}

```

1. **`(String) cboFornecedor.getSelectedItem()`**: Obtém o item atualmente selecionado na caixa suspensa e faz o *casting* para `String`.
2. **`!selecionado.equals("Selecione")`**: Verifica se o usuário escolheu um fornecedor real e não deixou na opção inicial `"Selecione"`.
3. **`selecionado.split(" - ")[0]`**: Quebra a String onde houver `" - "` e pega exclusivamente o elemento de índice `0` (o número do ID), preenchendo o campo `textIDFornecedor`.

---

**Passo a Passo**

**Passo a Passo: Testando o Vínculo Dinâmico de Fornecedores em `FrmProduto`**

1. **Passo 1: Iniciar a Aplicação:**
* No Eclipse, abra `Main.java` e execute (`Ctrl + F11`).


2. **Passo 2: Abrir o Módulo de Produtos:**
* Clique no botão **Produtos** no painel lateral.
* Assim que a janela `FrmProduto` abrir, o método `carregarFornecedor()` será executado automaticamente no construtor.


3. **Passo 3: Validar o Preenchimento do `JComboBox`:**
* Clique na seta do campo **Fornecedor** (`cboFornecedor`).
* Verifique se a primeira opção é `"Selecione"` e se logo abaixo aparecem todos os fornecedores cadastrados no banco de dados ordenados alfabeticamente no formato `"1 - Nome da Empresa"`.


4. **Passo 4: Testar a Extração Automática do ID:**
* Selecione um dos fornecedores da lista.
* Observe o campo bloqueado **ID Fornecedor** (`textIDFornecedor`) ao lado direito: ele deve exibir imediatamente apenas o número identificador correspondente àquele fornecedor.
* Volte a selecionar `"Selecione"` e confirme que o campo `textIDFornecedor` fica vazio novamente.


5. **Passo 5: Testar as Validações dos Campos:**
* Tente digitar letras nos campos **Custo**, **Venda**, **Quantidade** ou **Estoque Mínimo** e confirme que a classe `Validador` bloqueia os caracteres inválidos.

---

## Tabelas Comparativas

**Configuração dos Validadores em `FrmProduto.java`**

| Campo (`JTextField`) | Configuração do `Validador` | O que aceita? | O que bloqueia? |
| --- | --- | --- | --- |
| **`textDescricao`** | `new Validador(100)` | Qualquer caractere até 100 posições. | Caracteres além da 100ª posição. |
| **`textCategoria`** | `new Validador(100)` | Qualquer caractere até 100 posições. | Caracteres além da 100ª posição. |
| **`textPrecoCusto`** | `new Validador(10, "decimal")` | Dígitos `0-9` e até uma vírgula/ponto. | Letras, espaços, múltiplos pontos/vírgulas. |
| **`textPrecoVenda`** | `new Validador(10, "decimal")` | Dígitos `0-9` e até uma vírgula/ponto. | Letras, espaços, múltiplos pontos/vírgulas. |
| **`textQuantidade`** | `new Validador(10, "inteiro")` | Apenas dígitos inteiros `0-9`. | Letras, pontos, vírgulas, sinais negativos. |
| **`textEstoqueMinimo`** | `new Validador(10, "inteiro")` | Apenas dígitos inteiros `0-9`. | Letras, pontos, vírgulas, sinais negativos. |

---

**Métodos de Execução de Queries no JDBC**

| Método na Interface `Connection` | Finalidade | Uso Recomendado |
| --- | --- | --- |
| **`con.prepareStatement(sql)`** | Compila instruções SQL padrão (`SELECT`, `INSERT`, `UPDATE`, `DELETE`). | **Padrão** para todas as operações CRUD em tabelas. |
| **`con.prepareCall(sql)`** | Prepara chamadas para *Stored Procedures* armazenadas no banco. | Apenas quando executar procedures (`CALL nome_procedure()`). |

---

## Erros Comuns e Cuidados

**Loop Infinito (`StackOverflowError`) por Chamada Recursiva Acidental**

No final do método `listarFornecedores()`, escrever `return listarFornecedores();` em vez de `return lista;` faz com que o método chame a si mesmo infinitamente até estourar a memória da pilha de execução do Java:

```java
// ❌ ERRO GRAVE (Gera java.lang.StackOverflowError e trava o programa!):
public ArrayList<Fornecedor> listarFornecedores() {
    ArrayList<Fornecedor> lista = new ArrayList<>();
    // ...
    return listarFornecedores(); 
}

// ✅ CORRETO (Devolve a coleção preenchida):
public ArrayList<Fornecedor> listarFornecedores() {
    ArrayList<Fornecedor> lista = new ArrayList<>();
    // ...
    return lista; 
}

```

---

**Inconsistência de Texto na Verificação do `JComboBox`**

Se o método `carregarFornecedor()` adiciona o item `"Selecione"`, mas o evento `ActionListener` verifica `!selecionado.equals("Selecionado")`, a condição será sempre verdadeira quando o usuário voltar para a opção padrão, fazendo o `.split(" - ")[0]` escrever a palavra `"Selecione"` dentro do campo numérico `textIDFornecedor`!

* **Solução:** Garanta que a String comparada no `if` seja exatamente idêntica à String adicionada no início da lista (`"Selecione"`).

---

## 9. Correções Técnicas Das Minhas Anotações

Durante a revisão do rascunho de aula, identifiquei e corrigi os seguintes pontos críticos para garantir que a aplicação funcione sem falhas em tempo de execução:

1. **Correção de Recursão Infinita em `FornecedorController.java`:** No final do código completo do rascunho, o método `listarFornecedores()` terminava com `return listarFornecedores();`, o que causaria um `StackOverflowError` imediato ao abrir a tela de produtos. Corrigi o retorno para **`return lista;`**.
2. **Correção do Filtro de Texto no `cboFornecedor` (`FrmProduto.java`):** O rascunho verificava `!selecionado.equals("Selecionado")`, enquanto o método `carregarFornecedor()` adicionava `"Selecione"`. Ajustei a verificação para **`!selecionado.equals("Selecione")`** para evitar que a palavra `"Selecione"` fosse inserida no campo `textIDFornecedor`.
3. **Uso de `prepareStatement` em `listarFornecedores()`:** Substituí `con.prepareCall(sql)` por **`con.prepareStatement(sql)`**, que é a interface correta do JDBC para consultas `SELECT`.
4. **Ortografia na Classe Model `Produto.java` e na Tela `FrmProduto.java`:** Corrigi a grafia do atributo `quatidade` para **`quantidade`** (e seus respectivos `getQuantidade()` / `setQuantidade()`), além de padronizar **`textEstoqueMinimo`**, o rótulo **`"Estoque Mínimo"`** e o nome da classe **`FrmProduto`** em *PascalCase*.

---

## 10. Conteúdo Complementar e Aprofundamento

### Preparando o Banco de Dados para o CRUD de Produtos

Com a classe `Produto.java` modelada contendo o atributo `codigoBarras`, vale atualizar a estrutura da tabela `produtos` no **MySQL Workbench** para incluir essa coluna antes de programarmos o método `adicionar()` no `ProdutoController`:

```sql
USE blpdv;

CREATE TABLE produtos (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    codigoBarras VARCHAR(50),
    descricao VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    precoCusto DECIMAL(10, 2) NOT NULL,
    precoVenda DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    estoqueMinimo INT NOT NULL,
    idFornecedor INT NOT NULL,
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (idFornecedor)
    REFERENCES fornecedores(idFornecedor)
) DEFAULT CHARSET = utf8;

```

---

## Resumo Relâmpago — 10 Linhas

1. Os campos de `FrmProduto` receberam instâncias da classe `Validador` para restringir tamanhos e tipos.
2. Preços (`textPrecoCusto` e `textPrecoVenda`) utilizam a validação `"decimal"`, enquanto estoques utilizam `"inteiro"`.
3. A classe `Produto.java` no pacote `model` encapsula todos os atributos e a chave estrangeira `idFornecedor`.
4. A classe `ProdutoController.java` foi criada no pacote `controller` para centralizar o CRUD de mercadorias.
5. O método `listarFornecedores()` consulta o banco e retorna uma coleção dinâmica `ArrayList<Fornecedor>`.
6. Em métodos que retornam listas, deve-se retornar a variável da coleção (`return lista;`) e nunca chamar o próprio método recursivamente.
7. O método `carregarFornecedor()` limpa o `JComboBox`, adiciona `"Selecione"` e popula os itens no formato `"ID - Nome"`.
8. O evento `ActionListener` do `cboFornecedor` captura a escolha do usuário usando `getSelectedItem()`.
9. O método `.split(" - ")[0]` extrai apenas o código numérico antes do hífen e o exibe em `textIDFornecedor`.
10. O campo `textIDFornecedor` permanece desabilitado (`setEnabled(false)`) para evitar alterações manuais na chave estrangeira.

---

## Guia Rápido de Memorização

### Preencher `JComboBox` a partir de um `ArrayList`

```java
cboFornecedor.removeAllItems();
cboFornecedor.addItem("Selecione");
for (Fornecedor f : controllerFornecedor.listarFornecedores()) {
    cboFornecedor.addItem(f.getIdFornecedor() + " - " + f.getNome());
}

```

### Extrair ID de um Item `"ID - Nome"` no `JComboBox`

```java
String selecionado = (String) cboFornecedor.getSelectedItem();
if (selecionado != null && !selecionado.equals("Selecione")) {
    textIDFornecedor.setText(selecionado.split(" - ")[0]);
} else {
    textIDFornecedor.setText("");
}

```
