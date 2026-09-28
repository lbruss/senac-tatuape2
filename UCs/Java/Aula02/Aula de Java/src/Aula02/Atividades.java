package Aula02;
public class Atividades {
	public static void main(String[] args) {
/*
ATIVIDADE 1 
Nos Estados Unidos a temperatura em geral é medida em uma escala
dedominada fahrenheit. Desenvolva uma aplicação no console
(terminal) que faça a conversão da temperatura em Fahrenheit
para Celsius.

Variáveis: c,f (double)
Entrada: f
Processamento: c = (5 * (f - 32)) / 9
Saída: c

*/	
		System.out.println("Atividade 1");
		System.out.println("Conversão de Fahrenheit para Celsius");
		System.out.println("");
		double f = 100;
		double c = (5 * (f - 32)) / 9;
		
		System.out.println("A temperatura de " + f + " Fahrenheit, é de: " + c + " graus Celsius");
		
		/*Jeito da professora
		 * 
		System.out.println("Conversão de Fahrenheit para Celsius");
		System.out.println("");
		double f = 100;
		double c = (5 * (f - 32)) / 9; 
		
		System.out.println("Temperatura em Fahrenheit: " + f);
		System.out.printf("Temperatura em Celsius: %.2f%n" , c);
		*/
		
/*
ATIVIDADE 2
Para carros flex é preciso ter cautela ao escolher o combutível
na hora de abastecer. A principal diferença de preços e vantagens
entre os dois combustíveis está na proporção preço X desempenho.
Para o álcool ser mais vantajoso do que a gasolina, o preço do litro 
tem que custar até 70% do litro da gasolina. Baseado nestas informações 
desenvolva um aplicativo no console (terminal) para determinar qual é o
combustível mais vantajoso para abastecer

Variáveis: alcool, gasolina (double)
Entrada: alcool, gasolina
Processamento / Saída

 */
		System.out.println("");
		System.out.println("Atividade 2");
		System.out.println("Qual é mais vantajoso: Alcool X Gasolina");
		System.out.println("");
		
		double alcool = 250;
		double gasolina = 100;
		
		if(alcool < 0.7 * gasolina) {
			System.out.println("O alcool é mais vantajoso");
		}else {
			System.out.println("A gasolina é mais vanjatosa");
		}
/*
ATIVIDADE 3 
*/
		System.out.println("");
		System.out.println("Atividade 3");
		System.out.println("Calcular valor IMC");
		System.out.println("");	
		
		double peso = 75; 
        double altura = 1.75;
        
        String classificacao;
        double imc = peso / (altura * altura);

        if (imc < 18.5) {
            classificacao = "abaixo do peso";
        } else if (imc <= 24.9) {
            classificacao = "Peso ideal";
        } else if (imc <= 29.9) {
            classificacao = "Levemente acima do peso";
        } else if (imc <= 34.9) {
            classificacao = "Obesidade grau I";
        } else if (imc <= 39.9) {
            classificacao = "Obesidade grau II (severa)";
        } else {
            classificacao = "Obesidade III (mórbida)";
        }

        System.out.println("Peso: " + peso + " kg");
        System.out.println("Altura: " + altura + " m");
        System.out.printf("IMC: %.2f%n", imc);
        System.out.println("Classificação: " + classificacao);
    }

}


