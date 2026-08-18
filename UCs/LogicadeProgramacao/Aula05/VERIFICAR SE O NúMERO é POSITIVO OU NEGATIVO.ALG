Algoritmo "Verificar se o número é Positivo ou Negativo"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss
// Data atual  : 25/06/2026
Var
// Seção de Declarações das variáveis 
numero: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite um número")
leia(numero)

se(numero = 0) entao
escreval("Seu número não é nem Positivo e nem Negativo")
   senao
   se(numero > 0) entao
   escreval("Seu número é Positivo")
      senao
      escreval("Seu número é Negativo")
   fimse
fimse
Fimalgoritmo