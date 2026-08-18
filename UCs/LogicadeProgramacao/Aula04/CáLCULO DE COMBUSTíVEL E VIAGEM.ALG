Algoritmo "Cálculo de combustível e viagem"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Vinícius
// Descrição   : Calcular o quanto se pagará para abastecer um automóvel
//               e quantos litros foram gastos por km rodadd
// Autor(a)    : Bruss
// Data atual  : 23/06/2026
Var
// Seção de Declarações das variáveis 
valorCombustivel, litrosCombustivel, resultado: real
kmPercorrido, kmLitro, consumo: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o valor do combustível: ")
leia(valorCombustivel)
escreval("Digite a quantidade de litros abastecida: ")
leia(litrosCombustivel)
escreval("Digite quantos Km/L o carro faz: ")
leia(kmLitro)
escreval("Informe quantos km foram percorridos: ")
leia(kmPercorrido)
escreval("")

resultado <- valorCombustivel * litroscombustivel
consumo <- kmPercorrido / litrosCombustivel
escreval("O valor a ser pago será de R$ ",resultado)
escreval("O seu consumo será de: ",consumo,"Km/L")

Fimalgoritmo