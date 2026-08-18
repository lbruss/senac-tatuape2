Algoritmo "Verificar se é da empresa ou é visitante"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Verificar se é Funcionário ou Visitante
// Autor(a)    : Bruss Loza
// Data atual  : 30/06/2026
Var
// Seção de Declarações das variáveis 
cracha, visitante: logico

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Tem crachá? (V/F): ")
leia(cracha)
escreval("É visitante autorizado? (V/F): ")
leia(visitante)

se(cracha = verdadeiro) ou (visitante = verdadeiro) entao
   escreval("ACESSO PERMITIDO")
senao
   escreval("ACESSO NEGADO")
fimse
Fimalgoritmo