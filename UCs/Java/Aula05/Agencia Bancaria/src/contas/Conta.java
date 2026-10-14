package contas;

public class Conta {
	//Atributos
	private String clientes;
	public String getClientes() {
		return clientes;
	}
	
	public void setClientes(String clientes) {
		this.clientes = clientes;
	}
	
	private double saldo;
	public double getSaldo() {
		return saldo;
	}
	
	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	

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
	
	//NOVOS COMANDOS - MÉTODOS (FUNÇÕES) 2
	void transferir(Conta destino, double valor) {
		 this.sacar(valor);
		 destino.depositar(valor);
		 System.out.println("transferencia: R$ "+ valor);
	}
	 
	double soma(double cc1, double cc2) {
	double total = cc1 + cc2;
	return total;
	}
}