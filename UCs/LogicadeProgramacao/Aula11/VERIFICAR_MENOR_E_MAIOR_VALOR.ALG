Algoritmo "Verificar_menor_e_maior_valor"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
// Data atual  : 06/08/2026
//Algoritmo para verificar 10 valores digitados
//e verificar qual é o menor e o maior valor digitado
//exibir os 10 valores digitados e também
//o menor valor digitado e o maior digitado
Var
// Seção de Declarações das variáveis 
valores:vetor[1..10] de inteiro
i,maior,menor,posMaior,posMenor:inteiro

Inicio
//Leitura dos valores do vetor
para i de 1 ate 10 faca
escreval("Digite o ",i,"º número: ")
leia(valores[i])
fimpara

//Inicializa maior e menor com o primeiro elemento
maior <- valores[1]
menor <- valores[1]
posMaior <- 1
posMenor <- 1

//Percorre o vetor para encontrar o maior e menor valor
para i  de 1 ate 10 faca
se (valores[i] > maior) entao
maior <- valores[i]
posMaior <- i
fimse

se (valores[i] < menor) entao
menor <- valores[i]
posMenor <- i
fimse
fimpara

//Exibir os Elementos digitados
escreval("Elementos do vetor:")
para i de 1 ate 10 faca
escreval(valores[i],"")
fimpara
escreval("")

//Exibir o menor e o maior valor e a sua posição
escreval("Maior valor: ",maior," na posição ",posMaior)
escreval("Menor valor: ",menor," na posição ",posMenor)


Fimalgoritmo