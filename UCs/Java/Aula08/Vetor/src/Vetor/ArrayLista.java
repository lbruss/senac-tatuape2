package Vetor;

import java.util.ArrayList;

public class ArrayLista {

	public static void main(String[] args) {
		ArrayList<String> contatos = new ArrayList<>();
		
		//ADICIONANDO DADOS
		contatos.add("Bruss Loza");
		contatos.add("11 1234-5678");
		contatos.add("bruasssloza@email.com");
		
		contatos.add("Sirlene Sanches");
		contatos.add("11 1234-1234");
		contatos.add("sirlenesanches@email.com");
		
		contatos.add("Leandro Ramos");
		contatos.add("11 8765-4321");
		contatos.add("ramos@email.com");
		
		//SABER O TAMANHO DO ARRAY
		System.out.println("Tamanho do array: " + contatos.size());
		System.out.println(contatos);
		
		//ACHAR ALGUM DADO
		System.out.println("Email -> Sirlene Sanches: (índice[5]) " + contatos.get(5));
		
		//TRAZER TODOS OS DADOS
		System.out.println("");
		System.out.println("===============================");
		for (int i = 0; i < contatos.size(); i++) {
			System.out.println(contatos.get(i));
		}
	}
}
