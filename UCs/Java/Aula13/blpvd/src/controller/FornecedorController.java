package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.Database;
import model.Fornecedor;

//SERÁ A CLASSE UTILIZADA PARA FAZER O CRUD
public class FornecedorController {
	//OBJETO DATABASE - ACESSO AO BANCO DE DADOS
	Database database = new Database();
	
	//MÉTODOS (FUNÇÃO) CRUD
	
	//======================
	//ADICIONAR FORNECEDORES
	//======================
	public void Adicionar(Fornecedor fornecedor) {
		try {
			String sql = """
					insert into fornecedores (nome, fone, email, site) values (?,?,?,?)""";
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//1, 2, 3, 4 = (?, ?, ?, ?)
			stmt.setString(1, fornecedor.getNome());
			stmt.setString(2, fornecedor.getFone());
			stmt.setString(3, fornecedor.getEmail());
			stmt.setString(4, fornecedor.getSite());
			
			stmt.executeUpdate();
			
			//FECHAR A CONEXÃO COM O BANCO
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println(2);
		}
	}
	
	//===============================
	//BUSCAR FORNECEDORES - CRUD READ
	//===============================
	public Fornecedor buscar(String nome) {
		try {
			String sql = """
					select idFornecedor, nome, fone, email, site
					from fornecedores
					where nome like ?
					""";
			Fornecedor fornecedor = null;
			
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, "%" + nome + "%");
			
			ResultSet rs = stmt.executeQuery();
			
			//SE EXISTIR UM FORNECEDOR COM O NOME PESQUISADO
			if(rs.next()) {
				fornecedor = new Fornecedor();
				fornecedor.setIdFornecedor(rs.getInt("idFornecedor"));
				fornecedor.setNome(rs.getString("Nome"));
				fornecedor.setFone(rs.getString("Fone"));
				fornecedor.setEmail(rs.getString("Email"));
				fornecedor.setSite(rs.getString("Site"));
			}
			
			//FECHAR AS CONEXÕES
			rs.close();
			stmt.close();
			con.close();
			
			return fornecedor;
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	//====================================
	//CRUD UPDATE -  EDITAR FORNECEDORES
	//====================================
	public void editarFornecedor(Fornecedor fornecedor) {
		try {
			String sql = """
					update fornecedores
					set nome = ?, fone = ?, email = ?, site = ?
					where idFornecedor = ?
					""";
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//OBTER OS DADOS DO FORNECEDOR (MODEL)
			stmt.setString(1, fornecedor.getNome());
			stmt.setString(2, fornecedor.getFone());
			stmt.setString(3, fornecedor.getEmail());
			stmt.setString(4, fornecedor.getSite());
			stmt.setInt(5, fornecedor.getIdFornecedor());
			
			//EXECUTA A ATUALIZAÇÃO NO BANCO
			stmt.executeUpdate();
			
			//ENCERRA AS CONEXÕES
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}	
	}
	
}
