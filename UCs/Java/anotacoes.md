# Conclusão do CRUD: Exclusão de Registros (Delete) com Confirmação Visual em Java Swing (Projeto BL-PDV)

**Visão Geral**

Nesta aula, finalizei o ciclo completo do **CRUD** (Create, Read, Update, Delete) no cadastro de fornecedores do **BL-PDV** ao implementar a funcionalidade de **Exclusão de Registros (Delete)**.

Com este avanço:

1. criei o botão de exclusão (`btnExcluir`) na interface gráfica `FrmFornecedor.java`, integrando uma caixa de diálogo de confirmação com `JOptionPane.showConfirmDialog()`;
2. implementei o método `excluir(int idFornecedor)` na classe `FornecedorController.java`, utilizando o comando SQL `DELETE FROM fornecedores WHERE idFornecedor = ?` acionado via `PreparedStatement`;
3. completei a validação do fluxo end-to-end (View ➔ Controller ➔ Banco de Dados), testando a busca, confirmação visual de exclusão, limpeza automática da tela e verificação final da tabela no **MySQL Workbench**.

---

**Entendendo o Conceito**

## Operações Destrutivas e Caixas de Confirmação

No desenvolvimento de sistemas de gestão, a exclusão física de um registro da base de dados é uma ação **irreversível**. Se o operador clicar no botão "Excluir" por engano, os dados serão perdidos permanentemente caso não haja uma camada de segurança.

Por esse motivo, **nunca devemos executar um `DELETE` diretamente ao clicar no botão**.

Utilizamos uma caixa de diálogo de confirmação visual (`showConfirmDialog`). O sistema só envia a instrução ao banco se o usuário clicar explicitamente na opção **SIM** (`YES_OPTION`).

> **Analogia da Lixeira do Sistema Operacional:**

Imagine que você selecionou um arquivo importante no seu computador. Quando você aperta a tecla *Delete*, o sistema operacional exibe a pergunta: *"Tem certeza que deseja mover este arquivo para a lixeira?"*. A caixa `JOptionPane.showConfirmDialog` funciona exatamente como esse aviso de confirmação.

---

## O Ciclo Completo do CRUD no Projeto BL-PDV

Com a adição da funcionalidade de exclusão, o padrão de arquitetura em 3 camadas do módulo de fornecedores atinge sua forma completa:

```
                                 +------------------------+
                                 |  FORMULÁRIO (VIEW)     |
                                 |   (FrmFornecedor.java) |
                                 +------------------------+
                                              |
      +-------------------+-------------------+-------------------+-------------------+
      |                   |                   |                   |                   |
 [1. CREATE]         [2. READ]           [3. UPDATE]         [4. DELETE]              |
btnAdicionar         btnBuscar           btnEditar           btnExcluir               |
      |                   |                   |                   |                   v
      v                   v                   v                   v          (Confirmação YES)
+-------------------------------------------------------------------------------------+
|                             CAMADA CONTROLLER                                        |
|                          (FornecedorController.java)                                |
+-------------------------------------------------------------------------------------+
      |                   |                   |                   |
      | INSERT INTO       | SELECT FROM       | UPDATE SET        | DELETE FROM
      v                   v                   v                   v
+-------------------------------------------------------------------------------------+
|                              BANCO DE DADOS MYSQL                                   |
|                                (Tabela fornecedores)                                |
+-------------------------------------------------------------------------------------+

```

---

**Conceitos Fundamentais**

## `JOptionPane.showConfirmDialog()`

Método estático do Swing responsável por exibir uma janela pop-up de confirmação contendo botões como "Sim", "Não" e "Cancelar".

* **Sintaxe:** `JOptionPane.showConfirmDialog(parent, mensagem, titulo, tipoDeOpcao)`
* **Retorno:** Retorna um valor inteiro representando a escolha do usuário (`JOptionPane.YES_OPTION`, `JOptionPane.NO_OPTION` ou `JOptionPane.CANCEL_OPTION`).

## `DELETE FROM` com `WHERE`

Comando da linguagem SQL para remoção de linhas em tabelas relacioanais:


$$\text{DELETE FROM fornecedores WHERE idFornecedor = ?}$$

* **Atenção Crítica:** A inclusão do filtro `WHERE idFornecedor = ?` é estritamente obrigatória. Omitir a cláusula `WHERE` provocará o apagamento de **todos os registros** contidos na tabela.

## Captura do ID para Exclusão

Diferente da busca que utiliza o campo textual do nome, o processo de exclusão deve ser realizado **exclusivamente através da chave primária (`idFornecedor`)**, garantindo que apenas o registro exato carregado na tela seja removido da base.

---

### Código / Exemplos Práticos

**Arquivo 1: Camada Controller com CRUD Completo (`FornecedorController.java`)**

```java
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.Database;
import model.Fornecedor;

/**
 * Controller responsável pelo processamento do CRUD completo da tabela 'fornecedores'.
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

            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getFone());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getSite());
            stmt.setInt(5, fornecedor.getIdFornecedor());

            stmt.executeUpdate();

            stmt.close();
            con.close();

        } catch (Exception e) {
            System.err.println("Erro ao editar fornecedor: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // =========================================================================
    // 4. CRUD DELETE - EXCLUIR FORNECEDOR POR ID
    // =========================================================================
    public void excluir(int idFornecedor) {
        String sql = """
            DELETE FROM fornecedores
            WHERE idFornecedor = ?
            """;

        try {
            Connection con = database.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);

            // Define a chave primária a ser removida
            stmt.setInt(1, idFornecedor);

            // Executa a instrução DELETE no MySQL
            stmt.executeUpdate();

            // Encerra os recursos de banco de dados
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.err.println("Erro ao excluir fornecedor: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

```

---

**Arquivo 2: Formulário Modal de Fornecedores (`FrmFornecedor.java`)**

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
 * Interface Gráfica com Suporte Completo ao CRUD de Fornecedores.
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

    // Botões de Ação do CRUD
    private JButton btnAdicionar;
    private JButton btnLimpar;
    private JButton btnBuscar;
    private JButton btnEditar;
    private JButton btnExcluir;

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

        // Instanciação da camada de controle e modelo
        FornecedorController controller = new FornecedorController();
        Fornecedor fornecedor = new Fornecedor();

        // --- COMPONENTES VISUAIS DA TELA ---
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

                        // Bloqueia adição de registros duplicados
                        btnAdicionar.setEnabled(false);
                    } else {
                        JOptionPane.showMessageDialog(null, "Fornecedor não cadastrado");
                        limparCampos();
                    }
                }
            }
        });
        getRootPane().setDefaultButton(btnBuscar); // Tecla Enter associada à Busca
        btnBuscar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnBuscar.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/buscar.png")));
        btnBuscar.setBounds(368, 37, 126, 33);
        getContentPane().add(btnBuscar);

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

        // --- BOTÃO EXCLUIR (CRUD DELETE) ---
        btnExcluir = new JButton("");
        btnExcluir.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Validação: Garante que um fornecedor foi selecionado/buscado previamente
                if (textNome.getText().isBlank() || textID.getText().isBlank()) {
                    JOptionPane.showMessageDialog(null, "Selecione ou busque um fornecedor para excluir.");
                    textNome.requestFocus();
                } else {
                    // Resgata a chave primária
                    int idFornecedor = Integer.parseInt(textID.getText());

                    // Caixa de confirmação de exclusão
                    int resposta = JOptionPane.showConfirmDialog(
                        null, 
                        "Deseja realmente excluir este fornecedor?", 
                        "Atenção!", 
                        JOptionPane.YES_NO_OPTION,
                        JOptionPane.QUESTION_MESSAGE
                    );

                    // Executa a exclusão somente se a confirmação for positiva
                    if (resposta == JOptionPane.YES_OPTION) {
                        controller.excluir(idFornecedor);
                        limparCampos();
                        JOptionPane.showMessageDialog(null, "Fornecedor excluído com sucesso.");
                    }
                }
            }
        });
        btnExcluir.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnExcluir.setToolTipText("Excluir");
        btnExcluir.setIcon(new ImageIcon(FrmFornecedor.class.getResource("/img/excluir.png")));
        btnExcluir.setBounds(241, 338, 89, 73);
        getContentPane().add(btnExcluir);

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
        btnLimpar.setBounds(347, 338, 89, 73);
        getContentPane().add(btnLimpar);
    }

    /**
     * Reseta os campos do formulário e restaura a interface para o modo Inserção.
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

**Desmontando o Código**

**Desmontando o Evento de Confirmação e Exclusão (`btnExcluir`)**

```java
int idFornecedor = Integer.parseInt(textID.getText());

int resposta = JOptionPane.showConfirmDialog(
    null, 
    "Deseja realmente excluir este fornecedor?", 
    "Atenção!", 
    JOptionPane.YES_NO_OPTION
);

if (resposta == JOptionPane.YES_OPTION) {
    controller.excluir(idFornecedor);
    limparCampos();
    JOptionPane.showMessageDialog(null, "Fornecedor excluído com sucesso.");
}

```

1. **`Integer.parseInt(textID.getText())`**: Obtém o número do ID retornado pela busca inicial e exibido no campo `textID`.
2. **`showConfirmDialog(...)`**: Exibe o pop-up com as opções "Sim" e "Não".
3. **`if (resposta == JOptionPane.YES_OPTION)`**: Avalia se a escolha do operador foi a confirmação positiva. Se o usuário clicar em "Não" ou fechar a janela no 'X', o bloco dentro do `if` é ignorado e a exclusão não ocorre.
4. **`controller.excluir(idFornecedor)`**: Envia o ID para o método de exclusão no Controller.
5. **`limparCampos()`**: Limpa a tela imediatamente para impedir tentativas de alterar ou reexcluir um registro que já não existe mais no banco.

---

**Desmontando a Instrução SQL de Deleção em `FornecedorController`**

```java
String sql = "DELETE FROM fornecedores WHERE idFornecedor = ?";
PreparedStatement stmt = con.prepareStatement(sql);

stmt.setInt(1, idFornecedor);
stmt.executeUpdate();

stmt.close();
con.close();

```

1. **`DELETE FROM fornecedores WHERE idFornecedor = ?`**: Instrução compilada no servidor MySQL. O caractere `?` especifica a chave primária que será apagada.
2. **`stmt.setInt(1, idFornecedor)`**: Vincula a variável inteira capturada na View ao primeiro `?` da query.
3. **`stmt.executeUpdate()`**: Dispara o comando `DELETE` no banco. Retorna o número de linhas removidas na tabela (neste caso, exatamente 1).
4. **`stmt.close(); con.close();`**: Garante que o recurso de instrução e a conexão com a porta do banco sejam encerrados com segurança.

---

**Passo a Passo**

**Passo a Passo: Testando a Exclusão Completa de um Fornecedor**

1. **Passo 1: Iniciar o Sistema:**
* Execute a classe `Main.java` no Eclipse (`Ctrl + F11`) e clique no botão **Fornecedores**.


2. **Passo 2: Localizar o Fornecedor a ser Excluído:**
* No campo **Nome**, digite o nome de um fornecedor de teste previamente cadastrado.
* Pressione **Enter** (acionando o botão `btnBuscar`).
* Confirme que os dados do fornecedor e o código numérico no campo `textID` foram carregados na tela.


3. **Passo 3: Disparar a Exclusão Visual:**
* Clique no botão **Excluir** (`btnExcluir`).
* Observe a mensagem da caixa de diálogo: `"Deseja realmente excluir este fornecedor?"`.


4. **Passo 4: Testar o Cancelamento:**
* Clique no botão **Não**.
* Verifique que os dados continuam preenchidos na tela e que nenhuma instrução SQL foi enviada ao banco.


5. **Passo 5: Confirmar a Exclusão:**
* Clique novamente no botão **Excluir** e desta vez clique em **Sim**.
* Observe a mensagem de sucesso: `"Fornecedor excluído com sucesso."`.
* Note que todos os campos da tela foram limpos e o botão **Adicionar** voltou a ficar ativo.


6. **Passo 6: Validação Final no MySQL Workbench:**
* Abra o MySQL Workbench e execute a query:



```sql
     USE blpdv;
     SELECT * FROM fornecedores;
     

```

* **Resultado Esperado:** O registro correspondente ao `idFornecedor` removido não deverá mais figurar na tabela de resultados, confirmando que a operação CRUD Delete foi executada com total sucesso!

---

## Tabelas Comparativas

**Quadro Resumo do CRUD Completo do Projeto BL-PDV**

| Operação | Método no Controller | Comando SQL Utilizado | Método JDBC | Ação Visual na View |
| --- | --- | --- | --- | --- |
| **Create** (Criar) | `adicionar(fornecedor)` | `INSERT INTO fornecedores ...` | `executeUpdate()` | Botão `btnAdicionar` |
| **Read** (Ler) | `buscar(nome)` | `SELECT ... WHERE nome LIKE ?` | `executeQuery()` | Botão `btnBuscar` / Enter |
| **Update** (Editar) | `editarFornecedor(fornecedor)` | `UPDATE ... WHERE idFornecedor = ?` | `executeUpdate()` | Botão `btnEditar` |
| **Delete** (Excluir) | `excluir(idFornecedor)` | `DELETE FROM ... WHERE idFornecedor = ?` | `executeUpdate()` | Botão `btnExcluir` |

---

**Tipos de Caixas de Mensagem da Classe `JOptionPane`**

| Método | Objetivo | Retorno |
| --- | --- | --- |
| **`showMessageDialog(...)`** | Exibe um aviso informativo ou mensagem de erro simples. | `void` (Apenas fecha ao clicar em OK). |
| **`showConfirmDialog(...)`** | Solicita uma tomada de decisão ao usuário (Sim, Não, Cancelar). | `int` (`YES_OPTION`, `NO_OPTION`, `CANCEL_OPTION`). |
| **`showInputDialog(...)`** | Solicita a digitação de um texto através de uma caixa de entrada. | `String` (Texto digitado ou `null`). |

---

## Erros Comuns e Cuidados

**Executar `DELETE` Sem a Cláusula `WHERE`**

```sql
-- ❌ ERRO GRAVÍSSIMO (Elimina permanentemente TODOS os registros do banco):
DELETE FROM fornecedores;

-- ✅ CORRETO (Filtra estritamente pelo ID do fornecedor em exibição):
DELETE FROM fornecedores WHERE idFornecedor = ?;

```

---

**Tentar Excluir com o Campo ID Vazio**

Se o usuário clicar no botão **Excluir** sem antes buscar um fornecedor, o campo `textID` estará vazio. Tentar executar `Integer.parseInt(textID.getText())` resultará em uma exceção `NumberFormatException`.

* **Solução:** Adicione uma validação na View verificando se `textID.getText().isBlank()` antes de prosseguir com a conversão e confirmação.

---

**Escrever `JOptionPane.YES_OPTION` de Forma Incorreta no `if`**

Tratar a resposta com números fixos (ex: `if (resposta == 0)`) torna o código frágil, pois a ordem das opções pode variar dependendo do sistema operacional ou da versão do Java.

* **Solução:** Use sempre a constante oficial `JOptionPane.YES_OPTION`.

---

## Conteúdo Complementar e Aprofundamento

**Exclusão Física (*Hard Delete*) vs. Exclusão Lógica (*Soft Delete*)**

Neste módulo, implementamos a **Exclusão Física (*Hard Delete*)**, na qual a linha é removida de fato do disco rígido do servidor MySQL através do comando `DELETE`.

Em sistemas corporativos avançados, é comum adotar a **Exclusão Lógica (*Soft Delete*)**:

* A tabela ganha uma coluna indicadora chamada `ativo (TINYINT / BOOLEAN)`.
* Em vez de rodar um `DELETE`, a aplicação roda um `UPDATE fornecedores SET ativo = false WHERE idFornecedor = ?`.
* Dessa forma, o registro deixa de aparecer para o operador na interface, mas o histórico financeiro e fiscal da empresa é preservado no banco de dados.

---

**Resumo Relâmpago**

1. O ciclo CRUD foi concluído com a adição do método de exclusão (`Delete`).
2. A exclusão exige o uso de caixas de confirmação (`JOptionPane.showConfirmDialog`).
3. A constante `JOptionPane.YES_OPTION` valida se o usuário confirmou a operação.
4. O método `excluir(int idFornecedor)` no Controller recebe apenas a chave primária.
5. O comando SQL `DELETE FROM fornecedores WHERE idFornecedor = ?` remove a linha no banco.
6. A omissão da cláusula `WHERE` em um comando `DELETE` apaga toda a tabela.
7. O método `stmt.executeUpdate()` dispara a instrução `DELETE` no servidor MySQL.
8. Após a exclusão, a função `limparCampos()` reseta a interface gráfica.
9. A conversão da chave primária textual da tela para inteiro é feita via `Integer.parseInt()`.
10. A consulta `SELECT * FROM fornecedores;` no Workbench confirma a remoção do registro.

---

## Guia Rápido de Memorização

**Exclusão SQL com PreparedStatement**

```java
String sql = "DELETE FROM fornecedores WHERE idFornecedor = ?";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setInt(1, idFornecedor);
stmt.executeUpdate();
stmt.close();

```

**Caixa de Confirmação em Java Swing**

```java
int resposta = JOptionPane.showConfirmDialog(null, "Deseja excluir?", "Atenção", JOptionPane.YES_NO_OPTION);
if (resposta == JOptionPane.YES_OPTION) {
    // Executa a exclusão
}

```
