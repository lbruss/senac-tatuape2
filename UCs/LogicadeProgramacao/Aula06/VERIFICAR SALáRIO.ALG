Algoritmo "Verificar salário"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 30/06/2026
Var
// Seção de Declarações das variáveis 
salario, aumento, tempodeempresa: real
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o seu salário: ")
leia(salario)
escreval("Digite quantos anos você está na empresa: ")
leia(tempodeempresa)

se(salario <= 3000) ou (tempodeempresa >= 5) entao
aumento <- salario + 500
escreval("Você teve um aumento de R$ 500,00.")
escreval("Seu salário agora é de R$ ",aumento)
senao
escreval("É necessário mais tempo na empresa.")
fimse
Fimalgoritmo