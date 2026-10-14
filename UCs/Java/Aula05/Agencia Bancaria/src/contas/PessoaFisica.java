package contas;
public class PessoaFisica {
	public static void main(String[] args) {
		Conta cc1 = new Conta();
		
		cc1.setClientes("Bruss Loza");
		cc1.setSaldo(100000);
		
		System.out.println("Cliente: "+cc1.getClientes());
		cc1.exibirSaldo();
		
		//CÓDIGO NOVO
		cc1.sacar(1000);
		cc1.exibirSaldo();
		//APENAS
		
		//NOVO CLIENTE
		System.out.println("");
		System.out.println("---------------------------------");
		
		Conta cc2=new Conta();
		cc2.setClientes("Sirlene Sanches");
		cc2.setSaldo(2500);
		System.out.println("Cliente: "+cc2.getClientes());
		cc2.exibirSaldo();
		
		//CÓDIGO NOVO
		cc2.depositar(300);
		cc2.exibirSaldo();
		//APENAS
		
		//CÓDIGO NOVO 2
		System.out.println("");
		System.out.println("------------------------");
		System.out.println("Transferencia");
		System.out.println("cliente: "+ cc2.getClientes());
		System.out.println("favorecido: "+ cc1.getClientes());
				
		cc2.transferir(cc1, 500);
				
		System.out.println("");
		System.out.println("cliente: "+ cc2.getClientes());
		cc2.exibirSaldo();
				
		System.out.println("cliente: "+ cc1.getClientes());
		cc1.exibirSaldo();
				
		System.out.println("------------------------");
		System.out.println("Relatorio gerencial");
				
		Conta gerente = new Conta();
		double relatorio = gerente.soma(cc1.getSaldo(),cc2.getSaldo());
		System.out.println("saldo total nas contas "+ relatorio);
		//APENAS 2	
	}
}
