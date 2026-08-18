Algoritmo "Calcular reajuste do salário"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss
// Data atual  : 23/06/2026
Var
// Seção de Declarações das variáveis
salario, aumento, depois, valorFinal: real
nome: caractere

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o seu nome")
leia(nome)
escreval("Digite o seu salário")
leia(salario)
escreval("Funcionário: ",nome)

se (salario < 2000) entao
aumento <- 25/100
valorFinal <- salario + salario * aumento
escreval("Seu salário foi de R$",salario," para R$",valorFinal)
senao
escreval("Seu salário não terá aumento")
fimse

Fimalgoritmo