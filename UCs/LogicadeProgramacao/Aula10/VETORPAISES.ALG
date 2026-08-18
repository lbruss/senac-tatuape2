Algoritmo "vetorpaises"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   :
// Autor(a)    : Bruss Loza
// Data atual  : 05/08/2026
Var
// Seção de Declarações das variáveis 
nomepais:vetor[0..4] de caractere
i:inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
para i de 0 ate 4 faca
escreval("Digite o nome de um país:")
leia(nomepais[i])
fimpara
para i de 0 ate 4 faca
escreval("O nome dos países são:",nomepais[i])
fimpara

Fimalgoritmo