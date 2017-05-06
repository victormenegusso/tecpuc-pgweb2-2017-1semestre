package aula;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/meuservlet3")
public class MeuServlet3 extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		// obtendo parametro
		String nome;
		nome = request.getParameter("nome");
		
		System.out.println( nome );
		
		inserir(nome);
		
		// depois de processar
		// retornamos a pagina f2.jsp
		request.setAttribute("nome", nome);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("f3.jsp");
		rd.forward(request, response);
	}
	
	private void inserir(String nome){
		
		String usr = "root";
		String senha = "admin";
		String url = "jdbc:mysql://localhost:3306/aula";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con;
			con = DriverManager.
					getConnection(url, usr, senha);
			
			String sql;
			sql = "insert into pessoas (nome) values (?)";
			
			PreparedStatement ps;
			ps = con.prepareStatement(sql);
			ps.setString(1, nome);
			ps.executeUpdate();
			
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}




