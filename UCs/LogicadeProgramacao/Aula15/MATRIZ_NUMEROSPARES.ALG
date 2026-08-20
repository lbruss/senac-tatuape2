Algoritmo "Matriz_numerospares"
//Autor: Bruss Loza
Var
numero: vetor[1..3, 1..3] de inteiro
par:vetor[1..9] de inteiro
i,j,vezes: inteiro

Inicio
vezes<-0
para i de 1 ate 3 faca
     para j de 1 ate 3 faca
          escreval("Digite um número:")
          leia(numero[i,j])
     fimpara
fimpara

para i de 1 ate 3 faca
     para j de 1 ate 3 faca
se (numero[i,j] %2=0) entao
vezes<- vezes + 1
par[vezes] <- numero[i,j]
fimse
fimpara
fimpara

escreval("A quantidade de pares: ",vezes)
escreval("Pares digitados")
para i de 1 ate vezes faca
escreval(par[i])
fimpara

Fimalgoritmo