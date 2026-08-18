Algoritmo "Horário do Voo"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Bruss Loza
// Data atual  : 30/06/2026
Var
// Seção de Declarações das variáveis 
horario, antes, valor, desconto, valorFinal: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o horário do seu voo: ")
leia(horario)
escreval("Digite o valor da passagem: ")
leia(valor)

se(horario > 0) e (horario <= 5) entao
desconto <- valor - valor * (25/100)
escreval("De acordo com o seu horário, você recebeu um desconto de 25%.")
escreval("Você pagaria ",valor)
escreval("Agora você vai pagar ",desconto)
senao
escreval("Você continuará pagando o valor normal")
fimse

Fimalgoritmo