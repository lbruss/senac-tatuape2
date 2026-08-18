Algoritmo "Verificar_par"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   :
// Autor(a)    : Bruss Loza
// Data atual  : 06/08/2026
Var
// Seção de Declarações das variáveis 
numero:inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite um número")
leia(numero)

//Verificar  se é par ou ímpar usando o MOD (Resto da divisão)
se (numero %2=0) entao
escreval("O número",numero," é Par")
senao
escreval("O número",numero," é Ímpar")
fimse

Fimalgoritmo