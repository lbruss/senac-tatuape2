Algoritmo "Cálculo apresentação em atraso"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Prestação, dias e taxa
// Autor(a)    : Bruss Loza
// Data atual  : 30/07/2026
Var
// Seção de Declarações das variáveis 
valor,prestacao,tmp: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o valor da prestação.")
leia(valor)
escreval("Digite o número de dias de atraso.")
leia(tmp)

prestacao <- valor + (valor * (15/100) * tmp)

escreval("O valor a ser pago é de R$",prestacao)

Fimalgoritmo