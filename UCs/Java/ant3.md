# 📚 Java — BL-PDV: Data do sistema, menu lateral e janela Sobre

## 1. Atualizando a data do sistema na janela principal

Na classe `Main.java`, vamos adicionar comandos para obter a data atual do sistema operacional e exibi-la na interface gráfica.

Para isso, utilizaremos duas classes:

- `LocalDate`: obtém e trabalha com uma data, sem horário.
- `DateTimeFormatter`: permite definir o formato em que a data será exibida.

### Importando as classes

```java
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
```

Essas importações permitem trabalhar com datas de forma moderna, utilizando a API de datas do Java.

### Criando a variável JLabel

Dentro da classe `Main`, adicionamos:

```java
private JLabel lblData;
```

Essa variável representa o componente visual que exibirá a data na janela.

O `private` significa que essa variável só poderá ser acessada diretamente dentro da própria classe `Main`.

---

## 2. Criando o método atualizarData()

Dentro da classe `Main`, criamos o método:

```java
private void atualizarData() {
    // OBTER A DATA DO SISTEMA OPERACIONAL
    DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    String data = LocalDate.now().format(formatoData);

    // ALTERAR O TEXTO DE lblData
    lblData.setText(data);
}
```

### Explicando cada parte

**1. Criando o formato da data**

```java
DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
```

O `DateTimeFormatter` define como a data será apresentada.

O padrão utilizado é:

| Símbolo | Significado | Exemplo |
|---|---|---|
| `dd` | Dia com dois dígitos | 05 |
| `MM` | Mês com dois dígitos | 11 |
| `yyyy` | Ano com quatro dígitos | 2026 |

O resultado será uma data no formato:

`18/11/2026`

**Atenção:** usamos `MM` maiúsculo para representar o mês. `mm` minúsculo representa minutos.

**2. Obtendo a data atual**

```java
String data = LocalDate.now().format(formatoData);
```

- `LocalDate.now()` obtém a data atual do sistema operacional.
- `.format(formatoData)` aplica o formato definido anteriormente.
- O resultado é armazenado na variável `data`.

**3. Atualizando o JLabel**

```java
lblData.setText(data);
```

O método `setText()` altera o texto exibido no JLabel.

Assim, a data obtida pelo sistema passa a aparecer na interface gráfica.

### Chamando o método

Dentro do construtor `Main()`, depois da criação dos componentes e da verificação de conexão, adicionamos:

```java
atualizarData();
```

Isso faz com que o método seja executado quando a janela principal é criada.

> **Observação:** nesse código, a data é atualizada somente quando a janela é aberta. Ela não fica atualizando automaticamente durante o dia. Para isso, seria necessário utilizar um temporizador.

---

## 3. Código final da classe Main.java

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
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

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
        lblCalendario.setBounds(676, 11, 24, 36);
        contentPane.add(lblCalendario);

        lblData = new JLabel("");
        lblData.setBounds(710, 11, 64, 36);
        contentPane.add(lblData);

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

# 4. Criando o painel lateral (JPanel)

Agora vamos começar a montagem visual do sistema através do **Design do WindowBuilder**.

### Passo a passo

1. Abra `Main.java`.
2. Clique na aba **Design**.
3. Selecione `contentPane`.
4. Na aba de componentes, procure por **Containers**.
5. Selecione `JPanel`.
6. Desenhe um retângulo no lado esquerdo da janela.

### Configurando o painel

Nas propriedades do painel, configure:

| Propriedade | Valor |
|---|---|
| `width` | 196 |
| `height` | 538 |
| `background` | Escolha uma cor |
| `layout` | Absolute |
| `variable` | `panelLateral` |

A propriedade `Bounds` controla as dimensões e a posição do componente.

- `x`: posição horizontal.
- `y`: posição vertical.
- `width`: largura.
- `height`: altura.

### O que é JPanel?

O `JPanel` é um contêiner utilizado para agrupar componentes da interface gráfica.

Podemos colocar dentro dele:

- JLabel;
- JButton;
- JTextField;
- outros painéis;
- entre outros componentes Swing.

No projeto, ele será utilizado para criar a barra lateral, agrupando o logo, o nome do sistema e os botões.

### Layout Absolute

O layout `absolute` permite posicionar os componentes manualmente através de coordenadas e dimensões.

Isso significa que podemos definir exatamente onde cada componente ficará.

É utilizado neste projeto para facilitar a montagem visual através do WindowBuilder.

> **Observação:** layouts absolutos facilitam a montagem inicial, mas podem dificultar adaptações para diferentes resoluções e tamanhos de janela.

---

# 5. Criando a logo e o nome do sistema

## JLabel da logo

Dentro do painel lateral, adicione um `JLabel`.

Configure:

- `icon`: imagem do carrinho;
- `variable`: `lblLogo`;
- posicionamento: canto superior esquerdo do painel.

A imagem será utilizada como logo do sistema.

## JLabel BL-PDV

Adicione outro `JLabel` ao lado da logo.

Configure:

| Propriedade | Valor |
|---|---|
| `text` | BL-PDV |
| `font` | Arial |
| `style` | Bold |
| `size` | 25 |
| `foreground` | Cor desejada |
| `variable` | `lblBLPDV` |

### Font

A propriedade `Font` define a aparência do texto.

Ela permite configurar:

- Tipo da fonte: Arial, Tahoma, etc.
- Estilo: Plain, Bold, Italic.
- Tamanho: por exemplo, 15, 20 ou 25.

`Bold` deixa o texto em negrito.

`Foreground` define a cor do texto.

---

## JLabel Sistema de PDV

Adicione outro `JLabel` logo abaixo do nome BL-PDV.

Configure:

- `text`: Sistema de PDV
- `variable`: `lblSistema`

Esse componente servirá como subtítulo da logo.

---

# 6. Criando o botão Fornecedores

No painel lateral, procure por `JButton` e adicione o componente abaixo da logo.

O botão será utilizado posteriormente para abrir a tela de cadastro e gerenciamento de fornecedores.

### Preparando o ícone

1. Procure uma imagem de fornecedor com dimensão de 32 × 32 pixels.
2. Salve o arquivo com o nome `fornecedor`.
3. Arraste a imagem para a pasta `img` do projeto Eclipse.
4. Selecione o JButton no Design.
5. Na propriedade `icon`, selecione a imagem do fornecedor.

### Configurando o botão

| Propriedade | Valor |
|---|---|
| `text` | Fornecedores |
| `font` | Arial |
| `style` | Bold |
| `size` | 15 |
| `background` | Cor desejada |
| `variable` | `btnFornecedores` |
| `icon` | Ícone fornecedor |

### O que é JButton?

O `JButton` é um botão que permite ao usuário executar uma ação ao clicar nele.

Exemplos no BL-PDV:

- Abrir fornecedores;
- Abrir produtos;
- Abrir vendas;
- Abrir relatórios;
- Abrir informações do sistema.

Por enquanto, estamos apenas criando e configurando o botão visualmente. A ação de abrir outra tela será programada posteriormente.

---

# 7. Removendo a borda do botão

Selecione o botão `btnFornecedores`.

1. Clique em **Show Advanced Properties**.
2. Procure a propriedade `borderPainted`.
3. Desmarque a opção, definindo como `false`.

### O que significa borderPainted?

Essa propriedade determina se a borda do botão será desenhada.

- `true`: a borda será exibida.
- `false`: a borda não será desenhada.

Isso permite criar botões com uma aparência mais limpa, combinando com o design da barra lateral.

---

# 8. Criando a separação e o botão Sobre

## JLabel de separação

Adicione um novo `JLabel` no painel lateral.

Na propriedade `text`, coloque vários hífens (`-`) para formar uma linha visual.

Posicione o componente próximo à parte inferior do painel, deixando um espaço entre ele e o final.

Essa linha servirá como uma divisão visual entre os botões principais e o botão Sobre.

## JButton Sobre

Adicione outro `JButton` abaixo da linha de separação.

Configure:

| Propriedade | Valor |
|---|---|
| `text` | Sobre |
| `font` | Arial |
| `style` | Bold |
| `size` | 15 |
| `icon` | Ícone Sobre de 32 × 32 |
| `variable` | Definir variável para o botão |

### Adicionando o ícone

1. Procure uma imagem relacionada à opção Sobre, com tamanho 32 × 32 pixels.
2. Salve a imagem.
3. Arraste-a para a pasta `img` do Eclipse.
4. Selecione o botão Sobre.
5. Em `icon`, escolha a imagem.

O botão terá a função de abrir uma janela com informações sobre o sistema.

---

# 9. Criando a janela Sobre (JDialog)

Agora criaremos uma janela separada para apresentar as informações do BL-PDV.

### Criando a classe

No Eclipse:

1. Clique com o botão direito no pacote `view`.
2. Vá em `New`.
3. Clique em `Other`.
4. Procure `WindowBuilder`.
5. Abra `Swing Designer`.
6. Selecione `JDialog`.
7. Clique em Next.
8. Digite o nome `Sobre`.
9. Finalize.

Será criada a classe `Sobre.java`.

### O que é JDialog?

O `JDialog` é um componente Swing utilizado para criar janelas de diálogo.

Ele pode ser utilizado para:

- Exibir informações;
- Solicitar confirmação;
- Mostrar avisos;
- Apresentar configurações;
- Exibir informações sobre um programa.

Neste projeto, o JDialog será usado para exibir informações do BL-PDV.

### JFrame x JDialog

| JFrame | JDialog |
|---|---|
| Janela principal de uma aplicação | Janela auxiliar ou de diálogo |
| Geralmente representa a tela principal | Geralmente apresenta informações ou interações complementares |
| Exemplo: `Main` | Exemplo: `Sobre` |

---

# 10. Configurando a janela Sobre

Abra `Sobre.java` e clique na aba `Design`.

### Removendo os botões padrão

Caso o WindowBuilder tenha criado os botões `OK` e `Cancel`, selecione-os e exclua.

Eles não serão necessários nesta janela.

### Configurando o tamanho

Selecione o componente principal `javax.swing.JDialog`.

Configure:

| Propriedade | Valor |
|---|---|
| Width | 270 |
| Height | 370 |
| `title` | Sobre |
| `iconImage` | Ícone Sobre |
| `layout` | Absolute |

A janela terá dimensões de 270 × 370 pixels.

### Configurando o ícone da janela

Na propriedade `iconImage`, selecione a imagem do ícone Sobre que foi adicionada anteriormente à pasta `img`.

Essa imagem será exibida na barra de título da janela.

---

# 11. JLabel BL-PDV na janela Sobre

Adicione um `JLabel` à janela.

Configure:

| Propriedade | Valor |
|---|---|
| `text` | BL-PDV |
| `horizontalAlignment` | Center |
| `font` | Arial |
| `style` | Bold |
| `size` | 15 |
| `variable` | `lblBLPDV` |

### horizontalAlignment

Essa propriedade determina o alinhamento horizontal do texto dentro do JLabel.

- `LEFT`: alinhado à esquerda.
- `CENTER`: centralizado.
- `RIGHT`: alinhado à direita.

Nesse caso, utilizaremos `Center` para deixar o nome BL-PDV centralizado na janela.

---

# 12. JLabel da descrição do sistema

Adicione outro `JLabel` abaixo do nome BL-PDV.

Configure:

| Propriedade | Valor |
|---|---|
| `text` | Sistema para gestão em estoque e PDV |
| `font` | Negrito |
| `size` | 12 |
| `variable` | `lblDescricao` |

Esse texto explica brevemente a finalidade do sistema.

**PDV significa Ponto de Venda**, sistema utilizado para realizar e gerenciar operações de vendas.

---

# 13. JLabel do autor

Adicione outro `JLabel`.

Configure:

| Propriedade | Valor |
|---|---|
| `text` | Autor: Bruss Liza |
| `variable` | `lblAutor` |

Esse componente exibirá a identificação do autor do projeto.

---

# 14. JLabel da versão

Adicione outro `JLabel`.

Configure:

| Propriedade | Valor |
|---|---|
| `text` | Versão 1.0 |
| `variable` | `lblVersao` |

A versão indica a identificação do lançamento do software.

Exemplo:

- 1.0 — primeira versão;
- 1.1 — atualização menor;
- 2.0 — versão com mudanças maiores.

Essa numeração é uma convenção de versionamento e pode ser definida pelo desenvolvedor.

---

## 🧠 Guia rápido de memorização

| Componente / método | Função |
|---|---|
| `JFrame` | Janela principal |
| `JDialog` | Janela auxiliar |
| `JPanel` | Agrupa componentes |
| `JLabel` | Exibe textos e imagens |
| `JButton` | Botão de ação |
| `setText()` | Altera o texto de um componente |
| `setIcon()` | Define um ícone |
| `setBounds()` | Define posição e dimensões |
| `LocalDate.now()` | Obtém a data atual |
| `DateTimeFormatter` | Define o formato da data |
| `setForeground()` | Define a cor do texto |
| `setBackground()` | Define a cor de fundo |
| `borderPainted` | Controla a exibição da borda |
| `JDialog` | Cria uma janela de diálogo |

---

# Resumo Relâmpago — 10 linhas

1. `LocalDate.now()` obtém a data atual do sistema.
2. `DateTimeFormatter` define o formato de apresentação da data.
3. `lblData.setText(data)` exibe a data no JLabel.
4. `JPanel` é um contêiner utilizado para agrupar componentes.
5. `JLabel` exibe textos e imagens na interface.
6. `JButton` cria botões que podem executar ações.
7. `absolute` permite posicionar componentes manualmente.
8. `borderPainted = false` remove o desenho da borda do botão.
9. `JDialog` cria uma janela auxiliar, como a janela Sobre.
10. A janela Sobre apresenta o nome, descrição, autor e versão do BL-PDV.
