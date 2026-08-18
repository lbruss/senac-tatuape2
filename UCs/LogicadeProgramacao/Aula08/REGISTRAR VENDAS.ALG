Algoritmo "Registrar vendas"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 30/07/2026
Var
// Seção de Declarações das variáveis 
comprador,vendedor:caractere
compra,desconto,valorFinal:real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o nome do vendedor.")
leia(vendedor)
escreval("Digite o nome do comprador.")
leia(comprador)
escreval("Digite o valor da compra.")
leia(compra)

se (compra > 300) entao
desconto <- compra * 25/100
valorFinal <- compra - desconto
escreval(comprador," seu valor teve 25% de desconto")
escreval("no total seu valor ficou R$",valorFinal)
escreval(vendedor, " obteve 15% de comissão em cima da venda")
escreval(comprador," teve 5% de desconto para sua proxima compra")
senao
escreval(comprador," seu valor é de", compra)
escreval(vendedor," obteve 15% de comissão em cima da venda")
escreval(comprador," teve 5% de desconto para sua proxima compra")

fimse

Fimalgoritmo