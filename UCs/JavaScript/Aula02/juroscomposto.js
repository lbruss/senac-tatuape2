const readline = require('readline')

const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});

rl.question('Digite o capital aplicado: ',(c) => {
rl.question('Digite a taxa de juros: ',(i) => {
rl.question('Digite o tempo (em meses): ',(t) => {

    const composto = Number(c) * (1 + (Number(i)/100)) ** Number(t);

console.log(`O juros composto é de ${composto}`);
rl.close();
});
});
});