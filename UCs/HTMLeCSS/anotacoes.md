# Mídias na Web: Áudio, Vídeo, Imagens Responsivas e Elementos Semânticos

---

## 1. Visão Geral

Nesta aula, aprendi como incorporar recursos de multimídia (áudio, vídeo e imagens avançadas) diretamente em páginas HTML5 de forma nativa.

Antes do HTML5, exibir áudio ou vídeo na Web exigia o uso de plugins externos e pesados (como o antigo Adobe Flash Player). Hoje, os navegadores modernos possuem players nativos e otimizados, acionados por tags simples como `<audio>` e `<video>`. Além disso, entendi como entregar imagens otimizadas para diferentes tamanhos de tela usando imagens responsivas (`srcset`) e como agrupar mídias com suas respectivas legendas usando as tags semânticas `<figure>` e `<figcaption>`.

---

## 2. Entendendo o Conceito

### O que são Mídias Nativas e Imagens Responsivas?

* **Conceito simples**: São elementos que permitem rodar áudios e vídeos diretamente no site sem instalar nada, e exibir imagens leves em celulares e imagens de alta resolução em monitores grandes.
* **Definição técnica**: O HTML5 fornece elementos de mídia nativos (`<audio>` e `<video>`) que negociam com os codecs do navegador a reprodução de arquivos em formatos como MP3 e MP4. Para imagens, o atributo `srcset` permite ao navegador avaliar a densidade de pixels e a largura do dispositivo (*viewport*) para baixar automaticamente a versão de imagem mais adequada.
* **Analogia**: Pense no atributo `srcset` como um cardápio de roupas por tamanho. Em vez de entregar uma camisa tamanho GG para todo mundo (o que deixaria alguém pequeno "sobrecarregado" de pano extra), o navegador olha o tamanho da pessoa (a tela) e escolhe exatamente a camisa P, M ou G que veste com perfeição, economizando pano (dados de internet).

---

## 3. Conceitos Fundamentais

### 3.1. Tag de Áudio (`<audio>`)

Cria um player de áudio na página.

* **Atributo `controls**`: Atributo booleano que exibe a interface com os botões de play, pause, controle de volume e barra de progresso.
* **Tag `<source>**`: Fica dentro da tag de mídia e define o caminho do arquivo (`src`) e seu tipo MIME (`type="audio/mpeg"` para MP3).
* **Conteúdo de Fallback (Reserva)**: Qualquer texto escrito dentro de `<audio>` que não seja uma tag `<source>` só será exibido se o navegador do usuário for antigo e não suportar HTML5.

### 3.2. Tag de Vídeo (`<video>`)

Cria um player de vídeo embutido.

* **Atributos `width` e `height**`: Definem a largura e a altura do player na tela (em pixels).
* **Atributo `type**`: Especifica o formato (ex: `type="video/mp4"`).

### 3.3. Imagens Semânticas (`<figure>` e `<figcaption>`)

* `<figure>`: Tag semântica usada para encapsular um conteúdo autônomo, como uma imagem, um gráfico ou uma ilustração.
* `<figcaption>`: Insere uma legenda explicativa diretamente associada à mídia contida dentro da `<figure>`.

### 3.4. Imagens Responsivas com `srcset`

O atributo `srcset` permite listar várias versões de uma mesma imagem seguidas por um descritor de largura (medido em `w`, de *width*).

* `680w`: Avisa ao navegador que aquela imagem possui 680 pixels de largura real.
* O navegador lê a resolução da tela do usuário e decide sozinho qual arquivo baixar, economizando banda em conexões móveis.

---

## 4. Código / Exemplos Práticos

Abaixo estão os três arquivos de mídia desenvolvidos na aula, devidamente estruturados e com erros de sintaxe corrigidos.

### Arquivo 1: `audio.html`

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Tocador de Áudio Nativom HTML5</title>
</head>
<body>
    <h1>Exemplo de Reprodução de Áudio</h1>

    <audio controls>
        <source src="recursos/horse.mp3" type="audio/mpeg">
        Seu navegador não suporta o elemento de áudio.
    </audio>
</body>
</html>

```

---

### Arquivo 2: `imagens.html`

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Imagens Semânticas e Responsivas</title>
</head>
<body>
    <h1>Galeria Responsiva</h1>

    <figure>
        <img src="recursos/pizza_sm.jpg" 
             alt="Pizza de tomates frescos com manjericão"
             srcset="recursos/pizza_sm.jpg 680w,
                     recursos/pizza_md.jpg 1280w,
                     recursos/pizza_lg.jpg 1920w"
             width="700" 
             height="500">
        <figcaption>Deliciosa pizza de tomates com manjericão.</figcaption>
    </figure>
</body>
</html>

```

---

### Arquivo 3: `video.html`

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Tocador de Vídeo Native HTML5</title>
</head>
<body>
    <h1>Exemplo de Reprodução de Vídeo</h1>

    <video width="320" height="240" controls>
        <source src="recursos/movie.mp4" type="video/mp4">
        Seu navegador não suporta o elemento de vídeo.
    </video>
</body>
</html>

```

---

## 5. Desmontando o Código

### Análise do `audio.html`

* `<audio controls>`: O atributo `controls` é essencial. Se for omitido, o áudio até poderá existir na página, mas ficará completamente invisível para o usuário, pois os botões de controle não serão desenhados.
* `<source src="recursos/horse.mp3" type="audio/mpeg">`: Usar a tag `<source>` é uma boa prática superior a colocar o `src` direto no `<audio>`, pois permite declarar múltiplos formatos (como MP3 e OGG) para garantir compatibilidade com qualquer navegador.

### Análise do `imagens.html`

* `<figure>` e `<figcaption>`: Agrupam a imagem e seu texto descritivo. Isso ajuda robôs de busca e leitores de tela a entenderem que aquele texto pertence especificamente àquela imagem.
* `srcset="recursos/pizza_sm.jpg 680w, ..."`: A letra `w` indica a largura física da imagem em pixels. Não confunda com a largura de exibição em tela (`width="700"`). O valor `680w` diz: *"Esta imagem possui 680 pixels de largura interna"*.

### Análise do `video.html`

* `<video width="320" height="240" controls>`: Além dos controles visuais, definir `width` e `height` evita o problema de "salto de layout" (*Layout Shift*), reservando o espaço do vídeo na tela antes mesmo dele carregar.

---

## 6. Passo a Passo: Organizando as Mídias no Projeto

1. **Criar a estrutura de pastas**:
* Na raiz do projeto, crie a pasta de arquivos e crie uma subpasta chamada `recursos/` para armazenar todas as mídias.


2. **Adicionar os arquivos de mídia**:
* Salve o áudio `horse.mp3` em `recursos/`.
* Salve as três versões da imagem (`pizza_sm.jpg`, `pizza_md.jpg`, `pizza_lg.jpg`) na pasta `recursos/`.
* Salve o vídeo `movie.mp4` na pasta `recursos/`.


3. **Criar os documentos HTML**:
* Crie os arquivos `audio.html`, `imagens.html` e `video.html` na raiz da pasta principal (fora da pasta `recursos`).


4. **Validar os caminhos**:
* Certifique-se de referenciar os caminhos como `recursos/nome-do-arquivo.extensao` nos atributos `src` e `srcset`.



---

## 7. Tabelas Comparativas

### Tabela 1: Tags de Mídia em HTML5

| Tag | Função | Requer Fechamento? | Conteúdo Principal |
| --- | --- | --- | --- |
| `<audio>` | Player de áudio | Sim (`</audio>`) | Tags `<source>` e texto de reserva. |
| `<video>` | Player de vídeo | Sim (`</video>`) | Tags `<source>` e texto de reserva. |
| `<source>` | Especifica a fonte da mídia | Não (Auto-fechável) | Atributos `src` e `type`. |
| `<figure>` | Container semântico de mídia | Sim (`</figure>`) | Imagens (`<img>`), gráficos e `<figcaption>`. |
| `<figcaption>` | Legenda da mídia | Sim (`</figcaption>`) | Texto descritivo da imagem ou figura. |

### Tabela 2: Atributos de Player de Mídia (`<audio>` e `<video>`)

| Atributo | Tipo | O que faz? |
| --- | --- | --- |
| `controls` | Booleano | Exibe a barra com botões de controle de mídia. |
| `autoplay` | Booleano | Inicia a reprodução automaticamente (bloqueado por padrão em navegadores modernos se houver áudio). |
| `loop` | Booleano | Reinicia a mídia em ciclo contínuo após terminar. |
| `muted` | Booleano | Inicia a mídia sem som (mudo). |
| `poster` | Texto | *(Exclusivo para vídeo)* Define uma imagem de capa antes do play. |

### Tabela 3: Formatos e MIME Types Comuns

| Mídia | Extensão | Valor do atributo `type` |
| --- | --- | --- |
| **Áudio** | `.mp3` | `audio/mpeg` |
| **Áudio** | `.ogg` | `audio/ogg` |
| **Áudio** | `.wav` | `audio/wav` |
| **Vídeo** | `.mp4` | `video/mp4` |
| **Vídeo** | `.webm` | `video/webm` |

---

## 8. Erros Comuns e Cuidados

1. **Escrever tags e atributos colados**:
* ❌ *Incorreto*: `<audiocontrols>`, `<imgsrc="...">`, `<videowidth="320">`
* ✔️ *Correto*: `<audio controls>`, `<img src="...">`, `<video width="320">`


2. **Esquecer o atributo `controls**`:
* Sem o atributo `controls`, o áudio ou vídeo não exibirá os botões de Play/Pause na tela.


3. **Errar a extensão do arquivo no nome do arquivo HTML**:
* ❌ *Incorreto*: Salvar como `video.htlm`.
* ✔️ *Correto*: Salvar como `video.html`.


4. **Confundir a unidade `w` do `srcset` com `px**`:
* ❌ *Incorreto*: `srcset="foto.jpg 680px"`
* ✔️ *Correto*: `srcset="foto.jpg 680w"` (o `w` representa a largura interna da imagem para cálculo do navegador).



---

## 9. Correções Técnicas das Minhas Anotações

* **Tags/Atributos Grudados**: Corrigi todas as ocorrências no rascunho original onde as tags e atributos estavam sem espaço (`<!DOCTYPEhtml>`, `<audiocontrols>`, `<sourcesrc=`, `<imgsrc=`, `<videowidth=`).
* **Sintaxe da Tag de Áudio**: No rascunho original, a tag de abertura estava escrita incorretamente como `<audiocontrols>`. A sintaxe correta é a tag `<audio>` com o atributo `controls` separado por espaço: `<audio controls>`.
* **Sintaxe da Tag de Vídeo**: Ajustada a tag `<videowidth="320"...>` para `<video width="320"...>`.
* **Nome de Arquivo**: Corrigido o erro de digitação `video.htlm` para `video.html`.
* **Atributo Obsoleto**: Removi o atributo `name="pizza"` da tag `<img>` no exemplo de imagens, pois o uso de `name` em imagens foi descontinuado no HTML5.
* **Estrutura HTML5**: Adicionei o cabeçalho completo padrão (`<!DOCTYPE html>`, `<html lang="pt-BR">`, `<head>`, `<meta charset="UTF-8">`) nos três arquivos.

---

## 10. Aprofundamento e Boas Práticas (Conteúdo Complementar)

### Política de Reprodução Automática (*Autoplay Policy*)

Navegadores modernos (como Chrome, Edge e Safari) **bloqueiam** a reprodução automática de áudios e vídeos que contêm som para não assustar o usuário.

* Se você precisar que um vídeo inicie automaticamente em segundo plano (como um banner), é obrigatório utilizar o atributo `muted` junto com `autoplay`:

```html
<video autoplay muted loop>
    <source src="recursos/banner.mp4" type="video/mp4">
</video>

```

### O Atributo `poster` para Vídeos

É uma boa prática adicionar uma imagem de capa aos vídeos utilizando o atributo `poster`. Essa imagem é exibida enquanto o vídeo carrega ou antes do usuário clicar no play:

```html
<video controls poster="recursos/capa-video.jpg">
    <source src="recursos/movie.mp4" type="video/mp4">
</video>

```

---

## 11. Guia Rápido de Memorização

* **Áudio com Controles**: `<audio controls><source src="som.mp3" type="audio/mpeg"></audio>`
* **Vídeo com Controles**: `<video width="320" height="240" controls><source src="video.mp4" type="video/mp4"></video>`
* **Imagem com Legenda**: `<figure><img src="foto.jpg" alt="..."><figcaption>Legenda</figcaption></figure>`
* **Imagem Responsiva**: `<img src="p.jpg" srcset="p.jpg 680w, g.jpg 1920w" alt="...">`

---

## 12. Resumo Relâmpago — 10 Linhas

1. O HTML5 trouxe suporte nativo para áudio e vídeo sem a necessidade de plugins ou extensões externas.
2. A tag `<audio>` cria um tocador de áudio e exige o atributo `controls` para exibir os botões na tela.
3. A tag `<video>` cria um player de vídeo, permitindo definir dimensões com `width` e `height`.
4. A tag `<source>` especifica o caminho do arquivo (`src`) e seu formato MIME (`type`).
5. Textos dentro de `<audio>` e `<video>` servem como fallback para navegadores antigos que não suportam HTML5.
6. A tag semântica `<figure>` agrupa imagens ou mídias com um propósito comum na página.
7. A tag `<figcaption>` define a legenda descritiva da mídia dentro de uma `<figure>`.
8. O atributo `srcset` permite disponibilizar múltiplos tamanhos de uma imagem usando descritores de largura (`w`).
9. O navegador escolhe automaticamente a melhor imagem do `srcset` com base na tela do usuário para economizar dados.
10. Vídeos com o atributo `autoplay` só rodam automaticamente nos navegadores se acompanhados do atributo `muted`.
