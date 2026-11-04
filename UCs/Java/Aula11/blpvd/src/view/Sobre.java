package view;

import java.awt.Desktop;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.net.URI;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import com.formdev.flatlaf.FlatDarkLaf;

public class Sobre extends JDialog {

	private static final long serialVersionUID = 1L;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		//USO DA BIBLIOTECA FLATLAF (SWING MODERNO)
		FlatDarkLaf.setup(); //MODO ESCURO
		//FlatLightLaf.setup(); //MODO CLARO
		
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
		
		JLabel lblMit = new JLabel("");
		lblMit.setIcon(new ImageIcon(Sobre.class.getResource("/img/mit.jpg")));
		lblMit.setBounds(10, 174, 32, 39);
		getContentPane().add(lblMit);
		
		JLabel lblGithub = new JLabel("");
		lblGithub.setIcon(new ImageIcon(Sobre.class.getResource("/img/github.jpg")));
		lblGithub.setBounds(10, 225, 32, 32);
		getContentPane().add(lblGithub);
		
		JLabel lblRepositorio = new JLabel("github.com/lbruss");
		
		//EVENTO DO LINK DO GITHUB
		lblRepositorio.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				link("https://github.com/lbruss");
			}
		});
		lblRepositorio.setBounds(50, 240, 113, 17);
		getContentPane().add(lblRepositorio);
		
		JButton btnOK = new JButton("OK");
		btnOK.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//FECHAR A TELA SOBRE
				dispose();
			}
		});
		btnOK.setBounds(75, 285, 89, 23);
		getContentPane().add(btnOK);
		
		//CENTRALIZAR A TELA AO ABRIR
		setLocationRelativeTo(null);
		
	}
		
		//MÉTODO (FUNÇÃO) PARA ABRIR O LINK NO NAVEGADOR PADRÃO
		private void link (String url) {
			//OBTEM O DESKTOP DO CLIENTE
			Desktop desktop = Desktop.getDesktop();
			
			//USO DO TRY-CATCH PARA EXCEÇÕES
			try {
				URI uri = new URI(url);
				
				//ABRIR O LINK NO NAVEGADOR
				desktop.browse(uri);
			}catch (Exception e) {
				System.out.println(e);
		}
	}
}
