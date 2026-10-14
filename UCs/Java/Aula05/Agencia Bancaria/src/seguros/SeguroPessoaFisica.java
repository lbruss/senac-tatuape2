package seguros;

import contas.Conta;

public class SeguroPessoaFisica extends Conta{
	public static void main(String[] args) {
		// Antes estava assim: Conta cc3 = new Conta();
		SeguroPessoaFisica cc3 = new SeguroPessoaFisica();
		cc3.setClientes("José de Assis");
		cc3.setSaldo(2000);
		System.out.println("Cliente: "+cc3.getClientes());
		cc3.exibirSaldo();
	}
}