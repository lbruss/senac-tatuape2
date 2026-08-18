Algoritmo "Valor de compra"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 19/06/2026
Var
// Seção de Declarações das variáveis 
valcompra, comissao, valcomissao:real
cliente, vendedor:caractere
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o nome do Vendedor")
leia(vendedor)
escreval("Digite o nome do Cliente")
leia(cliente)
escreval("Escreva o valor da compra")
leia(valcompra)
comissao <- 25/100
valcomissao <- valcompra * comissao
escreval("O valor da comissão do vendedor é de R$:",valcomissao)
escreval("O vendedor é: ",vendedor)
escreval("O cliente é: ",cliente)
escreval("O valor da compra é: ",valcompra)

Fimalgoritmo