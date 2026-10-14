package contas;

public class Conta {
	//Atributos
	protected String clientes;
	protected double saldo;
	
	//Contrutor
	public Conta() {
		System.out.println("Agência 0123");
	}
	
	//Método 
	protected void exibirSaldo() {
		System.out.println("Saldo: R$ "+saldo);
	}
	
	//NOVOS COMANDOS - MÉTODOS (FUNÇÕES)
	void sacar(double valor) {
		saldo -= valor;
		
		System.out.println("Débito: R$ "+valor);
	}
	
	void depositar(double valor) {
		saldo += valor;
		
		System.out.println("Crédito: R$ "+valor);
	}
}
