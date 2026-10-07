package Aula02;
public class Condicional {
	public static void main(String[] args) {
		char sexo = 'M';
		int idade = 19;
		System.out.println("Estrutura de Controle Condicional");
		System.out.println("");
		System.out.println("Exemplo 1: uso do if");
		//sexo = 'F';
		
		if(sexo == 'M') {
			System.out.println("Alistamento militar obrigatório!");
		}
		
		System.out.println("");
		System.out.println("Exemplo 2: uso do if-else");
		//idade = 15;
		
		if(idade < 18) {
			System.out.println("Você é menor de idade!");
		} else {
			System.out.println("Você é maior de idade");
		}
		
		System.out.println("");
		System.out.println("Exemplo 3: uso do else-if");
		
		//idade 14
		
		if(idade < 16) {
			System.out.println("Proibido votar!");
		}else if(idade >= 18 && idade <= 70) {
			System.out.println("obrigatório votar!");
		}else {
			System.out.println("Voto facultativo!");
		}
		
		System.out.println("");
		System.out.println("Exemplo 4: uso do Switch case");
		System.out.println("1 - Cadastro de clientes");
		System.out.println("2 - Cadastro de usuários");
		System.out.println("3 - Relatórios");
		
		int opcao = 1;
		
		switch (opcao) {
			case 1: 
				System.out.println("Clientes");
				break;
			case 2:
				System.out.println("Usuários");
				break;
			case 3:
				System.out.println("Relatórios");
				break;
			default:
				System.out.println("Opção invalida!");
				break;
		}
	}
}
