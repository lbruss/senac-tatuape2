Algoritmo "Matriz_calcularmedia"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
Var
valor:vetor[1..2,1..2] de inteiro
i,j:inteiro
soma,media:real

Inicio
para i de 1 ate 2 faca
   para j de 1 ate 2 faca
   escreval("Digite 4 valores para calcular a media:")
   leia(valor[i,j])
   soma <- soma + valor[i,j]
   fimpara
fimpara

media <- soma / 4

escreval("A média dos 4 valores é: ",media)

Fimalgoritmo