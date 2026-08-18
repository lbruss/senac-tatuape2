Algoritmo "estruturaPARA"
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
para i de 1 ate 5 faca
//"i" é o contador, onde definimos a quantidade
//de vezes em que ele é repetido até que satisfaça a condição estabelecida
leia(x)
z <- x * 3
escreval("O valor digitado",x," multiplicado por 3 é:",z)
fimpara

Fimalgoritmo