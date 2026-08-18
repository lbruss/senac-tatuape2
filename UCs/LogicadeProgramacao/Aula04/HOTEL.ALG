Algoritmo "Valor da hospedagem"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss
// Data atual  : 23/06/2026
Var
// Seção de Declarações das variáveis 
valorDiaria, dias, resultado, quantidadePessoas: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite a quantidade de pessoas")
leia(quantidadePessoas)
escreval("Escreva a quantidade de dias")
leia(dias)
valorDiaria <- 180

resultado <- quantidadePessoas * valorDiaria * dias
escreval("O valor a ser pago será de R$ ",resultado)

Fimalgoritmo