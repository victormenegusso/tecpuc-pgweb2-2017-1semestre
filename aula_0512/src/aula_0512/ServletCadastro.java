package aula_0512;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// URL de acesso ao servlet
@WebServlet("/cadastrarpessoa") 
// Informando que o formulario recebido 
// vai ser multipart
@MultipartConfig
public class ServletCadastro extends HttpServlet{

	
	// trata a requisição 
	@Override
	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		String nome;
		String cpf;
		Part foto;
		
		// pegar os dados do formulario //
		cpf = request.getParameter("cpf");
		nome = request.getParameter("nome");
		foto = request.getPart("foto");
		
		// verificar os dados (imprimir no console)
		System.out.println(cpf);
		System.out.println(nome);
		System.out.println(foto.getSubmittedFileName());
		
		// Salvar imagem
		//String diretorio = "C:/TEMP/img/"; windows
		String diretorio = "/tmp/img/";
		String arquivo_nome = UUID.randomUUID().toString();
		foto.write(diretorio+arquivo_nome);
		
		
		// salvar no banco //
		try{
			String usr = "root";
			String pass = "admin";
			String url = "jdbc:mysql://localhost:3306/aula";

			Class.forName("com.mysql.jdbc.Driver"); // apenas no tomcat
			Connection con;
			con = DriverManager.getConnection(url, usr, pass);
			
			String sql;
			sql= "insert into pessoas (cpf,nome,arquivo_foto) values (?,?,?)";
			
			PreparedStatement ps;
			ps = con.prepareStatement(sql);
			
			ps.setString(1, cpf);
			ps.setString(2, nome);
			ps.setString(3, arquivo_nome);
			
			ps.executeUpdate();
			
			con.close();
			
		}catch (Exception e) {
			System.out.println("deu erro");
		}
		
		PrintWriter out = response.getWriter();
		out.print("Cadastrado com sucesso");
		
	}
}
