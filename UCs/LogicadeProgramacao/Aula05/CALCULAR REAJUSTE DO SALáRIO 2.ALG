Algoritmo "Calcular reajuste do salário 2"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss
// Data atual  : 23/06/2026
Var
// Seção de Declarações das variáveis
salario, valorFinal, aumento1, aumento2, aumento3: real
nome: caractere

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o seu nome")
leia(nome)
escreval("Digite o seu salário")
leia(salario)
escreval("Funcionário: ",nome)

se(salario >= 3000) entao
aumento1 <- 5/100
valorFinal <- salario + salario * aumento1
escreval("O seu salário teve um reajuste de 5%, então")
escreval("foi de R$",salario," para R$",valorFinal)
   senao
   se(salario >= 2000) entao
   aumento2 <- 10/100
   valorFinal <- salario + salario * aumento2
   escreval("O seu salário teve um reajuste de 10%, então")
   escreval("foi de R$",salario," para R$",valorFinal)
      senao
      aumento3 <- 15/100
      valorFinal <- salario + salario * aumento3
      escreval("O seu salário teve um reajuste de 15%, então")
      escreval("foi de R$",salario," para R$",valorFinal)
   fimse
fimse
   
Fimalgoritmo