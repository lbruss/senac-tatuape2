# Impressão Térmica em Rede via Sockets e Comandos ESC/POS no Java

---

**Visão Geral**

Nesta aula, aprendi a integrar o Java diretamente com um hardware do mundo real: uma **impressora térmica não-fiscal de cupom** (do tipo utilizado em caixas de supermercado, farmácias e restaurantes em sistemas de PDV — Ponto de Venda).

Entendi que não precisamos instalar drivers complexos de impressão do sistema operacional para emitir um cupom simples. Podemos conectar a impressora diretamente na **rede local (TCP/IP)** e enviar comandos e textos em nível de **bytes** direto para a porta de impressão da máquina.

Nesta prática, conectei a aplicação Java à impressora pelo seu endereço de IP na rede, formatei um cupom com data e hora dinâmicas, apliquei estilos visuais ao texto (como negrito, centralização e aumento de fonte) e, ao final, enviei o comando para avanço e **corte automático do papel (guilhotina)**.

---

**Entendendo o Conceito**

## Comunicação via Sockets TCP/IP

Um **Socket** é a representação de um canal de comunicação de rede bidirecional entre duas máquinas.

* O **computador (software Java)** atua como o cliente que solicita a conexão.
* A **impressora térmica** atua como o servidor que escuta requisições em uma porta específica (geralmente a **porta 9100**, padrão da indústria para impressão *RAW/JetDirect*).

## O Protocolo e Linguagem ESC/POS

As impressoras térmicas utilizam um padrão de comandos chamado **ESC/POS** (desenvolvido originalmente pela Epson e adotado por marcas como Bematech, Daruma, Elgin e Diebold).

Esses comandos não são textos comuns, mas sim **sequências de bytes hexadecimais** iniciados quase sempre pelo caractere *Escape* (`0x1B` em hexa) ou *Group Separator* (`0x1D` em hexa). Ao receber esses bytes, a impressora intercepta o sinal e altera suas configurações físicas (ex: liga o negrito, gira a guilhotina ou altera o tamanho do caractere).

> **Analogia da Chamada Telefônica:**

Imagine que abrir um `Socket` é o mesmo que fazer uma ligação telefônica para o IP da impressora. Assim que ela "atende" no ramal 9100, nós não falamos português puro; enviamos pequenos "códigos Morse" (bytes ESC/POS) para comandar o hardware: um código para ajustar a máquina, o texto do cupom e um código final que aciona a lâmina para cortar o papel.

---

## Conceitos Fundamentais

**`java.net.Socket`**

Classe nativa do Java usada para estabelecer a conexão de rede TCP/IP com a impressora.

* **Sintaxe:** `Socket impressora = new Socket("IP_DA_IMPRESSORA", PORTA);`

**`java.io.OutputStream`**

Fluxo de saída de dados associado ao Socket. É o "cano" por onde enviamos os arrays de bytes para a impressora.

* **Sintaxe:** `OutputStream saida = impressora.getOutputStream();`

**Tabela de Codificação de Caracteres (`CP850`)**

Impressoras térmicas não utilizam o padrão moderno `UTF-8` por padrão para acentuação brasileira. Elas trabalham com tabelas de páginas de código (*Code Pages*). A tabela **`CP850`** (ou `IBM850`) é a utilizada no Brasil para garantir que letras com acento (á, é, ç, ã) e caracteres especiais sejam impressos corretamente sem virar símbolos estranhos.

## API de Data e Hora Moderna (`java.time`)

Para imprimir o momento exato da venda, utilizei as classes da API nativa do Java 8+:

* **`LocalDateTime.now()`**: Captura a data e a hora exatas do sistema.
* **`DateTimeFormatter`**: Define a máscara de exibição visual (ex: `"dd/MM/yy HH:mm:ss"`).

---

### Código / Exemplos Práticos

**Código Completo e Corrigido (`Impressora.java`)**

Abaixo está o código final ajustado, com o tratamento de exceção adequado, padrão de pacotes em letras minúsculas e espaçamentos corrigidos.

```java
package impressora;

import java.io.OutputStream;
import java.net.Socket; // Biblioteca para comunicação via rede TCP/IP
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Aplicação para envio de comandos de impressão e corte para impressora térmica de PDV.
 * 
 * @author Bruss Loza
 */
public class Impressora {

    public static void main(String[] args) {
        
        // Definição do IP da impressora na rede local e da porta padrão RAW (9100)
        String ipImpressora = "10.26.45.49";
        int portaImpressora = 9100;

        try {
            // 1. Conecta com a impressora via Socket de Rede
            System.out.println("Conectando à impressora no IP " + ipImpressora + "...");
            Socket impressora = new Socket(ipImpressora, portaImpressora);
            OutputStream saida = impressora.getOutputStream();

            // 2. Comando ESC/POS para Inicializar/Resetar a impressora (ESC @)
            saida.write(new byte[]{0x1B, 0x40});

            // 3. Captura e Formatação de Data e Hora atuais
            LocalDateTime agora = LocalDateTime.now();
            DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yy HH:mm:ss");
            String dataHora = "Data: " + agora.format(formato) + "\n";

            // Impressão da linha de Data e Hora no cabeçalho
            saida.write(dataHora.getBytes("CP850"));

            // 4. Configuração de Estilo do Título:
            // Aumentar o tamanho da fonte (GS ! 0x22 = Tamanho expandido)
            saida.write(new byte[]{0x1D, 0x21, 0x22});
            
            // Centralizar o texto (ESC a 0x01)
            saida.write(new byte[]{0x1B, 0x61, 0x01});
            
            // Ativar Negrito (ESC E 0x01)
            saida.write(new byte[]{0x1B, 0x45, 0x01});

            // Imprimir o Título em destaque (Obrigatorio o '\n' para dar quebra de linha)
            saida.write("PDV\n".getBytes("CP850"));

            // 5. Restaurar padrões normais de fonte para o corpo do texto:
            // Voltar tamanho normal da fonte (GS ! 0x00)
            saida.write(new byte[]{0x1D, 0x21, 0x00});
            
            // Desativar Negrito (opcional se enviar novo padrão, mantido o texto regular)
            saida.write("Bruss Loza\n".getBytes("CP850"));
            saida.write("SENAC Tatuapé\n".getBytes("CP850"));

            // 6. Comandos Finais de Papel:
            // Avançar 5 linhas de papel (ESC d 0x05)
            saida.write(new byte[]{0x1B, 0x64, 0x05});

            // Acionar o Corte de Papel / Guilhotina (GS V 0x00)
            saida.write(new byte[]{0x1D, 0x56, 0x00});

            // 7. Força o envio dos dados pendentes no buffer e encerra a conexão
            saida.flush();
            saida.close();
            impressora.close();

            System.out.println("Dados enviados com sucesso! Cupom impresso e cortado.");

        } catch (Exception e) {
            System.err.println("Erro ao se comunicar com a impressora: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

```

---

**Desmontando o Código**

Vamos entender os comandos hexadecimais em nível de hardware que enviamos dentro do array de bytes `saida.write(new byte[]{...})`:

1. **`new byte[]{0x1B, 0x40}` (ESC @ — Reseta Impressora):**
* Limpa o buffer interno da impressora e restaura as configurações padrão de fábrica antes de começar a imprimir o novo cupom.


2. **`saida.write("PDV\n".getBytes("CP850"))`:**
* Converte a String `"PDV\n"` para a tabela de caracteres `CP850`.
* **Importante:** O caractere `\n` (pula linha) é obrigatório. A impressora térmica imprime por linha; se você não enviar o `\n`, o texto fica preso na memória buffer e não sai no papel.


3. **`new byte[]{0x1D, 0x21, 0x22}` (GS ! n — Expansion):**
* Altera a escala da fonte. O byte `0x22` expande tanto a largura quanto a altura do texto, criando aquele efeito de título grande nos cupons.


4. **`new byte[]{0x1B, 0x61, 0x01}` (ESC a n — Alinhamento):**
* Define o alinhamento da linha: `0x00` = Esquerda, `0x01` = Centralizado, `0x02` = Direita.


5. **`new byte[]{0x1B, 0x45, 0x01}` (ESC E n — Negrito):**
* Ativa o modo de realce/negrito (`0x01` ativa, `0x00` desativa).


6. **`new byte[]{0x1B, 0x64, 0x05}` (ESC d n — Feed):**
* Alimenta e avança o papel em $n$ linhas (neste caso, `0x05` avança 5 linhas) para que o texto impresso passe da área da cabeça térmica e chegue até a lâmina.


7. **`new byte[]{0x1D, 0x56, 0x00}` (GS V m — Cut):**
* Comanda a guilhotina física para realizar o corte total do papel.


8. **`saida.flush()`**:
* Descarrega imediatamente qualquer byte residual mantido no buffer do Java diretamente para o cabo de rede.



---

**Passo a Passo**

**Roteiro de Execução e Teste de Impressão Térmica em Rede**

1. **Passo 1: Descobrir/Confirmar o IP da Impressora:**
* Imprima o teste de autodiagnostico da própria impressora (geralmente segurando o botão *FEED* enquanto liga a impressora) para ver o IP fixado nela (ex: `10.26.45.49`).


2. **Passo 2: Testar a Conectividade Físico/Rede via CMD (Windows):**
* Abra o terminal do Windows (`Cmd`) e digite o comando:



```cmd
     ping 10.26.45.49
     

```

* **O que esperar:** O terminal deve responder com *`Resposta de 10.26.45.49: bytes=32 tempo...`*. Se der tempo limite esgotado ou destino inacessível, o computador e a impressora não estão na mesma rede!

3. **Passo 3: Criar o Projeto e a Classe no Eclipse:**
* Crie o projeto `Impressora Termica`, o pacote `impressora` e a classe `Impressora`.


4. **Passo 4: Codificar o Fluxo Socket + ESC/POS + Formatação de Texto.**
5. **Passo 5: Executar o Código (`Ctrl + F11`):**
* O código abrirá o Socket, enviará o pacote de bytes pela rede, a impressora emitirá o som de impressão, avançará 5 linhas e acionará a lâmina de corte.
* No console do Eclipse aparecerá a mensagem: *"Dados enviados para a Impressora!"*.



---

## Tabelas Comparativas

**Dicionário de Comandos ESC/POS Fundamentais**

| Comando ESC/POS | Representação em Bytes (Hex) | Função / Efeito no Hardware |
| --- | --- | --- |
| **ESC @** | `new byte[]{0x1B, 0x40}` | Reseta/Inicializa a impressora limpando a memória. |
| **GS ! n** | `new byte[]{0x1D, 0x21, 0x00}` | Define tamanho Normal da Fonte (`0x00`). |
| **GS ! n** | `new byte[]{0x1D, 0x21, 0x22}` | Define tamanho Expandido 3X da Fonte (`0x22`). |
| **ESC a n** | `new byte[]{0x1B, 0x61, 0x01}` | Alinha o texto ao **Centro** (`0x01`). |
| **ESC a n** | `new byte[]{0x1B, 0x61, 0x00}` | Alinha o texto à **Esquerda** (`0x00`). |
| **ESC E n** | `new byte[]{0x1B, 0x45, 0x01}` | Ativa o modo **Negrito** (`0x01`). |
| **ESC d n** | `new byte[]{0x1B, 0x64, 0x05}` | Avança **5 linhas** de papel (`0x05`). |
| **GS V m** | `new byte[]{0x1D, 0x56, 0x00}` | Aciona a **Guilhotina** para corte total do papel. |

---

**Tabela de Opções de Alinhamento (ESC a n)**

| Byte de Parâmetro | Posição do Alinhamento |
| --- | --- |
| `0x00` | Alinhado à Esquerda (Padrão) |
| `0x01` | Centralizado no Cupom |
| `0x02` | Alinhado à Direita |

---

## Erros Comuns e Cuidados

**Falha na Conexão (`java.net.ConnectException` / Timeout)**

Ocorre quando o computador não consegue alcançar a impressora.

* **Causa:** O IP informado no código está errado, o cabo de rede está desconectado ou o computador está em um Wi-Fi/Rede diferente da impressora.
* **Solução:** Faça o teste do `ping IP` no CMD antes de rodar o programa Java.

**Esquecer de Colocar o `\n` ao Final das Frases**

* **Problema:** O texto é enviado, o programa finaliza sem erros, mas **nada é impresso no papel**.
* **Causa:** A impressora térmica aguarda o caractere de fim de linha (`\n`) para descarregar o texto da memória e queimar o papel.

**Acentos Virando Símbolos Estranhos**

* **Problema:** A palavra `"SÃO PAULO"` imprime como `"S├âO PAULO"`.
* **Causa:** Enviar os bytes usando a codificação padrão `UTF-8`.
* **Solução:** Use sempre `.getBytes("CP850")` para garantir a conversão correta da tabela de caracteres.

---

## Conteúdo Complementar e Aprofundamento

**Garantindo o Fechamento de Recursos com `try-with-resources`**

No código da aula, abrimos o `Socket` e o `OutputStream` dentro do bloco `try` e fechamos manualmente no final com `close()`. Se ocorresse um erro no meio da impressão, o código pularia direto para o `catch` e deixaria a porta da impressora presa/aberta na memória!

Uma boa prática do Java moderno (Java 7+) é utilizar a estrutura **`try-with-resources`**, que fecha conexões de rede e arquivos automaticamente ao final do bloco, mesmo se ocorrer uma exceção.

```java
// Exemplo de Boa Prática Profissional com Try-With-Resources:
try (Socket impressora = new Socket("10.26.45.49", 9100);
     OutputStream saida = impressora.getOutputStream()) {
     
    saida.write(new byte[]{0x1B, 0x40}); // Comandos...
    saida.write("Teste de Impressão Seguro\n".getBytes("CP850"));
    saida.flush();
    // O Java FECHA o Socket e o OutputStream AUTOMATICAMENTE aqui ao sair do bloco!
} catch (Exception e) {
    System.err.println("Erro na comunicação: " + e.getMessage());
}

```

---

**Resumo Relâmpago — 10 Linhas**

1. Impressoras térmicas de PDV podem ser controladas via rede TCP/IP através da classe `Socket`.
2. A porta padrão de comunicação RAW para impressoras térmicas na rede é a 9100.
3. Antes de executar o código Java, devemos validar a conectividade de rede usando o comando `ping IP` no CMD.
4. O protocolo ESC/POS envia sequências de bytes hexadecimais para comandar recursos físicos da impressora.
5. O comando `0x1B, 0x40` (ESC @) reinicia a impressora e restaura suas configurações padrões.
6. A codificação de caracteres `CP850` é necessária para imprimir textos acentuados corretamente no Brasil.
7. O envio do caractere `\n` ao final de cada linha de texto é obrigatório para que a impressora descarregue o buffer.
8. Para alterar estilos de fonte (tamanho, negrito, centralização), enviamos bytes de controle ESC/POS específicos.
9. O avanço de papel (`0x1B, 0x64, n`) garante que o texto saia da cabeça de impressão antes do corte.
10. O comando `0x1D, 0x56, 0x00` aciona a guilhotina física para realizar o corte automático do papel.

---

## Guia Rápido de Memorização

**Sequência do Cupom Térmico em Java**

```java
// 1. Abrir Canal
Socket socket = new Socket("10.26.45.49", 9100);
OutputStream out = socket.getOutputStream();

// 2. Resetar Impressora
out.write(new byte[]{0x1B, 0x40});

// 3. Imprimir Texto (Acentuação CP850 + Quebra de Linha \n)
out.write("Texto do Cupom\n".getBytes("CP850"));

// 4. Avançar 5 Linhas
out.write(new byte[]{0x1B, 0x64, 0x05});

// 5. Cortar Papel (Guilhotina)
out.write(new byte[]{0x1D, 0x56, 0x00});

// 6. Enviar e Fechar
out.flush();
socket.close();

```
