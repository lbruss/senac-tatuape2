Algoritmo "sorteio de números"
//Professor: Vinicius
//Autor: Bruss Loza
//Algoritmo para preencher 30 posições com números sorteados
//entre 1 a 15, os números serão sorteados pelo computador
//depois, vamor pedir para o usuário digitar um número
//o algoritmo deverá mostrar em que posição (s) a chave
//foi encontrada, mostrar também quantas vezes foi sorteado
Var
numeros:vetor[1..30] de inteiro
i, chave, vezes: inteiro

Inicio
vezes<-0

//Aqui vamos sortear 30 números de 1 ate 15
para i de 1 ate 30 faca
   numeros[i]<- RandI(15) + 1
fimpara

//Pedir ao usuário para informar a chave
// e verificar em quais posições essa chave foi encontrada
escreva("Digite um número a ser localizado: ")
leia(chave)

escreva()
escreva("O número",chave," apareçe nas seguintes posições: ")
escreva()

para i de 1 ate 30 faca
   se (numeros[i]=chave)entao
   //Registra a quantidade de vezes
   vezes<- vezes + 1
   escreval("[",numeros[i],"]", "posição => ",i)
   fimse
fimpara

//Mostrar quantas vezes o número pesquisado apareceu
escreva()
escreval("O número",chave, " apareceu =>",vezes," vez(es)")
escreva()


Fimalgoritmo