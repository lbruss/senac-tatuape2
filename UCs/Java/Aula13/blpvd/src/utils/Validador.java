package utils;

import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.PlainDocument;

public class Validador extends PlainDocument {

	private static final long serialVersionUID = 1L;
	private int limite;
	private String tipo;

	public Validador(int limite) {
		super();
		this.limite = limite;
		this.tipo = "texto";
	}

	public Validador(int limite, String tipo) {
		super();
		this.limite = limite;
		this.tipo = tipo;
	}
	
	public void insertString(int ofs, String str, AttributeSet a) throws BadLocationException{
		//VERIFICAR SE O TEXTO É NULO, O MÉTODO PARA DE SER EXECUTADO
		if(str == null) {
			return;
		}
		
		//VERIFICA LIMITE DE CARACTERES
		if(getLength() + str.length() > limite) {
			return;
		}
		
		//VERIFICAR O TIPO DE TEXTO
		if(tipo.equals("texto")) {
			super.insertString(ofs, str, a);
			
			//VERIFICAR SE O NÚMERO É INTEIRO
		}else if(tipo.equals("inteiro")) {
			//ACEIRA SOMENTE NÚMEROS DE 0 A 9 - NÃO ACEITA NEGATIVOS
			if(str.matches("[0-9]+")) {
				super.insertString(ofs, str, a);
			}
			
		//VERIFICAR SE É DECIMAL
		} else if(tipo.equals("decimal")) {
			//TEXTO ATUAL NO CAMPO
			String textoAtual = getText(0, getLength());
			
			//TEXTO QUE SERÁ INSERIDO
			String novoTexto = textoAtual.substring(0, ofs ) + str + textoAtual.substring(ofs);
			
			//ACEITA NÚMEROS - PERMITE UMA VÍRGULA OU PONTO COMO SEPARADOR DECIMAL
			if(novoTexto.matches("[0-9]*([,.][0-9]*)?")) {
				super.insertString(ofs, str, a);
			}
			
		}
		
	}
	

}
