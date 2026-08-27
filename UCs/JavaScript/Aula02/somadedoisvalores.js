//Configurando a entrada de dados pelo usuário

const readline = require('readline');
/*
O modulo Readline é uma biblioteca nativa que permite a leitura de dados pelo usuário de 
forma interativa. É frequentemente usado para criar prompts, coletando respostas dos 
usuários, ele conecta entrada e saída de dados
*/

//Criando a interface para o usuário
const rl = readline.createInterface({
    input:process.stdin, //Criando a interação humana
    output:process.stdout //Usado para a saída dos dados
});

rl.question('Digitre o seu nome: ',(nome) => {
rl.question('Digite o primeiro valor: ',(valor1) => {
rl.question('Digite o segundo valor: ',(valor2) => {

    const soma = Number(valor1) + Number(valor2);

    console.log('===== RESULTADO =====');
    console.log(`Nome: ${nome}`)
    console.log(`Soma dos valores: ${soma}`);

    rl.close();
});
});
});