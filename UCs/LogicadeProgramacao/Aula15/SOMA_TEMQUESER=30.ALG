Algoritmo "soma_temqueser=30"

Var
vet1:vetor[1..3] de inteiro
vet2:vetor[1..3] de inteiro
i,soma1,soma2:inteiro

Inicio
soma1<-0
soma2<-0
escreval("Digite os valores do Vetor 1:")
para i de 1 ate 3 faca
escreva("Digite o ",i," valor: ")
leia(vet1[i])

soma1 <- soma1 + vet1[i]
fimpara

escreval("Digite os valores do Vetor 2: ")
para i de 1 ate 3 faca
escreva("Digite o ",i," valor: ")
leia(vet2[i])

soma2 <- soma2 + vet2[i]
fimpara

escreval("O valor do primeiro vetor é:",soma1)
escreval("O valor do segundo vetor é:",soma2)

se soma1 = 30 entao
  se soma2 = 30 entao
    escreval("Os dois vetores possuem soma igual a 30.")
    senao
    escreval("A soma de 1 ou dos 2 vts não e igual a 30.")
  fimSe
fimse
Fimalgoritmo