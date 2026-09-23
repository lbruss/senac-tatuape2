# Java — Introdução e Fundamentos

## 1. Início do Java

### 1.1 Um pouco da história

O Java surgiu no início da década de 1990. A ideia inicial não era criar uma linguagem para computadores ou para a Internet.

Em **1990**, a equipe trabalhava em um projeto para desenvolver um dispositivo **wireless** com uma tela colorida sensível ao toque. Esse dispositivo teria a função de controlar televisão, aparelho de som, alarmes e outros equipamentos domésticos, além de interagir com computadores.

Para esse projeto, foi desenvolvida uma linguagem especialmente voltada para o dispositivo.

Em **1995**, como o projeto original estava muito à frente da tecnologia disponível na época, a equipe procurou outras possibilidades para utilizar a tecnologia desenvolvida.

Uma das alternativas foi entrar no mundo da **Internet**. A equipe criou um navegador capaz de executar aplicações desenvolvidas em Java. Esse navegador ficou conhecido como **HotJava**.

> **Observação:** o Java passou posteriormente a ser utilizado em diversos tipos de sistemas e dispositivos, tornando-se uma linguagem bastante conhecida pela sua portabilidade.

---

## 2. WORA — Write Once, Run Anywhere

Uma das ideias mais conhecidas associadas ao Java é o conceito:

> **WORA — Write Once, Run Anywhere**
> **"Escreva uma vez, rode em qualquer lugar."**

A ideia é que um programa Java possa ser executado em diferentes sistemas operacionais sem que seja necessário reescrever todo o código para cada sistema.

O material da aula apresenta a portabilidade como uma das principais vantagens do Java, citando exemplos como:

* Windows;
* Linux;
* macOS;
* Android;
* Smartcards;
* outros dispositivos.

### Mas como isso é possível?

O segredo está na **JVM — Java Virtual Machine**.

A estrutura básica pode ser entendida assim:

```text
Código Java
    ↓
Compilador Java
    ↓
Bytecode (.class)
    ↓
JVM
    ↓
Sistema Operacional
```

A JVM funciona como uma camada intermediária entre o programa Java e o sistema operacional.

Por isso, em vez de o código Java precisar ser diretamente compreendido pelo Windows, Linux ou macOS, ele é executado pela JVM correspondente àquele sistema.

Uma forma simples de imaginar isso:

> **Java é como um idioma e a JVM funciona como um intérprete.**
>
> O programa é escrito em Java e transformado em uma forma intermediária chamada **bytecode**. A JVM de cada sistema consegue interpretar/executar esse bytecode naquele ambiente.

O material da aula representa justamente essa relação:

```text
Aplicação Java
      ↓
     JVM
      ↓
Sistema Operacional
```

### ⚠️ Importante

WORA não significa que **qualquer programa Java funciona automaticamente em qualquer dispositivo sem nenhuma condição**.

É necessário que exista uma implementação adequada da plataforma Java para aquele ambiente e que o programa não dependa de recursos específicos de um determinado sistema operacional.

---

# 3. Quem usa Java?

O Java é utilizado em diferentes áreas.

## 3.1 Back-end

Java é bastante utilizado no desenvolvimento de sistemas de **back-end**, principalmente em aplicações corporativas e aplicações Web.

### O que é back-end?

Em uma aplicação, podemos separar de maneira simplificada:

```text
Front-end → parte com a qual o usuário interage

Back-end → parte responsável pela lógica e processamento
```

Por exemplo, em uma loja virtual:

* o **front-end** apresenta produtos e botões;
* o **back-end** processa pedidos;
* consulta o banco de dados;
* verifica pagamentos;
* controla usuários;
* executa regras de negócio.

Java é muito utilizado nessa parte de processamento.

---

## 3.2 Android

Java também foi utilizado no desenvolvimento de aplicações nativas para o sistema Android.

Hoje o ecossistema Android também utiliza fortemente **Kotlin**, mas Java continua sendo importante, principalmente por causa da enorme quantidade de código e bibliotecas existentes no ecossistema.

---

## 3.3 Sistemas Desktop

Java também pode ser utilizado para desenvolver aplicações que são executadas diretamente no computador.

Um exemplo apresentado no material é o programa de declaração de imposto de renda.

---

## 3.4 Games

Java também pode ser utilizado no desenvolvimento de jogos.

Um exemplo conhecido apresentado na aula é:

**Minecraft**

O jogo possui uma edição originalmente desenvolvida em Java.

---

## 3.5 Outros usos

Java também pode aparecer em:

* Smartcards;
* sistemas embarcados;
* dispositivos eletrônicos;
* sistemas de som;
* robótica;
* outros tipos de sistemas.

Isso está relacionado justamente à ideia de portabilidade do Java.

---

# 4. Por onde começar com Java?

Para começar a desenvolver em Java, existem duas coisas importantes:

1. **JDK**
2. **IDE**

---

## 4.1 JDK — Java Development Kit

**JDK** significa:

> **Java Development Kit — Kit de Desenvolvimento Java**

É o conjunto de ferramentas necessário para **desenvolver** programas Java.

O material da aula destaca que, para começar a desenvolver Java, é necessário instalar o JDK.

O JDK fornece ferramentas como o compilador Java.

Por exemplo:

```bash
javac Hello.java
```

O comando `javac` é utilizado para **compilar** um arquivo `.java`.

### JDK × JVM

É importante não confundir:

| Conceito  | Função                                              |
| --------- | --------------------------------------------------- |
| **JDK**   | Kit utilizado para desenvolver programas Java       |
| **JVM**   | Máquina virtual responsável por executar o bytecode |
| **javac** | Compilador Java                                     |
| **java**  | Comando utilizado para executar uma aplicação Java  |

O JDK inclui a JVM e outras ferramentas necessárias para desenvolvimento.

---

# 5. IDE

Além do JDK, podemos utilizar uma **IDE**.

**IDE** significa:

> **Integrated Development Environment — Ambiente Integrado de Desenvolvimento**

Uma IDE reúne ferramentas que facilitam o desenvolvimento de programas.

Entre seus recursos normalmente estão:

* editor de código;
* compilação;
* execução;
* depuração (**debug**);
* organização do projeto;
* gerenciamento de arquivos.

O material da aula apresenta **NetBeans** e **Eclipse** como exemplos de IDEs.

Neste curso, foi utilizado o **Eclipse**, mas também podemos escrever e executar Java utilizando o **Visual Studio Code**.

---

# 6. Primeiro programa Java — Hello World

Antes de começar a criar programas mais complexos, é comum criar o famoso:

```text
Hello World!
```

Esse pequeno programa serve para testar se o ambiente está configurado corretamente e também para conhecer a estrutura básica de uma aplicação Java.

---

## 6.1 Criando o arquivo no VS Code

Primeiro, criei uma pasta para o projeto e abri essa pasta no VS Code.

Depois criei um arquivo chamado:

```text
Hello.java
```

A extensão `.java` indica que o arquivo contém código-fonte Java.

O código fica:

```java
/**
 * Hello World!
 * @author Bruss Loza
 */

public class Hello {

    public static void main(String[] args) {
        System.out.println("Hello World!");
    }

}
```

---

# 7. Desmontando o código

Agora vou entender cada parte.

## Comentário

```java
/**
 * Hello World!
 * @author Bruss Loza
 */
```

Esse trecho é um **comentário**.

Comentários são ignorados pelo compilador e servem para colocar informações para quem está lendo o código.

O formato:

```java
/**
 *
 */
```

é conhecido como **comentário de documentação**, utilizado pelo Java para documentação de código.

O `@author` pode ser utilizado para indicar o autor.

---

## Classe

```java
public class Hello {
```

Aqui estamos declarando uma classe chamada `Hello`.

### `public`

Indica que a classe possui acesso público.

### `class`

É a palavra-chave utilizada para declarar uma classe.

### `Hello`

É o nome da classe.

Como o arquivo foi chamado:

```text
Hello.java
```

e a classe pública é:

```java
public class Hello
```

os nomes precisam estar de acordo.

> **Regra importante:** quando existe uma classe `public`, o nome do arquivo deve corresponder ao nome dessa classe.

---

# 8. O método `main`

Dentro da classe temos:

```java
public static void main(String[] args) {
```

Esse é o ponto de entrada tradicional de uma aplicação Java.

Quando executamos uma classe Java como aplicação, a execução começa pelo método `main`.

Vamos separar:

```text
public
static
void
main
(String[] args)
```

### `public`

Permite que a JVM tenha acesso ao método.

### `static`

Significa que o método pertence à classe e pode ser chamado sem precisar criar um objeto dessa classe.

### `void`

Indica que o método não retorna um valor.

### `main`

É o nome especial utilizado como ponto de entrada da aplicação.

### `String[] args`

É um parâmetro que permite receber argumentos passados para o programa pela linha de comando.

Neste momento, não preciso utilizá-lo diretamente para entender o primeiro programa.

---

# 9. Exibindo uma mensagem

Dentro do `main`:

```java
System.out.println("Hello World!");
```

Essa instrução exibe uma mensagem no console.

Podemos separar:

```text
System
   ↓
out
   ↓
println()
```

### `System`

É uma classe da biblioteca padrão do Java que fornece recursos relacionados ao sistema.

### `out`

Representa a saída padrão do programa.

### `println()`

É um método utilizado para imprimir algo e depois pular para a próxima linha.

Então:

```java
System.out.println("Hello World!");
```

produz:

```text
Hello World!
```

---

# 10. Executando Java pelo terminal

Agora vou entender o que acontece quando executo o programa sem uma IDE.

## 10.1 Abrir o terminal

No VS Code, posso utilizar:

```text
Ctrl + J
```

para abrir o terminal integrado.

---

## 10.2 Verificar os arquivos

No Windows, posso utilizar:

```bash
dir
```

O comando `dir` lista os arquivos e pastas do diretório atual.

Nesse momento, devo encontrar:

```text
Hello.java
```

---

## 10.3 Compilar o programa

Agora:

```bash
javac Hello.java
```

O `javac` é o compilador Java.

Ele pega:

```text
Hello.java
```

e transforma o código-fonte em **bytecode**.

Como resultado, será criado:

```text
Hello.class
```

Portanto:

```text
Hello.java
      ↓
    javac
      ↓
Hello.class
```

### O que é `.class`?

O arquivo `.class` contém o **bytecode** da aplicação.

Ele não é simplesmente o código Java original.

É uma representação intermediária que será executada pela JVM.

---

## 10.4 Verificar novamente

Executando:

```bash
dir
```

agora podemos encontrar:

```text
Hello.java
Hello.class
```

---

## 10.5 Executar o programa

Agora utilizamos:

```bash
java Hello
```

E o resultado será:

```text
Hello World!
```

Perceba que não colocamos:

```bash
java Hello.class
```

Usamos:

```bash
java Hello
```

A ideia é que o comando `java` execute a classe indicada.

---

# 11. Fluxo completo de execução

O processo completo pode ser visualizado assim:

```text
Hello.java
   │
   │ javac Hello.java
   ↓
Hello.class
   │
   │ JVM
   ↓
Programa executado
   │
   ↓
Hello World!
```

Essa sequência ajuda a entender o papel do compilador e da JVM.

---

# 12. Criando um projeto no Eclipse

Agora vou utilizar o Eclipse, que é uma IDE para desenvolvimento Java.

Quando o Eclipse for aberto pela primeira vez, pode aparecer a tela de **Welcome**.

Depois posso fechá-la.

---

## 12.1 Abrir a perspectiva Java

No Eclipse:

```text
Window
→ Open Perspective
→ Java
```

A perspectiva organiza a interface do Eclipse para trabalhar com Java.

---

# 13. Criando um projeto Java

Posso criar um novo projeto por:

```text
File
→ New
→ Other
→ Java Project
→ Next
```

Também posso utilizar a opção de criação de projeto disponível na tela inicial do Eclipse.

### Nome do projeto

Um exemplo:

```text
Aula de Java
```

Durante a criação, posso desmarcar:

```text
Create module-info.java file
```

e depois finalizar o projeto.

### O que é `module-info.java`?

Esse arquivo está relacionado ao sistema de **módulos do Java**, introduzido no Java 9.

Para os primeiros exercícios do curso, ele não é necessário. Por isso, podemos criar o projeto sem esse arquivo para manter a estrutura mais simples.

---

# 14. Criando um Package

Dentro do projeto existe a pasta:

```text
src
```

`src` vem de **source** e normalmente é utilizada para armazenar os arquivos de código-fonte.

Clicando com o botão direito em `src`:

```text
New
→ Package
```

Podemos criar:

```text
CursoJava
```

> **Atenção:** o nome correto utilizado nas anotações deve ser `CursoJava`. Não `CursoJaca`.

---

# 15. Criando uma classe no Eclipse

Dentro do package:

```text
CursoJava
```

podemos clicar com o botão direito:

```text
New
→ Class
```

Nome:

```text
Hello
```

Podemos marcar a opção:

```text
public static void main(String[] args)
```

Isso faz o Eclipse gerar automaticamente o método `main`.

Também podemos utilizar:

```text
Generate comments
```

O Eclipse criará uma estrutura inicial para a classe.

Podemos simplificá-la para:

```java
package CursoJava;

/**
 * @author Bruss
 * Hello World!
 */
public class Hello {

    public static void main(String[] args) {
        System.out.println("Hello World!");
    }

}
```

---

# 16. Executando pelo Eclipse

Para executar o programa, podemos clicar no botão:

▶️ **Run**

O Eclipse compila e executa o programa, mostrando o resultado no console.

Nesse caso:

```text
Hello World!
```

A IDE facilita o processo porque não precisamos digitar manualmente todos os comandos de compilação e execução.

---

# 17. Fundamentos do Java

Depois de conhecer a estrutura básica, começo os fundamentos da linguagem.

Entre eles estão:

* variáveis;
* tipos de dados;
* operadores;
* estruturas de controle;
* métodos;
* classes;
* objetos;
* entre outros.

O material da aula inicia pelos conceitos de **variáveis** e **tipos de dados**.

---

# 18. Variáveis

Uma **variável** é um espaço utilizado pelo programa para armazenar um valor na memória.

Por exemplo:

```java
String nome = "Bruss";
```

Podemos imaginar uma variável como uma **caixa com uma etiqueta**.

```text
┌─────────────────┐
│ nome            │ ← etiqueta
│ "Bruss"         │ ← valor
└─────────────────┘
```

A variável possui:

1. um nome;
2. um tipo;
3. um valor.

Os valores armazenados podem mudar durante a execução do programa.

Por exemplo:

```java
int idade = 19;
```

Posteriormente:

```java
idade = 20;
```

A variável `idade` continua existindo, mas seu valor foi alterado.

O material define justamente as variáveis como elementos utilizados para armazenar dados na memória, que podem ser alterados ao longo do tempo.

---

# 19. Tipos de dados

Java é uma linguagem de **tipagem estática**.

Isso significa que as variáveis possuem um tipo definido.

Por exemplo:

```java
int idade = 19;
```

Aqui:

```text
int → tipo
idade → nome da variável
19 → valor
```

Outro exemplo:

```java
String nome = "Bruss";
```

Aqui:

```text
String → tipo
nome → nome da variável
"Bruss" → valor
```

---

# 20. Principais tipos de dados

O material apresenta os tipos primitivos e alguns tipos não primitivos.

## 20.1 Tipos primitivos

| Grupo     | Tipo      | Uso                                        |
| --------- | --------- | ------------------------------------------ |
| Inteiro   | `byte`    | Números inteiros pequenos                  |
| Inteiro   | `short`   | Números inteiros                           |
| Inteiro   | `int`     | Números inteiros, uso comum                |
| Inteiro   | `long`    | Números inteiros muito grandes             |
| Decimal   | `float`   | Números com casas decimais                 |
| Decimal   | `double`  | Números com casas decimais, maior precisão |
| Booleano  | `boolean` | `true` ou `false`                          |
| Caractere | `char`    | Um único caractere                         |

### `int`

É um dos tipos inteiros mais utilizados:

```java
int idade = 19;
```

### `double`

Usado para valores com casas decimais:

```java
double temperatura = 30.5;
```

### `char`

Armazena um único caractere:

```java
char sexo = 'M';
```

Observe que `char` utiliza **aspas simples**:

```java
'M'
```

Enquanto `String` utiliza aspas duplas:

```java
"Bruss"
```

### `boolean`

Armazena apenas:

```java
true
```

ou:

```java
false
```

Exemplo:

```java
boolean arCondicionado = false;
```

---

# 21. `String`

`String` representa uma sequência de caracteres.

Exemplo:

```java
String nome = "Bruss Loza";
```

Diferentemente de `int`, `double`, `char` e `boolean`, `String` **não é um tipo primitivo**. É uma classe da biblioteca Java.

O material apresenta `String` entre os tipos não primitivos.

---

# 22. Criando variáveis

Uma variável pode ser declarada e inicializada ao mesmo tempo:

```java
String nome = "Bruss Loza";
```

Podemos separar a declaração da atribuição:

```java
String nome;

nome = "Bruss Loza";
```

Nesse caso:

### 1. Declaração

```java
String nome;
```

Estou dizendo:

> Quero criar uma variável chamada `nome` que armazenará um `String`.

### 2. Atribuição

```java
nome = "Bruss Loza";
```

Agora estou colocando um valor dentro da variável.

### ⚠️ Atenção

Uma variável local precisa receber um valor antes de ser utilizada.

Isto causa erro:

```java
String nome;

System.out.println(nome);
```

Porque `nome` foi declarada, mas não foi inicializada.

---

# 23. Primeiro exemplo com variável

```java
package CursoJava;

public class Fundamentos {

    public static void main(String[] args) {

        String nome = "Bruss Loza";

        System.out.println(nome);
    }
}
```

Resultado:

```text
Bruss Loza
```

### Entendendo

```java
String nome = "Bruss Loza";
```

Cria a variável `nome` e armazena o texto `"Bruss Loza"`.

Depois:

```java
System.out.println(nome);
```

manda o valor armazenado em `nome` para o console.

---

# 24. Declarando e atribuindo separadamente

```java
String nome = "Bruss Loza";

System.out.println(nome);

String nome1;

nome1 = "Bruss Loza Carrasco";

System.out.println(nome1);
```

Resultado:

```text
Bruss Loza
Bruss Loza Carrasco
```

Isso demonstra que declaração e atribuição podem acontecer em momentos diferentes.

---

# 25. Concatenando textos e variáveis

Podemos juntar textos e valores utilizando `+`.

```java
String nome1 = "Bruss Loza Carrasco";

System.out.println("Nome: " + nome1);
```

Resultado:

```text
Nome: Bruss Loza Carrasco
```

Nesse contexto, o operador `+` realiza **concatenação** de strings.

Podemos imaginar:

```text
"Nome: " + "Bruss Loza Carrasco"
```

como:

```text
"Nome: Bruss Loza Carrasco"
```

---

# 26. Trabalhando com vários tipos

Um exemplo mais completo:

```java
package CursoJava;

public class Fundamentos {

    public static void main(String[] args) {

        String nome = "Bruss Loza";
        int idade = 19;
        char sexo = 'M';
        double temperatura = 30.5;
        boolean arCondicionado = false;

        System.out.println("Nome: " + nome);
        System.out.println("Idade: " + idade);
        System.out.println("Sexo: " + sexo);
        System.out.println("Temperatura: " + temperatura);
        System.out.println("Ar condicionado: " + arCondicionado);
    }
}
```

Resultado:

```text
Nome: Bruss Loza
Idade: 19
Sexo: M
Temperatura: 30.5
Ar condicionado: false
```

### O que cada variável representa?

| Variável         | Tipo      | Valor          |
| ---------------- | --------- | -------------- |
| `nome`           | `String`  | `"Bruss Loza"` |
| `idade`          | `int`     | `19`           |
| `sexo`           | `char`    | `'M'`          |
| `temperatura`    | `double`  | `30.5`         |
| `arCondicionado` | `boolean` | `false`        |

Esse exemplo mostra uma ideia importante:

> O tipo da variável deve ser escolhido de acordo com o tipo de informação que ela precisa armazenar.

---

# 27. Nomeando variáveis

Existem algumas regras e boas práticas para nomes de variáveis.

O material destaca que devemos:

* evitar espaços;
* evitar caracteres especiais;
* não utilizar palavras reservadas da linguagem;
* utilizar nomes que descrevam a informação armazenada.

Exemplos:

```java
String nome;
int idade;
double temperatura;
boolean ativo;
```

São nomes fáceis de entender.

Já algo como:

```java
int x;
```

pode funcionar, mas não explica claramente o que o valor representa.

### Convenção comum no Java

Para variáveis e métodos, é comum utilizar **camelCase**:

```java
nomeCompleto
idadeUsuario
valorCompra
dataNascimento
```

Começamos com letra minúscula e, quando uma nova palavra aparece, utilizamos letra maiúscula.

---

# 28. Operadores

Operadores são símbolos utilizados para realizar operações sobre valores e variáveis.

No Java existem diversos grupos, como:

* operadores aritméticos;
* operadores de atribuição;
* operadores comparativos;
* operadores lógicos.

O material apresenta esses grupos nos fundamentos da linguagem.

---

# 29. Operadores aritméticos

Os principais são:

| Operador | Operação         | Exemplo  | Resultado |
| -------- | ---------------- | -------- | --------: |
| `+`      | Soma             | `10 + 5` |      `15` |
| `-`      | Subtração        | `10 - 5` |       `5` |
| `*`      | Multiplicação    | `10 * 5` |      `50` |
| `/`      | Divisão          | `10 / 5` |       `2` |
| `%`      | Resto da divisão | `10 % 5` |       `0` |

O material também apresenta `=` como operador de atribuição.

---

# 30. Operador de atribuição `=`

O operador:

```java
=
```

atribui um valor a uma variável.

Exemplo:

```java
int idade = 19;
```

Podemos entender como:

> "Coloque o valor `19` dentro da variável `idade`."

⚠️ Não devemos confundir:

```java
=
```

com:

```java
==
```

`=` é atribuição.

`==` é comparação de igualdade.

---

# 31. Operador `%`

O operador `%` retorna o **resto da divisão inteira**.

Exemplo:

```java
10 % 3
```

A divisão de 10 por 3 possui resto 1:

```text
10 ÷ 3

3 × 3 = 9
10 - 9 = 1
```

Então:

```java
10 % 3
```

resulta em:

```text
1
```

Esse operador é muito utilizado para verificar, por exemplo, se um número é par:

```java
numero % 2 == 0
```

Se o resultado for `0`, o número é divisível por 2.

---

# 32. Operadores de atribuição composta

Podemos combinar atribuição com operações matemáticas.

Supondo:

```java
double i = 10;
```

Podemos fazer:

```java
i += 5;
```

Isso equivale a:

```java
i = i + 5;
```

Resultado:

```text
15
```

Outros operadores:

| Operador | Equivalente     |
| -------- | --------------- |
| `+=`     | `i = i + valor` |
| `-=`     | `i = i - valor` |
| `*=`     | `i = i * valor` |
| `/=`     | `i = i / valor` |

Exemplo:

```java
i += 5;
i -= 5;
i *= 5;
i /= 5;
```

O ponto importante é que esses operadores **alteram o valor da variável**.

---

# 33. Incremento e decremento

Também existem:

```java
++
--
```

### Incremento

```java
i++;
```

equivale, de forma simplificada, a:

```java
i = i + 1;
```

### Decremento

```java
i--;
```

equivale a:

```java
i = i - 1;
```

Exemplo:

```java
int i = 10;

i++;
System.out.println(i);
```

Resultado:

```text
11
```

Depois:

```java
i--;
```

faz o valor voltar para:

```text
10
```

---

# 34. Exemplo completo de operadores

```java
package CursoJava;

public class Operadores {

    public static void main(String[] args) {

        double i = 10;

        System.out.println("Operadores Aritméticos e Atribuições");
        System.out.println();
        System.out.println("Exemplos:");
        System.out.println();

        System.out.println("i = " + i);
        System.out.println(i + " + 5 | resultado = " + (i + 5));
        System.out.println(i + " - 5 | resultado = " + (i - 5));
        System.out.println(i + " * 5 | resultado = " + (i * 5));
        System.out.println(i + " / 5 | resultado = " + (i / 5));
        System.out.println(i + " % 5 | resultado = " + (i % 5));

        System.out.println("------------------------");

        i += 5;
        System.out.println("i += 5 | i = " + i);

        i -= 5;
        System.out.println("i -= 5 | i = " + i);

        i *= 5;
        System.out.println("i *= 5 | i = " + i);

        i /= 5;
        System.out.println("i /= 5 | i = " + i);

        System.out.println("------------------------");

        i++;
        System.out.println("i++ | " + i);

        i--;
        System.out.println("i-- | " + i);
    }
}
```

### ⚠️ Detalhe importante sobre esse exemplo

Nas operações aritméticas:

```java
i + 5
i - 5
i * 5
i / 5
i % 5
```

o valor de `i` **não é alterado**.

Por exemplo:

```java
i + 5
```

apenas calcula o resultado.

Já:

```java
i += 5
```

altera `i`.

Essa diferença é muito importante:

```java
i + 5
```

→ calcula.

```java
i += 5
```

→ calcula **e armazena o novo valor em `i`**.

---

# 35. Operadores comparativos

Os operadores comparativos são utilizados para comparar valores.

| Operador | Significado      |
| -------- | ---------------- |
| `>`      | Maior que        |
| `>=`     | Maior ou igual a |
| `<`      | Menor que        |
| `<=`     | Menor ou igual a |
| `==`     | Igual a          |
| `!=`     | Diferente de     |

O resultado de uma comparação é um valor booleano:

```java
true
```

ou:

```java
false
```

Por exemplo:

```java
int idade = 19;

System.out.println(idade >= 18);
```

Resultado:

```text
true
```

Porque 19 é maior ou igual a 18.

---

# 36. Operadores lógicos

Os operadores lógicos permitem combinar ou inverter condições.

Os três principais são:

```text
&& → AND
|| → OR
!  → NOT
```

O material da aula apresenta exatamente esses três operadores.

---

## 36.1 AND — `&&`

O operador `&&` significa **E**.

A condição só será verdadeira quando **todas as condições forem verdadeiras**.

| Condição 1 | Condição 2 | `&&`    |
| ---------- | ---------- | ------- |
| `false`    | `false`    | `false` |
| `false`    | `true`     | `false` |
| `true`     | `false`    | `false` |
| `true`     | `true`     | `true`  |

Exemplo:

```java
int idade = 20;
boolean possuiDocumento = true;

System.out.println(idade >= 18 && possuiDocumento);
```

As duas condições são verdadeiras:

```text
idade >= 18       → true
possuiDocumento   → true
```

Portanto:

```text
true && true → true
```

---

# 37. OR — `||`

O operador `||` significa **OU**.

Basta **uma das condições ser verdadeira** para o resultado ser verdadeiro.

| Condição 1 | Condição 2 | `||` |
|---|---|---|
| `false` | `false` | `false` |
| `false` | `true` | `true` |
| `true` | `false` | `true` |
| `true` | `true` | `true` |

Exemplo:

```java
boolean temIngresso = false;
boolean eConvidado = true;

System.out.println(temIngresso || eConvidado);
```

Temos:

```text
false || true
```

Resultado:

```text
true
```

---

# 38. NOT — `!`

O operador `!` significa **NÃO** e inverte um valor booleano.

| Entrada | `!`      | Resultado |
| ------- | -------- | --------- |
| `false` | `!false` | `true`    |
| `true`  | `!true`  | `false`   |

Exemplo:

```java
boolean ligado = true;

System.out.println(!ligado);
```

Resultado:

```text
false
```

Porque:

```text
ligado = true
!ligado = false
```

---

# 39. Diferença entre operadores

É importante não confundir:

| Operador | Função                                 |   |           |
| -------- | -------------------------------------- | - | --------- |
| `=`      | Atribui um valor                       |   |           |
| `==`     | Compara se dois valores são iguais     |   |           |
| `!=`     | Compara se dois valores são diferentes |   |           |
| `&&`     | E lógico                               |   |           |
| `        |                                        | ` | Ou lógico |
| `!`      | Negação lógica                         |   |           |
| `+`      | Soma ou concatenação                   |   |           |
| `++`     | Incrementa 1                           |   |           |

Essa distinção será muito importante quando começarmos a trabalhar com **condições**, como `if` e `else`.

---

# 40. Aprofundamento e boas práticas

## 40.1 `String` não é primitivo

É importante guardar isso desde o começo:

```java
int
double
char
boolean
```

são tipos primitivos.

Já:

```java
String
```

é uma classe.

Isso explica por que `String` possui vários métodos próprios, como:

```java
nome.length()
nome.toUpperCase()
nome.toLowerCase()
```

Esse assunto será aprofundado posteriormente.

---

## 40.2 `double` e valores financeiros

Embora `double` seja adequado para muitos cálculos com números decimais, ele não é a melhor escolha para representar valores financeiros que exigem precisão decimal exata.

Em sistemas financeiros, é comum utilizar:

```java
BigDecimal
```

Esse é um assunto complementar e mais avançado, mas é importante saber que `double` não deve ser tratado como a solução universal para dinheiro.

---

## 40.3 `var` não é a mesma coisa que `var` do JavaScript

Em JavaScript podemos encontrar:

```javascript
var nome = "Bruss";
```

No Java moderno também existe `var`, mas seu funcionamento é diferente e possui regras específicas de inferência de tipo.

Por enquanto, é melhor continuar declarando explicitamente:

```java
String nome = "Bruss";
```

Isso deixa o aprendizado dos tipos mais claro.

---

# 41. Guia Rápido de Memorização

### Estrutura básica

```java
public class Hello {

    public static void main(String[] args) {

        System.out.println("Hello World!");

    }
}
```

### Compilar

```bash
javac Hello.java
```

### Executar

```bash
java Hello
```

### Variáveis

```java
String nome = "Bruss";
int idade = 19;
double temperatura = 30.5;
char sexo = 'M';
boolean ativo = true;
```

### Operadores

```text
+   soma
-   subtração
*   multiplicação
/   divisão
%   resto
=   atribuição
+=  soma e atribui
-=  subtrai e atribui
*=  multiplica e atribui
/=  divide e atribui
++  adiciona 1
--  subtrai 1
```

### Comparação

```text
>   maior
>=  maior ou igual
<   menor
<=  menor ou igual
==  igual
!=  diferente
```

### Lógicos

```text
&&  AND / E
||  OR / OU
!   NOT / NÃO
```

---

# ⚡ Resumo Relâmpago — 10 linhas

1. **Java** é uma linguagem criada inicialmente para dispositivos e posteriormente direcionada também para a Internet.
2. **HotJava** foi um navegador criado para suportar a execução de Java.
3. **WORA** significa *Write Once, Run Anywhere*, destacando a portabilidade do Java.
4. A **JVM** executa o bytecode Java e funciona como uma camada entre a aplicação e o sistema operacional.
5. O **JDK** é o kit utilizado para desenvolver aplicações Java e inclui ferramentas como o compilador.
6. O arquivo `.java` contém o código-fonte e o `javac` pode transformá-lo em um arquivo `.class`.
7. Uma **variável** armazena um valor e possui um tipo, um nome e um valor.
8. Os principais tipos estudados incluem `int`, `double`, `char`, `boolean` e `String`.
9. Operadores aritméticos realizam cálculos, enquanto comparativos produzem `true` ou `false`.
10. `&&` significa AND, `||` significa OR e `!` significa NOT.

