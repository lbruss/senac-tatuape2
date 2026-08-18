Algoritmo "ValorParcela-Financiamento"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
// Data atual  : 07/08/2026
Var
p,i,n,pmt:real

//Criar um algoritmo para calcular o valor da parcela de um financiamento de imóveis
//Fórmula: pmt = (p * i) / (1 - (1+ i)^n), sendo:
//PMT = Valor da parcela
//P = Valor a ser financiado
//i= taxa de juros (taxa anual dividido por 12)
//n= número de meses do financiamento

Inicio
escreval("Valor a ser financiado:")
leia(p)
escreval("Digite a taxa de juros:")
leia(i)
escreval("Digite o número de meses do financiamento:")
leia(n)

pmt <- (p * (i/12)) / (1 - (1+ (i/12)) ^ - n)

escreval("O valor da parcela é de:",pmt)


Fimalgoritmo