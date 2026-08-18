Algoritmo "Equação_2_grau"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinicius
// Descrição   :
// Autor(a)    : Bruss Loza
// Data atual  : 06/08/2026
Var
// Seção de Declarações das variáveis 
a,b,c,delta,x1,x2:real

Inicio
//Entrada de dados
escreval("Algoritmo para Calcular a Equação do 2º Grau")
escreval("ax² + bx + c = 0")
escreval("")
escreval("Digite o valor de a:")
leia(a)
escreval("Digite o valor de b:")
leia(b)
escreval("Digite o valor de c:")
leia(c)

//Verificar se realmente é uma Equação do 2º Grau
se (a=0) entao
escreval("O valor de 'a' não pode ser 0 (Zero). Não é um Equação do 2º Grau")
senao
//Calcular o valor de Delta
delta <- (b*b)-(4*a*c)
//Analizar o valor de Delta
se (delta < 0) entao
escreval("Delta = ",delta:0:2," Não existem raízes reais")
senao
se (delta=0) entao
x1 <- (-b)/(2*a)
escreval("Delta = 0 -> Raíz única: x = ",x1:0:2)
senao
x1 <- (-b + raizq(delta))/(2*a)
x2 <- (-b - raizq(delta))/(2*a)
escreval("Delta = ",delta:0:2)
escreval("x1 = ",x1:0:2)
escreval("x2 = ",x2:0:2)
fimse
fimse
fimse

Fimalgoritmo