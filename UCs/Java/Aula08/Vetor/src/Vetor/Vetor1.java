package Vetor;

public class Vetor1 {

	public static void main(String[] args) {
		String[] carros = {"ferrari", "camaro", "fusca", "combi", "brasilia", "porche"};
		//MOSTRA O TAMANHO DO "ARRAY"
		System.out.println("Tamanho do array: " + carros.length);
		
		//CHAMA A POSIÇÃO DESEJADA
		System.out.println("Carro: " + carros[3]);
		
		//MODIFICAR O ARRAY
		carros[3] = "gol";
		System.out.println("Carro: " + carros[3]);
		
		//MOSTRAR TODOS OS DADOS DO ARRAY
		System.out.println("");
		System.out.println("-------------------");
		System.out.println("Carros");
		System.out.println("");
		
		for (int i = 0; i < carros.length; i++) {
			System.out.println(carros[i]);
		}
	}
}
