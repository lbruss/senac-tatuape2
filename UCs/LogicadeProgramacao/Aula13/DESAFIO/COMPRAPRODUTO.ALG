Algoritmo "CompraProduto"
//Faça um algoritmo que peça o nome de um produto, seu preço e a
//quantidade comprada. Calcule o valor total da compra. Se o
//total for maior ou igual a R$ 100, dê um desconto de 10%. No
//final, mostre o valor da compra e o valor final com o desconto.

Var
produto: caractere
preco, total, desconto, valorFinal: real
quantidade: inteiro

Inicio

escreva("Digite o nome do produto: ")
leia(produto)

escreva("Digite o preço do produto: ")
leia(preco)

escreva("Digite a quantidade comprada: ")
leia(quantidade)

total <- preco * quantidade

se total >= 100 entao
   desconto <- total * 0.10
   valorFinal <- total - desconto
senao
   valorFinal <- total
fimse

escreval("Produto: ", produto)
escreval("Valor da compra: ", total)
escreval("Valor final: ", valorFinal)

Fimalgoritmo