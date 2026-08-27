const readline = require('readline');

const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});

rl.question('Digite o valor da diagonal maior: ', (D) => {
rl.question('Digite o valor da diagonal menor: ', (d) => {

    let area = (Number(D) * Number(d)) / 2;

console.log('===== RESULTADO =====');
console.log(`A área do losango é de: ${area} m²`);
rl.close();
});
});
