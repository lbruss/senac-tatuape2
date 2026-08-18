Algoritmo "Primavera ou Verão"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Ve se é primavera ou verão
// Autor(a)    : Bruss Loza
// Data atual  : 30/07/2026
Var
// Seção de Declarações das variáveis 
estacao:caractere

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite em qual estação você está.")
leia(estacao)

se(estacao = "Primavera") ou (estacao = "Verão") ou (estacao = "primavera") ou (estacao = "verão") ou (estacao = "verao") ou (estacao = "Verao") entao
escreval("Praia liberada.")
senao
escreval("FIQUE EM CASA.")
fimse

Fimalgoritmo