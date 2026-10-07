package Aula04;
public class Ferrari {
	public static void main(String[] args) {
		Carro ferrari = new Carro();
		
		ferrari.ano = 2026;
		ferrari.cor = "Roxo";
		
		System.out.println("Carro Ferrari");
		System.out.println("Ano: " + ferrari.ano);
		System.out.println("Cor: " + ferrari.cor);
		
		ferrari.ligar();
		ferrari.acelerar();
	}
}
