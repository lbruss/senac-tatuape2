Algoritmo "Área do Trapézio"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 19/06/2026
Var
// Seção de Declarações das variáveis 
result, baseMenor, baseMaior, altura: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Cálculo da área do Trapézio")
escreval("Digite a base maior do trapézio")
leia(baseMaior)
escreval("Digite a base menor do trapézio")
leia(baseMenor)
escreval("Digite a altura do trapézio")
leia(altura)
result <- ((baseMaior + baseMenor) * altura) / 2
escreval("A área do trapézio é: ",result)

Fimalgoritmo