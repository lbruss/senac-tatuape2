Algoritmo  "Calculadora de IMC"

Var
peso, altura, imc: real

Inicio

escreval("==================================")
escreval("       CALCULADORA DE IMC")
escreval("==================================")
escreval("")

escreva("Digite seu peso em kg: ")
leia(peso)
escreva("Digite sua altura em metros: ")
leia(altura)
escreval("----------------------------------")

imc <- peso / (altura ^ 2)

escreval("")
escreval("Seu IMC é: ", imc:5:2)


se imc < 18.5 entao
escreval("Classificacao: Abaixo do peso")

senao
se imc < 25 entao
escreval("Classificacao: Peso ideal")

senao
se imc < 30 entao
escreval("Classificacao: Sobrepeso")
senao
escreval("Classificacao: Obesidade")

fimse
fimse
fimse
escreval("")
escreval("---------------------------------")

Fimalgoritmo