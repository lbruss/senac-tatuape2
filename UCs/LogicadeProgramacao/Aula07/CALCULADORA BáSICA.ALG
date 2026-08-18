Algoritmo "Calculadora básica"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Escolha a operação
// Autor(a)    : Bruss Loza
// Data atual  : 28/07/2026
Var
// Seção de Declarações das variáveis 
calculo: inteiro
valor1, valor2, result: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("*******Calculadora*******")
escreval("")
escreval("Digite o primeiro valor: ")
leia(valor1)

escreval("Digite o segundo valor: ")
leia(valor2)

escreval("Escolha a operação matemática")
escreval("1 - Adição")
escreval("2 - Subtração")
escreval("3 - Multiplicação")
escreval("4 - Divisão")

leia(calculo)
escolha calculo

caso 1
result <- valor1 + valor2
escreval("O resultado é",result)

caso 2
result <- valor1 - valor2
escreval("O resultado é",result)

caso 3
result <- valor1 * valor2
escreval("O resultado é",result)

caso 4
result <- valor1 / valor2
escreval("O resultado é",result)

sacuoutrocaso
escreval("Você digitou um valor inválido.")

fimescolha

Fimalgoritmo