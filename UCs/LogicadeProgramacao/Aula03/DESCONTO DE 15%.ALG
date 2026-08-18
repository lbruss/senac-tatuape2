Algoritmo "Desconto de 15%"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 19/06/2026
Var
// Seção de Declarações das variáveis 
valcompra, valfinal, desconto:real
cliente:caractere

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Escreva o valor da compra")
leia(valcompra)
escreval("Digite o nome do Cliente")
leia(cliente)
desconto <- valcompra * 15/100
valfinal <- valcompra - desconto

escreval("O cliente é: ",cliente)
escreval("O valor da compra é: ",valcompra)
escreval("O valor a ser descontado é: ",desconto)
escreval("O valor final é: ",valfinal)

Fimalgoritmo