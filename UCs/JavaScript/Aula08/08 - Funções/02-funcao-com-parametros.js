//Declarando a função
function Soma(a,b){
    return a + b;
    /*
    A função Soma recebe dois valores (a e b) e
    ela retorna a soma desses valores.
    Aqui não há o document.getElementById dentro da função
    ela apenas devolve o resultado.
    */
}
//Declarando as variáveis
var num1=0, num2=0;
/*
Criando as variáveis para armazenar os
números digitados pelo usuário.
*/

//Solicitar os valores para o usuário
num1=parseInt(prompt('Digite o 1º número',""));
num2=parseInt(prompt('Digite o 2º número',""));
/*
* O prompt abre uma caixa de diálogo pedindo que o usuário digite um valor.
* O valor digitado vem como String.
* O parseInt converte esta String em número inteiro, para que
seja possível somar.
*/

//Exibindo o resultado
document.getElementById('teste').innerHTML += Soma(num1,num2);
/*
* Chama a função Soma(num1,num2) passsando os valores digitados.
* O resultado é inserido no elemento HTML com id="teste".
* O operador += adiciona o resultado ao conteúdo já
existente dentro desse elemento.
*/