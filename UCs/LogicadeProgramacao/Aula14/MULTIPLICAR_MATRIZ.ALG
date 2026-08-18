Algoritmo "multiplicar_matriz"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
Var
valor:vetor[1..3,1..3] de inteiro
i,j:inteiro

Inicio
//Leitura - Entrada dos Dados
para i de 1 ate 3 faca
   para j de 1 ate 3 faca
   escreval("Digite números inteiros:")
   leia(valor[i,j])
   fimpara
fimpara

//Multiplicação por 2
para i de 1 ate 3 faca
   para j de 1 ate 3 faca
   valor[i,j] <- valor[i,j] * 2
   fimpara
fimpara

//Exibir o resultado
escreval("Matriz multiplicada")
para i de 1 ate 3 faca
   para j de 1 ate 3 faca
   escreval(valor[i,j]," ")
   fimpara
   escreval()
fimpara

Fimalgoritmo