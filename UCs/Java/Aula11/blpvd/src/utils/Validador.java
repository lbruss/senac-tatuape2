package utils;

//
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
		
	}
	

}
