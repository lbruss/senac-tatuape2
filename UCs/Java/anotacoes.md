# Alinhamentos de Texto, Colunas Manuais e Ajustes Finos na Impressão Térmica ESC/POS

---

## 1. Visão Geral

Nesta aula, aprofundei os conhecimentos em impressão térmica para PDV, focando no **posicionamento e alinhamento visual dos dados no cupom**.

Na aula anterior, já tínhamos conseguido conectar e imprimir textos básicos. Agora, evoluímos a estrutura do cupom para deixá-lo com cara de comprovante profissional. Aprendi a controlar o alinhamento do papel (esquerda, centro e direita) utilizando comandos de hardware **ESC/POS** e também aprendi uma técnica manual indispensável no dia a dia do desenvolvimento comercial: a **criação de colunas duplas na mesma linha** utilizando espaçamento por caracteres.

Além disso, atualizamos o endereço de IP da impressora do laboratório para `10.26.45.41`.

---

## 2. Entendendo o Conceito

### A. Como a Impressora Trata os Alinhamentos (`ESC a n`)

A impressora térmica processa informações **linha por linha**. Quando enviamos um comando de alinhamento, como o `ESC a n`, a impressora altera a posição de todo o texto que vier a seguir, até que outro comando de alinhamento seja enviado.

* **Esquerda (`0x00`):** Alinha o texto na margem esquerda da bobina (padrão).
* **Centro (`0x01`):** Centraliza o texto no meio da largura do papel.
* **Direita (`0x02`):** Empurra o texto para colar na margem direita.

### B. O Desafio da "Linha Única com Duas Colunas"

Um dos maiores aprendizados desta aula foi perceber a limitação do comando de alinhamento por hardware: **ele afeta a linha inteira, e não palavras isoladas.**

Se eu tentar alinhar a palavra "Cliente" à esquerda e a palavra "SENAC" à direita usando dois comandos `ESC/POS` na mesma linha, o segundo comando vai sobresscrever o primeiro e empurrar a linha **inteira** para a direita!

💡 **Analogia da Máquina de Escrever:**
Imagine uma máquina de escrever antiga. Se você ajusta a margem para a direita, todo o texto que você digitar naquela linha irá para a direita. Para colocar um texto no canto esquerdo e outro no canto direito da **mesma linha**, você precisa colocar a margem na esquerda, digitar a primeira palavra, apertar a barra de espaço várias vezes até o carrinho chegar no canto direito e, só então, digitar a segunda palavra.

Fizemos exatamente isso em Java: configuramos o alinhamento para a esquerda e preenchemos o meio do texto com **espaços em branco manuais** até empurrar a segunda informação para a borda direita da bobina.

---

## 3. Conceitos Fundamentais

### 1. Parâmetros do Comando `ESC a n` (Alinhamento)

O comando hexadecimal para alterar o alinhamento é `0x1B, 0x61, n`, onde o último byte `n` define a posição:

* `0x00`: Alinhamento à esquerda (*Left*).
* `0x01`: Alinhamento centralizado (*Center*).
* `0x02`: Alinhamento à direita (*Right*).

### 2. Formatação por Espaçamento Manual (Colunas na Mesma Linha)

Para criar o efeito de tabela/colunas (por exemplo, `Nome do Produto` na esquerda e `Preço` na direita):

1. Definimos o alinhamento da impressora para a **esquerda** (`0x00`).
2. Escrevemos a primeira string.
3. Adicionamos a quantidade de espaços em branco necessária.
4. Escrevemos a segunda string.
5. Inserimos a quebra de linha `\n`.

---

## 4. Código / Exemplos Práticos

### Código Completo e Atualizado (`Impressora.java`)

```java
package impressora;

import java.io.OutputStream;
import java.net.Socket; // Importação para comunicação via rede TCP/IP
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Aplicação para testes de alinhamento e formatação visual em impressora térmica.
 * 
 * @author Bruss Loza
 */
public class Impressora {

    public static void main(String[] args) {
        
        // IP atualizado da impressora no laboratório e porta padrão 9100
        String ipImpressora = "10.26.45.41";
        int portaImpressora = 9100;

        try {
            // Conexão via Socket TCP/IP
            Socket impressora = new Socket(ipImpressora, portaImpressora);
            OutputStream saida = impressora.getOutputStream();

            // Ativa/Reseta a impressora para receber comandos ESC/POS (ESC @)
            saida.write(new byte[] {0x1B, 0x40});

            // --- CORPO DO DOCUMENTO ---

            // 1. Imprimir Data e Hora Atuais
            LocalDateTime agora = LocalDateTime.now();
            DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yy HH:mm:ss");
            String dataHora = "Data: " + agora.format(formato) + "\n";
            saida.write(dataHora.getBytes("CP850"));

            // 2. Formatação do Título Principal
            // Aumentar a fonte (GS ! 0x22 -> Tamanho expandido)
            saida.write(new byte[] {0x1D, 0x21, 0x22});

            // Centralizar (ESC a 0x01)
            saida.write(new byte[] {0x1B, 0x61, 0x01});

            // Ativar Negrito (ESC E 0x01)
            saida.write(new byte[] {0x1B, 0x45, 0x01});

            // Imprimir Título
            saida.write("PDV\n".getBytes("CP850")); // Obrigatório o "\n"

            // 3. Restaurar Fonte Normal
            saida.write(new byte[] {0x1D, 0x21, 0x00});

            // 4. Teste de Alinhamento à Esquerda (ESC a 0x00)
            saida.write(new byte[] {0x1B, 0x61, 0x00});
            saida.write("Bruss Loza\n".getBytes("CP850"));

            // 5. Teste de Alinhamento à Direita (ESC a 0x02)
            saida.write(new byte[] {0x1B, 0x61, 0x02});
            saida.write("SENAC Tatuapé\n".getBytes("CP850"));

            // 6. Alinhamento à Esquerda com Colunas Manuais (Truque de Espaços)
            saida.write(new byte[] {0x1B, 0x61, 0x00});
            saida.write("Bruss Loza                        SENAC Tatuapé\n".getBytes("CP850"));

            // 7. Avanço de Papel (5 linhas -> ESC d 0x05)
            saida.write(new byte[] {0x1B, 0x64, 0x05});

            // 8. Corte de Papel / Guilhotina (GS V 0x00)
            saida.write(new byte[] {0x1D, 0x56, 0x00});

            // --- FIM DO CORPO DO DOCUMENTO ---

            // Descarrega o buffer e encerra a conexão
            saida.flush();
            saida.close();
            impressora.close();

            System.out.println("Dados enviados para a Impressora!");

        } catch (Exception e) {
            System.err.println("Erro na comunicação com a impressora: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

```

---

## 5. Desmontando o Código

Analisando especificamente os novos trechos de código adicionados nesta aula:

### 1. Mudança para Alinhamento à Esquerda

```java
saida.write(new byte[] {0x1B, 0x61, 0x00});
saida.write("Bruss Loza\n".getBytes("CP850"));

```

* **`0x1B, 0x61, 0x00`**: O byte `0x00` diz para a impressora: *"A partir de agora, encoste todo texto na margem esquerda"*.
* **Resultado:** A frase `"Bruss Loza"` é impressa encostada no canto esquerdo da bobina.

---

### 2. Mudança para Alinhamento à Direita

```java
saida.write(new byte[] {0x1B, 0x61, 0x02});
saida.write("SENAC Tatuapé\n".getBytes("CP850"));

```

* **`0x1B, 0x61, 0x02`**: O byte `0x02` altera o modo para alinhamento à direita.
* **Resultado:** A frase `"SENAC Tatuapé"` salta para a extremidade direita do papel.

---

### 3. Simulando Duas Colunas na Mesma Linha (Truque do Espaçamento)

```java
saida.write(new byte[] {0x1B, 0x61, 0x00});
saida.write("Bruss Loza                        SENAC Tatuapé\n".getBytes("CP850"));

```

1. **`0x1B, 0x61, 0x00`**: Garante que a linha começará a ser impressa na margem esquerda.
2. **`"Bruss Loza"`**: Primeiro dado da coluna esquerda.
3. **`"                        "` (Vários espaços)**: Preenche o meio da linha com espaços em branco invisíveis.
4. **`"SENAC Tatuapé\n"`**: Segundo dado da coluna direita, empurrado até a borda.
5. **Resultado:** Ambas as informações saem impressas **na mesma linha física**, cada uma em um canto do cupom!

---

## 6. Passo a Passo

### Como Criar um Layout de Duas Colunas Alinhadas sem Quebrar a Linha

Para montar uma linha estilo recibo (Exemplo: `Produto` de um lado e `Preço` do outro), siga esta sequência lógica:

1. **Passo 1: Garantir o Alinhamento à Esquerda:**
* Envie o comando `new byte[] {0x1B, 0x61, 0x00}`.


2. **Passo 2: Conhecer a Largura Máxima da Impressora:**
* A maioria das impressoras térmicas padrão de 80mm aceita **48 caracteres por linha** em fonte normal.


3. **Passo 3: Montar a String com Espaços Calculados:**
* Calcule o tamanho do texto da esquerda + tamanho do texto da direita.
* Preencha a diferença com espaços em branco entre eles.


4. **Passo 4: Finalizar obrigatoriamente com o `\n`:**
* Envie a linha inteira montada para o fluxo de saída usando `.getBytes("CP850")`.



---

## 7. Tabelas Comparativas

### 1. Guia dos Bytes de Alinhamento `ESC a n` (`0x1B, 0x61, n`)

| Byte do Parâmetro (`n`) | Tipo de Alinhamento | Efeito no Papel | Uso Comum |
| --- | --- | --- | --- |
| **`0x00`** | **Esquerda** (*Left*) | Encosta o texto na margem esquerda. | Lista de itens, descrições, dados do cliente. |
| **`0x01`** | **Centralizado** (*Center*) | Posiciona o texto no centro da bobina. | Título do PDV, CNPJ, mensagens de agradecimento. |
| **`0x02`** | **Direita** (*Right*) | Encosta o texto na margem direita. | Totais, subtotais, datas de emissão no rodapé. |

---

### 2. Alinhamento via Hardware vs. Alinhamento via String (Espaços)

| Método | Como Funciona | Vantagem | Limitação |
| --- | --- | --- | --- |
| **Comando `ESC a n**` | Altera a configuração física da impressora. | Muito simples para centralizar ou alinhar blocos inteiros. | Afeta a **linha inteira**. Não permite alinhar dois dados em cantos opostos na mesma linha. |
| **Espaçamento por String** | Preenche a linha com caracteres de espaço (`' '`). | Permite criar **2 ou mais colunas na mesma linha física** (estilo tabela). | Exige calcular a quantidade exata de caracteres para não estourar a margem da bobina. |

---

## 8. Erros Comuns e Cuidados

### 1. Tentar Usar `ESC a 0x02` na Metade de Uma Linha

Se você escrever `"Bruss Loza"`, mandar o comando `0x02` e depois escrever `"SENAC"`, a impressora não vai colocar a primeira palavra na esquerda e a segunda na direita. Ela vai empurrar **a linha inteira** para a direita!

* **Solução:** Use o truque de manter o alinhamento à esquerda (`0x00`) e inserir os espaços no meio da String.

### 2. Exceder o Limite de Caracteres da Linha

Se a sua impressora aceita 48 caracteres por linha e a sua String concatenada com espaços tiver 52 caracteres:

* A impressora cortará a palavra no final e jogará o restante para a **linha de baixo**, destruindo o visual do cupom.
* **Cuidado:** Sempre meça ou valide o tamanho total das Strings antes de imprimir.

### 3. Grafia de Numerais Hexadecimais no Java

No rascunho original, alguns bytes vieram escritos como `0X22` ou `0X01` (com 'X' maiúsculo).

* Embora o Java aceite a sintaxe com 'X' maiúsculo, a boa prática e convenção padrão em programação é escrever hexadecimais sempre em **letras minúsculas** (`0x22`, `0x01`, `0x00`).

---

## 9. Correções Técnicas das Minhas Anotações

Durante a revisão do meu rascunho de aula, realizei as seguintes correções silenciosas:

1. **Nomenclatura do Pacote:** Ajustei a declaração `package Impressora;` para `package impressora;` em letras minúsculas, conforme as convenções oficiais do Java.
2. **Formatação de Hexadecimais:** Padronizei todos os numerais de bytes para `0x` minúsculo (ex: `0x22`, `0x01`, `0x00`, `0x02`).
3. **Formatação da String de Data:** No rascunho original, a variável trazia `"Data"` sem espaço ou dois-pontos no final, resultando em algo grudado como `"Data23/10/26"`. Ajustei para `"Data: "` para melhorar a apresentação visual no papel.

---

## 10. Conteúdo Complementar e Aprofundamento

### Gerando Colunas Perfeitas Dinamicamente com `String.format()` em Java

Fazer o espaçamento "na raça" digitando vários espaços manualmente dentro da aspas (`"Bruss Loza                        SENAC Tatuapé"`) funciona para testes rápidos, mas é ruim em sistemas reais, pois se o nome do cliente for maior, o alinhamento quebra!

Podemos usar a função nativa **`String.format()`** do Java para calcular o alinhamento de colunas automaticamente com base na largura da bobina (ex: 48 colunas):

```java
// Exemplo de Função Profissional para Montar 2 Colunas em Bobina de 48 Colunas:
public static String montarLinhaDupla(String esquerda, String direita, int larguraMax) {
    int espacosNecessarios = larguraMax - esquerda.length() - direita.length();
    
    // Se o texto for maior que a linha, trunca para não quebrar o layout
    if (espacosNecessarios < 1) {
        return esquerda.substring(0, larguraMax - direita.length() - 1) + " " + direita + "\n";
    }
    
    // Gera a quantidade exata de espaços para empurrar o texto da direita para a margem
    String espacos = " ".repeat(espacosNecessarios);
    
    return esquerda + espacos + direita + "\n";
}

// Como usar no código:
String linhaFormatada = montarLinhaDupla("Bruss Loza", "SENAC Tatuapé", 48);
saida.write(linhaFormatada.getBytes("CP850"));

```

---

## Resumo Relâmpago — 10 Linhas

1. O IP da impressora do laboratório foi atualizado no código para `10.26.45.41`.
2. O comando `0x1B, 0x61, 0x00` redefine o alinhamento da impressora para a margem esquerda.
3. O comando `0x1B, 0x61, 0x01` centraliza todo o texto emitido nas linhas seguintes.
4. O comando `0x1B, 0x61, 0x02` empurra o texto das linhas seguintes para a margem direita.
5. Os comandos de alinhamento ESC/POS afetam a linha inteira, e não palavras isoladas.
6. Para colocar informações em cantos opostos da mesma linha, usamos alinhamento à esquerda + espaços no meio.
7. O caractere `\n` é obrigatório no final de cada instrução para descarregar a linha da memória da impressora.
8. Uma impressora térmica padrão de 80mm aceita em média 48 caracteres por linha em fonte normal.
9. Se a quantidade de caracteres de uma linha ultrapassar a largura do papel, o texto é cortado para a linha de baixo.
10. A codificação `CP850` continua sendo indispensável para a impressão correta de acentos e caracteres especiais.

---

## Guia Rápido de Memorização

### Tabela Rápida de Bytes de Alinhamento

* **`0x1B, 0x61, 0x00`** ➔ Esquerda (*Left*)
* **`0x1B, 0x61, 0x01`** ➔ Centro (*Center*)
* **`0x1B, 0x61, 0x02`** ➔ Direita (*Right*)

### Fórmula da Linha com Duas Colunas

```
[Texto Esquerda] + [Espaços em Branco para Preencher] + [Texto Direita] + "\n"

```
