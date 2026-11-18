# 📚 Java — BL-PDV: Janela Sobre, Cadastro de Fornecedores e Model

# 1. Finalizando a janela Sobre

Na classe `Sobre.java`, vamos adicionar informações complementares do projeto, como o ícone da licença MIT, o ícone do GitHub, o endereço do repositório e um botão para fechar a janela.

## 1.1 JLabel da licença MIT

Adicione um novo `JLabel` na janela Sobre.

Configure a variável:

```java
lblMit
```

Procure um ícone relacionado à licença MIT com dimensão de 32 × 32 pixels, coloque-o na pasta `img` do Eclipse e configure a propriedade `icon` do JLabel para utilizar a imagem.

A propriedade `text` deve permanecer vazia.

### O que é a licença MIT?

A MIT License é uma licença de software livre e de código aberto que permite, de forma ampla, utilizar, modificar e distribuir o software, inclusive comercialmente, desde que suas condições sejam respeitadas.

**Observação importante:** colocar o ícone da MIT na interface não substitui a inclusão do texto da licença no projeto. Se o BL-PDV for distribuído sob essa licença, será necessário incluir o arquivo com os termos da licença.

---

## 1.2 JLabel do GitHub

Adicione outro `JLabel`.

Configure a variável:

```java
lblGithub
```

Procure o ícone do GitHub em 32 × 32 pixels e coloque-o na pasta `img`.

Na propriedade `icon`, selecione a imagem.

Deixe a propriedade `text` vazia.

Esse JLabel será utilizado apenas para exibir o ícone do GitHub.

---

## 1.3 JLabel do repositório

Adicione outro JLabel.

Configure:

| Propriedade | Valor |
|---|---|
| `variable` | `lblRepositorio` |
| `text` | `github.com/lbruss` |

Esse componente exibirá o endereço do repositório do projeto.

Posteriormente, vamos adicionar um evento de clique para abrir o endereço no navegador padrão.

---

## 1.4 JButton OK

Adicione um `JButton`.

Configure:

| Propriedade | Valor |
|---|---|
| `variable` | `btnOK` |
| `text` | OK |

Esse botão será responsável por fechar a janela Sobre.

---

# 2. Código inicial da classe Sobre.java

Depois de adicionar os componentes no Design, o código fica assim:

```java
package view;

import java.awt.Toolkit;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import javax.swing.SwingConstants;

import com.formdev.flatlaf.FlatDarkLaf;

import java.awt.Font;

public class Sobre extends JDialog {

    private static final long serialVersionUID = 1L;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {

        // USO DA BIBLIOTECA FLATLAF (SWING MODERNO)
        FlatDarkLaf.setup(); // MODO ESCURO
        // FlatLightLaf.setup(); // MODO CLARO

        try {
            Sobre dialog = new Sobre();
            dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
            dialog.setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Create the dialog.
     */
    public Sobre() {

        setTitle("Sobre");

        setIconImage(Toolkit.getDefaultToolkit().getImage(
                Sobre.class.getResource("/img/sobre.jpg")));

        setBounds(100, 100, 270, 370);
        getContentPane().setLayout(null);

        {
            JLabel lblBLPDV = new JLabel("BL-PDV");
            lblBLPDV.setHorizontalAlignment(SwingConstants.CENTER);
            lblBLPDV.setFont(new Font("Arial", Font.BOLD, 15));
            lblBLPDV.setBounds(74, 11, 90, 24);
            getContentPane().add(lblBLPDV);
        }

        {
            JLabel lblDescricao = new JLabel(
                    "Sistema para gestão de estoque e PDV");
            lblDescricao.setFont(new Font("Arial", Font.BOLD, 12));
            lblDescricao.setBounds(10, 46, 221, 14);
            getContentPane().add(lblDescricao);
        }

        {
            JLabel lblAutor = new JLabel("Autor: Bruss Loza");
            lblAutor.setFont(new Font("Arial", Font.BOLD, 12));
            lblAutor.setBounds(10, 71, 101, 14);
            getContentPane().add(lblAutor);
        }

        {
            JLabel lblVersao = new JLabel("Versão 1.0");
            lblVersao.setFont(new Font("Arial", Font.BOLD, 14));
            lblVersao.setBounds(10, 96, 79, 14);
            getContentPane().add(lblVersao);
        }

        JLabel lblMit = new JLabel("");
        lblMit.setIcon(new ImageIcon(
                Sobre.class.getResource("/img/mit.jpg")));
        lblMit.setBounds(10, 174, 32, 39);
        getContentPane().add(lblMit);

        JLabel lblGithub = new JLabel("");
        lblGithub.setIcon(new ImageIcon(
                Sobre.class.getResource("/img/github.jpg")));
        lblGithub.setBounds(10, 225, 32, 32);
        getContentPane().add(lblGithub);

        JLabel lblRepositorio = new JLabel("github.com/lbruss");
        lblRepositorio.setBounds(50, 240, 113, 17);
        getContentPane().add(lblRepositorio);

        JButton btnOK = new JButton("OK");
        btnOK.setBounds(74, 285, 89, 23);
        getContentPane().add(btnOK);
    }
}
```

### Observação sobre os blocos entre chaves

Você verá alguns trechos assim:

```java
{
    JLabel lblBLPDV = new JLabel("BL-PDV");

    // ...
}
```

Essas chaves delimitam um bloco de código.

Neste caso, são utilizadas para organizar os componentes dentro do construtor.

Também permitem que variáveis locais criadas dentro desses blocos tenham um escopo limitado ao próprio bloco.

---

# 3. Adicionando o evento ao botão OK

Agora vamos fazer o botão funcionar.

### Procedimento no WindowBuilder

1. Abra `Sobre.java`.
2. Clique em `Design`.
3. Clique com o botão direito no botão OK.
4. Selecione `Add event handler`.
5. Entre em `action`.
6. Selecione `actionPerformed`.

O Eclipse criará automaticamente o evento do botão.

Dentro dele, adicionamos:

```java
// FECHAR A TELA SOBRE
dispose();
```

### O que é dispose()?

O método `dispose()` fecha e libera os recursos gráficos utilizados pela janela.

Quando clicamos no botão OK, o evento é executado e a janela Sobre é encerrada.

```java
btnOK.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {

        // FECHAR A TELA SOBRE
        dispose();

    }
});
```

### O que é ActionListener?

`ActionListener` é uma interface utilizada para receber e tratar eventos de ação.

Um evento de ação pode ocorrer quando:

- O usuário clica em um botão;
- Pressiona Enter em determinados componentes;
- Executa uma ação que gera um evento correspondente.

O método `actionPerformed()` é chamado quando a ação é disparada.

### O que é ActionEvent?

O `ActionEvent` representa o evento de ação que aconteceu.

No código:

```java
public void actionPerformed(ActionEvent e)
```

O parâmetro `e` contém informações sobre o evento recebido.

---

## 3.1 Centralizando a janela

Dentro do construtor `Sobre()`, adicione:

```java
setLocationRelativeTo(null);
```

Esse comando centraliza a janela na tela.

O `null` indica que a janela não será centralizada em relação a outro componente específico, mas sim em relação à tela.

Isso evita que a janela apareça em uma posição aleatória definida pelos valores anteriores.

---

# 4. Código da janela Sobre com botão funcional

```java
package view;

import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import com.formdev.flatlaf.FlatDarkLaf;

public class Sobre extends JDialog {

    private static final long serialVersionUID = 1L;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {

        // USO DA BIBLIOTECA FLATLAF (SWING MODERNO)
        FlatDarkLaf.setup(); // MODO ESCURO
        // FlatLightLaf.setup(); // MODO CLARO

        try {
            Sobre dialog = new Sobre();
            dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
            dialog.setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Create the dialog.
     */
    public Sobre() {

        setTitle("Sobre");

        setIconImage(Toolkit.getDefaultToolkit().getImage(
                Sobre.class.getResource("/img/sobre.jpg")));

        setBounds(100, 100, 270, 370);
        getContentPane().setLayout(null);

        {
            JLabel lblBLPDV = new JLabel("BL-PDV");
            lblBLPDV.setHorizontalAlignment(SwingConstants.CENTER);
            lblBLPDV.setFont(new Font("Arial", Font.BOLD, 15));
            lblBLPDV.setBounds(74, 11, 90, 24);
            getContentPane().add(lblBLPDV);
        }

        {
            JLabel lblDescricao = new JLabel(
                    "Sistema para gestão de estoque e PDV");
            lblDescricao.setFont(new Font("Arial", Font.BOLD, 12));
            lblDescricao.setBounds(10, 46, 221, 14);
            getContentPane().add(lblDescricao);
        }

        {
            JLabel lblAutor = new JLabel("Autor: Bruss Loza");
            lblAutor.setFont(new Font("Arial", Font.BOLD, 12));
            lblAutor.setBounds(10, 71, 101, 14);
            getContentPane().add(lblAutor);
        }

        {
            JLabel lblVersao = new JLabel("Versão 1.0");
            lblVersao.setFont(new Font("Arial", Font.BOLD, 14));
            lblVersao.setBounds(10, 96, 79, 14);
            getContentPane().add(lblVersao);
        }

        JLabel lblMit = new JLabel("");
        lblMit.setIcon(new ImageIcon(
                Sobre.class.getResource("/img/mit.jpg")));
        lblMit.setBounds(10, 174, 32, 39);
        getContentPane().add(lblMit);

        JLabel lblGithub = new JLabel("");
        lblGithub.setIcon(new ImageIcon(
                Sobre.class.getResource("/img/github.jpg")));
        lblGithub.setBounds(10, 225, 32, 32);
        getContentPane().add(lblGithub);

        JLabel lblRepositorio = new JLabel("github.com/lbruss");
        lblRepositorio.setBounds(50, 240, 113, 17);
        getContentPane().add(lblRepositorio);

        JButton btnOK = new JButton("OK");

        btnOK.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {

                // FECHAR A TELA SOBRE
                dispose();

            }
        });

        btnOK.setBounds(74, 285, 89, 23);
        getContentPane().add(btnOK);

        // CENTRALIZAR A TELA AO ABRIR
        setLocationRelativeTo(null);
    }
}
```

---

# 5. Transformando o endereço do GitHub em um link

Agora vamos permitir que o usuário clique no endereço do repositório para abrir o GitHub no navegador padrão.

Para isso, utilizaremos:

- `MouseListener`: permite detectar eventos relacionados ao mouse.
- `MouseAdapter`: facilita a implementação dos eventos do mouse.
- `MouseEvent`: representa o evento ocorrido com o mouse.
- `Desktop`: permite interagir com recursos do sistema operacional.
- `URI`: representa um endereço de recurso.

## 5.1 Importando as classes

Adicione:

```java
import java.awt.Desktop;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.net.URI;
```

## 5.2 Adicionando o evento ao JLabel

No Design:

1. Clique com o botão direito em `lblRepositorio`.
2. Vá em `Add event`.
3. Entre em `mouse`.
4. Escolha `mouseClicked`.

O Eclipse criará o método que será executado quando o JLabel receber um clique.

Adicione:

```java
// EVENTO DO LINK DO GITHUB
lblRepositorio.addMouseListener(new MouseAdapter() {

    @Override
    public void mouseClicked(MouseEvent e) {

        link("https://github.com/lbruss");

    }
});
```

### Explicando

`addMouseListener()` adiciona um ouvinte de eventos de mouse ao JLabel.

`MouseAdapter` permite implementar somente o evento que precisamos, sem precisar escrever todos os métodos de uma interface de eventos de mouse.

`mouseClicked()` é executado quando o componente recebe um clique do mouse.

Quando o usuário clicar no endereço, será chamado:

```java
link("https://github.com/lbruss");
```

Esse comando chama o método `link()` que criamos para abrir o endereço.

---

# 6. Criando o método link()

No final da classe `Sobre`, mas fora do construtor, adicione:

```java
// MÉTODO (FUNÇÃO) PARA ABRIR O LINK NO NAVEGADOR PADRÃO
private void link(String url) {

    // OBTÉM O DESKTOP DO CLIENTE
    Desktop desktop = Desktop.getDesktop();

    // USO DO TRY-CATCH PARA EXCEÇÕES
    try {

        URI uri = new URI(url);

        // ABRIR O LINK NO NAVEGADOR
        desktop.browse(uri);

    } catch (Exception e) {

        System.out.println(e);

    }
}
```

## Explicação detalhada

### 1. Criando o método

```java
private void link(String url)
```

- `private`: o método pode ser acessado diretamente somente dentro da classe `Sobre`.
- `void`: não retorna nenhum valor.
- `link`: nome do método.
- `String url`: recebe o endereço que queremos abrir.

Exemplo de chamada:

```java
link("https://github.com/lbruss");
```

O endereço é enviado para o método através do parâmetro `url`.

### 2. Obtendo o Desktop

```java
Desktop desktop = Desktop.getDesktop();
```

A classe `Desktop` permite que uma aplicação Java utilize algumas funcionalidades do sistema operacional.

Por exemplo:

- Abrir um navegador;
- Abrir arquivos;
- Abrir e-mails;
- Abrir outros recursos suportados pelo sistema.

### 3. Criando uma URI

```java
URI uri = new URI(url);
```

A URI representa o endereço do recurso.

Neste exemplo:

```text
https://github.com/lbruss
```

A URI será utilizada para indicar ao sistema operacional qual endereço deverá ser aberto.

### 4. Abrindo o navegador

```java
desktop.browse(uri);
```

Esse comando solicita ao sistema operacional que abra o endereço utilizando o navegador padrão.

### 5. Tratando erros

```java
catch (Exception e) {
    System.out.println(e);
}
```

Caso ocorra algum problema, a exceção será capturada e exibida no console.

Podem ocorrer erros se o ambiente não permitir abrir o navegador ou se o endereço for inválido.

> **Aprofundamento — Boa prática:** em aplicações mais robustas, é interessante verificar se o recurso `Desktop` e a ação `BROWSE` são suportados antes de utilizá-los.

---

# 7. Código final da classe Sobre.java

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

public class Sobre extends JDialog {

    private static final long serialVersionUID = 1L;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {

        // USO DA BIBLIOTECA FLATLAF (SWING MODERNO)
        FlatDarkLaf.setup(); // MODO ESCURO
        // FlatLightLaf.setup(); // MODO CLARO

        try {
            Sobre dialog = new Sobre();
            dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
            dialog.setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Create the dialog.
     */
    public Sobre() {

        setTitle("Sobre");

        setIconImage(Toolkit.getDefaultToolkit().getImage(
                Sobre.class.getResource("/img/sobre.jpg")));

        setBounds(100, 100, 270, 370);
        getContentPane().setLayout(null);

        {
            JLabel lblBLPDV = new JLabel("BL-PDV");
            lblBLPDV.setHorizontalAlignment(SwingConstants.CENTER);
            lblBLPDV.setFont(new Font("Arial", Font.BOLD, 15));
            lblBLPDV.setBounds(74, 11, 90, 24);
            getContentPane().add(lblBLPDV);
        }

        {
            JLabel lblDescricao = new JLabel(
                    "Sistema para gestão de estoque e PDV");
            lblDescricao.setFont(new Font("Arial", Font.BOLD, 12));
            lblDescricao.setBounds(10, 46, 221, 14);
            getContentPane().add(lblDescricao);
        }

        {
            JLabel lblAutor = new JLabel("Autor: Bruss Loza");
            lblAutor.setFont(new Font("Arial", Font.BOLD, 12));
            lblAutor.setBounds(10, 71, 101, 14);
            getContentPane().add(lblAutor);
        }

        {
            JLabel lblVersao = new JLabel("Versão 1.0");
            lblVersao.setFont(new Font("Arial", Font.BOLD, 14));
            lblVersao.setBounds(10, 96, 79, 14);
            getContentPane().add(lblVersao);
        }

        JLabel lblMit = new JLabel("");
        lblMit.setIcon(new ImageIcon(
                Sobre.class.getResource("/img/mit.jpg")));
        lblMit.setBounds(10, 174, 32, 39);
        getContentPane().add(lblMit);

        JLabel lblGithub = new JLabel("");
        lblGithub.setIcon(new ImageIcon(
                Sobre.class.getResource("/img/github.jpg")));
        lblGithub.setBounds(10, 225, 32, 32);
        getContentPane().add(lblGithub);

        JLabel lblRepositorio = new JLabel("github.com/lbruss");

        // EVENTO DO LINK DO GITHUB
        lblRepositorio.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {

                link("https://github.com/lbruss");

            }
        });

        lblRepositorio.setBounds(50, 240, 113, 17);
        getContentPane().add(lblRepositorio);

        JButton btnOK = new JButton("OK");

        btnOK.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {

                // FECHAR A TELA SOBRE
                dispose();

            }
        });

        btnOK.setBounds(75, 285, 89, 23);
        getContentPane().add(btnOK);

        // CENTRALIZAR A TELA AO ABRIR
        setLocationRelativeTo(null);

    }

    // MÉTODO (FUNÇÃO) PARA ABRIR O LINK NO NAVEGADOR PADRÃO
    private void link(String url) {

        // OBTÉM O DESKTOP DO CLIENTE
        Desktop desktop = Desktop.getDesktop();

        // USO DO TRY-CATCH PARA EXCEÇÕES
        try {

            URI uri = new URI(url);

            // ABRIR O LINK NO NAVEGADOR
            desktop.browse(uri);

        } catch (Exception e) {

            System.out.println(e);

        }
    }
}
```

---

# 8. Integrando a janela Sobre à Main.java

Agora vamos fazer o botão Sobre da janela principal abrir a classe `Sobre`.

## 8.1 Criando o evento

No Eclipse:

1. Abra `Main.java`.
2. Clique em `Design`.
3. Clique com o botão direito no botão Sobre.
4. `Add event`.
5. `action`.
6. `actionPerformed`.

O Eclipse adicionará os imports e o código necessário para tratar o clique.

## 8.2 Convert Field to Local

Selecione o botão Sobre no Design.

Nas propriedades, utilize a opção **Convert Field to Local**.

### O que significa?

Uma variável de campo pertence à classe e pode ser acessada por diferentes métodos da classe, dependendo de sua visibilidade.

Uma variável local é criada dentro de um método ou bloco e existe somente naquele escopo.

Como não precisamos acessar o botão Sobre em outros métodos, ele pode ser uma variável local.

O Eclipse faz essa conversão para reduzir a quantidade de variáveis de campo desnecessárias.

---

## 8.3 Código do evento do botão Sobre

```java
// EVENTO BOTÃO SOBRE
btnNewButton.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {

        // ABRIR TELA SOBRE
        Sobre sobre = new Sobre();
        sobre.setVisible(true);

    }
});
```

### Explicação

```java
Sobre sobre = new Sobre();
```

Cria um novo objeto da classe `Sobre`.

```java
sobre.setVisible(true);
```

Torna a janela visível.

Quando o usuário clicar no botão Sobre da janela principal, uma nova janela Sobre será criada e exibida.

### Fluxo da execução

```text
Main.java
   |
   | Clique no botão Sobre
   v
actionPerformed()
   |
   v
Sobre sobre = new Sobre()
   |
   v
sobre.setVisible(true)
   |
   v
Janela Sobre aberta
```

---

# 9. Código atualizado da Main.java

```java
package view;

import java.awt.EventQueue;
import java.awt.Toolkit;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

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

public class Main extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;
    private JLabel lblData;

    // CRIAÇÃO DO OBJETO PARA CONEXÃO COM O BANCO DE DADOS
    Database db = new Database();

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

        JButton btnFornecedores = new JButton("Fornecedores");
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

        JButton btnNewButton = new JButton("Sobre");

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

---

# 10. Criando a janela de fornecedores

Agora vamos criar uma nova janela para cadastrar e futuramente gerenciar os fornecedores do BL-PDV.

## Criando a classe frmFornecedor

No Eclipse:

1. Clique com o botão direito no pacote `view`.
2. Clique em `New`.
3. `Other`.
4. Procure `WindowBuilder`.
5. `Swing Designer`.
6. Selecione `JDialog`.
7. Digite o nome `frmFornecedor`.
8. Clique em Finish.

A classe será criada no pacote `view`.

---

## 10.1 Configurando o Design

Na aba Design:

- Remova os componentes padrão que foram criados, mantendo o componente principal `javax.swing.JDialog` e o `getContentPane`.
- Configure o tamanho da janela para 680 × 480.
- Selecione o JDialog.
- Configure `iconImage` para o ícone de fornecedor.
- Configure `title` para Fornecedores.
- Configure `resizable` para `false`.
- Selecione o `getContentPane`.
- Configure `layout` para `absolute`.

### resizable

Determina se o usuário poderá redimensionar a janela.

- `true`: permite redimensionamento.
- `false`: impede redimensionamento.

---

# 11. Criando os componentes do cadastro

O formulário será composto por campos para armazenar informações de fornecedores.

Os dados serão:

- ID;
- Nome;
- Telefone;
- E-mail;
- Site.

## 11.1 JLabel ID

Adicione um JLabel.

Configure:

| Propriedade | Valor |
|---|---|
| `variable` | `lblID` |
| `text` | ID |
| `enable` | `false` |

Depois, utilize `Convert Field to Local` conforme a orientação da aula.

## 11.2 JTextField ID

Adicione um `JTextField`.

Configure:

| Propriedade | Valor |
|---|---|
| `variable` | `textID` |
| `enable` | `false` |

O campo será utilizado para apresentar o identificador do fornecedor.

Como o ID será gerado automaticamente pelo banco de dados, o usuário não deverá digitá-lo manualmente.

---

## 11.3 JLabel Nome

Adicione um JLabel.

Configure:

| Propriedade | Valor |
|---|---|
| `variable` | `lblNome` |
| `text` | Nome |
| `enable` | `false` |

## 11.4 JTextField Nome

Adicione um `JTextField`.

Configure:

| Propriedade | Valor |
|---|---|
| `variable` | `textNome` |

Esse campo permitirá digitar o nome do fornecedor.

---

## 11.5 Telefone

Adicione um JTextField:

| Propriedade | Valor |
|---|---|
| `variable` | `textFone` |

Adicione também um JLabel:

| Propriedade | Valor |
|---|---|
| `variable` | `lblFone` |
| `text` | Fone |
| `enable` | `false` |

---

## 11.6 E-mail

Adicione um JTextField:

| Propriedade | Valor |
|---|---|
| `variable` | `textEmail` |

Adicione um JLabel:

| Propriedade | Valor |
|---|---|
| `variable` | `lblEmail` |
| `text` | Email |
| `enable` | `false` |

---

## 11.7 Site

Adicione um JTextField:

| Propriedade | Valor |
|---|---|
| `variable` | `textSite` |

Adicione um JLabel:

| Propriedade | Valor |
|---|---|
| `variable` | `lblSite` |
| `text` | Site |
| `enable` | `false` |

---

# 12. O que é JTextField?

O `JTextField` é um componente Swing utilizado para receber ou exibir textos em uma única linha.

Exemplos:

- Nome;
- Telefone;
- E-mail;
- Endereço;
- Código;
- Site.

### Exemplo

```java
JTextField textNome = new JTextField();
```

Cria um campo de texto vazio.

Para obter o texto digitado:

```java
String nome = textNome.getText();
```

Para alterar o conteúdo:

```java
textNome.setText("Fornecedor ABC");
```

Para limpar:

```java
textNome.setText("");
```

### columns

```java
textNome.setColumns(10);
```

Define a quantidade de colunas utilizada como referência para o tamanho preferencial do campo.

No entanto, quando usamos:

```java
textNome.setBounds(57, 43, 281, 20);
```

a largura e a altura reais do componente são definidas pelo `setBounds()`.

---

# 13. Código final da classe frmFornecedor.java

```java
package view;

import javax.swing.JDialog;
import java.awt.Toolkit;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

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

        textFone = new JTextField();
        textFone.setColumns(10);
        textFone.setBounds(57, 71, 121, 20);
        getContentPane().add(textFone);

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

# 14. Criando o pacote model

Agora vamos criar um novo pacote dentro do `src`.

No Eclipse:

1. Clique com o botão direito em `src`.
2. `New`.
3. `Package`.
4. Digite `model`.
5. Clique em Finish.

O pacote `model` será responsável por armazenar as classes que representam os dados do sistema.

## O que é Model?

Em aplicações organizadas em camadas, o Model representa os dados e as regras relacionadas a esses dados.

No nosso projeto, por exemplo, a classe `Fornecedor` representará um fornecedor e suas informações.

A separação dos pacotes ajuda a organizar o sistema:

| Pacote | Responsabilidade |
|---|---|
| `view` | Interface gráfica |
| `database` | Conexão e acesso ao banco |
| `model` | Representação dos dados |

Essa organização facilita manutenção, compreensão e evolução do projeto.

---

# 15. Criando a classe Fornecedor

Dentro do pacote `model`:

1. Clique com o botão direito.
2. `New`.
3. `Class`.
4. Nome: `Fornecedor`.
5. Clique em Finish.

A classe `Fornecedor` será responsável por representar os dados de um fornecedor.

## 15.1 Atributos

```java
private int idFornecedor;
private String nome;
private String fone;
private String email;
private String site;
```

Esses atributos correspondem às informações da tabela `fornecedores` criada anteriormente no MySQL.

| Java | Banco de dados | Tipo |
|---|---|---|
| `idFornecedor` | `idFornecedor` | INT |
| `nome` | `nome` | VARCHAR |
| `fone` | `fone` | VARCHAR |
| `email` | `email` | VARCHAR |
| `site` | `site` | VARCHAR |

### Por que os atributos são private?

Utilizamos `private` para impedir que outras classes acessem diretamente os atributos.

Isso faz parte do conceito de **encapsulamento** da Programação Orientada a Objetos.

Em vez de acessar diretamente os atributos, outras classes utilizam métodos públicos para consultar ou alterar os valores.

---

# 16. Getters e Setters

A classe `Fornecedor` possui métodos chamados getters e setters.

## Getter

O Getter permite obter o valor armazenado em um atributo.

Exemplo:

```java
public String getNome() {
    return nome;
}
```

Esse método retorna o nome do fornecedor.

Quando outra classe chama:

```java
fornecedor.getNome();
```

ela recebe o valor armazenado no atributo `nome`.

## Setter

O Setter permite alterar o valor de um atributo.

Exemplo:

```java
public void setNome(String nome) {
    this.nome = nome;
}
```

### Entendendo o this

No código:

```java
this.nome = nome;
```

Existem dois elementos chamados `nome`:

- `this.nome`: atributo da classe.
- `nome`: parâmetro recebido pelo método.

O `this` indica que estamos nos referindo ao atributo do objeto atual.

Assim, o valor recebido pelo parâmetro é armazenado no atributo da classe.

---

# 17. Código completo da classe Fornecedor.java

```java
package model;

public class Fornecedor {

    // MODELO DE DADOS DA TABELA FORNECEDORES

    private int idFornecedor;
    private String nome;
    private String fone;
    private String email;
    private String site;

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

# 18. Utilizando a classe Fornecedor

A classe criada ainda não está conectada diretamente ao banco de dados.

Ela apenas representa os dados de um fornecedor dentro do Java.

Podemos criar um objeto e armazenar informações nele.

### Exemplo

```java
Fornecedor fornecedor = new Fornecedor();

fornecedor.setNome("Loja ABC");
fornecedor.setFone("11999999999");
fornecedor.setEmail("contato@lojaabc.com");
fornecedor.setSite("www.lojaabc.com");
```

Agora o objeto possui os dados que foram definidos.

Para recuperar essas informações:

```java
System.out.println(fornecedor.getNome());
System.out.println(fornecedor.getFone());
System.out.println(fornecedor.getEmail());
System.out.println(fornecedor.getSite());
```

### Resultado

```text
Loja ABC
11999999999
contato@lojaabc.com
www.lojaabc.com
```

O atributo `idFornecedor` não foi definido manualmente nesse exemplo. Quando o fornecedor for inserido no banco de dados, o MySQL poderá gerar o ID automaticamente por meio do `AUTO_INCREMENT`.

---

# 19. Relação entre View, Model e Database

Neste projeto, estamos começando a separar responsabilidades.

```text
┌─────────────────────┐
│        VIEW         │
│  Interface gráfica  │
│  Main               │
│  Sobre              │
│  frmFornecedor      │
└──────────┬──────────┘
           │
           │ Dados e interação
           v
┌─────────────────────┐
│        MODEL        │
│  Fornecedor         │
│  Representa dados   │
└─────────────────────┘

┌─────────────────────┐
│      DATABASE       │
│  Database.java      │
│  Conexão MySQL      │
└─────────────────────┘
```

A `View` apresenta a interface ao usuário.

O `Model` representa os dados utilizados pelo sistema.

O `Database` é responsável pela conexão com o banco de dados.

Posteriormente, essas partes serão integradas para que os dados digitados no formulário possam ser cadastrados, consultados, alterados e excluídos no banco.

---

## ⚠️ Observações importantes sobre o código da aula

### 1. Nome da classe `frmFornecedor`

Na aula, a classe foi criada com o nome `frmFornecedor`.

O Java permite esse nome, porém a convenção de nomenclatura recomenda nomes de classes começando com letra maiúscula e utilizando CamelCase.

Exemplo de nomenclatura convencional:

```java
FrmFornecedor
```

Como estamos acompanhando o projeto e o nome definido na aula, mantivemos `frmFornecedor`.

### 2. JLabel desabilitados

No código, os labels recebem:

```java
lblNome.setEnabled(false);
```

Isso pode fazer com que o texto fique visualmente desabilitado, dependendo do Look and Feel.

Um JLabel normalmente não precisa ser desabilitado para impedir edição, porque ele não é um campo editável.

### 3. Centralização das janelas

Tanto `Sobre` quanto `frmFornecedor` utilizam:

```java
setLocationRelativeTo(null);
```

Isso centraliza as janelas na tela.

### 4. O cadastro ainda não grava no banco

A janela `frmFornecedor` possui os campos visuais, mas ainda não realiza operações SQL.

Até este ponto, temos:

- Interface do formulário;
- Campos para os dados;
- Classe Model `Fornecedor`;
- Conexão com o banco desenvolvida anteriormente.

O próximo passo será integrar esses componentes para realizar operações de cadastro.

---

# 🧠 Guia Rápido de Memorização

| Código / conceito | Função |
|---|---|
| `dispose()` | Fecha e libera a janela |
| `ActionListener` | Trata eventos de ação |
| `actionPerformed()` | Executa quando uma ação é disparada |
| `MouseAdapter` | Facilita a implementação de eventos de mouse |
| `mouseClicked()` | Trata clique do mouse |
| `Desktop.getDesktop()` | Acessa funcionalidades do Desktop |
| `desktop.browse(uri)` | Solicita abertura de um endereço no navegador |
| `URI` | Representa um identificador/endereço de recurso |
| `setLocationRelativeTo(null)` | Centraliza a janela na tela |
| `JTextField` | Campo de entrada de texto |
| `getText()` | Obtém o texto de um componente |
| `setText()` | Altera o texto de um componente |
| `private` | Restringe acesso direto |
| `Getter` | Obtém o valor de um atributo |
| `Setter` | Altera o valor de um atributo |
| `this` | Referencia o objeto atual |
| `Model` | Representa dados e regras associadas |
| `View` | Interface gráfica da aplicação |

---

# Resumo Relâmpago — 10 linhas

1. `dispose()` fecha a janela atual e libera recursos gráficos.
2. `ActionListener` trata eventos de ação, como cliques em botões.
3. `MouseAdapter` facilita a criação de eventos relacionados ao mouse.
4. `Desktop.browse()` solicita que o navegador padrão abra uma URI.
5. `setLocationRelativeTo(null)` centraliza a janela na tela.
6. `JTextField` permite receber e exibir textos de uma linha.
7. Getters recuperam valores e setters alteram os atributos.
8. `this` referencia o objeto atual e diferencia atributos de parâmetros.
9. A classe `Fornecedor` representa os dados de um fornecedor no Java.
10. A separação entre `view`, `model` e `database` organiza as responsabilidades do projeto.
