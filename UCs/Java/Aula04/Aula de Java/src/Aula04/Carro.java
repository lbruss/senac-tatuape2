package Aula04;

import java.util.Random;

public class Carro {
	/*Criação de variáveis*/
	int ano;
	String cor;
	
	/*Sem parâmetros
	 Ele está aqui para que ele apareça na Ferrari e no Fusca o chassi*/
	public Carro() {
		Random gerador = new Random();
		int chassi = gerador.nextInt(1000);
		System.out.println("Chassi: " + chassi);
	}
	
	/*Com parâmetros*/
	public Carro(int ano, String cor) {
		this.ano = ano;
		this.cor = cor;
		
		/*Ele está aqui para o brasilia, para que apareça o chassi na brasília*/
		Random gerador = new Random();
		int chassi = gerador.nextInt(1000);
		System.out.println("Chassi: " + chassi);
		
	}
	
	/*Métodos: ligar, desligar e acelerar*/
	void ligar() {
		System.out.println("Engine ON..........");
	}
	
	void desligar() {
		System.out.println("Engine OFF.........");
	}
	
	void acelerar() {
		System.out.println("Vrummmmm...........");
	}
	
}
