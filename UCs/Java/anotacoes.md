# Construtores, Herança, Polimorfismo e Modificadores de Acesso em Java

---

**Visão Geral**

Nesta aula, avancei significativamente no estudo da **Programação Orientada a Objetos (POO)** em Java. Explorei recursos essenciais para a construção de sistemas reais e profissionais:

1. **Métodos Construtores:** Como inicializar objetos com estado padrão ou valores obrigatórios logo no momento de sua criação (`new`).
2. **Uso da palavra-chave `this`:** Como diferenciar atributos do objeto de parâmetros locais.
3. **Inclusão da biblioteca `Random`:** Uso da classe nativa `java.util.Random` para gerar dados automáticos (como números de chassi).
4. **Herança (`extends`):** O segundo pilar da POO. Permite reutilizar atributos e métodos de uma classe mãe (superclasse) em uma classe filha (subclasse).
5. **Polimorfismo (Sobrescrevida de Método):** O terceiro pilar da POO. Permite redefinir e customizar o comportamento de um método herdado para que ele funcione de forma específica na subclasse.
6. **Modificadores de Acesso (`private`, *default*, `protected`, `public`):** A base do quarto pilar (Encapsulamento), controlando quais classes podem enxergar ou alterar atributos e métodos.
7. **Estruturação do Projeto "Agência Bancária":** Início da criação de uma nova estrutura de projeto organizada em múltiplos pacotes (`contas` e `seguros`).

---

**Entendendo o Conceito**

## Construtores

O **construtor** é um bloco especial de código executado automaticamente no momento exato em que o objeto nasce (quando usamos a palavra `new`).

> **Analogia da Certidão de Nascimento:**

Quando um bebê nasce, ele precisa sair do hospital com um registro inicial (nome, data, número de registro). O construtor funciona como esse registro de fábrica do objeto: ele garante que o objeto não nascerá "vazio" ou sem configurações essenciais.

## Herança (`extends`)

Permite criar novas classes baseando-se em classes já existentes, aproveitando todo o código já escrito.

> **Analogia da Genética:**

Um filho herda a cor dos olhos e a altura dos pais (atributos), além do talento para cozinhar (métodos). Porém, o filho também pode desenvolver características próprias (novos atributos) ou aprender habilidades exclusivas (novos métodos). Na POO, a classe `Aviao` herda características de um veículo genérico (`Carro`), mas adiciona asas (`envergadura`) e a capacidade de pousar (`aterrizar`).

## Polimorfismo (Sobrescrevida / *Overriding*)

A palavra "polimorfismo" significa "muitas formas". Na prática, permite que um método herdado se comporte de maneira totalmente diferente na classe filha.

> **Analogia do Acelerar:**

Tanto um Carro quanto um Avião podem executar a ação de **acelerar**. Porém, no Carro isso significa injetar combustível para girar as rodas ("Vrummmmm..."), enquanto no Avião significa dar potência às turbinas para ganhar velocidade na pista e decolar ("_______-------"). A ação tem o mesmo nome, mas o comportamento é diferente.

## Modificadores de Acesso

Servem para definir o nível de visibilidade e proteção de cada membro (variável ou método) da classe.

> **Analogia da Casa e do Condomínio:**

* `private`: Os seus objetos pessoais dentro do seu quarto (só você acessa).
* *default* (sem modificador): A área comum do seu apartamento (visível para quem mora no mesmo pacote/casa).
* `protected`: O salão de festas do condomínio (acessível por vizinhos e por parentes/herdeiros, mesmo que morem fora).
* `public`: A calçada da rua (qualquer pessoa que passar pode ver e usar).

---

**Conceitos Fundamentais**

## Construtores em Java

* Têm **obrigatoriamente o mesmo nome exato da classe**.
* **Não possuem tipo de retorno** (nem mesmo `void`).
* Podem ser **sobrecarregados** (*Constructor Overloading*): podemos criar um construtor sem parâmetros e outro com parâmetros na mesma classe.

## A Palavra-chave `this`

Dentro de um método ou construtor, a palavra `this` faz referência ao **atributo do próprio objeto atual**. É usada para eliminar ambiguidades quando o parâmetro do construtor tem o mesmo nome do atributo da classe.

```java
this.ano = ano; // 'this.ano' é o atributo da classe; 'ano' é o parâmetro recebido

```

## A Classe `java.util.Random`

É uma classe utilitária do Java usada para gerar números aleatórios. O método `nextInt(1000)` gera um número inteiro sorteado entre `0` e `999`.

## A Palavra-chave `extends` (Herança)

Indica que uma classe é filha de outra.

* Syntax: `public class Aviao extends Carro`
* A classe `Aviao` passa a ter acesso a todos os atributos e métodos não-privados de `Carro`.

### E. Polimorfismo por Sobrescrevida (*Method Overriding*)

Ocorre quando a classe filha reescreve o corpo de um método idêntico ao da classe mãe. É altamente recomendado utilizar a anotação `@Override` acima do método sobrescrito para indicar a alteração ao compilador.

---

### Código / Exemplos Práticos

**Exemplo 1: Classe Modelo com Construtores e Random (`Carro.java`)**

```java
package aula04;

import java.util.Random;

/**
 * Classe modelo 'Carro' demonstrando o uso de Construtores e da classe Random.
 * 
 * @author Bruss Loza
 */
public class Carro {
    
    // Atributos
    int ano;
    String cor;

    /**
     * Construtor Padrão (Sem parâmetros).
     * Executado quando fazemos: new Carro();
     */
    public Carro() {
        Random gerador = new Random();
        int chassi = gerador.nextInt(1000); // Gera um número aleatório entre 0 e 999
        System.out.println("Chassi: " + chassi);
    }

    /**
     * Construtor Sobregado (Com parâmetros).
     * Executado quando fazemos: new Carro(1988, "Roxo");
     * 
     * @param ano Ano de fabricação do veículo
     * @param cor Cor do veículo
     */
    public Carro(int ano, String cor) {
        this.ano = ano; // Uso do 'this' para atribuir o parâmetro ao atributo
        this.cor = cor;
        
        Random gerador = new Random();
        int chassi = gerador.nextInt(1000);
        System.out.println("Chassi: " + chassi);
    }

    // Métodos de comportamento
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

**Exemplo 2: Instanciando com Construtor Parametrizado (`Brasilia.java`)**

```java
package aula04;

public class Brasilia {
    public static void main(String[] args) {
        // Chamada direta do construtor com parâmetros de inicialização
        Carro brasilia = new Carro(1988, "Roxo");

        System.out.println("Carro Brasília");
        System.out.println("Ano: " + brasilia.ano);
        System.out.println("Cor: " + brasilia.cor);

        // Executando métodos herdados/padrão
        brasilia.ligar();
        brasilia.acelerar();
        brasilia.desligar();
    }
}

```

---

**Exemplo 3: Herança e Polimorfismo (`Aviao.java`)**

```java
package aula04;

/**
 * Classe 'Aviao' que herda (extends) todas as características de 'Carro'.
 */
public class Aviao extends Carro {
    
    // Atributo específico de Aviao
    double envergadura;

    // Método específico de Aviao
    void aterrizar() {
        System.out.println("------_____");
    }

    /**
     * POLIMORFISMO (Sobrescrevida de Método):
     * O método acelerar() foi herdado da classe Carro, mas aqui ganha
     * um comportamento específico para aviões (decolagem).
     */
    @Override
    void acelerar() {
        System.out.println("_______-------");
    }
}

```

---

**Exemplo 4: Testando a Subclasse e o Polimorfismo (`Embraer.java`)**

```java
package aula04;

public class Embraer {
    public static void main(String[] args) {
        // Instanciação da subclasse Aviao
        Aviao embraer = new Aviao();

        // Atributos herdados da classe Carro
        embraer.ano = 2000;
        embraer.cor = "Amarelo";
        
        // Atributo próprio da classe Aviao
        embraer.envergadura = 11;

        System.out.println("Avião Embraer");
        System.out.println("Ano: " + embraer.ano);
        System.out.println("Cor: " + embraer.cor);
        System.out.println("Envergadura: " + embraer.envergadura + "m");

        // Métodos
        embraer.ligar();      // Herdado da classe Carro
        embraer.acelerar();   // Sobrescrito (Polimorfismo)! Imprime: _______-------
        embraer.aterrizar();  // Próprio da classe Aviao
        embraer.desligar();   // Herdado da classe Carro
    }
}

```

---

**Desmontando o Código**

**A. Desmontando o Construtor Parametrizado e o `this`**

```java
public Carro(int ano, String cor) {
    this.ano = ano;
    this.cor = cor;
}

```

1. **`public Carro`**: Construtor público. Tem o nome idêntico ao da classe.
2. **`(int ano, String cor)`**: Parâmetros recebidos de fora no momento da instanciação `new Carro(1988, "Roxo")`.
3. **`this.ano = ano;`**:
* **`this.ano`**: Refere-se à variável de instância (o atributo `int ano` declarado na classe).
* **`= ano`**: Atribui o valor da variável local recebida pelo parâmetro ao atributo do objeto.



---

**Desmontando a Declaração de Herança**

```java
public class Aviao extends Carro { ... }

```

1. **`public class Aviao`**: Nome da nova classe.
2. **`extends`**: Palavra reservada que estabelece o vínculo de herança.
3. **`Carro`**: A superclasse (classe mãe). Significa que `Aviao` herdará de forma automática `ano`, `cor`, `ligar()`, `desligar()` e `acelerar()`.

---

**Passo a Passo**

**Passo a Passo 1: Organizando Imports Automaticamente no Eclipse**

Quando digitamos `Random` pela primeira vez em uma classe, o Java acusa erro porque não conhece a classe utilitária de forma nativa.

1. Digite a palavra `Random gerador = new Random();`.
2. O Eclipse exibirá uma linha vermelha ondulada abaixo da palavra `Random`.
3. Pressione a combinação de teclas **`Ctrl + Shift + O`**:
* **O que acontece:** O Eclipse analisa todas as classes não reconhecidas no arquivo e adiciona automaticamente a instrução de importação no topo do arquivo: `import java.util.Random;`.
* Se houver mais de uma opção com o mesmo nome, o Eclipse abrirá uma janela para você selecionar a biblioteca oficial do Java (`java.util`).

---

**Passo a Passo 2: Criando a Estrutura do Novo Projeto "Agência Bancária"**

Para praticar Encapsulamento e Modificadores de Acesso na próxima etapa, preparei o novo projeto no Eclipse:

1. Vá em `File` ➔ `New` ➔ `Java Project`.
2. Nomeie o projeto como `AgenciaBancaria`.
3. Desmarque a caixa *Create module-info.java* e clique em **Finish**.
4. Expanda o projeto, clique com o botão direito na pasta `src` ➔ `New` ➔ `Package`.
5. Nomeie o primeiro pacote como `contas` e clique em **Finish**.
6. Clique com o botão direito na pasta `src` novamente ➔ `New` ➔ `Package`.
7. Nomeie o segundo pacote como `seguros` e clique em **Finish**.

---

## Tabelas Comparativas

**Matriz de Visibilidade dos Modificadores de Acesso em Java**

Esta é uma das tabelas mais importantes de toda a orientação a objetos em Java:

| Modificador de Acesso | Própria Classe | Classes do Mesmo Pacote | Subclasses em Outros Pacotes (Herança) | Qualquer Classe do Projeto |
| --- | --- | --- | --- | --- |
| **`private`** | Sim | ❌ Não | ❌ Não | ❌ Não |
| ***default*** *(Sem modificador)* | Sim | Sim | ❌ Não | ❌ Não |
| **`protected`** | Sim | Sim | Sim | ❌ Não |
| **`public`** | Sim | Sim | Sim | Sim |

---

## Erros Comuns e Cuidados

**Tentar Colocar Tipo de Retorno em Construtores**

Se você adicionar um tipo de retorno (como `void` ou `int`) antes do nome do construtor, o Java **não gerará erro de compilação**, mas transformará a estrutura em um **método comum**. Como resultado, o construtor não será executado no `new`!

```java
// ❌ INCORRETO (O Java interpreta isso como um método comum, NÃO como construtor):
public void Carro() {
    System.out.println("Criando carro...");
}

// ✅ CORRETO (Construtor sem tipo de retorno):
public Carro() {
    System.out.println("Criando carro...");
}

```

---

**Esquecer a Anotação `@Override` no Polimorfismo**

Se você cometer um erro de digitação ao tentar sobrescrever um método (ex: escrever `acelera()` em vez de `acelerar()`), sem o `@Override`, o Java entenderá que você está criando um **método novo** em vez de sobrescrever o método da classe mãe.

```java
// ❌ RISCO DE ERRO (Sem anotação):
void acelera() { ... } // Não sobrescreve 'acelerar()', cria um método diferente!

// ✅ SEGURO (Com anotação):
@Override
void acelerar() { ... } // O compilador avisa imediatamente se o nome estiver errado

```

---

## Conteúdo Complementar e Aprofundamento

**Herança Simples no Java (Por que não existe `extends` múltiplo?)**

Diferente de linguagens como C++, a linguagem Java **não suporta herança múltipla** de classes. Ou seja, uma subclasse só pode ter **uma única superclasse direta** na instrução `extends`.

```java
// ❌ PROIBIDO EM JAVA:
public class Aviao extends Carro, VeiculoAereo { ... }

// ✅ PERMITIDO (Cadeia de Herança Linear):
public class Veiculo { ... }
public class Carro extends Veiculo { ... }
public class Aviao extends Carro { ... }

```

**Por que essa limitação existe?**
Para evitar o famoso *"Problema do Diamante"* (*Diamond Problem*), que ocorre quando duas superclasses possuem métodos com o mesmo nome e o compilador não sabe qual deles a classe filha deve herdar. Para resolver cenários em que uma classe precisa ter múltiplos comportamentos, o Java utiliza **Interfaces** (conceito que estudaremos mais adiante).

---

**Resumo Relâmpago**

1. Construtores são métodos especiais com o mesmo nome da classe, executados na criação do objeto (`new`).
2. A sobrecarga de construtores permite instanciar objetos com ou sem parâmetros iniciais.
3. A palavra-chave `this` diferencia atributos da classe de variáveis locais/parâmetros com nomes idênticos.
4. A classe `java.util.Random` é utilizada para geração de números aleatórios em aplicações Java.
5. Herança (`extends`) permite que uma subclasse reaproveite atributos e métodos de uma superclasse.
6. Em Java, cada classe só pode herdar diretamente de uma única superclasse (Herança Simples).
7. Polimorfismo por sobrescrevida permite alterar o comportamento de um método herdado na classe filha.
8. A anotação `@Override` informa ao compilador que um método herdado está sendo redefinido.
9. Os modificadores de acesso controlam a visibilidade de membros: `private`, *default*, `protected` e `public`.
10. O atalho `Ctrl + Shift + O` no Eclipse organiza e insere as importações de bibliotecas automaticamente.

---

## Guia Rápido de Memorização

**Atalhos no Eclipse**

* **`Ctrl + Shift + O`** ➔ Importa bibliotecas ausentes e limpa imports não utilizados.
* **`Ctrl + F11`** ➔ Executa a aplicação Java ativa.

**Sintaxe de Herança e Sobrescrevida**

```java
// Classe Mãe (Superclasse)
public class Veiculo {
    void mover() { ... }
}

// Classe Filha (Subclasse)
public class Carro extends Veiculo {
    @Override
    void mover() {
        // Novo comportamento para Carro
    }
}

```

**Regra dos Modificadores de Acesso**

* **`private`:** Só a **própria classe** enxerga.
* ***default*:** Só quem está no **mesmo pacote** enxerga.
* **`protected`:** Mesmo pacote + **subclasses** de outros pacotes.
* **`public`:** **Todo o projeto** enxerga.
