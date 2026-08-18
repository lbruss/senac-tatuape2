Algoritmo "Calculadora"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss
// Data atual  : 19/06/2026
Var
// Seção de Declarações das variáveis 
num1, num2, resSoma, resSub, resMult, resDiv: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
 //bloco de Entrada de Dados
 escreval("Digite o primeiro número")
 leia(num1)
 escreval("Digite o segundo número")
 leia(num2)
 
 //Processamento de Dados
 resSoma <- num1 + num2
 resSub <- num1 - num2
 resMult <- num1 * num2
 resDiv <- num1 / num2
 
 //Sáida dos Dados
 escreval("A soma dos dois valores é: ",resSoma)
 escreval("A subtração dos dois valores é: ",resSub)
 escreval("A multiplicação dos dois valores é: ",resMult)
 escreval("A divisão dos dois valores é: ",resDiv)

Fimalgoritmo