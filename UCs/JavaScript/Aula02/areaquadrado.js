const readline = require('readline');

const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});

rl.question('Digite lado 1: ', (l1) => {
rl.question('Digite lado 2: ', (l2) => {

    let area = Number(l1) * Number(l2);

console.log('===== RESULTADO =====');
console.log(`A área do quadrado é de: ${area} m²`);
rl.close();
});
});