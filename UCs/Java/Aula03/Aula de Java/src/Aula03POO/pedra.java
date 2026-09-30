package Aula03POO;
public class pedra {
	public static void main(String[] args) {
		minecraft pedra = new minecraft();
		
		pedra.resistencia = 100; 
		pedra.textura = "Rochosa";
		
		System.out.println("Bloco: Pedra");
		System.out.println("Resistencia: " + pedra.resistencia);
		System.out.println("Textura: " + pedra.textura);
		
		pedra.construir();
		pedra.minerar();
		pedra.craftar();
	}
}