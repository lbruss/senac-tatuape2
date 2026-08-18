Algoritmo "ReceitaDeBolo"

Var
leite, trigo, ovo, manteiga, fermento: real
valorLeite, valorTrigo, valorOvo, valorManteiga, valorFermento: real
lucro, totalIngredientes, totalPagar: real

//Faça um algoritmo para vender os ingredientes de uma receita de
//bolo. No início, mostre os ingredientes, suas quantidades e seus
//preços. Depois, peça para o usuário informar quanto deseja de cada
//ingrediente. O algoritmo deve calcular o preço de cada quantidade,
//somar o valor de todos os ingredientes e o lucro informado pelo
//vendedor, que é de R$15,00. No final, mostre as quantidades
//escolhidas, o valor de cada ingrediente(de acordo com a quantidade
//escolhida pelo usuário), o total dos ingredientes, o lucro e o
//valor total que o cliente deverá pagar.

Inicio
escreval("=========INGREDIENTES DISPONIVEIS=========")
escreval("")
escreval("Leite - 1L - R$6,00")
escreval("Trigo - 1Kg - R$5,00")
escreval("Ovo - 1 unidade - R$1,50")
escreval("Manteiga - 1Kg - R$30,00")
escreval("Fermento - 100g - R$7,00")
escreval("")

escreva("Digite a quantidade de leite em ml: ")
leia(leite)
escreva("Digite a quantidade de trigo em gramas: ")
leia(trigo)
escreva("Digite a quantidade de ovos: ")
leia(ovo)
escreva("Digite a quantidade de manteiga em gramas: ")
leia(manteiga)
escreva("Digite a quantidade de fermento em gramas: ")
leia(fermento)

lucro <- 15

valorLeite <- (leite * 6) / 1000
valorTrigo <- (trigo * 5) / 1000
valorOvo <- ovo * 1.50
valorManteiga <- (manteiga * 30) / 1000
valorFermento <- (fermento * 7) / 100

totalIngredientes <- valorLeite + valorTrigo + valorOvo + valorManteiga + valorFermento

totalPagar <- totalIngredientes + lucro

escreval("")
escreval("=========RESUMO DA COMPRA=========")
escreval("Leite:",leite,"ml - R$",valorLeite)
escreval("Trigo:",trigo,"g - R$",valorTrigo)
escreval("Ovos:",ovo," unidade(s) - R$",valorOvo)
escreval("Manteiga:",manteiga,"g - R$",valorManteiga)
escreval("Fermento:",fermento,"g - R$",valorFermento)
escreval("")
escreval("Valor dos ingredientes: R$",totalIngredientes)
escreval("Lucro: R$",lucro)
escreval("Total a pagar: R$",totalPagar)

Fimalgoritmo