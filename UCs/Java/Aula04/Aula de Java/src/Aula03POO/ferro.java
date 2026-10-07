package Aula03POO;
public class ferro {
	public static void main(String[] args) {
		minecraft ferro = new minecraft();
		
		ferro.resistencia = 150; 
		ferro.textura = "Dura";
		
		System.out.println("Bloco: Ferro");
		System.out.println("Resistencia: " + ferro.resistencia);
		System.out.println("Textura: " + ferro.textura);
		
		ferro.construir();
		ferro.minerar();
		ferro.craftar();
	}
}