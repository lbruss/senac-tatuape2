# Máscara de Recorte, Ferramentas de Seleção e Desfoque Gaussiano

**Ideia principal**

Utilizar a **Máscara de Recorte (Clipping Mask)** para encaixar imagens dentro de formas, conheci novas ferramentas de seleção, como a **Seleção Rápida** e o **Laço Poligonal**, e aprendi a aplicar o **Desfoque Gaussiano** para desfocar apenas áreas específicas da imagem.

Esses recursos são muito utilizados em design gráfico, publicidade e edição profissional, pois permitem criar composições mais organizadas e destacar os elementos mais importantes da arte.

---

## Máscara de Recorte (Clipping Mask)

**O que é uma Máscara de Recorte?**

A **Máscara de Recorte** é um recurso que faz uma imagem aparecer **somente dentro dos limites de outra camada**, normalmente uma forma.

Na prática, a forma funciona como uma "janela", exibindo apenas a parte da imagem que está dentro dela.

> Analogia

Imagine uma fotografia colocada atrás de um molde de papel.

Você só consegue enxergar a parte da foto que aparece através do recorte desse molde.

No Photoshop acontece exatamente isso.

A forma funciona como o molde, e a imagem aparece apenas dentro dela.

---

## Colocar uma imagem dentro de uma forma

Primeiro, é necessário criar uma forma.

- **Exemplo:**

* retângulo;
* círculo;
* estrela;
* forma personalizada.

Depois:

```
Colocar a imagem em uma camada acima da forma
Selecionar a camada da imagem
Pressionar Ctrl + Alt + G
```

---

**O que acontece?**

Depois do atalho:

```
Ctrl + Alt + G
```

A imagem fica limitada ao formato da camada inferior.

Ela não desaparece.

Apenas deixa de aparecer fora dos limites da forma.

- **Exemplo**

Se a forma for um círculo:

* a imagem continua inteira;
* porém, apenas a parte que está dentro do círculo ficará visível.

O restante ficará oculto.

---

**Por que usar Máscara de Recorte?**

Ela é muito utilizada para criar:

* cartões;
* banners;
* capas;
* posts para redes sociais;
* apresentações;
* layouts profissionais.

Além disso, como a imagem original não é apagada, posso mover ou redimensionar a foto depois sem perder qualidade.

---

**Organização das camadas**

Para que a Máscara de Recorte funcione corretamente:

```
Imagem
⬇
Forma
```

A camada da imagem deve ficar **acima** da camada da forma.

Se estiver invertido, o efeito não será aplicado corretamente.

---

## Ferramenta Seleção Rápida

A **Ferramenta Seleção Rápida** fica no mesmo grupo da Varinha Mágica.

Ela permite selecionar áreas da imagem de forma muito mais inteligente.

**Como acessar**

```text
Varinha Mágica
↓
Segurar o clique
↓
Ferramenta Seleção Rápida
```

---

**Como funciona?**

Em vez de selecionar apenas uma cor, como faz a Varinha Mágica, a Seleção Rápida analisa:

* textura;
* contraste;
* bordas;
* diferenças de cor.

Isso permite selecionar objetos com muito mais facilidade.

---

**O que significa o contorno pontilhado?**

Depois da seleção, aparece uma linha pontilhada em movimento.

Essa linha é conhecida como:

```
Seleção ativa
```

Ela indica exatamente qual região será modificada.

Enquanto essa seleção existir, qualquer edição afetará apenas essa área.

---

# Desfoque Gaussiano

**O que é?**

O **Desfoque Gaussiano (Gaussian Blur)** é um filtro utilizado para desfocar uma imagem ou parte dela.

Ele cria uma transição suave entre os pixels, deixando a região menos nítida.

---

**Como aplicar**

Primeiro:

```
Selecionar a área desejada
```

Depois seguir o caminho:

```
Filtro
Desfoque
Desfoque Gaussiano
```

Em seguida, ajustar a intensidade do desfoque.

---

**O que acontece?**

O Photoshop desfoca apenas a área que estava selecionada.

O restante da imagem permanece inalterado.

---

**Para que serve?**

O Desfoque Gaussiano pode ser utilizado para:

* destacar um objeto;
* desfocar o fundo;
* esconder informações;
* suavizar imperfeições;
* criar profundidade.

- **Exemplo**

Imagine uma foto de uma pessoa.

Posso selecionar apenas o fundo e aplicar o Desfoque Gaussiano.

Assim:

* a pessoa permanece nítida;
* o fundo fica desfocado.

Esse efeito é muito comum em fotografias profissionais.

---

## Ferramenta Laço Poligonal

A **Ferramenta Laço Poligonal** é utilizada para criar seleções utilizando apenas linhas retas.

Ela é ideal para selecionar objetos com cantos retos.

---

**Como funciona?**

Cada clique cria um novo ponto de ancoragem.

O Photoshop liga automaticamente esses pontos com linhas retas.

- **Exemplo**

```
Clique
↓
Clique
↓
Clique
↓
Clique
```

Cada clique cria um novo segmento.

---

**Quando usar?**

Ela é indicada para selecionar objetos como:

* caixas;
* prédios;
* placas;
* computadores;
* celulares;
* livros;
* mesas.

Objetos com muitos lados retos ficam muito mais fáceis de selecionar com essa ferramenta.

---

**Como corrigir um erro?**

Se um ponto for colocado no lugar errado, basta pressionar:

```
Delete
```

O Photoshop remove o último ponto criado.

Assim, não é necessário começar toda a seleção novamente.

---

**Comparando as ferramentas de seleção**

| Ferramenta        | Melhor utilização                                                             |
| ----------------- | ----------------------------------------------------------------------------- |
| Varinha Mágica    | Selecionar áreas de cor semelhante.                                           |
| Seleção Rápida    | Selecionar objetos automaticamente usando textura e bordas.                   |
| Laço Poligonal    | Selecionar objetos utilizando apenas linhas retas.                            |
| Seleção de Objeto | Detectar automaticamente objetos inteiros utilizando inteligência artificial. |

---

# Passo a passo da atividade

Colocando uma imagem dentro de uma forma

**1.**

Criar uma forma.

**2.**

Adicionar uma imagem ao projeto.

**3.**

Mover a camada da imagem para cima da forma.

**4.**

Selecionar a camada da imagem.

**5.**

Pressionar:

```
Ctrl + Alt + G
```

**6.**

A imagem ficará visível apenas dentro da forma.

---

**Aplicando Desfoque Gaussiano**

**1.**

Selecionar a Ferramenta Seleção Rápida.

**2.**

Selecionar a área desejada.

***3.**

Verificar se apareceu a linha pontilhada.

**4.**

Ir em:

```text
Filtro
Desfoque
Desfoque Gaussiano
```

**5.**

Ajustar a intensidade do desfoque.

**6.**

Confirmar.

---

**Utilizando o Laço Poligonal**

**1.**

Selecionar a ferramenta.

**2.**

Criar pontos clicando sobre a imagem.

**3.**

Cada clique gera uma linha reta.

**4.**

Fechar a seleção no ponto inicial.

**5.**

Caso erre um ponto, pressionar:

```
Delete
```

para remover apenas o último ponto.

---

**Dicas importantes**

* A Máscara de Recorte **não apaga** a imagem; ela apenas oculta as partes que ficam fora da forma.
* A camada da imagem deve estar **acima** da forma para que `Ctrl + Alt + G` funcione corretamente.
* O Desfoque Gaussiano afeta apenas a área selecionada, permitindo criar destaque e profundidade na composição.
* A Seleção Rápida costuma ser mais eficiente do que a Varinha Mágica em imagens com muitos detalhes.
* O Laço Poligonal é excelente para objetos com bordas retas e permite corrigir erros rapidamente usando `Delete`.

---

# Em resumo

Nesta aula aprendi a utilizar a Máscara de Recorte para encaixar imagens dentro de formas, organizando corretamente as camadas e utilizando o atalho `Ctrl + Alt + G`. Também conheci a Ferramenta Seleção Rápida, que seleciona objetos analisando bordas e texturas, e aprendi a aplicar o filtro Desfoque Gaussiano para desfocar apenas regiões específicas da imagem. Além disso, utilizei o Laço Poligonal para criar seleções com linhas retas, entendendo quando essa ferramenta é mais indicada e como corrigir erros durante a seleção.

---
**Resumo Relâmpago**

1. A Máscara de Recorte faz a imagem aparecer apenas dentro de uma forma.
2. A imagem deve ficar acima da forma na ordem das camadas.
3. O atalho `Ctrl + Alt + G` cria a Máscara de Recorte.
4. A Máscara de Recorte não apaga a imagem, apenas oculta as partes externas.
5. A Seleção Rápida identifica objetos usando textura, contraste e bordas.
6. A linha pontilhada indica que existe uma seleção ativa.
7. O Desfoque Gaussiano desfoca apenas a área selecionada.
8. Esse filtro é muito usado para destacar objetos e criar profundidade.
9. O Laço Poligonal cria seleções utilizando apenas linhas retas.
10. Se errar um ponto no Laço Poligonal, basta pressionar `Delete` para remover o último ponto.
