package CursoJava;
public class LacoRep3 {
	public static void main(String[] args) {
		System.out.println("Tabuada");
		
		for (int tabuada=1; tabuada<=15; tabuada++) {
			System.out.println("");
			for(int valor=1; valor<=10; valor++) {
				int resultado=tabuada*valor;
				System.out.println(tabuada+" x "+valor+" = "+resultado);
			}
		}
	}

}
