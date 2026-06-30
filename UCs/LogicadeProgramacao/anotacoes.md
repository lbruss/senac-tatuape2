# Operadores Lógicos (`E` e `OU`)

**Ideia Principal**

Utilizar **operadores lógicos**, que permitem combinar duas ou mais condições dentro de uma estrutura `SE`.

Até agora eu verificava apenas uma condição:

```
SE média >= 6
```

Agora posso verificar várias condições ao mesmo tempo.

Exemplo:

```
SE média >= 6 E faltas <= 4
```

ou

```
SE possui crachá OU é visitante autorizado
```

Esses operadores tornam os algoritmos muito mais inteligentes e próximos de situações reais.

---

**O que são Operadores Lógicos**

Os operadores lógicos servem para **combinar condições**.

Os principais são:

| Operador | Significado                              | Resultado                                     |
| -------- | ---------------------------------------- | --------------------------------------------- |
| `E`      | Todas as condições devem ser verdadeiras | Verdadeiro somente se todas forem verdadeiras |
| `OU`     | Basta uma condição ser verdadeira        | Verdadeiro se pelo menos uma for verdadeira   |

Esses operadores são utilizados em praticamente todas as linguagens de programação.

---

# Entendendo o Operador `E`

**Como funciona?**

O operador `E` exige que **todas** as condições sejam verdadeiras.

Se apenas uma delas for falsa, toda a expressão será falsa.

> Analogia

Imagine entrar em um avião.

Você só pode embarcar se:

* possuir passagem **E**
* apresentar um documento.

Se faltar qualquer um dos dois, o embarque será negado.

```
Passagem 
Documento 
→ Embarca

Passagem 
Documento 
→ Não embarca
```

---

## Exemplo — Verificação de Manifesto de Carga

**Objetivo**

Verificar se um caminhão pode ser liberado.

Regras:

* Deve possuir manifesto de carga.
* O peso deve ser de até 15.000 kg.

As duas condições precisam ser verdadeiras.

---

**Código**

```portugol
algoritmo "Liberacao de Carga"

var

documento: logico
peso: real

inicio

escreval("Possui manifesto de carga? (V/F):")
leia(documento)

escreval("Peso da carga (kg):")
leia(peso)

se (documento = verdadeiro) e (peso <= 15000) entao

   escreval("STATUS: LIBERADO")

senao

   escreval("STATUS: RETIDO")

fimse

fimalgoritmo
```

---

**Explicação Linha por Linha**

- **Variável lógica**

```portugol
documento: logico
```

O tipo `logico` armazena apenas dois valores:

```
Verdadeiro
Falso
```

É muito utilizado para perguntas que só possuem duas respostas possíveis.

- **Exemplos:**

* Sim ou Não
* Ligado ou Desligado
* Verdadeiro ou Falso

---

- **Primeira condição**

```portugol
documento = verdadeiro
```

Verifica se o caminhão possui o manifesto de carga.

---

- **Segunda condição**

```portugol
peso <= 15000
```

Verifica se o peso não ultrapassa o limite permitido.

---

- **Operador `E`**

```portugol
(documento = verdadeiro) e (peso <= 15000)
```

Significa:

```
O caminhão somente será liberado
SE possuir documento
E
o peso for menor ou igual a 15.000 kg.
```

---

- **Exemplos**

**Caso 1**

```
Documento = Verdadeiro
Peso = 12.000
```

Resultado:

```
STATUS: LIBERADO
```

---

**Caso 2**

```
Documento = Falso
Peso = 12.000
```

Resultado:

```
STATUS: RETIDO
```

---

- **Caso 3**

```
Documento = Verdadeiro
Peso = 18.000
```

Resultado:

```
STATUS: RETIDO
```

---

# Entendendo o Operador `OU`

**Como funciona?**

O operador `OU` é mais flexível.

Basta uma condição ser verdadeira para que toda a expressão seja verdadeira.

> Analogia

Imagine uma portaria.

Você pode entrar se:

* tiver crachá **OU**
* for um visitante autorizado.

Não é necessário possuir os dois.

---

## Exemplo — Controle de Acesso

**Objetivo**

Permitir a entrada de funcionários ou visitantes autorizados.

---

**Código**

```portugol
algoritmo "Controle de Acesso"

var

cracha, visitante: logico

inicio

escreval("Tem crachá? (V/F):")
leia(cracha)

escreval("É visitante autorizado? (V/F):")
leia(visitante)

se (cracha = verdadeiro) ou (visitante = verdadeiro) entao

   escreval("ACESSO PERMITIDO")

senao

   escreval("ACESSO NEGADO")

fimse

fimalgoritmo
```

---

**Como funciona?**

O algoritmo pergunta:

```
Possui crachá?
```

Se sim:

```
Acesso permitido.
```

Caso contrário, pergunta:

```
É visitante autorizado?
```

Se for:

```
Acesso permitido.
```

Somente quando as duas respostas forem falsas o acesso será negado.

---

- **Exemplos**

- Funcionário

```
Crachá = Verdadeiro
Visitante = Falso
```

Resultado:

```
ACESSO PERMITIDO0po
```

---

**Visitante**

```
Crachá = Falso
Visitante = Verdadeiro
```

Resultado:

```
ACESSO PERMITIDO
```

---

**Pessoa não autorizada**

```
Crachá = Falso
Visitante = Falso
```

Resultado:

```
ACESSO NEGADO
```

---

## Exemplo — Utilizando `E` e `OU` Juntos

**Objetivo**

Aprovar uma pessoa caso:

* tenha 30 anos ou mais **E** formação em TI;

**OU**

* seja cliente VIP.

---

- **$ Código**

```portugol
algoritmo "Selecao"

var

idade: inteiro
formacao: caractere
vip: logico

inicio

escreval("Digite a idade:")
leia(idade)

escreval("Digite a formação (TI/OUTRA):")
leia(formacao)

escreval("É cliente VIP? (V/F):")
leia(vip)

// Liberação se idade >= 30 e formação em TI ou cliente VIP

se ((idade >= 30) e (formacao = "TI")) ou (vip = verdadeiro) entao

   escreval("APROVADO")

senao

   escreval("NÃO APROVADO")

fimse

fimalgoritmo
```

---

- Entendendo a Condição

A condição é:

```portugol
((idade >= 30) e (formacao = "TI")) ou (vip = verdadeiro)
```

Ela pode ser dividida em duas partes:

### Primeira parte

```
Idade maior ou igual a 30
E
Formação em TI
```

As duas precisam ser verdadeiras.

---

**Segunda parte**

```
É cliente VIP?
```

Se for VIP, já será aprovado, mesmo sem atender à primeira condição.

---

> Exemplos

Caso 1

```
35 anos
Formação TI
VIP = Falso
```

Resultado:

```text
APROVADO
```

---

Caso 2

```text
22 anos
Formação OUTRA
VIP = Verdadeiro
```

Resultado:

```text
APROVADO
```

---

### Caso 3

```text
22 anos
Formação OUTRA
VIP = Falso
```

Resultado:

```
NÃO APROVADO
```

---

# Aprovação por Média e Faltas (Exercício Feito por Mim)

**bjetivo>>

Verificar se um aluno foi aprovado considerando:

* média final;
* quantidade de faltas.

---

O aluno será aprovado quando:

* média maior ou igual a 5;
* média menor ou igual a 10;
* no máximo 4 faltas.

Todas essas condições precisam ser verdadeiras.

---

**Código**

```portugol
algoritmo "Aprovacao"

var

media: real
falta: inteiro

inicio

escreval("Digite a sua média final:")
leia(media)

escreval("Digite o número de faltas:")
leia(falta)

se (media >= 5) e (media <= 10) e (falta <= 4) entao

   escreval("Aluno APROVADO")

senao

   escreval("Aluno REPROVADO")

fimse

fimalgoritmo
```

---

**Explicação da Condição**

```portugol
(media >= 5)
```

Verifica se a média mínima foi atingida.

---

```portugol
(media <= 10)
```

Garante que a nota está dentro do limite máximo permitido.

Embora normalmente a média nunca ultrapasse 10, essa verificação torna o algoritmo mais consistente e evita aceitar valores inválidos.

---

```portugol
(falta <= 4)
```

Verifica se o aluno não ultrapassou o limite de faltas.

---

Como as três condições estão ligadas pelo operador `E`, todas precisam ser verdadeiras para que o aluno seja aprovado.

---

- **Exemplo**

Aluno:

```t
Média = 7,5
Faltas = 3
```

Verificações:

```textp
7,5 >= 5 

7,5 <= 10 

3 <= 4 
```

Resultado:

```
Aluno APROVADO
```

---

Outro exemplo:

```
Média = 8

Faltas = 7
```

Mesmo com média suficiente:

```text
Faltas > 4
```

Resultado:

```text
Aluno REPROVADO
```

Isso demonstra que basta uma das condições ligadas pelo operador `E` ser falsa para reprovar o aluno.

---

# Conceito Fundamental

Os operadores lógicos permitem criar regras mais completas e próximas das situações do mundo real.

* O operador **`E`** exige que **todas** as condições sejam verdadeiras.
* O operador **`OU`** exige que **pelo menos uma** condição seja verdadeira.

Eles são amplamente utilizados em sistemas como:

* Login de usuários.
* Controle de acesso.
* Aprovação de crédito.
* Matrícula escolar.
* Sistemas bancários.
* E-commerce.
* Jogos e aplicativos.

Sem operadores lógicos, seria impossível criar programas capazes de tomar decisões complexas.

---

# Em Resumo

Nesta aula aprendi a utilizar os operadores lógicos `E` e `OU` para combinar múltiplas condições em uma mesma estrutura `SE`. Desenvolvi algoritmos para liberação de cargas, controle de acesso, seleção de candidatos e aprovação de alunos, compreendendo como diferentes condições podem ser avaliadas simultaneamente. Também percebi que a combinação correta dos operadores lógicos é essencial para representar regras de negócio com precisão.

# Resumo Relâmpago

1. Operadores lógicos combinam duas ou mais condições em um algoritmo.
2. O operador `E` exige que todas as condições sejam verdadeiras.
3. O operador `OU` exige que pelo menos uma condição seja verdadeira.
4. O tipo `logico` armazena apenas os valores Verdadeiro ou Falso.
5. Condições podem verificar números, textos e valores lógicos.
6. Parênteses ajudam a organizar e priorizar avaliações complexas.
7. A combinação de `E` e `OU` permite criar regras mais sofisticadas.
8. Operadores lógicos são usados em sistemas de acesso, vendas e cadastros.
9. Uma condição falsa ligada por `E` torna toda a expressão falsa.
10. O uso correto de operadores lógicos é fundamental para desenvolver algoritmos robustos e inteligentes.
