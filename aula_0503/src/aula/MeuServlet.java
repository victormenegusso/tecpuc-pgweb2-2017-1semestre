package aula;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/meuservlet")
public class MeuServlet extends HttpServlet{

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
		
		// escrevendo o html para o usuario
		PrintWriter out = response.getWriter();
		
		out.println("<h1>"+nome+"</h1>");
		
	}
	
}




