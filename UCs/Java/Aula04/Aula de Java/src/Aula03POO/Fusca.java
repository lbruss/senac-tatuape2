package Aula03POO;
public class Fusca {
	public static void main(String[] args) {
		Carro fusca = new Carro();
		
		fusca.ano = 1967;
		fusca.cor = "Amarelo";
		
		System.out.println("Carro Fusca");
		System.out.println("Ano: " + fusca.ano);
		System.out.println("Cor: " + fusca.cor);
		
		fusca.ligar();
		fusca.acelerar();
		fusca.desligar();
		
	}

}
