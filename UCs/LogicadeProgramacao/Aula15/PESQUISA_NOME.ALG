Algoritmo "pesquisa_nome"
//Professor: Vinicius
//Autor: Bruss Loza
//Algoritmo para encontrar nome digitado
Var
a:vetor[1..5] de caractere
nome, resp:caractere
aux, achei:inteiro

Inicio
para aux de 1 ate 5 passo 1 faca
   escreva(aux, " Informe um nome: ")
   leia(a[aux])
fimpara

   repita
   achei<-0
   escreval("Informe um nome para ser pesquisado")
   leia(nome)
      para aux de 1 ate 5 passo 1 faca
      se(a[aux]=nome)entao
         escreva("Nome encontrado ",a[aux]," na posição",aux)
         achei<-1
      fimse
      fimpara

      se(achei<>1)entao
         escreva("Não foi encontrado nenhum nome na pesquisa")
      fimse
      escreval(" Deseja fazer outra pesquisa, S/N")
      leia(resp)
      ate resp<>"s"

Fimalgoritmo