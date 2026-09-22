//Declarando as funções
function Media(a,b,c,d){
    return (a+b+c+d)/4;
}

//Criando as variáveis
var nota1=0,nota2=0,nota3=0,nota4=0;

//Mensagem para o usuário
alert('Informe as 4 notas do(a) aluno(a)');

//Solicitando as notas para o usuário
nota1=parseInt(prompt('Digite o 1º nota',''));
nota2=parseInt(prompt('Digite o 2º nota',''));
nota3=parseInt(prompt('Digite o 3º nota',''));
nota4=parseInt(prompt('Digite o 4º nota',''));

//Mostrando o resultado
document.getElementById('teste').innerHTML += Media(nota1,nota2,nota3,nota4);