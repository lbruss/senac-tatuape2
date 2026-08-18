Algoritmo "Salário em níveis"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 25/06/2026
Var
// Seção de Declarações das variáveis 
nivel, horas, valorFinal: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o número de horas trabalhadas")
leia(horas)
escreval("Digite o seu nível")
leia(nivel)

se(nivel = 1)entao
valorFinal <- 12 * horas
escreval("O seu sálario é de R$",valorFinal)
   senao
   se(nivel = 2)entao
   valorFinal <- 17 * horas
   escreval("O seu sálario é de R$",valorFinal)
     senao
     se(nivel = 3) entao
     valorFinal <- 25 * horas
     escreval("O seu sálario é de R$",valorFinal)
    fimse
   fimse
fimse
Fimalgoritmo