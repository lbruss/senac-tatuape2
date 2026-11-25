package view;

import java.awt.Cursor;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
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
	private JTextField textEstoqueMinimo;
	private JButton btnAdicionarProduto;
	private JTextField textBarcode;
	private JButton btnBuscar;
	private JLabel lblBarcode;
	private JButton btnUpdate;
	private JButton btnDelete;
	private JButton btnLimpar;
	private JButton btnRelatorio;

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
		
		
		textEstoqueMinimo = new JTextField();
		textEstoqueMinimo.setFont(new Font("Arial", Font.BOLD, 12));
		textEstoqueMinimo.setColumns(10);
		textEstoqueMinimo.setBounds(347, 227, 100, 30);
		getContentPane().add(textEstoqueMinimo);
		textEstoqueMinimo.setDocument(new Validador(10, "inteiro"));
		
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
				}else if(textPrecoCusto.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o preço de custo");
					textPrecoCusto.requestFocus();
				}else if(textPrecoVenda.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha a venda");
					textPrecoVenda.requestFocus();
				}else if(textQuantidade.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha a quantidade");
					textQuantidade.requestFocus();
				}else if(textEstoqueMinimo.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o estoque minímo");
					textEstoqueMinimo.requestFocus();
				}else if(textIDFornecedor.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o fornecedor");
					cboFornecedor.requestFocus();
				}else {
					produto.setCodigoBarras(textBarcode.getText());
					produto.setDescricao(textDescricao.getText());
					produto.setCategoria(textCategoria.getText());
					
					//ATENÇÃO! CONVERTER A "," POR "." .REPLACE
					produto.setPrecoCusto(Double.parseDouble(textPrecoCusto.getText().replace(",",".")));
					produto.setPrecoVenda(Double.parseDouble(textPrecoVenda.getText().replace(",",".")));
					produto.setQuatidade(Integer.parseInt(textQuantidade.getText()));
					produto.setEstoqueMinimo(Integer.parseInt(textEstoqueMinimo.getText()));
					produto.setIdFornecedor(Integer.parseInt(textIDFornecedor.getText()));
					
					boolean sucesso = controllerProduto.adicionar(produto);
					if(sucesso == true) {
						JOptionPane.showMessageDialog(null, "Produto adicionado com sucesso!");
						
						limparCampos();
					}else {
						JOptionPane.showMessageDialog(null, "Não foi possível adicionar o produto.\nCódigo de barras duplicado");
						textBarcode.setText(null);
						textBarcode.requestFocus();
					}
					
				}
			}
		});
		//FIM DO BOTÃO ADICIONAR
		btnAdicionarProduto.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnAdicionarProduto.setToolTipText("Adicionar Produto");
		btnAdicionarProduto.setIcon(new ImageIcon(frmProduto.class.getResource("/img/addproduto.jpg")));
		btnAdicionarProduto.setBounds(37, 338, 75, 73);
		getContentPane().add(btnAdicionarProduto);
		
		textBarcode = new JTextField();
		
		//==================================================
		//EVENTO RELACIONADO AO CÓDIGO DE BARRAS - CRUD READ
		//==================================================
		
		textBarcode.addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				//SE A TECLA ENTER FOR PRESSIONADA
				if(e.getKeyCode() == KeyEvent.VK_ENTER) {
					//CAPTURA O CÓDIGO DE BARRAS
					String barcode = textBarcode.getText();
					
					Produto produto = controllerProduto.buscarCodigoBarras(barcode);
					
					//SE EXISTIR UM PRODUTO CADASTRADO
					if(produto != null) {
						textIDProduto.setText(String.valueOf(produto.getIdProduto()));
						textDescricao.setText(produto.getDescricao());
						textCategoria.setText(produto.getCategoria());
						textPrecoCusto.setText(String.valueOf(produto.getPrecoCusto()));
						textPrecoVenda.setText(String.valueOf(produto.getPrecoVenda()));
						textQuantidade.setText(String.valueOf(produto.getQuatidade()));
						textEstoqueMinimo.setText(String.valueOf(produto.getEstoqueMinimo()));
						textIDFornecedor.setText(String.valueOf(produto.getIdFornecedor()));
						
						//LOCALIZAR E SELECIONAR O FORNECEDOR A PARTIR DO ID
						for (int i = 0; i < cboFornecedor.getItemCount(); i++) {
							String item = cboFornecedor.getItemAt(i);
							if(item.startsWith(produto.getIdFornecedor() + " - ")) {
								cboFornecedor.setSelectedIndex(i);
							}
						}
						
						//DESABILITAR O BOTÃO ADICIONAR E HABILITAR EDITAR/DELETAR
						btnAdicionarProduto.setEnabled(false);
						btnUpdate.setEnabled(true);
						btnDelete.setEnabled(true);
					}else{
						int resposta = JOptionPane.showConfirmDialog(null, "Produto não cadastrado.\nDeseja cadastrar este produto?", "Aviso!", JOptionPane.YES_NO_OPTION);
						
						if(resposta == JOptionPane.NO_OPTION) {
							limparCampos();
						}else {
							textDescricao.requestFocus();
						}
					}
				}
			}
		});
		//FIM DO EVENTO
		textBarcode.setFont(new Font("Arial", Font.BOLD, 12));
		textBarcode.setColumns(10);
		textBarcode.setBounds(151, 42, 322, 31);
		getContentPane().add(textBarcode);
		
		//BOTÃO BUSCAR PRODUTO
		btnBuscar = new JButton("");
		
		//EVENTO DO BOTÃO BUSCAR - CRUD READ
		btnBuscar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(textDescricao.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o nome do produto");
					textDescricao.requestFocus();
				}else {
					String descricao = textDescricao.getText();
					
					Produto produto = controllerProduto.buscarProduto(descricao);
					
					//SE EXISTIR UM PRODUTO CADASTRADO
					if(produto != null) {
						textIDProduto.setText(String.valueOf(produto.getIdProduto()));
						textBarcode.setText(produto.getCodigoBarras());
						textDescricao.setText(produto.getDescricao());
						textCategoria.setText(produto.getCategoria());
						textPrecoCusto.setText(String.valueOf(produto.getPrecoCusto()));
						textPrecoVenda.setText(String.valueOf(produto.getPrecoVenda()));
						textQuantidade.setText(String.valueOf(produto.getQuatidade()));
						textEstoqueMinimo.setText(String.valueOf(produto.getEstoqueMinimo()));
						textIDFornecedor.setText(String.valueOf(produto.getIdFornecedor()));
						
						//LOCALIZAR E SELECIONAR O FORNECEDOR A PARTIR DO ID
						for (int i = 0; i < cboFornecedor.getItemCount(); i++) {
							String item = cboFornecedor.getItemAt(i);
							if(item.startsWith(produto.getIdFornecedor() + " - ")) {
								cboFornecedor.setSelectedIndex(i);
							}
						}
						
						//DESABILITAR O BOTÃO ADICIONAR E HABILITAR EDITAR/DELETAR
						btnAdicionarProduto.setEnabled(false);
						btnUpdate.setEnabled(true);
						btnDelete.setEnabled(true);
					}else {
						JOptionPane.showMessageDialog(null, "Produto não cadastrado");
						textDescricao.requestFocus();
					}
				}
			}
		});
		//FIM DO BOTÃO BUSCAR
		btnBuscar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnBuscar.setToolTipText("Buscar Produto");
		btnBuscar.setIcon(new ImageIcon(frmProduto.class.getResource("/img/buscar.jpg")));
		btnBuscar.setBounds(492, 104, 30, 30);
		getContentPane().add(btnBuscar);
		
		lblBarcode = new JLabel("");
		lblBarcode.setIcon(new ImageIcon(frmProduto.class.getResource("/img/scanner.jpg")));
		lblBarcode.setBounds(493, 22, 64, 63);
		getContentPane().add(lblBarcode);
		
		//BOTÃO EDITAR PRODUTO
		btnUpdate = new JButton("");
		
		//EVENTO DO BOTÃO EDITAR
		btnUpdate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//VALIDAÇÕES DOS CAMPOS OBRIGATÓRIOS
				if(textBarcode.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o código de barras");
					textBarcode.requestFocus();
				}else if(textDescricao.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o nome do produto");
					textDescricao.requestFocus();
				}else if(textCategoria.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha a categoria");
					textCategoria.requestFocus();
				}else if(textPrecoCusto.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o preço de custo");
					textPrecoCusto.requestFocus();
				}else if(textPrecoVenda.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha a venda");
					textPrecoVenda.requestFocus();
				}else if(textQuantidade.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha a quantidade");
					textQuantidade.requestFocus();
				}else if(textEstoqueMinimo.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o estoque minímo");
					textEstoqueMinimo.requestFocus();
				}else if(textIDFornecedor.getText().isBlank()) {
					JOptionPane.showMessageDialog(null, "Preencha o fornecedor");
					cboFornecedor.requestFocus();
				}else {
					produto.setIdProduto(Integer.parseInt(textIDProduto.getText()));
					produto.setCodigoBarras(textBarcode.getText());
					produto.setDescricao(textDescricao.getText());
					produto.setCategoria(textCategoria.getText());
					
					//ATENÇÃO! CONVERTER A "," POR "." .REPLACE
					produto.setPrecoCusto(Double.parseDouble(textPrecoCusto.getText().replace(",",".")));
					produto.setPrecoVenda(Double.parseDouble(textPrecoVenda.getText().replace(",",".")));
					produto.setQuatidade(Integer.parseInt(textQuantidade.getText()));
					produto.setEstoqueMinimo(Integer.parseInt(textEstoqueMinimo.getText()));
					produto.setIdFornecedor(Integer.parseInt(textIDFornecedor.getText()));
					
					boolean sucesso = controllerProduto.editar(produto);
					if(sucesso == true) {
						JOptionPane.showMessageDialog(null, "Produto editado com sucesso!");
						limparCampos();
					}else {
						JOptionPane.showMessageDialog(null, "Não foi possível editar o produto.\nCódigo de barras duplicado");
						textBarcode.requestFocus();
					}
				}
			}
		});
		//FIM DO BOTÃO EDITAR
		btnUpdate.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnUpdate.setToolTipText("Editar");
		btnUpdate.setIcon(new ImageIcon(frmProduto.class.getResource("/img/update.jpg")));
		btnUpdate.setBounds(122, 338, 75, 73);
		getContentPane().add(btnUpdate);
		
		//BOTÃO DELETAR PRODUTO
		btnDelete = new JButton("");
		
		//EVENTO DO BOTÃO DELETAR
		btnDelete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int resposta = JOptionPane.showConfirmDialog(null, "Confirma a exclusão deste produto?", "Atenção!", JOptionPane.YES_NO_OPTION);
				
				if(resposta == JOptionPane.YES_OPTION) {
					int idProduto = Integer.parseInt(textIDProduto.getText());
					boolean sucesso = controllerProduto.deletar(idProduto);
					
					if(sucesso == true) {
						JOptionPane.showMessageDialog(null, "Produto excluído com sucesso!");
						limparCampos();
					}else {
						JOptionPane.showMessageDialog(null, "Não foi possível excluir o produto.");
					}
				}
			}
		});
		//FIM DO BOTÃO DELETAR
		btnDelete.setToolTipText("Deletar");
		btnDelete.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnDelete.setIcon(new ImageIcon(frmProduto.class.getResource("/img/excluir.jpg")));
		btnDelete.setBounds(207, 338, 75, 73);
		getContentPane().add(btnDelete);
		
		//BOTÃO LIMPAR CAMPOS
		btnLimpar = new JButton("");
		btnLimpar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				limparCampos();
			}
		});
		btnLimpar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnLimpar.setToolTipText("Limpar campos");
		btnLimpar.setIcon(new ImageIcon(frmProduto.class.getResource("/img/limpar.jpg")));
		btnLimpar.setBounds(292, 338, 75, 73);
		getContentPane().add(btnLimpar);
		
		//BOTÃO RELATÓRIO DE PRODUTOS
		btnRelatorio = new JButton("");
		btnRelatorio.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				controllerProduto.gerarRelatorioProdutos();
			}
		});
		btnRelatorio.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnRelatorio.setToolTipText("Relatório de Produtos");
		btnRelatorio.setIcon(new ImageIcon(frmProduto.class.getResource("/img/pdf.jpg")));
		btnRelatorio.setBounds(377, 338, 75, 73);
		getContentPane().add(btnRelatorio);
		
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
	
	//=================================
	//LIMPAR CAMPOS
	//=================================
	void limparCampos() {
		textIDProduto.setText(null);
		textBarcode.setText(null);
		textDescricao.setText(null);
		textCategoria.setText(null);
		textPrecoCusto.setText(null);
		textPrecoVenda.setText(null);
		textQuantidade.setText(null);
		textEstoqueMinimo.setText(null);
		textIDFornecedor.setText(null);
		cboFornecedor.setSelectedItem("Selecione");
		textBarcode.requestFocus();
		btnAdicionarProduto.setEnabled(true);
		btnUpdate.setEnabled(false);
		btnDelete.setEnabled(false);
	}
}