package seguros;

import contas.Conta;

public class SeguroPessoaFisica extends Conta{
	public static void main(String[] args) {
		// Antes estava assim: Conta cc3 = new Conta();
		SeguroPessoaFisica cc3 = new SeguroPessoaFisica();
		cc3.clientes = "José de Assis";
		cc3.saldo = 2000;
		System.out.println("Cliente: "+cc3.clientes);
		cc3.exibirSaldo();
	}
}