package Aula04;
public class Embraer {
	public static void main(String[] args) {
		Aviao embraer = new Aviao();
		
		embraer.ano = 2000;
		embraer.cor = "Amarelo";
		embraer.envergadura = 11;
		
		System.out.println("Avião Embraer");
		System.out.println("Ano: " + embraer.ano);
		System.out.println("Cor: " + embraer.cor);
		System.out.println("Envergadura: " + embraer.envergadura + "m");
		
		embraer.ligar();
		embraer.acelerar();
		embraer.aterrizar();
		embraer.desligar();
	}
}
