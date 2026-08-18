Algoritmo "Matriz_nomeeidade"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
Var
nome:vetor[1..2,1..2] de caractere
idade:vetor[1..2,1..2] de inteiro
i,j:inteiro
k,h:inteiro

Inicio
para i de 1 ate 2 faca
     para j de 1 ate 2 faca
          escreval("Digite o nome: ")
          leia(nome[i,j])
     fimpara
fimpara

para k de 1 ate 2 faca
     para h de 1 ate 2 faca
          escreval("Digite a idade: ")
          leia(idade[k,h])
     fimpara
fimpara

escreval("Os nomes são:")

para i de 1 ate 2 faca
     para j de 1 ate 2 faca
          escreval(nome[i,j]," ")
     fimpara
fimpara

escreval("As idades são:")

para k de 1 ate 2 faca
     para h de 1 ate 2 faca
          escreval(idade[k,h]," ")
     fimpara
fimpara

Fimalgoritmo