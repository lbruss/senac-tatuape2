# Arrays (Vetores), ArrayList e Interface Gráfica (Swing) (Indrodução do Projeto BL-PDV)

# Array (Vetor)

**O que é um Array?**

Um **Array**, também chamado de vetor, é uma estrutura de dados que permite armazenar vários valores em uma única variável, organizados por posições chamadas **índices**.

Em vez de criar uma variável para cada informação, podemos agrupar vários dados do mesmo tipo em um Array.

Exemplo sem Array:

```java
String carro1 = "Ferrari";
String carro2 = "Camaro";
String carro3 = "Fusca";
```

Exemplo utilizando Array:

```java
String[] carros = {"Ferrari", "Camaro", "Fusca"};
```

Assim, vários valores são armazenados dentro de uma única estrutura chamada `carros`.

**Características do Array**

- Armazena vários valores.
- Possui índices numéricos.
- O índice começa em `0`.
- Seu tamanho é definido na criação e não pode ser aumentado ou diminuído posteriormente.
- Os elementos armazenados possuem um tipo definido.

**Tipos de estruturas vistos na aula**

| Estrutura | Característica |
|---|---|
| Array (vetor) | Estrutura de tamanho fixo. |
| ArrayList | Estrutura de tamanho dinâmico. |
| Array multidimensional | Estrutura com mais de uma dimensão, como uma matriz. |

---

## Criando o projeto Vetor no Eclipse

Antes de começar:

1. No Eclipse, feche os projetos que estão abertos.
2. Clique com o botão direito em cada projeto.
3. Selecione `Close Project`.

Fechar projetos que não estão sendo utilizados ajuda a organizar o ambiente de trabalho.

**Criando o projeto**

1. Crie um novo `Java Project`.
2. Coloque o nome `Vetor`.
3. Crie um Package com o nome `Vetor`.
4. Dentro do Package, crie uma classe chamada `Vetor1`.
5. Escreva o código da aula.

---

**Classe Vetor1 — Trabalhando com Arrays**

### Código completo

```java
package Vetor;

public class Vetor1 {

    public static void main(String[] args) {

        String[] carros = {
            "ferrari",
            "camaro",
            "fusca",
            "combi",
            "brasilia",
            "porche"
        };

        // MOSTRA O TAMANHO DO ARRAY
        System.out.println("Tamanho do array: " + carros.length);

        // CHAMA A POSIÇÃO DESEJADA
        System.out.println("Carro: " + carros[3]);

        // MODIFICAR O ARRAY
        carros[3] = "gol";
        System.out.println("Carro: " + carros[3]);

        // MOSTRAR TODOS OS DADOS DO ARRAY
        System.out.println("");
        System.out.println("-------------------");
        System.out.println("Carros");
        System.out.println("");

        for (int i = 0; i < carros.length; i++) {
            System.out.println(carros[i]);
        }
    }
}
```

**Criando o Array**

```java
String[] carros = {
    "ferrari",
    "camaro",
    "fusca",
    "combi",
    "brasilia",
    "porche"
};
```

Vamos destrinchar:

- `String`: define o tipo dos valores que serão armazenados. Neste caso, textos.
- `[]`: indica que a variável será um Array.
- `carros`: nome da variável.
- `=`: atribui os valores à variável.
- `{}`: delimitam os elementos que fazem parte do Array.
- `,`: separa cada elemento.

O Array foi criado contendo seis carros.

**Visualizando os índices**

| Índice | Valor |
|---:|---|
| `0` | ferrari |
| `1` | camaro |
| `2` | fusca |
| `3` | combi |
| `4` | brasilia |
| `5` | porche |

O primeiro elemento está na posição `0`, e não na posição `1`.

Por isso, um Array com seis elementos possui índices de `0` até `5`.

---

**Descobrindo o tamanho do Array**

```java
System.out.println("Tamanho do array: " + carros.length);
```

O atributo `length` permite descobrir a quantidade de elementos existentes no Array.

Neste exemplo:

```java
carros.length
```

retorna `6`, porque existem seis carros armazenados.

Resultado:

```text
Tamanho do array: 6
```

## Diferença importante

No Array, utilizamos:

```java
carros.length
```

No `ArrayList`, utilizamos:

```java
contatos.size()
```

O Array utiliza o atributo `length`, enquanto o ArrayList utiliza o método `size()`.

---

**Acessando um elemento pelo índice**

```java
System.out.println("Carro: " + carros[3]);
```

Os colchetes permitem acessar um elemento específico do Array utilizando seu índice.

O índice `3` corresponde ao quarto elemento, porque a contagem começa em zero.

Portanto, o resultado será:

```text
Carro: combi
```

**Como acessar cada posição?**

```java
carros[0] // ferrari
carros[1] // camaro
carros[2] // fusca
carros[3] // combi
carros[4] // brasilia
carros[5] // porche
```

O índice permite acessar diretamente um elemento sem precisar percorrer todos os dados.

---

**Modificando um elemento do Array**

```java
carros[3] = "gol";

System.out.println("Carro: " + carros[3]);
```

O código altera o valor que está armazenado na posição `3`.

Antes:

```text
Índice 3 → combi
```

Depois:

```text
Índice 3 → gol
```

O Array continua com seis elementos. Apenas o valor de uma posição foi substituído.

Resultado:

```text
Carro: gol
```

**Atenção**

Modificar um elemento não significa adicionar um novo elemento.

O Array continua tendo o mesmo tamanho. Estamos apenas substituindo um valor já existente.

---

## Percorrendo o Array com `for`

```java
for (int i = 0; i < carros.length; i++) {
    System.out.println(carros[i]);
}
```

Esse `for` permite percorrer todas as posições do Array e imprimir os valores armazenados.

**Entendendo cada parte**

```java
int i = 0;
```

Cria a variável `i`, que será utilizada como índice, começando na posição zero.

```java
i < carros.length;
```

Define a condição para continuar repetindo.

Enquanto `i` for menor que o tamanho do Array, o laço continuará.

Como `carros.length` vale `6`, os índices válidos são de `0` a `5`.

```java
i++;
```

Incrementa o índice em uma unidade a cada repetição.

O valor de `i` passa por:

`0 → 1 → 2 → 3 → 4 → 5 → 6`

Quando chega a `6`, a condição `6 < 6` é falsa, e o laço termina.

```java
System.out.println(carros[i]);
```

Imprime o elemento correspondente à posição atual.

## Visualização das repetições

| Repetição | `i` | Elemento exibido |
|---:|---:|---|
| 1 | 0 | ferrari |
| 2 | 1 | camaro |
| 3 | 2 | fusca |
| 4 | 3 | gol |
| 5 | 4 | brasilia |
| 6 | 5 | porche |

---

**Resultado completo**

```text
Tamanho do array: 6
Carro: combi
Carro: gol

-------------------
Carros

ferrari
camaro
fusca
gol
brasilia
porche
```

O primeiro `Carro: combi` aparece antes da alteração. O segundo `Carro: gol` aparece depois da substituição.

---

# Exercício — Jogo de Carta

Agora vamos utilizar Arrays para sortear uma carta de um baralho.

### Código completo

```java
package Vetor;

public class JogoCarta {

    public static void main(String[] args) {

        String[] nipes = {
            "Ouros",
            "Copas",
            "Espadas",
            "Paus"
        };

        String[] faces = {
            "Az",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "Valete",
            "Dama",
            "Rei"
        };

        String nipe = nipes[(int) (Math.random() * 4)];

        String face = faces[(int) (Math.random() * faces.length)];

        System.out.println(face + " de " + nipe);
    }
}
```

<text color="success" weight="medium">Correção de nomenclatura:</text> na lista original estava `Valente`. O nome tradicional da carta é `Valete`, então foi corrigido no código.

**Criando os Arrays**

```java
String[] nipes = {"Ouros", "Copas", "Espadas", "Paus"};
```

Armazena os quatro naipes de um baralho.

| Índice | Nipe |
|---:|---|
| 0 | Ouros |
| 1 | Copas |
| 2 | Espadas |
| 3 | Paus |

```java
String[] faces = {
    "Az", "2", "3", "4", "5", "6", "7",
    "8", "9", "10", "Valete", "Dama", "Rei"
};
```

Armazena as treze faces possíveis.

São treze valores: o Ás, os números de 2 a 10 e as três figuras.

---

## Entendendo `Math.random()`

```java
Math.random()
```

Gera um número decimal aleatório maior ou igual a zero e menor que um.

Exemplos possíveis:

```text
0.1254
0.7231
0.9842
0.0017
```

O valor `1.0` não é incluído.

**Multiplicando por 4**

```java
Math.random() * 4
```

O resultado estará entre `0.0` e um valor menor que `4.0`.

Por exemplo:

| Número aleatório | Multiplicado por 4 |
|---:|---:|
| 0.10 | 0.40 |
| 0.30 | 1.20 |
| 0.60 | 2.40 |
| 0.90 | 3.60 |

---

**Convertendo para inteiro com `(int)`**

```java
(int) (Math.random() * 4)
```

O `(int)` realiza uma conversão de tipo, chamada **casting**, transformando o número decimal em inteiro.

Na conversão de `double` para `int`, as casas decimais são descartadas.

Exemplos:

| Valor decimal | Resultado em `int` |
|---:|---:|
| 0.40 | 0 |
| 1.20 | 1 |
| 2.40 | 2 |
| 3.60 | 3 |

Dessa forma, conseguimos gerar índices entre `0` e `3`, que são as posições válidas do Array `nipes`.

---

**Sorteando o naipe**

```java
String nipe = nipes[(int) (Math.random() * 4)];
```

Essa linha realiza três operações:

1. Gera um número aleatório.
2. Converte o resultado para inteiro.
3. Utiliza o inteiro como índice para acessar um elemento do Array `nipes`.

Exemplo:

Se o número sorteado for `2`, o programa acessará:

```java
nipes[2]
```

Resultado:

```text
Espadas
```

O valor encontrado é armazenado na variável `nipe`.

---

**Sorteando a face**

```java
String face = faces[(int) (Math.random() * faces.length)];
```

Essa linha utiliza a mesma lógica, mas em vez de multiplicar diretamente por `4`, utiliza:

```java
faces.length
```

Como o Array possui treze elementos, `faces.length` vale `13`.

O sorteio produzirá um índice entre `0` e `12`.

### Por que usar `faces.length`?

Porque o código se adapta automaticamente ao tamanho do Array.

Se adicionarmos ou removermos elementos, não precisaremos alterar manualmente o número utilizado no sorteio.

Essa é uma prática melhor do que deixar o número fixo.

---

**Exibindo a carta sorteada**

```java
System.out.println(face + " de " + nipe);
```

O operador `+` concatena os textos.

Exemplo:

```text
Rei de Copas
```

Outros resultados possíveis:

```text
Az de Ouros
10 de Espadas
Dama de Paus
Valete de Copas
```

A cada execução, a carta pode ser diferente.

**Observação importante**

Esse código sorteia uma face e um naipe de maneira independente. Portanto, ele pode gerar qualquer combinação de 52 cartas.

Porém, se fizermos vários sorteios consecutivos, uma mesma carta poderá aparecer novamente, pois o programa não controla quais cartas já foram sorteadas.

---

# ArrayList — Vetor Dinâmico

**O que é ArrayList?**

O `ArrayList` é uma estrutura de dados da linguagem Java que permite armazenar vários elementos e alterar seu tamanho dinamicamente.

Diferentemente do Array tradicional, ele pode crescer ou diminuir conforme adicionamos ou removemos elementos.

## Comparação

| Array | ArrayList |
|---|---|
| Tamanho fixo. | Tamanho dinâmico. |
| Usa `length`. | Usa `size()`. |
| Acessa elementos com `[índice]`. | Acessa elementos com `get(índice)`. |
| Modifica com `array[índice] = valor`. | Modifica com `set(índice, valor)`. |
| Não possui `add()` próprio. | Utiliza `add()` para adicionar. |
| Não possui `remove()` próprio. | Utiliza `remove()` para remover. |

O Array é útil quando sabemos previamente a quantidade de elementos ou quando ela não precisa mudar.

O ArrayList é útil quando a quantidade de elementos pode variar, como listas de contatos, produtos, alunos ou registros.

---

**Criando o projeto ArrayLista**

No Eclipse:

1. Crie uma classe chamada `ArrayLista`.
2. Utilize o Package `Vetor`.
3. Importe a biblioteca `ArrayList`.
4. Escreva o código abaixo.

### Código completo

```java
package Vetor;

import java.util.ArrayList;

public class ArrayLista {

    public static void main(String[] args) {

        ArrayList<String> contatos = new ArrayList<>();

        // ADICIONANDO DADOS
        contatos.add("Bruss Loza");
        contatos.add("11 1234-5678");
        contatos.add("bruasssloza@email.com");

        contatos.add("Sirlene Sanches");
        contatos.add("11 1234-1234");
        contatos.add("sirlenesanches@email.com");

        contatos.add("Leandro Ramos");
        contatos.add("11 8765-4321");
        contatos.add("ramos@email.com");

        // SABER O TAMANHO DO ARRAY
        System.out.println("Tamanho do array: " + contatos.size());
        System.out.println(contatos);

        // ACHAR ALGUM DADO
        System.out.println("Email -> Sirlene Sanches: (índice[5]) "
                + contatos.get(5));

        // TRAZER TODOS OS DADOS
        System.out.println("");
        System.out.println("===============================");

        for (int i = 0; i < contatos.size(); i++) {
            System.out.println(contatos.get(i));
        }
    }
}
```

---

**Importando a biblioteca**

```java
import java.util.ArrayList;
```

O `ArrayList` pertence ao pacote `java.util`.

O `import` permite utilizar a classe `ArrayList` no código sem precisar escrever seu nome completo com o pacote toda vez.

---

**Criando o ArrayList**

```java
ArrayList<String> contatos = new ArrayList<>();
```

Vamos entender:

- `ArrayList`: define a estrutura de dados que será utilizada.
- `<String>`: define que os elementos armazenados serão do tipo String.
- `contatos`: nome da variável.
- `new ArrayList<>()`: cria uma nova lista dinâmica.

O uso de `<String>` é chamado de **generics**. Ele define o tipo de elemento que a lista pode armazenar, ajudando a evitar erros de tipo.

Neste caso, a lista armazenará textos.

---

**Adicionando dados com `add()`**

```java
contatos.add("Bruss Loza");
contatos.add("11 1234-5678");
contatos.add("bruasssloza@email.com");
```

O método `add()` adiciona um elemento ao final da lista.

Cada chamada adiciona um novo elemento e aumenta a quantidade de itens da lista.

Depois de adicionar os três primeiros dados:

| Índice | Elemento |
|---:|---|
| 0 | Bruss Loza |
| 1 | 11 1234-5678 |
| 2 | bruasssloza@email.com |

Depois são adicionados os dados da Sirlene:

| Índice | Elemento |
|---:|---|
| 3 | Sirlene Sanches |
| 4 | 11 1234-1234 |
| 5 | sirlenesanches@email.com |

Depois são adicionados os dados do Leandro:

| Índice | Elemento |
|---:|---|
| 6 | Leandro Ramos |
| 7 | 11 8765-4321 |
| 8 | ramos@email.com |

No final, o ArrayList contém nove elementos.

**Importante:** neste exercício, cada contato ocupa três posições separadas. A lista não está armazenando um contato como um único objeto, mas sim nome, telefone e e-mail como elementos independentes.

---

**Descobrindo o tamanho com `size()`**

```java
System.out.println("Tamanho do array: " + contatos.size());
```

O método `size()` retorna a quantidade de elementos existentes no ArrayList.

Como foram adicionados nove elementos:

```text
Tamanho do array: 9
```

**Diferença entre `length` e `size()`**

```java
carros.length
```

Utilizado no Array.

```java
contatos.size()
```

Utilizado no ArrayList.

Não devemos confundir os dois.

---

**Exibindo o ArrayList inteiro**

```java
System.out.println(contatos);
```

Quando imprimimos um ArrayList diretamente, o Java apresenta os elementos da lista entre colchetes, separados por vírgulas.

Resultado:

```text
[Bruss Loza, 11 1234-5678, bruasssloza@email.com, Sirlene Sanches, 11 1234-1234, sirlenesanches@email.com, Leandro Ramos, 11 8765-4321, ramos@email.com]
```

Essa forma é útil para visualizar rapidamente todos os elementos, mas não é a melhor maneira de formatar os dados para o usuário.

---

**Encontrando um elemento com `get()`**

```java
contatos.get(5)
```

O método `get()` permite acessar um elemento utilizando seu índice.

No exercício, o índice `5` contém:

```text
sirlenesanches@email.com
```

Por isso:

```java
System.out.println("Email -> Sirlene Sanches: (índice[5]) "
        + contatos.get(5));
```

Resultado:

```text
Email -> Sirlene Sanches: (índice[5]) sirlenesanches@email.com
```

**Cuidado com os índices**

Se tentarmos acessar uma posição que não existe, ocorrerá um erro chamado:

```text
IndexOutOfBoundsException
```

Por exemplo, uma lista com nove elementos possui índices de `0` até `8`.

Acessar `contatos.get(9)` provocará um erro.

---

## Percorrendo o ArrayList com `for`

```java
for (int i = 0; i < contatos.size(); i++) {
    System.out.println(contatos.get(i));
}
```

O funcionamento é parecido com o `for` utilizado no Array.

A diferença é que:

- No Array, utilizamos `carros.length`.
- No ArrayList, utilizamos `contatos.size()`.
- No Array, acessamos com `carros[i]`.
- No ArrayList, acessamos com `contatos.get(i)`.

O laço começa em zero, percorre todos os índices existentes e imprime cada elemento.

Resultado:

```text
Bruss Loza
11 1234-5678
bruasssloza@email.com
Sirlene Sanches
11 1234-1234
sirlenesanches@email.com
Leandro Ramos
11 8765-4321
ramos@email.com
```

---

## Outros métodos importantes do ArrayList

**Adicionar**

```java
contatos.add("Novo contato");
```

Adiciona um elemento ao final da lista.

**Consultar**

```java
contatos.get(0);
```

Retorna o elemento que está no índice zero.

**Modificar**

```java
contatos.set(0, "Novo nome");
```

Substitui o elemento que está no índice zero.

**Remover**

```java
contatos.remove(0);
```

Remove o elemento que está no índice zero.

**Verificar quantidade**

```java
contatos.size();
```

Retorna a quantidade de elementos.

**Verificar se existe um elemento**

```java
contatos.contains("Bruss Loza");
```

Retorna `true` se o elemento estiver na lista e `false` caso contrário.

Esses métodos são fundamentais para trabalhar com listas dinâmicas em Java.

---

**Encerrando o projeto Vetor**

Depois de finalizar os exercícios:

1. Clique com o botão direito no projeto `Vetor`.
2. Selecione `Close Project`.

Agora será iniciado outro projeto, voltado para interface gráfica e futuramente integração com banco de dados.

---

# Introdução ao projeto BLPVD

Nesta etapa da aula, vamos criar um novo projeto Java chamado `blpvd`.

O objetivo inicial é criar uma janela gráfica utilizando o **Swing**, com auxílio do **WindowBuilder**, e instalar a biblioteca **FlatLaf** para personalização visual.

**Tecnologias utilizadas**

| Tecnologia | Função |
|---|---|
| Java | Linguagem utilizada para desenvolver a aplicação. |
| Swing | Biblioteca Java para criação de interfaces gráficas. |
| JFrame | Estrutura principal de uma janela gráfica. |
| WindowBuilder | Ferramenta visual para criar interfaces no Eclipse. |
| FlatLaf | Biblioteca para personalizar a aparência dos componentes Swing. |

---

## Criando o projeto BLPVD no Eclipse

**Passo 1 — Criar um Java Project**

No Eclipse:

1. Crie um novo `Java Project`.
2. Coloque o nome:

```text
blpvd
```

3. Finalize a criação do projeto.

---

**Passo 2 — Criar o Package `view`**

Dentro do projeto `blpvd`, crie um Package chamado:

```text
view
```

O nome `view` significa visualização.

É comum utilizar esse nome para organizar as classes responsáveis pelas telas e interfaces gráficas da aplicação.

---

**Criando a janela com WindowBuilder**

O WindowBuilder permite criar interfaces gráficas utilizando uma ferramenta visual, facilitando a construção de janelas e componentes.

**Passos**

1. Clique com o botão direito no Package `view`.
2. Selecione `New`.
3. Selecione `Other`.
4. Procure por `WindowBuilder`.
5. Entre em `Swing Designer`.
6. Selecione `JFrame`.
7. Clique duas vezes na opção.
8. No campo `Name`, coloque:

```text
Main
```

A classe será criada com o nome `Main`.

O Eclipse gerará uma estrutura de código para a janela.

**O que é JFrame?**

O `JFrame` é uma classe do Swing utilizada para criar uma janela principal de uma aplicação desktop.

É a estrutura que pode conter botões, campos de texto, menus, tabelas e outros componentes.

Exemplos de aplicações que podem utilizar JFrame:

- Sistema de cadastro.
- Sistema de vendas.
- Controle de estoque.
- Sistema de biblioteca.
- Aplicação de gerenciamento.

---

**Alternando entre Source e Design**

Na parte inferior do editor, haverá opções como:

- `Source`
- `Design`

**Source**

Exibe o código Java da interface.

É onde podemos visualizar e modificar a programação da janela.

**Design**

Exibe a interface gráfica visualmente.

Permite posicionar e configurar componentes sem precisar construir toda a interface manualmente por código.

O WindowBuilder trabalha com essas duas visualizações, permitindo que as alterações visuais sejam representadas no código Java.

---

# Instalando a biblioteca FlatLaf

**O que é FlatLaf?**

O FlatLaf é uma biblioteca que permite modificar a aparência dos componentes Swing, proporcionando uma interface mais moderna.

O Swing possui uma aparência padrão que pode ser modificada utilizando diferentes estilos.

O FlatLaf permite utilizar estilos visuais, como temas claros e escuros.

## Passo 1 — Baixar o arquivo

Baixe o arquivo da biblioteca:

```text
flatlaf.jar
```

Um arquivo `.jar` é um pacote utilizado no Java para reunir classes, recursos e componentes que podem ser utilizados em aplicações.

**Passo 2 — Criar a pasta `lib`**

No Eclipse:

1. Clique com o botão direito no projeto `blpvd`.
2. Selecione `New`.
3. Selecione `Folder`.
4. Coloque o nome:

```text
lib
```

5. Clique em `Finish`.

A pasta `lib` será utilizada para armazenar bibliotecas externas do projeto.

**Passo 3 — Colocar o FlatLaf na pasta**

Arraste o arquivo `flatlaf.jar` para dentro da pasta `lib`.

A estrutura ficará semelhante a:

```text
blpvd
│
├── src
│   └── view
│       └── Main.java
│
└── lib
    └── flatlaf.jar
```

**Passo 4 — Adicionar ao Build Path**

1. Clique com o botão direito no arquivo `flatlaf.jar`.
2. Selecione `Build Path`.
3. Clique em `Add to Build Path`.

O Eclipse adicionará a biblioteca ao caminho de compilação do projeto.

**O que é Build Path?**

O Build Path define quais bibliotecas e recursos o projeto Java pode utilizar durante a compilação e execução.

Quando adicionamos o FlatLaf ao Build Path, o Java passa a reconhecer suas classes, permitindo utilizá-las no código.

**Importante:** colocar um arquivo `.jar` na pasta do projeto não significa automaticamente que o Java está utilizando essa biblioteca. É necessário adicioná-la ao Build Path ou configurar o projeto de outra maneira.

---

**Configurando o tamanho da janela**

Na visualização `Design`, clique no `JFrame` principal.

Nas propriedades, configure o tamanho da janela para:

```text
Width: 800
Height: 600
```

Isso define as dimensões da janela.

Uma janela de 800 × 600 possui:

- 800 pixels de largura.
- 600 pixels de altura.

---

**Desativando o redimensionamento**

Nas propriedades do `JFrame`, procure:

```text
resizable
```

Altere o valor para:

```text
false
```

Isso impede que o usuário altere manualmente o tamanho da janela arrastando suas bordas.

**Comparação**

| Valor | Comportamento |
|---|---|
| `true` | Permite redimensionar a janela. |
| `false` | Impede redimensionar a janela. |

---

**Adicionando um ícone à janela**

Agora vamos configurar um ícone para a janela da aplicação.

**Passos**

1. Procure uma imagem com resolução de `64 × 64` pixels.
2. Clique no `JFrame` na visualização Design.
3. Nas propriedades, procure:

```text
iconImage
```

4. Clique nos três pontos (`...`).
5. Selecione a primeira opção, conforme a configuração apresentada na aula.
6. Procure e selecione a imagem.
7. Confirme clicando em `OK`.

**O que é `iconImage`?**

É a propriedade que define a imagem utilizada como ícone da janela.

O ícone pode aparecer na barra de título, na barra de tarefas ou em outros locais, dependendo do sistema operacional e da configuração da janela.

A imagem de 64 × 64 pixels é uma dimensão recomendada para o exercício, mas não é uma exigência universal do Java.

---

**Organização inicial do projeto BLPVD**

Ao final dessa etapa, a estrutura do projeto deve estar semelhante a:

```text
blpvd
│
├── src
│   └── view
│       └── Main.java
│
├── lib
│   └── flatlaf.jar
│
└── Referenced Libraries
    └── flatlaf.jar
```

A pasta `src` contém o código-fonte Java.

A pasta `view` organiza as classes relacionadas à interface.

A pasta `lib` armazena a biblioteca externa.

`Referenced Libraries` representa as bibliotecas reconhecidas e adicionadas ao projeto pelo Eclipse.

---

**O que será desenvolvido posteriormente?**

A aula está preparando o ambiente para um sistema Java com interface gráfica e conexão com banco de dados.

Até aqui, foram trabalhados:

- Arrays.
- ArrayList.
- Índices.
- Manipulação de elementos.
- Laços de repetição para percorrer estruturas.
- Sorteio de elementos com `Math.random()`.
- Criação de projetos Java no Eclipse.
- Criação de Packages e Classes.
- Introdução ao Swing.
- Criação de uma janela com JFrame.
- Utilização do WindowBuilder.
- Instalação de bibliotecas externas com `.jar`.
- Configuração de propriedades de uma janela.

Ainda não foi realizada a conexão com o banco de dados neste trecho da aula. A estrutura está sendo preparada para as próximas etapas.

---

**Resumo Relâmpago**

1. Array é uma estrutura que armazena vários valores e possui tamanho fixo.
2. Os índices de Arrays e ArrayLists começam em `0`.
3. `length` informa a quantidade de elementos de um Array.
4. `carros[3]` acessa o elemento que está no índice 3.
5. Arrays podem ter seus elementos modificados, mas não seu tamanho original.
6. ArrayList é uma estrutura dinâmica que pode crescer e diminuir.
7. `add()`, `get()`, `set()`, `remove()` e `size()` são métodos importantes do ArrayList.
8. `Math.random()` gera valores aleatórios, e o casting `(int)` converte o resultado em inteiro.
9. Swing e JFrame permitem criar interfaces gráficas, enquanto WindowBuilder facilita a construção visual.
10. FlatLaf é uma biblioteca de aparência para Swing, e deve ser adicionada ao Build Path para ser utilizada no projeto.
