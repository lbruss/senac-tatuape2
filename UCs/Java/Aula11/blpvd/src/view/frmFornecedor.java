package view;

import javax.swing.JDialog;
import java.awt.Toolkit;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

public class frmFornecedor extends JDialog {

	private static final long serialVersionUID = 1L;
	private JLabel lblID;
	private JTextField textID;
	private JTextField textNome;
	private JLabel lblNome;
	private JTextField textFone;
	private JTextField textEmail;
	private JLabel lblFone;
	private JLabel lblEmail;
	private JTextField textSite;
	private JLabel lblSite;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		//USO DA BIBLIOTECA FALTLAF (SWING MODERNO)
		FlatDarkLaf.setup();
		
		try {
			frmFornecedor dialog = new frmFornecedor();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public frmFornecedor() {
		setResizable(false);
		setTitle("Fornecedores");
		setIconImage(Toolkit.getDefaultToolkit().getImage(frmFornecedor.class.getResource("/img/fornecedor.jpg")));
		setBounds(100, 100, 680, 480);
		getContentPane().setLayout(null);
		
		//CENTRALIZAR A TELA AO ABRIR
		setLocationRelativeTo(null);
		
		lblID = new JLabel("ID");
		lblID.setEnabled(false);
		lblID.setFont(new Font("Arial", Font.BOLD, 14));
		lblID.setBounds(10, 11, 19, 17);
		getContentPane().add(lblID);
		
		textID = new JTextField();
		textID.setEnabled(false);
		textID.setBounds(29, 10, 96, 20);
		getContentPane().add(textID);
		textID.setColumns(10);
		
		lblNome = new JLabel("Nome");
		lblNome.setFont(new Font("Arial", Font.BOLD, 14));
		lblNome.setEnabled(false);
		lblNome.setBounds(10, 44, 48, 17);
		getContentPane().add(lblNome);
		
		textNome = new JTextField();
		textNome.setColumns(10);
		textNome.setBounds(57, 43, 281, 20);
		getContentPane().add(textNome);
		
		textFone = new JTextField();
		textFone.setColumns(10);
		textFone.setBounds(57, 71, 121, 20);
		getContentPane().add(textFone);
		
		lblFone = new JLabel("Fone");
		lblFone.setFont(new Font("Arial", Font.BOLD, 14));
		lblFone.setEnabled(false);
		lblFone.setBounds(10, 72, 48, 17);
		getContentPane().add(lblFone);
		
		lblEmail = new JLabel("Email");
		lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
		lblEmail.setEnabled(false);
		lblEmail.setBounds(10, 103, 48, 17);
		getContentPane().add(lblEmail);
		
		textEmail = new JTextField();
		textEmail.setColumns(10);
		textEmail.setBounds(57, 102, 281, 20);
		getContentPane().add(textEmail);
		
		lblSite = new JLabel("Site");
		lblSite.setFont(new Font("Arial", Font.BOLD, 14));
		lblSite.setEnabled(false);
		lblSite.setBounds(10, 138, 32, 17);
		getContentPane().add(lblSite);
		
		textSite = new JTextField();
		textSite.setColumns(10);
		textSite.setBounds(57, 137, 281, 20);
		getContentPane().add(textSite);
	}
}
