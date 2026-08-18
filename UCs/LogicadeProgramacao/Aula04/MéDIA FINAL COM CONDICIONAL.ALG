Algoritmo "Média final com condicional"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Cálcular a média final do aluno e verificar se ele foi
//               foi aprovado ou reprovado
// Autor(a)    : Bruss
// Data atual  : 23/06/2026
Var
// Seção de Declarações das variáveis 
media, nota1, nota2, nota3, nota4: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
//Entrada dos Dados
escreval("Algoritmo para cálcular a Média Final")
escreval("")
escreval("Digite a nota do 1º Bimestre")
leia(nota1)
escreval("Digite a nota do 2º Bimestre")
leia(nota2)
escreval("Digite a nota do 3º Bimestre")
leia(nota3)
escreval("Digite a nota do 4º Bimestre")
leia(nota4)

//Processamento dos Dados
media <- (nota1 + nota2 + nota3 + nota4) / 4

//Saída dos Dados
se (media >= 5) entao
escreval("Aluno Aprovado com média final: ",media)
senao
escreval("Aluno Reprovado com a média final: ",media)
fimse

Fimalgoritmo