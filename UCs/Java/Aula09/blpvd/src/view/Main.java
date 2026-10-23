package view;

import java.awt.EventQueue;
import java.awt.Toolkit;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.formdev.flatlaf.FlatLightLaf;

import database.Database;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.Color;
import javax.swing.SwingConstants;

public class Main extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JLabel lblData;
	
	Database db = new Database();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		//USO DA BIBLIOTECA FALTLAF (SWING MODERNO)
		FlatLightLaf.setup();
		
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main frame = new Main();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Main() {
		setTitle("BL-PDV");
		setIconImage(Toolkit.getDefaultToolkit().getImage(Main.class.getResource("/img/blpvd.png")));
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 800, 600);
		contentPane = new JPanel();
		contentPane.setForeground(Color.RED);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblDataBase = new JLabel("");
		lblDataBase.setIcon(new ImageIcon(Main.class.getResource("/img/banco.jpg")));
		lblDataBase.setBounds(10, 534, 20, 27);
		contentPane.add(lblDataBase);
		
		JLabel lblMysql = new JLabel("");
		lblMysql.setBounds(35, 534, 103, 27);
		contentPane.add(lblMysql);
		
		JLabel lblStatus = new JLabel("•");
		lblStatus.setHorizontalAlignment(SwingConstants.CENTER);
		lblStatus.setForeground(Color.RED);
		lblStatus.setFont(new Font("Tahoma", Font.PLAIN, 16));
		lblStatus.setBounds(135, 534, 20, 27);
		contentPane.add(lblStatus);
		
		JLabel lblCalendario = new JLabel("");
		lblCalendario.setIcon(new ImageIcon(Main.class.getResource("/img/calendario.jpg")));
		lblCalendario.setBounds(670, 11, 24, 36);
		contentPane.add(lblCalendario);
		
		JLabel lblData = new JLabel("");
		lblData.setBounds(704, 11, 70, 36);
		contentPane.add(lblData);
		
		if(db.testarConexao() == true) {
			System.out.println("Banco Conectado");
			lblMysql.setText("MySQL Conectado");
			lblStatus.setForeground(Color.GREEN);
		}else {
			System.out.println("Erro na Conexão");
			lblMysql.setText("MySQL Desconectado");
			lblStatus.setForeground(Color.RED);
		}
	}
	
	private void atualizarData() {
		DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yy");
		String data = LocalDate.now().format(formatoData);
		lblData.setText(data);
	}
}
