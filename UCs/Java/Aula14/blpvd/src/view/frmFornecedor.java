package view;

import java.awt.Cursor;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

import controller.FornecedorController;
import model.Fornecedor;
import utils.Validador;

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
	private JButton btnAdicionar;
	private JButton btnLimpar;
	private JButton btnBuscar;
	private JButton btnEditar;
	private JButton btnExcluir;

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
		setModal(true);
		setResizable(false);
		setTitle("Fornecedores");
		setIconImage(Toolkit.getDefaultToolkit().getImage(frmFornecedor.class.getResource("/img/fornecedor.jpg")));
		setBounds(100, 100, 680, 480);
		getContentPane().setLayout(null);
		
		//CENTRALIZAR A TELA AO ABRIR
		setLocationRelativeTo(null);
		
		//OBJETO CONTROLLER
		FornecedorController controller = new FornecedorController();
		
		//OBJETO FORNECEDOR
		Fornecedor fornecedor = new Fornecedor();
		
		lblID = new JLabel("ID");
		lblID.setEnabled(false);
		lblID.setFont(new Font("Arial", Font.BOLD, 14));
		lblID.setBounds(10, 40, 19, 17);
		getContentPane().add(lblID);
		
		textID = new JTextField();
		textID.setEnabled(false);
		textID.setBounds(52, 39, 96, 20);
		getContentPane().add(textID);
		textID.setColumns(10);
		
		lblNome = new JLabel("Nome");
		lblNome.setFont(new Font("Arial", Font.BOLD, 14));
		lblNome.setEnabled(false);
		lblNome.setBounds(10, 96, 48, 26);
		getContentPane().add(lblNome);
		
		textNome = new JTextField();
		textNome.setColumns(10);
		textNome.setBounds(57, 94, 281, 33);
		getContentPane().add(textNome);
		//VALIDAÇÃO DE NÚMERO MÁXIMO DE CARACTER
		textNome.setDocument(new Validador (50, "texto"));
		
		
		
		textFone = new JTextField();
		textFone.setColumns(10);
		textFone.setBounds(56, 149, 148, 26);
		getContentPane().add(textFone);
		textFone.setDocument(new Validador (20));
		
		lblFone = new JLabel("Fone");
		lblFone.setFont(new Font("Arial", Font.BOLD, 14));
		lblFone.setEnabled(false);
		lblFone.setBounds(10, 156, 48, 17);
		getContentPane().add(lblFone);
		
		lblEmail = new JLabel("Email");
		lblEmail.setFont(new Font("Arial", Font.BOLD, 14));
		lblEmail.setEnabled(false);
		lblEmail.setBounds(10, 211, 48, 17);
		getContentPane().add(lblEmail);
		
		textEmail = new JTextField();
		textEmail.setColumns(10);
		textEmail.setBounds(57, 207, 281, 26);
		getContentPane().add(textEmail);
		textEmail.setDocument(new Validador (50));
		
		
		lblSite = new JLabel("Site");
		lblSite.setFont(new Font("Arial", Font.BOLD, 14));
		lblSite.setEnabled(false);
		lblSite.setBounds(10, 260, 32, 26);
		getContentPane().add(lblSite);
		
		textSite = new JTextField();
		textSite.setColumns(10);
		textSite.setBounds(57, 259, 281, 27);
		getContentPane().add(textSite);
		
		//EVENTO DO BOTÃO ADICIONAR
		btnAdicionar = new JButton("");
		btnAdicionar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(textNome.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o nome do fornecedor.");
					textNome.requestFocus();
				}else if(textFone.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o telefone do fornecedor.");
				}else {
					//TRANSFERIR OS DADOS DA TELA PARA O OBJETO
					fornecedor.setNome(textNome.getText());
					fornecedor.setFone(textFone.getText());
					fornecedor.setEmail(textEmail.getText());
					fornecedor.setSite(textSite.getText());
					
					//ENVIAR O OBJETO PARA O CONTROLLER
					controller.Adicionar(fornecedor);
					
					//MENSAGEM DE CONFIRMAÇÃO
					JOptionPane.showMessageDialog(null, "Fornecedor adicionado com sucesso.");
					
					//LIMPAR CAMPOS
					limparCampos();
					
				}
			}
		});//FIM CRUD CREATE ===================
		btnAdicionar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnAdicionar.setToolTipText("Adicionar");
		btnAdicionar.setIcon(new ImageIcon(frmFornecedor.class.getResource("/img/adicionar.jpg")));
		btnAdicionar.setBounds(29, 338, 89, 73);
		getContentPane().add(btnAdicionar);
		
		
		//BOTÃO LIMPAR
		btnLimpar = new JButton("");
		//EVENTO DO BOTÃO LIMPAR
		btnLimpar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				limparCampos();
			}
		});
		btnLimpar.setToolTipText("Limpar campos");
		btnLimpar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnLimpar.setIcon(new ImageIcon(frmFornecedor.class.getResource("/img/limpar.jpg")));
		btnLimpar.setBounds(368, 338, 89, 73);
		getContentPane().add(btnLimpar);
		
		//BOTÃO BUSCAR
		btnBuscar = new JButton("Buscar");
		//EVENTO DO BOTÃO BUSCAR
		/*=============================================
		 * CRUD READ - BUSCAR FORNECEDOR
		 * ============================================*/
		btnBuscar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//VALIDAÇÃO
				if(textNome.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Informe o nome do fornecedor");
					textNome.requestFocus();
				}else {
					String nome = textNome.getText();
					
					Fornecedor fornecedor = controller.buscar(nome);
					//SE EXISTIR UM FORNECEDOR CADASTRADO
					if(fornecedor != null) {
						textID.setText(String.valueOf(fornecedor.getIdFornecedor()));
						textNome.setText(fornecedor.getNome());
						textFone.setText(fornecedor.getFone());
						textEmail.setText(fornecedor.getEmail());
						textSite.setText(fornecedor.getSite());
						
						//DESABILITAR O BOTÃO ADICIONAR
						btnAdicionar.setEnabled(false);
					}else {
						JOptionPane.showMessageDialog(null, "Fornecedor não cadastrado");
						limparCampos();
					}
					
				}
			}
		});
		
		//ASSOCIOAR O ENTER AO BOTÃO BUSCAR
		getRootPane().setDefaultButton(btnBuscar);
		
		btnBuscar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnBuscar.setIcon(new ImageIcon(frmFornecedor.class.getResource("/img/buscar.jpg")));
		btnBuscar.setBounds(368, 94, 126, 33);
		getContentPane().add(btnBuscar);
		
		//BOTÃO EDITAR
		btnEditar = new JButton("");
		
		/*EVENTO DO BOTÃO EDITAR
		==================================
		* CRUD UPDATE - EDITAR FORNECEDOR
		* ================================*/
		btnEditar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//VALIDAÇÃO DOS CAMPOS OBRIGATÓRIOS
				if(textNome.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o nome do fornecedor");
					textNome.requestFocus();
				}else if(textFone.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o telefone do fornecedor");
					textFone.requestFocus();
				}else if(textEmail.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o email do fornecedor");
					textEmail.requestFocus();
				}else if(textSite.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o site do fornecedor");
					textSite.requestFocus();
				}else {
					fornecedor.setIdFornecedor(Integer.parseInt(textID.getText()));
					fornecedor.setNome(textNome.getText());
					fornecedor.setFone(textFone.getText());
					fornecedor.setEmail(textEmail.getText());
					fornecedor.setSite(textSite.getText());
					
					//ENVIAR OS DADOS PARA O CONTROLLER
					controller.editarFornecedor(fornecedor);
					
					//MENSAGEM PARA O USUÁRIO
					JOptionPane.showMessageDialog(null, "Dados do fornecedor alterado");
					
					//LIMPAR CAMPOS
					limparCampos();
					
				}
			}
		});
		btnEditar.setToolTipText("Editar");
		btnEditar.setIcon(new ImageIcon(frmFornecedor.class.getResource("/img/update.jpg")));
		btnEditar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnEditar.setBounds(141, 338, 84, 73);
		getContentPane().add(btnEditar);
		
		//BOTÃO EXCLUIR
		btnExcluir = new JButton("");
		//EVENTO DO BOTÃO EXCLUIR
		/*=================================
		 * CRUD DELETE - DELETAR FORNECEDOR
		 * ================================*/
		btnExcluir.setToolTipText("Excluir");
		btnExcluir.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//VALIDAÇÃO
				if(textNome.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Digite o nome do fornecedor");
					textNome.requestFocus();
				}else {
					//CAPTURAR O ID DO FORNECEDOR
					int idFornecedor = Integer.parseInt(textID.getText());
					
					//CONFIRMAÇÃO DE EXCLUSÃO
					int resposta = JOptionPane.showConfirmDialog(null, "Deseja realmente excluir este fornecedor?", "Atenção!", JOptionPane.YES_OPTION);
					if(resposta == JOptionPane.YES_OPTION) {
						controller.excluir(idFornecedor);
						
						limparCampos();
						
						JOptionPane.showMessageDialog(null, "Fornecedor excluído com sucesso.");
					}
				}
			}
		});//FIM CRUD DELETE=====================
		btnExcluir.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnExcluir.setIcon(new ImageIcon(frmFornecedor.class.getResource("/img/excluir.jpg")));
		btnExcluir.setBounds(249, 338, 89, 73);
		getContentPane().add(btnExcluir);
	}
	
	/*=================================================
	 * MÉTODO DO BOTÃO LIMPAR CAMPOS
	 * ================================================*/
	void limparCampos() {
		textID.setText(null);
		textNome.setText(null);
		textFone.setText(null);
		textEmail.setText(null);
		textSite.setText(null);
		btnAdicionar.setEnabled(true);
	}
}
