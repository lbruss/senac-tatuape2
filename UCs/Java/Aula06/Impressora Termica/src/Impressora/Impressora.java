package Impressora;

import java.io.OutputStream;
import java.net.Socket; //Importar biblioteca - será utilizada para conexão com a rede
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Impressora {

	public static void main(String[] args) {
		try {
			Socket impressora = new Socket("10.26.45.49", 9100);
			OutputStream saida = impressora.getOutputStream();
			
			//Ativa a impressora para receber comandos ESC/POS
			saida.write(new byte[] {0x1B, 0x40});
			
			//Corpo do documento ===========
			//Imprimir data e hora
			LocalDateTime agora = LocalDateTime.now();
			DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yy HH:mm:ss");
			
			//Variável para armazenar a data e hora formatada
			String dataHora = "Data" + agora.format(formato) + "\n";
			//Impressão da data e hora (Conteúdo da variável)
			saida.write(dataHora.getBytes("CP850"));
			
			//Aumentar a fonte
			//0x00 (normal) 0x11 (2X) 0x22 (3X)...
			saida.write(new byte[] {0x1D, 0x21, 0X22});
			
			//Centralizar
			saida.write(new byte[] {0x1B, 0x61, 0X01});
			
			//Negrito
			saida.write(new byte[] {0x1B, 0x45, 0X01});
			
			
			saida.write("PDV\n".getBytes("CP850"));//Obrigátorio colocar o "\n"
			
			//Voltar a fonte normal
			saida.write(new byte[] {0x1D, 0x21, 0X00});
			
			saida.write("Bruss Loza\n".getBytes("CP850"));
			saida.write("SENAC Tatuapé\n".getBytes("CP850"));
			
			//Avanço do Papel
			//0x02 (2 linhas) 0x03 (3 linhas)... 0x05 (5 linhas)
			saida.write(new byte[] {0x1B, 0x64, 0x05});
			
			//Corte do Papel
			saida.write(new byte[] {0x1D, 0x56, 0x00});
			
			//Fim do corpo do documento
			
			//Imprimir e fechar a conexão com a impressora
			saida.flush();
			impressora.close();
			
			System.out.println("Dados enviados para a Impressora!");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}