Algoritmo "media da media - vetor"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   :
// Autor(a)    : Bruss Loza
// Data atual  : 05/08/2026
Var
// Seção de Declarações das variáveis 
md:vetor[0..7] de real
soma,media:real
i:inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite a média da turma:")
escreval("")
soma <- 0
para i de 0 ate 7 passo 1 faca
leia(md[i])
soma <- soma + md[i]
fimpara
media <- soma/8
escreval("")
escreval("A média da turma é:",media)
Fimalgoritmo