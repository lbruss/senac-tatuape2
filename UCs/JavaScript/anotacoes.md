# Funções com Lógica Condicional, Validação de Formulários no DOM e Objetos em JavaScript

---

**Visão Geral**

Nesta aula, avancei significativamente na construção de aplicações web interativas e seguras. O foco esteve em três pilares do desenvolvimento Front-end: **tomada de decisão dentro de funções**, **validação de formulários no DOM antes do envio de dados** e **criação de Objetos em JavaScript** agrupando propriedades e métodos.

* **O que é:**

* *Funções com Condicionais:* Funções que processam informações e retornam respostas diferentes de acordo com regras de negócio (`if/else`).

* *Validação de Formulários:* Interceptação do envio de dados de um formulário HTML via JavaScript para verificar se todos os campos foram preenchidos corretamente.

* *Objetos:* Estrutura de dados que agrupa variáveis (propriedades) e funções (métodos) relacionadas a uma mesma entidade em um único bloco.


* **Para que serve:**
* Evita o envio de formulários incompletos ou com dados inválidos para o servidor, economizando reprocessamento e melhorando a experiência do usuário (*UX*).
* Permite modelar coisas do mundo real no código (como uma Pessoa, Carro ou Produto) organizando dados e comportamentos juntos.


* **Por que é importante:** Todo site moderno possui formulários (cadastro, login, checkout) e utiliza objetos para manipular dados complexos. Dominar a validação e a manipulação de objetos é requisito básico no mercado de TI.
* **Ideia principal da aula:** Aprender a usar o parâmetro `this` para passar o formulário inteiro para uma função de validação, entender o papel do `return false` para bloquear envios incorretos e dominar a criação de objetos literais com o uso da palavra-chave `this`.

---

**Entendendo o Conceito**

## Validação de Formulários no DOM

Quando o usuário clica no botão "Enviar" de um formulário, o navegador tenta disparar uma requisição HTTP (`POST` ou `GET`). Com o JavaScript, nós colocamos um "guarda de trânsito" no evento `onsubmit` do formulário.

```
[ Usuário clica em 'Enviar' ] ───► [ evento onsubmit dispara ]
                                                │
                                                ▼
                                    [ Função VerificaForm() ]
                                                │
                          ┌─────────────────────┴─────────────────────┐
                          ▼                                           ▼
                 (Campos Inválidos)                           (Campos Validos)
                          │                                           │
             [ alert() + field.focus() ]                     [ return true ]
                          │                                           │
                   [ return false ]                                   ▼
                          │                                [ Formulário Enviado ]
                          ▼
             [ Envio BLOQUEADO pelo JS ]

```

## Objetos em JavaScript (Propriedades e Métodos)

Em vez de ter 15 variáveis soltas no código (`nome`, `sobrenome`, `idade`, `cidade`...), agrupamos tudo em uma única variável complexa chamada **Objeto**.

```
Objeto: 'pessoa'
 ├── Propriedades (Características / Variáveis):
 │    ├── nome: 'Jorge'
 │    ├── idade: 34
 │    └── cidade: 'São Paulo'
 └── Métodos (Ações / Funções internas):
      ├── nomeCompleto() ──► Junta nome + sobrenome
      └── endCompleto()  ──► Formata o endereço completo

```

> Analogia do Cotidiano

* **Validação de Formulário:** Pense no **portão de embarque de um aeroporto**. O funcionário checa seu documento. Se faltar a passagem ou a identidade (`campo vazio`), ele te avisa (`alert`), aponta onde você deve ir (`focus`) e **não deixa você passar** (`return false`). Se estiver tudo certo, ele libera a sua entrada (`return true`).

* **Objetos:** Pense no seu **documento de identidade (RG)**. O papel é o Objeto. Nome, data de nascimento e CPF são as **propriedades**. A foto e a assinatura digitalizada que confirmam quem você é funcionam como **métodos**.

---

## Conceitos Fundamentais

**Funções com Retorno Condicional**

Uma função pode conter estruturas `if/else` internas para determinar qual valor será devolvido pelo `return`.

* Assim que a execução atinge uma linha `return`, a função é **encerrada imediatamente**, ignorando qualquer código abaixo.

---

**Interceptação e Validação de Formulários (`onsubmit`)**

* **`onsubmit="return MinhaFuncao(this);"`**: Evento do HTML disparado ao enviar o formulário. A palavra `this` envia a referência do próprio elemento `<form>` como argumento para o JavaScript.

* **`return false;`**: Comando essencial que **cancela o envio padrão do formulário**. Se a função retornar `false`, a página não recarrega e os dados não são enviados.

* **`return true;`**: Permite que o formulário continue o seu fluxo normal de envio.

* **`.focus()`**: Método que coloca o cursor piscando diretamente dentro do campo que precisa ser corrigido pelo usuário.

* **Validando Radio Buttons e Checkboxes:**

* Botões Radio usam um array de elementos (`frm.sexo[0]`, `frm.sexo[1]`). Checamos a propriedade `.checked` (`true` ou `false`).

* Checkboxes também usam a propriedade `.checked` para verificar se foram marcadas pelo usuário.


* **Validando Caixas de Seleção (`<select>`):** Checamos se o `.value` do campo continua igual à opção padrão desabilitada (ex: `'Selecione'`).

---

**Estrutura de Objetos e a Palavra-Chave `this`**

* **Objeto Literal:** Criado utilizando chaves `{}` com pares de `chave: valor`.
* **Propriedades:** São as variáveis pertencentes ao objeto.
* **Métodos:** São funções escritas dentro do objeto.
* **Palavra-chave `this` dentro de Objetos:** Refere-se **ao próprio objeto** onde o código está sendo executado.
* Para acessar a propriedade `nome` dentro do método `nomeCompleto()`, escrevemos `this.nome`.



---

### Código / Exemplos Práticos

**Exemplo 1: Função de Média com Decisão de Aprovado/Reprovado**

**Arquivo HTML (`funcao-com-parametros.html`):**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Função com Parâmetros e Decisão</title>
</head>
<body>
    <h1>Média e Situação do Aluno</h1>
    <p id="teste">O resultado é: </p>

    <script src="05-funcao-com-parametros.js"></script>
</body>
</html>

```

**Arquivo JS (`05-funcao-com-parametros.js`):**

```javascript
// Declaração da função com parâmetros e lógica condicional interna
function Media(a, b, c, d) {
    let media = (a + b + c + d) / 4;

    if (media >= 7) {
        return 'Aprovado(a) com a média: ' + media.toFixed(1);
    } else {
        return 'Reprovado(a) com a média: ' + media.toFixed(1);
    }
}

// Declaração de variáveis
let nome = '';
let nota1 = 0, nota2 = 0, nota3 = 0, nota4 = 0;

// Solicitação de dados ao usuário
nome = prompt('Digite o nome do(a) aluno(a):', '');
alert('Informe as 4 notas do(a) aluno(a)');

nota1 = parseFloat(prompt('Digite a primeira nota:', '0')) || 0;
nota2 = parseFloat(prompt('Digite a segunda nota:', '0')) || 0;
nota3 = parseFloat(prompt('Digite a terceira nota:', '0')) || 0;
nota4 = parseFloat(prompt('Digite a quarta nota:', '0')) || 0;

// Injeção do resultado processado no DOM
document.getElementById('teste').innerHTML += 'O(a) aluno(a) ' + nome + ' está ' + Media(nota1, nota2, nota3, nota4);

```

---

**Exemplo 2: Validação Completa de Formulário no DOM**

**Arquivo HTML (`validacao-formulario.html`):**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Validação de Formulário</title>
</head>
<body>
    <h1>Validação de Formulário com JavaScript</h1>

    <!-- O onsubmit chama a função enviando 'this' (o formulário) e aguarda o retorno booleano -->
    <form name="form1" action="#" method="post" onsubmit="return VerificaForm(this);">

        <label for="nome">Nome:</label><br>
        <input type="text" name="nome" id="nome"><br><br>

        <label for="email">E-mail:</label><br>
        <input type="email" name="email" id="email"><br><br>

        <label for="fone">Fone:</label><br>
        <input type="text" name="fone" id="fone"><br><br>

        <label>Sexo:</label><br>
        <input type="radio" name="sexo" value="masculino"> Masculino
        <input type="radio" name="sexo" value="feminino"> Feminino<br><br>

        <label>Software que conhece:</label><br>
        <input type="checkbox" name="soft1" value="Sublime"> Sublime<br>
        <input type="checkbox" name="soft2" value="Brackets"> Brackets<br>
        <input type="checkbox" name="soft3" value="Dreamweaver"> Dreamweaver<br><br>

        <label for="navegador">Navegador preferido:</label><br>
        <select name="navegador" id="navegador">
            <option value="Selecione">Selecione</option>
            <option value="IE">Internet Explorer</option>
            <option value="Safari">Safari</option>
            <option value="Firefox">Firefox</option>
            <option value="Chrome">Chrome</option>
        </select><br><br>

        <label for="comentario">Comentário:</label><br>
        <textarea name="comentario" id="comentario" rows="5"></textarea><br><br>

        <input type="submit" name="enviar" value="Enviar Dados">
    </form>

    <script src="06-funcao-com-parametros.js"></script>
</body>
</html>

```

**Arquivo JS (`06-funcao-com-parametros.js`):**

```javascript
// Função de validação que recebe o formulário 'frm' como parâmetro
function VerificaForm(frm) {
    // 1. Validação do Campo Nome
    if (frm.nome.value.trim() === '') {
        alert('O campo Nome é obrigatório!');
        frm.nome.focus();
        return false; // Cancela o envio
    }

    // 2. Validação do Campo E-mail
    if (frm.email.value.trim() === '') {
        alert('O campo E-mail é obrigatório!');
        frm.email.focus();
        return false;
    }

    // 3. Validação do Campo Telefone
    if (frm.fone.value.trim() === '') {
        alert('O campo Telefone é obrigatório!');
        frm.fone.focus();
        return false;
    }

    // 4. Validação dos Botões Radio (Sexo)
    if (!frm.sexo[0].checked && !frm.sexo[1].checked) {
        alert('Por favor, selecione o Sexo!');
        return false;
    }

    // 5. Validação das Checkboxes (Softwares)
    if (!frm.soft1.checked && !frm.soft2.checked && !frm.soft3.checked) {
        alert('Selecione pelo menos um software que você conhece!');
        return false;
    }

    // 6. Validação do Caixa de Seleção (Select)
    if (frm.navegador.value === 'Selecione') {
        alert('Selecione um navegador preferido!');
        frm.navegador.focus();
        return false;
    }

    // 7. Validação da Caixa de Texto (Textarea)
    if (frm.comentario.value.trim() === '') {
        alert('O campo Comentário é obrigatório!');
        frm.comentario.focus();
        return false;
    }

    // Se passou por todas as verificações, autoriza o envio
    alert('Formulário preenchido com sucesso! Enviando dados...');
    return true;
}

```

---

**Exemplo 3: Criação e Manipulação de Objetos em JavaScript (`objeto.html`)**

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Objeto em JavaScript</title>
</head>
<body>
    <h1>Objeto em JavaScript</h1>

    <script>
        // Criando um Objeto Literal com Propriedades e Métodos
        let pessoa = {
            nome: 'Jorge',
            sobrenome: 'Savarel',
            idade: 34,
            olhos: 'Azul',
            peso: 79,
            altura: 1.81,
            fone: '(11) 98765-4321',
            endereco: 'Avenida Penha de França',
            numero: 67,
            cidade: 'São Paulo',
            bairro: 'Penha',
            estado: 'SP',
            cep: '12345-678',

            // Método que utiliza a palavra-chave 'this' para acessar as propriedades do próprio objeto
            nomeCompleto: function() {
                return this.nome + ' ' + this.sobrenome;
            },

            // Método para formatar o endereço completo em HTML
            endCompleto: function() {
                return this.endereco + ', ' + this.numero + '<br>' +
                       this.bairro + '<br>' +
                       this.cidade + ' - ' + this.estado + '<br>' +
                       'CEP: ' + this.cep;
            }
        };

        // Exibindo os retornos dos métodos do objeto na página
        document.write('<strong>Nome Completo:</strong> ' + pessoa.nomeCompleto() + '<br/><br/>');
        document.write('<strong>Endereço Completo:</strong><br/>' + pessoa.endCompleto());
    </script>
</body>
</html>

```

---

**Desmontando o Código**

**Desmontando a Validação `onsubmit="return VerificaForm(this);"`:**

1. `onsubmit`: É o gatilho de evento ativado no instante em que o formulário tenta ser enviado.

2. `this`: Passa o elemento `<form>` inteiro com todas as suas marcas internas como um objeto manipulável (`frm`) para a função JS.

3. `return VerificaForm(...)`: Recebe o resultado booleano da função.

* Se a função encontrar algum erro e executar `return false`, o evento `onsubmit` recebe `return false`, cancelando o recarregamento e o envio do formulário.



---

**Desmontando o Uso de `this` no Objeto `pessoa`:

```javascript
nomeCompleto: function() {
    return this.nome + ' ' + this.sobrenome;**
}

```

* Se escrevêssemos apenas `return nome + ' ' + sobrenome;`, o JavaScript procuraria por variáveis globais chamadas `nome` e `sobrenome` fora do objeto, resultando em erro (`ReferenceError`).

* A instrução **`this.nome`** instrui expressamente o motor do JavaScript: *"Acesse a propriedade 'nome' registrada DENTRO deste objeto 'pessoa' em que o método está inserido"*.

---

**Passo a Passo: Fluxo de Execução da Validação de Formulário**

```
1. O usuário preenche os campos do formulário na página HTML.

2. O usuário clica no botão <input type="submit">.

3. O evento onsubmit captura o clique e chama a função VerificaForm(this).

4. O JavaScript avalia os campos em ordem sequencial:
   a. Testa se o campo de texto está vazio com frm.campo.value === ''.
   b. Se estiver vazio: exibe alert(), coloca o foco no campo com .focus() e para a função com `return false`.
   c. Testa se Radio/Checkbox estão desmarcados com !frm.campo.checked.
   d. Testa se a caixa Select está na opção inicial com frm.select.value === 'Selecione'.

5. Se NENHUMA das condições de erro for disparada, a função atinge a última linha: `return true`.

6. O navegador recebe 'true' do evento onsubmit e realiza o envio do formulário para o servidor.

```

---

## Tabelas Comparativas

**Como Acessar e Validar Cada Tipo de Input do HTML no JavaScript**

| Tipo de Elemento HTML | Como acessar o elemento? | Como verificar se está preenchido/válido? |
| --- | --- | --- |
| **Texto / Email / Textarea** | `frm.nomeCampo` | `frm.nomeCampo.value.trim() === ''` |
| **Radio Button (Grupo)** | `frm.nomeGrupo[0]`, `[1]` | `!frm.nomeGrupo[0].checked && !frm.nomeGrupo[1].checked` |
| **Checkbox (Caixa única)** | `frm.nomeBox` | `frm.nomeBox.checked === false` |
| **Select (Lista suspensa)** | `frm.nomeSelect` | `frm.nomeSelect.value === 'ValorDefault'` |

---

**Propriedades vs. Métodos em Objetos JavaScript**

| Conceito | O que é? | Sintaxe no Objeto | Como Chamar? |
| --- | --- | --- | --- |
| **Propriedade** | Uma característica / dado armazenado. | `chave: valor` | `objeto.propriedade` (Sem parênteses) |
| **Método** | Uma ação / função interna. | `chave: function() { ... }` | `objeto.metodo()` (**Com parênteses**) |

---

## Erros Comuns e Cuidados

**Esquecer a Palavra `return` no Evento `onsubmit`**

* **Incorreto:** `onsubmit="VerificaForm(this);"`
* **O que acontece:** A função executa a validação e exibe os alertas, mas mesmo que ela retorne `false`, **o formulário é enviado assim mesmo**!
* **Correto:** `onsubmit="return VerificaForm(this);"`

**Tentar Acessar o Conteúdo de Radios ou Checkboxes via `.value` para Saber se Estão Marcados**

* **Incorreto:** `if (frm.sexo[0].value === '')`
* **O que acontece:** A propriedade `.value` do botão radio sempre retornará a palavra fixa atribuída no HTML (ex: `'masculino'`), independentemente de o botão estar marcado ou não.
* **Correto:** Usar a propriedade booleana `.checked` (`if (!frm.sexo[0].checked)`).

**Esquecer os Parênteses ao Invocar um Método de Objeto**

* **Incorreto:** `document.write(pessoa.nomeCompleto);`
* **Resultado:** O JavaScript imprime o código-fonte da função inteira impresso como texto, em vez de executar o código do método!
* **Correto:** `document.write(pessoa.nomeCompleto());`

---

## Aprofundamento e Boas Práticas

**Validação JS vs. Validação Nativa HTML5**

O HTML5 trouxe atributos nativos de validação como `required`, `type="email"`, `minlength="3"` e `pattern=""`.

* **Validação HTML5:** Mais fácil e rápida de implementar diretamente na tag HTML.
* **Validação JavaScript:** Necessária para regras complexas de negócios (como comparar se o campo "Confirmar Senha" é igual ao campo "Senha", validar CPF/CNPJ, ou verificar combinação de checkboxes).
* **Boa Prática profissional:** Utilize a validação nativa do HTML5 como primeira camada e o JavaScript para validações avançadas.

**Por que Evitar `document.write()` na Prática Profissional?**

No exercício do objeto `pessoa`, utilizamos `document.write()` para exibir os dados.

* Em código profissional moderno, evita-se o uso de `document.write()`, pois se executado após o carregamento da página, ele **apaga todo o HTML existente** e o substitui do zero.
* **Boa Prática:** Crie elementos HTML com `id` e atualize o conteúdo com `.innerHTML` ou `.textContent`.

---

**Resumo Relâmpago**

1. Funções com `if/else` internos retornam resultados diferentes com base na lógica aplicada aos seus parâmetros.
2. O evento `onsubmit` intercepta a tentativa de envio do formulário HTML via JavaScript.
3. A instrução `return false` cancela o envio do formulário quando dados inválidos são identificados.
4. O método `.focus()` coloca o cursor do teclado diretamente sobre o campo que precisa ser preenchido.
5. O atributo `this` dentro do evento `onsubmit="return fn(this)"` envia a referência do formulário para o JS.
6. A propriedade `.checked` verifica se botões Radio e Checkboxes estão selecionados (`true` ou `false`).
7. Objetos em JavaScript agrupam propriedades (características) e métodos (funções) sob um mesmo nome.
8. A palavra-chave `this` dentro de um objeto faz referência às próprias propriedades daquele objeto.
9. Métodos de objetos precisam ser invocados obrigatoriamente com parênteses ao final: `objeto.metodo()`.
10. Utilizar `.trim()` em campos de texto evita que o preenchimento apenas com espaços burle a validação.

---

## Guia Rápido de Memorização

* **Bloquear Envio do Formulário:** `return false;`
* **Focar no Campo com Erro:** `frm.campo.focus();`
* **Verificar se Checkbox/Radio está Marcado:** `if (!frm.campo.checked)`
* **Limpar Espaços em Branco de Texto:** `frm.campo.value.trim()`
* **Sintaxe de Objeto Literal:** `let obj = { chave: 'valor', metodo: function() { return this.chave; } };`
* **Chamar Método de Objeto:** `obj.metodo()`
