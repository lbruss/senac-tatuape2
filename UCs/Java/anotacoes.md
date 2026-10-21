# Estruturas de Dados em Java (Arrays e ArrayList) e Introdução a Interfaces Gráficas com Swing e WindowBuilder

---

**Visão Geral**

Nesta aula, explorei o armazenamento e a manipulação de dados em memória através das estruturas de **Arrays (Vetores)** e **ArrayLists (Vetores Dinâmicos)** em Java.

Aprendi a diferença fundamental entre gerenciar coleções de tamanho fixo na memória e trabalhar com coleções flexíveis que crescem dinamicamente conforme a necessidade da aplicação. Para praticar, desenvolvi um exemplo de manipulação de vetores, um sorteador aleatório de cartas de baralho e um cadastro dinâmico de contatos.

Na segunda parte da aula, fechei os projetos anteriores para manter a área de trabalho do Eclipse organizada e iniciei a construção de uma **Interface Gráfica (GUI)** para um sistema de Ponto de Venda (PDV - `blpvd`). Configurei a ferramenta visual **WindowBuilder**, criei uma janela `JFrame` customizada e importei a biblioteca externa **FlatLaf** (`flatlaf.jar`) para aplicar um visual moderno aos componentes gráficos.

---

**Entendendo o Conceito**

## Array Estático (Vetor) vs. Array Dinâmico (ArrayList)

Um **Array (Vetor)** é uma estrutura de dados **indexada**, sequencial e de **tamanho fixo**. No momento em que um array estático é criado na memória RAM, precisamos definir exatamente quantas posições ele terá, e esse limite não pode ser alterado durante a execução do programa.

Por outro lado, o **ArrayList** é uma classe nativa do Java (`java.util.ArrayList`) que implementa um vetor **dinâmico**. Ele permite adicionar, remover e pesquisar elementos sem que seja necessário definir um limite máximo de tamanho previamente.

> **Analogia da Caixa de Ovos vs. Mochila Expansível:**

* **Array Estático:** É como uma caixa de ovos de papelão com 6 compartimentos fixos. Cada posição tem um número (índice de $0$ a $5$). Você não pode colocar o 7º ovo na mesma caixa sem rasgá-la; se precisar de mais espaço, terá que comprar uma caixa inteira nova.
* **ArrayList:** É como uma mochila expansível inteligente. À medida que você vai colocando objetos dentro dela, ela se estica automaticamente para abrir mais espaço; se você tirar itens, ela encolhe.

---

## Interface Gráfica (Swing e WindowBuilder)

Até agora, nossas aplicações rodavam e exibiam resultados apenas através do terminal (console). Com a biblioteca **Java Swing** e a ferramenta **WindowBuilder**, passamos a construir janelas visuais com botões, campos de texto, ícones e menus editáveis de forma drag-and-drop (arrastar e soltar).

---

**Conceitos Fundamentais**

## Índices e Posições em Arrays

Toda estrutura indexada em Java é **baseada em zero (zero-indexed)**. Isso significa que:

* O primeiro elemento sempre fica no índice `0`.
* O segundo elemento fica no índice `1`.
* O último elemento de um array de tamanho $N$ fica no índice $N - 1$.

## Atributo `.length` vs. Método `.size()`

* **`array.length`**: É uma **propriedade/atributo** de arrays estáticos que informa a quantidade total de posições reservadas.
* **`list.size()`**: É um **método** de coleções dinâmicas (`ArrayList`) que retorna a quantidade atual de elementos armazenados na lista.

## Sorteios Aleatórios com `Math.random()`

O método `Math.random()` gera um número decimal do tipo `double` dentro do intervalo de $0.0$ até $0.999...$ (maior ou igual a 0.0 e estritamente menor que 1.0).
Para sortear um índice válido de um array:

1. Multiplicamos o resultado pelo tamanho do array.
2. Fazemos o *casting* explícito para `(int)`, descartando as casas decimais.

## Componentes da Interface Gráfica (`JFrame` e `FlatLaf`)

* **`JFrame`**: Classe do Java Swing que representa a janela principal de uma aplicação desktop (com barra de título, botões de fechar, minimizar e redimensionar).
* **`flatlaf.jar`**: Biblioteca externa (*Look and Feel*) moderna para Java Swing. Por padrão, a interface nativa do Swing tem um visual antigo; o FlatLaf aplica temas visuais limpos e modernos aos componentes.

---

### Código / Exemplos Práticos

**Exemplo 1: Manipulação de Vetores Estáticos (`Vetor1.java`)**

```java
package vetor;

/**
 * Exemplo prático de criação, leitura, alteração e iteração em Vetor Estático.
 * 
 * @author Bruss Loza
 */
public class Vetor1 {

    public static void main(String[] args) {
        // Declaração e inicialização direta de um array de Strings com 6 posições (índices 0 a 5)
        String[] carros = {"Ferrari", "Camaro", "Fusca", "Kombi", "Brasília", "Porsche"};

        // Exibe o tamanho total reservado no array (.length)
        System.out.println("Tamanho do array: " + carros.length);

        // Acessa e exibe o elemento na posição de índice 3 ("Kombi")
        System.out.println("Carro na posição 3: " + carros[3]);

        // Modifica o valor armazenado na posição 3
        carros[3] = "Gol";
        System.out.println("Carro alterado na posição 3: " + carros[3]);

        System.out.println("\n-------------------");
        System.out.println("Lista Completa de Carros:");
        System.out.println("-------------------");

        // Laço de repetição for tradicional para percorrer todo o vetor do índice 0 até length - 1
        for (int i = 0; i < carros.length; i++) {
            System.out.println("Índice " + i + ": " + carros[i]);
        }
    }
}

```

---

**Exemplo 2: Sorteador de Cartas com `Math.random()` (`JogoCarta.java`)**

```java
package vetor;

/**
 * Aplicação que utiliza arrays e geração de números aleatórios para sortear uma carta de baralho.
 */
public class JogoCarta {

    public static void main(String[] args) {
        // Vetores com os elementos do baralho
        String[] nipes = {"Ouros", "Copas", "Espadas", "Paus"};
        String[] faces = {"Ás", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Valete", "Dama", "Rei"};

        // Sorteia um índice válido para os nipes (entre 0 e 3)
        String nipe = nipes[(int) (Math.random() * nipes.length)];

        // Sorteia um índice válido para as faces (entre 0 e 12)
        String face = faces[(int) (Math.random() * faces.length)];

        // Exibe a carta sorteada
        System.out.println("Carta sorteada: " + face + " de " + nipe);
    }
}

```

---

**Exemplo 3: Manipulação de Vetores Dinâmicos com `ArrayList` (`ArrayLista.java`)**

```java
package vetor;

import java.util.ArrayList; // Importação obrigatória para usar a coleção dinânica

/**
 * Exemplo prático de criação, adição, contagem e busca com ArrayList.
 */
public class ArrayLista {

    public static void main(String[] args) {
        // Criação de um ArrayList que aceita apenas objetos do tipo String (Generics)
        ArrayList<String> contatos = new ArrayList<>();

        // Adicionando dados dinamicamente usando o método .add()
        contatos.add("Bruss Loza");
        contatos.add("11 1234-5678");
        contatos.add("brussloza@email.com");

        contatos.add("Sirlene Sanches");
        contatos.add("11 1234-1234");
        contatos.add("sirlenesanches@email.com");

        contatos.add("Leandro Ramos");
        contatos.add("11 8765-4321");
        contatos.add("ramos@email.com");

        // Exibe a quantidade de itens atualmente armazenados (.size())
        System.out.println("Tamanho do ArrayList: " + contatos.size());
        
        // Exibe a representação textual completa do ArrayList
        System.out.println("Conteúdo bruto: " + contatos);

        // Acessa um elemento específico pelo seu índice usando o método .get(index)
        System.out.println("\nE-mail da Sirlene Sanches (índice 5): " + contatos.get(5));

        System.out.println("\n===============================");
        System.out.println("Iteração Completa do ArrayList:");
        System.out.println("===============================");
        
        // Laço for para percorrer a lista do índice 0 até size() - 1
        for (int i = 0; i < contatos.size(); i++) {
            System.out.println("Posição [" + i + "]: " + contatos.get(i));
        }
    }
}

```

---

**Desmontando o Código**

**Desmontando o Sorteio de Índice em `JogoCarta.java`**

```java
String face = faces[(int) (Math.random() * faces.length)];

```

1. **`Math.random()`**: Devolve um número decimal no intervalo $[0.0, 1.0)$. Suponha que sorteou $0.725$.
2. **`* faces.length`**: Multiplica pelo tamanho do array `faces` ($13$ elementos).

$$\text{Resultado} = 0.725 \times 13 = 9.425$$


3. **`(int) (...)`**: Faz o *casting* (conversão forçada) cortando toda a parte decimal.

$$\text{Resultado Inteiro} = 9$$


4. **`faces[9]`**: Acessa o 10º elemento do array `faces` (que corresponde ao valor `"10"`).

---

**Desmontando a Busca em `ArrayLista.java`**

```java
System.out.println(contatos.get(5));

```

1. **`contatos`**: Nome da variável que faz referência à instância de `ArrayList`.
2. **`.get(5)`**: Método utilizado para resgatar o dado presente no índice $5$.
* Em arrays estáticos, usaríamos colchetes: `array[5]`.
* Em `ArrayList`, é **obrigatório** utilizar o método `.get(5)`.



---

## Passo a Passo

**Passo a Passo 1: Como Fechar Projetos Inativos no Eclipse**

Para economizar memória RAM e evitar poluição no painel *Package Explorer*:

1. Clique com o **botão direito** sobre a pasta do projeto que deseja fechar.
2. Selecione a opção **Close Project**.
3. O ícone da pasta do projeto ficará cinza/fechado, liberando recursos do ambiente de desenvolvimento.

---

**Passo a Passo 2: Configuração Inicial da Interface Gráfica no Eclipse (Projeto `blpvd`)**

1. **Criar o Projeto e Pacote:**
* Crie um novo projeto Java (`File` ➔ `New` ➔ `Java Project`) chamado `blpvd`.
* Crie um pacote chamado `view` dentro da pasta `src`.


2. **Criar a Janela `JFrame` com WindowBuilder:**
* Clique com o botão direito no pacote `view` ➔ `New` ➔ `Other...`.
* Expanda a pasta **WindowBuilder** ➔ **Swing Designer** ➔ selecione **JFrame** e clique em **Next**.
* Nomeie a classe como `Main` (com M maiúsculo) e clique em **Finish**.


3. **Adicionar a Biblioteca Externa (`flatlaf.jar`):**
* Clique com o botão direito na raiz do projeto `blpvd` ➔ `New` ➔ `Folder` ➔ nomeie como `lib` e clique em **Finish**.
* Arraste o arquivo `flatlaf.jar` baixado no computador para dentro da pasta `lib` recém-criada no Eclipse.
* Clique com o botão direito sobre o arquivo `flatlaf.jar` dentro da pasta `lib` ➔ selecione **Build Path** ➔ **Add to Build Path**.
* *(O Eclipse criará uma pasta chamada "Referenced Libraries" confirmando a importação).*


4. **Configurar as Propriedades do `JFrame` no Modo Design:**
* Alterne para a aba **Design** na parte inferior do editor do Eclipse.
* Clique na estrutura `javax.swing.JFrame` no painel *Components*.
* Na aba **Properties** (lado esquerdo):
* Altere os valores de dimensão da janela para **800 x 600** pixels.
* Procure a propriedade `resizable` e altere para **`false`** (impede que o usuário desfigure a tela redimensionando-a).
* Procure a propriedade `iconImage`, clique no botão de três pontos (`...`), selecione a opção de imagem do projeto e escolha o arquivo de ícone de **64x64** pixels.

---

## Tabelas Comparativas

**Array Estático vs. ArrayList (Vetor Dinâmico)**

| Recurso / Operação | Array Estático (`String[]`) | ArrayList Dinâmico (`ArrayList<String>`) |
| --- | --- | --- |
| **Tamanho** | Fixo (definido no momento da criação). | Dinâmico (cresce e encolhe automaticamente). |
| **Performance** | Levemente mais rápido e consome menos memória. | Adiciona pequena sobrecarga por usar objetos internos. |
| **Adicionar Item** | `array[posicao] = valor;` | `list.add(valor);` |
| **Ler Item** | `array[index]` | `list.get(index)` |
| **Saber o Tamanho** | Propriedade `.length` | Método `.size()` |
| **Tipos Suportados** | Aceita tipos Primitivos (`int`, `double`) e Objetos. | Aceita **apenas Objetos** (requer *Wrapper Classes* para primitivos). |

---

**Leitura de Tamanho e Acesso por Estrutura**

| Estrutura de Dado | Como Saber o Tamanho? | Como Acessar um Elemento por Índice? |
| --- | --- | --- |
| **Array Estático** | `array.length` *(Atributo sem parênteses)* | `array[index]` |
| **`ArrayList`** | `list.size()` *(Método com parênteses)* | `list.get(index)` |
| **`String`** | `texto.length()` *(Método com parênteses)* | `texto.charAt(index)` |

---

## 8. Erros Comuns e Cuidados

### 1. Erro de Índice Fora dos Limites (`ArrayIndexOutOfBoundsException` / `IndexOutOfBoundsException`)

Ocorre quando tentamos acessar uma posição de índice que não existe na estrutura.

```java
String[] carros = {"Ferrari", "Camaro"}; // Possui 2 elementos (índices 0 e 1)

// ❌ INCORRETO (Gera ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2):
System.out.println(carros[2]); 

// ✅ CORRETO (O último elemento sempre fica em length - 1):
System.out.println(carros[carros.length - 1]);

```

---

### 2. Erro de Parênteses no Casting de `Math.random()`

Esquecer de isolar a multiplicação nos parênteses fará o *casting* zerar a expressão antes de multiplicar!

```java
// ❌ INCORRETO (O casting para int ocorre PRIMEIRO no Math.random(), resultando em 0 * 4 = 0 SEMPRE):
int indice = (int) Math.random() * 4; 

// ✅ CORRETO (A multiplicação é feita primeiro, e o resultado final é convertido em int):
int indice = (int) (Math.random() * 4);

```

---

### 3. Tentar Acessar Posições do `ArrayList` com Colchetes

A sintaxe de colchetes `[]` é exclusiva de arrays estáticos. Em `ArrayList`, usar colchetes gera erro de compilação.

```java
ArrayList<String> contatos = new ArrayList<>();
contatos.add("Bruss");

// ❌ INCORRETO (Erro de compilação):
System.out.println(contatos[0]);

// ✅ CORRETO:
System.out.println(contatos.get(0));

```

---

## 9. Correções Técnicas das Minhas Anotações

Durante a revisão e estruturação do meu rascunho de aula, apliquei as seguintes correções silenciosas:

1. **Ortografia em Nomes de Vetores:** Corrigi erros de digitação presentes no rascunho (ex: `"combi"` para `"Kombi"`, `"porche"` para `"Porsche"`, `"Az"` para `"Ás"`, `"Valente"` para `"Valete"`).
2. **E-mail de Teste:** Corrigi o erro de digitação da String `"bruasssloza@email.com"` para `"brussloza@email.com"`.
3. **Convenção de Nomenclatura de Pacotes:** Corrigi o nome do pacote `Vetor` (com maiúscula) para `vetor` em letras minúsculas, alinhando com a convenção oficial do Java.
4. **Detalhamento do `flatlaf.jar`:** Adicionei a explicação de que a biblioteca *FlatLaf* atua como um *Look and Feel* gráfico, detalhando o porquê de realizarmos a adição no *Build Path*.

---

## 10. Conteúdo Complementar e Aprofundamento

### A. Percorrendo Arrays com o Laço For-Each (*Enhanced For*)

Além do laço `for` tradicional com variável contadora `i`, o Java possui uma sintaxe muito mais limpa para percorrer todos os elementos de um Array ou `ArrayList` quando não precisamos controlar o número do índice:

```java
String[] carros = {"Ferrari", "Camaro", "Fusca"};

// Sintaxe do For-Each: para cada 'carro' do tipo String contido no vetor 'carros'
for (String carro : carros) {
    System.out.println("Carro: " + carro);
}

```

---

### B. Aplicando o Tema FlatLaf no Código Java Swing

Para que a biblioteca `flatlaf.jar` que adicionamos à pasta `lib` realmente altere o visual da janela `JFrame` ao rodar a aplicação, adicionamos a seguinte linha de instrução logo no início do método `main`:

```java
import com.formdev.flatlaf.FlatDarkLaf;

public static void main(String[] args) {
    try {
        // Ativa o tema escuro moderno do FlatLaf na interface Swing
        FlatDarkLaf.setup();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Inicializa a janela JFrame
    Main frame = new Main();
    frame.setVisible(true);
}

```

---

## Resumo Relâmpago — 10 Linhas

1. Arrays são estruturas de dados indexadas e de tamanho fixo alocadas na memória.
2. Todo array em Java inicia seu primeiro elemento no índice 0 e vai até o índice `length - 1`.
3. O atributo `.length` informa o número total de posições de um array estático.
4. O método `Math.random()` gera decimais entre $0.0$ e $0.999...$ e exige conversão explícita `(int)`.
5. O `ArrayList` é uma coleção dinâmica que ajusta seu tamanho automaticamente ao adicionar elementos.
6. Em um `ArrayList`, utilizamos o método `.add()` para inserir e `.get(index)` para recuperar dados.
7. O método `.size()` retorna a quantidade atual de elementos presentes em um `ArrayList`.
8. Janelas gráficas em Java utilizam a classe `JFrame` pertencente à biblioteca Java Swing.
9. O WindowBuilder é um construtor visual para arrastar e configurar componentes de interface gráfica.
10. A biblioteca `flatlaf.jar` é adicionada ao *Build Path* para aplicar um visual moderno (*Look & Feel*) ao Swing.

---

## Guia Rápido de Memorização

### Sintaxe de Arrays vs. ArrayList

```java
// ARRAY ESTÁTICO
String[] vetor = new String[5];        // Criação com tamanho fixo
String[] nomes = {"A", "B", "C"};     // Inicialização direta
int tam = nomes.length;               // Tamanho
String item = nomes[0];                // Leitura

// ARRAYLIST DINÂMICO
ArrayList<String> lista = new ArrayList<>(); // Criação
lista.add("A");                              // Inserção
int tam = lista.size();                      // Tamanho
String item = lista.get(0);                  // Leitura

```
