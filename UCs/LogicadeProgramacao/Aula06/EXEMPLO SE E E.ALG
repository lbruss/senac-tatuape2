Algoritmo "Exemplo Se e E"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Verificar se as duas condições são verdadeiras
// Autor(a)    : Bruss Loza
// Data atual  : 30/06/2026
Var
// Seção de Declarações das variáveis 
documento: logico
peso: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Possui manifesto de carga? (V/F): ")
leia(documento)
escreval("Peso da carga(kg): ")
leia(peso)

se(documento = verdadeiro) e (peso <= 15000) entao
escreval("STATUS: LIBERADO")
senao
escreval("STATUS: RETIDO")
fimse

Fimalgoritmo