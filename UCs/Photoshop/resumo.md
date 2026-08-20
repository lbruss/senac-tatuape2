# 🎨 Photoshop — Grande Resumo das Aulas

## Ideia Principal

Nessas aulas, aprofundei o uso do **Adobe Photoshop** para criar composições mais profissionais, trabalhar com seleções e recortes, organizar camadas, aplicar efeitos e realizar edições de forma **mais precisa e não destrutiva**.

Os principais conceitos estudados foram:

* composição visual;
* organização de camadas;
* Seleção de Objeto;
* Seleção Rápida;
* Laço Poligonal;
* Ferramenta Caneta;
* caminhos vetoriais;
* conversão de caminhos em seleções;
* Máscara de Recorte;
* Máscara de Camada;
* Máscara Rápida;
* Borracha;
* Desfoque Gaussiano;
* Ferramenta Carimbo;
* Carimbo de Padronagem;
* opacidade e dureza;
* transparência;
* edição destrutiva e não destrutiva.

O ponto mais importante dessas aulas foi entender que o Photoshop não serve apenas para **apagar ou modificar imagens**, mas principalmente para **controlar exatamente o que aparece, onde aparece e como os elementos se misturam**.

---

# 1. Composição Visual

## O que é composição visual?

Composição visual é a maneira como os elementos são organizados dentro de uma arte.

Uma composição pode envolver:

* imagens;
* textos;
* formas;
* cores;
* sombras;
* efeitos;
* fundos;
* logotipos;
* texturas.

Uma boa composição precisa criar:

* **equilíbrio**;
* **hierarquia visual**;
* **destaque**;
* **harmonia**;
* **profundidade**.

### Exemplo

Em um cartão de cafeteria:

```text
Texto
↓
Xícara
↓
Grãos de café
↓
Pôr do sol
```

Cada elemento possui uma função diferente.

A xícara pode ser o elemento principal, os grãos podem funcionar como textura e o pôr do sol como plano de fundo.

---

# 2. Organização das Camadas

As camadas são fundamentais para trabalhar com várias imagens.

Uma boa forma de entender é imaginar **folhas transparentes empilhadas**.

A camada que está mais acima aparece na frente.

A camada que está mais abaixo aparece atrás.

### Exemplo:

```text
Camada 1 → Xícara
Camada 2 → Grãos de café
Camada 3 → Pôr do sol
```

Visualmente:

```text
        Xícara
          ↓
     Grãos de café
          ↓
      Pôr do sol
```

O Photoshop utiliza essa ordem para determinar quais elementos ficam visíveis sobre os outros.

### Conceito importante

A organização das camadas facilita:

* edição;
* movimentação dos elementos;
* aplicação de efeitos;
* criação de máscaras;
* alteração da composição;
* manutenção do arquivo organizado.

---

# 3. Projeto do Cartão de Cafeteria

Um dos principais exercícios foi criar uma composição utilizando:

* grãos de café;
* xícara de café;
* pôr do sol;
* textos;
* elementos decorativos.

A estrutura utilizada foi:

```text
Xícara de café
↓
Grãos de café
↓
Pôr do sol
```

A xícara funciona como elemento principal.

Os grãos criam textura.

O pôr do sol funciona como fundo.

Essa organização cria uma composição com maior sensação de profundidade.

---

# 4 Ferramenta Seleção de Objeto

A **Seleção de Objeto** utiliza recursos automáticos do Photoshop para identificar objetos dentro de uma imagem.

Ela consegue reconhecer elementos como:

* pessoas;
* animais;
* carros;
* copos;
* xícaras;
* produtos;
* diversos objetos.

### Acesso

A ferramenta fica agrupada com outras ferramentas de seleção.

Um caminho comum é:

```text
Grupo da Varinha Mágica
↓
Segurar o clique
↓
Seleção de Objeto
```

---

## Como utilizar?

Por exemplo, para recortar uma xícara:

```text
Selecionar Seleção de Objeto
↓
Selecionar a xícara
↓
Photoshop identifica o objeto
↓
Xícara fica selecionada
```

O Photoshop tenta identificar automaticamente os limites da xícara.

Isso economiza bastante tempo em comparação com uma seleção completamente manual.

---

# 5. Inverter Seleção

Depois de selecionar a xícara, o objetivo pode ser remover o fundo.

Nesse caso, precisamos selecionar o contrário daquilo que foi selecionado.

### Atalho

```text
Ctrl + Shift + I
```

Esse comando **inverte a seleção atual**.

### Antes

```text
Selecionado:
Xícara
```

### Depois

```text
Selecionado:
Fundo
```

Assim, podemos editar o fundo sem afetar diretamente a xícara.

---

# 6. Remoção de Fundo

Depois de inverter a seleção:

```text
Ctrl + Shift + I
↓
Fundo selecionado
↓
Delete
```

O fundo será removido.

A xícara permanecerá.

Quando o fundo é removido, aparece o famoso padrão quadriculado:

```text
▦ ▦ ▦ ▦
```

Esse padrão representa:

> **Transparência**

Ou seja, naquela região não existem pixels visíveis da camada.

---

# 7. Ferramenta Borracha

A Borracha permite remover pixels diretamente de uma camada.

Porém, é importante entender que essa é uma abordagem **destrutiva**.

Quando apagamos pixels com a Borracha, eles são removidos da camada.

Por isso, em trabalhos profissionais, muitas vezes é melhor utilizar **Máscara de Camada**.

---

## Dureza da Borracha

A dureza determina o quanto a borda da borracha será definida.

### Dureza alta

```text
Borda mais definida
```

### Dureza baixa

```text
Borda mais suave
```

Na atividade foi utilizada:

```text
Dureza = 0%
```

Isso cria uma borda extremamente suave.

### Analogia

Imagine duas borrachas:

```text
Borracha dura
→ corta de forma brusca
```

```text
Borracha macia
→ apaga gradualmente
```

A dureza `0%` funciona de maneira semelhante à segunda opção.

---

# 8. Opacidade da Borracha

A opacidade controla a intensidade do apagamento.

### Exemplos:

```text
100%
↓
Apagamento completo
```

```text
50%
↓
Apagamento parcial
```

Utilizar uma opacidade menor permite criar transições mais suaves.

Em vez de:

```text
GRÃOS
========
FUNDO
```

podemos criar:

```text
GRÃOS
↓↓↓↓
Transição
↓↓↓↓
FUNDO
```

Isso deixa a composição mais natural.

---

# 9. Plano de Fundo

Na composição do cartão, o pôr do sol foi colocado atrás dos outros elementos.

A estrutura ficou:

```text
Xícara
↓
Grãos
↓
Pôr do sol
```

O pôr do sol funciona como **background**.

Se ele estivesse acima:

```text
Pôr do sol
↓
Grãos
↓
Xícara
```

poderia esconder os elementos que deveriam aparecer na frente.

---

# 10. Ferramenta Caneta

A **Ferramenta Caneta (Pen Tool)** é uma das ferramentas mais importantes para criar recortes precisos.

Ela pode ser utilizada para:

* criar linhas;
* criar curvas;
* criar contornos;
* criar caminhos vetoriais;
* criar seleções precisas;
* recortar produtos;
* trabalhar com logotipos;
* criar ilustrações.

---

## Caminho

Antes de utilizar a Caneta para esse tipo de trabalho, é importante verificar se o modo está configurado como:

```text
Caminho
```

Nesse modo, a ferramenta cria um **caminho vetorial**.

---

# 11. Pontos de Ancoragem

Cada clique realizado com a Caneta cria um:

```text
Ponto de ancoragem
```

Exemplo:

```text
●────────●────────●
```

O Photoshop conecta os pontos formando o caminho.

---

## Linhas retas

Para criar uma linha reta:

```text
Clique
↓
Clique
```

O Photoshop conecta os dois pontos.

---

## Curvas

Para criar uma curva:

```text
Clique
↓
Segurar o botão
↓
Arrastar
```

Isso cria **alças de controle**.

As alças controlam:

* direção;
* intensidade;
* suavidade da curva.

### Analogia

Podemos imaginar um arame flexível:

* pontos de ancoragem = pontos onde seguramos o arame;
* alças = forças que puxam o arame;
* caminho = o formato final do arame.

---

# 12. Recorte Preciso com a Caneta

A grande vantagem da Caneta é a precisão.

Ferramentas automáticas tentam identificar os limites do objeto.

A Caneta permite que nós mesmos definamos exatamente onde o contorno deve passar.

### Fluxo:

```text
Caneta
↓
Criar caminho
↓
Contornar objeto
↓
Criar seleção
↓
Inverter seleção
↓
Editar fundo
```

---

# 13. Caminho × Seleção

Essa diferença é fundamental.

## Caminho

* é vetorial;
* funciona como um contorno;
* pode ser editado;
* não modifica diretamente a imagem;
* pode ser convertido em seleção.

## Seleção

* define uma área da imagem;
* determina onde a edição será aplicada;
* é representada pelas chamadas "formigas marchando".

### Fluxo correto

```text
Caminho
↓
Criar Seleção
↓
Seleção ativa
↓
Edição
```

Portanto:

> **A Caneta cria o caminho; a seleção define a região que será editada.**

---

# 14. Criar Seleção a partir do Caminho

Depois de terminar o contorno:

```text
Botão direito sobre o caminho
↓
Criar Seleção...
↓
OK
```

O Photoshop transforma o caminho em uma seleção.

A partir daí, podemos utilizar:

```text
Ctrl + Shift + I
```

para inverter a seleção.

---

# 15. Máscara de Recorte — Clipping Mask

A **Máscara de Recorte** faz uma imagem aparecer somente dentro dos limites de outra camada.

É como colocar uma fotografia dentro de um molde.

### Estrutura:

```text
Imagem
↓
Forma
```

A imagem precisa estar **acima** da forma.

### Atalho:

```text
Ctrl + Alt + G
```

---

## Exemplo

Se a forma for um círculo:

```text
Imagem inteira
       ↓
┌─────────────┐
│   CÍRCULO   │
└─────────────┘
```

Somente a parte da imagem que estiver dentro do círculo ficará visível.

A imagem original não é apagada.

---

## Para que serve?

A Máscara de Recorte pode ser utilizada em:

* cartões;
* banners;
* posts;
* capas;
* apresentações;
* layouts;
* montagens.

---

# 16. Seleção Rápida

A **Seleção Rápida** é outra ferramenta utilizada para selecionar áreas da imagem.

Ela analisa características como:

* bordas;
* contraste;
* textura;
* diferenças de cor.

Diferentemente da Varinha Mágica, que trabalha muito baseada em áreas de cor semelhante, a Seleção Rápida consegue acompanhar melhor os limites de determinados objetos.

---

# 17. Varinha Mágica × Seleção Rápida

| Ferramenta            | Principal utilização                           |
| --------------------- | ---------------------------------------------- |
| **Varinha Mágica**    | Áreas com cores semelhantes                    |
| **Seleção Rápida**    | Objetos utilizando bordas, contraste e textura |
| **Seleção de Objeto** | Identificação automática de objetos            |
| **Laço Poligonal**    | Seleções com linhas retas                      |

---

# 18. Laço Poligonal

O **Laço Poligonal** cria seleções utilizando segmentos retos.

Cada clique cria um novo ponto.

Exemplo:

```text
Clique
↓
Clique
↓
Clique
↓
Clique
```

O Photoshop conecta os pontos.

---

## Quando utilizar?

É excelente para objetos com bordas retas, como:

* prédios;
* caixas;
* livros;
* celulares;
* computadores;
* placas;
* mesas.

---

## Corrigindo um ponto

Se o último ponto estiver errado:

```text
Delete
```

remove o último ponto criado.

Isso permite corrigir rapidamente o contorno.

---

# 19. Desfoque Gaussiano

O **Desfoque Gaussiano (Gaussian Blur)** é um filtro utilizado para reduzir a nitidez de uma imagem ou de uma área específica.

### Caminho:

```text
Filtro
↓
Desfoque
↓
Desfoque Gaussiano
```

Primeiro selecionamos a área que queremos desfocar.

Depois aplicamos o filtro.

---

## Exemplo

Imagine uma pessoa em primeiro plano:

```text
Pessoa → nítida
Fundo → desfocado
```

Isso cria uma sensação de **profundidade de campo**.

---

## Utilizações

O Desfoque Gaussiano pode ser usado para:

* destacar objetos;
* desfocar fundos;
* criar profundidade;
* suavizar imperfeições;
* ocultar informações;
* criar efeitos visuais.

---

# 20. Máscara de Camada

A **Máscara de Camada (Layer Mask)** é uma das ferramentas mais importantes para edição profissional.

Ela permite:

> **Esconder ou mostrar partes de uma camada sem apagar os pixels originais.**

Isso torna a edição **não destrutiva**.

---

## Como adicionar

```text
Selecionar camada
↓
Adicionar Máscara de Camada
```

Uma miniatura branca aparece ao lado da imagem.

Essa miniatura representa a máscara.

---

# 21. ⚫ Preto, Branco e Cinza na Máscara

Existe uma regra fundamental:

| Cor      | Resultado           |
| -------- | ------------------- |
| ⚪ Branco | Mostra a imagem     |
| ⚫ Preto  | Esconde a imagem    |
| Cinza    | Mostra parcialmente |

### Preto

```text
Preto
↓
Esconde
```

### Branco

```text
Branco
↓
Revela
```

### Cinza

```text
Cinza
↓
Transparência parcial
```

Quanto mais escuro o cinza, menos visível fica a imagem.

Quanto mais claro, mais visível.

---

# 22. Edição Não Destrutiva

Esse é um dos conceitos mais importantes do Photoshop.

### Edição destrutiva

Modifica ou remove os pixels diretamente.

Exemplos:

```text
Borracha
Delete
```

Se os pixels forem apagados, recuperar a informação pode ser mais difícil.

### Edição não destrutiva

Oculta ou modifica a visualização sem destruir os pixels originais.

Exemplo:

```text
Máscara de Camada
```

Por isso, sempre que possível, é melhor utilizar máscaras em vez de apagar definitivamente.

---

# 23. Modo Máscara Rápida

O **Modo Máscara Rápida (Quick Mask)** permite criar seleções utilizando um pincel.

Ao ativá-lo, aparece normalmente uma sobreposição colorida, geralmente avermelhada.

Essa área funciona como uma representação visual da máscara.

A imagem original não é modificada.

---

## Como funciona?

```text
Ativar Máscara Rápida
↓
Pintar com Pincel
↓
Ajustar a área
↓
Desativar Máscara Rápida
↓
Pintura vira seleção
```

Isso oferece bastante controle sobre áreas complexas.

---

## Quando utilizar?

É útil para:

* cabelos;
* folhas;
* árvores;
* roupas;
* objetos irregulares;
* detalhes pequenos.

---

# 24. Máscara de Camada × Máscara Rápida

Apesar de terem nomes parecidos, possuem funções diferentes.

| Ferramenta            | Função                                       |
| --------------------- | -------------------------------------------- |
| **Máscara de Camada** | Esconde/revela partes da camada              |
| **Máscara Rápida**    | Cria e ajusta uma seleção utilizando pintura |

Essa diferença é fundamental.

---

# 25. Ferramenta Carimbo — Clone Stamp

A **Ferramenta Carimbo** copia pixels de uma região da imagem e os reproduz em outra.

Ela é uma ferramenta de **clonagem e retoque**.

---

## Como definir a origem?

Utilizamos:

```text
Alt + Clique
```

O ponto clicado passa a ser a origem da clonagem.

Depois:

```text
Soltar Alt
↓
Pintar em outra região
```

O Photoshop reproduz os pixels da área de origem.

---

# 26. Para que serve o Carimbo?

A ferramenta é muito utilizada para:

* remover objetos;
* remover fios;
* remover manchas;
* restaurar fotografias;
* corrigir imperfeições;
* duplicar detalhes.

### Exemplo

Imagine um poste em uma paisagem.

Podemos:

```text
Copiar grama ao lado
↓
Pintar sobre o poste
↓
Poste desaparece visualmente
```

O resultado depende muito da escolha correta da origem.

---

# 27. Tamanho, Dureza e Opacidade do Carimbo

Assim como outras ferramentas baseadas em pincel, o Carimbo possui controles importantes.

### Tamanho

```text
Maior → maior área clonada
Menor → maior precisão
```

### Dureza

```text
Alta → borda mais marcada
Baixa → borda mais suave
```

### Opacidade

Controla a intensidade do efeito.

Esses controles são fundamentais para que a clonagem não fique artificial.

---

# 28. Carimbo de Padronagem

O **Carimbo de Padronagem (Pattern Stamp Tool)** possui uma função diferente.

Ele não copia pixels de uma área específica da imagem.

Em vez disso, utiliza um:

```text
Padrão (Pattern)
```

---

## O que é um padrão?

É uma imagem que pode ser repetida continuamente.

### Analogia

Imagine um piso de cerâmica:

```text
🟦 🟦 🟦 🟦
🟦 🟦 🟦 🟦
🟦 🟦 🟦 🟦
```

Cada peça é repetida.

O Photoshop funciona de maneira semelhante quando utiliza um Pattern.

---

# 29. Criando um Padrão Personalizado

Uma imagem pode ser transformada em padrão.

Caminho:

```text
Editar
↓
Definir Padrão...
↓
Escolher nome
↓
Confirmar
```

Depois disso, o padrão fica disponível na biblioteca de padrões.

---

# 30. Utilizando o Carimbo de Padronagem

Depois de criar o padrão:

```text
Selecionar Carimbo de Padronagem
↓
Escolher o Pattern
↓
Pintar
```

O Photoshop repete o padrão continuamente.

---

## Aplicações

Pode ser utilizado para criar:

* texturas;
* fundos;
* papéis de parede;
* estampas;
* efeitos decorativos;
* composições gráficas.

---

# 31. Carimbo × Carimbo de Padronagem

| Ferramenta                | O que faz                             |
| ------------------------- | ------------------------------------- |
| **Carimbo**               | Copia pixels de uma região da imagem  |
| **Carimbo de Padronagem** | Pinta utilizando um padrão repetitivo |

A diferença principal é a **origem do conteúdo utilizado para pintar**.

### Carimbo

```text
Imagem original
↓
Área escolhida
↓
Clonagem
```

### Carimbo de Padronagem

```text
Pattern
↓
Repetição
↓
Preenchimento
```

---

# 32. Relação entre os principais conceitos

As ferramentas estudadas não são isoladas. Elas podem ser combinadas.

Por exemplo, para fazer um recorte profissional:

```text
Seleção de Objeto
        ↓
   Seleção inicial
        ↓
Ctrl + Shift + I
        ↓
   Fundo selecionado
```

Ou:

```text
Caneta
↓
Caminho vetorial
↓
Criar Seleção
↓
Ctrl + Shift + I
↓
Fundo selecionado
↓
Editar
```

Para uma edição não destrutiva:

```text
Seleção
↓
Máscara de Camada
↓
Preto → esconde
Branco → revela
Cinza → transparência parcial
```

Para criar profundidade:

```text
Seleção
↓
Desfoque Gaussiano
↓
Área menos nítida
↓
Objeto principal em destaque
```

Para corrigir detalhes:

```text
Carimbo
↓
Alt + Clique
↓
Definir origem
↓
Clonar pixels
```

---

# 33. Conceitos Fundamentais

## Seleção

Define **qual região será editada**.

```text
Seleção
↓
Área protegida/afetada
```

---

## Caminho

É um contorno vetorial criado principalmente pela Caneta.

```text
Caneta
↓
Caminho
↓
Criar Seleção
```

---

## Máscara de Camada

Controla a visibilidade sem destruir os pixels.

```text
Branco → mostra
Preto → esconde
Cinza → parcial
```

---

## Máscara de Recorte

Faz uma camada aparecer somente dentro dos limites de outra.

```text
Imagem
↓
Forma
```

---

## Máscara Rápida

Permite criar uma seleção utilizando pintura.

```text
Pincel
↓
Máscara Rápida
↓
Seleção
```

---

## Borracha

Remove pixels diretamente.

```text
Borracha
↓
Pixels removidos
```

É uma ferramenta destrutiva.

---

## Carimbo

Copia pixels de uma região para outra.

```text
Alt + Clique
↓
Origem
↓
Pintar
↓
Clonagem
```

---

## Carimbo de Padronagem

Utiliza um padrão repetitivo.

```text
Pattern
↓
Repetição
↓
Preenchimento
```

---

# 34. Quando utilizar cada ferramenta?

| Situação                               | Ferramenta recomendada    |
| -------------------------------------- | ------------------------- |
| Selecionar uma cor semelhante          | **Varinha Mágica**        |
| Selecionar rapidamente uma área/objeto | **Seleção Rápida**        |
| Detectar um objeto automaticamente     | **Seleção de Objeto**     |
| Selecionar objetos com linhas retas    | **Laço Poligonal**        |
| Fazer recorte extremamente preciso     | **Caneta**                |
| Esconder partes sem apagar             | **Máscara de Camada**     |
| Criar uma seleção pintando             | **Máscara Rápida**        |
| Colocar imagem dentro de uma forma     | **Máscara de Recorte**    |
| Desfocar uma região                    | **Desfoque Gaussiano**    |
| Copiar pixels de outra região          | **Carimbo**               |
| Criar preenchimentos repetitivos       | **Carimbo de Padronagem** |
| Apagar pixels diretamente              | **Borracha**              |

---

# 35. Passo a Passo Geral — Fluxo de Trabalho

Um fluxo profissional de edição pode seguir esta lógica:

### 1. Importar as imagens

```text
Imagem → Photoshop
```

### 2. Organizar as camadas

Definir o que ficará:

```text
Frente
↓
Meio
↓
Fundo
```

### 3. Fazer as seleções

Escolher a ferramenta adequada:

```text
Seleção de Objeto
Seleção Rápida
Laço Poligonal
Caneta
```

### 4. Corrigir a seleção

Quando necessário:

```text
Ctrl + Shift + I
```

para inverter.

### 5. Escolher entre edição destrutiva ou não destrutiva

Preferencialmente:

```text
Máscara de Camada
```

em vez de apagar pixels.

### 6. Criar efeitos

Podemos utilizar:

```text
Desfoque
Opacidade
Transparência
```

### 7. Fazer retoques

Utilizar:

```text
Carimbo
```

quando for necessário clonar partes da imagem.

### 8. Criar texturas

Utilizar:

```text
Definir Padrão
↓
Carimbo de Padronagem
```

### 9. Organizar a composição

Verificar:

* posição;
* tamanho;
* profundidade;
* equilíbrio;
* contraste;
* hierarquia visual.

### 10. Finalizar a arte

Adicionar:

* textos;
* sombras;
* formas;
* cores;
* logotipo;
* elementos decorativos.

---

# 36. Boas Práticas no Photoshop

## Trabalhar com precisão

Quando estiver utilizando a Caneta ou o Carimbo:

```text
Aumentar o zoom
↓
Trabalhar com precisão
↓
Reduzir o zoom
↓
Conferir o resultado geral
```

---

## Usar poucos pontos na Caneta

Em curvas suaves, não é necessário colocar muitos pontos.

Muitos pontos podem deixar o caminho:

* difícil de editar;
* irregular;
* menos natural.

É melhor utilizar poucos pontos bem posicionados.

---

## Preservar o original

Sempre que possível:

```text
Imagem original
↓
Duplicar camada
↓
Editar a cópia
```

Isso permite voltar ao original caso alguma coisa dê errado.

---

## Preferir máscaras

Quando a intenção for apenas esconder uma parte da imagem:

```text
Máscara de Camada
```

é geralmente melhor do que:

```text
Borracha
```

porque mantém os pixels originais.

---

# 37. Conceito Mais Importante das Duas Partes

O Photoshop trabalha muito com a ideia de:

> **"Não destruir a informação original quando não for necessário."**

Por isso, é importante diferenciar:

```text
APAGAR
```

de:

```text
ESCONDER
```

### Apagar

```text
Borracha
↓
Pixels removidos
```

### Esconder

```text
Máscara
↓
Pixels preservados
↓
Visibilidade alterada
```

Essa diferença representa uma mudança importante entre uma edição mais básica e um fluxo de trabalho mais profissional.

---

**Resumo Relâmpago**

1. **Camadas** organizam os elementos da composição, e as camadas superiores aparecem na frente.
2. A **Seleção de Objeto** identifica automaticamente objetos dentro de uma imagem.
3. `Ctrl + Shift + I` **inverte a seleção**, permitindo selecionar o fundo em vez do objeto.
4. A **Caneta** cria caminhos vetoriais precisos, que podem ser convertidos em seleções.
5. A **Máscara de Recorte** faz uma imagem aparecer somente dentro dos limites de outra camada.
6. A **Máscara de Camada** esconde ou revela pixels sem apagá-los, permitindo edição não destrutiva.
7. Na máscara, **branco mostra, preto esconde e cinza cria transparência parcial**.
8. A **Máscara Rápida** permite criar seleções utilizando um pincel.
9. O **Carimbo** copia pixels de uma região para outra, enquanto o **Carimbo de Padronagem** utiliza padrões repetitivos.
10. O objetivo de um fluxo profissional é combinar **seleções, máscaras, camadas e ferramentas de retoque** preservando o máximo possível da imagem original.
