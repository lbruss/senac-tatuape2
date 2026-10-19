package NotaF;

import java.io.OutputStream;
import java.net.Socket;

public class NotaFiscal {

public static void main(String[] args) {
	try {
		Socket nota = new Socket("10.26.45.41", 9100);
		OutputStream saida = nota.getOutputStream();

		saida.write(new byte[] {0x1B, 0x40});

		saida.write(new byte[] {0x1B, 0x61, 0x01});

		saida.write(new byte[] {0x1D, 0x21, 0x11});
		saida.write(new byte[] {0x1B, 0x45, 0x01});
		saida.write("LOJINHA BOUA\n".getBytes("CP850"));

		saida.write(new byte[] {0x1D, 0x21, 0x00});
		saida.write("RAZAO SOCIAL DE INFORMATICA\n".getBytes("CP850"));
		saida.write("\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x45, 0x00});
		saida.write("Rua dos Caras, 47\n".getBytes("CP850"));
		saida.write("\n".getBytes("CP850"));
		saida.write("Centro - 70000-000 - Sao Paulo/SP\n".getBytes("CP850"));
		saida.write("(47) 7777-7777 / 4444-7777\n\n".getBytes("CP850"));

		saida.write("CNPJ : 77.777.777/0007-77      IE : 77.777.777\n\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x61, 0x00});
		saida.write("CLIENTE : CONSUMIDOR FINAL\n\n".getBytes("CP850"));

		saida.write("01/04/2013 10:15            COMPROVANTE DE VENDA\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x45, 0x01});
		saida.write("                                       Nº 000001\n".getBytes("CP850"));
		saida.write(new byte[] {0x1B, 0x45, 0x00});

		saida.write("------------------------------------------------\n".getBytes("CP850"));
		saida.write("CODIGO                        DESCRIÇAO         GARANTIA\n".getBytes("CP850"));
		saida.write("                             QTD x UNIT         R$ VALOR\n".getBytes("CP850"));
		saida.write("------------------------------------------------\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x45, 0x01});
		saida.write("02431  HD 500GB SEAGATE MOMENUS 7200.4                3M\n".getBytes("CP850"));
		saida.write("                             1 x 250,00           250,00\n".getBytes("CP850"));
		saida.write("06341  MEMÓRIA 4GB DDR3 133MHZ - MARKVISION           3M\n".getBytes("CP850"));
		saida.write("                             1 x 70,00             70,00\n".getBytes("CP850"));
		saida.write(new byte[] {0x1B, 0x45, 0x00});

		saida.write("------------------------------------------------\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x45, 0x01});
		saida.write("Total da Nota R$                          320,00\n".getBytes("CP850"));
		saida.write("Valor Recebido R$                         400,00\n".getBytes("CP850"));
		saida.write("Troco R$                                  80,00\n\n".getBytes("CP850"));
		saida.write(new byte[] {0x1B, 0x45, 0x00});

		saida.write("FORMA DE PGTO. : A VISTA\n\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x45, 0x01});
		saida.write("DATA PGTO              R$ VALOR        TIPO PGTO\n".getBytes("CP850"));
		saida.write(new byte[] {0x1B, 0x45, 0x00});
		saida.write("01/04/2013               320,00         DINHEIRO\n".getBytes("CP850"));
		saida.write("------------------------------------------------\n".getBytes("CP850"));
		saida.write("VENDEDOR(A) : VENDEDOR - Bruss Loza\n".getBytes("CP850"));
		saida.write("------------------------------------------------\n\n".getBytes("CP850"));

		saida.write("Números de Série :\n".getBytes("CP850"));
		saida.write("6AFA89A0102, 508ADFB1808\n\n\n".getBytes("CP850"));

		saida.write("Recebi a(s) mercadoria(s) acima descrita(s), concordando plenamente com os prazos e condiçoes degarantia\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x61, 0x01});
		saida.write("------------------------------------------------\n".getBytes("CP850"));
		saida.write("ASSINATURA DO CLIENTE\n".getBytes("CP850"));
		saida.write("------------------------------------------------\n\n".getBytes("CP850"));

		saida.write(new byte[] {0x1B, 0x45, 0x01});
		saida.write("* OBRIGADO E VOLTE SEMPRE *\n".getBytes("CP850"));
		saida.write(new byte[] {0x1B, 0x45, 0x00});

		saida.write(new byte[] {0x1B, 0x64, 0x05});

		saida.write(new byte[] {0x1D, 0x56, 0x00});

		saida.flush();
		nota.close();

		System.out.println("Dados enviados para a Impressora!");

	} catch (Exception e) {
		System.out.println(e);
		}
	}
}
