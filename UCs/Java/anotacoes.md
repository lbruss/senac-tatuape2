# Introdução ao Java: História, Configuração do Ambiente e Fundamentos da Linguagem

---

**Visão Geral**

Nesta aula, iniciei meus estudos em **Java**, uma das linguagens de programação mais populares, robustas e utilizadas no mercado de tecnologia em todo o mundo.

A linguagem nasceu na década de 1990, dentro da empresa *Sun Microsystems*, criada por uma equipe liderada por James Gosling (conhecida como *Green Team*). Curiosamente, a ideia inicial era desenvolver um dispositivo portátil sem fio com tela sensível ao toque para controlar eletrodomésticos e eletrônicos (o projeto *Star7*). Como essa tecnologia estava muito à frente do seu tempo e o mercado não comprou a ideia, a equipe retrabalhou o projeto em 1995 para voltá-lo à recém-nascida **Internet**, criando o navegador **HotJava**, capaz de executar pequenos programas (Applets) diretamente na web.

Anos mais tarde, a *Sun Microsystems* foi adquirida pela **Oracle**, que é a responsável pelo desenvolvimento e manutenção do Java até hoje.

O grande diferencial do Java é o seu slogan **WORA** (*"Write Once, Run Anywhere"* — "Escreva uma vez, execute em qualquer lugar"). Isso significa que um programa escrito em Java pode rodar em praticamente qualquer sistema operacional sem precisar ter seu código reescrito.

**Onde o Java é utilizado hoje?**

* **Back-end de Aplicações Web:** Muito forte no mercado corporativo e bancário (usando frameworks modernos e tecnologias tradicionais como Servlets e JSP).
* 
* **Desenvolvimento Android:** Linguagem base nativa para criação de aplicativos móveis para Android.
* 
* **Sistemas Desktop:** Softwares locais corporativos (como o programa oficial de declaração do Imposto de Renda no Brasil).
* 
* **Games:** Jogos de grande porte (o exemplo mais famoso feito em Java é o *Minecraft*).
* 
* **Dispositivos Embarcados e Robótica:** Utilizado em cartões inteligentes (*Smartcards*), robôs, sistemas de som e até em sondas espaciais da NASA.

---

**Entendendo o Conceito**

## A Arquitetura do Java e a JVM

Entendi que o grande segredo do slogan *WORA* está na camada intermediária que o Java utiliza entre o nosso código e o sistema operacional: a **JVM (Java Virtual Machine — Máquina Virtual Java)**.

Em linguagens como C ou C++, o código é compilado diretamente para o "idioma" do processador da máquina (código de máquina específico para Windows, Linux ou Mac). Se você mudar de sistema, precisa recompilar tudo.

No Java, o processo funciona em duas etapas:

1. **Compilação (`javac`):** O nosso código-fonte (arquivo `.java`) é traduzido pelo compilador para uma linguagem intermediária universal chamada **Bytecode** (arquivo `.class`).
2. **Execução (`java`):** A **JVM** lê esse arquivo `.class` e o traduz em tempo de execução para os comandos específicos do Sistema Operacional em que ela está instalada.

```
+---------------------+        +--------------------+        +------------------+        +----------------------+
| Aplicação Java      | -----> | Compilador (javac) | -----> | Bytecode (.class)| -----> | JVM (Virtual Machine)|
| (Arquivo .java)     |        +--------------------+        +------------------+        +----------------------+
+---------------------+                                                                         |
                                                                                                v
                                                                                     +----------------------+
                                                                                     | Sistema Operacional  |
                                                                                     | (Windows/Linux/Mac)  |
                                                                                     +----------------------+

```

> Analogia do Tradutor Universal:

Imagine que você escreve um livro em um idioma neutro universal (o *Bytecode*). Em vez de reescrever o livro para o espanhol, francês ou japonês, você apenas contrata um tradutor nativo de cada país (a *JVM* de cada Sistema Operacional) para ler aquele livro universal para a plateia local. O seu texto original nunca precisa mudar.

---

## Conceitos Fundamentais

**JDK vs. JVM vs. IDE**

Para começar a programar em Java, preciso entender a diferença entre as ferramentas do ecossistema:

* **JDK (Java Development Kit):** É o kit de ferramentas completo do desenvolvedor. Ele contém o compilador (`javac`), utilitários e a própria JVM. **Se vou programar, preciso baixar o JDK.**
* **JVM (Java Virtual Machine):** É a máquina virtual que roda o bytecode. Ela vem embutida dentro do JDK.
* **IDE (Integrated Development Environment):** É o programa onde escrevemos o código. Ele facilita a nossa vida oferecendo editor de texto com destaques coloridos, auto-completar, gerenciamento de projetos e botões para compilar e rodar com um clique. Exemplos: **Eclipse**, **NetBeans**, **IntelliJ IDEA** (ou editores de código como o **VS Code**).

---

## Variáveis e Tipos de Dados

Em Java, uma **variável** é um espaço reservado na memória RAM do computador para armazenar uma informação que pode mudar durante a execução do programa.

Como o Java é uma linguagem **fortemente tipada**, sou obrigado a declarar o **tipo exato** de dado que uma variável vai guardar antes de usá-la, e ela só aceitará valores daquele tipo.

#### Os Tipos de Dados em Java se dividem em dois grupos:

1. **Tipos Primitivos:** Tipos nativos da linguagem que guardam valores simples diretamente na memória.
2. **Tipos Não Primitivos (Tipos de Referência):** Objetos e estruturas mais complexas (como texto estruturado).

#### Tabela Completa de Tipos de Dados:

| Grupo | Tipo | Tamanho na Memória | Faixa de Valores / Descrição | Exemplo de Uso |
| --- | --- | --- | --- | --- |
| **Inteiros** | `byte` | 1 byte | -128 até 127 | `byte idade = 25;` |
|  | `short` | 2 bytes | -32.768 até 32.767 | `short ano = 2026;` |
|  | `int` | 4 bytes | -2.147.483.648 até 2.147.483.647 *(Mais comum)* | `int populacao = 50000;` |
|  | `long` | 8 bytes | Valores inteiros gigantescos (exige sufixo `L`) | `long distancia = 999999999L;` |
| **Decimais (Flutuantes)** | `float` | 4 bytes | Precisão simples de casas decimais (exige sufixo `f`) | `float nota = 8.5f;` |
|  | `double` | 8 bytes | Precisão dupla *(Mais comum para decimais)* | `double preco = 29.90;` |
| **Booleano** | `boolean` | 1 byte | Apenas `true` (verdadeiro) ou `false` (falso) | `boolean ativo = true;` |
| **Caractere** | `char` | 2 bytes | Um único caractere Unicode (entre aspas simples `' '`) | `char sexo = 'M';` |
| **Não Primitivo** | `String` | Variável | Cadeia de texto/caracteres (entre aspas dobras `" "`) | `String nome = "Bruss";` |

---

## Regras para Nomear Variáveis (Boas Práticas e Clean Code)

Para evitar erros de compilação e manter o código legível:

1. **Deve começar com letra minúscula.**
2. **Não pode conter espaços nem caracteres especiais** (como acentos, `~`, `@`, `-`), exceto `$` e `_`.
3. **Não pode usar palavras reservadas** da linguagem (como `public`, `class`, `static`, `int`, `double`).
4. **Usar o padrão `camelCase`:** Se o nome da variável tiver mais de uma palavra, a primeira palavra fica toda em minúsculas e as palavras seguintes começam com a primeira letra maiúscula (exemplo: `temperaturaAmbiente`, `arCondicionado`).
5. **Anotação Importante:** Em Java, uma variável **não pode ser utilizada sem antes ser inicializada** (ou seja, receber um valor inicial).

---

### Códigos / Exemplos Práticos

**Exemplo 1: Primeiro Programa em Java (`Hello.java`)**

```java
/**
 * Programa Hello World simples para testes de compilação manual.
 * 
 * @author Bruss Loza
 */
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}

```

---

**Exemplo 2: Estrutura Padrão com Pacote no Eclipse (`Hello.java`)**

```java
package cursojava;

/**
 * Exemplo de estrutura de classe Java utilizando pacote.
 * 
 * @author Bruss Loza
 */
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}

```

---

**Exemplo 3: Trabalhando com Variáveis de Texto e Atribuições (`Fundamentos.java`)**

```java
package cursojava;

public class Fundamentos {
    public static void main(String[] args) {
        // Declaração e inicialização direta na mesma linha
        String nome = "Bruss Loza";
        System.out.println(nome);

        // Declaração primeiro, atribuição de valor depois
        String nome1;
        nome1 = "Bruss Loza Carrasco";
        
        // Exibição com interpolação/concatenação de texto usando o operador '+'
        System.out.println("Nome: " + nome1);
    }
}

```

---

**Exemplo 4: Manipulação de Múltiplos Tipos de Dados (`FundamentosTipos.java`)**

```java
package cursojava;

public class FundamentosTipos {
    public static void main(String[] args) {
        // Declaração de variáveis de diferentes tipos
        String nome = "Bruss Loza";
        int idade = 19;
        char sexo = 'M';
        double temperatura = 30.5;
        boolean arCondicionado = false;

        // Impressão dos valores formatados no console
        System.out.println("Nome: " + nome);
        System.out.println("Idade: " + idade);
        System.out.println("Sexo: " + sexo);
        System.out.println("Temperatura: " + temperatura);
        System.out.println("Ar condicionado: " + arCondicionado);
    }
}

```

---

**Exemplo 5: Operadores Aritméticos, Atribuição e Incremento (`Operadores.java`)**

```java
package cursojava;

public class Operadores {
    public static void main(String[] args) {
        double i = 10;

        System.out.println("Operadores Aritméticos e Atribuições\n");
        System.out.println("Exemplos:\n");

        System.out.println("i = " + i); // Exibe o valor inicial da variável
        
        // Operações aritméticas diretamente no print (com parênteses para prioridade)
        System.out.println(i + " + 5 | i = " + (i + 5)); // Soma (15.0)
        System.out.println(i + " - 5 | i = " + (i - 5)); // Subtração (5.0)
        System.out.println(i + " * 5 | i = " + (i * 5)); // Multiplicação (50.0)
        System.out.println(i + " / 5 | i = " + (i / 5)); // Divisão (2.0)
        System.out.println(i + " % 5 | i = " + (i % 5)); // Módulo / Resto da divisão (0.0)
        
        System.out.println("------------------------");

        // Operadores de atribuição cumulativa (modificam o valor de i)
        System.out.println(i + " += 5 | i = " + (i += 5)); // i passa a ser 15.0
        System.out.println(i + " -= 5 | i = " + (i -= 5)); // i passa a ser 10.0
        System.out.println(i + " *= 5 | i = " + (i *= 5)); // i passa a ser 50.0
        System.out.println(i + " /= 5 | i = " + (i /= 5)); // i passa a ser 10.0

        System.out.println("------------------------");

        // Operadores de incremento e decremento unitário
        i++; // Incrementa 1 unidade (i = i + 1) -> i passa a ser 11.0
        System.out.println("i++ | " + i);

        i--; // Decrementa 1 unidade (i = i - 1) -> i volta a ser 10.0
        System.out.println("i-- | " + i);
    }
}

```

---

**Desmontando o Código**

Vamos entender por dentro como funciona o esqueleto básico do Java, desmontando a estrutura do `Hello World!`:

```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}

```

1. **`public class Hello`**:
* **`public`**: Modificador de acesso. Significa que esta classe é visível e pode ser acessada por qualquer outra parte do programa.
* **`class`**: Palavra-chave obrigatória para definir uma classe. Tudo no Java deve estar dentro de uma classe.
* **`Hello`**: O nome da classe. **Regra de Ouro:** O nome da classe `public` deve ser **rigorosamente idêntico** ao nome do arquivo (exemplo: `Hello.java`). Se mudar a letra maiúscula ou minúscula, o código não compila.


2. **`public static void main(String[] args)`**:
* Esta linha é o **ponto de entrada (entry point)** da aplicação. É por aqui que a JVM começa a ler e executar o programa.
* **`public`**: Permite que a JVM acesse o método externamente para rodar o programa.
* **`static`**: Permite que a JVM execute o método `main` sem precisar criar uma instância (objeto) da classe na memória.
* **`void`**: Indica o tipo de retorno. Significa que esse método executa suas instruções e **não devolve nenhum valor** no final.
* **`main`**: Nome padronizado do método principal reconhecido pelo Java.
* **`String[] args`**: Parâmetro que permite receber argumentos via linha de comando no terminal em forma de um vetor (Array) de palavras (`String`).


3. **`System.out.println("Hello World!");`**:
* **`System`**: Uma classe nativa do Java que fornece acesso a recursos do sistema.
* **`out`**: O objeto de saída padrão (o console/terminal).
* **`println`**: Método (*print line*) que imprime o texto informado entre aspas na tela e pula automaticamente para a próxima linha.
* **`;` (Ponto e Vírgula)**: Obrigatório ao final de cada instrução Java. Se esquecer, gera erro de sintaxe.



---

**Passo a Passo**

**Passo a Passo 1: Compilando e Executando Java Manualmente (Terminal / VS Code)**

Para fixar como o Java funciona por baixo dos panos sem a "mágica" das IDEs, fiz o processo completo pelo terminal:

1. **Criar a pasta do projeto e abrir o VS Code:**
* Motivo: Organizar os arquivos de código em um diretório limpo.


2. **Criar o arquivo `Hello.java`:**
* Motivo: O arquivo de código-fonte precisa obrigatoriamente ter a extensão `.java` e o mesmo nome exato da classe interna.


3. **Escrever o código estruturado e salvar.**
4. **Abrir o Terminal (`Ctrl + J` no VS Code ou Prompt de Comando):**
* Motivo: Executar os comandos do JDK.


5. **Listar o conteúdo da pasta com o comando `dir` (Windows) ou `ls` (Linux/Mac):**
* Motivo: Confirmar que o arquivo `Hello.java` está presente no diretório atual.


6. **Compilar o arquivo digitando `javac Hello.java`:**
* O que acontece: O compilador do Java lê o código humano (`.java`), verifica se há erros de sintaxe e cria o arquivo compilado em bytecode chamado `Hello.class`.


7. **Digitar `dir` novamente:**
* O que acontece: Agora observo que existem dois arquivos na pasta: `Hello.java` (código-fonte) e `Hello.class` (bytecode gerado).


8. **Executar a aplicação digitando `java Hello`:**
* O que acontece: A JVM é chamada, lê o bytecode `Hello.class` e executa o método `main`.
* **Atenção:** No comando `java`, **não** adicionamos a extensão `.class`, apenas o nome da classe.

---

**Passo a Passo 2: Criando um Projeto Java do Zero no Eclipse**

1. **Abrir o Eclipse e fechar a tela de Welcome.**
2. **Ajustar a perspectiva de trabalho:**
* Ir em `Window` ➔ `Perspective` ➔ `Open Perspective` ➔ `Java`.
* Motivo: Organizar os painéis do Eclipse com o layout ideal para desenvolvimento Java.


3. **Criar o Projeto:**
* Ir em `File` ➔ `New` ➔ `Java Project` (ou clicar em *Create a Java Project* na aba esquerda).
* Definir o nome do projeto (ex: `CursoJava`).
* **Atenção/Cuidados:** Nomes de projetos não devem conter espaços. Desmarcar a opção *Create module-info.java file* para evitar complicações com módulos em projetos simples. Clicar em *Finish*.


4. **Criar um Pacote (Package):**
* Clicar com o botão direito na pasta `src` ➔ `New` ➔ `Package`.
* Nomear o pacote (ex: `cursojava`).
* Motivo: Pacotes servem para organizar as classes em pastas e evitar conflitos de nomes no projeto. Convenção: usar sempre letras minúsculas.


5. **Criar a Classe:**
* Clicar com o botão direito no pacote criado ➔ `New` ➔ `Class`.
* Nomear a classe (ex: `Hello`).
* Marcar a opção `public static void main(String[] args)` e `Generate comments`.
* Clicar em *Finish*.


6. **Executar o Código:**
* Clicar no botão verde de **Play** (ou pressionar `Ctrl + F11`). O resultado aparecerá na aba *Console* na parte inferior da tela.

---

## Tabelas Comparativas

**Tipos de Operadores em Java**

| Categoria | Operadores | Função Principal | Exemplo |
| --- | --- | --- | --- |
| **Aritméticos** | `+`, `-`, `*`, `/`, `%` | Realizar cálculos matemáticos básicos. | `i + 5` (Soma) / `i % 2` (Resto da divisão) |
| **Atribuição Combinada** | `+=`, `-=`, `*=`, `/=` | Executa a operação e atualiza o valor da própria variável. | `i += 5` (Equivale a `i = i + 5`) |
| **Incremento/Decremento** | `++`, `--` | Adiciona ou subtrai exatamente 1 unidade da variável. | `i++` (Equivale a `i = i + 1`) |
| **Comparativos** | `>`, `>=`, `<`, `<=`, `==`, `!=` | Compara dois valores e retorna um resultado booleano (`true`/`false`). | `idade >= 18` / `x == y` |
| **Lógicos** | `&&`, `||`, `!` | Combina ou inverte condições booleanas. | `(idade >= 18) && (temCNH == true)` |

---

**Tabela Verdade dos Operadores Lógicos (`&&`, `||`, `!`)**

Os operadores lógicos servem para tomar decisões baseadas em múltiplas condições:

* **AND (`&&`) — "E":** Retorna `true` **apenas se AMBAS** as condições forem verdadeiras.
* **OR (`||`) — "OU":** Retorna `true` se **PELO MENOS UMA** das condições for verdadeira.
* **NOT (`!`) — "NÃO":** **Inverte** o valor booleano (o que é `true` vira `false`, o que é `false` vira `true`).

| Condição 1 | Condição 2 | AND (`&&`) | OR (`||`) | NOT Entrada 1 (`!`) |
| --- | --- | --- | --- | --- |
| `false` | `false` | **`false`** | **`false`** | **`true`** |
| `false` | `true` | **`false`** | **`true`** | **`true`** |
| `true` | `false` | **`false`** | **`true`** | **`false`** |
| `true` | `true` | **`true`** | **`true`** | **`false`** |

---

## Erros Comuns e Cuidados

**Aglutinação de Palavras Reservadas (Erro de Digitação)**

Acontece quando esquecemos de dar espaço entre os comandos. O Java não consegue interpretar as palavras juntas.

```java
// ❌ Incorreto (Erro de compilação):
publicclass Operadores {
    publicstaticvoid main(String[] args) { ... }
}

// ✅ Correto:
public class Operadores {
    public static void main(String[] args) { ... }
}

```

---

**Confusão entre Aspas Duplas e Aspas Simples**

* **Aspas Duplas (`" "`):** Usadas exclusivamente para cadeias de caracteres (`String`).
* **Aspas Simples (`' '`):** Usadas exclusivamente para um único caractere primitivo (`char`).

```java
// ❌ Incorreto:
char sexo = "M";   // Tentar colocar String em char gera erro
String nome = 'Bruss'; // Tentar colocar aspas simples em String gera erro

// ✅ Correto:
char sexo = 'M';
String nome = "Bruss";

```

---

**Divergência de Nomes de Arquivo e Classe**

Se o seu arquivo se chama `Hello.java`, a classe pública dentro dele **deve** ser `public class Hello`.

```java
// Se o arquivo salvo no disco for "Hello.java":

// ❌ Incorreto:
public class HelloWorld { ... } // Erro: Nome da classe difere do arquivo

// ✅ Correto:
public class Hello { ... }

```

---

## Conteúdo Complementar e Aprofundamento

**A Diferença entre JDK, JRE e JVM (Visão Completa)**

Para nunca mais confundir os componentes do Java, vale a pena entender a relação de "bonecas russas" que existe entre eles:

* **JVM (Java Virtual Machine):** É o motor. Apenas executa o bytecode.
* **JRE (Java Runtime Environment):** É o ambiente de execução para o **usuário final**. Contém a JVM + as bibliotecas padrão do Java necessárias para rodar sistemas. *(Se o usuário só quer rodar um programa em Java, ele precisa apenas da JRE).*
* **JDK (Java Development Kit):** É o pacote do **desenvolvedor**. Contém a JRE + Ferramentas de Desenvolvimento (como o compilador `javac`, depuradores e documentadores).

$$\text{JDK} = \text{JRE} + \text{Ferramentas de Desenvolvimento (javac)}$$

$$\text{JRE} = \text{JVM} + \text{Bibliotecas Padrão (Java API)}$$

---

**Resumo Relâmpago**

1. O Java foi criado nos anos 90 pela Sun Microsystems e atualmente pertence à Oracle.
2. Seu grande diferencial é o slogan WORA: *"Write Once, Run Anywhere"* (portabilidade total).
3. A JVM (Java Virtual Machine) é quem lê o Bytecode universal (`.class`) e o traduz para o sistema operacional.
4. O código-fonte (`.java`) é transformado em Bytecode (`.class`) pelo compilador `javac`.
5. Para desenvolver em Java precisamos do JDK (que traz o `javac` e a JVM) e de uma IDE (como Eclipse).
6. Toda aplicação Java inicia sua execução obrigatoriamente a partir do método `public static void main(String[] args)`.
7. O Java é fortemente tipado: todas as variáveis precisam ter seu tipo declarado antes de serem usadas.
8. Os tipos primitivos incluem inteiros (`int`, `byte`, `short`, `long`), decimais (`double`, `float`), lógicos (`boolean`) e caracteres (`char`).
9. `String` não é um tipo primitivo, mas sim uma classe que representa uma cadeia de caracteres (texto).
10. Operadores de atribuição cumulativa (`+=`, `-=`) e de incremento (`++`, `--`) modificam diretamente o valor armazenado na variável.

---

## Guia Rápido de Memorização

**Comandos do Terminal**

* `javac Arquivo.java` ➔ Compila o código-fonte humano e gera o bytecode `Arquivo.class`.
* `java Arquivo` ➔ Executa a classe no ambiente da JVM (sem a extensão `.class`).

**Convenções de Nomenclatura**

* **Classes:** `PascalCase` (primeira letra de cada palavra maiúscula, ex: `MinhaClasse`).
* **Variáveis e Métodos:** `camelCase` (primeira letra minúscula, próximas palavras maiúsculas, ex: `meuNome`).
* **Pacotes:** `lowercase` (tudo minúsculo, sem acentos, ex: `meupacote`).

**Atribuições e Incremento**

* `i = i + 1` ➔ `i += 1` ➔ `i++` (Aumenta 1 unidade)
* `i = i - 1` ➔ `i -= 1` ➔ `i--` (Diminui 1 unidade)
* `i = i * 5` ➔ `i *= 5` (Multiplica o valor atual por 5)
