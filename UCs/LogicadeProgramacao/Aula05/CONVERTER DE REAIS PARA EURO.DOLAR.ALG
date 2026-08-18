Algoritmo "Converter de Reais para Euro.Dolar"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 25/06/2026
Var
// Seção de Declarações das variáveis 
reais, dolar, euro: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o valor em Reais")
leia(reais)

dolar <- reais / 5.18
euro <- reais / 5.89
escreval("O seu valor em Dolar é $",dolar)
escreval("O seu valor em Euro é €",euro)

Fimalgoritmo