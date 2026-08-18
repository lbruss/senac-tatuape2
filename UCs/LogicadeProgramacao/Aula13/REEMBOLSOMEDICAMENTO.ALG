Algoritmo "ReembolsoMedicamento"

Var
nome:caractere
valorMedicamento,valorReembolso:real
notaFiscal, receita:caractere

Inicio
escreval("Digite o nome do cooperado:")
leia(nome)
escreval("Digite o valor do medicamento:")
leia(valorMedicamento)
escreval("A nota fiscal foi apresentada?(S/N):")
leia(notaFiscal)
escreval("A receita médica foi apresentada?(S/N):")
leia(receita)

se (notaFiscal = "S") e (receita = "S") ou (notaFiscal = "s") e (receita = "s") entao
valorReembolso <- valorMedicamento * 0.50
escreval("Cooperado:",nome)
escreval("O valor do medicamento: R$",valorMedicamento)
escreval("O valor do reembolso: R$,"valorReembolso)
senao
escreval("O cooperador não tem direito ao reembolso")
fimse

Fimalgoritmo