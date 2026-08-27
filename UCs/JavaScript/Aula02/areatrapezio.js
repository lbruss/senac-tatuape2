const readline = require('readline');

const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});

rl.question('Digite o valor da base maior: ', (B) => {
rl.question('Digite o valor da base menor: ', (b) => {
rl.question('Digite o valor da altura: ', (h) => {

    let area = ((Number(B) + Number(b)) * h) / 2;

console.log('===== RESULTADO =====');
console.log(`A área do trapézio é de: ${area} m²`);
rl.close();
});
});
});