package view;

import java.awt.EventQueue;
import java.awt.Toolkit;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.swing.JFrame;
import javax.swing.JPanel;

import com.formdev.flatlaf.FlatLightLaf;

import database.Database;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.Color;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Cursor;

public class Main extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JLabel lblData;
	
	//CRIAÇÃO DO OBJETO PARA CONEXÃO COM O BANCO DE DADOS
	Database db = new Database();
	private JButton btnNewButton;
	private JButton btnProdutos;

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
		lblCalendario.setBounds(682, 0, 24, 36);
		contentPane.add(lblCalendario);
		
		lblData = new JLabel("");
		lblData.setBounds(710, 0, 64, 36);
		contentPane.add(lblData);
		
		JPanel panelLateral = new JPanel();
		panelLateral.setBorder(null);
		panelLateral.setBackground(new Color(72, 61, 139));
		panelLateral.setBounds(0, 0, 196, 538);
		contentPane.add(panelLateral);
		panelLateral.setLayout(null);
		
		JLabel lblLogo = new JLabel("");
		lblLogo.setIcon(new ImageIcon(Main.class.getResource("/img/blpvd.png")));
		lblLogo.setBounds(10, 11, 64, 54);
		panelLateral.add(lblLogo);
		
		JLabel lblBLPDV = new JLabel("BL-PDV");
		lblBLPDV.setForeground(new Color(240, 248, 255));
		lblBLPDV.setFont(new Font("Arial", Font.BOLD, 25));
		lblBLPDV.setBounds(85, 23, 101, 30);
		panelLateral.add(lblBLPDV);
		
		//BOTÃO FORNECEDOR
		JButton btnFornecedores = new JButton("Fornecedores");
		btnFornecedores.setIconTextGap(12);
		btnFornecedores.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frmFornecedor fornecedor = new frmFornecedor();
				fornecedor.setVisible(true);
			}
		});
		btnFornecedores.setToolTipText("Fornecedor");
		btnFornecedores.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnFornecedores.setBorderPainted(false);
		btnFornecedores.setForeground(new Color(0, 0, 0));
		btnFornecedores.setBackground(new Color(123, 104, 238));
		btnFornecedores.setFont(new Font("Arial", Font.BOLD, 15));
		btnFornecedores.setIcon(new ImageIcon(Main.class.getResource("/img/fornecedor.jpg")));
		btnFornecedores.setBounds(10, 102, 176, 41);
		panelLateral.add(btnFornecedores);
		
		JLabel lblSistema = new JLabel("Sistema de PDV");
		lblSistema.setForeground(new Color(255, 255, 255));
		lblSistema.setBounds(84, 45, 74, 30);
		panelLateral.add(lblSistema);
		
		JLabel lblNewLabel = new JLabel("-------------------------------------");
		lblNewLabel.setForeground(new Color(255, 255, 255));
		lblNewLabel.setBounds(18, 457, 168, 23);
		panelLateral.add(lblNewLabel);
		
		btnNewButton = new JButton("Sobre");
		btnNewButton.setToolTipText("Sobre");
		btnNewButton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		
		//EVENTO BOTÃO SOBRE
		btnNewButton.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				//ABRIR TELA SOBRE
				Sobre sobre = new Sobre();
				sobre.setVisible(true);
			}
		});
		btnNewButton.setBackground(new Color(106, 90, 205));
		btnNewButton.setFont(new Font("Arial", Font.BOLD, 13));
		btnNewButton.setBorderPainted(false);
		btnNewButton.setHorizontalAlignment(SwingConstants.LEADING);
		btnNewButton.setIcon(new ImageIcon(Main.class.getResource("/img/sobre.jpg")));
		btnNewButton.setBounds(10, 479, 176, 48);
		panelLateral.add(btnNewButton);
		
		//BOTÃO PRODUTOS
		btnProdutos = new JButton("Produtos");
		//EVENTO DO BOTÃO PRODUTO
		btnProdutos.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frmProduto produto = new frmProduto();
				produto.setVisible(true);
			}
		});
		btnProdutos.setIconTextGap(12);
		btnProdutos.setToolTipText("Produtos");
		btnProdutos.setIcon(new ImageIcon(Main.class.getResource("/img/produtos.jpg")));
		btnProdutos.setForeground(Color.BLACK);
		btnProdutos.setFont(new Font("Arial", Font.BOLD, 15));
		btnProdutos.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnProdutos.setBorderPainted(false);
		btnProdutos.setBackground(new Color(123, 104, 238));
		btnProdutos.setBounds(10, 154, 176, 41);
		panelLateral.add(btnProdutos);
		
		if(db.testarConexao() == true) {
			System.out.println("Banco Conectado");
			lblMysql.setText("MySQL Conectado");
			lblStatus.setForeground(Color.GREEN);
		}else {
			System.out.println("Erro na Conexão");
			lblMysql.setText("MySQL Desconectado");
			lblStatus.setForeground(Color.RED);
		}
		
		//COMANDO O MÉTODO (FUNÇÃO) - atualizarData
		atualizarData();
		
	}
	
	//FUNÇÃO (MÉTODO) PARA ATUALIZAR A DATA DO SISTEMA
	private void atualizarData() {
		//OBTER A DATA DO SISTEMA OPERACIONAL
		DateTimeFormatter formatoData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String data = LocalDate.now().format(formatoData);
		//ALTERAR O TEXTO DE lblData
		lblData.setText(data);
	}
}
