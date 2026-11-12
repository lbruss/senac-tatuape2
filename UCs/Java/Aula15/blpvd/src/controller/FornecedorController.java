package controller;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

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
	
	public void excluir(int idFornecedor) {
		try {
			String sql = """
					delete from fornecedores
					where idFornecedor = ?
					""";
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, idFornecedor);
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//====================================
	//GERAR RELATÓRIO DE FORNECEDORES (PDF)
	//====================================
	public void gerarRelatorioFornecedores() {
		try {
			String sql = """
					select nome, fone, email, site
					from fornecedores
					order by nome
					""";
			Connection con = database.conectar();
			PreparedStatement stmt = con.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			Document documento = new Document(PageSize.A4);
			
			String caminho = "fornecedor.pdf";
			
			PdfWriter.getInstance(documento, new FileOutputStream(caminho));
			
			documento.open();
			
			Font fonteTitulo = new Font(Font.getFamilyIndex("Helvetica"), 16, Font.BOLD);
			
			Paragraph titulo = new Paragraph("RELATÓRIO DE FORNECEDORES", fonteTitulo);
			
			titulo.setAlignment(Element.ALIGN_CENTER);
			documento.add(titulo);
			
			//ADICIONAR DATA E HORA
			DateTimeFormatter formatoDataHora = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
			String dataHora = LocalDateTime.now().format(formatoDataHora);
			Paragraph data = new Paragraph("Data de emissão: " + dataHora);
			data.setAlignment(Element.ALIGN_CENTER);
			documento.add(data);
			//FIM DATA
			
			documento.add(new Paragraph(" "));
			
			//TABELA =================
			PdfPTable tabela = new PdfPTable(4);
			
			tabela.setWidths(new float[] {3.0f, 2.0f, 3.0f, 4.0f});
			
			tabela.setWidthPercentage(100);
			
			//CABEÇALHO DE TABELA
			tabela.addCell("Nome");
			tabela.addCell("Fone");
			tabela.addCell("Email");
			tabela.addCell("Site");
			
			//DADOS DO FORNECEDOR
			int quantidade = 0;
			while (rs.next()) {
				tabela.addCell(rs.getString("Nome"));
				tabela.addCell(rs.getString("Fone"));
				tabela.addCell(rs.getString("Email"));
				tabela.addCell(rs.getString("Site"));
				quantidade++;
			}
			
			documento.add(tabela);
			//FIM DA TABELA==============
			
			documento.add(new Paragraph(" "));
			Font fonteTotal = new Font(Font.getFamilyIndex("Helvetica"), 10, Font.BOLD);
			
			Paragraph total = new Paragraph("Total de fonecedores: " + quantidade, fonteTotal);
			total.setAlignment(Element.ALIGN_RIGHT);
			
			documento.add(total);
			documento.close();
			
			rs.close();
			stmt.close();
			con.close();
			
			//ABRIR O PDF AUTOMATICAMENTE
			File arquivo = new File(caminho);
			Desktop.getDesktop().open(arquivo);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	} 
	
}
