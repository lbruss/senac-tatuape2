Algoritmo "Frete"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Algoritmo para calcular o valor do frete e se haverá frete grátis
// Autor(a)    : Bruss Loza
// Data atual  : 25/06/2026
//Se a compra for >= 300 - Frte grátis
//Se a compra for >= 200 - Frete de 15.50
//Se a compra for >= 150 - Frete de 22.50
//Senão - Frete de 37.50
Var
// Seção de Declarações das variáveis 
valorDaCompra, valorFinal: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o valor da compra: ")
leia(valorDaCompra)

se(valorDaCompra >= 300) entao
escreval("Frete Grátis")
   senao
   se(valorDaCompra >= 200) entao
   valorFinal <- valorDaCompra + 15.50
   escreval("Você pagará R$ 15.50 de frete,")
   escreval("a sua compra é no valor de R$ ",valorFinal)
      senao
      se(valorDaCompra >= 150) entao
      valorFinal <- valorDaCompra + 25.50
      escreval("Você pagará R$ 25.50 de frete,")
      escreval("a sua compra é no valor de R$ ",valorFinal)
         senao
         valorFinal <- valorDaCompra + 37.50
         escreval("Você pagará R$ 37.50 de frete,")
         escreval("a sua compra é no valor de R$ ",valorFinal)
      fimse
   fimse
fimse
Fimalgoritmo