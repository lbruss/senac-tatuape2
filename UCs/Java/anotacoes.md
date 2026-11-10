# Operações CRUD: Pesquisa (Read), Edição (Update) e Limpeza de Formulário em Java Swing (Projeto BL-PDV)

---

## 1. Visão Geral

Nesta aula, dei continuidade à construção do módulo de fornecedores do **BL-PDV**, avançando na implementação dos métodos **Read (Leitura/Busca)** e **Update (Atualização/Edição)** do ciclo **CRUD**.

Foram integradas as seguintes funcionalidades à aplicação:

1. **Limpeza de Campos (`limparCampos()`):** Implementação de um método utilitário acionado pelo botão `btnLimpar` para redefinir o estado dos componentes visuais e reabilitar o botão `btnAdicionar`.
2. **Pesquisa por Nome (`buscar()`):** Consulta ao banco de dados MySQL utilizando a instrução SQL `LIKE %...%` e a interface `ResultSet`. Caso o fornecedor seja encontrado, seus dados preenchem a tela e o botão `btnAdicionar` é desabilitado para evitar duplicidade.
3. **Mapeamento da Tecla Enter (`setDefaultButton`):** Associação do botão `btnBuscar` ao acionamento da tecla **Enter** do teclado no formulário.
4. **Edição de Dados (`editarFornecedor()`):** Execução do comando SQL `UPDATE` filtrado pela chave primária (`idFornecedor`), permitindo alterar nome, telefone, e-mail e site de registros existentes.

---

## 2. Entendendo o Conceito

### A. O Ciclo de Vida dos Estados do Formulário (Inserção vs. Edição)

Em formulários de cadastro comerciais, a interface deve alternar dinamicamente entre dois modos de operação para evitar erros do usuário:

* **Modo Inserção (Novo Registro):** O campo `textID` está vazio e o botão `btnAdicionar` está **habilitado**. O operador digite os dados e clica em "Adicionar" para gerar um novo registro no banco.
* **Modo Edição (Registro Existente):** Ao realizar uma busca com sucesso, os dados do fornecedor são carregados na tela, o `textID` exibe o código gravado e o botão `btnAdicionar` fica **desabilitado**. Nesse estado, o operador só pode **Editar** os dados existentes ou **Limpar** o formulário para voltar ao modo de inserção.

```
                  +--------------------------+
                  |  Formulário Inicializado |
                  | (btnAdicionar Habilitado)|
                  +--------------------------+
                               |
            +------------------+------------------+
            |                                     |
    [Clique em Buscar]                    [Clique em Limpar]
            |                                     |
            v                                     v
+-----------------------+              +---------------------+
|  Fornecedor Encontrado|              |  Campos Resetados   |
| (btnAdicionar FALSE)  |              | (btnAdicionar TRUE) |
+-----------------------+              +---------------------+

```

---

### B. Pesquisa Flexível com o Operador SQL `LIKE`

Em vez de exigir que o usuário digite o nome exato e completo do fornecedor, utilizamos o operador SQL `LIKE ?` concatenado com o caractere coringa `%`.

Isso permite localizar fornecedores mesmo que o operador digite apenas parte do nome (ex: pesquisar `"Tatuapé"` encontra `"Distribuidora Senac Tatuapé Ltda"`).

---

### C. A Interface `ResultSet` (Navegação de Resultados)

Quando executamos um `SELECT` no banco através do método `stmt.executeQuery()`, o MySQL devolve uma tabela temporária de resultados encapsulada no objeto **`ResultSet`**.

O método `rs.next()` desloca o ponteiro da tabela para a primeira linha encontrada:

* Se retornar `true`: indica que o registro existe e extraímos seus valores com `rs.getInt()` e `rs.getString()`.
* Se retornar `false`: indica que a consulta não retornou resultados.

---

## 3. Conceitos Fundamentais

### 1. Associação da Tecla Enter via `getRootPane().setDefaultButton()`

Permite configurar um botão padrão para ser acionado automaticamente quando o usuário pressionar a tecla **Enter** em qualquer campo do formulário `JDialog`.

### 2. O Método SQL `UPDATE` com Filtro `WHERE`

A instrução SQL para alteração de dados **exige obrigatoriamente** a cláusula `WHERE idFornecedor = ?`. Sem a cláusula `WHERE`, o banco de dados atualizará **todos os registros da tabela** indiscriminadamente.

### 3. Conversão de Tipos com `Integer.parseInt()` e `String.valueOf()`

* **`String.valueOf(int)`:** Converte o ID numérico vindo do banco em `String` para exibição no `JTextField`.
* **`Integer.parseInt(String)`:** Converte o ID textual da tela de volta para `int` antes de enviá-lo à instrução SQL do Controller.

---

## 4. Código / Exemplos Práticos

### Arquivo 1: Camada Controller Atualizada (`FornecedorController.java`)

```java
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.Database;
import model.Fornecedor;

/**
 * Controller responsável pelo processamento de regras de negócio e operações CRUD de Fornecedores.
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
            System.err.println("Erro ao adicionar fornecedor: " + e.getMessage());
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

            // Adiciona os caracteres coringa % para busca parcial
            stmt.setString(1, "%" + nome + "%");

            ResultSet rs = stmt.executeQuery();

            // Se encontrar ao menos um registro correspondente
            if (rs.next()) {
                fornecedor = new Fornecedor();
                fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
                fornecedor.setNome(rs.getString("nome"));
                fornecedor.setFone(rs.getString("fone"));
                fornecedor.setEmail(rs.getString("email"));
                fornecedor.setSite(rs.getString("site"));
            }

            // Encerramento ordenado dos recursos de banco
            rs.close();
            stmt.close();
            con.close();

            return fornecedor;

        } catch (Exception e) {
            System.err.println("Erro ao buscar fornecedor: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    // =========================================================================
    // 3. CRUD UPDATE - EDITAR FORNECEDOR EXISTENTE
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

            // Preenchimento dos parâmetros ordenados (1 a 5)
            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getFone());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getSite());
            stmt.setInt(5, fornecedor.getIdFornecedor());

            // Executa a alteração na tabela
            stmt.executeUpdate();

            stmt.close();
            con.close();

        } catch (Exception e) {
            System.err.println("Erro ao editar fornecedor: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

```

---

### Arquivo 2: Formulário Modal de Fornecedores (`FrmFornecedor.java`)

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
 * Interface Gráfica de Cadastro, Consulta, Edição e Limpeza de Fornecedores.
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
    
    // Botões de Ação
    private JButton btnAdicionar;
    private JButton btnLimpar;
    private JButton btnBuscar;
    private JButton btnEditar;

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

        // Instanciação da camada MVC
        FornecedorController controller = new FornecedorController();
        Fornecedor fornecedor = new Fornecedor();

        // --- CAMPOS DO FORMULÁRIO ---
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
        lblNome.setBounds(10, 44, 48, 17);
        getContentPane().add(lblNome);

        textNome = new JTextField();
        textNome.setColumns(10);
        textNome.setBounds(57, 43, 281, 20);
        getContentPane().add(textNome);
        textNome.setDocument(new Validador(50, "texto"));

        lblFone = new JLabel("Fone");
        lblFone.setFont(new Font("Arial", Font.BOLD, 14));
        lblFone.setBounds(10, 72, 48, 17);
        getContentPane().add(lblFone);

        textFone = new JTextField();
        textFone.setColumns(10);
        textFone.setBounds(57, 71, 121, 20);
        getContentPane().add(textFone);
        textFone.setDocument(new Validador(20));

        lblEmail = new JLabel("Email");
        lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
        lblEmail.setBounds(10, 103, 48, 17);
        getContentPane().add(lblEmail);

        textEmail = new JTextField();
        textEmail.setColumns(10);
        textEmail.setBounds(57, 102, 281, 20);
        getContentPane().add(textEmail);
        textEmail.setDocument(new Validador(50));

        lblSite = new JLabel("Site");
        lblSite.setFont(new Font("Arial", Font.BOLD, 14));
        lblSite.setBounds(10, 138, 32, 17);
        getContentPane().add(lblSite);

        textSite = new JTextField();
        textSite.setColumns(10);
        textSite.setBounds(57, 137, 281, 20);
        getContentPane().add(textSite);

        // --- BOTÃO BUSCAR (CRUD READ) ---
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

                        // Bloqueia adição de duplicados
                        btnAdicionar.setEnabled(false);
                    } else {
                        JOptionPane.showMessageDialog(null, "Fornecedor não cadastrado");
                        limparCampos();
                    }
                }
            }
        });
        btnBuscar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnBuscar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/buscar.png")));
        btnBuscar.setBounds(350, 37, 126, 33);
        getContentPane().add(btnBuscar);

        // Associa a tecla Enter ao botão Buscar
        getRootPane().setDefaultButton(btnBuscar);

        // --- BOTÃO ADICIONAR (CRUD CREATE) ---
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
        btnAdicionar.setBounds(29, 338, 89, 73);
        getContentPane().add(btnAdicionar);

        // --- BOTÃO EDITAR (CRUD UPDATE) ---
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
                    JOptionPane.showMessageDialog(null, "Dados do fornecedor alterados com sucesso.");
                    limparCampos();
                }
            }
        });
        btnEditar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnEditar.setToolTipText("Editar");
        btnEditar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/editar.png")));
        btnEditar.setBounds(135, 338, 89, 73);
        getContentPane().add(btnEditar);

        // --- BOTÃO LIMPAR CAMPOS ---
        btnLimpar = new JButton("");
        btnLimpar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                limparCampos();
            }
        });
        btnLimpar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnLimpar.setToolTipText("Limpar campos");
        btnLimpar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/limpar.png")));
        btnLimpar.setBounds(241, 338, 89, 73);
        getContentPane().add(btnLimpar);
    }

    /**
     * Reseta todos os campos de texto do formulário e reabilita o botão Adicionar.
     */
    void limparCampos() {
        textID.setText(null);
        textNome.setText(null);
        textFone.setText(null);
        textEmail.setText(null);
        textSite.setText(null);
        btnAdicionar.setEnabled(true);
        textNome.requestFocus();
    }
}

```

---

## 5. Desmontando o Código

### A. Desmontando a Busca com `ResultSet` em `FornecedorController`

```java
stmt.setString(1, "%" + nome + "%");
ResultSet rs = stmt.executeQuery();

if (rs.next()) {
    fornecedor = new Fornecedor();
    fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
    fornecedor.setNome(rs.getString("nome"));
    // ...
}

```

1. **`"%" + nome + "%"`**: Se o usuário pesquisar por `"Senac"`, a query enviada ao MySQL será `WHERE nome LIKE '%Senac%'`, encontrando qualquer registro que contenha a palavra "Senac" no meio do nome.
2. **`ResultSet rs = stmt.executeQuery()`**: Executa a consulta de leitura (`SELECT`) e retorna a tabela de resultados.
3. **`if (rs.next())`**: Avança o ponteiro do `ResultSet` para a primeira linha encontrada. Se a busca retornar dados, instancia o objeto `Fornecedor` e preenche seus atributos usando os nomes das colunas da tabela SQL (`rs.getInt("idFornecedor")`, `rs.getString("nome")`).

---

### B. Desmontando a Edição SQL (`editarFornecedor`)

```java
String sql = "UPDATE fornecedores SET nome = ?, fone = ?, email = ?, site = ? WHERE idFornecedor = ?";
PreparedStatement stmt = con.prepareStatement(sql);

stmt.setString(1, fornecedor.getNome());
stmt.setString(2, fornecedor.getFone());
stmt.setString(3, fornecedor.getEmail());
stmt.setString(4, fornecedor.getSite());
stmt.setInt(5, fornecedor.getIdFornecedor());

stmt.executeUpdate();

```

1. **Mapeamento de Índices (1 a 5):**
* Parâmetro **1** ➔ `nome`
* Parâmetro **2** ➔ `fone`
* Parâmetro **3** ➔ `email`
* Parâmetro **4** ➔ `site`
* Parâmetro **5** ➔ `idFornecedor` (utilizado na cláusula `WHERE`)


2. **`stmt.setInt(5, ...)`**: Passa a chave primária inteira resgatada do campo `textID` da tela para garantir que apenas aquele registro específico seja atualizado no banco de dados.

---

## 6. Passo a Passo

### Passo a Passo: Testando o Ciclo de Busca, Edição e Limpeza

1. **Passo 1: Iniciar a Aplicação e Abrir o Cadastro:**
* Execute `Main.java` e clique no botão **Fornecedores**.


2. **Passo 2: Realizar uma Busca por Nome (Read):**
* No campo **Nome**, digite o nome de um fornecedor já cadastrado (ou parte dele) e pressione a tecla **Enter** (acionando o `btnBuscar`).
* Observe que os campos `ID`, `Fone`, `Email` e `Site` são preenchidos automaticamente.
* Observe que o botão **Adicionar** fica desabilitado (cinza), impedindo duplicidades.


3. **Passo 3: Editar os Dados (Update):**
* Altere o número de telefone no campo `textFone` ou o e-mail no `textEmail`.
* Clique no botão **Editar** (`btnEditar`).
* Confirme a mensagem `"Dados do fornecedor alterados com sucesso."`.
* Note que o método `limparCampos()` é chamado automaticamente, limpando a tela e reabilitando o botão **Adicionar**.


4. **Passo 4: Confirmar as Alterações no MySQL Workbench:**
* No MySQL Workbench, execute a query:



```sql
     USE blpdv;
     SELECT * FROM fornecedores;
     

```

* Verifique se as alterações foram gravadas corretamente na linha correspondente ao `idFornecedor`.

---

## 7. Tabelas Comparativas

### 1. Métodos CRUD Implementados até o Momento

| Operação CRUD | Comando SQL | Método no Controller | Método no JDBC | Ação na Interface |
| --- | --- | --- | --- | --- |
| **Create (Criar)** | `INSERT INTO` | `adicionar(fornecedor)` | `executeUpdate()` | Botão `btnAdicionar` |
| **Read (Ler)** | `SELECT ... WHERE` | `buscar(nome)` | `executeQuery()` | Botão `btnBuscar` / Tecla Enter |
| **Update (Editar)** | `UPDATE ... WHERE` | `editarFornecedor(fornecedor)` | `executeUpdate()` | Botão `btnEditar` |

---

### 2. Controle de Interface Conforme o Estado da Busca

| Estado da Tela | `textID` | `btnAdicionar` | Botão `btnEditar` / `btnLimpar` |
| --- | --- | --- | --- |
| **Inicial / Após Limpar** | Vazio | **Habilitado** (`true`) | Disponíveis para uso |
| **Após Busca com Sucesso** | Preenchido com ID | **Desabilitado** (`false`) | Prontos para editar ou limpar |

---

## 8. Erros Comuns e Cuidados

### 1. Esquecer a Cláusula `WHERE` no SQL de Update

```sql
-- ❌ PERIGO EXTREMO (Atualiza TODOS os fornecedores da base com os mesmos dados!):
UPDATE fornecedores SET nome = 'Empresa X', fone = '11 0000-0000';

-- ✅ CORRETO (Filtra apenas o fornecedor selecionado pelo ID):
UPDATE fornecedores SET nome = ?, fone = ? WHERE idFornecedor = ?;

```

---

### 2. Erro de Conversão `NumberFormatException` na Edição

Se o usuário tentar clicar no botão **Editar** com o formulário em branco (sem ter feito uma busca prévia), o campo `textID` estará vazio. Ao tentar executar `Integer.parseInt(textID.getText())`, o Java disparará a exceção `NumberFormatException`.

* **Solução:** Certifique-se de preencher o modelo com o ID apenas quando o campo `textID` não estiver vazio ou execute uma validação prévia.

---

### 3. Falha de Extensão das Imagens dos Botões

No rascunho original, as imagens oscilavam entre `.jpg` e `.png` (ex: `limpeza.jpg` vs `limpar.jpg`).

* **Cuidado:** Mantenha os nomes dos arquivos e as extensões padronizados na pasta `img` (ex: `adicionar.png`, `buscar.png`, `editar.png`, `limpar.png`).

---

## 9. Correções Técnicas Das Minhas Anotações

Durante a revisão do rascunho de aula, apliquei as seguintes correções silenciosas:

1. **Conclusão do Trecho Incompleto em `FrmFornecedor`:** No rascunho enviado, a declaração da imagem do botão editar estava cortada (`btnEditar.setIcon(new ImageIcon(frmFornecedor<`). Completei a instrução corretamente no código final: `btnEditar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/editar.png")));`.
2. **Nomenclatura das Classes e Métodos:** Mantive a classe do formulário como **`FrmFornecedor`** (em *PascalCase*) e os métodos do Controller em *camelCase* (`adicionar`, `buscar`, `editarFornecedor`).
3. **Redirecionamento do Foco Visual:** Adicionei a chamada `textNome.requestFocus()` dentro do método `limparCampos()` para que o cursor volte a piscar no primeiro campo da tela após o formulário ser resetado.

---

## 10. Conteúdo Complementar e Aprofundamento

### Exibindo Mensagem Específica Quando a Busca Encontra Múltiplos Registros

O operador `LIKE "%" + nome + "%"` pode retornar mais de um fornecedor caso haja nomes parecidos na base (ex: `"Distribuidora A"` e `"Distribuidora B"`).

Atualmente, o laço `if (rs.next())` pega apenas o **primeiro** registro retornado. Em módulos futuros do sistema, evoluiremos essa funcionalidade para exibir uma lista de seleção ou tabela (`JTable`) quando a busca encontrar mais de um resultado.

---

## Resumo Relâmpago — 10 Linhas

1. O método `limparCampos()` apaga os textos do formulário e reabilita o botão `btnAdicionar`.
2. A busca utiliza o operador SQL `LIKE ?` concatenado com `%` para pesquisas parciais.
3. O método `stmt.executeQuery()` executa o `SELECT` e retorna um objeto `ResultSet`.
4. O método `rs.next()` avança o ponteiro e verifica se existem resultados na consulta.
5. O comando `getRootPane().setDefaultButton(btnBuscar)` vincula o acionamento da tecla Enter ao botão Buscar.
6. Ao localizar um fornecedor, o botão `btnAdicionar` é desabilitado (`setEnabled(false)`) para evitar duplicidade.
7. O comando SQL `UPDATE fornecedores SET ... WHERE idFornecedor = ?` altera os dados no banco.
8. A conversão da chave primária para a atualização é feita via `Integer.parseInt(textID.getText())`.
9. É obrigatório incluir a cláusula `WHERE` no `UPDATE` para evitar alterar todas as linhas da tabela.
10. O teste final no MySQL Workbench via `SELECT * FROM fornecedores;` valida a gravação das edições.

---

## Guia Rápido de Memorização

### Consulta SQL Parcial (Read)

```java
String sql = "SELECT * FROM fornecedores WHERE nome LIKE ?";
stmt.setString(1, "%" + nome + "%");
ResultSet rs = stmt.executeQuery();
if (rs.next()) { /* Carrega dados */ }

```

### Alteração SQL por ID (Update)

```java
String sql = "UPDATE fornecedores SET nome=?, fone=?, email=?, site=? WHERE idFornecedor=?";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setString(1, f.getNome());
// ...
stmt.setInt(5, f.getIdFornecedor());
stmt.executeUpdate();

```
