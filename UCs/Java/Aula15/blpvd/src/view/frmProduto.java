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
import javax.swing.JTextField;
import javax.swing.JComboBox;

public class frmProduto extends JDialog {

	private static final long serialVersionUID = 1L;
	private JTextField textIDProduto;
	private JTextField textDescricao;
	private JTextField textCategoria;
	private JLabel lblCategoria;
	private JLabel lblProduto;
	private JLabel lblFornecedor;
	private JTextField textPrecoCusto;
	private JLabel lblCusto;
	private JComboBox cboFornecedor;
	private JTextField textPrecoVenda;
	private JLabel lblVenda;
	private JTextField textIDFornecedor;
	private JLabel lblIDFornecedor;
	private JTextField textQuantidade;
	private JLabel lblQuantidade;
	private JTextField textEstoqueMinino;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
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
		{
			JLabel lblidProduto = new JLabel("ID");
			lblidProduto.setFont(new Font("Arial", Font.BOLD, 14));
			lblidProduto.setBounds(10, 24, 30, 20);
			getContentPane().add(lblidProduto);
		}
		
		textIDProduto = new JTextField();
		textIDProduto.setEnabled(false);
		textIDProduto.setToolTipText("Id Produto");
		textIDProduto.setBounds(36, 25, 86, 20);
		getContentPane().add(textIDProduto);
		textIDProduto.setColumns(10);
		
		lblProduto = new JLabel("Produto");
		lblProduto.setFont(new Font("Arial", Font.BOLD, 14));
		lblProduto.setBounds(10, 60, 62, 20);
		getContentPane().add(lblProduto);
		
		textDescricao = new JTextField();
		textDescricao.setFont(new Font("Arial", Font.BOLD, 12));
		textDescricao.setBounds(80, 56, 404, 30);
		getContentPane().add(textDescricao);
		textDescricao.setColumns(10);
		
		lblCategoria = new JLabel("Categoria");
		lblCategoria.setFont(new Font("Arial", Font.BOLD, 14));
		lblCategoria.setBounds(10, 106, 75, 20);
		getContentPane().add(lblCategoria);
		
		textCategoria = new JTextField();
		textCategoria.setFont(new Font("Arial", Font.BOLD, 12));
		textCategoria.setColumns(10);
		textCategoria.setBounds(92, 107, 180, 20);
		getContentPane().add(textCategoria);
		
		lblFornecedor = new JLabel("Fornecedor");
		lblFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
		lblFornecedor.setBounds(282, 106, 86, 20);
		getContentPane().add(lblFornecedor);
		
		cboFornecedor = new JComboBox();
		cboFornecedor.setBounds(378, 106, 180, 22);
		getContentPane().add(cboFornecedor);
		
		lblCusto = new JLabel("Custo");
		lblCusto.setFont(new Font("Arial", Font.BOLD, 14));
		lblCusto.setBounds(10, 142, 47, 20);
		getContentPane().add(lblCusto);
		
		textPrecoCusto = new JTextField();
		textPrecoCusto.setFont(new Font("Arial", Font.BOLD, 12));
		textPrecoCusto.setColumns(10);
		textPrecoCusto.setBounds(59, 138, 100, 30);
		getContentPane().add(textPrecoCusto);
		
		lblVenda = new JLabel("Venda");
		lblVenda.setFont(new Font("Arial", Font.BOLD, 14));
		lblVenda.setBounds(195, 142, 47, 20);
		getContentPane().add(lblVenda);
		
		textPrecoVenda = new JTextField();
		textPrecoVenda.setFont(new Font("Arial", Font.BOLD, 12));
		textPrecoVenda.setColumns(10);
		textPrecoVenda.setBounds(252, 138, 100, 30);
		getContentPane().add(textPrecoVenda);
		
		lblIDFornecedor = new JLabel("ID Fornecedor");
		lblIDFornecedor.setFont(new Font("Arial", Font.BOLD, 14));
		lblIDFornecedor.setBounds(455, 180, 103, 20);
		getContentPane().add(lblIDFornecedor);
		
		textIDFornecedor = new JTextField();
		textIDFornecedor.setEnabled(false);
		textIDFornecedor.setFont(new Font("Arial", Font.BOLD, 12));
		textIDFornecedor.setColumns(10);
		textIDFornecedor.setBounds(455, 139, 100, 30);
		getContentPane().add(textIDFornecedor);
		
		lblQuantidade = new JLabel("Quantidade");
		lblQuantidade.setFont(new Font("Arial", Font.BOLD, 14));
		lblQuantidade.setBounds(10, 202, 86, 20);
		getContentPane().add(lblQuantidade);
		
		textQuantidade = new JTextField();
		textQuantidade.setFont(new Font("Arial", Font.BOLD, 12));
		textQuantidade.setColumns(10);
		textQuantidade.setBounds(101, 198, 100, 30);
		getContentPane().add(textQuantidade);
		
		JLabel lblEstoqueMinimo = new JLabel("Estoque Minímo");
		lblEstoqueMinimo.setFont(new Font("Arial", Font.BOLD, 14));
		lblEstoqueMinimo.setBounds(224, 202, 120, 20);
		getContentPane().add(lblEstoqueMinimo);
		
		textEstoqueMinino = new JTextField();
		textEstoqueMinino.setFont(new Font("Arial", Font.BOLD, 12));
		textEstoqueMinino.setColumns(10);
		textEstoqueMinino.setBounds(345, 198, 100, 30);
		getContentPane().add(textEstoqueMinino);
	}
}
