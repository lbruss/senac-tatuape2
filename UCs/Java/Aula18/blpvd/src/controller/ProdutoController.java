package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	//BUSCAR PRODUTO - CRUD READ
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
}