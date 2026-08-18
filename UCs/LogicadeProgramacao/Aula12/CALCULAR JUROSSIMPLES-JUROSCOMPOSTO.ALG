Algoritmo "Calcular JurosSimples-JurosComposto"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Autor(a)    : Bruss Loza
// Data atual  : 07/08/2026
Var
simples,composto,c,i,t: real
//Juros Simples: J = C * i * t - sendo:
//J = Juros
//C = Capital (valor investido)
//i= taxa de juros (em decimal)
//t= tempo de aplicação (pode ser em meses ou anos)

//Juros compostos: M = C (1 + i) ^ t, sendo:
//M = Montante
//C = Capital aplicado
//i = taxa de juros (em decimal)
//t = tempo de aplicação (pode ser em meses ou anos)
Inicio
escreval("===== Algoritmo para calcular Juros Simples e Juros Composto =====")
escreval("")
escreval("Digite o capital aplicado:")
leia(c)
escreval("Digite a taxa de juros:")
leia(i)
escreval("Digite o tempo (em meses):")
leia(t)

simples <- c * (i/100) * t
composto <- c * (1 + (i/100)) ^ t

escreval("O Juros Simples é de:",simples)

escreval("O Juros Composto é de:",composto)

Fimalgoritmo