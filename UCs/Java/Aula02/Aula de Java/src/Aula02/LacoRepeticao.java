package Aula02;
public class LacoRepeticao {
	public static void main(String[] args) {
		System.out.println("Estrutura de Repetição");
		System.out.println("Uso do FOR");
		System.out.println("");
		
		for (int i = 10; i > 0; i--) {
			System.out.println("Hello, Bruss");
		}
		
		System.out.println("");
		System.out.println("Contagem de 0 até 10");
		
		for (int j = 0; j <= 10; j++) {
			System.out.println(j);
		}
		
		System.out.println("");
		System.out.println("Tabuada");
		
		for (int tab = 0; tab <= 10; tab++) {
			System.out.println("");
			for (int valor = 0; valor <= 10; valor++) {
				System.out.println(tab + " x " + valor + " = " + tab * valor);
			}
		}
		
		System.out.println("");
		System.out.println("Exemplo 2: Uso do WHILE");
		
		int cont = 1;
		while(cont <= 10) {
			System.out.println(cont);
			cont++;
		}
		
		System.out.println("");
		System.out.println("Exemplo 3: Uso do DO-WHILE");
		char novoJogo = 'n';
		
		do {
			System.out.println("Deseja jogar novamente[s/n]?");
			novoJogo = 'n';
		}while(novoJogo == 's');
		System.out.println("Game Over");
		
		System.out.println("");
		String sinal = "verde";
		
		do {
			System.out.println("O sinal está "+ sinal);
			sinal = "vermelho";
		}while(sinal=="verde");
		
		System.out.println("O sinal mudou. Pare!");
	}
}
