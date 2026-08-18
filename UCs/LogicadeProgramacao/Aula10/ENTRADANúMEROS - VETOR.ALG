Algoritmo "EntradaNúmeros"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   :
// Autor(a)    : Bruss Loza
// Data atual  : 05/08/2026
Var
// Seção de Declarações das variáveis 
numero:vetor[0..4] de real
i:inteiro
soma:real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
soma <- 0

para i de 0 ate 4 faca
escreva("Digite o numero ", i, ": ")
leia(numero[i])
soma <- soma + numero[i]
fimpara

escreval()
escreval("Numeros digitados:")

para i de 0 ate 4 faca
escreval(numero[i])
fimpara

escreval()
escreval("Soma dos numeros = ", soma)

Fimalgoritmo