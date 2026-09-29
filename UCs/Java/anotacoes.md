# Estruturas de Controle (Condicionais e Laços de Repetição) e Exercícios Práticos em Java

---

**Visão Geral**

Nesta aula, avancei nos fundamentos do Java aprendendo a controlar o fluxo de execução dos programas através de **Estruturas Condicionais** e **Laços de Repetição (Loops)**, além de aplicar tudo isso em exercícios práticos do mundo real.

Até agora, meus códigos executavam de forma estritamente sequencial (linha após linha, de cima para baixo). Com as estruturas de controle, meus programas ganham "inteligência" para:

1. **Tomar decisões:** Executar determinados blocos de código apenas se uma condição for verdadeira (`if`, `else-if`, `else`, `switch-case`).
2. **Repetir tarefas:** Executar um mesmo bloco de código várias vezes enquanto uma condição for atendida (`for`, `while`, `do-while`), sem precisar duplicar linhas de código.

Também fiz exercícios práticos focados em lógica de programação: conversão de unidades de temperatura (Fahrenheit para Celsius), cálculo de viabilidade de combustível (Álcool vs. Gasolina) e cálculo de Índice de Massa Corporal (IMC) com formatação de saída.

---

**Entendendo o Conceito**

## Estruturas Condicionais (Decisão)

Servem para mudar o caminho que o programa vai seguir com base em testes lógicos.

> **Analogia da Estrada:**

Imagine que você está dirigindo em uma rodovia. Chegando a uma bifurcação, existe uma placa: *"Se a sua carteira for categoria B, dobre à direita; caso contrário, siga em frente"*. A estrutura condicional faz exatamente essa checagem antes de decidir qual caminho o programa deve tomar.

## Laços de Repetição (Iteração)

Servem para automatizar processos repetitivos.

> **Analogia da Corrida:**

Imagine um atleta correndo em uma pista circular. O treinador diz: *"Dê 10 voltas na pista"*. O atleta corre a primeira volta, conta 1, corre a segunda, conta 2... até chegar na 10ª volta e parar. O laço `for` funciona exatamente assim quando sabemos o número exato de repetições. Já o laço `while` seria como: *"Continue correndo enquanto você não estiver cansado"*.

---

# Conceitos Fundamentais

**Condicionais**

* **`if` (Se):** Avalia uma expressão booleana. Se for `true`, executa o bloco interno.
* **`else if` (Senão se):** Avalia uma nova condição caso o `if` anterior tenha sido `false`. Permite testar múltiplas opções em sequência.
* **`else` (Senão):** Bloco executado como "recurso final" quando nenhuma das condições anteriores for verdadeira.
* **`switch-case`:** Estrutura de escolha múltipla ideal para testar o valor exato de uma única variável (como menus de opções). Utiliza o comando `break` para interromper a execução e não invadir o caso seguinte, e o `default` para tratar opções inválidas.

**Laços de Repetição**

* **`for`:** Ideal quando sabemos previamente **quantas vezes** o bloco deve ser repetido. Possui três partes na sua declaração: `(inicialização; condição_de_parada; incremento)`.
* **`while` (Enquanto):** Testa a condição **antes** de executar o bloco. Se a condição for falsa logo de início, o bloco **nunca** é executado.
* **`do-while` (Faça... Enquanto):** Executa o bloco de código **pelo menos uma vez** e só depois testa a condição no final. É perfeito para menus interativos ou situações onde a primeira execução é obrigatória.

---

### Código / Exemplos Práticos

**Exemplo 1: Estruturas Condicionais (`Condicional.java`)**

```java
package cursojava;

public class Condicional {
    public static void main(String[] args) {
        char sexo = 'M';
        int idade = 19;

        System.out.println("Estrutura de Controle Condicional\n");

        // Exemplo 1: Uso do if simples
        System.out.println("Exemplo 1: uso do if");
        if (sexo == 'M') {
            System.out.println("Alistamento militar obrigatório!");
        }

        System.out.println("\nExemplo 2: uso do if-else");
        if (idade < 18) {
            System.out.println("Você é menor de idade!");
        } else {
            System.out.println("Você é maior de idade");
        }

        System.out.println("\nExemplo 3: uso do else-if");
        if (idade < 16) {
            System.out.println("Proibido votar!");
        } else if (idade >= 18 && idade <= 70) {
            System.out.println("Obrigatório votar!");
        } else {
            System.out.println("Voto facultativo!");
        }

        System.out.println("\nExemplo 4: uso do Switch case");
        System.out.println("1 - Cadastro de clientes");
        System.out.println("2 - Cadastro de usuários");
        System.out.println("3 - Relatórios");
        
        int opcao = 1;
        switch (opcao) {
            case 1:
                System.out.println("Clientes");
                break;
            case 2:
                System.out.println("Usuários");
                break;
            case 3:
                System.out.println("Relatórios");
                break;
            default:
                System.out.println("Opção inválida!");
                break;
        }
    }
}

```

---

**Exemplo 2: Laços de Repetição (`LacoRepeticao.java`)**

```java
package cursojava;

public class LacoRepeticao {
    public static void main(String[] args) {
        System.out.println("Estrutura de Repetição");
        
        // Uso do FOR - Decremento
        System.out.println("Uso do FOR (Contagem regressiva / Repetição)");
        for (int i = 10; i > 0; i--) {
            System.out.println("Hello, Bruss");
        }

        // Uso do FOR - Contagem progressiva
        System.out.println("\nContagem de 0 até 10");
        for (int j = 0; j <= 10; j++) {
            System.out.println(j);
        }

        // Uso do FOR Encadeado - Tabuada Completa (0 a 10)
        System.out.println("\nTabuada");
        for (int tab = 0; tab <= 10; tab++) {
            System.out.println("");
            for (int valor = 0; valor <= 10; valor++) {
                System.out.println(tab + " x " + valor + " = " + (tab * valor));
            }
        }

        // Uso do WHILE
        System.out.println("\nExemplo 2: Uso do WHILE");
        int cont = 1;
        while (cont <= 10) {
            System.out.println(cont);
            cont++; // Incremento fundamental para evitar loop infinito
        }

        // Uso do DO-WHILE
        System.out.println("\nExemplo 3: Uso do DO-WHILE");
        char novoJogo = 'n';
        do {
            System.out.println("Deseja jogar novamente [s/n]?");
            novoJogo = 'n';
        } while (novoJogo == 's');
        System.out.println("Game Over");

        System.out.println("");
        String sinal = "verde";
        do {
            System.out.println("O sinal está " + sinal);
            sinal = "vermelho";
        } while (sinal.equals("verde")); // Uso de .equals() para comparar Strings
        System.out.println("O sinal mudou. Pare!");
    }
}

```

---

**Exemplo 3: Exercícios Práticos Resolvidos (`Atividades.java`)**

```java
package aula02;

public class Atividades {
    public static void main(String[] args) {
        /*
         * ATIVIDADE 1: Conversão de Fahrenheit para Celsius
         * Fórmula: C = (5 * (F - 32)) / 9
         */
        System.out.println("Atividade 1");
        System.out.println("Conversão de Fahrenheit para Celsius\n");
        
        double f = 100.0;
        double c = (5 * (f - 32)) / 9;
        
        System.out.println("Temperatura em Fahrenheit: " + f);
        // Formatação com printf: %.2f limita a duas casas decimais e %n pula linha
        System.out.printf("Temperatura em Celsius: %.2f%n", c);

        /*
         * ATIVIDADE 2: Calculadora Flex (Álcool vs. Gasolina)
         * Regra: Álcool é vantajoso se custar até 70% (0.70) do preço da gasolina.
         */
        System.out.println("\n----------------------------------------");
        System.out.println("Atividade 2");
        System.out.println("Qual é mais vantajoso: Álcool x Gasolina\n");
        
        double alcool = 3.50;  // Preço do litro do álcool
        double gasolina = 5.80; // Preço do litro da gasolina
        
        System.out.println("Preço do Álcool: R$ " + alcool);
        System.out.println("Preço da Gasolina: R$ " + gasolina);
        
        if (alcool < 0.7 * gasolina) {
            System.out.println("Resultado: O Álcool é mais vantajoso!");
        } else {
            System.out.println("Resultado: A Gasolina é mais vantajosa!");
        }

        /*
         * ATIVIDADE 3: Cálculo e Classificação de IMC
         * Fórmula: IMC = Peso / (Altura * Altura)
         */
        System.out.println("\n----------------------------------------");
        System.out.println("Atividade 3");
        System.out.println("Calcular valor IMC\n");
        
        double peso = 75.0;
        double altura = 1.75;
        String classificacao;
        
        double imc = peso / (altura * altura);

        if (imc < 18.5) {
            classificacao = "Abaixo do peso";
        } else if (imc <= 24.9) {
            classificacao = "Peso ideal";
        } else if (imc <= 29.9) {
            classificacao = "Levemente acima do peso";
        } else if (imc <= 34.9) {
            classificacao = "Obesidade grau I";
        } else if (imc <= 39.9) {
            classificacao = "Obesidade grau II (severa)";
        } else {
            classificacao = "Obesidade grau III (mórbida)";
        }

        System.out.println("Peso: " + peso + " kg");
        System.out.println("Altura: " + altura + " m");
        System.out.printf("IMC: %.2f%n", imc);
        System.out.println("Classificação: " + classificacao);
    }
}

```

---

**Desmontando o Código**

**A. Desmontando a Tabuada com Laços Encadeados (`for` dentro de `for`)**

```java
for (int tab = 0; tab <= 10; tab++) {
    for (int valor = 0; valor <= 10; valor++) {
        System.out.println(tab + " x " + valor + " = " + (tab * valor));
    }
}

```

1. **Primeira linha (`for` externo):** Cria a variável `tab` começando em 0. Esse laço controla **qual tabuada** estamos calculando no momento (Tabuada do 0, do 1, do 2...).
2. **Segunda linha (`for` interno):** Cria a variável `valor` começando em 0. Para **CADA** rodada do laço externo, o laço interno executa **todas as suas 11 repetições** (de 0 até 10).
3. **Terceira linha (`println`):** Imprime a multiplicação do número da tabuada atual pelo valor do multiplicador.
4. **Fluxo:** `tab=0` roda `valor` de 0 a 10 ➔ Termina o interno ➔ `tab` vira 1 ➔ `valor` roda de 0 a 10 novamente... e assim sucessivamente até `tab=10`.

---

**Desmontando a Saída Formatada (`System.out.printf`)**

```java
System.out.printf("Temperatura em Celsius: %.2f%n", c);

```

1. **`System.out.printf`**: O `f` vem de *formatted* (formatado). Permite estruturar textos com marcadores de posição para variáveis.
2. **`%.2f`**: É um **especificador de formato**:
* `%`: Indica onde a variável será inserida.
* `.2`: Determina o número exato de casas decimais após a vírgula (arredondando o valor se necessário).
* `f`: Significa que o dado recebido é um número de ponto flutuante (`float` ou `double`).


3. **`%n`**: Especificador universal para quebra de linha (equivalente ao `\n`, mas garantido de funcionar em qualquer sistema operacional).
4. **`, c`**: Passa a variável `c` cujo valor preencherá o marcador `%.2f`.

---

**Passo a Passo**

### Como Estruturar uma Cadeia de Decisão Encadeada (`if / else if / else`)

Ao resolver o problema do cálculo do IMC, segui estes passos de raciocínio lógico:

1. **Entrada de Dados e Cálculo Base:**
* Armazenar peso e altura em variáveis do tipo `double`.
* Calcular o IMC primeiro: $IMC = \frac{\text{peso}}{\text{altura}^2}$.


2. **Organização da Lógica por Faixas Crescentes:**
* Começar do menor valor limite de corte (< 18.5).
* Como o `else if` só é avaliado se a condição anterior for falsa, não preciso testar se `imc >= 18.5 && imc <= 24.9`. Basta colocar `else if (imc <= 24.9)`!
* Motivo: Se o fluxo chegou no primeiro `else if`, é **garantido** que o IMC já é maior ou igual a 18.5. Isso simplifica o código e reduz erros.


3. **Fechamento Genérico com `else`:**
* O último caso (caso o IMC seja maior que 39.9) não precisa de um teste `else if (imc > 39.9)`. Usamos apenas o `else`, pois se o valor não caiu em nenhuma faixa anterior, ele só pode ser Obesidade III.



---

# Tabelas Comparativas

**Comparativo das Estruturas de Repetição em Java**

| Estrutura | Momento do Teste Condicional | Mínimo de Execuções | Quando Utilizar? |
| --- | --- | --- | --- |
| **`for`** | No início (antes de entrar no bloco) | 0 vezes | Quando você **sabe exatamente o número de repetições** prévio (ex: de 1 a 10). |
| **`while`** | No início (antes de entrar no bloco) | 0 vezes | Quando você **não sabe quantas vezes** o bloco rodará e a execução depende de uma condição. |
| **`do-while`** | No final (após executar o bloco) | **1 vez** | Quando o código precisa ser executado **obrigatoriamente ao menos uma vez** antes da checagem. |

---

**`if-else` vs. `switch-case`**

| Recurso | `if-else` | `switch-case` |
| --- | --- | --- |
| **Tipo de Avaliação** | Aceita intervalos, expressões complexas e operadores lógicos (`>`, `<`, `&&`, ` |  |
| **Tipos Suportados** | Todos os tipos (booleanos, números, textos, objetos). | Inteiros (`byte`, `short`, `int`), `char`, `String` e Enums. |
| **Readabilidade** | Pode ficar poluído se houver muitos `else if` aninhados. | Extremamente limpo e organizado para menus e seleções de opções. |

---

## Erros Comuns e Cuidados

**Esquecer o `break` no `switch-case` (Efeito Fall-Through)**

Se esquecer a palavra `break` ao final de um `case`, o Java continuará executando **todos os cases seguintes** de forma ininterrupta até encontrar um `break` ou o fim do bloco!

```java
// ❌ INCORRETO (Efeito Colateral):
switch (opcao) {
    case 1:
        System.out.println("Clientes"); // Esqueceu o break!
    case 2:
        System.out.println("Usuários"); // Essa linha TAMBÉM será executada se opcao == 1
        break;
}

// ✅ CORRETO:
switch (opcao) {
    case 1:
        System.out.println("Clientes");
        break; // Interrompe o switch imediatamente
    case 2:
        System.out.println("Usuários");
        break;
}

```

---

**Comparar Strings com o Operador `==` em vez de `.equals()`**

Em Java, usar `==` para comparar textos (`String`) compara a **referência de memória** dos objetos, e não o conteúdo do texto em si. Isso pode gerar erros difíceis de encontrar.

```java
String sinal = "verde";

// ❌ NÃO RECOMENDADO (Pode falhar dependendo de como a String foi criada na memória):
while (sinal == "verde") { ... }

// ✅ CORRETO E SEGURO (Compara o CONTEÚDO do texto):
while (sinal.equals("verde")) { ... }

```

---

**Escrever Laços Infinitos no `while`**

Esquecer de atualizar/incrementar a variável de controle dentro do corpo do `while` fará com que o teste condicional seja sempre verdadeiro, travando a aplicação ou consumindo 100% da CPU.

```java
int cont = 1;

// ❌ INCORRETO (Loop Infinito):
while (cont <= 10) {
    System.out.println(cont); // A variável 'cont' nunca muda, o loop rodará para sempre!
}

// ✅ CORRETO:
while (cont <= 10) {
    System.out.println(cont);
    cont++; // Garante que em algum momento cont será 11 e o loop encerrará
}

```

---

## Conteúdo Complementar e Aprofundamento

**Aprofundando a Formatação com `System.out.printf()`**

O uso do `printf` é essencial quando precisamos exibir valores financeiros ou medições científicas sem que o Java exiba dízimas infinitas (como `21.11111111111111` no cálculo do Celsius).

**Principais Especificadores de Formato em Java:**

* **`%s`**: Substitui por textos (`String`).
* **`%d`**: Substitui por números inteiros (`byte`, `short`, `int`, `long`).
* **`%f`**: Substitui por números decimais (`float`, `double`).
* **`%.2f`**: Substitui por número decimal formatado com **2 casas após a vírgula**.
* **`%.1f`**: Substitui por número decimal formatado com **1 casa após a vírgula**.
* **`%n`**: Insere uma quebra de linha independente do sistema operacional (Windows/Linux/Mac).

**Exemplo prático combinado:**

```java
String produto = "Caneta";
int quantidade = 5;
double preco = 2.508;

System.out.printf("Item: %s | Qtd: %d | Preço Un: R$ %.2f%n", produto, quantidade, preco);
// Saída no console: Item: Caneta | Qtd: 5 | Preço Un: R$ 2,51

```

---

**Resumo Relâmpago**

1. Estruturas de controle alteram o fluxo sequencial básico de execução de um programa.
2. A condicional `if` testa uma expressão booleana e executa um bloco se o resultado for verdadeiro.
3. O `else if` permite testar múltiplas condições em sequência e o `else` captura todos os casos restantes.
4. O `switch-case` é ideal para testar valores exatos de uma variável e exige o `break` em cada caso.
5. O laço `for` é recomendado para repetições com número de iterações previamente definido.
6. O laço `while` testa a condição no início e pode rodar 0 ou mais vezes.
7. O laço `do-while` executa o bloco obrigatoriamente 1 vez antes de testar a condição no final.
8. Sempre use `.equals()` em vez de `==` para comparar o conteúdo de variáveis do tipo `String`.
9. Um laço `while` exige a atualização interna da variável de controle para evitar loops infinitos.
10. O método `System.out.printf()` com o marcador `%.2f` arredonda e limita números decimais no console.

---

## Guia Rápido de Memorização

**Estruturas Condicionais**

```java
// Se / Senão se / Senão
if (condicao1) { ... } 
else if (condicao2) { ... } 
else { ... }

// Escolha Múltipla
switch (variavel) {
    case valor1: ... break;
    default: ... break;
}

```

**Laços de Repetição**

```java
// FOR (Início; Fim; Passo)
for (int i = 0; i < 10; i++) { ... }

// WHILE (Checa no Início)
while (condicao) { ... incremento; }

// DO-WHILE (Checa no Fim - Roda ao menos 1x)
do { ... incremento; } while (condicao);

```
