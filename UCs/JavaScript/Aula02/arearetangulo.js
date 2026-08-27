const readline = require('readline');

const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});

rl.question('Digite o valor da base: ', (b) => {
rl.question('Digite o valor da altura: ', (h) => {

    let area = Number(b) * Number(h);

console.log('===== RESULTADO =====');
console.log(`A área do retângulo é de: ${area} m²`);
rl.close();
});
});