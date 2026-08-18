Algoritmo "Verificar valor da compra"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 30/06/2026
Var
// Seção de Declarações das variáveis 
valorCompra: real
regiao: caractere

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o valor da sua compra: ")
leia(valorCompra)
escreval("Digite a sua região: ")
leia(regiao)

se(valorCompra >= 350) ou (regiao = "Sudeste") entao
escreval("O seu frete será GRÁTIS")
senao
escreval("O seu frete NÃO SERÁ GRÁTIS")
fimse

Fimalgoritmo