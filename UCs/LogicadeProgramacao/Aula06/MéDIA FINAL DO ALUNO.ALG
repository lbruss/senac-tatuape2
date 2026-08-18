Algoritmo "Média Final do Aluno"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 30/06/2026
Var
// Seção de Declarações das variáveis 
media: real
falta: inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite a sua média final: ")
leia(media)
escreval("Digite o número de faltas: ")
leia(falta)

se(media >= 5)e (media <= 10) e (falta <= 4) entao
escreval("Aluno APROVADO")
senao
escreval("Aluno REPROVADO")
fimse

Fimalgoritmo