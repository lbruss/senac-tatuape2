Algoritmo "Matriz_inserirnomes"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
Var
pais:vetor[1..3,1..4] de caractere
i,j:inteiro

Inicio
para i de 1 ate 3 faca
     para j de 1 ate 4 faca
          escreval("Digite o nome de do páis desejado: ")
          leia(pais[i,j])
     fimpara
fimpara

escreval()
escreval("Países digitados digitados:")


para i de 1 ate 3 faca
     para j de 1 ate 4 faca
          escreval(pais[i,j]," ")
     fimpara
            escreval()
fimpara

Fimalgoritmo

