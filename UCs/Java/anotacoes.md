# Encapsulamento, Métodos Avançados e Modificadores de Acesso na Prática (Projeto Agência Bancária)

---

**Visão Geral**

Nesta aula, dei um grande passo no desenvolvimento orientado a objetos aplicando conceitos em um projeto prático do mundo real: o sistema de uma **Agência Bancária**.

O projeto foi dividido em dois pacotes (`contas` e `seguros`) para testar, na prática, como o Java se comporta quando tentamos acessar atributos e métodos entre pacotes diferentes.

Principais aprendizados da aula:

1. **Comprovação Prática dos Modificadores de Acesso:** Testei o comportamento de `public`, `private`, `protected` e do nível *default* (sem modificador) entre diferentes pacotes e relações de herança.
2. **Criação e Anatomia de Métodos:** Aprendi a criar métodos operacionais para saque, depósito, transferência de valores entre objetos e relatórios com retorno de dados.
3. **Passagem de Objetos como Parâmetros:** Entendi como um objeto pode receber outro objeto como parâmetro (ex: a conta de origem transferindo dinheiro diretamente para a conta de destino).
4. **Encapsulamento Completo:** Apliquei o quarto pilar da POO fechar totalmente os atributos da classe com `private` e liberando o acesso seguro através dos métodos **Getters** e **Setters**.

---

**Entendendo o Conceito**

## O Pilar do Encapsulamento

Encapsular significa **proteger os dados internos de um objeto** contra acessos não autorizados ou alterações indevidas feitas por outras partes do sistema.

> **Analogia do Cofre Eletrônico:**

Imagine um cofre de banco. O dinheiro (`saldo`) fica trancado dentro dele (`private`). Você não pode simplesmente enfiar a mão dentro do cofre para pegar o dinheiro ou colocar notas falsas. Para interagir com o cofre, você precisa usar o painel eletrônico (`getSaldo()`, `depositar()`, `sacar()`). O painel valida a operação antes de mexer no dinheiro que está lá dentro.

```
+-------------------------------------------------------------+
|                      CLASSE CONTA                           |
|                                                             |
|   [ ATRIBUTOS PRIVADOS ]                                    |
|   - clientes: String   <--- (Protegidos/Inacessíveis)       |
|   - saldo: double      <--- (Trancados contra uso direto)   |
|                                                             |
|   [ MÉTODOS PÚBLICOS - PAINEL DE ACESSO ]                  |
|   + getClientes() / setClientes()                           |
|   + getSaldo()    / setSaldo()                              |
|   + sacar()       / depositar()                             |
|   + transferir()                                            |
+-------------------------------------------------------------+

```

---

## Interação Entre Objetos (Transferência)

Na POO, métodos podem receber **variáveis primitivas** (como `double valor`) e também **objetos inteiros** (como `Conta destino`). Isso permite que dois objetos do sistema conversem diretamente entre si.

> **Analogia do Pix:**

Quando você faz um Pix, a sua conta (`this`) executa a ação de **sacar** o valor, e em seguida chama a conta do seu amigo (`destino`) para **depositar** aquele mesmo valor.

---

## A Jornada dos Modificadores de Acesso Entre Pacotes

Durante os testes da aula, observei o comportamento dos modificadores ao tentar acessar a classe `Conta` (do pacote `contas`) a partir da classe `SeguroPessoaFisica` (do pacote `seguros`):

1. ***Default* (Sem modificador):** Funciona apenas dentro do mesmo pacote (`contas`). A classe no pacote `seguros` gera erro de compilação.
2. **`public`:** Libera o acesso para qualquer pacote, mas deixa a classe vulnerável a alterações diretas sem validação.
3. **`private`:** Bloqueia o acesso direto para **TODAS** as outras classes, inclusive do mesmo pacote. Apenas a própria classe `Conta` enxerga.
4. **`protected`:** Libera o acesso para classes do mesmo pacote e para herdeiros (`extends`) localizados em outros pacotes.

---

**Conceitos Fundamentais**

## Métodos Getters e Setters

São métodos públicos criados para permitir a leitura e a escrita controlada de atributos privados:

* **Getter (`get...`):** Método de leitura. **Retorna** o valor atual do atributo.
* **Setter (`set...`):** Método de modificação. **Recebe um parâmetro** e atualiza o valor do atributo (usando o `this`).

## Métodos sem Retorno (`void`) vs. Métodos com Retorno

* **`void`:** Significa "vazio". O método executa uma instrução (ex: imprimir no console ou alterar uma variável) e **não devolve nenhum valor** para quem o chamou.
* **Com Retorno (ex: `double`, `String`, `int`):** O método faz um cálculo ou processamento e **obrigatoriamente devolve um resultado** através da instrução `return`.

---

### Código / Exemplos Práticos

Abaixo está o código completo, estruturado e corrigido do sistema bancário após a aplicação do **Encapsulamento** e dos novos métodos.

**Arquivo 1: `Conta.java` (Pacote `contas`)**

```java
package contas;

/**
 * Classe modelo que representa uma Conta Bancária totalmente encapsulada.
 * 
 * @author Bruss Loza
 */
public class Conta {

    // Atributos Privados (Encapsulamento)
    private String clientes;
    private double saldo;

    // Construtor
    public Conta() {
        System.out.println("Agência 0123");
    }

    // --- GETTERS E SETTERS ---
    public String getClientes() {
        return clientes;
    }

    public void setClientes(String clientes) {
        this.clientes = clientes;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    // --- MÉTODOS OPERACIONAIS ---

    /**
     * Exibe o saldo formatado do cliente.
     */
    protected void exibirSaldo() {
        System.out.println("Saldo: R$ " + saldo);
    }

    /**
     * Realiza o débito de um valor no saldo da conta.
     */
    void sacar(double valor) {
        saldo -= valor;
        System.out.println("Débito: R$ " + valor);
    }

    /**
     * Realiza o crédito de um valor no saldo da conta.
     */
    void depositar(double valor) {
        saldo += valor;
        System.out.println("Crédito: R$ " + valor);
    }

    /**
     * Transfere um valor desta conta (this) para uma conta de destino.
     * 
     * @param destino Objeto da conta que receberá o valor
     * @param valor Valor a ser transferido
     */
    void transferir(Conta destino, double valor) {
        this.sacar(valor);         // Tira dinheiro da conta atual
        destino.depositar(valor);  // Coloca dinheiro na conta de destino
        System.out.println("Transferência: R$ " + valor);
    }

    /**
     * Método com retorno que calcula a soma do saldo de duas contas.
     * 
     * @return Soma total dos saldos
     */
    double soma(double cc1, double cc2) {
        double total = cc1 + cc2;
        return total; // Retorna o valor processado
    }
}

```

---

**Arquivo 2: `PessoaFisica.java` (Pacote `contas`)**

```java
package contas;

/**
 * Classe de execução para testar as operações da Conta no mesmo pacote.
 */
public class PessoaFisica {
    public static void main(String[] args) {
        
        // --- CLIENTE 1 ---
        Conta cc1 = new Conta();
        cc1.setClientes("Bruss Loza");
        cc1.setSaldo(100000);
        
        System.out.println("Cliente: " + cc1.getClientes());
        cc1.exibirSaldo();
        
        // Operação de Saque
        cc1.sacar(1000);
        cc1.exibirSaldo();

        System.out.println("\n---------------------------------");

        // --- CLIENTE 2 ---
        Conta cc2 = new Conta();
        cc2.setClientes("Sirlene Sanches");
        cc2.setSaldo(2500);
        
        System.out.println("Cliente: " + cc2.getClientes());
        cc2.exibirSaldo();
        
        // Operação de Depósito
        cc2.depositar(300);
        cc2.exibirSaldo();

        System.out.println("\n------------------------");
        System.out.println("Transferência");
        System.out.println("Cliente origem: " + cc2.getClientes());
        System.out.println("Favorecido: " + cc1.getClientes());
        
        // cc2 transfere R$ 500 para cc1
        cc2.transferir(cc1, 500);

        System.out.println("");
        System.out.println("Cliente: " + cc2.getClientes());
        cc2.exibirSaldo();
        System.out.println("Cliente: " + cc1.getClientes());
        cc1.exibirSaldo();

        System.out.println("------------------------");
        System.out.println("Relatório gerencial");
        
        // Uso de método com retorno
        Conta gerente = new Conta();
        double relatorio = gerente.soma(cc1.getSaldo(), cc2.getSaldo());
        System.out.println("Saldo total nas contas: R$ " + relatorio);
    }
}

```

---

**Arquivo 3: `SeguroPessoaFisica.java` (Pacote `seguros`)**

```java
package seguros;

import contas.Conta;

/**
 * Classe em outro pacote que herda (extends) de Conta para testar acessos.
 */
public class SeguroPessoaFisica extends Conta {
    public static void main(String[] args) {
        
        // Instanciação utilizando a própria subclasse para herdar os recursos
        SeguroPessoaFisica cc3 = new SeguroPessoaFisica();
        
        // Acesso via métodos Setters encapsulados
        cc3.setClientes("José de Assis");
        cc3.setSaldo(2000);
        
        System.out.println("Cliente: " + cc3.getClientes());
        cc3.exibirSaldo(); // Funciona por causa do 'protected' com herança!
    }
}

```

---

**Desmontando o Código**

**Desmontando o Método de Transferência (`transferir`)**

```java
void transferir(Conta destino, double valor) {
    this.sacar(valor);
    destino.depositar(valor);
    System.out.println("Transferência: R$ " + valor);
}

```

1. **`Conta destino`**: O primeiro parâmetro do método é uma **referência a outro objeto** da classe `Conta`.
2. **`this.sacar(valor);`**: A palavra `this` garante que o método `sacar()` será executado na conta de **origem** (a conta que chamou o método, ex: `cc2`).
3. **`destino.depositar(valor);`**: Chama o método `depositar()` diretamente no objeto recebido pelo parâmetro (`cc1`).
4. **Resultado:** O saldo de quem envia diminui e o saldo de quem recebe aumenta na mesma operação!

---

**Desmontando um Método com Retorno (`soma`)**

```java
double soma(double cc1, double cc2) {
    double total = cc1 + cc2;
    return total;
}

```

1. **`double` (Tipo de Retorno):** Declara que este método promete entregar um número decimal no final de sua execução.
2. **`double total = cc1 + cc2;`**: Soma as variáveis passadas via parâmetro e guarda na variável local `total`.
3. **`return total;`**: Envia o valor contido em `total` de volta para a linha onde o método foi chamado.
4. **Na chamada:** `double relatorio = gerente.soma(...)` captura esse retorno e armazena na variável `relatorio`.

---

**Desmontando Getters e Setters**

```java
public double getSaldo() {
    return saldo;
}

public void setSaldo(double saldo) {
    this.saldo = saldo;
}

```

* **`getSaldo()`**: Não recebe parâmetros, tem tipo de retorno `double` e entrega o valor do atributo privado `saldo`.
* **`setSaldo(double saldo)`**: Tem tipo `void` (não retorna nada), recebe o novo valor por parâmetro e atribui ao atributo interno `this.saldo = saldo`.

---

**Passo a Passo**

**Passo a Passo: Refatorando uma Classe para o Padrão Encapsulado**

Quando precisamos transformar um código antigo em um código profissional e seguro com encapsulamento, seguimos estes passos:

1. **Passo 1: Alterar Modificadores para `private`:**
* Mude a declaração dos atributos da classe de `String clientes;` para `private String clientes;`.


2. **Passo 2: Gerar os Métodos Getters e Setters:**
* Crie os métodos `getAtributo()` e `setAtributo(tipo valor)` para cada variável privada.
* *(Dica no Eclipse: Clicar com botão direito no código ➔ `Source` ➔ `Generate Getters and Setters...`).*


3. **Passo 3: Atualizar a Atribuição de Valores (Escrita):**
* Onde tínhamos `cc1.clientes = "Bruss";`, alteramos para `cc1.setClientes("Bruss");`.


4. **Passo 4: Atualizar a Leitura de Valores (Exibição):**
* Onde tínhamos `System.out.println(cc1.clientes);`, alteramos para `System.out.println(cc1.getClientes());`.

---

## Tabelas Comparativas

**Resumo dos Modificadores de Acesso Testados no Projeto**

| Modificador | Na Própria Classe (`Conta`) | No Mesmo Pacote (`PessoaFisica`) | Em Outro Pacote via Herança (`SeguroPessoaFisica`) | Em Outro Pacote Sem Herança |
| --- | --- | --- | --- | --- |
| **`public`** | Acessa | Acessa | Acessa | Acessa |
| **`protected`** | Acessa | Acessa | Acessa | ❌ Bloqueia |
| ***default*** | Acessa | Acessa | ❌ Bloqueia | ❌ Bloqueia |
| **`private`** | Acessa | ❌ Bloqueia | ❌ Bloqueia | ❌ Bloqueia |

---

**Métodos `void` vs. Métodos com Retorno**

| Característica | Métodos `void` | Métodos com Retorno (`double`, `String`, etc.) |
| --- | --- | --- |
| **Objetivo** | Executar uma ação ou comando sem devolver dados. | Processar uma informação e devolver o resultado. |
| **Uso da palavra `return**` | Não utiliza (ou usa apenas `return;` para sair antecipadamente). | **Obrigatório** usar `return valor;`. |
| **Exemplo de Chamada** | `cc1.exibirSaldo();` | `double total = gerente.soma(a, b);` |

---

## Erros Comuns e Cuidados

**Tentar Acessar Atributos Privados Diretamene**

Ao mudar um atributo para `private`, qualquer tentativa de acesso direto por outra classe gerará erro de compilação.

```java
// ❌ INCORRETO (Gera erro "The field Conta.saldo is not visible"):
cc1.saldo = 5000;

// ✅ CORRETO:
cc1.setSaldo(5000);

```

---

**Esquecer a Instrução `return` em Métodos Não-`void`**

Se um método declara um tipo de retorno diferente de `void`, o compilador exige que todas as rotas do código terminem com a palavra `return`.

```java
// ❌ INCORRETO (Erro de compilação: "This method must return a result of type double"):
double soma(double a, double b) {
    double total = a + b;
    // Esqueceu o return!
}

// ✅ CORRETO:
double soma(double a, double b) {
    double total = a + b;
    return total;
}

```

---

**Inverter a Ordem no `this` dentro do Setter**

Atribuir a variável na ordem invertida faz com que o atributo privado continue com o valor padrão/nulo.

```java
// ❌ INCORRETO (O atributo não é atualizado):
public void setClientes(String clientes) {
    clientes = this.clientes; 
}

// ✅ CORRETO:
public void setClientes(String clientes) {
    this.clientes = clientes; 
}

```

---

## Conteúdo Complementar e Aprofundamento

**Anatomia Completa da Linha `public static void main(String[] args)`**

Durante a aula, mencionei que os métodos possuem palavras reservadas como `main`, `static` e `void`. Vamos abrir a "caixa-preta" dessa linha histórica do Java:

* **`public`**: Modificador de acesso. Torna o método visível para a JVM conseguir iniciá-lo de fora.
* **`static`**: Indica que este método pertence à **classe** e não a um objeto específico. A JVM pode executá-lo sem precisar dar um `new` na classe.
* **`void`**: Tipo de retorno. Significa que o método executa a aplicação e não devolve nenhum resultado ao sistema operacional ao finalizar.
* **`main`**: Nome do método de entrada reconhecido mundialmente pelos compiladores Java.
* **`String[] args`**: Vetor de textos que permite receber dados via terminal na inicialização do programa.

---

**A Verdadeira Força do Encapsulamento: Validação nos Setters**

A verdadeira vantagem de não deixar o atributo `public` é que podemos impedir dados incorretos ou criminosos dentro do método `set`:

```java
// Exemplo de validação profissional dentro de um Setter:
public void setSaldo(double saldo) {
    if (saldo < 0) {
        System.out.println("ERRO: Não é permitido cadastrar saldo inicial negativo!");
    } else {
        this.saldo = saldo;
    }
}

```

Se a variável fosse `public`, qualquer um poderia fazer `cc1.saldo = -50000;` sem passar por validação alguma!

---

**Resumo Relâmpago**

1. O projeto bancário dividiu as classes nos pacotes `contas` e `seguros` para testar acessibilidade.
2. Atributos sem modificador (*default*) só podem ser acessados por classes do mesmo pacote.
3. O modificador `protected` permite o acesso entre pacotes distintos apenas se houver herança (`extends`).
4. Atributos marcados como `private` ficam ocultos para todas as outras classes do projeto.
5. Encapsulamento é o pilar que protege os atributos com `private` e libera acesso via Getters e Setters.
6. Os métodos Getters (`get...`) servem para ler e retornar o valor de um atributo privado.
7. Os métodos Setters (`set...`) servem para alterar o valor de um atributo privado com uso do `this`.
8. Métodos `void` executam tarefas sem devolver nenhum valor ao término de sua execução.
9. Métodos com tipo de retorno (`double`, `String`) exigem o uso da palavra-chave `return`.
10. Métodos podem receber outros objetos por parâmetro para realizar ações integradas (como transferências).

---

## Guia Rápido de Memorização

**Padrão de Encapsulamento em Java**

```java
public class Exemplo {
    // 1. Atributo Privado
    private String nome;

    // 2. Getter (Leitura)
    public String getNome() {
        return nome;
    }

    // 3. Setter (Escrita)
    public void setNome(String nome) {
        this.nome = nome;
    }
}

```

**Regra de Ouro dos Modificadores**

* **`private`** ➔ Somente a **própria classe**.
* ***default*** ➔ Somente o **mesmo pacote**.
* **`protected`** ➔ Mesmo pacote + **Subclasses (Herdeiras)**.
* **`public`** ➔ **Todo o sistema**.
