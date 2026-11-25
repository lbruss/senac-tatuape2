package controller;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import database.Database;
import model.Produto;

public class ProdutoController {
	Database database = new Database();
	
	//===============================
	//ADICIONAR PRODUTO - CRUD CREATE
	//===============================
	public boolean adicionar(Produto produto) {
		try {
			String sql = """
					insert into produtos(codigoBarras, descricao, categoria, precoCusto, precoVenda, quantidade, estoqueMinimo, IdFornecedor)
					values(?,?,?,?,?,?,?,?)
					""";
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//VERIFICAR SE O CÓDIGO DE BARRAS ESTÁ VAZIO
			if(produto.getCodigoBarras().isBlank()) {
				stmt.setNull(1, java.sql.Types.VARCHAR);
			}else {
				stmt.setString(1, produto.getCodigoBarras());
			}
			
			stmt.setString(2, produto.getDescricao());
			stmt.setString(3, produto.getCategoria());
			stmt.setDouble(4, produto.getPrecoCusto());
			stmt.setDouble(5, produto.getPrecoVenda());
			stmt.setInt(6, produto.getQuatidade());
			stmt.setInt(7, produto.getEstoqueMinimo());
			stmt.setInt(8, produto.getIdFornecedor());
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			return true; //PRODUTO INSERIDO COM SUCESSO
			
		} catch (Exception e) {
			System.out.println("Erro ao adicionar o produto: " + e);
			return false;
		}
	}//FIM CRUD CREATE
	
	//=================================================
	//BUSCAR PRODUTO PELO CÓDIGO DE BARRAS - CRUD READ
	//=================================================
	public Produto buscarCodigoBarras(String codigoBarras) {
		try {
			String sql = """
					select idProduto, descricao, categoria, precoCusto, precoVenda, quantidade, estoqueMinimo, idFornecedor
					from produtos
					where codigoBarras = ?
					""";
			
			Produto produto = null;
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, codigoBarras);
			
			ResultSet rs = stmt.executeQuery();
			
			//SE EXISTIR UM PRODUTO CADASTRADO
			if(rs.next()) {
				produto = new Produto();
				produto.setIdProduto(rs.getInt("idProduto"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setCategoria(rs.getString("categoria"));
				produto.setPrecoCusto(rs.getDouble("precoCusto"));
				produto.setPrecoVenda(rs.getDouble("precoVenda"));
				produto.setQuatidade(rs.getInt("quantidade"));
				produto.setEstoqueMinimo(rs.getInt("estoqueMinimo"));
				produto.setIdFornecedor(rs.getInt("idFornecedor"));
			}
			
			rs.close();
			stmt.close();
			con.close();
			
			return produto;
				
		} catch (Exception e) {
			System.out.println("Erro ao buscar o produto: " + e);
			return null;
		}
	}//FIM CRUD READ
	
	//===========================================
	//BUSCAR PRODUTO PELA DESCRIÇÃO - CRUD READ
	//===========================================
	public Produto buscarProduto(String descricao) {
		try {
			String sql = """
					select idProduto, codigoBarras, descricao, categoria, precoCusto, precoVenda, quantidade, estoqueMinimo, idFornecedor
					from produtos
					where descricao = ?
					""";
			
			Produto produto = null;
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, descricao);
			
			ResultSet rs = stmt.executeQuery();
			
			//SE EXISTIR UM PRODUTO CADASTRADO
			if(rs.next()) {
				produto = new Produto();
				produto.setIdProduto(rs.getInt("idProduto"));
				produto.setCodigoBarras(rs.getString("codigoBarras"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setCategoria(rs.getString("categoria"));
				produto.setPrecoCusto(rs.getDouble("precoCusto"));
				produto.setPrecoVenda(rs.getDouble("precoVenda"));
				produto.setQuatidade(rs.getInt("quantidade"));
				produto.setEstoqueMinimo(rs.getInt("estoqueMinimo"));
				produto.setIdFornecedor(rs.getInt("idFornecedor"));
			}
			
			rs.close();
			stmt.close();
			con.close();
			
			return produto;
				
		} catch (Exception e) {
			System.out.println("Erro ao buscar o produto: " + e);
			return null;
		}
	}//FIM CRUD READ
	
	//===============================
	//EDITAR PRODUTO - CRUD UPDATE
	//===============================
	public boolean editar(Produto produto) {
		try {
			String sql = """
					update produtos
					set codigoBarras = ?, descricao = ?, categoria = ?, precoCusto = ?, precoVenda = ?, quantidade = ?, estoqueMinimo = ?, idFornecedor = ?
					where idProduto = ?
					""";
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//VERIFICAR SE O CÓDIGO DE BARRAS ESTÁ VAZIO
			if(produto.getCodigoBarras().isBlank()) {
				stmt.setNull(1, java.sql.Types.VARCHAR);
			}else {
				stmt.setString(1, produto.getCodigoBarras());
			}
			
			stmt.setString(2, produto.getDescricao());
			stmt.setString(3, produto.getCategoria());
			stmt.setDouble(4, produto.getPrecoCusto());
			stmt.setDouble(5, produto.getPrecoVenda());
			stmt.setInt(6, produto.getQuatidade());
			stmt.setInt(7, produto.getEstoqueMinimo());
			stmt.setInt(8, produto.getIdFornecedor());
			stmt.setInt(9, produto.getIdProduto());
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			return true; //PRODUTO EDITADO COM SUCESSO
			
		} catch (Exception e) {
			System.out.println("Erro ao editar o produto: " + e);
			return false;
		}
	}//FIM CRUD UPDATE
	
	//===============================
	//DELETAR PRODUTO - CRUD DELETE
	//===============================
	public boolean deletar(int idProduto) {
		try {
			String sql = """
					delete from produtos
					where idProduto = ?
					""";
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, idProduto);
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			return true; //PRODUTO EXCLUÍDO COM SUCESSO
			
		} catch (Exception e) {
			System.out.println("Erro ao deletar o produto: " + e);
			return false;
		}
	}//FIM CRUD DELETE
	
	//====================================
	//GERAR RELATÓRIO DE PRODUTOS - PDF
	//====================================
	public void gerarRelatorioProdutos() {
		Document document = new Document();
		try {
			//CRIAR O ARQUIVO PDF
			PdfWriter.getInstance(document, new FileOutputStream("produtos.pdf"));
			document.open();
			
			//TÍTULO CENTRALIZADO E EM NEGRITO
			Font fonteTitulo = new Font(Font.HELVETICA, 16, Font.BOLD);
			Paragraph titulo = new Paragraph("RELATÓRIO DE PRODUTOS", fonteTitulo);
			titulo.setAlignment(Element.ALIGN_CENTER);
			document.add(titulo);
			
			//DATA E HORA DE EMISSÃO CENTRALIZADA
			SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			Paragraph dataEmissao = new Paragraph("Data de emissão: " + formatador.format(new Date()));
			dataEmissao.setAlignment(Element.ALIGN_CENTER);
			document.add(dataEmissao);
			
			//ESPAÇO ANTES DA TABELA
			document.add(new Paragraph(" "));
			
			//CRIAR TABELA (4 COLUNAS)
			PdfPTable tabela = new PdfPTable(4);
			tabela.setWidthPercentage(100);
			
			//CABEÇALHO DA TABELA
			PdfPCell col1 = new PdfPCell(new Paragraph("Produto"));
			PdfPCell col2 = new PdfPCell(new Paragraph("Categoria"));
			PdfPCell col3 = new PdfPCell(new Paragraph("Preço Venda"));
			PdfPCell col4 = new PdfPCell(new Paragraph("Quantidade"));
			
			tabela.addCell(col1);
			tabela.addCell(col2);
			tabela.addCell(col3);
			tabela.addCell(col4);
			
			//CONSULTA AO BANCO DE DADOS
			String sql = """
					select descricao, categoria, precoVenda, quantidade
					from produtos
					order by descricao
					""";
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			int total = 0;
			
			while(rs.next()) {
				tabela.addCell(rs.getString("descricao"));
				tabela.addCell(rs.getString("categoria"));
				tabela.addCell(rs.getString("precoVenda"));
				tabela.addCell(rs.getString("quantidade"));
				total++;
			}
			
			document.add(tabela);
			
			//ESPAÇO APÓS A TABELA
			document.add(new Paragraph(" "));
			
			//TOTAL DE PRODUTOS ALINHADO À DIREITA
			Font fonteTotal = new Font(Font.HELVETICA, 12, Font.BOLD);
			Paragraph rodape = new Paragraph("Total de produtos: " + total, fonteTotal);
			rodape.setAlignment(Element.ALIGN_RIGHT);
			document.add(rodape);
			
			rs.close();
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println("Erro ao gerar relatório: " + e);
		} finally {
			document.close();
		}
		
		//ABRIR O PDF NO LEITOR PADRÃO DO SISTEMA
		try {
			Desktop.getDesktop().open(new File("produtos.pdf"));
		} catch (Exception e) {
			System.out.println("Erro ao abrir o relatório: " + e);
		}
	}//FIM GERAR RELATÓRIO
}