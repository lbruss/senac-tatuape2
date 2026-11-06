package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
}
