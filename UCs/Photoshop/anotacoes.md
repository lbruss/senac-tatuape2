# Desenvolvimento de Algoritmos

## Ideia Principal

Antes de escrever código, preciso entender como o computador “pensa”, como ele representa informações e como eu posso montar instruções organizadas para resolver problemas.

A ideia central é: **programar é ensinar o computador a resolver problemas por meio de passos lógicos, claros e bem definidos**.

---

**O que é Lógica de Programação?**

**Lógica de Programação** é a forma de organizar o pensamento para resolver problemas usando uma sequência de instruções.

Antes de pensar em linguagem como JavaScript, Python, Java ou C#, eu preciso pensar na lógica:

* Qual é o problema?
* Quais informações entram?
* O que precisa ser feito com essas informações?
* Qual resultado deve sair?
* Quais passos levam até esse resultado?

Programar não é apenas “decorar comandos”. Programar é aprender a **pensar de forma estruturada**.

---

> Analogia simples:
A lógica de programação é como explicar uma tarefa para alguém que não sabe nada.

Por exemplo, se eu disser:

- “Faça um café.”

Uma pessoa entende porque já sabe o contexto.
Mas um computador não entende “contexto”. Eu teria que explicar passo a passo:

1. Pegue a água.
2. Coloque a água para ferver.
3. Pegue o pó de café.
4. Coloque o filtro.
5. Passe a água quente pelo pó.
6. Coloque o café na xícara.

Ou seja, o computador precisa de instruções **claras, ordenadas e sem ambiguidade**.

---

# Desenvolvimento de Algoritmos

Um **algoritmo** é uma sequência de passos usados para resolver um problema.

A definição mais simples é:

> Algoritmo é como uma “receita de bolo”.

Assim como uma receita tem ingredientes e modo de preparo, um algoritmo também tem:

* **Entrada**: os dados que eu forneço.
* **Processamento**: o que será feito com esses dados.
* **Saída**: o resultado final.

---

- **Exemplo simples de algoritmo**

Problema: somar dois números.

```
1. Ler o primeiro número
2. Ler o segundo número
3. Somar os dois números
4. Mostrar o resultado
```

Explicando:

* Primeiro, o algoritmo precisa receber os valores.
* Depois, ele realiza a operação matemática.
* Por fim, ele apresenta o resultado para o usuário.

---

## História do Computador

Antes dos computadores modernos, o ser humano já criava ferramentas para ajudar nos cálculos.

A evolução da computação não começou diretamente com notebooks ou computadores eletrônicos. Ela passou por instrumentos manuais, máquinas mecânicas, máquinas elétricas e depois computadores eletrônicos.

---

- **Ábaco**

O **ábaco** foi uma das primeiras ferramentas usadas pelo ser humano para fazer cálculos.

Ele era formado por hastes e peças móveis, que ajudavam a representar quantidades e realizar operações matemáticas.

O ábaco não era um computador como conhecemos hoje, mas foi importante porque mostrava uma ideia fundamental da computação:

> usar uma ferramenta para representar números e facilitar cálculos.

---

- **John Napier e os Bastões de Napier**

**John Napier** criou os chamados **Bastões de Napier**.

Eles eram um conjunto de bastões usados para facilitar contas matemáticas, principalmente multiplicações e divisões.

A ideia era transformar contas difíceis em processos mais simples e organizados.

Isso é parecido com a lógica de programação, porque um problema grande pode ser dividido em partes menores.

---

- **George Boole e a lógica binária**

Em **1847**, o matemático inglês **George Boole** estabeleceu a base da chamada **lógica booleana**.

Essa lógica trabalha principalmente com dois valores:

* **Verdadeiro**
* **Falso**

Na computação, essa ideia se conecta diretamente ao sistema binário:

* `1` pode representar verdadeiro, ligado ou presença de sinal.
* `0` pode representar falso, desligado ou ausência de sinal.

A lógica booleana é muito importante para programação, porque os programas tomam decisões o tempo todo.

**Exemplo:**

```
Se a senha estiver correta, entrar no sistema.
Senão, mostrar mensagem de erro.
```

Por trás disso, o computador está avaliando se uma condição é **verdadeira** ou **falsa**.

---

- **Hermann Hollerith e o computador mecânico**

Em **1890**, **Hermann Hollerith** desenvolveu uma máquina eletromecânica usada para processar dados do censo dos Estados Unidos.

Ela utilizava cartões perfurados para armazenar e processar informações.

Esse foi um avanço importante porque mostrou que dados poderiam ser armazenados e processados de forma mais automatizada.

---

- **Konrad Zuse e os primeiros computadores elétricos**

Em **1938**, **Konrad Zuse** desenvolveu uma das primeiras máquinas computacionais eletromecânicas.

Essas máquinas já estavam mais próximas do conceito de computador, pois conseguiam executar operações de forma automática.

---

- **ENIAC**

Em **1946**, surgiu o **ENIAC**, considerado um dos primeiros computadores eletrônicos digitais de uso geral.

Ele era enorme, ocupava uma sala inteira e utilizava válvulas eletrônicas.

Mesmo sendo muito limitado em comparação com os computadores atuais, o ENIAC foi um marco porque mostrou que máquinas eletrônicas poderiam realizar cálculos em alta velocidade.

---

# Arquitetura de Von Neumann

A **Arquitetura de Von Neumann** é um modelo clássico de funcionamento dos computadores.

Ela organiza o computador em partes principais:

* **Memória**
* **Unidade de processamento**
* **Entrada**
* **Saída**
* **Controle**

A grande ideia desse modelo é que o computador armazena **dados** e **instruções** na memória.

Ou seja, o computador não guarda apenas informações, mas também os comandos que dizem o que fazer com essas informações.

---

## Modelo básico

```
Entrada → Processamento → Saída
```

Esse é o princípio fundamental da informática.

---

## Entrada, Processamento e Saída

Esse é um dos conceitos mais importantes da computação.

Todo sistema computacional funciona, de forma geral, com três etapas:

```
Entrada → Processamento → Saída
```

---

- **Entrada**

A **entrada** é tudo aquilo que o sistema recebe.

Exemplos:

* Teclado
* Mouse
* Microfone
* Câmera
* Arquivo
* Dados digitados pelo usuário

Em programação, entrada pode ser um número, um texto, uma opção escolhida ou qualquer informação fornecida ao programa.

---

- **Processamento**

O **processamento** é o momento em que o computador trabalha com os dados recebidos.

Ele pode:

* Fazer cálculos.
* Comparar informações.
* Tomar decisões.
* Organizar dados.
* Executar comandos.

Exemplo:

```
Número 1 = 10
Número 2 = 20
Processamento = 10 + 20
```

---

- **Saída**

A **saída** é o resultado final depois do processamento.

Exemplos:

* Uma mensagem na tela.
* Um arquivo gerado.
* Um resultado matemático.
* Um relatório.
* Uma imagem.
* Um som.

Exemplo:

```
Resultado = 30
```

---

**Exemplo completo**

```
Entrada:
10 e 20

Processamento:
10 + 20

Saída:
30
```

Esse modelo aparece em praticamente tudo na informática.

---

# Base Decimal

A **base decimal** é o sistema numérico que nós, humanos, usamos no dia a dia.

Ela usa 10 símbolos:

```
0, 1, 2, 3, 4, 5, 6, 7, 8, 9
```

Por isso é chamada de base 10.

Quando contamos normalmente, usamos a base decimal:

```
0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12...
```

Na base decimal, cada posição do número tem um valor baseado em potências de 10.

Exemplo:

```
235
```

Pode ser entendido assim:

```
2 centenas + 3 dezenas + 5 unidades
```

Ou seja:

```text
2 × 100 = 200
3 × 10  = 30
5 × 1   = 5
```

Resultado:

```
200 + 30 + 5 = 235
```

---

# Sistema Binário

O computador não trabalha diretamente como nós, usando a base decimal.

O computador trabalha com o **sistema binário**, que usa apenas dois símbolos:

```
0 e 1
```

Esses valores são chamados de **bits**.

---

## Bit

**Bit** é a menor unidade de informação do computador.

Um bit pode ter apenas dois valores:

```
0 ou 1
```

Esses valores podem representar estados físicos, como:

* Desligado ou ligado.
* Falso ou verdadeiro.
* Sem sinal ou com sinal.
* Baixa tensão ou alta tensão.

---

## Byte

Um **byte** é um conjunto de **8 bits**.

```
1 byte = 8 bits
```

Exemplo:

```
01010101
```

Esse conjunto tem 8 posições, então representa 1 byte.

Bytes são usados para representar dados maiores, como letras, números, imagens, arquivos e comandos.

---

# Convertendo Decimal para Binário

Para converter um número decimal para binário, eu divido o número por 2 repetidamente.

A regra é:

1. Dividir o número por 2.
2. Guardar o resto da divisão.
3. Continuar dividindo o quociente por 2.
4. Parar quando o quociente chegar em 0.
5. Ler os restos de baixo para cima.

O resto sempre será `0` ou `1`, porque o sistema binário só trabalha com esses dois valores.

---

**Exemplo: converter 20 para binário**

Vamos converter:

```
20
```

Divisões:

```
20 ÷ 2 = 10, resto 0
10 ÷ 2 = 5,  resto 0
5 ÷ 2  = 2,  resto 1
2 ÷ 2  = 1,  resto 0
1 ÷ 2  = 0,  resto 1
```

Agora eu pego os restos de baixo para cima:

```
1 0 1 0 0
```

Então:

```
20 em decimal = 10100 em binário
```

---

**Por que leio de baixo para cima?**

Porque os primeiros restos representam as posições de menor valor.

No binário, as posições são organizadas por potências de 2:

```
2⁴  2³  2²  2¹  2⁰
16   8   4   2   1
```

No número `10100`, fica assim:

```
1  0  1  0  0
16 8  4  2  1
```

Calculando:

```
1 × 16 = 16
0 × 8  = 0
1 × 4  = 4
0 × 2  = 0
0 × 1  = 0
```

Somando:

```
16 + 0 + 4 + 0 + 0 = 20
```

Por isso:

```
10100₂ = 20₁₀
```

---

# Convertendo Binário para Decimal

Também existe o processo inverso: transformar um número binário em decimal.

Para isso, eu uso as potências de 2.

---

**Exemplo: converter 10110 para decimal**

Número binário:

```
10110
```

Primeiro, alinho cada dígito com uma potência de 2:

```
1    0    1    1    0
2⁴   2³   2²   2¹   2⁰
16   8    4    2    1
```

Agora multiplico cada número binário pelo valor da posição:

```
1 × 16 = 16
0 × 8  = 0
1 × 4  = 4
1 × 2  = 2
0 × 1  = 0
```

Depois somo tudo:

```
16 + 0 + 4 + 2 + 0 = 22
```

Então:

```
10110 em binário = 22 em decimal
```

---

## Forma resumida

```
10110₂ = 22₁₀
```

O número pequeno embaixo indica a base:

* `₂` significa base 2, ou seja, binário.
* `₁₀` significa base 10, ou seja, decimal.

---

## Ordem das Operações — PEMDAS

Na matemática e na programação, existe uma ordem correta para resolver expressões.

Essa ordem é conhecida como **PEMDAS**.

```
P - Parênteses
E - Expoentes
M - Multiplicação
D - Divisão
A - Adição
S - Subtração
```

---

**O que isso significa?**

Significa que eu não resolvo uma expressão simplesmente da esquerda para a direita em qualquer situação.

Existe uma prioridade.

Exemplo:

```
2 + 3 × 4
```

Se eu somar primeiro:

```
2 + 3 = 5
5 × 4 = 20
```

Mas esse resultado está errado pela ordem das operações.

O correto é resolver a multiplicação primeiro:

```
3 × 4 = 12
2 + 12 = 14
```

Então:

```
2 + 3 × 4 = 14
```

---

**Com parênteses**

Agora veja:

```
(2 + 3) × 4
```

Aqui os parênteses têm prioridade.

Então:

```
2 + 3 = 5
5 × 4 = 20
```

Resultado:

```
(2 + 3) × 4 = 20
```

Os parênteses mudam a ordem da conta.

---

# Relação entre Matemática e Programação

Programação usa muita lógica matemática.

Mesmo quando eu não estou fazendo contas grandes, o computador está sempre comparando, calculando e verificando condições.

Exemplos:

```
Se idade >= 18, a pessoa é maior de idade.
Se senha == senha_cadastrada, o usuário pode entrar.
Se nota >= 6, o aluno foi aprovado.
```

Essas decisões dependem de lógica, comparação e operações.

---

# Algoritmo como Receita de Bolo

A comparação do algoritmo com uma receita de bolo é muito boa.

Uma receita tem:

* Ingredientes.
* Ordem dos passos.
* Quantidades.
* Tempo de preparo.
* Resultado final.

Um algoritmo também funciona assim.

---

**Exemplo com receita**

```
Entrada:
Farinha, ovos, leite, açúcar e fermento.

Processamento:
Misturar os ingredientes, colocar na forma e levar ao forno.

Saída:
Bolo pronto.
```

Na programação:

```
Entrada:
Dois números.

Processamento:
Somar os dois números.

Saída:
Resultado da soma.
```

A lógica é a mesma.

---

## Conceito Fundamental

O conceito mais importante desta aula é entender que o computador trabalha com instruções claras e dados representados em binário.

Nós usamos a base decimal no dia a dia, mas o computador entende sinais elétricos que são representados como `0` e `1`.

A programação serve para criar algoritmos, ou seja, sequências de passos que transformam uma entrada em uma saída por meio de processamento.

---

# Em resumo

Vi que a computação evoluiu desde ferramentas antigas, como o ábaco, até computadores eletrônicos como o ENIAC.

Também aprendi que o computador trabalha com sistema binário, usando apenas `0` e `1`.

Entendi que um bit é a menor unidade de informação e que um byte é formado por 8 bits.

Além disso, aprendi a converter números entre decimal e binário, usando divisões por 2 ou potências de 2.

Por fim, vi que algoritmos são como receitas: uma sequência organizada de passos para resolver um problema.

---

**Resumo Relâmpago**

1. Lógica de programação é organizar o pensamento para resolver problemas.
2. Algoritmo é uma sequência de passos, como uma receita de bolo.
3. Todo sistema segue a lógica: entrada, processamento e saída.
4. O ábaco foi uma das primeiras ferramentas usadas para cálculos.
5. George Boole criou a base da lógica booleana, ligada ao verdadeiro e falso.
6. O computador entende informações usando o sistema binário.
7. Binário usa apenas dois valores: `0` e `1`.
8. Um bit é a menor unidade de informação do computador.
9. Um byte é formado por 8 bits.
10. Para converter binário em decimal, uso potências de 2 e somo os valores ativos.
