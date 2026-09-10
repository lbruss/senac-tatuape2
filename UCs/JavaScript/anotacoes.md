# Vetores (Arrays)

---

**Visão Geral**

Nesta aula, aprendi a trabalhar com **Vetores**, que no JavaScript são chamados de **Arrays**. 

Até agora, eu estava acostumado a criar uma variável para guardar apenas um valor por vez:
```javascript
let cor1 = 'Verde';
let cor2 = 'Amarelo';
let cor3 = 'Azul';
let cor4 = 'Branco';

Entendi que o Array serve para resolver esse problema: ele é uma estrutura de dados que permite armazenar múltiplos valores dentro de uma única variável.
let cores = ['Verde', 'Amarelo', 'Azul', 'Branco'];

**Para que serve?**

O Array serve para organizar listas de dados (como nomes de clientes, produtos, notas de alunos ou dados vindos de um banco de dados) de forma simplificada, permitindo que a gente manipule dezenas ou centenas de informações usando um único nome de variável.

**Entendendo o Conceito**

Uma forma simples de entender um Array é imaginá-lo como uma estante numerada ou uma gaveta com vários compartimentos.
Índice:       0          1          2          3
          ┌──────────┬──────────┬──────────┬──────────┐
Array:    │  Verde   │ Amarelo  │   Azul   │  Branco  │
          └──────────┴──────────┴──────────┴──────────┘

Conceito Técnico:
Cada espaço do Array guarda um valor e possui uma posição fixa identificada por um número chamado Índice (Index).

A Regra do Índice Base Zero (Zero-based Indexing):
Em JavaScript, a contagem dos índices sempre começa em 0, e não em 1.
 * A 1ª posição da lista é o índice 0.
 * A 2ª posição da lista é o índice 1.
 * A 3ª posição da lista é o índice 2.
 * A 4ª posição da lista é o índice 3.

## Conceitos Fundamentais

A. Criando um Array
Podemos criar um vetor de duas formas:
 * Sintaxe Literal (com colchetes []): É a forma padrão e mais usada no mercado.
   let cores1 = ['Verde', 'Amarelo', 'Azul', 'Branco'];

 * Construtor new Array(): Usa a função padrão nativa da linguagem.
   let cores2 = new Array('Laranja', 'Vermelho', 'Preto', 'Cinza');

Cuidados: A forma com colchetes [] é preferida porque é mais simples, clara e evita comportamentos inesperados.

B. Acessando Elementos
Para ler um valor guardado, informamos o nome do Array e o número do índice entre colchetes:
let cores = ['Verde', 'Amarelo', 'Azul', 'Branco'];

console.log(cores[0]); // Retorna: Verde
console.log(cores[1]); // Retorna: Amarelo
console.log(cores[2]); // Retorna: Azul

C. A Propriedade length
A propriedade .length informa a quantidade total de elementos presentes no Array.
let cores = ['Verde', 'Amarelo', 'Azul', 'Branco'];
console.log(cores.length); // Retorna: 4

**Atenção para não confundir:**

 * cores.length: Informa quantos elementos existem (retorna 4).
 * cores[3]: Informa qual elemento está no índice 3 (retorna 'Branco').

D. Primeiro e Último Elemento
 * Primeiro elemento: Sempre estará no índice 0 (cores[0]).
 * Último elemento: É acessado de forma dinâmica com cores[cores.length - 1].
Por que - 1?
Se o Array tem 4 elementos (length = 4), seus índices são 0, 1, 2, 3.
Logo, 4 - 1 resulta no índice 3, que é exatamente a última posição.

E. Métodos Principais de Manipulação
 * push(): Adiciona um ou mais elementos no FINAL do Array. Modifica o vetor original.
 * unshift(): Adiciona um ou mais elementos no INÍCIO do Array. Modifica o vetor original.
 * concat(): Junta dois ou mais Arrays. Não modifica os originais; ele cria e retorna um novo Array unificado.

### Código / Exemplos Práticos

- **Exemplo 1:**

Declaração e Acesso a Posições (vetor-declaracao.html)
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de vetor</title>
</head>
<body>
    <h1>Exemplo de vetor</h1>

    <p id="teste1">Conteúdo do vetor 1: </p>
    <p id="teste2">Conteúdo do vetor 2: </p>
    <p id="teste3">Segunda posição do vetor 1: </p>
    <p id="teste4">Terceira posição do vetor 2: </p>

    <script>
        // Criando vetores
        let cores1 = ['Verde', 'Amarelo', 'Azul', 'Branco'];
        let cores2 = new Array('Laranja', 'Vermelho', 'Preto', 'Cinza');

        // Exibindo todo o conteúdo
        document.getElementById('teste1').innerHTML += cores1;
        document.getElementById('teste2').innerHTML += cores2;

        // Exibindo elementos específicos pelo índice
        document.getElementById('teste3').innerHTML += cores1[1]; // Exibe: Amarelo
        document.getElementById('teste4').innerHTML += cores2[2]; // Exibe: Preto
    </script>
</body>
</html>

- **Exemplo 2:**

Medindo Tamanho e Limites (vetor-tamanho.html)
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de vetor</title>
</head>
<body>
    <h1>Exemplo de vetor</h1>

    <p id="teste1">Quantidade de itens do vetor: </p>
    <p id="teste2">Primeiro item do vetor: </p>
    <p id="teste3">Último item do vetor: </p>

    <script>
        let cores = ['Verde', 'Amarelo', 'Azul', 'Branco'];

        // Exibe a quantidade total de elementos (4)
        document.getElementById('teste1').innerHTML += cores.length;

        // Exibe o primeiro elemento (índice 0 -> Verde)
        document.getElementById('teste2').innerHTML += cores[0];

        // Exibe o último elemento de forma dinâmica (índice 4-1 = 3 -> Branco)
        document.getElementById('teste3').innerHTML += cores[cores.length - 1];
    </script>
</body>
</html>

- **Exemplo 3:**

Percorrendo Array com for para Criar Lista HTML (vetor-loop.html)
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de vetor</title>
</head>
<body>
    <h1>Exemplo de vetor</h1>
    <p id="teste"></p>

    <script>
        let cores = ['Verde', 'Amarelo', 'Azul', 'Branco'];
        let fim = cores.length; // Guarda o tamanho total (4)
        let resultado = '<ul>'; // Inicia a marcação de lista não ordenada

        // Percorre do índice 0 até enquanto for menor que o tamanho (0, 1, 2, 3)
        for (let cont = 0; cont < fim; cont++) {
            resultado += '<li>' + cores[cont] + '</li>';
        }

        resultado += '</ul>'; // Fecha a tag da lista

        document.getElementById('teste').innerHTML = resultado;
    </script>
</body>
</html>

- **Exemplo 4:**

Unindo Arrays com concat() (vetor-concat.html)
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo de vetor</title>
</head>
<body>
    <h1>Exemplo de vetor</h1>
    <h3>Unindo conteúdo de vetores</h3>
    <p id="teste"></p>

    <script>
        let vetor1 = [1, 2, 3];
        let vetor2 = [4, 5, 6];
        let vetor3 = [7, 8, 9];

        // O método concat() gera um novo array unindo os três anteriores
        let resultado = vetor1.concat(vetor2, vetor3);

        document.getElementById('teste').innerHTML = resultado;
    </script>
</body>
</html>

- **Exemplo 5:**

Adicionando Elementos com unshift() e push() (atividade-vetor.html)
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Atividade 4 - Vetor (unshift e push)</title>
</head>
<body>
    <h1>Atividade 4 - Vetor (unshift e push)</h1>

    <p id="timesi">Times iniciais: </p>
    <p id="timec">Times no começo: </p>
    <p id="timef">Times no final: </p>

    <script>
        // 1. Array inicial com 4 times
        let vetor = ['Corinthians', 'Palmeiras', 'Grêmio', 'Vasco'];
        document.getElementById('timesi').innerHTML += vetor;

        // 2. Adiciona 2 times no INÍCIO do vetor
        vetor.unshift('Flamengo', 'Ceará');
        document.getElementById('timec').innerHTML += vetor;

        // 3. Adiciona 2 times no FINAL do vetor
        vetor.push('Fortaleza', 'Internacional');
        document.getElementById('timef').innerHTML += vetor;
    </script>
</body>
</html>

**Desmontando o Código**

A. Como funciona a busca dinâmica do último item (cores[cores.length - 1])
 * cores.length avalia o tamanho total do array e entrega o número 4.
 * A expressão vira cores[4 - 1].
 * A matemática resolve para cores[3].
 * O JavaScript busca o elemento localizado no índice 3 e retorna 'Branco'.

B. Como funciona o laço for varrendo o Array
for (let cont = 0; cont < cores.length; cont++)

 * Inicialização (let cont = 0): Começa em zero para apontar para a primeira posição do vetor.
 * Condição (cont < cores.length): Testa se o contador é menor que o tamanho (4). O laço executa para 0, 1, 2, 3. Quando cont vira 4, a condição falha (4 < 4 é falso) e o laço para, evitando buscar um índice que não existe.
 * Incremento (cont++): Avança o índice de um em um a cada volta.

## Tabelas Comparativas

Comparando Métodos de Inserção e União
| Método | Onde atua? | Modifica o Array original? | O que retorna? |
|---|---|---|---|
| push() | Adiciona no final | Sim (Mutável) | O novo tamanho (length) do Array |
| unshift() | Adiciona no início | Sim (Mutável) | O novo tamanho (length) do Array |
| concat() | Unifica múltiplos Arrays | Não (Imutável) | Um novo Array unificado |

## Erros Comuns e Cuidados

1. Confundir posição humana com índice

❌ cores[2] para pegar o segundo elemento.
✅ cores[1] é o correto, pois a contagem inicia em 0.
2. Acessar índice igual ao .length
let cores = ['Verde', 'Amarelo', 'Azul', 'Branco']; // length = 4
console.log(cores[cores.length]); // Tenta acessar cores[4]

❌ Incorreto: Retorna undefined porque o último índice é 3.
✅ Correto: cores[cores.length - 1].
3. A pegadinha do construtor new Array() com 1 número
let lista1 = [5]; // Cria um Array de 1 elemento contendo o número 5
let lista2 = new Array(5); // NÃO cria um Array com o número 5!

❌ new Array(5) cria um Array vazio com 5 posições indefinidas (empty × 5).
✅ Use sempre a sintaxe literal [].

**Correções Técnicas das Minhas Anotações**

 * Atributos e Tags HTML grudados:
   * Rascunho: <!DOCTYPEhtml> e <htmllang="pt-br">
   * Correção: Ajustado para <!DOCTYPE html> e <html lang="pt-br">. Os espaços separando os atributos são obrigatórios no HTML5.
 * Palavras reservadas e nomes colados em JS:
   * Rascunho: varcores = [...] e newArray(...)
   * Correção: Ajustado para let cores e new Array(). Sem o espaço, o motor JS interpreta como uma variável diferente.
 * Confusão entre Lista Ordenada e Não Ordenada:
   * Rascunho: O comentário dizia que <ul> iniciava uma "lista ordenada".
   * Correção: A tag <ul> representa uma Unordered List (lista não ordenada, com bolinhas). Para lista ordenada (com números 1, 2, 3), utiliza-se <ol>.
 * Erros de ortografia nos dados:
   * Rascunho: 'Corinthias'
   * Correção: Corrigido para 'Corinthians'.

## Aprofundamento e Boas Práticas

 * Declaração Moderna (let e const vs var):
   A aula utilizou var. Em JavaScript moderno (ES6+), prefere-se usar let para vetores que terão elementos alterados ou reatribuídos, e const para declarar vetores cuja referência não mudará.
 * Mutabilidade vs Imutabilidade:
   Métodos como push() e unshift() são chamados de mutáveis porque alteram a estrutura do Array existente em memória. O método concat() é imutável porque preserva os vetores originais e entrega uma estrutura inteiramente nova.

## Guia Rápido

Criação:   let lista = ['A', 'B', 'C'];

Primeiro:  lista[0]                 -> Retorna 'A'
Último:    lista[lista.length - 1]   -> Retorna 'C'
Tamanho:   lista.length             -> Retorna 3

Início:    lista.unshift('X')        -> Adiciona 'X' na FRENTE
Final:     lista.push('X')           -> Adiciona 'X' no FIM
Unir:      let nova = v1.concat(v2); -> Junta v1 e v2

**Resumo Relâmpago**

 * Array (vetor): Estrutura de dados que armazena múltiplos valores dentro de uma única variável.
 * Sintaxe Recomendada: A criação de Arrays deve ser feita preferencialmente com colchetes [].
 * Índice Base Zero: A contagem das posições do Array em JavaScript sempre começa no índice 0.
 * Acesso por Índice: Utilizamos array[0] para resgatar o primeiro elemento da lista.
 * Propriedade length: Informa a quantidade total de elementos presentes no Array.
 * Acesso ao Último Elemento: É feito dinamicamente através de array[array.length - 1].
 * Varredura com for: O laço deve iniciar em 0 e rodar enquanto o contador for < array.length.
 * Método unshift(): Adiciona elementos no início do Array, modificando a estrutura original.
 * Método push(): Adiciona elementos no final do Array, modificando a estrutura original.
 * Método concat(): Unifica dois ou mais Arrays gerando um novo vetor, mantendo os originais intactos.

