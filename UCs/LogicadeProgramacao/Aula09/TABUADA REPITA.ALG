Algoritmo "Tabuada REPITA"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   :
// Autor(a)    : Bruss Loza
// Data atual  : 04/08/2026
Var
// Seção de Declarações das variáveis
numero, contagem:inteiro
//aqui é declarado as variáveis
//a variável "contagem" será nosso contador

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
contagem <- 1
escreva("Mostra a tabuada do número:")
//aqui escrevi "ESCREVA" sem o "L", quando escrevemos o comando
//escreva sem o L, ele não pula linha para digitar o valor
leia(numero)

repita
escreval(numero," x",contagem," =",numero * contagem)
contagem <- contagem + 1
ate contagem > 10

Fimalgoritmo