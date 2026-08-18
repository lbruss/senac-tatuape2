Algoritmo "Cadastrar animais"

Var
peso :real
nome, sexo,data:caractere
idade:inteiro

Inicio

escreval("Digite o nome do seu animal: ")
leia(nome)
escreval("Digite o sexo do animal:")
leia(sexo)
escreval("Digite o peso do animal em Kg:")
leia(peso)
escreval("Digite a idade do animal em meses:")
leia(idade)
escreval("Digite a data de retirada do animal:")
leia(data)

se (idade > 6) entao
escreval("você pode adotar o seu animal")
senao
escreval("o animal não está disponivel para adoação")

fimse

Fimalgoritmo