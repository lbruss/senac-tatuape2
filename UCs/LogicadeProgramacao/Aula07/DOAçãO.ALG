Algoritmo "Doação"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   : Escolha a doação
// Autor(a)    : Bruss Loza
// Data atual  : 28/07/2026
Var
// Seção de Declarações das variáveis 
doacao, valor: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Doação para uma pessoa bem humilde (Eu)")
escreval("")
escreval("Digite o número de acordo com a sua escolha")
escreval("")
escreval("1 - Doar R$ 10,00")
escreval("2 - Doar R$ 25,00")
escreval("3 - Doar R$ 50,00")
escreval("4 - Doar outro valor")
escreval("5 - Cancelar a doação")

leia(doacao)
escolha doacao

caso 1
escreval("Você doou R$ 10,00")

caso 2
escreval("Você doou R$ 25,00")

caso 3
escreval("Você doou R$ 50,00")

caso 4
escreval("Digite o valor desejado")
leia(valor)
escreval("Você doou R$",valor)

caso 5
escreval("Você doou o total de 0 reais.")

outrocaso
escreval("Valor inválido")

fimescolha

Fimalgoritmo