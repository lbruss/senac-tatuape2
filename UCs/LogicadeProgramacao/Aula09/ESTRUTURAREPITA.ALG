Algoritmo "estruturaREPITA"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   :
// Autor(a)    : Bruss Loza
// Data atual  : 04/08/2026
Var
// Seção de Declarações das variáveis
x,z,i:inteiro
//aqui é declarado as variáveis
//a variável "i" será nosso contador

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
escreval("Algoritmo para repetir uma ação 5 vezes")
escreval("Para cada ação, digite um número inteiro")
escreval("")
escreval("Digite um valor inteiro")

i <- 1
repita
leia(x)
z <- x * 3
escreval(z)
i <- i + 1
ate(i > 5)//O programa será executado até que o contador seja maior que 5

Fimalgoritmo