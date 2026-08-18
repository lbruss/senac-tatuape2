Algoritmo "Região"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Valor compra e frete
// Autor(a)    : Bruss Loza
// Data atual  : 28/07/2026
Var
// Seção de Declarações das variáveis 
valorF, frete, valorC: real
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o valor da compra")
leia(valorC)
escreval("Digite o número de 1 a 5 de acordo com a região")
escreval("1 - Sudeste")
escreval("2 - Sul")
escreval("3 - Centro-Oeste")
escreval("4 - Norte")
escreval("5 - Nordeste")

leia (frete)
escolha frete

caso 1
escreval("O valor da sua compra é de R$",valorC)
escreval("O seu frete é grátis")

caso 2
valorF <- valorC + 10
escreval("O valor da sua compra é de R$",valorC)
escreval("O valor do frete é de R$ 10,00")
escreval("O valor final a ser pago é de R$",valorF)

caso 3
valorF <- valorC + 25
escreval("O valor da sua compra é de R$",valorC)
escreval("O valor do frete é de R$ 25,00")
escreval("O valor final a ser pago é de R$",valorF)

caso 4
valorF <- valorC + 50
escreval("O valor da sua compra é de R$",valorC)
escreval("O valor do frete é de R$ 50,00")
escreval("O valor final a ser pago é de R$",valorF)

caso 5
valorF <- valorC + 40
escreval("O valor da sua compra é de R$",valorC)
escreval("O valor do frete é de R$ 40,00")
escreval("O valor final a ser pago é de R$",valorF)

outrocaso
escreval("Número inválido")

fimescolha

Fimalgoritmo