Algoritmo "Comissão sobre as Vendas"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 19/06/2026
Var
// Seção de Declarações das variáveis 
vendas, comissao, resultado:real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
escreval("==========")
escreval("Magazine das Roupas")
escreval("==========")
escreval("")
escreval("Digite o total das vendas realizadas pelo vendedor:")
leia(vendas)
comissao <- 12/100
resultado <- vendas * comissao
escreval("A comissão do vendedor é de R$: ",resultado)

Fimalgoritmo