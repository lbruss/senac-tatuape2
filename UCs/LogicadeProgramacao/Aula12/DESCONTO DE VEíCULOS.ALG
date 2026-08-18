Algoritmo "desconto de veículos"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
// Data atual  : 07/08/2026
Var
desconto,ano,valor,valorFinal:real

Inicio
escreval("Digite o valor do seu veículo:")
leia(valor)
escreval("Digite o ano de fabricação do seu veículo:")
leia(ano)

se (ano = 2000) ou (ano < 2010) entao
desconto <- valor * 20/100
valorFinal <- valor - desconto
escreval("Você recebeu o desconto de 20%")
escreval("O seu valor a ser pago é de: R$",valorFinal)
senao
escreval("Você não tem desconto")
escreval("O valor a ser pago é de: R$",valor)

  senao
  se (ano = 2010) ou (ano < 2020) entao
desconto <- valor * 15/100
valorFinal <- valor - desconto
escreval("Você recebeu o desconto de 15%")
escreval("O seu valor a ser pago é de: R$",valorFinal)
senao
escreval("Você não tem desconto")
escreval("O valor a ser pago é de: R$",valor)

     senao
     se (ano >= 2020) ou (ano < 2025) entao
desconto <- valor * 10/100
valorFinal <- valor - desconto
escreval("Você recebeu o desconto de 10%")
escreval("O seu valor a ser pago é de: R$",valorFinal)
senao
escreval("Você não tem desconto")
escreval("O valor a ser pago é de: R$",valor)

     senao
     se (ano = 2025) entao
desconto <- valor * 5/100
valorFinal <- valor - desconto
escreval("Você recebeu o desconto de 5%")
escreval("O seu valor a ser pago é de: R$",valorFinal)
senao
escreval("Você não tem desconto")
escreval("O valor a ser pago é de: R$",valor)

fimse
fimse
fimse
fimse


Fimalgoritmo