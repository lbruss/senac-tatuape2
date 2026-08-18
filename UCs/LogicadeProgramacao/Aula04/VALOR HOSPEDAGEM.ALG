Algoritmo "Hotel com condicional"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss
// Data atual  : 23/06/2026
Var
// Seção de Declarações das variáveis 
valorDiaria, dias, resultado, quantidadePessoas, desconto, valorDesconto: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite a quantidade de pessoas")
leia(quantidadePessoas)
escreval("Escreva a quantidade de dias")
leia(dias)
valorDiaria <- 180
resultado <- quantidadePessoas * valorDiaria * dias

se (dias > 8) entao
desconto <-  15/100
valorDesconto <- resultado - resultado * desconto
escreval("O valor com desconto é de R$ ",valorDesconto)
senao
escreval("O valor a ser pago será de R$ ",resultado)
fimse

Fimalgoritmo