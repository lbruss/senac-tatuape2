Algoritmo "Mercado"

Var
produtos: vetor[1..10] de caractere
preco: vetor[1..10] de real
escolhidos: vetor[1..3] de caractere
nome: caractere
opcao,i: inteiro
total: real

Inicio
escreva("Digite o nome do comprador: ")
leia(nome)

produtos[1] <- "Arroz"
preco[1] <- 25.00

produtos[2] <- "Feijão"
preco[2] <- 9.00

produtos[3] <- "Macarrão"
preco[3] <- 6.00

produtos[4] <- "Leite"
preco[4] <- 6.00

produtos[5] <- "Café"
preco[5] <- 19.00

produtos[6] <- "Açucar"
preco[6] <- 5.00

produtos[7] <- "Óleo"
preco[7] <- 8.00

produtos[8] <- "Sabonete"
preco[8] <- 4.00

produtos[9] <- "Refrigerante"
preco[9] <- 10.00

produtos[10] <- "Chocolate"
preco[10] <- 7.00

escreval()
escreval("LISTA DE PRODUTOS")

para i de 1 ate 10 faca
escreval(i," - ",produtos[i]," - R$ ",preco[i]:0:2)
fimpara

total <- 0

escreval()

para i de 1 ate 3 faca

escreva("Escolha o produto ",i," (1 a 10): ")
leia(opcao)

escolhidos[i] <- produtos[opcao]
total <- total + preco[opcao]

fimpara

escreval()

escreval("Comprador: ",nome)
escreval()

escreval("Produtos comprados:")

para i de 1 ate 3 faca
      escreval("- ",escolhidos[i])
fimpara

escreval()
escreval("Total da compra: R$",total:0:2)

Fimalgoritmo