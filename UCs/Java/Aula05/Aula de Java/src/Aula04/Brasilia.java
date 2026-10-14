package Aula04;
public class Brasilia {
	public static void main(String[] args) {
		Carro brasilia = new Carro(1988, "Roxo");
		System.out.println("Carro Brasília");
		System.out.println("ano: " + brasilia.ano);
		System.out.println("Cor: " + brasilia.cor);
		
		brasilia.ligar();
		brasilia.acelerar();
		brasilia.desligar();
	}
}
