package view;

import java.awt.Cursor;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import com.formdev.flatlaf.FlatDarkLaf;

import controller.FornecedorController;
import controller.ProdutoController;
import model.Fornecedor;
import model.Produto;
import utils.Validador;

public class frmProduto extends JDialog {
	FornecedorController controllerFornecedor = new FornecedorController();
	ProdutoController controllerProduto = new ProdutoController();
	
	Fornecedor fornecedor = new Fornecedor();
	Produto produto = new Produto();
	

	private static final long serialVersionUID = 1L;
	private JTextField textIDProduto;
	private JTextField textDescricao;
	private JTextField textCategoria;
	private JLabel lblCategoria;
	private JLabel lblProduto;
	private JLabel lblFornecedor;
	private JTextField textPrecoCusto;
	private JLabel lblCusto;
	private JComboBox<String> cboFornecedor;
	private JTextField textPrecoVenda;
	private JLabel lblVenda;
	private JTextField textIDFornecedor;
	private JLabel lblIDFornecedor;
	private JTextField textQuantidade;
	private JLabel lblQuantidade;
	private JTextField textEstoqueMinino;
	private JButton btnAdicionarProduto;
	private JTextField textBarcode;
	private JLabel lblLupa;
	private JLabel lblBarcode;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
			//USO DA BIBLIOTECA FALTLAF (SWING MODERNO)
				FlatDarkLaf.setup();
		
		try {
			frmProduto dialog = new frmProduto();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public frmProduto() {
		setModal(true);
		setResizable(false);
		setTitle("Produtos");
		setIconImage(Toolkit.getDefaultToolkit().getImage(frmProduto.class.getResource("/img/produtos.jpg")));
		setBounds(100, 100, 640, 480);
		getContentPane().setLayout(null);
		
		//INICIAR A TELA CENTRALIZADA
		setLocationRelativeTo(null);
		
		
		{
			JLabel lblidProduto = new JLabel("ID");
			lblidProduto.setFont(new Font("Arial", Font.BOLD, 14));
			lblidProduto.setBounds(10, 46, 30, 20);
			getContentPane().add(lblidProduto);
		}
		
		textIDProduto = new JTextField();
		textIDProduto.setEnabled(false);
		textIDProduto.setToolTipText("Id Produto");
		textIDProduto.setBounds(37, 40, 86, 34);
		getContentPane().add(textIDProduto);
		textIDProduto.setColumns(10);
		
		lblProduto = new JLabel("Produto");
		lblProduto.setFont(new Font("Arial", Font.BOLD, 14));
		lblProduto.setBounds(10, 108, 62, 20);
		getContentPane().add(lblProduto);
		
		textDescricao = new JTextField();
		textDescricao.setFont(new Font("Arial", Font.BOLD, 12));
		textDescricao.setBounds(78, 104, 404, 30);
		getContentPane().add(textDescricao);
		textDescricao.setColumns(10);
		textDescricao.setDocument(new Validador(100));
		
		lblCategoria = new JLabel("Categoria");
		lblCategoria.setFont(new Font("Arial", Font.BOLD, 14));
		lblCategoria.setBounds(8, 145, 75, 20);
		getContentPane().add(lblCategoria);
		
		textCategoria = new JTextField();
		textCategoria.setFont(new Font("Arial", Font.BOLD, 12));
		textCategoria.setColumns(10);
		textCategoria.setBounds(93, 146, 180, 20);
		getContentPane().add(textCategoria);
		//VALIDADOR
		textCategoria.setDocument(new Validador(100));
		
		lblFornecedor = new JLabel("Fornecedor");
		lblFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
		lblFornecedor.setBounds(283, 145, 86, 20);
		getContentPane().add(lblFornecedor);
		
		//COMBOBOX - FORNECEDOR
		cboFornecedor = new JComboBox<>();
		
		//EVENTO DO COMBOBOX - SELECIONA UM ITEM DA LISTA (ID FORNECEDOR)
		cboFornecedor.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String selecionado = (String) cboFornecedor.getSelectedItem();
				if(selecionado != null && !selecionado.equals("Selecionado")) {
					String id = selecionado.split(" - ")[0];
					textIDFornecedor.setText(id);
				}else {
					textIDFornecedor.setText("");
				}
			}
		});
		//FIM EVENTO CBOFORNECEDOR
		cboFornecedor.setBounds(379, 145, 180, 22);
		getContentPane().add(cboFornecedor);
		
		lblCusto = new JLabel("Custo");
		lblCusto.setFont(new Font("Arial", Font.BOLD, 14));
		lblCusto.setBounds(10, 174, 47, 20);
		getContentPane().add(lblCusto);
		
		textPrecoCusto = new JTextField();
		textPrecoCusto.setFont(new Font("Arial", Font.BOLD, 12));
		textPrecoCusto.setColumns(10);
		textPrecoCusto.setBounds(62, 170, 100, 30);
		getContentPane().add(textPrecoCusto);
		textPrecoCusto.setDocument(new Validador(10, "decimal"));
		
		lblVenda = new JLabel("Venda");
		lblVenda.setFont(new Font("Arial", Font.BOLD, 14));
		lblVenda.setBounds(199, 180, 47, 20);
		getContentPane().add(lblVenda);
		
		textPrecoVenda = new JTextField();
		textPrecoVenda.setFont(new Font("Arial", Font.BOLD, 12));
		textPrecoVenda.setColumns(10);
		textPrecoVenda.setBounds(256, 176, 100, 30);
		getContentPane().add(textPrecoVenda);
		textPrecoVenda.setDocument(new Validador(10, "decimal"));
		
		lblIDFornecedor = new JLabel("ID Fornecedor");
		lblIDFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
		lblIDFornecedor.setBounds(493, 218, 103, 20);
		getContentPane().add(lblIDFornecedor);
		
		textIDFornecedor = new JTextField();
		textIDFornecedor.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		textIDFornecedor.setEnabled(false);
		textIDFornecedor.setFont(new Font("Arial", Font.BOLD, 12));
		textIDFornecedor.setColumns(10);
		textIDFornecedor.setBounds(493, 188, 100, 30);
		getContentPane().add(textIDFornecedor);
		
		lblQuantidade = new JLabel("Quantidade");
		lblQuantidade.setFont(new Font("Arial", Font.BOLD, 14));
		lblQuantidade.setBounds(10, 231, 86, 20);
		getContentPane().add(lblQuantidade);
		
		textQuantidade = new JTextField();
		textQuantidade.setFont(new Font("Arial", Font.BOLD, 12));
		textQuantidade.setColumns(10);
		textQuantidade.setBounds(96, 227, 100, 30);
		getContentPane().add(textQuantidade);
		textQuantidade.setDocument(new Validador(10, "inteiro"));
		
		JLabel lblEstoqueMinimo = new JLabel("Estoque Minímo");
		lblEstoqueMinimo.setFont(new Font("Arial", Font.BOLD, 14));
		lblEstoqueMinimo.setBounds(225, 231, 120, 20);
		getContentPane().add(lblEstoqueMinimo);
		
		
		textEstoqueMinino = new JTextField();
		textEstoqueMinino.setFont(new Font("Arial", Font.BOLD, 12));
		textEstoqueMinino.setColumns(10);
		textEstoqueMinino.setBounds(347, 227, 100, 30);
		getContentPane().add(textEstoqueMinino);
		textEstoqueMinino.setDocument(new Validador(10, "inteiro"));
		
		JLabel lblNewLabel = new JLabel("");
		lblNewLabel.setIcon(new ImageIcon(frmProduto.class.getResource("/img/produtos2.jpg")));
		lblNewLabel.setBounds(471, 302, 128, 128);
		getContentPane().add(lblNewLabel);
		
		//BOTÃO ADICIONAR PRODUTO
		btnAdicionarProduto = new JButton("");
		
		//EVENTO DO BOTÃO ADICIONAR
		btnAdicionarProduto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//VALIDAÇÕES DOS CAMPOS OBRIGÁTORIOS
				if(textBarcode.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o código de barras");
					textBarcode.requestFocus();
					
				}else if(textDescricao.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o nome do produto");
					textDescricao.requestFocus();
					
				}else if(textCategoria.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha a categoria");
					textCategoria.requestFocus();
				}
			}
		});
		//FIM DO BOTÃO ADICIONAR
		btnAdicionarProduto.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnAdicionarProduto.setToolTipText("Adicionar Produto");
		btnAdicionarProduto.setIcon(new ImageIcon(frmProduto.class.getResource("/img/addproduto.jpg")));
		btnAdicionarProduto.setBounds(21, 338, 75, 73);
		getContentPane().add(btnAdicionarProduto);
		
		textBarcode = new JTextField();
		textBarcode.setFont(new Font("Arial", Font.BOLD, 12));
		textBarcode.setColumns(10);
		textBarcode.setBounds(151, 42, 322, 31);
		getContentPane().add(textBarcode);
		
		lblLupa = new JLabel("");
		lblLupa.setIcon(new ImageIcon(frmProduto.class.getResource("/img/buscar.jpg")));
		lblLupa.setBounds(492, 108, 24, 20);
		getContentPane().add(lblLupa);
		
		lblBarcode = new JLabel("");
		lblBarcode.setIcon(new ImageIcon(frmProduto.class.getResource("/img/scanner.jpg")));
		lblBarcode.setBounds(493, 22, 64, 63);
		getContentPane().add(lblBarcode);
		
		carregarFornecedor();
	}
	
	//================================================
	//PREENCHER O COMBOBOX COM A LISTA DE FORNECEDORES
	//================================================
	private void carregarFornecedor() {
		//LIMPAR O COMBOBOX
		cboFornecedor.removeAllItems();
		
		//OPÇÃO PADRÃO
		cboFornecedor.addItem("Selecione");
		
		ArrayList<Fornecedor> lista = controllerFornecedor.listarFornecedores();
		
		for(Fornecedor fornecedor: lista) {
			cboFornecedor.addItem(fornecedor.getIdFornecedor() + " - " + fornecedor.getNome());
		}	
	}
}

