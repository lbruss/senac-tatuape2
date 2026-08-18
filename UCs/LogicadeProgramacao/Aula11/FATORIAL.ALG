Algoritmo "fatorial"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Viniciuis
// Autor(a)    : Bruss Loza
// Data atual  : 06/08/2026
Var
num,i,fatorial:inteiro

Inicio
//Entrada dos Dados
escreva("Digite um número inteiro positivo:")
leia(num)

//Validação da entrada do valor digitado
se (num <= 0) entao
escreval("Erro: não existe fatorial de número negativo.")
senao
fatorial <- 1

//Cálculo do fatorial
para i de 1 ate num faca
fatorial <- fatorial * i
fimpara

//Saída do resultado
escreval("O fatorial de ",num," é: ",fatorial)
fimse

Fimalgoritmo