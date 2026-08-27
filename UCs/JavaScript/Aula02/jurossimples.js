const readline = require('readline')

const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});

rl.question('Digite o capital aplicado: ',(c) => {
rl.question('Digite a taxa de juros: ',(i) => {
rl.question('Digite o tempo (em meses): ',(t) => {

    const simples = Number(c) * (Number(i)/100) * Number(t)
    const montante = Number(c) + Number(simples)

console.log(`O juros simples é de ${simples}`);
console.log(`O valor do montante é de ${montante}`);
rl.close();
});
});
});