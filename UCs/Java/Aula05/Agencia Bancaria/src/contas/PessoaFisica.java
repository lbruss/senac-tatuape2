package contas;
public class PessoaFisica {
	public static void main(String[] args) {
		Conta cc1 = new Conta();
		
		cc1.clientes="Bruss Loza";
		cc1.saldo=100000;
		
		System.out.println("Cliente: "+cc1.clientes);
		cc1.exibirSaldo();
		
		//CÓDIGO NOVO
		cc1.sacar(1000);
		cc1.exibirSaldo();
		//APENAS
		
		//NOVO CLIENTE
		System.out.println("");
		System.out.println("---------------------------------");
		
		Conta cc2=new Conta();
		cc2.clientes="Sirlene Sanches";
		cc2.saldo=2500;
		System.out.println("Cliente: "+cc2.clientes);
		cc2.exibirSaldo();
		
		//CÓDIGO NOVO
		cc2.depositar(300);
		cc2.exibirSaldo();
		//APENAS
	}
}
