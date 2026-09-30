# Introdução à Programação Orientada a Objetos (POO): Abstração, Classes e Objetos em Java

---

## 1. Visão Geral

Nesta aula, iniciei a transição da Programação Estruturada para a **Programação Orientada a Objetos (POO)**.

A POO é um paradigma de programação que revolucioneu a forma como criamos softwares, pois nos permite modelar programas de forma muito mais próxima da vida real. Em vez de pensar apenas em funções e sequências de comandos isolados, passamos a estruturar o sistema em **objetos** que possuem características (dados) e comportamentos (ações).

### Os 4 Pilares da POO

Toda a base da orientação a objetos se sustenta em quatro pilares fundamentais:

1. **Abstração** (Foco da aula de hoje)


2. **Encapsulamento**

3. **Herança**

4. **Polimorfismo**


### Vantagens de utilizar a POO

* **Aproximação do Mundo Real:** Facilita a tradução de problemas do cotidiano para a lógica de código.


* **Reutilização de Código:** Evita a necessidade de reescrever a mesma lógica várias vezes.
* **Organização e Modularidade:** Cada parte do sistema tem uma responsabilidade bem definida, facilitando a manutenção e a detecção de erros.
* **Escalabilidade:** Permite criar projetos grandes e complexos com estrutura limpa e sustentável.

---

## 2. Entendendo o Conceito

### A Abstração e o Conceito de Classe vs. Objeto

A **Abstração** consiste em isolar do mundo real apenas as características e comportamentos essenciais para o nosso sistema, ignorando detalhes irrelevantes.

Para aplicar a abstração no Java, usamos duas estruturas chave:

* **Classe:** É o **modelo** (blueprint/planta baixa). Ela não é o objeto em si, mas sim a instrução de como um objeto deve ser criado.


* **Objeto:** É a **instância** (a concretização) criada a partir do modelo da classe.



```
+-----------------------------------+
|         CLASSE (Modelo)           |  <--- Define os atributos (dados) e métodos (ações)
|        public class Carro         |
+-----------------------------------+
                  |
                  |  Instanciação (operador 'new')
                  v
+-----------------------------------+      +-----------------------------------+
|        OBJETO 1 (Instância)       |      |        OBJETO 2 (Instância)       |
|    ferrari (cor: Roxo, ano: 2026) |      |    fusca (cor: Amarelo, ano: 1967) |
+-----------------------------------+      +-----------------------------------+

```

💡 **Analogia da Patente do LEGO:**
Imagine o desenho técnico ou a patente de fabricação de um bloco de LEGO. Essa planta descreve exatamente as dimensões do bloco e como os pinos se encaixam, mas você não pode brincar com a planta em si. A planta é a **Classe**. Quando a fábrica injeta plástico no molde e produz a peça física amarela ou vermelha, cada pecinha gerada é um **Objeto**.

---

## 3. Conceitos Fundamentais

### 1. Atributos (Características / Variáveis)

São as propriedades que definem o estado de um objeto. Dentro da classe, são representados por variáveis.

* Exemplo na classe `Carro`: `int ano;`, `String cor;`.



### 2. Métodos (Comportamentos / Ações)

São as funções associadas à classe que definem o que o objeto pode fazer.

* Exemplo na classe `Carro`: `ligar()`, `desligar()`, `acelerar()`.



### 3. Instanciação (`new`)

É o ato de criar um objeto real na memória RAM a partir da classe modelo. Utilizamos a palavra reservada `new`.

---

## 4. Código / Exemplos Práticos

### Exemplo 1: Criando a Classe Modelo (`Carro.java`)

```java
package aula03poo;

/**
 * Classe modelo que abstrai as características e ações de um carro.
 * 
 * @author Bruss Loza
 */
public class Carro {
    
    // Atributos (Variáveis da classe)
    int ano;
    String cor;

    // Métodos (Ações que o carro pode realizar)
    void ligar() {
        System.out.println("Engine ON..........");
    }

    void desligar() {
        System.out.println("Engine OFF.........");
    }

    void acelerar() {
        System.out.println("Vrummmmm...........");
    }
}

```

---

### Exemplo 2: Instanciando um Objeto Ferrari (`Ferrari.java`)

```java
package aula03poo;

public class Ferrari {
    public static void main(String[] args) {
        // Instanciação do objeto 'ferrari' baseado na classe Carro
        Carro ferrari = new Carro();

        // Atribuindo valores aos atributos do objeto
        ferrari.ano = 2026;
        ferrari.cor = "Roxo";

        // Exibindo os atributos
        System.out.println("Carro Ferrari");
        System.out.println("Ano: " + ferrari.ano);
        System.out.println("Cor: " + ferrari.cor);

        // Executando os métodos do objeto
        ferrari.ligar();
        ferrari.acelerar();
    }
}

```

---

### Exemplo 3: Instanciando um Objeto Fusca (`Fusca.java`)

```java
package aula03poo;

public class Fusca {
    public static void main(String[] args) {
        // Instanciação de outro objeto 'fusca' independente a partir da mesma classe Carro
        Carro fusca = new Carro();

        // Atribuindo valores específicos para este objeto
        fusca.ano = 1967;
        fusca.cor = "Amarelo";

        // Exibindo atributos e executando ações
        System.out.println("Carro Fusca");
        System.out.println("Ano: " + fusca.ano);
        System.out.println("Cor: " + fusca.cor);

        fusca.ligar();
        fusca.acelerar();
        fusca.desligar();
    }
}

```

---

### Exemplo 4: Modelando Elementos do Minecraft (`Minecraft.java` e `Steve.java`)



**Classe Modelo (`Minecraft.java`):**

```java
package aula03poo;

/**
 * Classe modelo que representa um bloco/mecanismo do jogo Minecraft.
 */
public class Minecraft {
    
    // Atributos do elemento
    int resistencia;
    String textura;

    // Ações que podem ser executadas
    void construir() {
        System.out.println("Construindo.......");
    }

    void minerar() {
        System.out.println("Minerando........");
    }

    void craftar() {
        System.out.println("Criando o item...");
    }
}

```

**Classe Principal de Execução (`Steve.java`):**

```java
package aula03poo;

public class Steve {
    public static void main(String[] args) {
        // Instanciando o objeto 'steve' a partir da classe Minecraft
        Minecraft steve = new Minecraft();

        // Definindo as propriedades
        steve.resistencia = 1000000;
        steve.textura = "Cúbica";

        System.out.println("Personagem: Steve");
        System.out.println("Resistência: " + steve.resistencia);
        System.out.println("Textura: " + steve.textura);

        // Chamando as ações
        steve.construir();
        steve.minerar();
        steve.craftar();
    }
}

```

---

## 5. Desmontando o Código

Analisando a linha de criação de um objeto para entender como o Java opera na memória:

```java
Carro ferrari = new Carro();

```

1. **`Carro` (Tipo de Referência):** Informa ao Java que a variável `ferrari` será utilizada para fazer referência a um objeto criado a partir da classe `Carro`.
2. **`ferrari` (Nome do Objeto):** É a variável que guarda o endereço de memória onde o objeto real foi alocado.
3. **`=` (Atribuição):** Associa a variável ao objeto recém-criado na memória.
4. **`new` (Operador de Instanciação):** Comando crucial que solicita ao Java que reserve um espaço na memória RAM (**Heap**) para construir a nova estrutura.
5. **`Carro()` (Construtor):** Método especial que executa a inicialização do novo objeto.

Para acessar ou modificar os dados do objeto instanciado, utilizamos o **operador ponto (`.`)**:

* `ferrari.ano = 2026;` ➔ Acessa a variável de instância `ano` do objeto `ferrari` e atribui o valor 2026.
* `ferrari.ligar();` ➔ Executa o método `ligar()` pertencente exclusivamente ao objeto `ferrari`.

---

## 6. Passo a Passo

### Como Criar e Utilizar uma Estrutura Orientada a Objetos em Java

1. **Passo 1: Criar o Pacote Dedicado:**
* Crie um pacote (ex: `aula03poo`) para agrupar as classes relacionadas.




2. **Passo 2: Criar a Classe Modelo (Blueprint):**
* Crie uma classe simples **sem o método `main**` (ex: `Carro`).
* Declare os atributos (variáveis de instância).


* Escreva os métodos com as ações que essa entidade poderá realizar.




3. **Passo 3: Criar a Classe Executável:**
* Crie uma nova classe contendo a opção `public static void main(String[] args)`.


4. **Passo 4: Instanciar e Usar:**
* Crie o objeto com a sintaxe `NomeDaClasse nomeDoObjeto = new NomeDaClasse();`.


* Manipule os valores e invoque os métodos usando `nomeDoObjeto.atributo` e `nomeDoObjeto.metodo()`.



---

## 7. Tabelas Comparativas

### 1. Classe vs. Objeto

| Característica | Classe | Objeto |
| --- | --- | --- |
| **Definição** | Modelo / Planta baixa / Blueprint.

 | Instância concreta do modelo na memória.

 |
| **Existência na Memória** | Existe apenas como definição estática de código. | Ocupa espaço real alocado na memória RAM. |
| **Quantidade** | É única por arquivo/projeto. | Podem ser criados **infinitos** objetos a partir de uma só classe. |
| **Exemplo** | `Carro`<br> | `ferrari`, `fusca`<br> |

---

### 2. Atributo vs. Método

| Característica | Atributo | Método |
| --- | --- | --- |
| **Representa** | O que o objeto **é** / tem (estado/característica).

 | O que o objeto **faz** (comportamento/ação).

 |
| **Estrutura no Código** | Variável declarada dentro da classe.

 | Bloco de código com parênteses `()`.

 |
| **Sintaxe de Chamada** | `objeto.atributo = valor;` | `objeto.metodo();` |
| **Exemplo** | `cor = "Roxo";`<br> | `acelerar();`<br> |

---

## 8. Erros Comuns e Cuidados

### 1. Não Respeitar as Convenções do Java (*PascalCase* e *camelCase*)

Nomes de classes devem sempre iniciar com **letra maiúscula** usando o padrão *PascalCase*.

```java
// ❌ INCORRETO:
public class minecraft { ... }

// ✅ CORRETO:
public class Minecraft { ... }

```

---

### 2. Tentar Executar uma Classe Modelo sem o Método `main`

Se você tentar rodar a classe `Carro.java` diretamente no Eclipse, ele apresentará uma mensagem de erro informando que o método `main` não foi encontrado.

* **Cuidado:** Classes modelos **não** precisam de `main`. O `main` fica em uma classe executável à parte (como `Ferrari.java` ou `Fusca.java`).

---

### 3. Tentar Acessar Membros de uma Classe sem Instanciá-la

Variáveis e métodos de instância pertencem ao objeto, não à classe abstrata.

```java
// ❌ INCORRETO (Tentando usar direto da classe):
Carro.cor = "Vermelho"; 
Carro.acelerar();

// ✅ CORRETO (Criando o objeto com 'new' primeiro):
Carro meuCarro = new Carro();
meuCarro.cor = "Vermelho";
meuCarro.acelerar();

```

---

## 9. Correções Técnicas das Minhas Anotações

Durante a revisão do meu rascunho, apliquei as seguintes correções silenciosas:

1. **Correção de Nomenclatura da Classe `Minecraft`:** A classe no meu rascunho estava escrita em letras minúsculas (`minecraft`). Ajustei para `Minecraft` para seguir a norma padrão da linguagem Java (*PascalCase* em classes).
2. **Aglutinações de Código:** Corrigi todos os comandos e declarações que estavam sem espaçamento devido a erros de digitação (ex: `publicclassCarro` para `public class Carro`, `newCarro()` para `new Carro()`).
3. **Padronização de Pacotes:** Organizei o nome do pacote para `aula03poo` inteiramente em letras minúsculas, conforme manda a boa prática do Java.



---

## 10. Conteúdo Complementar e Aprofundamento

### Alocação de Memória no Java: A Memória *Stack* e a Memória *Heap*

Para entender a POO no nível do sistema operacional, precisamos saber como a JVM lida com as variáveis e objetos na memória RAM:

1. **Memória Stack (Pilha):** Armazena as chamadas de métodos e as variáveis locais/referências. Quando declaramos `Carro ferrari`, o ponteiro chamado `ferrari` fica salvo na memória **Stack**.
2. **Memória Heap (Monte):** É a região da memória onde os objetos reais vivem. Quando executamos `new Carro()`, a JVM aloca espaço na **Heap** para guardar todos os atributos daquele objeto específico.

```
       [ MEMÓRIA STACK ]                 [ MEMÓRIA HEAP ]
+------------------------------+     +-------------------------------+
|  ferrari (Ponteiro/Endereço) | --> | Objeto Carro                  |
+------------------------------+     |  - ano: 2026                  |
|  fusca   (Ponteiro/Endereço) | --\ |  - cor: "Roxo"                |
+------------------------------+   | +-------------------------------+
                                   | 
                                   | +-------------------------------+
                                   \-> Objeto Carro                  |
                                     |  - ano: 1967                  |
                                     |  - cor: "Amarelo"             |
                                     +-------------------------------+

```

---

## Resumo Relâmpago — 10 Linhas

1. A Programação Orientada a Objetos (POO) modela softwares baseando-se em entidades do mundo real.


2. Os quatro pilares da POO são Abstração, Encapsulamento, Herança e Polimorfismo.


3. Abstração é o pilar que modela e isola apenas as características essenciais de um objeto.


4. Uma classe funciona como o modelo ou planta baixa (*blueprint*) de uma estrutura.


5. Um objeto é uma instância real e concreta criada na memória a partir do modelo de uma classe.


6. Atributos representam as características ou dados guardados dentro de um objeto.


7. Métodos representam os comportamentos e as ações que um objeto pode executar.


8. A palavra reservada `new` é utilizada para instanciar e alocar um objeto na memória RAM.


9. O operador ponto (`.`) permite acessar e alterar atributos ou disparar métodos de um objeto.
10. Nomes de classes em Java devem obrigatoriamente seguir a convenção *PascalCase* (ex: `Minecraft`).

---

## Guia Rápido de Memorização

### Estrutura de uma Classe Modelo

```java
public class NomeDaClasse {
    // Atributos
    tipo atributo1;
    
    // Métodos
    void nomeDoMetodo() {
        // Código do método
    }
}

```

### Instanciação e Acesso a Objeto

```java
// Criar o objeto na memória
NomeDaClasse objeto = new NomeDaClasse();

// Atribuir valor
objeto.atributo1 = valor;

// Executar ação
objeto.nomeDoMetodo();

```