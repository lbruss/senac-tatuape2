package view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.Toolkit;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.SwingConstants;

public class Sobre extends JDialog {

	private static final long serialVersionUID = 1L;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			Sobre dialog = new Sobre();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public Sobre() {
		setTitle("Sobre");
		setIconImage(Toolkit.getDefaultToolkit().getImage(Sobre.class.getResource("/img/sobre.jpg")));
		setBounds(100, 100, 270, 370);
		getContentPane().setLayout(null);
		{
			JLabel lblBLPDV = new JLabel("BL-PDV");
			lblBLPDV.setHorizontalAlignment(SwingConstants.CENTER);
			lblBLPDV.setFont(new Font("Arial", Font.BOLD, 15));
			lblBLPDV.setBounds(74, 11, 90, 24);
			getContentPane().add(lblBLPDV);
		}
		{
			JLabel lblDescricao = new JLabel("Sistema para gestão de estoque e PDV");
			lblDescricao.setFont(new Font("Arial", Font.BOLD, 12));
			lblDescricao.setBounds(10, 46, 221, 14);
			getContentPane().add(lblDescricao);
		}
		{
			JLabel lblAutor = new JLabel("Autor: Bruss Loza");
			lblAutor.setFont(new Font("Arial", Font.BOLD, 12));
			lblAutor.setBounds(10, 71, 101, 14);
			getContentPane().add(lblAutor);
		}
		{
			JLabel lblVersao = new JLabel("Versão 1.0");
			lblVersao.setFont(new Font("Arial", Font.BOLD, 14));
			lblVersao.setBounds(10, 96, 79, 14);
			getContentPane().add(lblVersao);
		}
	}

}
