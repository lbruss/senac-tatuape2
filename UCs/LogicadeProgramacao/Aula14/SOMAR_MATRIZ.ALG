Algoritmo "somar_matriz"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
Var
valor:vetor[1..3,1..3] de inteiro
i,j,soma:inteiro

Inicio
soma <- 0
//Leitura da matriz
para i de 1 ate 3 faca
   para j de 1 ate 3 faca
   escreval("Digite o valor [",i,",",j,"]: ")
   leia(valor[i,j])
   //Calculo dos valores da matriz
   soma <- soma + valor[i,j]
   fimpara
fimpara

   escreval()
   //exibindo o resultado
   escreval("A soma dos valores da Matriz = ",soma)

Fimalgoritmo