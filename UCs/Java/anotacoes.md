# Painel Lateral de Navegação, Refatoração de Escopo e Janelas Secundárias com `JDialog` (Projeto BL-PDV)

**Visão Geral**

Nesta aula, continuei a evolução da interface gráfica do sistema **BL-PDV**, avançando na organização estrutural e no design visual do programa.

Três grandes frentes foram trabalhadas nesta etapa:

1. **Refatoração do Escopo de Variáveis e Método Dinâmico de Data:** Promovi a variável `lblData` de variável local para **atributo de classe** (`private JLabel lblData`). Isso me permitiu criar o método modular `atualizarData()`, que obtém a data atual do sistema operacional via `LocalDate` e `DateTimeFormatter` e preenche o cabeçalho dinamicamente.
2. **Construção do Painel Lateral (`panelLateral`):** Utilizei um `JPanel` com layout absoluto para criar uma barra vertical de navegação. Adicionei a logo do sistema, os títulos (`BL-PDV` e `Sistema de PDV`), botões estilizados (`btnFornecedores` e `btnSobre`) e linhas divisórias de separação.
3. **Criação de Janelas Secundárias com `JDialog` (`Sobre.java`):** Aprendi a criar janelas de diálogo independentes usando a classe `JDialog`. Modelei uma tela de informações sobre o sistema contendo logotipo, autor, versão e descrição simplificada do software.

---

**Entendendo o Conceito**

## Escopo de Variáveis em Interfaces Gráficas (Local vs. Atributo)

Quando um componente visual (como um `JLabel` ou `JTextField`) é declarado **dentro do construtor**, ele é uma **variável local**. Isso significa que ele só existe enquanto o construtor estiver sendo executado. Se tentarmos criar um método fora do construtor (como o `atualizarData()`) para modificar o texto desse rótulo, o Java não encontrará a variável.

Para resolver isso, **promovemos a variável a um atributo de classe** (`private JLabel lblData`). Assim, o componente passa a ser um campo visível por todos os métodos dentro daquela classe.

```
+-------------------------------------------------------------------+
|                        CLASSE Main (JFrame)                       |
|                                                                   |
|  [ Atributos da Classe ]                                          |
|  private JLabel lblData;  <--- (Acessível por qualquer método)   |
|                                                                   |
|  public Main() {                                                  |
|      lblData = new JLabel("");                                    |
|      atualizarData();  <----------------------+                   |
|  }                                            |                   |
|                                               | (Chamada)         |
|  private void atualizarData() {               |                   |
|      lblData.setText(...);  <-----------------+                   |
|  }                                                                |
+-------------------------------------------------------------------+

```

---

## `JFrame` vs. `JDialog`

* **`JFrame` (Janela Principal):** É a janela dona da aplicação. Possui botões de minimizar, maximizar e fechar, e representa a tela principal do sistema.
* **`JDialog` (Janela de Diálogo / Secundária):** É uma janela auxiliar projetada para exibir mensagens, confirmações, sobrevisos ou formulários curtos. Geralmente não possui botão de minimizar e pode ser configurada como **modal** (bloqueia a interação com a janela principal até que seja fechada).

> **Analogia da Casa e da Janela Pop-up:**

O `JFrame` é a estrutura da sua casa inteira (a tela do PDV onde as vendas acontecem). O `JDialog` é um aviso de recado colado na porta de entrada (a tela "Sobre" ou uma caixa de confirmação de exclusão): ele aparece para passar uma informação rápida e depois é dispensado (`dispose()`).

---

**Conceitos Fundamentais**

## Promoção de Escopo de Componentes

Sempre que um componente Swing precisar ter seu valor alterado dinamicamente durante a execução (via eventos de botão, banco de dados ou relógios), ele **deve ser declarado como atributo de instância** no topo da classe.

## O Atributo `borderPainted(false)` em `JButton`

Por padrão, o Swing desenha uma borda cinza elevada em volta dos botões. Para criar botões com design plano moderno (*flat design*), definimos a propriedade `borderPainted` para `false`. O botão passa a exibir apenas o ícone, o texto e a cor de fundo limpa.

## A Classe `JDialog`

Classe do pacote `javax.swing` especializada em janelas secundárias.

* Utiliza o método `setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE)`, que fecha e destrói **apenas a janela de diálogo**, mantendo a janela principal (`JFrame`) aberta e rodando na memória.

---

### Código / Exemplos Práticos

**Arquivo 1: Classe Principal com Painel Lateral e Data (`Main.java`)**

```java
package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Toolkit;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

import com.formdev.flatlaf.FlatLightLaf;
import database.Database;

/**
 * Janela Principal da Aplicação BL-PDV contendo Menu Lateral e Data Dinâmica.
 * 
 * @author Bruss Loza
 */
public class Main extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;
    
    // ATRIBUTO PROMOVIDO: Acessível por métodos fora do construtor
    private JLabel lblData;

    // Objeto para manipulação e testes do Banco de Dados
    Database db = new Database();

    /**
     * Execução principal do programa.
     */
    public static void main(String[] args) {
        // Aplica o tema moderno do FlatLaf
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
     * Construtor da janela principal.
     */
    public Main() {
        setTitle("BL-PDV");
        setIconImage(Toolkit.getDefaultToolkit().getImage(Main.class.getResource("/img/blpvd.png")));
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 800, 600);

        contentPane = new JPanel();
        contentPane.setForeground(Color.RED);
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        setContentPane(contentPane);
        contentPane.setLayout(null);

        // --- PAINEL LATERAL (MENU DE NAVEGAÇÃO) ---
        JPanel panelLateral = new JPanel();
        panelLateral.setBackground(new Color(40, 45, 60)); // Cor personalizada escura
        panelLateral.setBounds(0, 0, 196, 538);
        contentPane.add(panelLateral);
        panelLateral.setLayout(null);

        // Logo (Carrinho de Compras)
        JLabel lblLogo = new JLabel("");
        lblLogo.setIcon(new ImageIcon(Main.class.getResource("/img/carrinho.png")));
        lblLogo.setBounds(10, 11, 48, 48);
        panelLateral.add(lblLogo);

        // Título BL-PDV
        JLabel lblBLPDV = new JLabel("BL-PDV");
        lblBLPDV.setForeground(Color.WHITE);
        lblBLPDV.setFont(new Font("Arial", Font.BOLD, 25));
        lblBLPDV.setBounds(65, 11, 120, 30);
        panelLateral.add(lblBLPDV);

        // Subtítulo
        JLabel lblSistema = new JLabel("Sistema de PDV");
        lblSistema.setForeground(Color.LIGHT_GRAY);
        lblSistema.setFont(new Font("Arial", Font.PLAIN, 12));
        lblSistema.setBounds(65, 38, 120, 14);
        panelLateral.add(lblSistema);

        // Botão Fornecedores
        JButton btnFornecedores = new JButton("Fornecedores");
        btnFornecedores.setFont(new Font("Arial", Font.BOLD, 15));
        btnFornecedores.setIcon(new ImageIcon(Main.class.getResource("/img/fornecedor.png")));
        btnFornecedores.setBounds(10, 90, 176, 40);
        btnFornecedores.setBorderPainted(false); // Remove a borda padrão do botão
        panelLateral.add(btnFornecedores);

        // Divisória Decorativa
        JLabel lblDivisor = new JLabel("----------------------------------");
        lblDivisor.setForeground(Color.GRAY);
        lblDivisor.setBounds(10, 450, 176, 14);
        panelLateral.add(lblDivisor);

        // Botão Sobre
        JButton btnSobre = new JButton("Sobre");
        btnSobre.setFont(new Font("Arial", Font.BOLD, 15));
        btnSobre.setIcon(new ImageIcon(Main.class.getResource("/img/sobre.png")));
        btnSobre.setBounds(10, 475, 176, 40);
        btnSobre.setBorderPainted(false);
        panelLateral.add(btnSobre);

        // --- RODAPÉ: STATUS DO BANCO DE DADOS ---
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

        // --- CABEÇALHO: DATA DO SISTEMA ---
        JLabel lblCalendario = new JLabel("");
        lblCalendario.setIcon(new ImageIcon(Main.class.getResource("/img/calendario.png")));
        lblCalendario.setBounds(676, 11, 24, 36);
        contentPane.add(lblCalendario);

        // Instanciação da Label de Data (promovida a atributo)
        lblData = new JLabel("");
        lblData.setFont(new Font("Tahoma", Font.BOLD, 12));
        lblData.setBounds(710, 11, 74, 36);
        contentPane.add(lblData);

        // Teste de conexão ao carregar a janela
        if (db.testarConexao()) {
            System.out.println("Banco Conectado");
            lblMysql.setText("MySQL Conectado");
            lblStatus.setForeground(Color.GREEN);
        } else {
            System.out.println("Erro na Conexão");
            lblMysql.setText("MySQL Desconectado");
            lblStatus.setForeground(Color.RED);
        }

        // Executa o método para atualizar a data da interface
        atualizarData();
    }

    /**
     * Método responsável por obter a data do SO e formatá-la no componente lblData.
     */
    private void atualizarData() {
        DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String data = LocalDate.now().format(formatoData);
        lblData.setText(data);
    }
}

```

---

**Arquivo 2: Janela de Diálogo "Sobre" (`Sobre.java`)**

```java
package view;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Toolkit;

import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

/**
 * Janela Secundária de Diálogo (JDialog) exibindo informações do sistema.
 * 
 * @author Bruss Loza
 */
public class Sobre extends JDialog {

    private static final long serialVersionUID = 1L;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    Sobre dialog = new Sobre();
                    dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
                    dialog.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Construtor da janela de diálogo Sobre.
     */
    public Sobre() {
        setTitle("Sobre");
        setIconImage(Toolkit.getDefaultToolkit().getImage(Sobre.class.getResource("/img/sobre.png")));
        setModal(true); // Impede interação com a janela principal enquanto aberta
        setResizable(false);
        setBounds(100, 100, 270, 370);
        getContentPane().setLayout(null);

        // Título
        JLabel lblBLPDV = new JLabel("BL-PDV");
        lblBLPDV.setFont(new Font("Arial", Font.BOLD, 15));
        lblBLPDV.setHorizontalAlignment(SwingConstants.CENTER);
        lblBLPDV.setBounds(10, 20, 234, 25);
        getContentPane().add(lblBLPDV);

        // Descrição do Sistema
        JLabel lblDescricao = new JLabel("Sistema para gestão em estoque e PDV");
        lblDescricao.setFont(new Font("Arial", Font.BOLD, 12));
        lblDescricao.setHorizontalAlignment(SwingConstants.CENTER);
        lblDescricao.setBounds(10, 55, 234, 20);
        getContentPane().add(lblDescricao);

        // Autor
        JLabel lblAutor = new JLabel("Autor: Bruss Loza");
        lblAutor.setFont(new Font("Arial", Font.PLAIN, 12));
        lblAutor.setBounds(20, 100, 200, 20);
        getContentPane().add(lblAutor);

        // Versão
        JLabel lblVersao = new JLabel("Versão 1.0");
        lblVersao.setFont(new Font("Arial", Font.PLAIN, 12));
        lblVersao.setBounds(20, 130, 200, 20);
        getContentPane().add(lblVersao);
    }
}

```

---

**Desmontando o Código**

**Desmontando o Método `atualizarData()`**

```java
private void atualizarData() {
    DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    String data = LocalDate.now().format(formatoData);
    lblData.setText(data);
}

```

1. **`DateTimeFormatter.ofPattern("dd/MM/yyyy")`**: Cria uma máscara de exibição visual contendo dia com 2 dígitos, mês com 2 dígitos e ano com 4 dígitos separados por barra.
2. **`LocalDate.now()`**: Captura a data exata do sistema operacional sem informações de horário.
3. **`.format(formatoData)`**: Aplica a máscara e converte o objeto de data para uma `String` formatada (ex: `"27/10/2026"`).
4. **`lblData.setText(data)`**: Altera o texto do componente `lblData` que foi declarado como **atributo de classe**.

---

**Desmontando a Janela `Sobre.java` (`JDialog`)**

```java
public class Sobre extends JDialog { ... }

```

1. **`extends JDialog`**: Indica que esta classe é uma janela de diálogo secundária e não um `JFrame` independente.
2. **`setModal(true)`**: Configuração essencial. Faz com que a janela assuma o foco total da tela, impedindo que o usuário clique no `JFrame` principal enquanto a tela "Sobre" estiver aberta.
3. **`getContentPane().setLayout(null)`**: Aplica o layout absoluto dentro da área de conteúdo do `JDialog`.

---

**Passo a Passo**

**Passo a Passo 1: Construindo o Painel Lateral (`panelLateral`) no WindowBuilder"**

1. No Eclipse, abra a classe `Main.java` e alterne para a aba **Design**.
2. Na paleta *Containers*, selecione **`JPanel`** e clique dentro do `contentPane`.
3. Na aba *Properties*:
* Em `variable`, renomeie para `panelLateral`.
* Em `bounds`, defina a posição e dimensão: $X=0, Y=0, \text{largura}=196, \text{altura}=538$.
* Em `background`, escolha uma cor de fundo escura (ex: RGB `40, 45, 60`).
* Em `layout`, altere para **`absolute`**.


4. **Adicionando Elementos no Painel:**
* Insira uma `JLabel` com a imagem `carrinho.png` (`lblLogo`).
* Insira uma `JLabel` com o texto `"BL-PDV"`, fonte **Arial, Bold, 25**, cor branca (`lblBLPDV`).
* Insira uma `JLabel` com o texto `"Sistema de PDV"`, fonte **Arial, Plain, 12**, cor cinza claro (`lblSistema`).


5. **Adicionando o Botão Fornecedores (`btnFornecedores`):**
* Selecione `JButton` na paleta e clique dentro do `panelLateral`.
* Em `variable`, defina `btnFornecedores`.
* Em `text`, digite `"Fornecedores"`.
* Em `icon`, selecione a imagem `fornecedor.png` (32x32).
* Clique no ícone de **Show advanced properties** (símbolo de engrenagem/filtro) e desmarque a propriedade **`borderPainted`** (defina como `false`).


6. **Adicionando a Divisória e o Botão Sobre (`btnSobre`):**
* Insira uma `JLabel` com uma sequência de traços (`------------------`) próximo ao rodapé do painel.
* Insira outro `JButton` abaixo da linha com o texto `"Sobre"`, ícone `sobre.png` (32x32), e também com `borderPainted = false`.

---

**Passo a Passo 2: Criando a Janela `JDialog` (`Sobre.java`) no Eclipse**

1. Clique com o botão direito no pacote `view` ➔ **New** ➔ **Other...**.
2. Expanda **WindowBuilder** ➔ **Swing Designer** ➔ selecione **JDialog** e clique em **Next**.
3. Nomeie a classe como **`Sobre`** e clique em **Finish**.
4. Abra a classe `Sobre.java` na aba **Design**:
* Selecione os botões padrão que o WindowBuilder cria na parte inferior (`OK` e `Cancel`) e **delete-os**.
* Clique na estrutura `javax.swing.JDialog` no painel *Components* e defina o tamanho em `bounds` para **270 x 370**.
* Na propriedade `title`, digite `"Sobre"`.
* Na propriedade `iconImage`, selecione a imagem `sobre.png`.
* Na propriedade `layout` do `getContentPane()`, mude para **`absolute`**.


5. **Adicionando os Textos da Tela Sobre:**
* Adicione a `JLabel` `lblBLPDV`: texto `"BL-PDV"`, alinhamento centralizado, Arial Bold 15.
* Adicione a `JLabel` `lblDescricao`: texto `"Sistema para gestão em estoque e PDV"`, alinhamento centralizado, Arial Bold 12.
* Adicione a `JLabel` `lblAutor`: texto `"Autor: Bruss Loza"`, Arial Plain 12.
* Adicione a `JLabel` `lblVersao`: texto `"Versão 1.0"`, Arial Plain 12.



---

## Tabelas Comparativas

**`JFrame` vs. `JDialog`**

| Característica | `JFrame` | `JDialog` |
| --- | --- | --- |
| **Tipo de Janela** | Janela principal da aplicação. | Janela de diálogo/secundária. |
| **Comportamento no Fechamento** | `EXIT_ON_CLOSE` (Encerra toda a aplicação). | `DISPOSE_ON_CLOSE` (Fecha apenas a janela atual). |
| **Modalidade** | Não pode ser modal. | Pode ser **Modal** (`setModal(true)`). |
| **Uso Típico** | Tela de vendas do PDV, Dashboard. | Tela "Sobre", Avisos, Formulários Pop-up. |

---

**Variável Local vs. Atributo de Classe em GUIs**

| Característica | Variável Local (Dentro do Construtor) | Atributo de Classe (`private`) |
| --- | --- | --- |
| **Declaração** | `JLabel lblData = new JLabel("");` | `private JLabel lblData;` (No topo da classe) |
| **Escopo** | Existe apenas durante a execução do construtor. | Visível por **todos os métodos** da classe. |
| **Acesso Externo** | Impossível acessar fora do bloco onde foi criada. | Permite modificação dinâmica por métodos como `atualizarData()`. |

---

## Erros Comuns e Cuidados

**Tentar Acessar uma Label em Outro Método sem Promovê-la a Atributo**

Se você tentar escrever `lblData.setText("...")` dentro de `atualizarData()` mantendo `JLabel lblData` como variável local do construtor, o compilador exibirá o erro:

* `lblData cannot be resolved to a variable`.
* **Solução:** Declare `private JLabel lblData;` no topo da classe (fora do construtor) e apenas instancie `lblData = new JLabel("")` dentro do construtor.

---

**Esquecer de Remover os Botões Padrão do `JDialog`**

O WindowBuilder cria uma barra inferior (`buttonPane`) com os botões `OK` e `Cancel` por padrão ao gerar um `JDialog`.

* Em janelas puramente informativas (como a tela "Sobre"), esses botões poluem a interface. Lembre-se de selecioná-los e apagá-los na aba Design.

---

**Não Configurar a Janela Secundária como Modal**

Se você abrir a janela `Sobre` sem definir `setModal(true)`, o usuário poderá clicar na janela principal do PDV atrás dela. A janela de diálogo ficará escondida atrás do programa principal, causando confusão.

---

## Conteúdo Complementar e Aprofundamento

**Ligando o Botão "Sobre" da Tela Principal à Abertura do `JDialog`**

Para fazer com que a janela `Sobre.java` abra automaticamente quando o usuário clicar no botão `btnSobre` da tela `Main.java`, adicionamos um evento de clique (**`ActionListener`**) ao botão:

```java
// Código para adicionar no construtor da classe Main.java:
btnSobre.addActionListener(new java.awt.event.ActionListener() {
    public void actionPerformed(java.awt.event.ActionEvent e) {
        // Instancia e exibe a janela de diálogo Sobre
        Sobre telaSobre = new Sobre();
        telaSobre.setLocationRelativeTo(null); // Centraliza a janela na tela
        telaSobre.setVisible(true);
    }
});

```

---

**Resumo Relâmpago**

1. Promover um componente a atributo (`private JLabel lblData`) permite alterá-lo em qualquer método da classe.
2. O método `atualizarData()` utiliza `LocalDate.now()` e `DateTimeFormatter` para capturar a data do sistema.
3. O painel lateral foi criado com `JPanel`, layout absoluto e cor de fundo personalizada (`#282D3C`).
4. Botões de menu (`JButton`) recebem ícones de 32x32 pixels e formatação de texto em destaque.
5. A propriedade `borderPainted(false)` remove a borda padrão do botão, deixando o design plano (*flat*).
6. A classe `JDialog` é utilizada para criar janelas secundárias e auxiliares no Java Swing.
7. Ao fechar um `JDialog`, a aplicação utiliza `DISPOSE_ON_CLOSE` para não encerrar o programa principal.
8. Definir `setModal(true)` no `JDialog` impede a interação com a janela principal enquanto a caixa estiver aberta.
9. O método `setLocationRelativeTo(null)` é utilizado para centralizar a janela no meio do monitor.
10. Janelas informativas de "Sobre" contêm nome do sistema, descrição, nome do autor e número da versão.

---

## Guia Rápido de Memorização

**Capturando e Formatando Data Atual**

```java
DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
String dataHoje = LocalDate.now().format(formato);
lblData.setText(dataHoje);

```

**Abrindo um JDialog a partir de um Evento de Botão**

```java
Sobre tela = new Sobre();
tela.setLocationRelativeTo(null); // Centraliza na tela
tela.setVisible(true);            // Exibe a janela

```
