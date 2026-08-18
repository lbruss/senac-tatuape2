Algoritmo "Cáculo da altura de um prédio"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Este programa calculará a altura de um prédio com base na sua sombra
// Autor(a)    : Bruss Loza
// Data atual  : 19/06/2026
Var
// Seção de Declarações das variáveis 
comprimentoSombra, alturaReferencia, alturaPredio: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
escreval("Digite o comprimento da sombra do prédio")
leia(comprimentoSombra)
escreval("Digite a altura Referência")
leia(alturaReferencia)

alturaPredio <- alturaReferencia * (comprimentoSombra / comprimentoSombra)

escreval("A altura do prédio é: ",alturaPredio)


Fimalgoritmo