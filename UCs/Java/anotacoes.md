# Integrando Java com MySQL via JDBC e Indicador de Status Visual no Java Swing (Projeto BL-PDV)

---

## 1. Visão Geral

Nesta aula, dei um dos passos mais importantes no desenvolvimento do sistema **BL-PDV**: integrei a aplicação Java Swing a um banco de dados relacional **MySQL** através do **JDBC** (*Java Database Connectivity*).

Para realizar essa ponte entre o código Java e o banco de dados, utilizei o driver oficial **MySQL Connector/J 8.4.0**, adicionando-o à pasta `lib` e ao *Build Path* do projeto.

Em seguida:

1. criei o banco de dados `blpdv` e a tabela `fornecedores` no **MySQL Workbench**;
2. desenvolvi a classe `Database.java` com métodos para estabelecer a conexão e realizar o teste de disponibilidade (*status*) da base;
3. construí visualmente no **WindowBuilder** um rodapé dinâmico no `Main.java` com ícones, labels e um indicador colorido (`•`) que altera sua cor para **verde** (conectado) ou **vermelho** (desconectado) em tempo real ao iniciar o sistema;
4. iniciei a montagem do cabeçalho adicionando os componentes visuais para data (`lblCalendario` e `lblData`).

---

## 2. Entendendo o Conceito

### A. O que é JDBC e como funciona a conexão com MySQL?

O **JDBC** é a especificação padrão da linguagem Java para execução de instruções SQL e integração com Banco de Dados Relacionais. Como o Java é neutro e não conhece as particularidades de cada banco por padrão, precisamos de um **Driver JDBC** específico (fornecido pelo fabricante do banco, no nosso caso o `mysql-connector-j-8.4.0.jar`).

💡 **Analogia da Tomada e do Adaptador:**
Imagine que o seu código Java é um aparelho eletrônico fabricado no padrão brasileiro e o MySQL é uma tomada da parede do modelo europeu. O JDBC é o padrão elétrico interno do seu aparelho, e o arquivo `.jar` do driver funciona como o **adaptador físico** perfeito que permite ligar o aparelho na tomada sem queimá-lo.

---

### B. O Indicador Visual de Status da Conexão

Em sistemas comerciais de Ponto de Venda (PDV), o operador precisa saber instantaneamente se o sistema está comunicando com o banco de dados antes de iniciar uma venda.

Se o banco estiver operacional, o método `testarConexao()` abre uma sessão rápida, fecha em seguida, retorna `true` e a interface altera a cor do componente gráfico para **verde** exibindo `"MySQL Conectado"`. Caso o serviço do MySQL esteja desligado, a tentativa gera uma exceção, o método retorna `false` e a interface exibe `"MySQL Desconectado"` com o ponto em **vermelho**.

---

## 3. Conceitos Fundamentais

### 1. As 4 Classes e Interfaces Principais do JDBC

* **`DriverManager`:** Classe utilitária que gerencia os drivers instalados e tenta estabelecer a conexão com a URL informada.
* **`Connection`:** Interface que representa a sessão ativa de comunicação entre o Java e o banco de dados.
* **`Statement` / `PreparedStatement`:** Interfaces para enviar e executar comandos SQL (SELECT, INSERT, UPDATE, DELETE).
* **`ResultSet`:** Objeto que guarda a tabela de resultados devolvida por uma consulta `SELECT`.

### 2. URL de Conexão JDBC (`url`)

A String de conexão especifica o protocolo, o driver, o host e o nome da base de dados:


$$\text{jdbc:mysql://localhost/blpdv}$$

* **`jdbc:mysql://`**: Protocolo de comunicação.
* **`localhost`**: Endereço do servidor onde o MySQL está rodando (máquina local).
* **`blpdv`**: Nome exato da base de dados criada no MySQL Workbench.

### 3. Absolute Layout no WindowBuilder (`setLayout(null)`)

Para desenhar componentes no rodapé e no cabeçalho com posições exatas pixel a pixel, alteramos o layout do `contentPane` para **Absolute Layout**. Isso nos permite definir manualmente as coordenadas $(X, Y)$ e o tamanho $(\text{largura}, \text{altura})$ de cada `JLabel` via método `setBounds()`.

---

## 4. Código / Exemplos Práticos

### Arquivo 1: Script de Criação da Base no MySQL Workbench (`script_blpdv.sql`)

```sql
-- Criação do Banco de Dados com suporte a caracteres acentuados (UTF-8)
CREATE DATABASE blpdv
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE blpdv;

-- Criação da tabela de Fornecedores
CREATE TABLE fornecedores (
    idFornecedor INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fone VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    site VARCHAR(100),
    PRIMARY KEY (idFornecedor)
) DEFAULT CHARSET = utf8;

```

---

### Arquivo 2: Classe de Conexão e Teste de Status (`Database.java`)

```java
package database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Classe responsável pelo gerenciamento da conexão com o banco de dados MySQL.
 * 
 * @author Bruss Loza
 */
public class Database {

    // Informações de acesso ao banco de dados MySQL
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost/blpdv";
    private String user = "root";
    private String password = ""; // Senha padrão do XAMPP/Workbench é vazia

    /**
     * Estabelece e retorna uma conexão ativa com o banco de dados.
     * 
     * @return Objeto Connection ou null em caso de falha
     */
    public Connection conectar() {
        try {
            // Carrega dinamicamente a classe do Driver JDBC do MySQL na memória
            Class.forName(driver);
            // Solicita a conexão ao DriverManager
            return DriverManager.getConnection(url, user, password);
            
        } catch (Exception e) {
            System.err.println("Erro ao conectar ao banco: " + e.getMessage());
            return null;
        }
    }

    /**
     * Método utilitário para testar o status da conexão sem manter o canal aberto.
     * 
     * @return true se o banco estiver online; false caso contrário.
     */
    public boolean testarConexao() {
        Connection con = conectar();
        
        if (con == null) {
            return false;
        }
        
        try {
            con.close(); // Fecha a conexão de teste imediatamente para não vazar recursos
            return true;
        } catch (Exception e) {
            System.err.println("Erro ao fechar conexão de teste: " + e.getMessage());
            return false;
        }
    }
}

```

---

### Arquivo 3: Interface Principal com Status Visual (`Main.java`)

```java
package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Toolkit;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

import com.formdev.flatlaf.FlatLightLaf;
import database.Database;

/**
 * Janela Principal da Aplicação BL-PDV.
 */
public class Main extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;

    // Instanciação do objeto da camada de banco de dados
    private Database db = new Database();

    /**
     * Ponto de entrada do programa.
     */
    public static void main(String[] args) {
        // Aplica o visual moderno do Swing via FlatLaf
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
     * Construtor do Frame Principal.
     */
    public Main() {
        // Configurações Globais da Janela Principal
        setTitle("BL-PDV");
        setIconImage(Toolkit.getDefaultToolkit().getImage(Main.class.getResource("/img/blpvd.png")));
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 800, 600);

        // Painel de Conteúdo com Layout Absoluto
        contentPane = new JPanel();
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        setContentPane(contentPane);
        contentPane.setLayout(null);

        // --- RODAPÉ: COMPONENTES DE STATUS DO BANCO DE DADOS ---

        // Ícone do Banco de Dados (16x16)
        JLabel lblDataBase = new JLabel("");
        lblDataBase.setIcon(new ImageIcon(Main.class.getResource("/img/banco.png")));
        lblDataBase.setBounds(10, 530, 16, 23);
        contentPane.add(lblDataBase);

        // Label de Texto para o Status da Conexão
        JLabel lblMysql = new JLabel("");
        lblMysql.setFont(new Font("Tahoma", Font.PLAIN, 11));
        lblMysql.setBounds(32, 533, 130, 18);
        contentPane.add(lblMysql);

        // Ponto Indicador Colorido (Status em Verde ou Vermelho)
        JLabel lblStatus = new JLabel("•");
        lblStatus.setHorizontalAlignment(SwingConstants.CENTER);
        lblStatus.setFont(new Font("Tahoma", Font.BOLD, 20));
        lblStatus.setBounds(165, 533, 15, 18);
        contentPane.add(lblStatus);

        // --- CABEÇALHO: COMPONENTES DE DATA E CALENDÁRIO ---

        // Ícone do Calendário (24x24)
        JLabel lblCalendario = new JLabel("");
        lblCalendario.setIcon(new ImageIcon(Main.class.getResource("/img/calendario.png")));
        lblCalendario.setBounds(620, 15, 24, 24);
        contentPane.add(lblCalendario);

        // Label de Texto para Exibição da Data Formatada
        JLabel lblData = new JLabel("");
        lblData.setFont(new Font("Tahoma", Font.PLAIN, 12));
        lblData.setBounds(650, 18, 120, 18);
        contentPane.add(lblData);

        // --- TESTE LÓGICO DE CONEXÃO AO INICIALIZAR A JANELA ---
        if (db.testarConexao()) {
            System.out.println("Banco de Dados Conectado com Sucesso!");
            lblMysql.setText("MySQL Conectado");
            lblStatus.setForeground(new Color(0, 150, 0)); // Verde
        } else {
            System.err.println("Erro ao Conectar com o Banco de Dados!");
            lblMysql.setText("MySQL Desconectado");
            lblStatus.setForeground(Color.RED); // Vermelho
        }
    }
}

```

---

## 5. Desmontando o Código

### A. Desmontando a Classe `Database.java`

```java
Class.forName(driver);
return DriverManager.getConnection(url, user, password);

```

1. **`Class.forName("com.mysql.cj.jdbc.Driver")`**: Força o Java a carregar na memória a classe do driver MySQL vindo do arquivo `.jar`.
2. **`DriverManager.getConnection(...)`**: Solicita ao gerenciador do Java que abra o canal TCP com o MySQL no endereço `jdbc:mysql://localhost/blpdv`. Se a porta, usuário ou senha estiverem errados, o método dispara uma exceção `SQLException`.

---

### B. Desmontando o Teste de Conexão Segura (`testarConexao()`)

```java
public boolean testarConexao() {
    Connection con = conectar();
    if (con == null) return false;
    try {
        con.close();
        return true;
    } catch (Exception e) {
        return false;
    }
}

```

1. **`Connection con = conectar();`**: Chama o método principal de conexão.
2. **`if (con == null)`**: Se a conexão falhou, retorna `false` imediatamente.
3. **`con.close();`**: **Essencial.** Fecha a conexão de teste imediatamente após confirmar que o banco está vivo. Se não fecharmos a conexão de teste, o banco esgotará o número máximo de conexões permitidas (*Connection Leak*).

---

### C. Desmontando a Troca Dinâmica de Cores no Swing

```java
if (db.testarConexao()) {
    lblMysql.setText("MySQL Conectado");
    lblStatus.setForeground(new Color(0, 150, 0));
} else {
    lblMysql.setText("MySQL Desconectado");
    lblStatus.setForeground(Color.RED);
}

```

* **`lblMysql.setText(...)`**: Altera a legenda textual dinamicamente durante a execução.
* **`lblStatus.setForeground(...)`**: Altera a cor de primeiro plano do caractere `•`. Usamos `new Color(0, 150, 0)` para um verde escuro legível ou `Color.RED` para falhas.

---

## 6. Passo a Passo

### Passo a Passo 1: Download e Importação do Driver MySQL no Eclipse

1. Acesse o site oficial do MySQL e navegue até a opção **Connector/J**.
2. Selecione a versão **8.4.0**, plataforma **Independent**, e baixe o arquivo `.zip`.
3. Extraia o pacote e localize o arquivo compilado **`mysql-connector-j-8.4.0.jar`**.
4. No Eclipse, abra a estrutura do projeto `blpvd`.
5. Arraste o arquivo `mysql-connector-j-8.4.0.jar` para dentro da pasta **`lib`**.
6. Clique com o botão direito no arquivo `.jar` ➔ **Build Path** ➔ **Add to Build Path**.

---

### Passo a Passo 2: Construção da Base no MySQL Workbench

1. Abra o **MySQL Workbench** e conecte-se à sua instância local (`Local instance 3306`).
2. Abra uma nova aba de Query e execute o script SQL:
* `CREATE DATABASE blpdv DEFAULT CHARACTER SET utf8;`
* `USE blpdv;`
* `CREATE TABLE fornecedores (...);`


3. Pressione `Ctrl + Shift + Enter` para rodar todas as instruções e confirme a criação no painel *Schemas*.

---

### Passo a Passo 3: Desenhando o Rodapé de Status no WindowBuilder

1. No Eclipse, abra a classe `Main.java` e alterne para a aba **Design**.
2. Clique no `contentPane`, vá na aba *Properties*, selecione `Layout` e mude para **`Absolute Layout`** (ou `null`).
3. **Ícone do Banco:**
* Na paleta de componentes, selecione `JLabel`, clique no rodapé esquerdo da tela.
* Na propriedade `variable`, renomeie para `lblDataBase`.
* Na propriedade `icon`, selecione a imagem `banco.png` (16x16) da pasta `img`. Apague o texto do label.


4. **Legenda do Banco:**
* Insira uma nova `JLabel` ao lado do ícone.
* Na propriedade `variable`, renomeie para `lblMysql`. Deixe o texto vazio no design.


5. **Ponto de Status:**
* Insira uma terceira `JLabel` ao lado da legenda.
* Na propriedade `variable`, renomeie para `lblStatus`.
* Na propriedade `text`, digite o caractere `•` (`Alt + 7` do teclado numérico).
* Altere a fonte para **Tahoma, Bold, 20** e o alinhamento horizontal para `Center`.


6. **Salvamento:**
* Salve o arquivo (`Ctrl + S`) e alterne para a aba **Source** para validar as condicionais.



---

## 7. Tabelas Comparativas

### 1. Resumo das Ferramentas da Arquitetura JDBC

| Componente JDBC | Função na Aplicação | Arquivo / Classe Utilizada |
| --- | --- | --- |
| **Driver JDBC** | Biblioteca externa que traduz o código Java para o MySQL. | `mysql-connector-j-8.4.0.jar` |
| **Driver Class Name** | Nome da classe carregada via `Class.forName()`. | `com.mysql.cj.jdbc.Driver` |
| **Connection String (URL)** | Endereço de rede e porta de escuta da base de dados. | `jdbc:mysql://localhost/blpdv` |
| **Connection Object** | Objeto da sessão ativa usado para enviar queries ao MySQL. | `java.sql.Connection` |

---

### 2. Estados do Indicador de Conexão na Interface Swing

| Condição Lógica | Retorno de `testarConexao()` | Texto exibido na `lblMysql` | Cor da `lblStatus` (`•`) |
| --- | --- | --- | --- |
| **MySQL Rodando (Porta 3306)** | `true` | `"MySQL Conectado"` | **Verde** (`#009600`) |
| **MySQL Parado / Senha Errada** | `false` | `"MySQL Desconectado"` | **Vermelho** (`Color.RED`) |

---

## 8. Erros Comuns e Cuidados

### 1. Erro `ClassNotFoundException: com.mysql.cj.jdbc.Driver`

Ocorre quando tentamos executar o método `Class.forName()` sem ter adicionado o arquivo `.jar` do MySQL ao *Build Path*.

* **Solução:** Verifique se o arquivo `mysql-connector-j-8.4.0.jar` está dentro da pasta `Referenced Libraries` do projeto no Eclipse.

---

### 2. Erro de Texto Cortado na `JLabel` no Swing (`setBounds`)

Ao alterar o texto da `lblMysql` via código de `""` para `"MySQL Desconectado"`, se a largura configurada no `setBounds()` for muito pequena (ex: 26 pixels), a palavra ficará cortada ou invisível na tela.

* **Solução:** Na criação do componente, defina uma largura suficiente (mínimo de 120 pixels) no quarto parâmetro do `setBounds(X, Y, Largura, Altura)`.

---

### 3. Esqueceu de Criar o Banco no MySQL Workbench

Se a classe `Database.java` tentar conectar em `jdbc:mysql://localhost/blpdv` e o banco `blpdv` ainda não tiver sido criado no MySQL, o Java retornará a exceção `Unknown database 'blpdv'`.

* **Solução:** Execute o comando `CREATE DATABASE blpdv;` no MySQL Workbench antes de testar a aplicação Java.

---

## 9. Correções Técnicas das Minhas Anotações

Durante a revisão do meu rascunho de aula, apliquei as seguintes correções silenciosas para garantir que o projeto seja executável e siga as boas práticas:

1. **Correção de Dimensão no Swing (`setBounds`):** No rascunho original, a `lblMysql` foi configurada com o tamanho `(26, 538, 26, 8)`. Essa largura de 26 pixels impedia a exibição da frase `"MySQL Conectado"`. Corrigi a largura para **130 pixels** (`32, 533, 130, 18`) para exibir o texto completo sem cortes.
2. **Nomenclatura de Pacotes:** Ajustei as declarações para usar letras minúsculas em todos os pacotes (`package database;` e `package view;`).
3. **Fechamento de Conexão de Teste:** O rascunho trazia a instrução `con.close()` dentro do método `testarConexao()`. Garanti que a chamada estivesse protegida por um bloco `try-catch` para evitar que exceções no fechamento da porta travassem o sistema.

---

## 10. Conteúdo Complementar e Aprofundamento

### Exibindo a Data Atual dinamicamente no Cabeçalho (`lblData`)

Para preencher a `lblData` do cabeçalho que criamos junto com o ícone do calendário, podemos adicionar o código de formatação de data direto dentro do construtor da classe `Main.java`:

```java
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

// Trecho para incluir dentro do construtor do Main.java:
LocalDateTime hoje = LocalDateTime.now();
DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");

// Atualiza a Label da data criada no WindowBuilder
lblData.setText(hoje.format(formatoData));

```

---

## Resumo Relâmpago — 10 Linhas

1. O JDBC possibilita a integração nativa entre aplicações Java e Bancos de Dados Relacionais.
2. O driver `mysql-connector-j-8.4.0.jar` precisa ser adicionado à pasta `lib` e ao *Build Path*.
3. A URL de conexão `jdbc:mysql://localhost/blpdv` define a tecnologia, o host e a base de dados.
4. O método `Class.forName()` carrega a classe do driver do MySQL na memória RAM do Java.
5. O método `DriverManager.getConnection()` realiza a autenticação e abre a sessão com o banco.
6. A função `testarConexao()` abre e fecha uma sessão rápida para verificar a disponibilidade do banco.
7. O layout do `contentPane` deve ser configurado como Absolute (`null`) para posicionamento exato.
8. Componentes `JLabel` com ícones (16x16 e 24x24) são adicionados ao rodapé e cabeçalho da janela.
9. A cor e o texto do ponto indicador (`•`) alternam dinamicamente entre verde (online) e vermelho (offline).
10. É indispensável definir uma largura adequada no `setBounds()` para evitar que mensagens de status sejam cortadas.

---

## Guia Rápido de Memorização

### Estrutura Base de Conexão JDBC

```java
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/nome_banco", "usuario", "senha");

```

### Script Básico de Banco MySQL

```sql
CREATE DATABASE blpdv DEFAULT CHARACTER SET utf8;
USE blpdv;
CREATE TABLE tabela ( id INT AUTO_INCREMENT PRIMARY KEY );

```
